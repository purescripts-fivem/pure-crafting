function deleteAllBenches()
    for i = 1, #Benches do 
        local benchObj = Benches[i].obj
        if not benchObj or not DoesEntityExist(benchObj) then goto continue end
        DeleteEntity(benchObj)
        Benches[i].obj = nil
        ::continue::
    end
end

function pickupBench(source, id)
    local result = lib.callback.await('pure-crafting:pickupBench', false, id)
end

function createBench(location, rotation, type)
    local model = generateObjFromType(type)
    RequestModel(model)
    local object = CreateObject(model, location.x, location.y, location.z, false, false, false)
    SetEntityRotation(object, rotation.x, rotation.y, rotation.z, 1)
    PlaceObjectOnGroundProperly(object)
    Wait(1000)
    FreezeEntityPosition(object, true)
    SetEntityCanBeDamaged(object, false)
    return object
end