if Config.framework ~= 'esx' then return end

ESX = exports['es_extended']:getSharedObject()

function getPlayerUniqueId(source)
    local player = ESX.GetPlayerFromId(source)
    if not player then return end
    if not player.identifier then return end
    debugPrint('getPlayerUniqueId', Player.identifier)
    return player.identifier
end