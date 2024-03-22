RegisterNUICallback('getConfig', function(_, cb)
    debugPrint('getConfig')
    cb(Config)
end)

RegisterNUICallback('getSettings', function(_, cb)
    debugPrint('getSettings')
    cb({
        items = Config.items,
        categories = Config.categories,
    })
end)

RegisterNUICallback('getLanguage', function(_, cb)
    local lang = Config.language
    if not Language[lang] then
        lang = 'en'
    end
    debugPrint('getLanguage', lang)
    cb(Language[lang].nui)
end)

RegisterNUICallback('hideFrame', function(_, cb)
    toggleNuiFrame(false)
    debugPrint('Hide NUI frame')
    cb({})
end)

RegisterNUICallback('attemptCraft', function(data, cb)
    debugPrint('RegisterNUICallback | attemptCraft', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    local result = lib.callback.await('pure-crafting:attemptCraft', false, data, benchId)
    local items = lib.callback.await('pure-crafting:getItems', false)
    SendReactMessage('itemsChange', items)
end)

RegisterNUICallback('craftFinished', function(data, cb)
    debugPrint('RegisterNUICallback | craftFinished', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    local result = lib.callback.await('pure-crafting:craftFinished', false, data, benchId)
end)

RegisterNUICallback('claimCraft', function(data, cb)
    debugPrint('RegisterNUICallback | claimCraft', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    local result = lib.callback.await('pure-crafting:claimCraft', false, data, benchId)
    local items = lib.callback.await('pure-crafting:getItems', false)
    SendReactMessage('itemsChange', items)
end)

RegisterNUICallback('cancelCraft', function(data, cb)
    debugPrint('RegisterNUICallback | cancelCraft', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    local result = lib.callback.await('pure-crafting:cancelCraft', false, data, benchId)
    local items = lib.callback.await('pure-crafting:getItems', false)
    SendReactMessage('itemsChange', items)
end)

RegisterNUICallback('notEnoughItems', function()
    debugPrint('RegisterNUICallback | notEnoughItems')
    notifySystem({
        title = _Lang('notEnough.title'),
        type = 'error',
        position = Config.libText.notfiyPoistion,
    })
end)