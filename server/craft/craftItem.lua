function Queue:craftItem(amount, item, source)
    local canCraftItem = canCraftItem(source, item, amount)
    if not canCraftItem then return end
    local items = generateItems(source, self.benchId, self.type)
    TriggerClientEvent('pure-crafting:updateItems', source, items)
    for i = 1, amount do 
        newItem = {
            itemName = item.itemName,
            image = item.image,
            secondsLeft = item.craftingTime,
            timeStarted = os.time(),
            timeToCraft = item.craftingTime,
            id = item.id
        }
        self.items[#self.items + 1] = newItem
        self:triggerEvent('pure-crafting:addToQueue', newItem)
    end
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET queue = ? WHERE id = ?', {
        json.encode(self.items), self.benchId
    })
    debugPrint('Queue:add | ', json.encode(item), json.encode(self.items))
    self:triggerEvent('pure-crafting:updateQueue', self.items)
    if item.blueprintId and not Config.unlimitedBlueprints then
        self:removeBlueprint(source, item.blueprintId)
    end
    return true
end

function canCraftItem(source, item, amount)
    local requiredItems = item.requiredItems
    if not checkItems(source, requiredItems, amount) then 
        notifySystem(source, {
            title = _Lang('notEnough.title'),
            description = _Lang('notEnough.message'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return 
    end
    if not removeItems(source, requiredItems, amount) then 
        notifySystem(source, {
            title = _Lang('notEnough.title'),
            description = _Lang('notEnough.message'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return 
    end
    return true
end

function checkItems(source, items, amount)
    if not items or #items == 0 then return end
    for i = 1, #items do
        local item = items[i]
        if not checkItem(source, item.itemName, item.amount * amount) then 
            return
        end
    end
    return true
end

function removeItems(source, items, amount)
    if not items or #items == 0 then return end
    for i = 1, #items do 
        local item = items[i]
        if not removeItem(source, item.itemName, item.amount * amount) then 
            return
        end
    end
    return true
end