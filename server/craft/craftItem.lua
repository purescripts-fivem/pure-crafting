function Queue:craftItem(amount, item, source)
    local canCraftItem = canCraftItem(source, item, amount)
    if not canCraftItem then return end
    local item = self:add(item, amount)
    return item
end

function canCraftItem(source, item, amount)
    local requiredItems = item.requiredItems
    if not checkItems(source, requiredItems, amount) then 
        notifySystem(source, {
            title = _Lang('notEnough.title'),
            description = _Lang('notEnough.message'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return 
    end
    if not removeItems(source, requiredItems, amount) then 
        notifySystem(source, {
            title = _Lang('notEnough.title'),
            description = _Lang('notEnough.message'),
            type = 'error',
            position = Config.libText.notfiyPoistion,
        })
        return 
    end
    return true
end

function checkItems(source, items, amount)
    if not items or #items == 0 then return end
    for i = 1, #items do
        local item = items[i]
        if not checkItem(source, item.itemName, item.amount * amount) then 
            return
        end
    end
    return true
end

function removeItems(source, items, amount)
    if not items or #items == 0 then return end
    for i = 1, #items do 
        local item = items[i]
        if not removeItem(source, item.itemName, item.amount * amount) then 
            return
        end
    end
    return true
end