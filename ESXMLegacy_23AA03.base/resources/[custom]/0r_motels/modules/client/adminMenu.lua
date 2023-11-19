CreateMotelEditorNow = false
CreateRoomEditorNow = false
MLOEditor = false

local receptionCoord = nil
local roomEnterCoord = nil
local stashCoord = nil
local wardrobeCoord = nil
local markingObject = nil
local EntityFreeAim = false
local EntityViewEnabled = false 

local setReceptionCoord = nil
local setGarageCoord = nil

local function LoadSelectedMotel(data)
    local SelectedMotelData = GetCodeFromMotel(data.mcode)
    SendNUIMessage({
        type = 'SelectedMotelDataLoad',
        lang = Config.Lang[Config.Locale],
        data = SelectedMotelData
    })
end

local function OpenAdminMotel(bool)
    if bool and not CreateMotelEditorNow then
        SendNUIMessage({
            type = 'OpenAdminMotel',
            Motels = Config.Motels,
            Mlos = Config.RoomTypes,
            corridors = Config.Corridor,
            Lang = Config.Lang[Config.Locale]
        })
        SetNuiFocus(true, true)
    else
        Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["NotAuthorized"], time = 4})
    end
end

local function LoadNewAdmin(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateMotelOwner', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["SuccessMotelOwnerUpdate"], time = 3})
            local datax = {mcode = data.mcode}
            OpenAdminMotel(true)
            LoadSelectedMotel(datax)
        end
    end, data)
end

function AllPlayers()
    Resmon.Lib.Callback.Client('0R:Motels:Server:GetAllPlayers', function(callback)

        if callback then
            for k,v in pairs(callback) do
                local playerIdx = GetPlayerFromServerId(v.source)
                local ped = GetPlayerPed(playerIdx)
                v.img = GetMugShotBase64(ped)
            end

            SendNUIMessage({
                type = 'SendPlayers',
                p = callback,
                bufarkli = false
            })
        end
    end)
end

local function LoadSelectedMotelRoomData(data)
    local SelectedMotel = GetCodeFromMotel(data.mcode)
    local SelectedMotelRoom = SelectedMotel.rooms[tonumber(data.id)]

    local temp = Config.RoomTypes
    local Bills = {}

    for k,v in pairs(SelectedMotel.bills) do
        if v.RoomId == tonumber(data.id) then
            table.insert(Bills, v)
        end
    end
    
    SendNUIMessage({
        type = 'OpenRoomEditor',
        data = SelectedMotelRoom,
        roomtype = temp,
        faturalar = Bills
    })

    temp = {}
end

local function UpdateAllData(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateMotelData', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["MotelDataUpdated"], time = 3})
            if not data.yumurcak then
                OpenAdminMotel(true)
                LoadSelectedMotel({mcode = data.mcode})
            else
                local motelID = GetCodeFromMotelId(data.mcode)
                OpenBossMenu({id = motelID})
            end
        end
    end, data)
end

local function DeleteMotel(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:DeleteMotel', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["DeletedMotel"], time = 3})
            OpenAdminMotel(true)
        end
    end, data)
end


local function EnterRoomCoord()
    CreateRoomEditorNow = true
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["EnterRoomCoord"], type = 'success', text = Config.Lang[Config.Locale]["info3"], button = Config.CreateMotelEditorKeys["reception"][1], time = 7})
    while CreateRoomEditorNow do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        Sleep = 5
        local pedCoords = GetEntityCoords(pedPlayer)
        if IsControlJustReleased(0, 191) then
            roomEnterCoord = pedCoords
            local sendCoord = "vector3("..pedCoords.x..", "..pedCoords.y..", "..pedCoords.z..")"
            SendNUIMessage({type = 'FullCoord', coord = sendCoord})
            SetNuiFocus(true, true)
            CreateRoomEditorNow = false
        end
        Citizen.Wait(Sleep)
    end
end

local function EnterRoomCoord2()
    CreateRoomEditorNow = true
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["EnterRoomCoord"], type = 'success', text = Config.Lang[Config.Locale]["info3"], button = Config.CreateMotelEditorKeys["reception"][1], time = 7})
    while CreateRoomEditorNow do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        Sleep = 5
        local pedCoords = GetEntityCoords(pedPlayer)
        if IsControlJustReleased(0, 191) then
            roomEnterCoord = pedCoords
            local sendCoord = "vector3("..pedCoords.x..", "..pedCoords.y..", "..pedCoords.z..")"
            SendNUIMessage({type = 'FullCoord2', coord = sendCoord})
            SetNuiFocus(true, true)
            CreateRoomEditorNow = false
        end
        Citizen.Wait(Sleep)
    end
end

local function WardrobeCoordEnter()
    CreateRoomEditorNow = true
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["EnterRoomCoord"], type = 'success', text = Config.Lang[Config.Locale]["info6"], button = Config.CreateMotelEditorKeys["reception"][1], time = 7})
    while CreateRoomEditorNow do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        Sleep = 5
        local pedCoords = GetEntityCoords(pedPlayer)
        if IsControlJustReleased(0, 191) then
            wardrobeCoord = pedCoords
            local sendCoord = "vector3("..pedCoords.x..", "..pedCoords.y..", "..pedCoords.z..")"
            SendNUIMessage({type = 'FullCoord4', coord = sendCoord})
            SetNuiFocus(true, true)
            CreateRoomEditorNow = false
        end
        Citizen.Wait(Sleep)
    end
end

local function EnterStashCoord()
    CreateRoomEditorNow = true
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["EnterRoomCoord"], type = 'success', text = Config.Lang[Config.Locale]["info5"], button = Config.CreateMotelEditorKeys["reception"][1], time = 7})
    while CreateRoomEditorNow do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        Sleep = 5
        local pedCoords = GetEntityCoords(pedPlayer)
        if IsControlJustReleased(0, 191) then
            stashCoord = pedCoords
            local sendCoord = "vector3("..pedCoords.x..", "..pedCoords.y..", "..pedCoords.z..")"
            SendNUIMessage({type = 'FullCoord3', coord = sendCoord})
            SetNuiFocus(true, true)
            CreateRoomEditorNow = false
        end
        Citizen.Wait(Sleep)
    end
end


local function CreateMotelRoom(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:AddMotelRoom', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["CreatedRoom"], time = 4})
            OpenAdminMotel(true)
            LoadSelectedMotel({mcode = data.mcode})
        end
    end, data, roomEnterCoord)
end

local function UpdateMotelRoomPrice(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:MotelRoomPriceUpdate', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["RentPriceUpdate"], time = 4})
            if not data.yumurcak then
                OpenAdminMotel(true)
                LoadSelectedMotel({mcode = data.mcode})
            end
        end
    end, data)
end

local function CloseUI()
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(700)
    ReceptionArea()
end

local function DeleteMotelRoom(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:DeleteMotelRoom', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["RentPriceUpdate"], time = 4})
            OpenAdminMotel(true)
            LoadSelectedMotel({mcode = data.mcode})
        end
    end, data)
end

local function LoadRoomInterior(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateRoomInterior', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["UpdateInterior"], time = 4})
            LoadSelectedMotelRoomData({mcode = data.mcode, id = tonumber(data.roomid)})
        end
    end, data)
end

local function OpenRoomMLOEditor()
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["EnterRoomCoord"], type = 'success', text = Config.Lang[Config.Locale]["info4"], button = Config.CreateMotelEditorKeys["reception"][1], time = 10})
    MLOEditor = true
    ToggleEntityFreeView()
end

ToggleEntityFreeView = function()
    EntityFreeAim = not EntityFreeAim
    if EntityFreeAim and not EntityViewEnabled then
        RunEntityViewThread()
    end
end

RegisterCommand('sev', function()
    ToggleEntityFreeView()
end)

RunEntityViewThread = function()
    EntityViewEnabled = true
    Citizen.CreateThread(function()
        while EntityViewEnabled do
            Citizen.Wait(0)
            local playerPed     = PlayerPedId()
            local playerCoords  = GetEntityCoords(playerPed)
            
            if EntityObjectView then
                GetObject(playerCoords)
            end

            if EntityFreeAim then
                local color = {r = 255, g = 255, b = 255, a = 200}
                local position = GetEntityCoords(playerPed)
                local hit, coords, entity = RayCastGamePlayCamera(1000.0)
                -- If entity is found then verify entity
                if hit and IsEntityAnObject(entity) then
                    color = {r = 0, g = 255, b = 0, a = 200}
                    FreeAimEntity = entity
                    DrawEntityBoundingBox(entity, color)
                    DrawEntityViewText(entity)
                else
                    FreeAimEntity = nil
                end

                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
            end

            if EntityPedView == false and EntityObjectView == false and EntityVehicleView == false and EntityFreeAim == false then
                EntityViewEnabled = false
            end
        end
    end)
end

local function JsNotify(data)
    data.time = tonumber(data.time)
    Notify({title = data.title, type = data.type, text = data.text, time = data.time})
end

local function KickMotelRoom(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:KickMotelRoom', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["SuccessKick"], time = 4})
            if not data.yumurcak then
                OpenAdminMotel(true)
                LoadSelectedMotel({mcode = data.mcode})
            else
                local motelID = GetCodeFromMotelId(data.mcode)
                OpenBossMenu({id = motelID})
            end
        end
    end, data)
end

local function CreateMotelRoomTeleport(data)
    local devamEdilemez = false
    for k,v in pairs(Config.RoomTypes) do
        if string.lower(v.RoomLabel) == string.lower(data.roomtip) then
            devamEdilemez = true
        end
    end
    if devamEdilemez then
        Resmon.Lib.Callback.Client('0R:Motels:Server:AddMotelRoomTeleport', function(callback)
            if callback then
                Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["CreatedRoom"], time = 4})
                OpenAdminMotel(true)
                DoorDataLoad()
                LoadSelectedMotel({mcode = data.mcode})
            end
        end, data, roomEnterCoord, stashCoord, wardrobeCoord)
    else
        Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'error', text = Config.Lang[Config.Locale]["UndefinedRoom"], time = 4})
    end
end

local function SetReceptionCoords()
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["CreateReception"], type = 'info', text = Config.Lang[Config.Locale]["info1"], time = 5})
    CreateMotelEditorNow = true 
    while CreateMotelEditorNow do
        Wait(1)
        local pedCoord = GetEntityCoords(PlayerPedId())
        setReceptionCoord = pedCoord
        if IsControlJustReleased(0, 191) then
            CreateMotelEditorNow = false
            SetNuiFocus(true, true)
            SendNUIMessage({
                type = 'setReception',
                coord = 'vector3('..pedCoord.x..', '..pedCoord.y..', '..pedCoord.z..')'
            })
        end
    end
end

local function SetGarageCoords()
    SetNuiFocus(false, false)
    Notify({title = Config.Lang[Config.Locale]["CreateReception"], type = 'info', text = Config.Lang[Config.Locale]["info1"], time = 5})
    CreateMotelEditorNow = true 
    while CreateMotelEditorNow do
        Wait(1)
        local pedCoord = GetEntityCoords(PlayerPedId())
        setGarageCoord = pedCoord
        if IsControlJustReleased(0, 191) then
            CreateMotelEditorNow = false
            SetNuiFocus(true, true)
            SendNUIMessage({
                type = 'setGarage',
                coord = 'vector3('..pedCoord.x..', '..pedCoord.y..', '..pedCoord.z..')'
            })
        end
    end
end

local function CreateMotelNew(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:CreateNewMotel', function(callback)
        if callback then
            OpenAdminMotel(true)
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["CreatedMotel"], time = 4})
        end
    end, data, setReceptionCoord, setGarageCoord)
end

RegisterNUICallback('CreateMotelRoomTeleport', CreateMotelRoomTeleport)
RegisterNUICallback('WardrobeCoordEnter', WardrobeCoordEnter)
RegisterNUICallback('EnterStashCoord', EnterStashCoord)
RegisterNUICallback('EnterRoomCoord2', EnterRoomCoord2)
RegisterNUICallback('OpenRoomMLOEditor', OpenRoomMLOEditor)
RegisterNUICallback('LoadRoomInterior', LoadRoomInterior)
RegisterNUICallback('KickMotelRoom', KickMotelRoom)
RegisterNUICallback('DeleteMotelRoom', DeleteMotelRoom)
RegisterNUICallback('UpdateMotelRoomPrice', UpdateMotelRoomPrice)
RegisterNUICallback('SetReceptionCoords', SetReceptionCoords)
RegisterNUICallback('SetGarageCoords', SetGarageCoords)
RegisterNUICallback('LoadSelectedMotelRoomData', LoadSelectedMotelRoomData)
RegisterNUICallback('CreateMotelRoom', CreateMotelRoom)
RegisterNUICallback('JsNotify', JsNotify)
RegisterNUICallback('EnterRoomCoord', EnterRoomCoord)
RegisterNUICallback('DeleteMotel', DeleteMotel)
RegisterNUICallback('UpdateAllData', UpdateAllData)
RegisterNUICallback('CreateMotelNew', CreateMotelNew)
RegisterNUICallback('LoadNewAdmin', LoadNewAdmin)
RegisterNUICallback('AllPlayers', AllPlayers)
RegisterNUICallback('LoadSelectedMotel', LoadSelectedMotel)
RegisterNUICallback('CloseUI', CloseUI)
RegisterNetEvent('0R:Motels:Client:OpenAdminMenu', OpenAdminMotel)
