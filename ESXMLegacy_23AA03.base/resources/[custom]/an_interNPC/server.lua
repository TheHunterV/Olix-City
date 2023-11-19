if Config.usingESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
else
	QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent("an_interNPC:rewardPlayer", function(rewards)
    local src = source
    local chance = math.random(1,10)
    for k,v in pairs(rewards) do
        if v.chance >= chance then
            local amount = math.random(v.minAmount,v.maxAmount)
            if Config.usingESX then
                local xPlayer = ESX.GetPlayerFromId(src)
                if v.item == "money" then
                    xPlayer.addMoney(amount)
                    TriggerClientEvent("an_interNPC:notify", src, Config.messages["rob_loot_rewards"].." $"..amount, "success", 15000)
                else
                    xPlayer.addInventoryItem(v.item, amount)
                    TriggerClientEvent("an_interNPC:notify", src, Config.messages["rob_loot_rewards"].." x"..amount.." "..ESX.GetItemLabel(v.item), "success", 15000)
                end
            else
                local Player = QBCore.Functions.GetPlayer(src)
                if v.item == "money" then
                    Player.Functions.AddMoney('cash', amount, "[AN] NPC Interactions")
                    TriggerClientEvent("an_interNPC:notify", src, Config.messages["rob_loot_rewards"].." $"..amount, "success", 15000)
                else
                    Player.Functions.AddItem(v.item, amount)
                    TriggerClientEvent("an_interNPC:notify", src, Config.messages["rob_loot_rewards"].." x"..amount.." "..QBCore.Shared.Items[v.item]["label"], "success", 15000)
                end
            end
            return
        end
    end
    TriggerClientEvent("an_interNPC:notify", src, Config.messages["no_rewards"], "error", 15000)
end)

RegisterServerEvent('an_interNPC:notifycops')
AddEventHandler('an_interNPC:notifycops', function(msg,coords)
	TriggerClientEvent('an_interNPC:notifycopsCL', -1, msg, coords)
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(30000) -- Update the amount of cops every 30 seconds

		if Config.minRobCops > 0 or Config.minLootCops > 0 then
			local cops = 0
			cops = GetCurrentCops()
            TriggerClientEvent('an_interNPC:updatecops', -1, cops)
		end

	end
end)

function GetCurrentCops()
    local amount = 0
    if Config.usingESX then
        if Config.useLegacy then
            local xPlayers = ESX.GetExtendedPlayers()
            for _, xPlayer in pairs(xPlayers) do
                if Config.policeJobs[xPlayer.job.name] then
                    amount += 1
                end
            end
            return amount
        else
            local xPlayers = ESX.GetPlayers()
            for i=1, #xPlayers, 1 do
            	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            	if Config.policeJobs[xPlayer.job.name] then
            		amount += 1
            	end
            end
            return amount
        end
    else
        local players = QBCore.Functions.GetQBPlayers()
        for _, v in pairs(players) do
            if v and v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
                amount += 1
            end
        end
        return amount
    end
end