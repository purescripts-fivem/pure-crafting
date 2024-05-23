-- RegisterCommand('placebench', function(source)
--     local customChecks = customChecks(source)
--     local checks = limitChecker(source)
--     Wait(150)
--     if not checks then return end
--     TriggerClientEvent('pure-crafting:placebench', source, 'attachments')
-- end)

function limitChecker(source)
    -- Notify and checks and shit
    if not Config.placingBench.limit then return true end
    local user = Players[tostring(source)]
    local checkUser = true
    if not user then
        checkUser = checkPerson(source)
    end

    if not checkUser then
        local uniqueId = getPlayerUniqueId(source)
        local id = MySQL.insert.await('INSERT INTO `crafting_users` (uniqueId) VALUES (?)', {
            uniqueId
        })
        user = User:new(source)
        Players[tostring(source)] = user
        return true
    end

    local amt = Config.placingBench.limit
    local myAmt = user.amountPlaced
    if myAmt >= amt then
        notifySystem(source, {
            title = _Lang('placingBench.limitReached'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return
    end
    return true
end

function serverChecks(source)
    local customChecks = customChecks(source)
    local checks = limitChecker(source)
    Wait(150)
    if not checks then return end
    return true
end

function pickupBench(source, benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    local uniqueId = getPlayerUniqueId(source)
    if uniqueId ~= bench.userPlaced then return end
    local type = bench.type

    for i = 1, #Benches do
        if Benches[i].id == benchId then
            Benches[i] = nil
            break
        end
    end


    for i = 1, #Config.benchItems do 
        local benchItem = Config.benchItems[i].type
        if benchItem == type then
            local item = Config.benchItems[i].itemName
            giveItem(source, item, 1)
            break
        end
    end

    local row = MySQL.single.await('SELECT `blueprints` FROM `crafting_benches` WHERE `id` = ? LIMIT 1', {
        benchId
    })

    if row then
        local blueprints = json.decode(row.blueprints)
        for k = 1, #blueprints do local v = blueprints[k]
            giveItem(source, v, 1)
        end
    end

    local user = Players[tostring(source)]
    if user then
        user.amountPlaced = user.amountPlaced - 1
        MySQL.update.await('UPDATE crafting_users SET amountPlaced = ? WHERE uniqueId = ?', {
            user.amountPlaced, user.uniqueId
        })
    end

    MySQL.query.await('DELETE FROM crafting_benches WHERE id = ?', {benchId})
    ActiveBenches[tostring(benchId)] = nil
    TriggerClientEvent('pure-crafting:refreshBenches', -1, Benches)
end
