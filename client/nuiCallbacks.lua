RegisterNUICallback('getConfig', function(_, cb)
    debugPrint('getConfig')
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
    debugPrint('Hide NUI frame')
    cb({})
end)

RegisterNUICallback('attemptCraft', function(data, cb)
    debugPrint('RegisterNUICallback | attemptCraft', json.encode(data))
end)

RegisterNUICallback('queueCraft', function(data, cb)
    debugPrint('RegisterNUICallback | queueCraft', json.encode(data))
    local result = lib.callback.await('pure-crafting:queueCraft', data)
end)

RegisterNUICallback('craftFinished', function(data, cb)
    debugPrint('RegisterNUICallback | craftFinished', json.encode(data))
end)