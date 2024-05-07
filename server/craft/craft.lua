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