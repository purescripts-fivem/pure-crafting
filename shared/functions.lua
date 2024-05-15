local currentResourceName = GetCurrentResourceName()
CraftableItems = {}
Blueprints = {}
BlueprintsToSend = {}
local takenIds = {}

function debugPrint(...)
  if not Config.debug then return end
  local args <const> = { ... }

  local appendStr = ''
  for _, v in ipairs(args) do
    appendStr = appendStr .. ' ' .. tostring(v)
  end
  local msgTemplate = '^3[%s] | [%s] | ^0%s'
  local finalMsg = msgTemplate:format(currentResourceName, GetInvokingResource(), appendStr)
  print(finalMsg)
end

function getItemFromId(id, type)
  local item = CraftableItems[type][id]
  if not item then
    debugPrint('getItemFromId | failed - no item', id)
    return
  end
  return item
end

function getBlueprintsFromType(type)
  if not Config.previewBlueprints then
    return {}
  end
  local items = BlueprintsToSend[type]
  if not items then
    debugPrint('getBlueprintsFromType | failed - no items', type)
    return {}
  end
  return items
end

function getBlueprintFromId(id, type)
  local item = Blueprints[type][id]
  if not item then
    debugPrint('getBlueprintFromId | failed - no item', id)
    return
  end
  return item
end

function canUseBlueprint(type, id)
  local item = Blueprints[type][id]
  if not item then
    debugPrint('canUseBlueprint | failed - no item', id)
    return false
  end
  return true
end

function initCraftables()
  for k, v in pairs(Config.items) do
    CraftableItems[tostring(k)] = {}
    for i = 1, #v do
      local item = v[i]
      if not item.id then return end
      CraftableItems[tostring(k)][tostring(item.id)] = item
      takenIds[tostring(item.id)] = true
    end
  end

  for k, v in pairs(Config.blueprints.ids) do
    Blueprints[tostring(k)] = {}
    for i = 1, #v do
      local item = v[i]
      if not item.id then return end
      CraftableItems[tostring(k)][tostring(item.id)] = item
      Blueprints[tostring(k)][tostring(item.blueprintId)] = item
      takenIds[tostring(item.id)] = true
    end
  end

  for k, v in pairs(Config.blueprints.ids) do
    BlueprintsToSend[tostring(k)] = {}
    for i = 1, #v do
      local item = v[i]
      if not item.id then return end
      local newId = math.random(100, 99999)
      while takenIds[tostring(newId)] do
        newId = math.random(100, 99999)
      end
      local newTble = {
        id = newId,
        blueprintId = item.blueprintId,
        itemName = item.itemName,
        name = item.name,
        image = item.image,
        category = item.category,
        type = item.type,
        description = item.description,
        craftingTime = item.craftingTime,
        requiredItems = {}
      }
      BlueprintsToSend[tostring(k)][#BlueprintsToSend[tostring(k)] + 1] = newTble
    end
  end
end
    
CreateThread(function()
  initCraftables()
end)