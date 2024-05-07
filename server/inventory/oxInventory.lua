if Config.inventory ~= 'ox_inventory' then return end

function removeItem(source, item, amount)
    return exports.ox_inventory:RemoveItem(source, item, amount)
end

function checkItem(source, item, amount)
    local oxAmount = exports.ox_inventory:Search(source, 'count', item)
    if oxAmount >= amount then return true end
    return
end

function getItems(source, item)
    return exports.ox_inventory:Search(source, 'count', item)
end

function giveItem(source, item, amount)
    local canCarry = exports.ox_inventory:CanCarryItem(source, item, amount)
    if not canCarry then return end
    local success, response = exports.ox_inventory:AddItem(source, item, amount)
    return success
end

function createItem(name, trigger, data)
    if Config.framework == 'esx' then
        ESX.RegisterUsableItem(name, function(source)
            TriggerClientEvent(trigger, source, data)
        end)
        return
    end
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.CreateUseableItem(name, function(source, item)
        TriggerClientEvent(trigger, source, data)
    end)
end

-- THESE ARE EXAMPLES OF BLUEPRINTS / FOLLOW THE DOCS FOR MORE INFORMATION

-- Add these to your ox_inventory/data/items.lua
-- ['blueprint_lockpick'] = {
--     label = 'Lockpick Blueprint',
--     weight = 100,
--     stack = true,
--     description = 'A lockpick blueprint'
-- },

-- Add these to your qb-core/shared/items.lua
-- blueprint_lockpick           = {name = 'blueprint_lockpick', label = 'Lockpick Blueprint', weight = 100, type = 'item', image = 'blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Lockpick Blueprint'},