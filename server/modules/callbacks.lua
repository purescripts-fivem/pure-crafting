lib.callback.register('pure-crafting:getItems', function(source, benchId)
    local bench = ActiveBenches[tostring(benchId)]
    return generateItems(source, bench.benchId, bench.type)
end)

lib.callback.register('pure-crafting:getData', function(source, benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end

    local bps = getBlueprintsFromType(bench.type)
    for i = #bps, 1, -1 do
        if bench.bpHash[bps[i].blueprintId] then
            table.remove(bps, i)
        end
    end

    local data = {
        queue = bench.items,
        finished = bench.finished,
        blueprints = bps,
    }
    return data
end)

lib.callback.register('pure-crafting:createBench', function(source, coords, rotation, type)
    return insertBench(coords, rotation, source, type)
end)

lib.callback.register('pure-crafting:serverChecks', function(source)
    return serverChecks(source)
end)