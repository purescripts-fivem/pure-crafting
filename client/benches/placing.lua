local function placeBench()
    RequestModel(Config.placingBench.object)
    local _, _, endCoords, surfaceNormal = raycast()
    local rot = normalToRotation(surfaceNormal)
    local object = CreateObject(Config.placingBench.object, endCoords.x, endCoords.y, endCoords.z, false, false, false)
    local canPlace = false

    SetEntityAlpha(object, 200)
    SetEntityRotation(object, rot.x, rot.y, rot.z, 1)
    DisableCamCollisionForEntity(object)
    SetEntityCollision(object, false, false)
    SetEntityDrawOutlineColor(10, 170, 210, 200)
    SetEntityDrawOutlineShader(1)
    SetEntityDrawOutline(object, true)

    local zRotation = rot.z
    local leftRotation = false
    local rightRotation = false

    local text = _Lang('placingBench.left') .. ' | ' .. _Lang('placingBench.right') .. ' | ' .. _Lang('placingBench.place') .. ' | ' .. _Lang('placingBench.cancel')
    lib.showTextUI(text)

    while true do
        DisableControlAction(0, Config.placingBench.leftControl, true)
        DisableControlAction(0, Config.placingBench.rightControl, true)
        DisableControlAction(0, Config.placingBench.placeControl, true)
        DisableControlAction(0, Config.placingBench.cancelControl, true)

        _, _, endCoords, surfaceNormal = raycast()
        rot = normalToRotation(surfaceNormal)

        if (rot.y < Config.placingBench.minusOffset) or (rot.y > Config.placingBench.plusOffset) then
            SetEntityDrawOutlineColor(255, 0, 0, 200)
            canPlace = false
        else
            SetEntityDrawOutlineColor(0, 255, 0, 200)
            canPlace = true
        end

        if IsDisabledControlJustPressed(0, Config.placingBench.leftControl) then
            leftRotation = true
        end
        if IsDisabledControlJustReleased(0, Config.placingBench.leftControl) then
            leftRotation = false
        end

        if leftRotation then
            zRotation = zRotation - Config.placingBench.rotationSpeed
        end

        if IsDisabledControlJustPressed(0, Config.placingBench.rightControl) then
            rightRotation = true
        end
        if IsDisabledControlJustReleased(0, Config.placingBench.rightControl) then
            rightRotation = false
        end

        if rightRotation then
            zRotation = zRotation + Config.placingBench.rotationSpeed
        end

        SetEntityCoords(object, endCoords)
        SetEntityRotation(object, rot.x, rot.y, zRotation, 1)

        if IsDisabledControlJustPressed(0, Config.placingBench.cancelControl) then
            DeleteObject(object)
            lib.hideTextUI()
            return
        end

        if IsDisabledControlJustPressed(0, Config.placingBench.placeControl) then
            lib.hideTextUI()
            if not canPlace then
                print('cant place')
            else
                DeleteObject(object)
                local success = lib.callback.await('pure-crafting:createBench', false, endCoords, vector3(rot.x, rot.y, zRotation))
                return
            end
        end
    end
end

RegisterCommand('placeBench', function(source)
    placeBench()
end)