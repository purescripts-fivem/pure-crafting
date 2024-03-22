function Queue:finishedCraft(craftedItem)
    local item = self.items[1]
    if item.name ~= craftedItem.name then
        debugPrint('Queue:finishedCraft | failed - item names dont match', json.encode(item), json.encode(craftedItem))
        return
    end
    table.remove(self.items, 1)
    self.finished[#self.finished + 1] = item
    if self.items[1] then
        self.items[1].timeStarted = os.time()
    end
    debugPrint('Queue:finishedCraft | ', json.encode(item), json.encode(self.items), json.encode(self.finished))
    local affectedRows = MySQL.update.await('UPDATE crafting_benches SET queue = ?, finished = ? WHERE id = ?', {
        json.encode(self.items), json.encode(self.finished), self.benchId
    })
    self:triggerEvent('pure-crafting:finishedCraft', self.items, self.finished)
    return true
end

function Queue:add(item, amount)
    for i = 1, amount do 
        newItem = {
            itemName = item.name,
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
    return true
end