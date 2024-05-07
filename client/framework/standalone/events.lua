if Config.framework ~= 'standalone' then return end

-- onPlayerLoad event here
RegisterNetEvent('', function()
    TriggerServerEvent('pure-crafting:playerLoaded')
end)

-- onPlayerUnload event here
RegisterNetEvent('', function()
    TriggerServerEvent('pure-crafting:playerUnloaded')
end)