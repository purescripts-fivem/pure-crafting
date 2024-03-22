RegisterNetEvent('pure-crafting:exitZone', function(benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    bench:removePlayer(source)
end)

RegisterNetEvent('pure-crafting:enterZone', function(benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then 
        print('ERROR: pure-crafting:enterZone | no bench found', benchId)
        initQueue(benchId, json.encode({}), json.encode({}))
    end
    bench:addPlayer(source)
end)

RegisterNetEvent('pure-crafting:playerLoaded', function()
    local src = source
    sendBenches(src)
end)