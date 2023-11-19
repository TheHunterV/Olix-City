if not lib then return end

local Items = require 'modules.items.shared' --[[@as table<string, OxClientItem>]]

--- use array of single key value pairs to dictate order
---@param metadata string | table<string, string> | table<string, string>[]
---@param value? string
local function displayMetadata(metadata, value)
	local data = {}

	if type(metadata) == 'string' and value then data = { [1] = { metadata = metadata, value = value } }
	elseif metadata[1] then -- assume its an array
		for i = 1, #metadata do
			for k, v in pairs(metadata[i]) do
				data[i] = {
					metadata = k,
					value = v,
				}
			end
		end
	else
		for k, v in pairs(metadata) do
			data[#data+1] = {
				metadata = k,
				value = v,
			}
		end
	end

	SendNUIMessage({
		action = 'displayMetadata',
		data = data
	})
end
exports('displayMetadata', displayMetadata)

---@param _ table?
---@param name string?
---@return table?
local function getItem(_, name)
    if not name then return Items end

	if type(name) ~= 'string' then return end

    name = name:lower()

    if name:sub(0, 7) == 'weapon_' then
        name = name:upper()
    end

    return Items[name]
end

setmetatable(Items --[[@as table]], {
	__call = getItem
})

---@cast Items +fun(itemName: string): OxClientItem
---@cast Items +fun(): table<string, OxClientItem>

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local ox_inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------

Item('bandage', function(data, slot)
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health + maxHealth / 16)))
			lib.notify({ description = 'You feel better already' })
		end
	end)
end)

Item('armour', function(data, slot)
	if GetPedArmour(cache.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(cache.ped, 100)
			end
		end)
	end
end)

client.parachute = false
Item('parachute', function(data, slot)
	if not client.parachute then
		ox_inventory:useItem(data, function(data)
			if data then
				local chute = `GADGET_PARACHUTE`
				SetPlayerParachuteTintIndex(PlayerData.id, -1)
				GiveWeaponToPed(cache.ped, chute, 0, true, false)
				SetPedGadget(cache.ped, chute, true)
				lib.requestModel(1269906701)
				client.parachute = CreateParachuteBagObject(cache.ped, true, true)
				if slot.metadata.type then
					SetPlayerParachuteTintIndex(PlayerData.id, slot.metadata.type)
				end
			end
		end)
	end
end)

Item('phone', function(data, slot)
	local success, result = pcall(function()
		return exports.npwd:isPhoneVisible()
	end)

	if success then
		exports.npwd:setPhoneVisible(not result)
	end
end)

-- RECREATIONAL
Item('cigar', function(data, slot) -- Will lightly damage heath on use
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health - maxHealth / 32)))
			lib.notify({ description = 'You take the hit like a champ' })
		end
	end)
end)

Item('cigarette', function(data, slot) -- Will lightly damage heath on use
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health - maxHealth / 64)))
			lib.notify({ description = 'You take the hit like a champ' })
		end
	end)
end)

Item('vape', function(data, slot) -- Will lightly damage heath on use
	local maxHealth = GetEntityMaxHealth(cache.ped)
	local health = GetEntityHealth(cache.ped)
	ox_inventory:useItem(data, function(data)
		if data then
			SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health - maxHealth / 128)))
			lib.notify({ description = 'You take the hit like a champ' })
		end
	end)
end)

Item('clothing_bag', function(data, slot) -- opens burner phone menu 
	ox_inventory:useItem(data, function(data)
		TriggerEvent('ox_appearance:wardrobe')
	end)
end)

-- BODY ARMOR


Item('bodyarmor_1', function(data, slot) -- Adds 30% of body armor
	if GetPedArmour(cache.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(cache.ped, 30)
			end
		end)
	end
end)

Item('bodyarmor_2', function(data, slot) -- Adds 60% of body armor
	if GetPedArmour(cache.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(cache.ped, 60)
			end
		end)
	end
end)

Item('bodyarmor_3', function(data, slot) -- Adds 100% of body armor
	if GetPedArmour(cache.ped) < 100 then
		ox_inventory:useItem(data, function(data)
			if data then
				SetPlayerMaxArmour(PlayerData.id, 100)
				SetPedArmour(cache.ped, 100)
			end
		end)
	end
end)


-- DRUG EFFECTS


Item('weed_sativa', function(data, slot) -- causes drug effect
	ox_inventory:useItem(data, function(data)
		if data then
			SetTimecycleModifier("spectator6")
			AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
    		ShakeGameplayCam("DRUNK_SHAKE", 0.6)

			Citizen.Wait(90000) -- 60 seconds

			AnimpostfxStopAll()
    		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
			SetTimecycleModifierStrength(0.0)
		end
	end)
end)

Item('weed_indica', function(data, slot) -- causes drug effect
	ox_inventory:useItem(data, function(data)
		if data then
			SetTimecycleModifier("spectator2")
			AnimpostfxPlay("HeistCelebPass", 10000001, true)
    		ShakeGameplayCam("DRUNK_SHAKE", 0.6)

			Citizen.Wait(90000) -- 60 seconds

			AnimpostfxStopAll()
    		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
			SetTimecycleModifierStrength(0.0)
		end
	end)
end)

Item('weed_hybrid', function(data, slot) -- causes drug effect 
	ox_inventory:useItem(data, function(data)
		if data then
			SetTimecycleModifier("spectator2")
			AnimpostfxPlay("DrugsTrevorClownsFight", 10000001, true)
    		ShakeGameplayCam("DRUNK_SHAKE", 0.6)

			Citizen.Wait(90000) -- 60 seconds

			AnimpostfxStopAll()
    		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
			SetTimecycleModifierStrength(0.0)
		end
	end)
end)

-- TESTING CIG
Item('redwoods', function(data, slot)
    ox_inventory:useItem(data, function(data)
        if data then
            TriggerServerEvent('invsup:server:item:smoke_cig', data, {indent=true})
        end
    end)
end)

---------------------------------------------

Item('clothing', function(data, slot)
	local metadata = slot.metadata

	if not metadata.drawable then return print('Clothing is missing drawable in metadata') end
	if not metadata.texture then return print('Clothing is missing texture in metadata') end

	if metadata.prop then
		if not SetPedPreloadPropData(cache.ped, metadata.prop, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid prop for this ped')
		end
	elseif metadata.component then
		if not IsPedComponentVariationValid(cache.ped, metadata.component, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid component for this ped')
		end
	else
		return print('Clothing is missing prop/component id in metadata')
	end

	ox_inventory:useItem(data, function(data)
		if data then
			metadata = data.metadata

			if metadata.prop then
				local prop = GetPedPropIndex(cache.ped, metadata.prop)
				local texture = GetPedPropTextureIndex(cache.ped, metadata.prop)

				if metadata.drawable == prop and metadata.texture == texture then
					return ClearPedProp(cache.ped, metadata.prop)
				end

				-- { prop = 0, drawable = 2, texture = 1 } = grey beanie
				SetPedPropIndex(cache.ped, metadata.prop, metadata.drawable, metadata.texture, false);
			elseif metadata.component then
				local drawable = GetPedDrawableVariation(cache.ped, metadata.component)
				local texture = GetPedTextureVariation(cache.ped, metadata.component)

				if metadata.drawable == drawable and metadata.texture == texture then
					return -- item matches (setup defaults so we can strip?)
				end

				-- { component = 4, drawable = 4, texture = 1 } = jeans w/ belt
				SetPedComponentVariation(cache.ped, metadata.component, metadata.drawable, metadata.texture, 0);
			end
		end
	end)
end)

----------# Motel Key------------------------------------------

Item('motelcard', function(data, slot)
    TriggerEvent('0R:Motels:Client:OpenDoorNotTeleport', slot)
end)

-----------------------------------------------------------------------------------------------

exports('Items', function(item) return getItem(nil, item) end)
exports('ItemList', function(item) return getItem(nil, item) end)

return Items
