lib.callback.register('pure-crafting:queueCraft', function(source, data)
    local item = data.item
    local user = Users[tostring(source)]
    if not user then return end
    user:add(item)
end)