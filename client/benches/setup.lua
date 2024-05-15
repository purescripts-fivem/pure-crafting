Benches = {}

RegisterNetEvent('pure-crafting:refreshBenches', function(benches)
    local src = source
    removeZones()
    deleteAllBenches()
    Benches = benches
    setupBenches(src)
end)

function setupBenches(source)
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

        local benchObj = createBench(location, rotation)
        bench.obj = benchObj
    end
end

RegisterNetEvent('pure-crafting:insertBench', function(newBench)
    insertBench(newBench)
end)

function insertBench(newBench)
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

    local benchObj = createBench(location, rotation)
    newBench.obj = benchObj
    Benches[#Benches + 1] = newBench
end

RegisterNetEvent('pure-crafting:beforeBenches', function(data)
    local serverChecks = lib.callback.await('pure-crafting:serverChecks', false, data)
    if not serverChecks then return end
    placeBench(source, data)
end)