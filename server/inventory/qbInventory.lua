if Config.inventory ~= 'qb-inventory' then return end
local QBCore = exports['qb-core']:GetCoreObject()

function removeItem(source, item, amount)
    local player = QBCore.Functions.GetPlayer(source)
    local result = player.Functions.RemoveItem(item, amount)
    if not result then return end
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
    return true
    -- return exports['qb-inventory']:RemoveItem(source, item, amount)
end

function checkItem(source, item, amount)
    return exports['qb-inventory']:HasItem(source, item, amount)
end

function getItems(source, item)
    return exports['qb-inventory']:GetItemByName(source, item)
end

function giveItem(source, item, amount)
    local player = QBCore.Functions.GetPlayer(source)
    -- exports['qb-inventory']:AddItem(source, item, amount)
    player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
end

function createItem(name, trigger, data)
    QBCore.Functions.CreateUseableItem(name, function(source, item)
        TriggerClientEvent(trigger, source, data)
    end)
end

-- THESE ARE EXAMPLES OF BLUEPRINTS / FOLLOW THE DOCS FOR MORE INFORMATION

-- Add these to your qb-core/shared/items.lua
-- blueprint_lockpick           = {name = 'blueprint_lockpick', label = 'Lockpick Blueprint', weight = 100, type = 'item', image = 'blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Lockpick Blueprint'},

-- weapon_bench                 = {name = 'weapon_bench', label = 'Weapons Bench', weight = 100, type = 'item', image = 'crafting_bench.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A Weapons Bench'},
-- misc_bench                   = {name = 'misc_bench', label = 'Misc Bench', weight = 100, type = 'item', image = 'crafting_bench.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A Misc Bench'},
-- attachments_bench            = {name = 'attachments_bench', label = 'Attachments Bench', weight = 100, type = 'item', image = 'crafting_bench.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A Attachments Bench'},
