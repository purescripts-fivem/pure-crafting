if Config.framework ~= 'esx' then return end

ESX = exports['es_extended']:getSharedObject()

function getPlayerUniqueId(source)
    local player = ESX.GetPlayerFromId(source)
    if not player then return end
    if not player.identifier then return end
    debugPrint('getPlayerUniqueId', player.identifier)
    return player.identifier
end