RegisterNetEvent('pure-crafting:exitZone', function(benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    bench:removePlayer(source)
end)

RegisterNetEvent('pure-crafting:enterZone', function(benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then 
        print('bench not found', benchId, source)
        return
    end
    bench:addPlayer(source)
end)

RegisterNetEvent('pure-crafting:playerLoaded', function()
    local src = source
    sendBenches(src)
    initUser(src)
end)

RegisterNetEvent('pure-crafting:playerUnloaded', function()
    local src = source
    removeUser(src)
end)

RegisterNetEvent('pure-crafting:blueprintUsed', function(benchId, name)
    local src = source
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    bench:useBlueprint(src, name)
end)

RegisterNetEvent('pure-crafting:craftFinished', function(benchId, data)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    bench:finishedCraft(data)
end)

RegisterNetEvent('pure-crafting:claimCraft', function(benchId, data)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    bench:claimCraft(data.id, data.index, source)
end)

RegisterNetEvent('pure-crafting:cancelCraft', function(benchId, data)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    bench:cancelCraft(data.id, data.index, source)
end)

RegisterNetEvent('pure-crafting:attemptCraft', function(benchId, data)
    local amount, currentItem, item = data.amount, data.currentItem, data.item
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then 
        debugPrint('pure-crafting:attemptCraft | failed - no bench', source)
        return 
    end
    local expectedItem = getItemFromId(tostring(currentItem), tostring(bench.type))
    if not expectedItem then 
        debugPrint('pure-crafting:attemptCraft | failed - no expected item', json.encode(expectedItem), json.encode(item))
        return 
    end
    if expectedItem.name ~= item.name then 
        debugPrint('pure-crafting:attemptCraft | failed - item names dont match', json.encode(expectedItem), json.encode(item))
        return 
    end
    bench:craftItem(amount, item, source)
end)

RegisterNetEvent('pure-crafting:setFavourite', function(data)
    local itemName = data.itemName
    local src = source
    local user = Players[tostring(source)]
    local checkUser = true
    
    if not user then
        checkUser = checkPerson(source)
    end
    if not checkUser then
        createUserSetFave(src, itemName)
        return
    end

    if user:checkFave(itemName) then
        user:removeFave(itemName)
    else
        user:addFave(itemName)
    end
end)