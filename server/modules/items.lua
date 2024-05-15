function generateItems(source, benchId, type)
    local items = {}
    local itemsToSearch = Config.items[type]
    if not itemsToSearch then return items end
    for i = 1, #itemsToSearch do
        local item = itemsToSearch[i]
        local requiredItems = item.requiredItems
        for i = 1, #requiredItems do
            local requiredItem = requiredItems[i]
            local myAmount = 0
            local myItem = getItems(source, requiredItem.itemName)
            if not myItem then
                myAmount = 0
            else
                myAmount = myItem.amount
            end
            requiredItem.myAmount = myAmount
        end
        items[i] = item
    end
    local bench = ActiveBenches[tostring(benchId)]
    if not bench then
        return items 
    end
    local blueprints = bench.blueprints
    for i = 1, #blueprints do
        local blueprint = blueprints[i]
        local blueprintTable = getBlueprintFromId(blueprint, type)
        if not blueprintTable then goto continue end
        local blueprintRequiredItems = blueprintTable.requiredItems
        for i = 1, #blueprintRequiredItems do
            local requiredItem = blueprintRequiredItems[i]
            local myAmount = 0
            local myItem = getItems(source, requiredItem.itemName)
            if not myItem then
                myAmount = 0
            else
                myAmount = myItem.amount
            end
            requiredItem.myAmount = myAmount
        end
        items[#items + 1] = blueprintTable
        ::continue::
    end
    return items
end