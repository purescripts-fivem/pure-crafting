function Queue:claimCraft(id, index, source)
    local index = index + 1
    local item = self.finished[index]
    if not item then
        debugPrint('Queue:claimCraft | failed - no item', index, json.encode(self.finished))
        return
    end
    local itemData = getItemFromId(tostring(id), self.type)
    if not itemData then
        debugPrint('Queue:claimCraft | failed - no itemData', id, json.encode(CraftableItems))
        return
    end
    giveItem(source, itemData.itemName, 1)
    table.remove(self.finished, index)
    self:triggerEvent('pure-crafting:updateFinished', self.finished)
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET finished = ? WHERE id = ?', {
        json.encode(self.finished), self.benchId
    })
    debugPrint('Queue:claimCraft | ', json.encode(item), json.encode(self.finished))
    local items = generateItems(source, self.benchId, self.type)
    TriggerClientEvent('pure-crafting:updateItems', source, items)
    return true
end

function Queue:cancelCraft(id, index, source)
    local index = index + 1
    local item = self.items[index]
    if not item then
        debugPrint('Queue:cancelCraft | failed - no item', index, json.encode(self.items))
        return
    end
    local itemData = getItemFromId(tostring(id), self.type)
    if not itemData then
        debugPrint('Queue:cancelCraft | failed - no itemData', id, json.encode(Config.items[self.type]))
        return
    end
    for i = 1, #itemData.requiredItems do 
        local requiredItem = itemData.requiredItems[i]
        giveItem(source, requiredItem.itemName, requiredItem.amount)
    end
    table.remove(self.items, index)
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET queue = ? WHERE id = ?', {
        json.encode(self.items), self.benchId
    })
    self:triggerEvent('pure-crafting:updateQueue', self.items)
    local items = generateItems(source, self.benchId, self.type)
    TriggerClientEvent('pure-crafting:updateItems', source, items)
    debugPrint('Queue:cancelCraft | ', json.encode(item), json.encode(self.items))
    if itemData.blueprintId and not Config.unlimitedBlueprints then
        self:useBlueprint(source, itemData.blueprintId)
    end
    return true
end