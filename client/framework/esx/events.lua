if Config.framework ~= 'esx' then return end

RegisterNetEvent('esx:playerLoaded', function()
    TriggerServerEvent('pure-crafting:playerLoaded')
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    TriggerServerEvent('pure-crafting:playerUnloaded')
end)