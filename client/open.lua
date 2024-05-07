local isFirstTime = true

RegisterNetEvent('pure-crafting:openCrafting', function()
    local src = source
    openCrafting(src)
end)

function openCrafting(source, newBenchId)
    local benchId = nil
    if Config.targetingOptions.interaction == 'interaction' then
        if not currentZone then return end
        benchId = currentZone.benchId
    else
        benchId = newBenchId
    end
    local items = lib.callback.await('pure-crafting:getItems', false, benchId)
    local data = lib.callback.await('pure-crafting:getData', false, benchId)
    SendReactMessage('itemsChange', items)
    SendReactMessage('updateItems', data.queue)
    SendReactMessage('updateFinished', data.finished)
    SendReactMessage('blueprints', data.blueprints)
    toggleNuiFrame(true)
    debugPrint('nuiCallback | Show NUI frame')
    TriggerScreenblurFadeIn(250)
end