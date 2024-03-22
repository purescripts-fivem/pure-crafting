lib.callback.register('pure-crafting:attemptCraft', function(source, data, benchId)
    local amount, currentItem, item = data.amount, data.currentItem, data.item
    local user = ActiveBenches[tostring(benchId)]
    if not user then 
        debugPrint('pure-crafting:attemptCraft | failed - no user', source)
        return 
    end
    -- local expectedItem = Config.items[currentItem]
    local expectedItem
    for i = 1, #Config.items do 
        if Config.items[i].id == currentItem then 
            expectedItem = Config.items[i]
            break
        end
    end
    if not expectedItem then 
        debugPrint('pure-crafting:attemptCraft | failed - no expected item', json.encode(expectedItem), json.encode(item))
        return 
    end
    if expectedItem.name ~= item.name then 
        debugPrint('pure-crafting:attemptCraft | failed - item names dont match', json.encode(expectedItem), json.encode(item))
        return 
    end
    local result = user:craftItem(amount, item, source)
    return result
end)

lib.callback.register('pure-crafting:craftFinished', function(source, data, benchId)
    local user = ActiveBenches[tostring(benchId)]
    if not user then return end
    user:finishedCraft(data)
end)

lib.callback.register('pure-crafting:claimCraft', function(source, data, benchId)
    local user = ActiveBenches[tostring(benchId)]
    if not user then return end
    user:claimCraft(data.id, data.index)
end)

lib.callback.register('pure-crafting:cancelCraft', function(source, data, benchId)
    local user = ActiveBenches[tostring(benchId)]
    if not user then return end
    user:cancelCraft(data.id, data.index)
end)

lib.callback.register('pure-crafting:getItems', function(source)
    local items = generateItems(source)
    return items
end)

lib.callback.register('pure-crafting:getData', function(source, benchId)
    local user = ActiveBenches[tostring(benchId)]
    local data = {
        queue = user.items,
        finished = user.finished
    }
    return data
end)

lib.callback.register('pure-crafting:createBench', function(source, coords, rotation)
    return insertBench(coords, rotation)
end)