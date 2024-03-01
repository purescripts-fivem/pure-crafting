local currentResourceName = GetCurrentResourceName()

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