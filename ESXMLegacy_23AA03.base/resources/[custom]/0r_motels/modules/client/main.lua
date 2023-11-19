Resmon = exports["0r_lib"]:GetCoreObject()
Started = false 
OpenedMotelID = 0
StateD = nil
InMotel = nil
DonguDevam = false
Blips = {}
RoomColor = 'marble'
KnockWhile = false
Inventory = {}
LoginedMotel = 0 
NearRoom = 0
NearRoomType = false
LoginedFloor = 0
LoginedMotelRoom = 0
LoginedGarage = 0
Inventory.custom = true 
LoginedFloorX = {a1 = 0, a2 = 0}
LoginedGarageFloor = {a1 = 0, a2 = 0}
spawnedVehicles = {}

if GetResourceState('ox_inventory') ~= 'missing' then
	Inventory.ox = true
    Inventory.custom = false
end

if GetResourceState('qb-inventory') ~= 'missing' then
	Inventory.qb = true
    Inventory.custom = false
end

if GetResourceState('core_inventory') ~= 'missing' then
	Inventory.core = true
    Inventory.custom = false
end

if GetResourceState('qs-inventory') ~= 'missing' then
	Inventory.qs = true
    Inventory.custom = false
end

AddEventHandler('esx:setJob', CheckApartmentPlayers)

local function StartClient()
    while true do
        Wait(1000)
        if NetworkIsPlayerActive(PlayerId()) then
            TriggerServerEvent('0R:Motels:Server:RequestData')
            Wait(1000)
            DoorDataLoad()
            break
        end
    end
end

RegisterNetEvent('0R:Motels:Client:SendCache', function(data)
    CheckApartmentPlayers(data)
end)

function CheckApartmentPlayers(data)
    if data["motel"] then
        local motelid = GetCodeFromMotelId(data.motel.mCode)
        LoginedMotel = motelid
        TriggerServerEvent('0R:Motels:Server:SetCustomBucket', motelid+2000)
        LoginedFloorX.a1 = data.motel.a1
        LoginedFloorX.a2 = data.motel.a2
        LoadCorridorColor('marble', data.motel.Theme)
        LoadTeleportRooms(motelid, data.motel.a1, data.motel.a2)
    end

    if data["room"] then
        local motelid = GetCodeFromMotelId(data.room.mCode)
        LoginedMotelRoom = data.room.Id
        LoadRoomColor(Config.Motels[motelid].rooms[data.room.Id].DefaultColor)
        TriggerServerEvent('0R:Motels:Server:SetCustomBucket', motelid+1000)
    end
    if data["garage"] then
        local motelid = GetCodeFromMotelId(data.garage.mCode)
        LoginedGarage = motelid
        TriggerServerEvent('0R:Motels:Server:SetCustomBucket', motelid+100)
        EnterPlayerGarageV({between = data.garage.a1, between2 = data.garage.a2, mcode = data.garage.mCode})
    end

    print("Player Motel: "..LoginedMotel)
    print("Player Motel Room: "..LoginedMotelRoom)
    print("Player Garage: "..LoginedGarage)
end

function CreateBlip()
    for k,v in pairs(Config.Motels) do
        ReceptionCoord = vector3(v.coords["x"], v.coords["y"], v.coords["z"])
        local blip = AddBlipForCoord(ReceptionCoord)
        SetBlipSprite(blip, 475)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, v.blip)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
        table.insert(Blips, blip)
    end
end

function DoorDataLoad()
    Resmon.Lib.Callback.Client('0R:Motels:Server:DoorDataLoad', function(DoorState)
        for k, v in pairs(Config.Motels) do
            for DoorNo, Door in pairs(v.rooms) do
                if Door.Teleport == false then
                    MotelId = k * 1000
                    Conclusion = DoorNo + MotelId
                    local DoorId = 0x100 + Conclusion
                    local DoorHash = Door.DoorHash
                    
                    -- if IsDoorRegisteredWithSystem(DoorId) then
                    --     RemoveDoorFromSystem(DoorId)
                    -- end

                    print(v.name, DoorId)
                    local doorCoord = vec3(Door.EnterCoord[1], Door.EnterCoord[2], Door.EnterCoord[3])
                    AddDoorToSystem(DoorId, DoorHash, doorCoord, true, true, true)
                    
                    if DoorState[DoorNo] then
                        StateDoor = DoorState[DoorNo].State
                    else
                        StateDoor = (Config.AutoLock == true and 1 or 0)
                    end

                    DoorSystemSetDoorState(DoorId, StateDoor, 0, 1)
                    SetStateOfClosestDoorOfType(DoorId, doorCoord, 1, 0.0, true)
                end
            end
        end
    end)
end

local sortir = false
local encour = false

local function Shower()
    local Text = nil
    local Area = nil 
    while true do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        local Zone = false 
        local pedCoord = GetEntityCoords(pedPlayer)
        for k,v in pairs(Config.ShowerCoords) do
            local CemYilmaz = #(pedCoord - v) 
            if CemYilmaz <= 1.0 then
                Sleep = 1
                Zone = true 
                Text = Config.Lang[Config.Locale]["TakeAShower"]
                if IsControlJustReleased(0, 38) then
                    encour = true
                    FreezeEntityPosition((PlayerPedId()), true)
                    if not HasNamedPtfxAssetLoaded("core") then
                        RequestNamedPtfxAsset("core")
                        while not HasNamedPtfxAssetLoaded("core") do
                            Wait(1)
                        end
                    end
                    TaskStartScenarioInPlace((PlayerPedId()), "PROP_HUMAN_STAND_IMPATIENT", 0, true)
                    UseParticleFxAssetNextCall("core") 
                    particles  = StartParticleFxLoopedAtCoord("ent_sht_water", v.x, v.y, v.z +1.2, 0.0, 0.0, 0.0, 1.0, false, false, false, false) 
                    UseParticleFxAssetNextCall("core") 
                    Citizen.Wait(3000) 
                    particles2  = StartParticleFxLoopedAtCoord("ent_sht_water", v.x, v.y, v.z +1.2, 0.0, 0.0, 0.0, 1.0, false, false, false, false) 
                    UseParticleFxAssetNextCall("core") Citizen.Wait(3000) 
                    particles3  = StartParticleFxLoopedAtCoord("ent_sht_water", v.x, v.y, v.z +1.2, 0.0, 0.0, 0.0, 1.0, false, false, false, false) 
                    UseParticleFxAssetNextCall("core") Citizen.Wait(3000) 
                    particles4  = StartParticleFxLoopedAtCoord("ent_sht_water", v.x, v.y, v.z +1.2, 0.0, 0.0, 0.0, 1.0, false, false, false, false) 
                    UseParticleFxAssetNextCall("core") Citizen.Wait(3000) 
                    particles5  = StartParticleFxLoopedAtCoord("ent_sht_water", v.x, v.y, v.z +1.2, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                    timer = 8
                    sortir = true
                    Citizen.CreateThread(function()
                        while sortir do
                            Citizen.Wait(0)
                            Citizen.Wait(1000)
                            if(timer > 0)then
                                timer = timer - 1
                            elseif (timer == 0) then
                                encour = false
                                FreezeEntityPosition((PlayerPedId()), false)
                                Notify({type = 'success', title = Config.Lang[Config.Locale]["Successfull"], text = Config.Lang[Config.Locale]["Showered"]})
                                ClearPedTasksImmediately(PlayerPedId()) 
                                StopParticleFxLooped(particles, 0) StopParticleFxLooped(particles2, 0) StopParticleFxLooped(particles3, 0) StopParticleFxLooped(particles4, 0) StopParticleFxLooped(particles5, 0)
                                sortir = false
                            end
                        end
                    end)
                end
            end
        end
        if not Area and Zone then
            Area = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Area and not Zone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

function GetCodeFromMotel(code)
    for k,v in pairs(Config.Motels) do

        if v.mcode == code then
            return v
        end
    end
end

local function PutVehicleGarage(data)
    TriggerScreenblurFadeOut(150)
    SetNuiFocus(false, false)
    local getVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local id = GetIdFromMCode(data.mcode)
    local room = tonumber(data.room)
    local plate = Resmon.Lib.GetPlate(getVehicle)
    local props = Resmon.Lib.PropertiesVehicle.Get(getVehicle)
    local model = GetEntityModel(getVehicle)
    local modelname = GetDisplayNameFromVehicleModel(model)
    Resmon.Lib.Callback.Client('0R:Motels:Server:PutVehicleMotelGarage', function(export)
        if export then
            DeleteVehicle(getVehicle)
            EnterPlayerGarageV(data)
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = string.format(Config.Lang[Config.Locale]["ParkVehicle"], plate, room)
            })
        end
    end, plate, props, id, room, string.lower(modelname))
end

function GetCodeFromMotelRoom(code, rcode)
    for k,v in pairs(Config.Motels) do
        if v.mcode == code then
            for q,s in pairs(v.rooms) do
                if s.rCode == rcode then
                    return s
                end
            end
        end
    end
end

local function CheckMotelOwner(M)
    local Auth = false
    if Config.Motels[M].owner == Resmon.Lib.GetPlayerData().identifier then
        Auth = true 
    end
    return Auth
end

local function CheckPlayerMotels(M)
    local Auth = false
    local Rooms = Config.Motels[M].rooms
    for k,v in pairs(Rooms) do
        if v.Owner == Resmon.Lib.GetPlayerData().identifier then
            Auth = true
        end
    end
    
    return Auth
end

function OpenBossMenu(data)
    SetNuiFocus(true, true)
    local VarB = Config.Motels

    for k,v in pairs(VarB) do
        v.Cukur = CalculatorStar(k)
    end
    
    SendNUIMessage({
        type = 'OpenBossMenu',
        data = Config.Motels[tonumber(data.id)],
        maxgelir = Config.TargetedRevenueValue,
        AllMotels = VarB,
        colors = Config.Corridor.Colors
    })
end

CalculatorStar = function(motelid)
    stars = {}
    if Config.Motels[motelid].feedbacks then
        for k,v in pairs(Config.Motels[motelid].feedbacks) do
            table.insert(stars, v.StartPoint)
        end
    else
        stars = {0}
    end
    return HesaplaYildizPuan(stars)
end

function HesaplaYildizPuan(yildizlar)
    if #yildizlar == 0 then
        return 0 
    end

    local toplamYildiz = 0

    for _, yildiz in ipairs(yildizlar) do
        toplamYildiz = toplamYildiz + yildiz
    end

    return toplamYildiz / #yildizlar 
end

local function HasRoomKeys(mcode, rCode)
    local auth = false
    local Room = GetCodeFromMotelRoom(mcode, rCode)
    for q,s in pairs(Room.Keys) do
        if s.keyowner == Resmon.Lib.GetPlayerData().identifier then
            auth = true
        end
    end
    return auth
end

DeleteMloRoomDoorSystem = function(motel, room)
    for k,v in pairs(Config.Motels) do
        if motel == v.mcode then
            for q,s in pairs(v.rooms) do
                if not s.Teleport then
                    if q == room then
                        RemoveDoorFromSystem(0x100+k+q)
                    end
                end
            end
        end
    end
end

local function OpenPlayerMotelKeys()
    if Config.MetaDataSystem then return end
    local PlayerKeys = {}
    local pData = Resmon.Lib.GetPlayerData()
    
    for k,v in pairs(Config.Motels) do
        for q,s in pairs(v.rooms) do
            for b,a in pairs(s.Keys) do
                if a.keyowner == pData.identifier then
                    local Auth = false
                    if s.Owner == a.keyowner then Auth = true end
                    table.insert(PlayerKeys, {
                        mcode = a.mcode,
                        rcode = a.rcode,
                        keyowner = a.keyowner,
                        owner = Auth,
                        room = a.roomid,
                        motelname = GetCodeFromMotel(a.mcode).name,
                        pname = a.pname
                    })
                end
            end
        end
    end

    if #PlayerKeys > 0 then
        SetNuiFocus(true, true)

        SendNUIMessage({
            type = 'mykeys',
            data = PlayerKeys,
            lang = Config.Lang[Config.Locale]
        })
    else
        Notify({
            type = 'error',
            title = Config.Lang[Config.Locale]["Error"],
            text = Config.Lang[Config.Locale]["DontHaveRoom"]
        })
    end
end 

function OpenElevatorMenu(id, cenk, garage, boox, thisIsApartment)
    -- if LoginedMotel == 0 or LoginedGarage == 0 then return end
    if not garage then garage = false end
    SetNuiFocus(true, true)
    if not boox then boox = false end
    SendNUIMessage({
        type = 'LoadElevator',
        lang = Config.Lang[Config.Locale],
        thisIsApartment = thisIsApartment,
        bankx = boox,
        garage = garage,
        mcode = Config.Motels[id].mcode,
        floor = Config.Motels[id].floor,
        cenk = cenk
    })
end

local function AddNewFloor(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:AddNewFloorMotel', function(export)
        if export then
            Notify({
                type = 'success',
                text = Config.Lang[Config.Locale]["AddedNewFloor"],
                title = Config.Lang[Config.Locale]["Successfull"]
            })

        end
    end, data.mcode)
end

AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerScreenblurFadeOut(150)
    for k,v in pairs(Config.Motels) do
        for q,s in pairs(v.rooms) do
            if not s.Teleport then
                RemoveDoorFromSystem(0x100+k+q)
            end
        end
    end
end)

function GetPlayerMotelRooms(MotelID)
    local PlayerData = Resmon.Lib.GetPlayerData()
    local MotelRooms = Config.Motels[MotelID].rooms 
    local PlayerRooms = {}
    for k, v in pairs(MotelRooms) do
        v.RoomId = k
        if v.Owner == PlayerData.identifier then
            local isDuplicate = false 
            for _, s in pairs(Config.RoomTypes) do
                if v.InteriorType == s.RoomLabel then
                    v.Img = s.Image
                    
                    for _, existingRoom in pairs(PlayerRooms) do
                        if existingRoom.RoomId == v.RoomId then
                            isDuplicate = true
                            break
                        end
                    end
                    
                    if not isDuplicate then
                        table.insert(PlayerRooms, v)
                    end
                end
            end
        end
    end
    return PlayerRooms
end

local function OpenReception(MotelID)
    local MotelRooms = Config.Motels[MotelID].rooms 
    if #MotelRooms <= 0 then
        return Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["ThereArentanyRoom"]})
    end

    Resmon.Lib.HideTextUI()
    SetNuiFocus(true, true)

    OpenedMotelID = MotelID
    local Temp = Config.RoomTypes
    local NewTemp = {}
    local ThereIsRooms = false
    local PlayerBills = {}
    local PlayerData = Resmon.Lib.GetPlayerData()

    local PlayerRooms = GetPlayerMotelRooms(MotelID)
    
    for k,v in pairs(Config.Motels[MotelID].bills) do
        if v.Cid == PlayerData.identifier then
            table.insert(PlayerBills, v)
        end
    end

    local ProcessedRoomLabels = {} -- Tekrar eden oda türlerini takip edelim

    for k, v in pairs(MotelRooms) do
        for _, s in pairs(Temp) do
            if v.InteriorType == s.RoomLabel then
                if v.Owner == Config.Lang[Config.Locale]["NoOwner"] then
                    s.OdaSayi = true
                end

                if not ProcessedRoomLabels[v.InteriorType] then
                    table.insert(NewTemp, s)
                    ProcessedRoomLabels[v.InteriorType] = true
                end
            end
        end
    end

    SendNUIMessage({
        type = 'OpenReception',
        roomTypes = NewTemp,
        MotelData = Config.Motels[MotelID],
        Lang = Config.Lang[Config.Locale],
        odalaax = ThereIsRooms,
        metadata = Config.MetaDataSystem,
        stars = CalculatorStar(MotelID),
        stashprice = Config.StashInfo.StashWeightPrice,
        change = Config.KeyPrices.ChangeKeyPrice,
        copy = Config.KeyPrices.CopyKeyPrice,
        id = MotelID,
        Admin = CheckMotelOwner(MotelID),
        PlayerMotel = CheckPlayerMotels(MotelID),
        Bills = PlayerBills,
        PlayerRooms = PlayerRooms
    })

    PlayerRooms = {}
end

local function LeaveGarage(data)
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(1500)
    InMotel = 0
    local vec3Tr = vec3(Config.Motels[LoginedGarage].garage.x, Config.Motels[LoginedGarage].garage.y, Config.Motels[LoginedGarage].garage.z)
    SetEntityCoords(ped, vec3Tr.x, vec3Tr.y, vec3Tr.z)
    Wait(500)
    DoScreenFadeIn(500)
    TriggerServerEvent('0R:Motels:Server:ExitPlayerBucket', LoginedGarage)
end

local function SetPlayerCoord(data)
    local ped = PlayerPedId()
    local id = GetCodeFromMotelId(data.mcode)
    DoScreenFadeOut(500)
    Wait(1500)
    SetNuiFocus(false, false)
    local vec3Tr = vec3(Config.Motels[id].coords.x, Config.Motels[id].coords.y, Config.Motels[id].coords.z)
    SetEntityCoords(ped, vec3Tr.x, vec3Tr.y, vec3Tr.z)
    Wait(500)
    DoScreenFadeIn(500)
end

local function LeaveGarageV()
    Resmon.Lib.Callback.Client('0R:Motels:Server:LeaveRoom', function(cb)
        LeaveGarage(cb)
    end)
end

local function ExitGarageArea()
    local Area = false 
    local Text = nil
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local Zone = false
        local pedCoord = GetEntityCoords(ped) 
        if Config.MotelGarages then
            if #(pedCoord - Config.GarageCoord) <= 1.5 then
                Sleep = 5
                Zone = true
                Text = Config.Lang[Config.Locale]["LeaveTheGarage"]
                DrawMarker(21, Config.GarageCoord.x, Config.GarageCoord.y, Config.GarageCoord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                if IsControlJustReleased(0, 38) then
                OpenElevatorMenu(LoginedGarage, true, true, false, true)
                end
            end
        end

        if not Area and Zone then
            Area = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Area and not Zone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

local function LoadSelectedRoomTypeRooms(data)
    local MotelRooms = Config.Motels[tonumber(data.motelid)].rooms
    local TableV = {}
    local Dolu, Bos = {}, {}
    local Description = nil

    for k,v in pairs(MotelRooms) do
        v.OdaNo = k
        if v.InteriorType == data.room then
            table.insert(TableV, v)
        end
    end

    for k,v in pairs(TableV) do
        if v.Owner == Config.Lang[Config.Locale]["NoOwner"] then
            table.insert(Bos, v)
        end

        if v.Owner ~= Config.Lang[Config.Locale]["NoOwner"] then
            table.insert(Dolu, v)
        end
    end
    
    for k,v in pairs(Config.RoomTypes) do 
        if v.RoomLabel == data.room then
            Description = v.DetailDescription
        end
    end

    SendNUIMessage({
        type = 'OpenHeimer',
        tab = TableV,
        Dolu = #Dolu,
        Bos = #Bos,
        Desc = Description,
        room = data.room
    })

    TableV = {}
end

local function ToggleTeleportRoomLock(motel, room)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    TriggerServerEvent('0R:Motels:Server:DoorLockTeleport', motel, room, not Config.Motels[motel].rooms[room].Lock)
    if not Config.Motels[motel].rooms[room].Lock then
        Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'error', text = string.format(Config.Lang[Config.Locale]["LockedDoor"], room)})
    else
        Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = string.format(Config.Lang[Config.Locale]["LockedDoorTeleport"], room)})
    end
end

function EnterPlayerRoom(id, room)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    local RoomData = Config.Motels[id].rooms[room]
    Resmon.Lib.HideTextUI()
    LoginedMotel = id
    LoginedMotelRoom = room
    LoadRoomColor(RoomData.DefaultColor)
    RoomColor = RoomData.DefaultColor
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(1500)
    local enterCoord = vec3(RoomData.ExitCoord[1], RoomData.ExitCoord[2], RoomData.ExitCoord[3])
    SetEntityCoords(ped, enterCoord)
    Wait(500)
    DoScreenFadeIn(500)
    TriggerServerEvent('0R:Motels:Server:SetPlayerRoom', id, room, LoginedFloorX.a1, LoginedFloorX.a2, tonumber(LoginedFloor), Config.Motels[LoginedMotel].theme)
end

function LoadGarageVehicles(id, a1, a2)
    -- Önce mevcut araçları sil
    for _, vehicle in pairs(spawnedVehicles) do
        if DoesEntityExist(vehicle) then
            DeleteEntity(vehicle)
        end
    end

    spawnedVehicles = {}

    -- Yeni araçları oluştur
    for i = a1, a2 do
        local v = Config.Motels[id].rooms[i]
        if v.garage.state == 1 then
            RequestModel(v.garage.model)
            while not HasModelLoaded(v.garage.model) do
                Wait(1000)
            end

            local coordinateIndex = (i - 1) % 12 + 1
            local vCoord = Config.GaragePos[coordinateIndex]
            local vehicle = CreateVehicle(v.garage.model, vCoord.x, vCoord.y, vCoord.z, vCoord.w, false, false)
            if Config.GarageVehiclesLock then
                SetVehicleDoorsLocked(vehicle, 2)
            end
            Resmon.Lib.PropertiesVehicle.Set(vehicle, v.garage.props)
            SetVehicleNumberPlateText(vehicle, v.garage.props.plate)
            table.insert(spawnedVehicles, vehicle)
        end
    end
end

RegisterCommand('yarat', function()
    for i = 1, 12 do 
        local Model = GetHashKey('felon')
        RequestModel(Model)
        while not HasModelLoaded(Model) do
            Wait(1000)
        end
        JacKal = CreateVehicle(Model, Config.GaragePos[i], false, false)    
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if LoginedGarage ~= 0 then
            local playerPed = PlayerPedId()
            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if DoesEntityExist(vehicle) and IsVehicleInList(vehicle) then
                    local speed = GetEntitySpeed(vehicle)
                    if speed > 1.5 then
                        LoadExitGarageWithVehicle(vehicle)
                    end
                end
            end
        end
    end
end)

function LoadExitGarageWithVehicle(vehicle)
    local plate = Resmon.Lib.GetPlate(vehicle)
    DoScreenFadeOut(500) -- Ekranı karart
    Wait(1000) -- İhtiyaca göre bu süreyi ayarlayabilirsiniz
    Resmon.Lib.Callback.Client('0R:Motels:Server:OutVehicleGarage', function(export)
        if export then
            Notify({type = 'success', title = Config.Lang[Config.Locale]["Successfull"], text = string.format(Config.Lang[Config.Locale]["OutGarage"], plate)})
            LeaveGarage(export)
            local vehP = Resmon.Lib.PropertiesVehicle.Get(vehicle) 
            RequestModel(vehP.model)
            while not HasModelLoaded(vehP.model) do
                Wait(1000)
            end
            Vecihi = CreateVehicle(vehP.model, Config.Motels[LoginedGarage].garage.x, Config.Motels[LoginedGarage].garage.y, Config.Motels[LoginedGarage].garage.z, GetEntityHeading(PlayerPedId()), false, true)
            Resmon.Lib.PropertiesVehicle.Set(Vecihi, vehP)
            SetPedIntoVehicle(PlayerPedId(), Vecihi, -1)
            SetVehicleNumberPlateText(Vecihi, vehP.plate)
            LoginedGarage = 0
            DeleteVehicle(vehicle)
        end
    end, plate)
    DoScreenFadeIn(500) -- Ekranı tekrar aç
end

-- Araçın listeye dahil olup olmadığını kontrol etmek için bir işlev
function IsVehicleInList(vehicle)
    for _, v in pairs(spawnedVehicles) do
        if DoesEntityExist(v) and v == vehicle then
            return true
        end
    end
    return false
end

function EnterPlayerGarageV(data)
    id = GetCodeFromMotelId(data.mcode)
    SetNuiFocus(false, false)
    local room = 0
    Resmon.Lib.HideTextUI()
    LoginedGarage = id
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(1500)
    SetEntityCoords(ped, Config.GarageCoord)
    Wait(500)
    DoScreenFadeIn(500)
    TriggerServerEvent('0R:Motels:Server:SetPlayerGarage', id, tonumber(data.between), tonumber(data.between2), tonumber(data.asd))
    LoadGarageColor(id)
    LoadGarageVehicles(id, tonumber(data.between), tonumber(data.between2), tonumber(data.asd))
end

function GetCodeFromMotelId(mcode)
    local id = 0 
    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            id = k
        end
    end
    return id
end

local function LeaveRoom(data)
    local id = GetCodeFromMotelId(data.mCode)
    local rid = tonumber(data.Id)
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(1500)
    InMotel = 0
    local vec3Tr = vec3(Config.Motels[id].rooms[rid].EnterCoord[1], Config.Motels[id].rooms[rid].EnterCoord[2], Config.Motels[id].rooms[rid].EnterCoord[3])
    SetEntityCoords(ped, vec3Tr.x, vec3Tr.y + 0.1, vec3Tr.z)
    Wait(500)
    DoScreenFadeIn(500)
    TriggerServerEvent('0R:Motels:Server:LeaveRoomApartment', id, data)
    IsLoadTeleportRoomsRunning = false
    LoadTeleportRooms(id, data.a1, data.a2)
    IsLoadTeleportRoomsRunning = false
end

local function GarageElevator()
    local Area = false 
    local Text = nil
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local Zone = false
        local pedCoord = GetEntityCoords(ped) 
        for k,v in pairs(Config.Motels) do
            local exitCoord = vec3(Config.GarageElevator.x, Config.GarageElevator.y, Config.GarageElevator.z)
            if #(pedCoord - exitCoord) <= 1.5 then
                Sleep = 5
                Zone = true
                Text = Config.Lang[Config.Locale]["ElevatorMenu"]
                DrawMarker(21, Config.GarageElevator.x, Config.GarageElevator.y, Config.GarageElevator.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                if IsControlJustReleased(0, 38) then
                    OpenElevatorMenu(k, false, Config.MotelGarages, false, true)
                end
            end
        end

        if not Area and Zone then
            Area = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Area and not Zone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

local function ExitArea()
    local Area = false 
    local Text = nil
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local Zone = false
        local pedCoord = GetEntityCoords(ped) 
        if LoginedMotel > 0 and LoginedMotelRoom > 0 then
            local v = Config.Motels[LoginedMotel]
            local s = Config.Motels[LoginedMotel].rooms[LoginedMotelRoom]
            v.apartment = tonumber(v.apartment)
            if s.Teleport then
                local exitCoord = vec3(s.ExitCoord[1], s.ExitCoord[2], s.ExitCoord[3])
                if #(pedCoord - exitCoord) <= 1.5 then
                    Sleep = 5
                    Zone = true

                    DrawMarker(21, exitCoord.x, exitCoord.y, exitCoord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                    if Config.MetaDataSystem then
                        Text = Config.Lang[Config.Locale]["LeaveTheRoom2"]
                    else
                        Text = Config.Lang[Config.Locale]["LeaveTheRoom"]
                        if IsControlJustReleased(0, 47) then
                            ToggleTeleportRoomLock(LoginedMotel, LoginedMotelRoom)
                        end
                    end

                    if IsControlJustReleased(0, 38) then
                        Resmon.Lib.Callback.Client('0R:Motels:Server:LeaveRoom', function(cb)
                            LeaveRoom(cb)
                        end)
                    end
                end
            end
        end

        if not Area and Zone then
            Area = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Area and not Zone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

local function ExitCorridor(data)
    local id = data.Id
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(1500)
    SetEntityCoords(ped, Config.Motels[LoginedMotel].coords.x, Config.Motels[LoginedMotel].coords.y, Config.Motels[LoginedMotel].coords.z)
    soundId = GetSoundId()
    Wait(500)
    DoScreenFadeIn(500)
    TriggerServerEvent('0R:Motels:Server:ExitPlayerBucket', LoginedMotel)
    StopLoadTeleportRooms()
    ReceptionArea()
end

local function CorridorArea()
    local Zone = false 
    local Text = Config.Lang[Config.Locale]["ElevatorMenu"]
    while true do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        local InZone = false
        local pedCoords = GetEntityCoords(pedPlayer)
        if #(pedCoords - Config.Corridor.Coord) <= 2.0 then
            Sleep = 5
            InZone = true 
            DrawMarker(21, Config.Corridor.Coord.x, Config.Corridor.Coord.y, Config.Corridor.Coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
            if IsControlJustReleased(0, 38) then
                OpenElevatorMenu(LoginedMotel, true, false, true, false)
                -- Resmon.Lib.Callback.Client('0R:Motels:Server:LeaveApartment', function(cb)
                --     ExitCorridor(cb)
                -- end)
            end
        end

        if not Zone and InZone then
            Zone = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Zone and not InZone then
            Zone = false 
            Resmon.Lib.HideTextUI()
        end

        Citizen.Wait(Sleep)
    end
end

function ReceptionArea()
    local Zone = false
    local Text = '[E] - '..Config.Lang[Config.Locale]["Reception"]
    while true do
        local Sleep = 2000
        local pedPlayer = PlayerPedId()
        local InZone = false
        local pedCoords = GetEntityCoords(pedPlayer)
        for k,v in pairs(Config.Motels) do
            local ReceptionCoord = vector3(v.coords["x"], v.coords["y"], v.coords["z"])
            if #(pedCoords - ReceptionCoord) <= 1.5 then
                Sleep = 5
                InZone = true 
                v.apartment = tonumber(v.apartment)
                DrawMarker(21, ReceptionCoord.x, ReceptionCoord.y, ReceptionCoord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                if v.apartment == 1 then
                    Text = '<b>[E]</b> - '..Config.Lang[Config.Locale]["Reception"]..' | <b>[G]</b> - '..Config.Lang[Config.Locale]["EnterApartment"]
                    if IsControlJustReleased(0, 47) then
                        -- EnterPlayerCorridor(k)
                        OpenElevatorMenu(k, false, false, false)
                        Resmon.Lib.HideTextUI()
                    end
                end
                if IsControlJustReleased(0, 38) then
                    OpenReception(k)
                end
            end
        end

        if not Zone and InZone then
            Zone = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Zone and not InZone then
            Zone = false 
            Resmon.Lib.HideTextUI()
        end

        Wait(Sleep)
    end
end

function GetIdFromMCode(mcode)
    local id = 0
    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            id = k
        end
    end
    return id
end

function OpenRoomStash(motelid, roomid, mcode, rcode)
    if Inventory.ox then
        exports.ox_inventory:openInventory('stash', mcode..'_'..rcode)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    elseif Inventory.qb or Inventory.qs then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", Config.Lang[Config.Locale]["Room"].. ' '..motelid..'_'..roomid, {
            maxWeight = GetCodeFromMotelRoom(mcode, rcode).StashWeight,
            slots = 100,
        })
        TriggerEvent("inventory:client:SetCurrentStash", Config.Lang[Config.Locale]["Room"].. ' '..motelid..'_'..roomid)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    elseif Inventory.core then
        TriggerServerEvent('core_inventory:server:openInventory', Config.Lang[Config.Locale]["Room"].. ' '..motelid..'_'..roomid, 'stash', GetCodeFromMotelRoom(mcode, rcode).StashWeight, GetCodeFromMotelRoom(mcode, rcode).StashWeight)
    elseif Inventory.custom then
        Config.CustomStash(motelid..'_'..roomid)
    end
end

local function WardrobeArea()
    local Area = false
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local InZone = false 
        local pedCoord = GetEntityCoords(ped) 
        for k,v in pairs(Config.Motels) do
            if #v.rooms > 0 then
                for q,s in pairs(v.rooms) do
                    local WardrobeCoord = vector3(s.WardrobeCoord[1], s.WardrobeCoord[2], s.WardrobeCoord[3])
                    if #(pedCoord - WardrobeCoord) <= 1.5 then
                        Sleep = 5
                        InZone = true
                        if IsControlJustReleased(0, 38) then
                            Config.OpenWardrobe()
                        end
                    end
                end
            end
        end

        if not Area and InZone then
            Area = true 
            Resmon.Lib.ShowTextUI(Config.Lang[Config.Locale]["WardrobeOpenText"])
        end

        if Area and not InZone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

local function GivePlayerKeyCard(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:GivePlayerKeyCard', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = string.format(Config.Lang[Config.Locale]["GaveKeyCard"], data.name, data.room)
            })
            OpenPlayerMotelKeys()
        else
            Notify({
                title = Config.Lang[Config.Locale]["Error"],
                type = 'error',
                text = Config.Lang[Config.Locale]["NotYourselfGave"]
            })
        end
    end, data)
end

local function StashArea()
    local Area = false
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local InZone = false 
        local pedCoord = GetEntityCoords(ped) 
        for k,v in pairs(Config.Motels) do
            if #v.rooms > 0 then
                for q,s in pairs(v.rooms) do
                    local StashCoord = vector3(s.StashCoord[1], s.StashCoord[2], s.StashCoord[3])
                    if #(pedCoord - StashCoord) <= 2.0 then
                        Sleep = 5
                        InZone = true
                        DrawMarker(21, StashCoord.x, StashCoord.y, StashCoord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                        if IsControlJustReleased(0, 38) then
                            if not s.Teleport then
                                OpenRoomStash(k, q, v.mcode, s.rCode)
                            else
                                OpenRoomStash(LoginedMotel, LoginedMotelRoom, Config.Motels[LoginedMotel].mcode, Config.Motels[LoginedMotel].rooms[LoginedMotelRoom].rCode)
                            end
                        end
                    end
                end
            end
        end

        if not Area and InZone then
            Area = true 
            Resmon.Lib.ShowTextUI(Config.Lang[Config.Locale]["StashOpenText"])
        end

        if Area and not InZone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

-- Citizen.CreateThread(function()
--     while true do
--         SetArtificialLightsState(true)
--         Citizen.Wait(0)
--     end
-- end)

local function LeaveMotelRoom(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:LeaveMotelRoom', function(callback)
        if callback then
            local motelid = GetIdFromMCode(data.mcode)
            local PlayerRooms = {}

            for k, v in pairs(Config.Motels[motelid].rooms) do
                v.RoomId = k
                if v.Owner == Resmon.Lib.GetPlayerData().identifier then
                    local isDuplicate = false -- Aynı verinin eklenip eklenmediğini kontrol etmek için bir bayrak
                    for q, s in pairs(Config.RoomTypes) do
                        if v.InteriorType == s.RoomLabel then
                            v.Img = s.Image
                            
                            -- PlayerRooms tablosunda aynı verinin olup olmadığını kontrol et
                            for _, existingRoom in pairs(PlayerRooms) do
                                if existingRoom.RoomId == v.RoomId then
                                    isDuplicate = true
                                    break
                                end
                            end
                            
                            -- Aynı veri eklenmemişse PlayerRooms'a ekle
                            if not isDuplicate then
                                table.insert(PlayerRooms, v)
                            end
                        end
                    end
                end
            end
            
            Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = string.format(Config.Lang[Config.Locale]["CanceledRoom"], data.roomid)})

            SendNUIMessage({
                type = 'LeaveMotelRoomUpdate2',
                PlayerRooms = PlayerRooms
            })

            PlayerRooms = {}
        end
    end, data)
end

RegisterNetEvent('0R:Motels:Client:OpenDoorNotTeleport', function(data)
    if not Config.MetaDataSystem then return end
    local ped = PlayerPedId()
    local pedCoord = GetEntityCoords(ped)
    for k,v in pairs(Config.Motels) do
        for q,s in pairs(v.rooms) do
            local DoorCoord = vec3(s.EnterCoord[1], s.EnterCoord[2], s.EnterCoord[3])
            local ExitCoord = vec3(1,1,1)
            if s.Teleport then
                ExitCoord = vec3(s.ExitCoord[1], s.ExitCoord[2], s.ExitCoord[3])
            end
            if #(pedCoord - DoorCoord) <= 2.0 or #(pedCoord - ExitCoord) <= 2.0 then
                Animation_2()
                if Inventory.ox then
                    if not s.Teleport then
                        if data.metadata.rCode == s.rCode then
                            MotelId = k * 1000
                            Conclusion = q + MotelId
                            StateD = DoorSystemGetDoorState(0x100+Conclusion) == 0 and 1 or 0
                            ChangeDoorStatus(StateD, s, Conclusion, q, k)
                        -- else
                        --     Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["NotBelong"]})
                        end
                    else
                        if data.metadata.rCode == s.rCode then
                            ToggleTeleportRoomLock(k, q)
                            if s.Lock == false then
                                Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadataTeleportClosed"], q))
                            else
                                Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadataTeleportOpened"], q))
                            end
                        -- else
                        --     Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["NotBelong"]})
                        end
                    end
                elseif Inventory.qb then
                    if not s.Teleport then
                        if data.rCode == s.rCode then
                            MotelId = k * 1000
                            Conclusion = q + MotelId
                            StateD = DoorSystemGetDoorState(0x100+Conclusion) == 0 and 1 or 0
                            ChangeDoorStatus(StateD, s, Conclusion, q, k)
                        -- else
                        --     Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["NotBelong"]})
                        end
                    else
                        if data.rCode == s.rCode then
                            ToggleTeleportRoomLock(k, q)
                            if s.Lock == false then
                                Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadataTeleportClosed"], q))
                            else
                                Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadataTeleportOpened"], q))
                            end
                        -- else
                        --     Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["NotBelong"]})
                        end
                    end
                end
                break
            end
        end
    end
end)

RegisterNetEvent('0R:Motels:Client:DoorLockTeleport', function(MotelNo, MotelRoomId, State)
    Config.Motels[MotelNo].rooms[MotelRoomId].Lock = State
end)

RegisterNetEvent('0R:Motels:Client:ChangeDoorStatusEveryone', function(Room, State, No)
    DoorSystemSetDoorState(No, State.State, 0 ,1)
    local DoorCoord = vec3(Room.EnterCoord[1], Room.EnterCoord[2], Room.EnterCoord[3])
	SetStateOfClosestDoorOfType(No, DoorCoord, 1, 0.0, true)
end)

ChangeDoorStatus = function(x, room, conclusion, no, id)
    print("test", 0x100+conclusion)
    if x == 1 then
        Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'error', text = string.format(Config.Lang[Config.Locale]["LockedDoor"], no)})
    else
        Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = string.format(Config.Lang[Config.Locale]["UnlockedDoor"], no)})
    end
    TriggerServerEvent('0R:Motels:Server:ChangeMotelDoorStatus', room, x, 0x100+conclusion)
end

function SendRoomJoinRequest(motel, room)
    TriggerServerEvent('0R:Motels:Server:RequestJoin', motel, room)
    Notify({
        title = Config.Lang[Config.Locale]["infostring"],
        text = string.format(Config.Lang[Config.Locale]["KnockedRoom"], room),
        type = 'info'
    })
end

RegisterNetEvent("0R:Motels:Client:SendRequestOwner", function(data)
    KnockWhile = true

    SendNUIMessage({
        type = 'requestJoin',
        data = data,
        lang = Config.Lang[Config.Locale]
    })

    while KnockWhile do
        local Sleep = 5
        if IsControlJustReleased(0, 311) then
            TriggerServerEvent('0R:Motels:Server:PlayerAcceptRoom', data.motel, data.room, data.src)
            SendNUIMessage({type = 'answerRequest'})
            KnockWhile = false
            break
        end
        if IsControlJustReleased(0, 47) then
            TriggerServerEvent('0R:Motels:Server:PlayerRejectRoom', data.motel, data.room, data.src)
            SendNUIMessage({type = 'answerRequest'})
            KnockWhile = false
            break
        end
        Citizen.Wait(Sleep)
    end
end)

RegisterNetEvent('0R:Motels:Client:PlayerEnterRoom', EnterPlayerRoom)

RegisterNetEvent('0R:Motels:Client:PlayerRejectRoom', function()
    Notify({
        title = Config.Lang[Config.Locale]["Error"],
        text = Config.Lang[Config.Locale]["RejectX"],
        type = 'error'
    })
end)

local function NoTeleportArea()
    local Area = false
    local Text = nil
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local InZone = false
        local pedCoord = GetEntityCoords(ped)

        for k,v in pairs(Config.Motels) do
            for q, sa in pairs(v.rooms) do
                if v.apartment == 0 then 
                    local DoorCoord = vec3(sa.EnterCoord[1], sa.EnterCoord[2], sa.EnterCoord[3])
                    local Different = #(pedCoord - DoorCoord)
                    if Different <= 2.0 then
                        Sleep = 5
                        local DoorState = nil
                        InZone = true
                        NearRoom = q
                        StateD = DoorSystemGetDoorState(0x100+k+q) == 0 and 1 or 0
                        if StateD == 0 then
                            StateInfo = Config.Lang[Config.Locale]["LOCKED"]
                        else
                            StateInfo = Config.Lang[Config.Locale]["UNLOCKED"]
                        end

                        LoginedMotel = k
                        if sa.Teleport then
                            NearRoomType = true 
                        end

                        if Config.MetaDataSystem then
                            Text = string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadata"], q, StateInfo)
                        else
                            Text = string.format(Config.Lang[Config.Locale]["RoomNoInfoNotMetadata"], q, StateInfo)
                            if IsControlJustReleased(0, 38) then
                                if HasRoomKeys(v.mcode, sa.rCode) then
                                    Animation_2()
                                    if not sa.Teleport then
                                        MotelId = k*1000
                                        Conclusion = q+MotelId    
                                        StateD = DoorSystemGetDoorState(0x100+Conclusion) == 0 and 1 or 0
                                        ChangeDoorStatus(StateD, sa, Conclusion, q, k)
                                    else
                                        ToggleTeleportRoomLock(k, q)
                                        if not sa.Lock then
                                            DoorState = Config.Lang[Config.Locale]["LOCKED"]
                                        else
                                            DoorState = Config.Lang[Config.Locale]["UNLOCKED"]
                                        end

                                        if sa.Lock == true then
                                            Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoNotMetadataTp"], q, DoorState))
                                        else
                                            Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoNotMetadataXP"], q, DoorState))
                                        end

                                        Sleep = 1 
                                    end
                                else
                                    Notify({title = Config.Lang[Config.Locale]["Error"], text = Config.Lang[Config.Locale]["NotHaveKey"], type = 'error'})
                                end
                                -- StateD = DoorSystemGetDoorState(0x100+k+q) == 0 and 1 or 0
                                -- ChangeDoorStatus(StateD, s, k+q, q)
                            end
                        end

                        if sa.Teleport then
                            if IsControlJustReleased(0, 47) then
                                if sa.Lock == false then
                                    EnterPlayerRoom(k, q)
                                end
                            end

                            if IsControlJustReleased(0, 23) then
                                if sa.Lock == true then
                                    SendRoomJoinRequest(k, q)
                                end
                            end
                        end
                    else
                        NearRoom = 0 
                    end                        
                end
            end
        end

        if not Area and InZone then
            Area = true 
            Resmon.Lib.ShowTextUI(Text)
        elseif Area and not InZone then
            Area = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end


local function RoomRentUzat(data)
    local Room = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == data.mcode then
            Room = v.rooms[tonumber(data.roomid)]
        end
    end
    
    Resmon.Lib.Callback.Client('0R:Core:Server:CalculatorDay', function(export)
        SendNUIMessage({
            type = 'UzatScreen',
            gun = export,
            paymentdate = Room.PaymentDate,
            mcode = data.mcode,
            roomid = data.roomid,
            price = Room.AmountPay,
            price2 = Room.RentPrice,
            rentprice = Room.RentPrice
        })
    end, Room.PaymentDate)
end


local function RentMotelRoom(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:RentMotelRoom', function(callback)
        if callback then
            SendNUIMessage({
                type = 'RentRoom'
            })
            SetNuiFocus(false, false)
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["BuyedMotelRoom"], time = 3})
        else
            Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["EnoughMoneyForRentRoom"], time = 3})
        end
    end, data, GetMugShotBase64(PlayerPedId()))
end

local function BuyBusinessMotel(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:BuyBusinessMotel', function(callback)
        if callback then
            SetNuiFocus(false, false)
            SendNUIMessage({type = 'CloseReception'})
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = Config.Lang[Config.Locale]["BuyedMotel"], button = false, time = 3})
        else
            Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = Config.Lang[Config.Locale]["EnoughMoney"], button = false, time = 3})
        end
    end, tonumber(data.id), GetMugShotBase64(PlayerPedId()))
end

local function PayInvoice(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:PayInvoice', function(callback)
        if callback then
            Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = string.format(Config.Lang[Config.Locale]["BilledPay"], data.amount, data.roomid)})
            local PlayerBills = {}
            local PlayerRooms = {}

            for k,v in pairs(Config.Motels[OpenedMotelID].bills) do
                if v.Cid == Resmon.Lib.GetPlayerData().identifier then
                    table.insert(PlayerBills, v)
                end
            end

            for k, v in pairs(Config.Motels[OpenedMotelID].rooms) do
                v.RoomId = k
                if v.Owner == Resmon.Lib.GetPlayerData().identifier then
                    local isDuplicate = false -- Aynı verinin eklenip eklenmediğini kontrol etmek için bir bayrak
                    for _, s in pairs(Config.RoomTypes) do
                        if v.InteriorType == s.RoomLabel then
                            v.Img = s.Image
                            
                            -- PlayerRooms tablosunda aynı verinin olup olmadığını kontrol et
                            for _, existingRoom in pairs(PlayerRooms) do
                                if existingRoom.RoomId == v.RoomId then
                                    isDuplicate = true
                                    break
                                end
                            end
                            
                            -- Aynı veri eklenmemişse PlayerRooms'a ekle
                            if not isDuplicate then
                                table.insert(PlayerRooms, v)
                            end
                        end
                    end
                end
            end
            

            SendNUIMessage({
                type = 'LoadInvoices',
                bills = PlayerBills,
                rooms = PlayerRooms
            })
        else
            Notify(
                {
                    title = Config.Lang[Config.Locale]["Error"],
                    text = Config.Lang[Config.Locale]["EnoughMoneyForBill"],
                    type = 'error'
                }
            )
        end
    end, data)
end

RegisterNetEvent('0R:Motels:Client:SendRequestOwner', function(data)
    SendNUIMessage({
        type = ''
    })
end)

local function UzatOdaZaman(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UzatOdaTime', function(callback)
        if callback then

            local motelid = GetIdFromMCode(data.mcode)
            local PlayerRooms = {}

            for k, v in pairs(Config.Motels[OpenedMotelID].rooms) do
                v.RoomId = k
                if v.Owner == Resmon.Lib.GetPlayerData().identifier then
                    local isDuplicate = false -- Aynı verinin eklenip eklenmediğini kontrol etmek için bir bayrak
                    for _, s in pairs(Config.RoomTypes) do
                        if v.InteriorType == s.RoomLabel then
                            v.Img = s.Image
                            
                            -- PlayerRooms tablosunda aynı verinin olup olmadığını kontrol et
                            for _, existingRoom in pairs(PlayerRooms) do
                                if existingRoom.RoomId == v.RoomId then
                                    isDuplicate = true
                                    break
                                end
                            end
                            
                            -- Aynı veri eklenmemişse PlayerRooms'a ekle
                            if not isDuplicate then
                                table.insert(PlayerRooms, v)
                            end
                        end
                    end
                end
            end
            

            SendNUIMessage({
                type = 'UpdateOdalar',
                PlayerRooms = PlayerRooms
            })

            Notify(
                {
                    title = Config.Lang[Config.Locale]["Successfull"],
                    text = string.format(Config.Lang[Config.Locale]["ExtendedRoom"], data.eklenecek),
                    type = 'success'
                }
            )
        else
            Notify(
                {
                    title = Config.Lang[Config.Locale]["Error"],
                    text = Config.Lang[Config.Locale]["EnoughMoneyForExtendedRoom"],
                    type = 'error'
                }
            )
        end
    end, data)
end

RegisterNetEvent('0R:Motels:Notify', Notify)

function ClearBlips()
    for k,v in pairs(Blips) do
        RemoveBlip(v)
    end
end

local function SendServerData(data)
    Config.Motels = data
    ClearBlips()
    CreateBlip()
    Started = true
end

local function Cal()
    PlaySound(PlayerId(), "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end

local function RemoveKeyByCid(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:RemoveKeyByRoom', function(export)
        if export then
            Notify(
                {
                    title = Config.Lang[Config.Locale]["Successfull"],
                    text = string.format(Config.Lang[Config.Locale]["RemoveAccessRoom"], data.name),
                    type = 'success'
                }
            )
            OpenPlayerMotelKeys()
        else
            Notify(
                {
                    title = Config.Lang[Config.Locale]["Error"],
                    text = Config.Lang[Config.Locale]["NotYourselfDeleted"],
                    type = 'error'
                }
            )
        end
    end, data)
end

local function GiveMotelCardKey(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:GetAllPlayersArea', function(callback)

        if callback then
            for k,v in pairs(callback) do
                local playerIdx = GetPlayerFromServerId(v.source)
                local ped = GetPlayerPed(playerIdx)
                v.img = GetMugShotBase64(ped)
            end

            SendNUIMessage({
                type = 'SendPlayers',
                p = callback,
                bufarkli = true
            })
        end
    end, data)
end

local function ChangeRoomPaymenType(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:AutoPayChange', function(callback)
        if callback then
            local motelid = GetIdFromMCode(data.mcode)
            local PlayerRooms = {}

            for k, v in pairs(Config.Motels[motelid].rooms) do
                v.RoomId = k
                if v.Owner == Resmon.Lib.GetPlayerData().identifier then
                    local isDuplicate = false 
                    
                    for _, existingRoom in pairs(PlayerRooms) do
                        if existingRoom.RoomId == v.RoomId then
                            isDuplicate = true
                            break
                        end
                    end
                    
                    if not isDuplicate then
                        for q, s in pairs(Config.RoomTypes) do
                            if v.InteriorType == s.RoomLabel then
                                if v.Teleport == s.Teleport then
                                    v.Img = s.Image
                                    table.insert(PlayerRooms, v)
                                end
                            end
                        end
                    end
                end
            end

            if data.autopay then
                Notify({title = Config.Lang[Config.Locale]["Successfull"], type = 'success', text = string.format(Config.Lang[Config.Locale]["AutoPaySucc"], data.roomid)})
            else
                Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = string.format(Config.Lang[Config.Locale]["AutoPayErr"], data.roomid)})
            end
            
            SendNUIMessage({
                type = 'LeaveMotelRoomUpdate',
                PlayerRooms = PlayerRooms
            })
        end
    end, data)
end

local function KnockOnTheDoor(MotelID, Room)

end

local function LoadSelectedKeyRoom(data)
    SendNUIMessage({
        type = 'LoadSelectedKeyRoom',
        room = data.roomid,
        mcode = data.mcode,
        data = GetCodeFromMotelRoom(data.mcode, data.rcode).Keys,
        lang = Config.Lang[Config.Locale],
        motelname = GetCodeFromMotel(data.mcode).name
    })
end

Notify = function(data)
    SendNUIMessage({
		type = 'showNotifyV',
		data = data,
	})
end

Animation_2 = function()
    LoadAnimDict("anim@heists@keycard@")
    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(400)
    ClearPedTasks(PlayerPedId())
end

LoadAnimDict = function(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

Animation = function()
    RequestAnimDict('amb@prop_human_atm@male@enter')
    while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do
        Wait(0)
    end

    local playerPed = PlayerPedId()

    TaskPlayAnim(playerPed, 'amb@prop_human_atm@male@enter', "enter", 1.0, -1.0, 3000, 1, 1, true, true, true)

    local cardProp = CreateObject(GetHashKey('prop_cs_credit_card'), 0.0, 0.0, 0.0, true, true, true)
    AttachEntityToEntity(cardProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, -0.05, 0.0, -90.0, 0.0, 0.0, true, true, false, true, 1, true)

    Citizen.Wait(3000) -- Animasyon süresi kadar bekle

    DeleteEntity(cardProp)
end

local function CopyRoomKey(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:CopyMotelRoomKey', function(export, pay)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                text = string.format(Config.Lang[Config.Locale]["CopiedKey"], data.room, Config.KeyPrices.CopyKeyPrice),
                type = 'success'
            })
        else
            Notify({
                title = Config.Lang[Config.Locale]["Error"],
                text = string.format(Config.Lang[Config.Locale]["NotHaveMoney"], pay),
                type = 'error'
            })
        end
    end, data)
end

local function ChangeRoomKey(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:ChangeMotelRoomKey', function(export, pay)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                text = string.format(Config.Lang[Config.Locale]["SuccChangedRoomKey"], data.room),
                type = 'success'
            })
        else
            Notify({
                title = Config.Lang[Config.Locale]["Error"],
                text = string.format(Config.Lang[Config.Locale]["NotHaveMoney2"], pay),
                type = 'error'
            })
        end
    end, data)
end

local function SecondFloorArea()
    local Text = nil
    local Zone = false
    while true do
        local Sleep = 2000
        local InZone = false
        local pedPlayer = PlayerPedId() 
        local pedCoord = GetEntityCoords(pedPlayer)
        for k,v in pairs(Config.Motels) do
            if v.floor >= 2 then
                local coordFark = #(pedCoord - Config.Corridor.SecondFloor)
                if coordFark <= 3.0 then
                    Sleep = 5
                    InZone = true
                    Text = Config.Lang[Config.Locale]["ElevatorMenu"]
                    DrawMarker(21, Config.Corridor.SecondFloor.x, Config.Corridor.SecondFloor.y, Config.Corridor.SecondFloor.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                    if IsControlJustReleased(0, 38) then
                        OpenElevatorMenu(k, true)
                    end
                end
            end
        end

        if not Zone and InZone then
            Zone = true
            Resmon.Lib.ShowTextUI(Text)
        end

        if Zone and not InZone then
            Zone = false 
            Resmon.Lib.HideTextUI()
        end
        Citizen.Wait(Sleep)
    end
end

local function UpdateStashWeight(data)
    local NewValue, StashWeight = tonumber(data.weightnew), tonumber(data.stashWeight)
    if NewValue <= Config.StashInfo.StashWeightMaxValue and StashWeight < NewValue then
        Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateRoomStashWeight', function(cb)
            if cb then
                Notify({
                    title = Config.Lang[Config.Locale]["Successfull"],
                    text = string.format(Config.Lang[Config.Locale]["UpdatedStash"], data.para, data.weightnew),
                    type = 'success'
                })
            else
                Notify({
                    title = Config.Lang[Config.Locale]["Error"],
                    text = Config.Lang[Config.Locale]["NotHaveMoney5"],
                    type = 'error'
                })
            end
        end, data)
    else
        Notify({
            title = Config.Lang[Config.Locale]["Error"],
            text = Config.Lang[Config.Locale]["StashWeightError"],
            type = 'error'
        })
    end
    SendNUIMessage({type = 'CloseB'})
end

local function CreateFeedback(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:CreateFeedBack', function(cb)
        if cb then
            Notify({
                type = 'success',
                title = Config.Lang[Config.Locale]["Successfull"],
                text = Config.Lang[Config.Locale]["CreatedFeedback"]
            })        
            SendNUIMessage({type = 'UpdateFeedbacks', data = Config.Motels[OpenedMotelID].feedbacks})    
        end
    end, data)
end

local function GetTypeFromName(name)
    local nameV = nil 
    for k,v in pairs(Config.RoomTypes) do
        if v.RoomLabel == name then
            nameV = v
        end
    end
    
    return nameV
end

local function EditRoomMenu()
    TriggerScreenblurFadeIn(150)
    local data = GetTypeFromName("Double")
    SetNuiFocus(true, true)
    SendNUIMessage({
        lang = Config.Lang[Config.Locale],
        theme = Config.Motels[LoginedMotel].rooms[LoginedMotelRoom].DefaultColor,
        type = 'EditedRoom',
        colors = data.Colors
    })
end

local function EditRoomArea()
    local Text = nil 
    local AlZone = false 
    while true do
        local Sleep = 2000
        local InZone = false
        local pedCoord = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.Motels) do
            for q,s in pairs(v.rooms) do
                if s.EditMenuCoord then
                    local edit = vec3(s.EditMenuCoord[1], s.EditMenuCoord[2], s.EditMenuCoord[3])
                    local coord = #(pedCoord - edit) 
                    if coord <= 2.0 then
                        Sleep = 5
                        InZone = true
                        Text = Config.Lang[Config.Locale]["EditRoom"]
                        if IsControlJustReleased(0, 38) then
                            EditRoomMenu()
                        end
                        DrawMarker(21, edit.x, edit.y, edit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                    end
                end
            end
        end

        if not AlZone and InZone then
            AlZone = true 
            Resmon.Lib.ShowTextUI(Text) 
        end

        if AlZone and not InZone then
            AlZone = false
            Resmon.Lib.HideTextUI() 
        end
        Citizen.Wait(Sleep)
    end
end

-- RegisterCommand('setvehicle', function()
--     LAD()
-- end)

-- LAD = function()
--     local ped = PlayerPedId()
--     local vehicle = GetVehiclePedIsIn(ped, false)  
--     local plate = exports["kibra-vehicleshops"]:GeneratePlate()
--     SetVehicleNumberPlateText(vehicle, plate)     
--     Resmon.Lib.Callback.Client('0R:Motels:Server:SetVehicle', function(export)
--         if export then
--             print("ARAÇ SENİN ÜZERİNE", plate)
--         end 
--     end, plate, Resmon.Lib.PropertiesVehicle.Get(vehicle))
-- end

local function EnterPlayerGarageWithVehicle(id)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)  
    local plate = Resmon.Lib.GetPlate(vehicle)
    local playerMotels = GetPlayerMotelRooms(id)
    Resmon.Lib.Callback.Client('0R:Motels:Server:CheckVehicleOwner', function(export)
        if export then
            if #playerMotels > 0 then
                SetNuiFocus(true, true)
                TriggerScreenblurFadeIn(300)
                SendNUIMessage({
                    type = 'GarageContainer',
                    data = Config.Motels[id],
                    lang = Config.Lang[Config.Locale],
                    rooms = playerMotels
                })
            else
                Notify({
                    title = Config.Lang[Config.Locale]["Error"],
                    type = 'error',
                    text = Config.Lang[Config.Locale]["YouDontHaveRoom"]
                })
            end
        else
            Notify({title = Config.Lang[Config.Locale]["Error"], type = 'error', text = string.format(Config.Lang[Config.Locale]["NotOwnYou"], plate)})
        end
    end, plate, id)
end

local function Garage()
    local Text = nil 
    local AlZone = false 
    while true do
        local Sleep = 2000
        local ped = PlayerPedId()
        local InZone = false
        local pedCoord = GetEntityCoords(ped)
        if Config.MotelGarages then
            for k,v in pairs(Config.Motels) do
                local vehicle = GetVehiclePedIsIn(ped, false)
                local garage = vector(1,1,1)
                if v.garage ~= false then            
                    garage = vec3(v.garage.x, v.garage.y, v.garage.z)
                    if #(pedCoord - garage) <= 3.0 then
                        Sleep = 5
                        InZone = true
                        Text = Config.Lang[Config.Locale]["GarageText"]
                        DrawMarker(21, garage.x, garage.y, garage.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 155, false, false, false, 1, false, false, false)
                        if IsPedInAnyVehicle(ped, false) then
                            if GetPedInVehicleSeat(vehicle, -1)  then
                                if IsControlJustReleased(0, 38) then
                                    EnterPlayerGarageWithVehicle(k)
                                end
                            end
                        else
                            if IsControlJustReleased(0, 38) then
                                OpenElevatorMenu(k, false, true, false) 
                            end
                        end
                    end
                end
            end
        end
        
        if not AlZone and InZone then
            AlZone = true 
            Resmon.Lib.ShowTextUI(Text) 
        end

        if AlZone and not InZone then
            AlZone = false
            Resmon.Lib.HideTextUI() 
        end
        Citizen.Wait(Sleep)
    end
end

function UpdateRoomColor(theme, new)
    RequestIpl("qua_loft_milo")
    local interiorID = GetInteriorAtCoords(-226.2884, -839.8974, 105.3926)
    if IsValidInterior(interiorID) then      
      DisableInteriorProp(interiorID, theme)
        EnableInteriorProp(interiorID, new)
        RefreshInterior(interiorID)
    end
    RoomColor = new
end

function LoadRoomColor(color)
    local interiorID = GetInteriorAtCoords(-226.2884, -839.8974, 105.3926)
    if IsValidInterior(interiorID) then      
        DisableInteriorProp(interiorID, 'marble')
        DisableInteriorProp(interiorID, 'red')
        DisableInteriorProp(interiorID, 'blue')
        DisableInteriorProp(interiorID, 'normal')
        DisableInteriorProp(interiorID, 'orange')
        EnableInteriorProp(interiorID, color)
        RefreshInterior(interiorID)
    end
end

function LoadCorridorColor(old, new)
    if old == nil then old = 'marble' end
    local interiorID = GetInteriorAtCoords(-243.98768600, -826.93790000, 94.23494000)
    if IsValidInterior(interiorID) then      
        DisableInteriorProp(interiorID, 'marble')
        DisableInteriorProp(interiorID, 'red')
        DisableInteriorProp(interiorID, 'blue')
        DisableInteriorProp(interiorID, 'normal')
        DisableInteriorProp(interiorID, 'orange')
        EnableInteriorProp(interiorID, new)
        RefreshInterior(interiorID)
    end
end

function LoadGarageColor(id)
    local interiorID = GetInteriorAtCoords(520.00000000, -2625.00000000, -39.69168000)
    if IsValidInterior(interiorID) then      
        SetInteriorEntitySetColor(interiorID, "tint", tonumber(Config.Motels[id].garageth))
        RefreshInterior(interiorID)
    end
end

RegisterCommand('gc', function(source, args)
    local interiorID = GetInteriorAtCoords(520.00000000, -2625.00000000, -39.69168000)
    if IsValidInterior(interiorID) then      
        SetInteriorEntitySetColor(interiorID, "tint", tonumber(args[1]))
        RefreshInterior(interiorID)
    end
end)

local function LoadRoomTheme(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateRoomColor', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = string.format(Config.Lang[Config.Locale]["UpdatedColor"], data.price, data.color)
            })
            UpdateRoomColor(data.default, data.color)
            SetNuiFocus(false, false)
            TriggerScreenblurFadeOut(150)
            SendNUIMessage({type = 'Necip'})
        else
            Notify({
                type = 'error',
                title = Config.Lang[Config.Locale]["Error"],
                text = Config.Lang[Config.Locale]["NotUpdated"]
            })
        end
    end, LoginedMotel, LoginedMotelRoom, data)
end

local function DeleteFeedback(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:DeleteFeedBack', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = Config.Lang[Config.Locale]["DeletedFeedback"]
            })
            local motelID = GetCodeFromMotelId(data.mcode)
            OpenBossMenu({id = motelID})
        end
    end, data)
end

local function KickAllRooms(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:KickAllRooms', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = Config.Lang[Config.Locale]["AllKicked"]
            })
            local motelID = GetCodeFromMotelId(data.mcode)
            OpenBossMenu({id = motelID})
        end
    end, data.mcode)
end

local function DepositMotelCase(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:DepositOrWith', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = Config.Lang[Config.Locale]["Oley"]
            })
            local motelID = GetCodeFromMotelId(data.mcode)
            OpenBossMenu({id = motelID})
        else
            Notify({
                title = Config.Lang[Config.Locale]["Error"],
                type = 'error',
                text = Config.Lang[Config.Locale]["IkisindenBiri"]
            })
        end
    end, data)
end

local function UpdateMotelCorridorColor(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateMotelCorridorColor', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = string.format(Config.Lang[Config.Locale]["ChangedCorridorColor"], data.color)
            })
            LoadCorridorColor(data.default, data.color)
            local motelID = GetCodeFromMotelId(data.mcode)
            OpenBossMenu({id = motelID})        
        end
    end, data)
end

local function UpdateMotelGarageColor(data)
    Resmon.Lib.Callback.Client('0R:Motels:Server:UpdateMotelGarageColor', function(export)
        if export then
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = Config.Lang[Config.Locale]["ChangedGarageColor"]
            })
            local motelID = GetCodeFromMotelId(data.mcode)
            LoadGarageColor(motelID)
            OpenBossMenu({id = motelID})        
        end
    end, data)
end

local function TranferMotelOwnership(data)
    local GetPlayer, Distance = Resmon.Lib.GetClosestPlayer()
    if GetPlayer ~= -1 and Distance <= 2.0 then
        Resmon.Lib.Callback.Client('0R:Motels:Server:TranferMotelOwnership', function(export)
            if export then
                Notify({
                    title = Config.Lang[Config.Locale]["Successfull"],
                    type = 'success',
                    text = string.format(Config.Lang[Config.Locale]["YouTransferedOwnership"], export.name)
                })
            end
        end, GetPlayerServerId(GetPlayer), data.mcode)
    else
        Notify({
            title = Config.Lang[Config.Locale]["Error"],
            type = 'error',
            text = Config.Lang[Config.Locale]["ThereIsntNoOneV"]
        })
    end
end

local function LeaveCorridor()
    SetNuiFocus(false, false)
    Resmon.Lib.Callback.Client('0R:Motels:Server:LeaveApartment', function(cb)
        ExitCorridor(cb)
    end)
end

local IsLoadTeleportRoomsRunning = false
local activeThread = nil

function EnterPlayerCorridor(data)
    StopLoadTeleportRooms()
    local id = GetCodeFromMotelId(data.mcode)
    SetNuiFocus(false, false)
    local coord = Config.Corridor.Coord
    LoginedMotel = id
    LoginedFloorX.a1 = tonumber(data.between)
    LoginedFloorX.a2 = tonumber(data.between2)
    LoginedFloor = tonumber(data.asd)
    Resmon.Lib.HideTextUI()
    LoadCorridorColor(nil, Config.Motels[id].theme)
    local ped = PlayerPedId()
    DoScreenFadeOut(500)
    Wait(1500)
    SetEntityCoords(ped, coord)
    Wait(500)
    DoScreenFadeIn(500)
    TriggerServerEvent('0R:Motels:Server:SetPlayerCorridor', LoginedMotel, LoginedFloorX.a1, LoginedFloorX.a2, LoginedFloor, Config.Motels[id].theme)
    LoginedMotel = id
    LoadTeleportRooms(id, tonumber(data.between), tonumber(data.between2))
end

local IsLoadTeleportRoomsRunning = false
local activeThread = nil

function LoadTeleportRooms(id, b, a)
    if IsLoadTeleportRoomsRunning then
        IsLoadTeleportRoomsRunning = false
        Citizen.Wait(1000)
        if activeThread then
            Citizen.StopThread(activeThread)
            activeThread = nil
        end
    end

    IsLoadTeleportRoomsRunning = true

    activeThread = Citizen.CreateThread(function()
        local AlCapone = false
        local Text = nil

        while IsLoadTeleportRoomsRunning do
            local Sleep = 2000
            local ped = PlayerPedId()
            local Lahana = false
            local DoorState = nil
            local pedCoord = GetEntityCoords(ped)
            for index = b, a do
                local v = Config.Motels[id].rooms[index]
                if v == nil then
                    break
                end
                if v.Teleport then
                    local Vidar = vec3(v.EnterCoord[1], v.EnterCoord[2], v.EnterCoord[3])
                    local coordDifference = #(pedCoord - Vidar)
                    if coordDifference <= 0.7 then
                        Sleep = 1
                        Lahana = true
                        NearRoom = index
                        NearRoomType = v.Teleport
                       if v.Lock then
                            DoorState = Config.Lang[Config.Locale]["LOCKED"]
                        else
                            DoorState = Config.Lang[Config.Locale]["UNLOCKED"]
                        end
                        if not Config.MetaDataSystem then
                            Text = string.format(Config.Lang[Config.Locale]["RoomNoInfoNotMetadataXP"], index, DoorState)
                            if IsControlJustReleased(0, 38) and not IsInteracting then
                                IsInteracting = true
                                if HasRoomKeys(Config.Motels[id].mcode, v.rCode) then
                                    Animation_2()
                                    ToggleTeleportRoomLock(id, index)
                                    if not v.Lock then
                                        DoorState = Config.Lang[Config.Locale]["LOCKED"]
                                    else
                                        DoorState = Config.Lang[Config.Locale]["UNLOCKED"]
                                    end
                                    if v.Lock == true then
                                        Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoNotMetadataTp"], index, DoorState))
                                    else
                                        Resmon.Lib.ShowTextUI(string.format(Config.Lang[Config.Locale]["RoomNoInfoNotMetadataXP"], index, DoorState))
                                    end
                                else
                                    Notify({ title = Config.Lang[Config.Locale]["Error"], text = Config.Lang[Config.Locale]["NotHaveKey"], type = 'error' })
                                end
                                Citizen.Wait(1000)
                                IsInteracting = false
                            end

                            if IsControlJustReleased(0, 47) then
                                if v.Lock == false then
                                    EnterPlayerRoom(id, index)
                                end
                            end
                            if IsControlJustReleased(0, 23) then
                                if v.Lock == true then
                                    SendRoomJoinRequest(id, index)
                                end
                            end
                        else
                            if v.Lock == false then
                                Text = string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadataTeleportOpened"], index, DoorState)
                            else
                                Text = string.format(Config.Lang[Config.Locale]["RoomNoInfoMetadataTeleportClosed"], index, DoorState)
                            end

                            if IsControlJustReleased(0, 47) then
                                if v.Lock == false then
                                    EnterPlayerRoom(id, index)
                                end
                            end

                            if IsControlJustReleased(0, 23) then
                                if v.Lock == true then
                                    SendRoomJoinRequest(id, index)
                                end
                            end
                        end
                    else
                        NearRoom = 0
                    end
                else
                    break
                end
            end

            if not AlCapone and Lahana then
                AlCapone = true
                Resmon.Lib.ShowTextUI(Text)
            end

            if AlCapone and not Lahana then
                AlCapone = false
                Resmon.Lib.HideTextUI()
            end

            Citizen.Wait(Sleep)
        end

        IsLoadTeleportRoomsRunning = false
    end)
end

local animating = false
local animationTime = 6000

RegisterNetEvent('0R:Motels:Client:UseLockpick')
AddEventHandler('0R:Motels:Client:UseLockpick', function()
    local ped = PlayerPedId()
    local success = false
    if NearRoom > 0 then
        if Config.LockPickSystem == 'ox' then
            success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
        else
            success = exports["2na_lockpick"]:createGame(3, 1)
        end
        if success then
            if NearRoomType then
                RequestAnimDict("mp_arresting")
                while (not HasAnimDictLoaded("mp_arresting")) do Citizen.Wait(0) end
                TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 1.0 ,-1.0 , 5500, 0, 1, true, true, true)
                Wait(6000)
                EnterPlayerRoom(LoginedMotel, NearRoom)
            else
                RequestAnimDict("mp_arresting")
                while (not HasAnimDictLoaded("mp_arresting")) do Citizen.Wait(0) end
                TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 1.0 ,-1.0 , 5500, 0, 1, true, true, true)
                MotelId = LoginedMotel*1000
                Conclusion = NearRoom+MotelId   
                StateD = DoorSystemGetDoorState(0x100+Conclusion) == 0 and 1 or 0
                Wait(6000)
                ChangeDoorStatus(StateD, Config.Motels[LoginedMotel].rooms[NearRoom], LoginedMotel+NearRoom, NearRoom, LoginedMotel)
            end
            Notify({
                title = Config.Lang[Config.Locale]["Successfull"],
                type = 'success',
                text = Config.Lang[Config.Locale]["UnlockedTheDoor"]
            })
        else
            Notify({
                type = 'error',
                title = Config.Lang[Config.Locale]["Error"],
                text = Config.Lang[Config.Locale]["Yapamadin"]
            })
        end
    end
end)

-- You can add a function to explicitly stop the execution if needed
function StopLoadTeleportRooms()
    if IsLoadTeleportRoomsRunning then
        IsLoadTeleportRoomsRunning = false
        if activeThread then
            Citizen.StopThread(activeThread)
            activeThread = nil
        end
    end
end

local function SetV()
    OpenElevatorMenu(LoginedGarage, false, false, false)
end

CreateThread(ReceptionArea)
CreateThread(StartClient)
CreateThread(NoTeleportArea)
CreateThread(StashArea)
CreateThread(WardrobeArea)
CreateThread(ExitArea)
CreateThread(Garage)
CreateThread(ExitGarageArea)
CreateThread(CorridorArea)
CreateThread(Shower)
CreateThread(GarageElevator)
CreateThread(SecondFloorArea)
CreateThread(EditRoomArea)

RegisterNUICallback('ChangeRoomPaymenType', ChangeRoomPaymenType)
RegisterNUICallback('PayInvoice', PayInvoice)
RegisterNUICallback('UzatOdaZaman', UzatOdaZaman)
RegisterNUICallback('RoomRentUzat', RoomRentUzat)
RegisterNUICallback('LeaveMotelRoom', LeaveMotelRoom)
RegisterNUICallback('RentMotelRoom', RentMotelRoom)
RegisterNUICallback('CreateFeedback', CreateFeedback)
RegisterNUICallback('GiveMotelCardKey', GiveMotelCardKey)
RegisterNUICallback('CopyRoomKey', CopyRoomKey)
RegisterNUICallback('PutVehicleGarage', PutVehicleGarage)
RegisterNUICallback('DeleteFeedback', DeleteFeedback)
RegisterNUICallback('KickAllRooms', KickAllRooms)
RegisterNUICallback('SetPlayerCoord', SetPlayerCoord)
RegisterNUICallback('UpdateMotelCorridorColor', UpdateMotelCorridorColor)
RegisterNUICallback('LoadRoomTheme', LoadRoomTheme)
RegisterNUICallback('DepositMotelCase', DepositMotelCase)
RegisterNUICallback('ChangeRoomKey', ChangeRoomKey)
RegisterNUICallback('SetPlayerKat', EnterPlayerCorridor)
RegisterNUICallback('EnterGarage', EnterPlayerGarageV)
RegisterNUICallback('Cal', Cal)
RegisterNUICallback('UpdateMotelGarageColor', UpdateMotelGarageColor)
RegisterNUICallback('LeaveCorridor', LeaveCorridor)
RegisterNUICallback('LeaveGarage', LeaveGarageV)
RegisterNUICallback('UpdateStashWeight', UpdateStashWeight)
RegisterNUICallback('TranferMotelOwnership', TranferMotelOwnership)
RegisterNUICallback('GivePlayerKeyCard', GivePlayerKeyCard)
RegisterNUICallback('SetV', SetV)
RegisterNUICallback('LoadSelectedRoomTypeRooms', LoadSelectedRoomTypeRooms)
RegisterNUICallback('AddNewFloor', AddNewFloor)
RegisterNUICallback('RemoveKeyByCid', RemoveKeyByCid)
RegisterNUICallback('OpenBossMenu', OpenBossMenu)
RegisterNUICallback('SetPlayerGarage', EnterPlayerGarageV)
RegisterNUICallback('LoadSelectedKeyRoom', LoadSelectedKeyRoom)
RegisterNUICallback('BuyBusinessMotel', BuyBusinessMotel)
RegisterNetEvent('0R:Motels:Client:SendServerData', SendServerData)
RegisterCommand(Config.KeysListCommand, OpenPlayerMotelKeys)
