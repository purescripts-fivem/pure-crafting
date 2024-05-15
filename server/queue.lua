Queue = {}
ActiveBenches = {}
User = {}
Players = {}


function Queue:new(benchId, queue, finished, blueprints, type)
    local decodeBps = json.decode(blueprints)
    local bpHash = {}

    if decodeBps then
        for i = 1, #decodeBps do
            bpHash[decodeBps[i]] = true
        end
    end

    local data = {
        benchId = benchId,
        activeMembers = {},
        items = json.decode(queue),
        finished = json.decode(finished),
        blueprints = decodeBps,
        bpHash = bpHash,
        type = type
    }

    debugPrint('Queue:new | ', json.encode(data))
    return setmetatable(data, {__index = Queue})
end

function initQueue(benchId, queue, finished, blueprints, type)
    local bench = Queue:new(benchId, queue, finished, blueprints, type)
    ActiveBenches[tostring(benchId)] = bench
end

function User:new(source)
    local uniqueId = getPlayerUniqueId(source)

    local row = MySQL.single.await('SELECT `faves`, `amountPlaced` FROM `crafting_users` WHERE `uniqueId` = ? LIMIT 1', {
        uniqueId
    })

    if not row then
        debugPrint('User:new | No data for user: ', uniqueId)
        return
    end

    debugPrint('User:new | ', row.amountPlaced)

    local data = {
        source = source,
        uniqueId = uniqueId,
        faves = json.decode(row.faves),
        amountPlaced = row.amountPlaced,
    }

    debugPrint('User:new | ', json.encode(data))

    return setmetatable(data, {__index = User})
end

function initUser(source)
    local user = User:new(source)
    Players[tostring(source)] = user
end

function removeUser(source)
    Players[tostring(source)] = nil
end

function checkPerson(source)
    local user = Players[tostring(source)]
    if not user then
        local uniqueId = getPlayerUniqueId(source)
        
        local row = MySQL.single.await('SELECT `faves`, `amountPlaced` FROM `crafting_users` WHERE `uniqueId` = ? LIMIT 1', {
            uniqueId
        })
    
        if not row then
            return
        end
    end
    return true
end