StartPayCheck = function()
	Citizen.CreateThread(function()
		while not GetResourceState('lds_jobs') do Wait(1000) end
		while true do
			Citizen.Wait(Config.PaycheckInterval)
			local xPlayers = ESX.GetExtendedPlayers()
			for _, xPlayer in pairs(xPlayers) do
				local job     = xPlayer.job.name
				local salary  = xPlayer.job.grade_salary

				if salary > 0 then
					if job == 'unemployed' then -- unemployed
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
					elseif Config.EnableSocietyPayouts then -- possibly a society
						if tonumber(exports.lds_jobs:JobMoney(job,true).money) >= salary then -- does the society money to pay its employees?
							xPlayer.addAccountMoney('bank', salary)
							removemoney = exports.lds_jobs:removeMoney(tonumber(salary),job,source,'money',true,true)

							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
						else
							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
						end
					else -- generic job
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
					end
				end
			end
		end
	end)
end
