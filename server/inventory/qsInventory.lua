if Config.inventory ~= 'qs-inventory' then return end

function removeItem(source, item, amount)
    return exports['qs-inventory']:RemoveItem(source, item, amount)
end

function checkItem(source, item, amount)
    local qsAmount = exports['qs-inventory']:GetItemTotalAmount(source, item)
    if qsAmount >= amount then return true end
    return false
end

function getItems(source, item)
    return exports['qb-inventory']:GetItemTotalAmount(source, item)
end

function giveItem(source, item, amount)
    return exports['qs-inventory']:AddItem(source, item, amount)
end

function createItem(name, trigger, data)
    exports['qs-inventory']:CreateUsableItem(name, function(source, item)
        TriggerClientEvent(trigger, source, data)
    end)
end

-- THESE ARE EXAMPLES OF BLUEPRINTS / FOLLOW THE DOCS FOR MORE INFORMATION

-- Add these to your qb-core/shared/items.lua
-- blueprint_lockpick           = {name = 'blueprint_lockpick', label = 'Lockpick Blueprint', weight = 100, type = 'item', image = 'blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Lockpick Blueprint'},