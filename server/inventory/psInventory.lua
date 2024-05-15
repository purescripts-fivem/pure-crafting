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

print('PS Inventory Is Untested, Please Report Any Issues')

-- THESE ARE EXAMPLES OF BLUEPRINTS / FOLLOW THE DOCS FOR MORE INFORMATION

-- -- Crafting
-- weap_bench                 = {name = 'weap_bench', label = 'Weapons Bench', weight = 100, type = 'item', image = 'pure_bench.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A Weapons Bench'},
-- misc_bench                   = {name = 'misc_bench', label = 'Misc Bench', weight = 100, type = 'item', image = 'pure_bench.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A Misc Bench'},

-- -- Blueprints
-- blueprint_molotov            = {name = 'blueprint_molotov', label = 'Molotov Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Molotov Blueprint'},
-- blueprint_grip               = {name = 'blueprint_grip', label = 'Grip Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Grip Blueprint'},
-- blueprint_suppressor         = {name = 'blueprint_suppressor', label = 'Suppressor Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Suppressor Blueprint'},
-- blueprint_extendedclip       = {name = 'blueprint_extendedclip', label = 'Extended Clip Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Extended Clip Blueprint'},
-- blueprint_scope              = {name = 'blueprint_scope', label = 'Scope Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Scope Blueprint'},
-- blueprint_specialcarbine     = {name = 'blueprint_specialcarbine', label = 'Special Carbine Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Special Carbine Blueprint'},
-- blueprint_assaultrifle       = {name = 'blueprint_assaultrifle', label = 'Assault Rifle Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Assault Rifle Blueprint'},
-- blueprint_advancedrifle      = {name = 'blueprint_advancedrifle', label = 'Advanced Rifle Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Advanced Rifle Blueprint'},
-- blueprint_sawnoffshotgun     = {name = 'blueprint_sawnoffshotgun', label = 'Sawn Off Shotgun Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sawn Off Shotgun Blueprint'},
-- blueprint_machinepistol      = {name = 'blueprint_machinepistol', label = 'Machine Pistol Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Machien Pistol Blueprint'},
-- blueprint_microsmg           = {name = 'blueprint_microsmg', label = 'Microsmg Blueprint', weight = 100, type = 'item', image = 'pure_blueprint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Microsmg Blueprint'},
