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

-- RegisterNetEvent('pure-crafting:beforeBenches', function(type)
    -- local customChecks = customChecks(source)
    -- local checks = limitChecker(source)
    -- Wait(150)
    -- if not checks then return end
--     TriggerClientEvent('pure-crafting:placebench', source, type)
-- end)