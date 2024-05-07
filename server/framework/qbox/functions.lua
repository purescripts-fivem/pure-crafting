if Config.framework ~= 'qbox' then return end

function getPlayerUniqueId(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end
    if not player.PlayerData.citizenid then return end
    debugPrint('getPlayerUniqueId', player.PlayerData.citizenid)
    return player.PlayerData.citizenid
end