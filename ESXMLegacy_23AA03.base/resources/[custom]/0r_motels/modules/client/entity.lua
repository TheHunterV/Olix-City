local FrozenEntities = {}
local Entities = {}
local FreeAimInfoBoxX       = 0.60      -- X-axis (0.0 being left, 1.0 being right position of the screen)
local FreeAimInfoBoxY       = 0.02      -- Y-axis (0.0 being up, 1.0 being down position of the screen)
local useKph                = true      -- True to display KPH or false to display MPH
local hashes_file = LoadResourceFile(GetCurrentResourceName(), "hash.json")
local hashes = json.decode(hashes_file)

RoundFloat = function(number, num)
    return math.floor(number*math.pow(10,num)+0.5) / math.pow(10,num)
end

RoundVector3 = function(vector, num)
    return 'vector3('..RoundFloat(vector.x, num).. ', '..RoundFloat(vector.y, num).. ', '..RoundFloat(vector.z, num)..')'
end


RelationshipTypes = { ['0'] = 'Companion', ['1'] = 'Respect', ['2'] = 'Like', ['3'] = 'Neutral', ['4'] = 'Dislike', ['5'] = 'Hate', ['255'] = 'Pedestrians' }
GetPedRelationshipType = function(value)
    value = tostring(value)
    return RelationshipTypes[value] or "Unknown"
end

RotationToDirection = function(rotation)
	local adjustedRotation = {
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction = {
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

GetEntityInfo = function(entity)
    local entityHash    = tostring(GetEntityModel(entity))
    local entityName    = hashes[entityHash] or "Unkown"
    local entityData    = {
        '~y~ '..Config.Lang[Config.Locale]["EntitInfos"],
        'Hash: ~y~'..entityHash,
        ' ',
        'Name: '..' ~y~'.. entityName,
        -- 'ID: '..' ~y~'..NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity) or "Not Registered",
        -- 'Owner: '..' ~y~'..GetPlayerServerId(NetworkGetEntityOwner(entity)),
        ' ',
        Config.Lang[Config.Locale]["PressEDoor"],

    }

    local entityCoords = GetEntityCoords(entity)

    if IsControlJustReleased(0, 18) then
        ToggleEntityFreeView()
        SendNUIMessage({
            type = 'SetValue',
            value = entityHash
        })
        SetNuiFocus(true, true)
        MLOEditor = false
    end

    return entityData
end

DrawEntityViewText = function(entity)
    local data              = GetEntityInfo(entity)
    local count             = #data

    local posX              = FreeAimInfoBoxX
    local posY              = FreeAimInfoBoxY
    local titleSpacing      = 0.03
    local textSpacing       = 0.022
    local titeLeftMargin    = 0.05
    local paddingTop        = 0.02
    local paddingLeft       = 0.005
    local rectWidth         = 0.18
    local heightOfContent   = (((count) * textSpacing)+titleSpacing)/count
    local rectHeight        = ((count-1) * heightOfContent)+paddingTop

    DrawRect(posX+(rectWidth/2), posY+((rectHeight/2)-posY/2), rectWidth, rectHeight, 11, 11, 11, 200)

    for k, v in ipairs(data) do
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextDropshadow(1.0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextColour(255, 255, 255, 215)
        SetTextJustification(1)
        SetTextEntry("STRING")
        AddTextComponentString(v)
        if k == 1 then
            SetTextScale(0.50, 0.50)
            DrawText(posX+titeLeftMargin, posY)
            posY = posY + titleSpacing
        else
            SetTextScale(0.35, 0.35)
            DrawText(posX+paddingLeft, posY)
            posY = posY + textSpacing
        end
    end
end

DrawEntityViewTextInWorld = function(entity, coords)
    local onScreen, posX, posY = World3dToScreen2d(coords.x, coords.y, coords.z)
    if onScreen then
        local data = GetEntityInfo(entity)
        local count = #data
        local textOffsetY   = 0.015
        local leftPadding   = 0.005
        local topPadding    = 0.01
        local botPadding    = 0.02
        local offSetCount   = (((count-2) * textOffsetY))/count
        local rectWidth     = 0.12
        local rectHeight    = ((count) * offSetCount)+botPadding

        DrawRect(posX, posY, rectWidth, rectHeight, 11, 11, 11, 200)

        for k, v in ipairs(data) do
            if k ~= 1 and k ~= 2 then
                SetTextScale(0.25, 0.25)
                SetTextFont(4)
                SetTextDropshadow(1.0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)
                SetTextColour(255, 255, 255, 215)
                SetTextJustification(1)
                SetTextEntry("STRING")
                AddTextComponentString(v)
                DrawText(posX-rectWidth/2+leftPadding, posY-rectHeight/2+topPadding)
                posY = posY + textOffsetY
            end
        end
    end
end

GetVehicle = function(playerCoords)
    local handle, vehicle = FindFirstVehicle()
    local success
    local rveh = nil
    repeat
        if vehicle ~= FreeAimEntity then
            local pos = GetEntityCoords(vehicle)
            local distance = #(playerCoords-pos)
            if distance < EntityViewDistance and distance > 5.0 then
                DrawEntityBoundingBox(vehicle)
            elseif distance < 5.0 then
                rveh = vehicle
                DrawEntityViewTextInWorld(vehicle, pos)
            end
        end
        success, vehicle = FindNextVehicle(handle)
    until not success
    EndFindVehicle(handle)
    return rveh
end

GetObject = function(playerCoords)
    local handle, object = FindFirstObject()
    local success
    local robject = nil
    repeat
        if object ~= FreeAimEntity then
            local pos = GetEntityCoords(object)
            local distance = #(playerCoords-pos)
            if distance < EntityViewDistance and distance > 5.0 then
                DrawEntityBoundingBox(object)
            elseif distance < 5.0 then
                robject = object
                DrawEntityViewTextInWorld(object, pos)
            end
        end
        success, object = FindNextObject(handle)
    until not success
    EndFindObject(handle)
    return robject
end

GetNPC = function(playerCoords)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    repeat
        if ped ~= FreeAimEntity then
            local pos = GetEntityCoords(ped)
            local distance = #(playerCoords-pos)
            if CanEntityBeUsed(ped) then
                if distance < EntityViewDistance and distance > 5.0 then
                    DrawEntityBoundingBox(ped)
                elseif distance < 5.0 then
                    rped = ped
                    DrawEntityViewTextInWorld(ped, pos)
                end
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return rped
end

RotationToDirection = function(rotation)
	local adjustedRotation = {
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction = {
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

RayCastGamePlayCamera = function(distance)
    -- Checks to see if the Gameplay Cam is Rendering or another is rendering (no clip functionality)
    local currentRenderingCam = false
    if not IsGameplayCamRendering() then
        currentRenderingCam = GetRenderingCam()
    end

    local cameraRotation = not currentRenderingCam and GetGameplayCamRot() or GetCamRot(currentRenderingCam, 2)
    local cameraCoord = not currentRenderingCam and GetGameplayCamCoord() or GetCamCoord(currentRenderingCam)
	local direction = RotationToDirection(cameraRotation)
	local destination =	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local _, b, c, _, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

DrawEntityBoundingBox = function(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR = {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local _, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL = {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local _, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 = {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 = {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 = {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 = {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 = {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 = {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }
    color = (color == nil and {r = 255, g = 255, b = 255, a = 255} or color)
    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end
