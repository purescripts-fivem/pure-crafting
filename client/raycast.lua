function raycast()
    local coords, normal = GetWorldCoordFromScreenCoord(0.5, 0.5)
	local destination = coords + normal * (distance or 10)
	local handle = StartShapeTestLosProbe(coords.x, coords.y, coords.z, destination.x, destination.y, destination.z,
		flags or 511, cache.ped, ignore or 4)

	while true do
		Wait(0)
		local retval, hit, endCoords, surfaceNormal, materialHash, entityHit = GetShapeTestResultIncludingMaterial(handle)

		if retval ~= 1 then
			return hit, entityHit, endCoords, surfaceNormal, materialHash
		end
	end
end

function normalToRotation(normal)
    local pitch = -math.asin(normal.y) * (180.0 / math.pi)
    local yaw = math.atan(normal.x, normal.z) * (180.0 / math.pi)
    return vec(pitch, yaw, 0.0)
end