function User:addFave(itemName, category)
    self.faves[#self.faves + 1] = {itemName = itemName, oldCategory = category}
    local affectedRows = MySQL.update.await('UPDATE crafting_users SET faves = ? WHERE uniqueId = ?', {
        json.encode(self.faves), self.uniqueId
    })
    notifySystem(self.source, {
        title = _Lang('faves.add'),
        type = 'success',
        position = Config.libText.notfiyPoistion,
    })

    local userItems = PlayerItems[tostring(self.source)]
    for i = 1, #userItems do
        if userItems[i].itemName == itemName then
            userItems[i].category = 'fave'
        end
    end
    TriggerClientEvent('pure-crafting:updateItems', self.source, userItems)
end

function User:removeFave(itemName)
    local userItems = PlayerItems[tostring(self.source)]
    for i = 1, #self.faves do
        if self.faves[i].itemName == itemName then
            local oldCategory = self.faves[i].oldCategory
            for i = 1, #userItems do
                if userItems[i].itemName == itemName then
                    userItems[i].category = oldCategory
                end
            end
            TriggerClientEvent('pure-crafting:updateItems', self.source, userItems)
            table.remove(self.faves, i)
            local affectedRows = MySQL.update.await('UPDATE crafting_users SET faves = ? WHERE uniqueId = ?', {
                json.encode(self.faves), self.uniqueId
            })
            notifySystem(self.source, {
                title = _Lang('faves.remove'),
                type = 'success',
                position = Config.libText.notfiyPoistion,
            })
            return
        end
    end
end

function User:checkFave(itemName)
    for i = 1, #self.faves do
        if self.faves[i].itemName == itemName then
            return true
        end
    end
    return false
end

function createUserSetFave(source, itemName, category)
    local uniqueId = getPlayerUniqueId(source)
    local id = MySQL.insert.await('INSERT INTO `crafting_users` (uniqueId) VALUES (?)', {
        uniqueId
    })
    local user = User:new(source)
    Players[tostring(source)] = user
    Wait(150)
    user:addFave(itemName, category)
end