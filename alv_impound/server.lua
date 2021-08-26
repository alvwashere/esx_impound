ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('impound', function()
  local src = source
  local xPlayer = ESX.GetPlayerFromId(src)
  local xJob = xPlayer.getJob()

  if xJob == 'police' then
    TriggerClientEvent('impound')
  else
    TriggerClientEvent('esx:showNotification', xPlayer, "Insufficient Permissions my guy")
  end
end, false)