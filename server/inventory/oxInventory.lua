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
    local amt = exports.ox_inventory:Search(source, 'count', item)
    if not amt then return end
    local myAmount = {
        amount = amt
    }
    return myAmount
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
-- -- Crafting:
-- ["weap_bench"] = {
--     label = "Weapons Bench",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A bench to craft weapons",
--     client = {
--         image = "pure_bench.png",
--     }
-- },

-- ["misc_bench"] = {
--     label = "Misc Bench",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A bench to craft miscellaneous items",
--     client = {
--         image = "pure_bench.png",
--     }
-- },

-- -- Blueprints:
-- ["blueprint_molotov"] = {
--     label = "Molotov Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft Molotovs",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },


-- ["blueprint_grip"] = {
--     label = "Grip Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Weapons Grip",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_suppressor"] = {
--     label = "Suppressor Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft Suppressors",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_extendedclip"] = {
--     label = "Extended Clip Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft Extended Clips",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_scope"] = {
--     label = "Scope Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft Scopes",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_specialcarbine"] = {
--     label = "Special Carbine Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Special Carbine",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_assaultrifle"] = {
--     label = "Assault Rifle Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Assault Rifle",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_advancedrifle"] = {
--     label = "Advanced Rifle Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Advanced Rifle",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_sawnoffshotgun"] = {
--     label = "Sawn Off Shotgun Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Sawn Off Shotgun",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_machinepistol"] = {
--     label = "Machine Pistol Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Machine Pistol",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },

-- ["blueprint_microsmg"] = {
--     label = "Micro SMG Blueprint",
--     weight = 4000,
--     stack = true,
--     close = true,
--     description = "A Blueprint to craft a Micro SMG",
--     client = {
--         image = "pure_blueprint.png",
--     }
-- },
