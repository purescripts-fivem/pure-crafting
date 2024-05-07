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
    return player.getInventoryItem(item).count
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
	('blueprint_lockpick', 'Lockpick Blueprint', 2)
;
]]--