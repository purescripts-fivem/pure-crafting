if Config.targetingOptions.target ~= 'qb' then return end

function addTargetToCoords(coords, boxSize, table, name)
    exports['qb-target']:AddBoxZone(name, coords, boxSize.x, boxSize.y, {
        name = name,
        debugPoly = Config.debug,
        minZ = coords.z - 2,
        maxZ = coords.z + 2,
        heading = coords.w
    }, table)
end

function removeZone(name)
    exports['qb-target']:RemoveZone(name)
end