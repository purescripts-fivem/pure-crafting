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
        initQueue(row.id, row.queue, row.finished, row.blueprints, row.type)
    end

    Benches = newTable

    debugPrint('getBenches | Benches:', json.encode(Benches))
end

function insertBench(location, rotation, source, type)
    local id = MySQL.insert.await('INSERT INTO `crafting_benches` (location, rotation, type) VALUES (?, ?, ?)', {
        json.encode(location), json.encode(rotation), type
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
    initQueue(id, json.encode({}), json.encode({}), json.encode({}), type)
    for i = 1, #Config.benchItems do 
        local benchItem = Config.benchItems[i].type
        if benchItem == type then
            local item = Config.benchItems[i].itemName
            removeItem(source, item, 1)
            break
        end
    end
    
    local user = Players[tostring(source)]
    if not user then return end
    user.amountPlaced = user.amountPlaced + 1
    local affectedRows = MySQL.update.await('UPDATE crafting_users SET amountPlaced = ? WHERE uniqueId = ?', {
        user.amountPlaced, user.uniqueId
    })
end

RegisterCommand('benches', function(source)
    getBenches()
    sendBenches(source)
    initUser(source)
end)

function sendBenches(source)
    TriggerClientEvent('pure-crafting:refreshBenches', source, Benches)
end

CreateThread(function()
    getBenches()
end)