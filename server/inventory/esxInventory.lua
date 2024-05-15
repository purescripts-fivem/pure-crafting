if Config.inventory ~= 'esx' then return end

function removeItem(source, item, amount)
    local player = ESX.GetPlayerFromId(source)
    return player.removeInventoryItem(item, amount)
end

function checkItem(source, item, amount)
    local player = ESX.GetPlayerFromId(source)
    local esxAmount = player.getInventoryItem(item).count
    if esxAmount >= amount then return true end
    return false
end

function getItems(source, item)
    local player = ESX.GetPlayerFromId(source)
    local amt = {
        amount = 0,
    }
    if not player.getInventoryItem(item) then return amt end
    local plyerAmt = player.getInventoryItem(item).count
    amt.amount = plyerAmt
    return amt
end

function giveItem(source, item, amount)
    local player = ESX.GetPlayerFromId(source)
    return player.addInventoryItem(item, amount)
end

function createItem(name, trigger, data)
    ESX.RegisterUsableItem(name, function(source)
        TriggerClientEvent(trigger, source, data)
    end)
end

-- THESE ARE EXAMPLES OF BLUEPRINTS / FOLLOW THE DOCS FOR MORE INFORMATION

--[[
INSERT INTO `items` (name, label, weight) VALUES
	('weap_bench', 'Weapons Bench', 2),
    ('misc_bench', 'Misc Bench', 2),
    ('blueprint_molotov', 'Molotov Blueprint', 2),
    ('blueprint_grip', 'Grip Blueprint', 2),
    ('blueprint_suppressor', 'Suppressor Blueprint', 2),
    ('blueprint_extendedclip', 'Extended Clip Blueprint', 2),
    ('blueprint_scope', 'Scope Blueprint', 2),
    ('blueprint_specialcarbine', 'Special Carbine Blueprint', 2),
    ('blueprint_assaultrifle', 'Assaultrifle Blueprint', 2),
    ('blueprint_advancedrifle', 'Advanced Rifle Blueprint', 2),
    ('blueprint_sawnoffshotgun', 'Sawn Off Shotgun Blueprint', 2),
    ('blueprint_machinepistol', 'Machine Pistol Blueprint', 2),    
    ('blueprint_microsmg', 'Micro SMG Blueprint', 2),  
]]--