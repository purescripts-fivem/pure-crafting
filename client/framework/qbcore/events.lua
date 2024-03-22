if Config.framework ~= 'qbcore' then return end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local src = source
    TriggerServerEvent('pure-crafting:playerLoaded')
end)
