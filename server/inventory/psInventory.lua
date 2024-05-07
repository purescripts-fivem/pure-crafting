if Config.inventory ~= 'ps-inventory' then return end
local QBCore = exports['qb-core']:GetCoreObject()

function removeItem(source, item, amount)
    return exports['ps-inventory']:RemoveItem(source, item, amount)
end

function checkItem(source, item, amount)
    return exports['ps-inventory']:HasItem(source, item, amount)
end

function getItems(source, item)
    return exports['ps-inventory']:GetItemByName(source, item)
end

function giveItem(source, item, amount)
    exports['ps-inventory']:AddItem(source, item, amount)
end

function createItem(name, trigger, data)
    QBCore.Functions.CreateUseableItem(name, function(source, item)
        TriggerClientEvent(trigger, source, data)
    end)
end

-- THESE ARE EXAMPLES OF BLUEPRINTS / FOLLOW THE DOCS FOR MORE INFORMATION

-- Add these to your qb-core/shared/items.lua
-- blueprint_lockpick           = {name = 'blueprint_lockpick', label = 'Lockpick Blueprint', weight = 100, type = 'item', image = 'blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Lockpick Blueprint'},