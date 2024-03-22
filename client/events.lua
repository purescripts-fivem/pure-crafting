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