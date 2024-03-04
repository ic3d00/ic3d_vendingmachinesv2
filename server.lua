Citizen.CreateThread(function()
	if not Config.NewESX then
		ESX = nil
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
end)

RegisterServerEvent('ic3d_vendingmachines:buydrinkserversprunk')
AddEventHandler('ic3d_vendingmachines:buydrinkserversprunk', function()
  local item = Config.ItemSprunk
  local price = Config.PriceSprunk
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= price then
			if xPlayer.canCarryItem(item, 1) then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(item, 1)
				xPlayer.showNotification(_U('bought', 1, item, ESX.Math.GroupDigits(price)))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			local missingMoney = price - xPlayer.getMoney()
			xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		end
end)

RegisterServerEvent('ic3d_vendingmachines:buydrinkserverecola')
AddEventHandler('ic3d_vendingmachines:buydrinkserverecola', function()
  local item = Config.ItemECola
  local price = Config.PriceECola
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= price then
			if xPlayer.canCarryItem(item, 1) then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(item, 1)
				xPlayer.showNotification(_U('bought', 1, item, ESX.Math.GroupDigits(price)))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			local missingMoney = price - xPlayer.getMoney()
			xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		end
end)

RegisterServerEvent('ic3d_vendingmachines:buydrinkserverherculespowerfuel')
AddEventHandler('ic3d_vendingmachines:buydrinkserverherculespowerfuel', function()
  local item = Config.ItemHerculesPowerFuel
  local price = Config.PriceHerculesPowerFuel
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= price then
			if xPlayer.canCarryItem(item, 1) then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(item, 1)
				xPlayer.showNotification(_U('bought', 1, item, ESX.Math.GroupDigits(price)))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			local missingMoney = price - xPlayer.getMoney()
			xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		end
end)

RegisterServerEvent('ic3d_vendingmachines:buydrinkserverorangotang')
AddEventHandler('ic3d_vendingmachines:buydrinkserverorangotang', function()
  local item = Config.ItemOrangOTang
  local price = Config.PriceOrangOTang
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= price then
			if xPlayer.canCarryItem(item, 1) then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(item, 1)
				xPlayer.showNotification(_U('bought', 1, item, ESX.Math.GroupDigits(price)))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			local missingMoney = price - xPlayer.getMoney()
			xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		end
end)
