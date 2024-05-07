currentZone = nil
local zones = {
    benches = {},
}

function getZoneFromId(id, zone)
    for i = 1, #zone do 
        if zone[i].id == id then 
            return i
        end
    end
end

function checkZone(coords)
    for i = 1, #zones.benches do 
        local zone = zones.benches[i]
        if zone:contains(coords) then 
            return true
        end
    end
    return
end

function removeZones()
    for i = 1, #zones.benches do 
        zones.benches[i]:remove()
    end
end

function setupBenchZone(location, rotation, boxSize)
    zones.benches[#zones.benches + 1] = initiateZone({
        coords = location,
        boxSize = boxSize,
    }, onBenchEnter, onZoneExit)
end

function initiateZone(table, onEnter, onExit)
    return lib.zones.box({
        coords = vector3(table.coords.x, table.coords.y, table.coords.z),
        rotation = table.rotation,
        size = table.boxSize,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function onBenchEnter(data)
    local text = _Lang('useBench')
    local benchId = getZoneFromId(data.id, zones.benches)
    local bench = Benches[benchId]
    if not bench then return end
    TriggerServerEvent('pure-crafting:enterZone', bench.id)
    currentZone = {
        name = 'benches',
        benchId = bench.id
    }
    if Config.targetingOptions.interaction == 'interaction' then 
        lib.showTextUI(text)
    end
end

local sleep = 2000
function loopZones()
    Wait(sleep)
    sleep = 1000
    while true do 
        if currentZone then 
            sleep = 1
            if IsControlJustReleased(0, 38) then 
                if currentZone.name == 'benches' then 
                    TriggerEvent('pure-crafting:openCrafting')
                end
            end
        else
            sleep = 1000
        end
        Wait(sleep)
    end
end

function onZoneExit(data)
    lib.hideTextUI()
    local benchId = getZoneFromId(data.id, zones.benches)
    local bench = Benches[benchId]
    if not bench then return end
    TriggerServerEvent('pure-crafting:exitZone', bench.id)
    toggleNuiFrame(false)
    TriggerScreenblurFadeOut(250)
    currentZone = nil
end

CreateThread(function()
    Wait(100)
    if Config.targetingOptions.interaction == 'interaction' then 
        loopZones()
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        removeZones()
        deleteAllBenches()
    end
end)