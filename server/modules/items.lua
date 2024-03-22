function generateItems(source)
    local items = {}
    for i = 1, #Config.items do
        local item = Config.items[i]
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
            debugPrint('generateItems | myItem', myAmount, requiredItem.itemName)
        end
        items[i] = item
        debugPrint('generateItems | item', json.encode(item))
    end
    debugPrint('generateItems | items', json.encode(items))
    return items
end