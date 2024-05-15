function Queue:useBlueprint(source, name)
    local canUseBlueprintOnBench = canUseBlueprint(self.type, name)
    if not canUseBlueprintOnBench then
        notifySystem(source, {
            title = _Lang('blueprints.cantUse'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return
    end
    for i = 1, #self.blueprints do
        if self.blueprints[i] == name then
            notifySystem(source, {
                title = _Lang('blueprints.alreadyUsed'),
                type = 'error',
                position = Config.libText.notfiyPoistion,
            })
            return
        end
    end
    self.blueprints[#self.blueprints + 1] = name
    self.bpHash[name] = true
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET blueprints = ? WHERE id = ?', {
        json.encode(self.blueprints), self.benchId
    })
    self:triggerEvent('pure-crafting:generateItems', self.benchId)
    notifySystem(source, {
        title = _Lang('blueprints.added'),
        type = 'success',
        position = Config.libText.notfiyPoistion,
    })
    removeItem(source, name, 1)
    debugPrint('Queue:useBlueprint | ', json.encode(self.blueprints))
end

function Queue:removeBlueprint(source, name)
    for i = 1, #self.blueprints do
        if self.blueprints[i] == name then
            table.remove(self.blueprints, i)
            self.bpHash[name] = nil
            local affectedRows = MySQL.update.await('UPDATE crafting_benches SET blueprints = ? WHERE id = ?', {
                json.encode(self.blueprints), self.benchId
            })
            self:triggerEvent('pure-crafting:generateItems', self.benchId)
            debugPrint('Queue:removeBlueprint | ', json.encode(self.blueprints))
            return
        end
    end
    return
end

function Queue:triggerEvent(eventName, ...)
    for i = 1, #self.activeMembers do
        debugPrint('Queue:triggerEvent | Triggering event: ', eventName, self.activeMembers[i], ...)
        TriggerClientEvent(eventName, self.activeMembers[i], ...)
    end
end

function Queue:removePlayer(source)
    for i = 1, #self.activeMembers do
        if self.activeMembers[i] == source then
            table.remove(self.activeMembers, i)
            break
        end
    end
    debugPrint('Queue:removePlayer | benchId: ', self.benchId, ' | sources online: ', json.encode(self.activeMembers))
end

function Queue:addPlayer(source)
    self.activeMembers[#self.activeMembers + 1] = source
    debugPrint('Queue:addPlayer | benchId: ', self.benchId, ' | sources online: ', json.encode(self.activeMembers))
end

CreateThread(function()
    createItems()
    while true do 
        for k,v in pairs(ActiveBenches) do
            local bench = ActiveBenches[k]
            if not bench.items[1] then 
                goto continue
            end
            local item = bench.items[1]
            item.secondsLeft = item.secondsLeft - 1
            bench:triggerEvent('pure-crafting:secondChange', bench.items[1].secondsLeft)
            if item.secondsLeft <= 0 then
                bench:finishedCraft(item)
            end
            ::continue::
        end
        Wait(1000)
    end
end)

function createItems()
    for i = 1, #Config.blueprints.items do 
        createItem(Config.blueprints.items[i], 'pure-crafting:useBlueprint', Config.blueprints.items[i])
    end

    for i = 1, #Config.benchItems do
        createItem(Config.benchItems[i].itemName, 'pure-crafting:beforeBenches', Config.benchItems[i].type)
    end
end