if Config.framework ~= 'qbcore' then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('pure-crafting:playerLoaded')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('pure-crafting:playerUnloaded')
end)

function getPlayerUniqueId()
    local citizenid = QBCore.Functions.GetPlayerData().citizenid
    return citizenid
end