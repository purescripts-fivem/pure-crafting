lib.callback.register('pure-crafting:getItems', function(source, benchId)
    local bench = ActiveBenches[tostring(benchId)]
    return generateItems(source, bench.benchId, bench.type)
end)

lib.callback.register('pure-crafting:getData', function(source, benchId)
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then return end
    local data = {
        queue = bench.items,
        finished = bench.finished,
        blueprints = getBlueprintsFromType(bench.type)
    }
    return data
end)

lib.callback.register('pure-crafting:createBench', function(source, coords, rotation)
    return insertBench(coords, rotation, source)
end)

lib.callback.register('pure-crafting:checkCanPlace', function(source)
    return limitChecker(source)
end)