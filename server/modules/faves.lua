function User:addFave(itemName)
    self.faves[itemName] = true
    local affectedRows = MySQL.update.await('UPDATE crafting_users SET faves = ? WHERE uniqueId = ?', {
        json.encode(self.faves), self.uniqueId
    })
    notifySystem(self.source, {
        title = _Lang('faves.add'),
        type = 'success',
        position = Config.libText.notfiyPoistion,
    })
    TriggerClientEvent('pure-crafting:setFaves', self.source, self.faves)
end

function User:removeFave(itemName)
    self.faves[itemName] = nil
    local affectedRows = MySQL.update.await('UPDATE crafting_users SET faves = ? WHERE uniqueId = ?', {
        json.encode(self.faves), self.uniqueId
    })
    notifySystem(self.source, {
        title = _Lang('faves.remove'),
        type = 'success',
        position = Config.libText.notfiyPoistion,
    })
    TriggerClientEvent('pure-crafting:setFaves', self.source, self.faves)
end

function User:checkFave(itemName)
    if self.faves[itemName] then
        return true
    end
    return
end

function createUserSetFave(source, itemName)
    local uniqueId = getPlayerUniqueId(source)
    local id = MySQL.insert.await('INSERT INTO `crafting_users` (uniqueId) VALUES (?)', {
        uniqueId
    })
    local user = User:new(source)
    Players[tostring(source)] = user
    Wait(150)
    user:addFave(itemName)
end