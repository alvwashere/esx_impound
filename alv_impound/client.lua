Citizen.CreateThread(function()
  while true do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(4)
  end
end)

RegisterNetEvent('impound')
AddEventHandler('impound', function()
  local ped = GetPlayerPed(-1)
  local pos = {
    x = 0.0,
    y = 0.0,
    z = 0.0
  } -- you can do the impound coords im not loading in for that
  
  if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
    local pos1 = GetEntityCoords(ped)

  if IsPedSittingInAnyVehicle(ped) then
    local veh = GetVehiclePedIsIn(ped, false)

    if (GetPedInVehicleSeat(veh, -1) == ped) then
      SetEntityCoords(veh, pos.x, pos.y, pos.z)
      SetEntityCoords(ped, pos1) -- makes sure the cop isnt teleported with the car
    else
      ESX.ShowNotification("You are not in a vehicle.")
    end
  else
    ESX.ShowNotification("No, no impounding while dead.")
  end
end)