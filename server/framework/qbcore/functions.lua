if Config.framework ~= 'qbcore' then return end

QBCore = exports['qb-core']:GetCoreObject()

function getPlayerUniqueId(source)
    local player = QBCore.Functions.GetPlayer(source)
    if not player then return end
    return player.PlayerData.citizenid
end