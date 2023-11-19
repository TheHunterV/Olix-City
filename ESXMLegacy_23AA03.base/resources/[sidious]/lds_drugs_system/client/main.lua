ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	if(config.enableIngredientsBlips) then
		-- Blips
		for ingredient, coord in pairs(config.ingredientsCoords) do
			ESX.TriggerServerCallback('lds_drugs_system:getItemLabel', function(ingredientLabel)
				local blip = AddBlipForCoord(coord.x, coord.y, coord.z)
				SetBlipSprite(blip, 51)
				SetBlipDisplay(blip,  3)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(ingredientLabel)
				EndTextCommandSetBlipName(blip)

				SetBlipScale(blip, 0.8)
			end, ingredient)
		end
	end

	if(config.enableLabsBlips) then
		for _, coord in pairs(config.Labs) do
			local blip = AddBlipForCoord(coord.x, coord.y, coord.z)
			SetBlipSprite(blip, 270)
			SetBlipDisplay(blip,  3)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Laboratory")
			EndTextCommandSetBlipName(blip)

			SetBlipScale(blip, 0.8)
		end
	end
end)

local function sparks()
	local plyCoords = GetEntityCoords(PlayerPedId())

	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(0)
		end
	end

	Citizen.CreateThread(function() 
		for i=1, 2 do
			SetPtfxAssetNextCall("core")

			StartNetworkedParticleFxNonLoopedAtCoord("sp_foundry_sparks", plyCoords, -0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
			Citizen.Wait(500)
		end
	end)

	local animDict = "anim@heists@ornate_bank@thermal_charge"
	local anim = "cover_eyes_loop"

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(0)
		RequestAnimDict(animDict)
	end

	TaskPlayAnim(PlayerPedId(), animDict, anim, 3.0, -1.0, 2000, 1, 1.0, 0, 0, 0)

    if(config.enableFireOnError) then
        StartScriptFire(plyCoords - vector3(0.0, 0.0, 1.0), 4, false)
    end
end

RegisterNetEvent('lds_drugs_system:wrongIngredients')
AddEventHandler('lds_drugs_system:wrongIngredients', function()
	sparks()
end)

function correctIngredients(drugName)
	local plyCoords = GetEntityCoords(PlayerPedId())

	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(0)
		end
	end

	SetPtfxAssetNextCall("core")
	local r = math.random(0, 255) + 0.0
	local g = math.random(0, 255) + 0.0
	local b = math.random(0, 255) + 0.0
	SetParticleFxNonLoopedColour(r, g, b, 0)

	local particle = StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", plyCoords, 0.0, 0.0, 0.0, 0.40, false, false, false, false)

	local animDict = "missmechanic"
	local anim = "work2_in"

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(0)
		RequestAnimDict(animDict)
	end

	local initialAnimationTime = 2000

	TaskPlayAnim(PlayerPedId(), animDict, anim, 3.0, -1.0, initialAnimationTime, 1, 1.0, 0, 0, 0)
	Citizen.Wait(initialAnimationTime)
	local anim2 = "work2_base"

    local drugCreationTime = config.drugsCreationTime[drugName] or 1000

	TaskPlayAnim(PlayerPedId(), animDict, anim2, 3.0, -1.0, drugCreationTime - initialAnimationTime, 1, 1.0, 0, 0, 0)
end

RegisterNetEvent('lds_drugs_system:correctIngredients')
AddEventHandler('lds_drugs_system:correctIngredients', function(drugName, drugLabel)
	correctIngredients(drugName)
end)

function openMenu()
    ESX.UI.Menu.CloseAll()
    ESX.TriggerServerCallback('lds_drugs_system:getDrugsElements', function(drugsElements)
        
        if(next(drugsElements) == nil) then
            ESX.ShowNotification(getLocalizedText("nothing_useful"))
            isLabOpen = false
            return
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_crafting', {
            title = getLocalizedText('lab'),
            align = 'bottom-right',
            elements = drugsElements
        },
            function(data, menu)
                local ingredientsToUse = {}

                for k, v in pairs(data.elements) do
                    if(v.value > 0) then
                        ingredientsToUse[v.id] = v.value
                    end
                end

                TriggerServerEvent('lds_drugs_system:useDrugsIngredients', ingredientsToUse, currentLabId)
                isLabOpen = false
                menu.close()
            end,
            function(data, menu)
                isLabOpen = false
                menu.close()
            end
        )
    end)
end