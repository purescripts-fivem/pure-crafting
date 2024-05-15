RegisterNUICallback('getConfig', function(_, cb)
    debugPrint('getConfig')
    if not Config.enableFavourites then
        Config.categories[1] = nil
    end
    cb(Config)
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
    TriggerScreenblurFadeOut(250)
    debugPrint('Hide NUI frame')
    cb({})
end)

RegisterNUICallback('attemptCraft', function(data, cb)
    debugPrint('RegisterNUICallback | attemptCraft', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    TriggerServerEvent('pure-crafting:attemptCraft', benchId, data)
end)

RegisterNUICallback('craftFinished', function(data, cb)
    debugPrint('RegisterNUICallback | craftFinished', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    TriggerServerEvent('pure-crafting:craftFinished', benchId, data)
end)

RegisterNUICallback('claimCraft', function(data, cb)
    debugPrint('RegisterNUICallback | claimCraft', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    TriggerServerEvent('pure-crafting:claimCraft', benchId, data)
end)

RegisterNUICallback('cancelCraft', function(data, cb)
    debugPrint('RegisterNUICallback | cancelCraft', json.encode(data))
    if not currentZone then return end
    local benchId = currentZone.benchId
    TriggerServerEvent('pure-crafting:cancelCraft', benchId, data)
end)

RegisterNUICallback('notEnoughItems', function()
    debugPrint('RegisterNUICallback | notEnoughItems')
    notifySystem({
        title = _Lang('notEnough.title'),
        type = 'error',
        position = Config.libText.notfiyPoistion,
    })
end)

RegisterNUICallback('setFavourite', function(data)
    TriggerServerEvent('pure-crafting:setFavourite', data)
end)