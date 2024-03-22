local isFirstTime = true

RegisterCommand('opencrafting', function(source)
    openCrafting(source)
end)

RegisterNetEvent('pure-crafting:openCrafting', function()
    local src = source
    openCrafting(src)
end)

function openCrafting(source)
    local items = lib.callback.await('pure-crafting:getItems', false)
    if not currentZone then return end
    local benchId = currentZone.benchId
    local data = lib.callback.await('pure-crafting:getData', false, benchId)
    SendReactMessage('itemsChange', items)
    SendReactMessage('updateItems', data.queue)
    SendReactMessage('updateFinished', data.finished)
    toggleNuiFrame(true)
    debugPrint('nuiCallback | Show NUI frame')
end