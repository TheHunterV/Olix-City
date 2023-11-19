ESX 					= nil
TriggerEvent(Config.ESX.ESXSHAREDOBJECT, function(obj) ESX = obj end)

RegisterServerEvent("lds_fuel:payfuel")
AddEventHandler("lds_fuel:payfuel",function(price,jeryycan,vehicle,fuel,fuel2,key)
	local source = source
	local output = {}
	output = {
		['price'] = Config.stock.default_price,
	}
	local xPlayer = ESX.GetPlayerFromId(source)
	if price > 0 then
		local amount = 0
		money = xPlayer.getMoney()
		if money >= price then
			xPlayer.removeMoney(price)
			if jeryycan then
				xPlayer.removeWeapon('WEAPON_PETROLCAN')
				Wait(500)
				xPlayer.addWeapon('WEAPON_PETROLCAN',4500)
			else
				amount = math.floor(price/output.price)
				fuel = math.floor(fuel/output.price)
				TriggerClientEvent('lds_fuel:syncfuel',-1,vehicle,fuel)
				TriggerClientEvent("lds_fuel:Notify",source,"Paid <b>$"..price.." </b> in "..amount.." liters.")
			end
		else
			TriggerClientEvent('lds_fuel:insuficiente',source,vehicle,fuel2)
			TriggerClientEvent("lds_fuel:Notify",source,"Insuficient money.")
		end
	end
end)