Benches = {}

function getBenches()
    debugPrint('getBenches | Getting benches from database.')
    local response = MySQL.query.await('SELECT * FROM crafting_benches')
    if not response then return end

    local newTable = {}

    for i = 1, #response do 
        local row = response[i]
        local location = json.decode(row.location)
        local rotation = json.decode(row.rotation)
        newTable[#newTable + 1] = {
            id = row.id,
            location = row.location,
            rotation = row.rotation,
            queue = row.queue,
            finished = row.finished,
            obj = nil
        }
        initQueue(row.id, row.queue, row.finished)
    end

    Benches = newTable

    debugPrint('getBenches | Benches:', json.encode(Benches))

    -- TriggerClientEvent('pure-crafting:refreshBenches', -1, Benches)
end

function insertBench(location, rotation)
    local id = MySQL.insert.await('INSERT INTO `crafting_benches` (location, rotation) VALUES (?, ?)', {
        json.encode(location), json.encode(rotation)
    })
    newBench = {
        id = id,
        location = location,
        rotation = rotation,
        queue = json.encode({}),
        finished = json.encode({}),
        obj = nil
    }
    Benches[#Benches + 1] = newBench
    TriggerClientEvent('pure-crafting:insertBench', -1, newBench)
    initQueue(id, json.encode({}), json.encode({}))
end

function deleteBench()
end

RegisterCommand('benches', function(source)
    getBenches()
    sendBenches(source)
end)

function sendBenches(source)
    TriggerClientEvent('pure-crafting:refreshBenches', source, Benches)
end

CreateThread(function()
    getBenches()
end)