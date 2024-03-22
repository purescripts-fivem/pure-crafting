function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end

function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end