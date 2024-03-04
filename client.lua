local display = false -- NUI Display

Citizen.CreateThread(function()
  if not Config.NewESX then
    ESX = nil
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
    end
end)

-- ESC close NUI function
RegisterNUICallback("exit", function(data) 
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

-- Disable controls while on the NUI
Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC Map/Infos
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

-- Buy when button is clicked
RegisterNUICallback("buydrinksprunk", function()
Citizen.Wait(2000)
  TriggerServerEvent('ic3d_vendingmachines:buydrinkserversprunk')
  --  SetDisplay(false)
end)
RegisterNUICallback("buydrinkecola", function()
Citizen.Wait(2000)
  TriggerServerEvent('ic3d_vendingmachines:buydrinkserverecola')
   -- SetDisplay(false)
end)

RegisterNUICallback("buydrinkherculespowerfuel", function()
Citizen.Wait(2000)
  TriggerServerEvent('ic3d_vendingmachines:buydrinkserverherculespowerfuel')
   -- SetDisplay(false)
end)
RegisterNUICallback("buydrinkorangotang", function()
Citizen.Wait(2000)
  TriggerServerEvent('ic3d_vendingmachines:buydrinkserverorangotang')
   -- SetDisplay(false)
end)



RegisterNUICallback("exit", function()
    SetDisplay(false)
end)

function nearvendingmachine()
    for k, v in pairs(Config.Vending) do
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local vending = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey(v.modelname), false, false, false)
        if DoesEntityExist(vending) then
            vendingPos = GetEntityCoords(vending)
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vendingPos.x, vendingPos.y, vendingPos.z, true)
            if dist <= Config.Range then
            return true
            end
        end
    end
end


-- Display the ShowHelpNotification
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if nearvendingmachine() then
            ESX.ShowHelpNotification(_U('nearprop'))
        if IsControlJustReleased(0, 38) then
            SetDisplay(not display)
            end
        end
    end
end)
