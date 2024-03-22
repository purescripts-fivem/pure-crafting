if Config.inventory ~= 'qb-inventory' then return end

function removeItem(source, item, amount)
    return exports['qb-inventory']:RemoveItem(source, item, amount)
end

function checkItem(source, item, amount)
    return exports['qb-inventory']:HasItem(source, item, amount)
end

function getItems(source, item)
    return exports['qb-inventory']:GetItemByName(source, item)
end

function giveItem(source, item, amount)
    exports['qb-inventory']:AddItem(source, item, amount)
end