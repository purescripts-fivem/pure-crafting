function Queue:claimCraft(id, index)
    local index = index + 1
    local item = self.finished[index]
    if not item then
        debugPrint('Queue:claimCraft | failed - no item', index, json.encode(self.finished))
        return
    end
    local itemData = nil
    for i = 1, #Config.items do
        if Config.items[i].id == id then
            itemData = Config.items[i]
            break
        end
    end
    if not itemData then
        debugPrint('Queue:claimCraft | failed - no itemData', id, json.encode(Config.items))
        return
    end
    giveItem(self.source, itemData.name, itemData.amount)
    table.remove(self.finished, index)
    self:triggerEvent('pure-crafting:updateFinished', self.finished)
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET finished = ? WHERE id = ?', {
        json.encode(self.finished), self.benchId
    })
    debugPrint('Queue:claimCraft | ', json.encode(item), json.encode(self.finished))
    return true
end

function Queue:cancelCraft(id, index)
    local index = index + 1
    local item = self.items[index]
    if not item then
        debugPrint('Queue:cancelCraft | failed - no item', index, json.encode(self.items))
        return
    end
    local itemData = nil
    for i = 1, #Config.items do
        if Config.items[i].id == id then
            itemData = Config.items[i]
            break
        end
    end
    if not itemData then
        debugPrint('Queue:cancelCraft | failed - no itemData', id, json.encode(Config.items))
        return
    end
    -- Give them back their items
    print('Item removed from queue', json.encode(itemData))
    table.remove(self.items, index)
    -- TriggerClientEvent('pure-crafting:updateQueue', self.source, self.items)
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET queue = ? WHERE id = ?', {
        json.encode(self.items), self.benchId
    })
    self:triggerEvent('pure-crafting:updateQueue', self.items)
    debugPrint('Queue:cancelCraft | ', json.encode(item), json.encode(self.items))
    return true
end