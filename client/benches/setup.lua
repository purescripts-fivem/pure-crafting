Benches = {}

RegisterNetEvent('pure-crafting:refreshBenches', function(benches)
    local src = source
    removeZones()
    for i = 1, #Benches do
        removeZone('bench_'.. Benches[i].id)
    end
    deleteAllBenches()
    Benches = benches
    setupBenches(src)
end)

function setupBenches(source)
    local uniqueId = getPlayerUniqueId(source)
    for i = 1, #Benches do 
        local bench = Benches[i]
        local location, rotation = json.decode(bench.location), json.decode(bench.rotation)
        local tableForTarget = {
            options = {
                {
                    type = 'client',
                    action = function()
                        openCrafting(source, bench.id)
                    end,
                    icon = 'fas fa-wrench',
                    label = 'Use Bench',
                    canInteract = function()
                        return true
                    end
                },
                {
                    type = 'client',
                    action = function()
                        pickupBench(source, bench.id)
                    end,
                    icon = 'fas fa-hand',
                    label = 'Pickup Bench',
                    canInteract = function()
                        return uniqueId == bench.userPlaced
                    end
                }
            },
            distance = 1.0,
            location = location,
        }

        if Config.targetingOptions.interaction == 'target' then 
            local name = 'bench_'.. bench.id
            addTargetToCoords(location, vector3(2, 2, 2), tableForTarget, name)
        end

        setupBenchZone(location, rotation, vector3(3, 3, 4))

        local benchObj = createBench(location, rotation, bench.type)
        bench.obj = benchObj
    end
end

RegisterNetEvent('pure-crafting:insertBench', function(newBench)
    insertBench(source, newBench)
end)

function insertBench(source, newBench)
    local uniqueId = getPlayerUniqueId(source)
    local location, rotation = newBench.location, newBench.rotation
    local tableForTarget = {
        options = {
            {
                type = 'client',
                action = function()
                    openCrafting(source, newBench.id)
                end,
                icon = 'fas fa-wrench',
                label = 'Use Bench',
                canInteract = function()
                    return true
                end
            },
            {
                type = 'client',
                action = function()
                    pickupBench(source, newBench.id)
                end,
                icon = 'fas fa-hand',
                label = 'Pickup Bench',
                canInteract = function()
                    return uniqueId == newBench.userPlaced
                end
            }
        },
        distance = 1.0,
        location = location,
    }

    if Config.targetingOptions.interaction == 'target' then 
        local name = 'bench_'.. newBench.id
        addTargetToCoords(location, vector3(2, 2, 2), tableForTarget, name)
    end

    setupBenchZone(location, rotation, vector3(3, 3, 4))

    local benchObj = createBench(location, rotation, newBench.type)
    newBench.obj = benchObj
    Benches[#Benches + 1] = newBench
end

RegisterNetEvent('pure-crafting:beforeBenches', function(data)
    local serverChecks = lib.callback.await('pure-crafting:serverChecks', false, data)
    if not serverChecks then return end
    placeBench(source, data)
end)

function generateObjFromType(type)
    for i = 1, #Config.benchItems do 
        local benchItem = Config.benchItems[i].type
        print(benchItem, type)
        if benchItem == type then
            return Config.benchItems[i].object
        end
    end
    return `prop_tool_bench`
end