RegisterNetEvent('pure-crafting:useBlueprint', function(name)
    if not currentZone then
        notifySystem({
            title = _Lang('blueprints.notAtABench'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return
    end
    local benchId = currentZone.benchId
    TriggerServerEvent('pure-crafting:blueprintUsed', benchId, name)
end)