RegisterNetEvent('pure-crafting:addToQueue', function(item)
    SendReactMessage('addToQueue', item)
end)

RegisterNetEvent('pure-crafting:finishedCraft', function(items, finished)
    SendReactMessage('updateItems', items)
    SendReactMessage('updateFinished', finished)
end)

RegisterNetEvent('pure-crafting:updateFinished', function(data)
    SendReactMessage('updateFinished', data)
end)

RegisterNetEvent('pure-crafting:secondChange', function(itemsSeconds)
    SendReactMessage('secondsChange', itemsSeconds)
end)

RegisterNetEvent('pure-crafting:updateQueue', function(data)
    SendReactMessage('updateItems', data)
end)

RegisterNetEvent('pure-crafting:updateItems', function(items)
    SendReactMessage('itemsChange', items)
end)

RegisterNetEvent('pure-crafting:generateItems', function(benId)
    if not currentZone then 
        return
    end
    local benchId = currentZone.benchId
    if benId == benchId then
        local items = lib.callback.await('pure-crafting:getItems', false, benchId)
        SendReactMessage('itemsChange', items)
    end
end)

RegisterNetEvent('pure-crafting:setFaves', function(faves)
    SendReactMessage('setFaves', faves)
end)