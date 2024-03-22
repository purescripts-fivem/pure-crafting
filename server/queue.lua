Queue = {}
ActiveBenches = {}

--[[
    for faves:
    link it to the user and force the favourites to constantly be on there unless disabled in the config
    check that the faves align with the items on the crafting bench to show these properly
--]]

function Queue:new(benchId, queue, finished)
    local data = {
        benchId = benchId,
        activeMembers = {},
        items = json.decode(queue),
        finished = json.decode(finished),
    }

    debugPrint('Queue:new | ', json.encode(data))
    return setmetatable(data, {__index = Queue})
end

function initQueue(benchId, queue, finished)
    local bench = Queue:new(benchId, queue, finished)
    ActiveBenches[tostring(benchId)] = bench
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
    while true do 
        for k,v in pairs(ActiveBenches) do
            local user = ActiveBenches[k]
            if not user.items[1] then 
                goto continue
            end
            local item = user.items[1]
            item.secondsLeft = item.secondsLeft - 1
            user:triggerEvent('pure-crafting:secondChange', user.items[1].secondsLeft)
            if item.secondsLeft <= 0 then
                user:finishedCraft(item)
            end
            ::continue::
        end
        Wait(1000)
    end
end)