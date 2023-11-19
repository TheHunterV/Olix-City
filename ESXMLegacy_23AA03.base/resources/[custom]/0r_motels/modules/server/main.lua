Resmon = exports["0r_lib"]:GetCoreObject()
Started = false 
DoorStates = {}
HotelCaches = {}
Inventory = {}
Requests = {}
Kamuran = {}
Inventory.custom = true
ScriptName = GetInvokingResource() or GetCurrentResourceName()
Inventory.name = 'Custom Inventory'

local hasUnpaidBill = false

local function Emsalsiz(src)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(tonumber(src))
    if not xPlayer then
        xPlayer = {}  -- veya başka bir varsayılan oyuncu nesnesi oluşturabilirsiniz.
    end

    if xPlayer.identifier ~= nil then
        Players = Players or {}
        Players[xPlayer.identifier] = Players[xPlayer.identifier] or {} -- Boş bir tablo oluşturuyoruz

        for k, v in pairs(Config.Motels) do
            for q, s in pairs(v.caches) do
                if s.Motel then
                    if not Players[xPlayer.identifier].motel then
                        Players[xPlayer.identifier].motel = s
                    end
                elseif s.Garage ~= 'none' then
                    if Players[xPlayer.identifier].garage == nil then
                        Players[xPlayer.identifier].garage = s
                    end
                else
                    if Players[xPlayer.identifier].room == nil then
                        Players[xPlayer.identifier].room = s
                    end
                end
            end
        end
        TriggerClientEvent('0R:Motels:Client:SendCache', xPlayer.source, Players[xPlayer.identifier])
    end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(_, xPlayer)
    Players = {}
    Players[xPlayer.identifier] = {} -- Boş bir tablo oluşturuyoruz
    for k, v in pairs(Config.Motels) do
        for q, s in pairs(v.caches) do
            if s.Motel then
                if not Players[xPlayer.identifier].motel then
                    Players[xPlayer.identifier].motel = s
                end
            elseif s.Garage ~= 'none' then
                if Players[xPlayer.identifier].garage == nil then
                    Players[xPlayer.identifier].garage = s
                end
            else
                if Players[xPlayer.identifier].room == nil then
                    Players[xPlayer.identifier].room = s
                end
            end
        end
    end

    TriggerClientEvent('0R:Motels:Client:SendCache', xPlayer.source, Players[xPlayer.identifier])
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
    Players = {}
    Players[xPlayer.identifier] = {} -- Boş bir tablo oluşturuyoruz
    for k, v in pairs(Config.Motels) do
        for q, s in pairs(v.caches) do
            if s.Motel then
                if not Players[xPlayer.identifier].motel then
                    Players[xPlayer.identifier].motel = s
                end
            elseif s.Garage ~= 'none' then
                if Players[xPlayer.identifier].garage == nil then
                    Players[xPlayer.identifier].garage = s
                end
            else
                if Players[xPlayer.identifier].room == nil then
                    Players[xPlayer.identifier].room = s
                end
            end
        end
    end

    TriggerClientEvent('0R:Motels:Client:SendCache', xPlayer.source, Players[xPlayer.identifier])
end)


if GetResourceState('ox_inventory') ~= 'missing' then
	Inventory.ox = true
    Inventory.name = 'Ox Inventory'
    Inventory.custom = false
end

if GetResourceState('qb-inventory') ~= 'missing' then
	Inventory.qb = true
    Inventory.name = 'QBCore Inventory'
    Inventory.custom = false
end

if GetResourceState('core_inventory') ~= 'missing' then
	Inventory.core = true
    Inventory.name = 'Core Inventory'
    Inventory.custom = false
end

if GetResourceState('qs-inventory') ~= 'missing' then
	Inventory.qs = true
    Inventory.name = 'Quasar Inventory'
    Inventory.custom = false
end

local function StartServer()
    local getSqlData = MySQL.Sync.fetchAll('SELECT * FROM 0r_motels')
    
    if getSqlData ~= nil then
        Config.Motels = getSqlData
    end
    
    local GetMotels = Config.Motels 
    
    for k,v in pairs(GetMotels) do
        v.ownerName = Resmon.Lib.GetPlayerOfflineName(v.owner)
        if v.owner == nil then
            v.ownerName = Config.Lang["NoOwner"]
        end
        v.rooms = json.decode(v.rooms)
        v.coords = json.decode(v.coords)
        v.bills = json.decode(v.bills)
        v.moneylogs = json.decode(v.moneylogs)
        v.caches = json.decode(v.caches)
        v.recentrents = json.decode(v.recentrents)
        v.garage = json.decode(v.garage)
        v.feedbacks = json.decode(v.feedbacks)
        v.notifys = json.decode(v.notifys)
        v.apartment = tonumber(v.apartment)
        v.odaSayi = #v.rooms
        for q,s in pairs(v.rooms) do
            if s.Owner == Config.Lang[Config.Locale]["NoOwner"] then
                v.fullRoomSayi = v.odaSayi - q
                s.ownerName = Config.Lang[Config.Locale]["NoOwner"]
            else
                v.fullRoomSayi = v.odaSayi
                s.ownerName = Resmon.Lib.GetPlayerOfflineName(s.Owner)
            end
        end
    end

    Config.Motels = GetMotels
    OxInventoryStash()
    print("^2[0R MOTELS]^7 Motels And Apartment Loaded")
    print("^2[0R MOTELS]^7 Inventory: ^5"..Inventory.name..'^7')
    print("^2[0R MOTELS]^7 Version: ^3"..GetResourceMetadata(ScriptName, "version")..'^7')
end

local function GetPlayerPhoneNumber(source)
    local number = Config.GetPlayerPhoneNumber(source)
    if number == nil then
        number = Resmon.Lib.GenerateCode()
    end
    return number
end

local function AddRecentRent(source, xPlayer, mCode, Room, Price, Date, Typ)
    local tabl = {}
    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            table.insert(v.recentrents, {
                PlayerName = xPlayer.name,
                Price = Price,
                Date = Date,
                Phone = GetPlayerPhoneNumber(source),
                RoomTyp = Typ,
                Room = Room,
                Cid = xPlayer.identifier
            })
        end
        tabl = v.recentrents
    end

    Resmon.Lib.UpdateMotelSQL("recentrents", json.encode(tabl), mCode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', source, Config.Motels)
end

local function GetCodeFromMotel(code)
    for k,v in pairs(Config.Motels) do
        if v.mcode == code then
            return v
        end
    end
end

RegisterNetEvent('OnlyBucket', function(bucket)
    local src = source 
    SetPlayerRoutingBucket(src, tonumber(bucket))
end)

RegisterNetEvent('0R:Motels:Server:SetPlayerCorridor')
AddEventHandler('0R:Motels:Server:SetPlayerCorridor', function(MotelId, A1, A2, Floor, Theme)
    local src = source
    local MerhametEdiniz = Resmon.Lib.GetPlayerFromSource(src)

    if next(Config.Motels[MotelId].caches) then
        for k,v in pairs(Config.Motels[MotelId].caches) do
            if not v.Motel then
                if v.Identifier == MerhametEdiniz.identifier then
                    table.remove(Config.Motels[MotelId].caches, k)
                end
            end
        end
    end

    local Data = {
        Identifier = MerhametEdiniz.identifier,
        mCode = Config.Motels[MotelId].mcode,
        Motel = true,
        Floor = Floor,
        Theme = Theme,
        a1 = A1,
        a2 = A2,
        Garage = 'none',
        Id = MotelId
    }

    table.insert(Config.Motels[MotelId].caches, Data)

    Config.Motels[MotelId].BucketId = MotelId + 2000

    Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[MotelId].caches), Config.Motels[MotelId].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)
end)

RegisterNetEvent('0R:Motels:Server:SetPlayerRoom')
AddEventHandler('0R:Motels:Server:SetPlayerRoom', function(MotelId, RoomId, A1, A2, Floor, Theme)
    local src = source
    local MerhametEdiniz = Resmon.Lib.GetPlayerFromSource(src)

    if next(Config.Motels[MotelId].caches) then
        for k,v in pairs(Config.Motels[MotelId].caches) do
            if not v.Motel then
                if v.Identifier == MerhametEdiniz.identifier then
                    table.remove(Config.Motels[MotelId].caches, k)
                end
            end
        end
    end

    local Data = {
        Identifier = MerhametEdiniz.identifier,
        mCode = Config.Motels[MotelId].mcode,
        Motel = false,
        Floor = Floor,
        Theme = Theme,
        a1 = A1,
        a2 = A2,
        Garage = 'none',
        Id = RoomId,
    }

    table.insert(Config.Motels[MotelId].caches, Data)

    Config.Motels[MotelId].rooms[RoomId].BucketId = MotelId + RoomId + 1000

    Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[MotelId].caches), Config.Motels[MotelId].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)
end)

RegisterNetEvent('0R:Motels:Server:SetCustomBucket')
AddEventHandler('0R:Motels:Server:SetCustomBucket', function(bucket)
    local src = source 
    SetPlayerRoutingBucket(src, bucket)
end)

RegisterCommand('vah', function(source)
    SetPlayerRoutingBucket(source, 0)
end)

RegisterNetEvent('0R:Motels:Server:SetPlayerGarage')
AddEventHandler('0R:Motels:Server:SetPlayerGarage', function(MotelId, A1, A2, Floor, Theme)
    local src = source
    local MerhametEdiniz = Resmon.Lib.GetPlayerFromSource(src)

    if next(Config.Motels[MotelId].caches) then
        for k,v in pairs(Config.Motels[MotelId].caches) do
            if not v.Motel then
                if v.Identifier == MerhametEdiniz.identifier then
                    table.remove(Config.Motels[MotelId].caches, k)
                end
            end
        end
    end

    local Data = {
        Identifier = MerhametEdiniz.identifier,
        mCode = Config.Motels[MotelId].mcode,
        Motel = false,
        Floor = Floor,
        Theme = Theme,
        a1 = A1,
        a2 = A2,
        Garage = 'garage',
        Id = MotelId,
    }

    table.insert(Config.Motels[MotelId].caches, Data)

    Config.Motels[MotelId].BucketId = MotelId + 100

    Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[MotelId].caches), Config.Motels[MotelId].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)
end)

RegisterNetEvent('0R:Motels:Server:SetPlayerBucket')
AddEventHandler('0R:Motels:Server:SetPlayerBucket', function(id, room, garage, a1, a2, kat)
    if not garage then garage = "none" end
    local src = source
    local xPlayer = Resmon.Lib.GetPlayerFromSource(src)
    local motel = true

    if kat == 2 then
        kat = 1
    end

    local found = false

    -- if next(Config.Motels[id].caches) ~= nil then
    --     for k,v in pairs(Config.Motels[id].caches) do
    --         if v.Identifier == xPlayer.identifier then
    --             if room then
    --                 if v.Motel then
    --                     table.remove(Config.Motels[id].caches, k)
    --                 end
    --             end
    --         end
    --     end
    -- end

    if found then
        Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[id].caches), Config.Motels[id].mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)
    end

    if room then
        motel = false
    end

    xPlayer = Resmon.Lib.GetPlayerFromSource(src)

    while not xPlayer do 
        xPlayer = Resmon.Lib.GetPlayerFromSource(src)
        Citizen.Wait(1)
    end

    local ID = 0     

    if motel then
        ID = id
        if not Config.Motels[id].BucketId then 
            Config.Motels[id].BucketId = id + 2000
        end
    elseif garage ~= 'none' then
        ID = id
        if not Config.Motels[id].BucketGarage then 
            Config.Motels[id].BucketGarage = id + 100
        end   
    else
        ID = room
        if Config.Motels[id].rooms[room].BucketId == nil then 
            Config.Motels[id].rooms[room].BucketId = id + room + 1000
        end        
    end

    local HotelCache = {
        Identifier = xPlayer.identifier,
        mCode = Config.Motels[id].mcode,
        Motel = motel,
        Floor = kat,
        a1 = a1,
        a2 = a2,
        Garage = garage,
        Id = ID
    }

    if not Config.Motels[id].caches then
        Config.Motels[id].caches = {}
    end

    -- Kontrol ekleniyor
    local isDuplicate = false

    for _, cache in pairs(Config.Motels[id].caches) do
        if cache.Identifier == HotelCache.Identifier and
           cache.mCode == HotelCache.mCode and
           cache.Motel == HotelCache.Motel and
           cache.Garage == HotelCache.Garage and
           cache.a1 == HotelCache.a1 and
           cache.a2 == HotelCache.a2 and
           cache.Floor == HotelCache.Floor and
           cache.Id == HotelCache.Id then
            isDuplicate = true
            break
        end
    end

    -- Eğer yinelenmiyorsa ekle
    if not isDuplicate then
        table.insert(Config.Motels[id].caches, HotelCache)
    end

    Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[id].caches), Config.Motels[id].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)

    if motel and garage == 'none' then
        SetPlayerRoutingBucket(src, Config.Motels[id].BucketId)
    elseif garage ~= 'none' then
        SetPlayerRoutingBucket(src, Config.Motels[id].BucketGarage)
    else
        SetPlayerRoutingBucket(src, Config.Motels[id].rooms[room].BucketId)
    end

    if kat then
        SetPlayerRoutingBucket(src, 3700+a1+a2)
    end
end)


RegisterNetEvent('0R:Motels:Server:ExitPlayerBucket', function(id)
    local src = source
    local xPlayer = Resmon.Lib.GetPlayerFromSource(src)

    while not xPlayer do 
       xPlayer = Resmon.Lib.GetPlayerFromSource(src)
       Citizen.Wait(1)
    end
 
    SetPlayerRoutingBucket(src, 0)

    for k,v in pairs(Config.Motels) do
        if k == id then
            for q,s in pairs(v.caches) do
                if s.Motel == true then
                    if s.Identifier == xPlayer.identifier then
                        table.remove(v.caches, q)
                    end
                end
                if s.Garage == 'garage' then
                    if s.Identifier == xPlayer.identifier then
                        table.remove(v.caches, q)
                    end
                end
            end
        end
    end

    Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[id].caches), Config.Motels[id].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:PutVehicleMotelGarage', function(source, cb, plate, props, id, room, model)
    local sqlInfo = Resmon.Lib.GetVehiclesTableName()
    MySQL.update('UPDATE '..sqlInfo[1]..' SET '..sqlInfo[3]..'= ? WHERE plate = ?', {3, plate})
    Config.Motels[id].rooms[room].garage = {state = 1, model = props.model, props = props, plate = plate, modelx = model}
    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(Config.Motels[id].rooms), Config.Motels[id].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(true)
end)

RegisterNetEvent('0R:Motels:Server:LeaveRoomApartment', function(id, data)
    local src = source
    local xPlayer = Resmon.Lib.GetPlayerFromSource(src)

    while not xPlayer do 
       xPlayer = Resmon.Lib.GetPlayerFromSource(src)
       Citizen.Wait(1)
    end
 
    SetPlayerRoutingBucket(src, Config.Motels[id].BucketId)

    for k,v in pairs(Config.Motels) do
        if k == id then
            for q,s in pairs(v.caches) do
                if s.Motel == false then
                    if s.Id == data.Id then
                        table.remove(v.caches, q)
                    end
                end
            end
        end
    end

    Resmon.Lib.UpdateMotelSQL("caches", json.encode(Config.Motels[id].caches), Config.Motels[id].mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', src, Config.Motels)
end)




RegisterNetEvent('0R:Motels:Server:RequestJoin', function(motel, room)
    local src = source 
    local Player = Resmon.Lib.GetPlayerFromSource(src)

    if not Config.Motels[motel].rooms[room].Request then
        Config.Motels[motel].rooms[room].Request = true
    end

    if Config.Motels[motel].rooms[room].Owner == Config.Lang[Config.Locale]["NoOwner"] then
        TriggerClientEvent('0R:Lib:Notify', Player.source, {type = 'error', title = Config.Lang[Config.Locale]["Error"], text = Config.Lang[Config.Locale]["ThereIsntNoOne"]})
        return
    end

    local RoomOwner = Resmon.Lib.GetPlayerByIdentifier(Config.Motels[motel].rooms[room].Owner)
    RoomOwner = Resmon.Lib.GetPlayerFromSource(RoomOwner)

    local Requester = {
        src = src,
        motel = motel,
        room = room,
        text = string.format(Config.Lang[Config.Locale]['InfoPlayerName'], Player.name)
    }

    if RoomOwner then
        TriggerClientEvent('0R:Motels:Client:SendRequestOwner', RoomOwner.source, Requester)
    end

    Config.Motels[motel].rooms[room].Request = false
end)

RegisterNetEvent('0R:Motels:Server:PlayerAcceptRoom', function(motel, room, src)
    Config.Motels[motel].rooms[room].Request = false 
    TriggerClientEvent('0R:Motels:Client:PlayerEnterRoom', src, motel, room)
end)

RegisterNetEvent('0R:Motels:Server:PlayerRejectRoom', function(motel, room, src)
    Config.Motels[motel].rooms[room].Request = false 
    TriggerClientEvent('0R:Motels:Client:PlayerRejectRoom', src, motel, room)
end)

local function GetCodeFromMotelId(code)
    for k,v in pairs(Config.Motels) do
        if v.mcode == code then
            return k
        end
    end
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

if Inventory.qb or Inventory.qs then
    Resmon.Lib.RegisterUsableItem(Config.MotelCardItem, function(source, item)
        local Player = Resmon.Lib.GetPlayerFromSource(source)
        if Player then
            if GetItemBySlot(source, item.slot) ~= nil then
                local kibV = {Motel = GetCodeFromMotelId(item.info.mcode), rCode = item.info.rCode}
                TriggerClientEvent('0R:Motels:Client:OpenDoorNotTeleport', source, kibV)
            end
        end
    end)
elseif Inventory.core then
    Resmon.Lib.RegisterUsableItem(Config.MotelCardItem, function(source, item)
        local Player = Resmon.Lib.GetPlayerFromSource(source)
        if Player then
            local kibV = {Motel = GetCodeFromMotelId(item.metadata.mcode), rCode = item.metadata.rCode}
            TriggerClientEvent('0R:Motels:Client:OpenDoorNotTeleport', source, kibV)
        end
    end)
end

local function AddPlayerMotelCard(xPlayer, mcode, roomid)
    local motel = GetCodeFromMotel(mcode)
    local givedCard = false
    local hasCard = false
    local ro = {}
    local room = motel.rooms[roomid]
    if Config.MetaDataSystem then
        if Inventory.ox then
            local metadata = {roomid = roomid, rCode = room.rCode, mcode = mcode, description = string.format(Config.Lang[Config.Locale]["ItemDescription"], motel.name, roomid)}
            exports.ox_inventory:AddItem(xPlayer.source, Config.MotelCardItem, 1, metadata)
            givedCard = true
        elseif Inventory.qb then
            xPlayer.Functions.AddItem(Config.MotelCardItem, 1, nil, {roomid = roomid, rCode = room.rCode, mcode = mcode, motelname = motel.name})
            givedCard = true
        elseif Inventory.qs then
            exports['qs-inventory']:AddItem(xPlayer.source, Config.MotelCardItem, 1, nil, {roomid = roomid, rCode = room.rCode, mcode = mcode, motelname = motel.name})
            givedCard = true
        elseif Inventory.core then
            if Resmon.Lib.GetFramework() == 'ESX' then
                xPlayer.addInventoryItem(Config.MotelCardItem, 1, {roomid = roomid, rCode = room.rCode, mcode = mcode, motelname = motel.name}) 
            else
                xPlayer.Functions.AddItem(Config.MotelCardItem, 1, {roomid = roomid, rCode = room.rCode, mcode = mcode, motelname = motel.name}) 
            end
            givedCard = true
        end
    else
        for k,v in pairs(Config.Motels) do
            if v.mcode == mcode then
                for q,s in pairs(v.rooms) do
                    if q == roomid then
                        if #s.Keys == 0 then
                            table.insert(s.Keys, {
                                keyowner = xPlayer.identifier,
                                pname = xPlayer.name,
                                roomid = roomid,
                                mcode = mcode,
                                rcode = room.rCode
                            })
                            givedCard = true
                        end
                    else
                        for k,v in pairs(s.Keys) do 
                            if v.keyowner == xPlayer.identifier then
                                hasCard = true
                                TriggerClientEvent('0R:Lib:Notify', xPlayer.source, {type = 'error', title = Config.Lang[Config.Locale]["Error"], text = Config.Lang[Config.Locale]["AlreadyHaveCard"]})
                            end
                        end

                        if not hasCard and not givedCard then
                            table.insert(s.Keys, {
                                keyowner = xPlayer.identifier,
                                roomid = roomid,
                                pname = xPlayer.name,
                                mcode = mcode,
                                rcode = room.rCode
                            })
                            givedCard = true
                        end
                    end
                end
                ro = v.rooms
            end
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(ro), mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    
    if givedCard then
        TriggerClientEvent('0R:Lib:Notify', xPlayer.source, {title = Config.Lang[Config.Locale]["success"],  text = string.format(Config.Lang[Config.Locale]["GivedMotelRoomCard"], roomid), type = 'success'})
    end
end

AddMotelMoney = function(mcode, money)
    local newMoney = 0
    local newGelir = 0

    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            v.money = v.money + money
            v.revenue = v.revenue + money
        end
        newMoney = v.money
        newGelir = v.revenue
    end

    AddMoneyLog(mcode, money, 'deposit')
    Resmon.Lib.UpdateMotelSQL("money", newMoney, mcode)
    Resmon.Lib.UpdateMotelSQL("revenue", newGelir, mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end

local function Auth(source)
    local Auth = false
    local PlyLicense = GetPlayerIdentifierByType(source, 'license')
    if PlyLicense then
        for k,v in pairs(Config.MotelAdminMenuAccessible) do
            if v == PlyLicense then
                Auth = true
            end
        end
    end
    return Auth
end

local function OpenMotelAdmin(source)
    TriggerClientEvent('0R:Motels:Client:OpenAdminMenu', source, Auth(source))
end

local function RequestClientData()
    local source = source
    Started = true
    TriggerClientEvent('0R:Motels:Client:SendServerData', source, Config.Motels)
    Wait(1000)
    Emsalsiz(source)
end

AddBill = function(mcode, roomid, payer, amount, rentprice, status)
    local PlayerName = Resmon.Lib.GetPlayerOfflineName(payer)
    local Motel = GetCodeFromMotel(mcode)
    local MotelBills = Motel.bills

    local Bill = {
        RoomId = roomid,
        Payer = PlayerName,
        RentPrice = rentprice,
        Cid = payer,
        Amount = amount,
        PayDate = os.date('%Y-%m-%d'),
        Status = status
    }

    for q,s in pairs(Config.Motels) do
        if next(s.bills) then
            for k,v in pairs(s.bills) do
                if true then
                    table.insert(MotelBills, Bill)
                    break
                end
            end
        else
            table.insert(MotelBills, Bill)
            break
        end
        s.bills = MotelBills
    end

    Resmon.Lib.UpdateMotelSQL("bills", json.encode(MotelBills), mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end

local function dec(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local function saveBase64ImageToFile(base64Image, fileName, cb)
    local decodedImage = base64Image:match('base64,(.*)')
    if not decodedImage then
        -- print('Geçersiz base64 resim verisi.')
        return
    end

    local decodedBytes = dec(decodedImage)
    local resourcePath = GetResourcePath(GetCurrentResourceName())
    local savePath = resourcePath .. '/' .. fileName

    local file = io.open(savePath, 'wb')
    if not file then
        -- print('Dosya açılamadı: ' .. savePath)
        return
    end

    file:write(decodedBytes)
    file:close()
    -- print('Resim dosyası başarıyla kaydedildi: ' .. savePath)
end

local function AddNotification(mcode, owner, title, description)
    local NewNotify = {
        title = title,
        owner = owner,
        description = description,
        date = os.date('%Y-%m-%d %H:%M:%S')
    }

    local notifys = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            table.insert(v.notifys, NewNotify)
        end
        notifys = v.notifys
    end

    Resmon.Lib.UpdateMotelSQL("notifys", json.encode(notifys), mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end

local function KickMotelRoom(mcode, roomid)
    local mCode = mcode 
    print(mCode)
    local RoomId = tonumber(roomid)
    local CacheRooms = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            for q,s in pairs(v.rooms) do
                if q == RoomId then
                    s.Owner = Config.Lang[Config.Locale]["NoOwner"]
                    s.RentDate = ""
                    s.ownerName = Config.Lang[Config.Locale]["NoOwner"]
                    s.PaymentDate = Config.Lang[Config.Locale]["NotRented"]
                    s.Keys = {}
                    s.AutoPay = false
                    s.Day = 0
                end
            end
            CacheRooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(CacheRooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end

MySQL.ready(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `0r_motels` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `owner` text DEFAULT NULL,
            `mcode` text NOT NULL DEFAULT 'x',
            `apartment` text NOT NULL DEFAULT 0,
            `name` text NOT NULL,
            `theme` text NOT NULL DEFAULT 'marble',
            `garageth` text NOT NULL DEFAULT 1,
            `rooms` text NOT NULL DEFAULT '[]',
            `caches` text NOT NULL DEFAULT '[]',
            `bills` text NOT NULL DEFAULT '[]',
            `notifys` text NOT NULL DEFAULT '[]',
            `moneylogs` text NOT NULL DEFAULT '[]',
            `feedbacks` text NOT NULL DEFAULT '[]',
            `recentrents` text NOT NULL DEFAULT '[]',
            `saleprice` float NOT NULL DEFAULT 15000,
            `evascore` float NOT NULL DEFAULT 5,
            `rentprice` float NOT NULL,
            `coords` text NOT NULL DEFAULT 'vector3(0,0,0)',
            `garage` text NOT NULL DEFAULT 'vector3(0,0,0)',
            `discount` float NOT NULL,
            `money` float NOT NULL DEFAULT 100,
            `revenue` float NOT NULL DEFAULT 1,
            `floor` float NOT NULL DEFAULT 1,
            `blip` float NOT NULL DEFAULT 1,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
    ]], {}, function(created)
        if created == 1 then
            -- print('Tablo başarıyla oluşturuldu.')
        elseif created == 0 then
            -- print('Tablo zaten mevcut.')
        else
            -- print('Tablo oluşturulurken hata oluştu.')
        end

        MySQL.Async.fetchScalar([[
            SELECT COUNT(*) FROM `0r_motels`;
        ]], {}, function(count)
            if count == 0 then
                MySQL.Async.execute([[
                    INSERT INTO `0r_motels` (`mcode`, `apartment`, `name`, `rooms`, `saleprice`, `rentprice`, `coords`, `garage`, `discount`, `money`, `revenue`, `blip`)
                    VALUES ('tyyasx', 0, 'Pinkcage Motels', '[{"WardrobeCoord":[302.8941650390625,-206.78231811523438,54.22573471069336],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[306.83837890625,-208.6259307861328,54.22573471069336],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[307.4933776855469,-213.2112274169922,54.21992492675781],"EnterCoord":[307.4933776855469,-213.2112274169922,54.21992492675781],"rCode":"c27LDT","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[306.7842712402344,-197.03672790527345,54.22578430175781],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[310.587646484375,-198.7257843017578,54.22578811645508],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[311.15142822265627,-203.3059844970703,54.219970703125],"rCode":"CFDygm","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[322.26995849609377,-190.28573608398438,54.2255859375],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[320.4989013671875,-194.11221313476563,54.22558975219726],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[315.8019714355469,-194.7015380859375,54.22674942016601],"rCode":"qi4TzM","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[308.55523681640627,-224.228759765625,58.02458953857422],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[310.16558837890627,-220.37669372558595,58.02458953857422],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[314.79931640625,-219.92593383789063,58.04742050170898],"rCode":"L5Bp0F","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[302.8851013183594,-206.86549377441407,58.02334594726562],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[306.8250732421875,-208.54006958007813,58.02334594726562],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[307.40130615234377,-213.31492614746095,58.01510620117187],"rCode":"p44bUV","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[306.7640380859375,-196.96568298339845,58.02369689941406],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[310.6249694824219,-198.73895263671876,58.02369689941406],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[311.1482238769531,-203.3523406982422,58.01515197753906],"rCode":"yffPlr","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[322.3328857421875,-189.89093017578126,58.02392959594726],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[320.5035400390625,-194.1348876953125,58.02393341064453],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[315.8407897949219,-194.63629150390626,58.0151481628418],"rCode":"HMdxqG","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[343.9940185546875,-225.90118408203126,54.22627258300781],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[339.90509033203127,-224.17991638183595,54.22629165649414],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[339.1177062988281,-219.53041076660157,54.219970703125],"rCode":"rXsDbe","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[347.5715026855469,-216.00900268554688,54.22581481933594],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[343.556884765625,-214.2283935546875,54.225830078125],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[342.9592590332031,-209.5381317138672,54.21992492675781],"rCode":"WoXI0h","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[351.9380187988281,-206.36676025390626,54.22626113891601],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[347.380615234375,-204.3704071044922,54.22626876831055],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[346.7794494628906,-199.7992706298828,54.219970703125],"rCode":"rQsMQj","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[328.447021484375,-232.0357208251953,58.02376174926758],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[330.19610595703127,-228.0084228515625,58.02376174926758],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[334.9132995605469,-227.6024627685547,58.01506042480469],"rCode":"cnvXeA","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[343.8187255859375,-225.78343200683595,58.02272033691406],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[339.8282775878906,-224.14524841308595,58.02272415161133],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[339.15240478515627,-219.43344116210938,58.01505661010742],"rCode":"HO014D","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[347.7178955078125,-216.31166076660157,58.0227165222168],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[343.8222351074219,-214.3451385498047,58.02297973632812],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[342.9974060058594,-209.60006713867188,58.01509857177734],"rCode":"cgv6UF","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[351.3081970214844,-206.0116424560547,58.02272033691406],"DoorHash":-1156992775,"ownerName":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","Teleport":false,"StashCoord":[347.4094543457031,-204.38157653808595,58.02273178100586],"Owner":"]]..Config.Lang[Config.Locale]["NoOwner"]..[[","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "]]..Config.StashInfo.Weight..[[","EnterCoord":[346.7124328613281,-199.80166625976563,58.01510238647461],"rCode":"GI0aKI","Keys":[], "garage": [{"state": 0}]}]\n', 140000, 1000, '{\"x\": 325.22332763672, \"y\": -229.93481445313, \"z\": 54.221172332764}', '{\"x\": 300.0619, \"y\": -176.4830, \"z\": 357.3834}', 25, 500, 1, 23);
                ]], {["@mcode"] = Resmon.Lib.GenerateCode() }, function(inserted)
                    StartServer()
                end)

                MySQL.Async.execute([[
                    INSERT INTO `0r_motels` (`mcode`, `apartment`, `name`, `rooms`, `saleprice`, `rentprice`, `coords`, `garage`, `discount`, `money`, `revenue`, `blip`)
                    VALUES ('0resmon', 0, '0Resmon Motels', '[{\"PaymentDate\":\"\",\"InteriorType\":\"Economy\",\"AmountPay\":90,\"RentPrice\":100,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-364.8197937011719,59.11623764038086,54.43060684204101],\"Day\":0,\"Keys\":[],\"RentDate\":\"\",\"ownerName\":\"No Owner\",\"rCode\":\"32Ra7I\",\"garage\":{\"state\":0},\"StashCoord\":[-362.5556640625,62.00716781616211,54.43060684204101],\"StashWeight\":20,\"EnterCoord\":[-362.228271484375,57.92036056518555,54.45735168457031],\"DoorHash\":-165345653,\"Teleport\":false,\"AutoPay\":false},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-347.0229187011719,59.84858322143555,54.43060302734375],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-350.1658630371094,62.01705932617187,54.43059158325195],\"RentPrice\":100,\"rCode\":\"eL25cP\",\"garage\":{\"state\":0},\"EnterCoord\":[-350.6436157226563,58.0296516418457,54.45838928222656],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-344.9825744628906,59.41196823120117,54.43092346191406],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-340.8411560058594,58.79134368896484,54.4307975769043],\"RentPrice\":100,\"rCode\":\"qooXcd\",\"garage\":{\"state\":0},\"EnterCoord\":[-344.0174865722656,57.58146286010742,54.43380355834961],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-330.52362060546877,58.3834228515625,54.43060302734375],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-332.4536437988281,61.80944442749023,54.43060302734375],\"RentPrice\":100,\"rCode\":\"h6dsqM\",\"garage\":{\"state\":0},\"EnterCoord\":[-333.2607421875,57.2376708984375,54.42971420288086],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-326.8016052246094,55.47049331665039,58.75601959228515],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-323.09930419921877,51.7213134765625,58.75601959228515],\"RentPrice\":100,\"rCode\":\"7sfT1C\",\"garage\":{\"state\":0},\"EnterCoord\":[-329.4304504394531,52.08930969238281,58.75590515136719],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-329.9438781738281,58.36623764038086,58.77128601074219],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-332.5194396972656,62.21054458618164,58.75315475463867],\"RentPrice\":100,\"rCode\":\"Dhy1vn\",\"garage\":{\"state\":0},\"EnterCoord\":[-333.0529479980469,57.14945602416992,58.74612045288086],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-344.9284362792969,59.43688201904297,58.75307846069336],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-340.512939453125,58.75846099853515,58.75],\"RentPrice\":100,\"rCode\":\"QgHX8t\",\"garage\":{\"state\":0},\"EnterCoord\":[-344.1552734375,57.59633255004883,58.7464714050293],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-347.0979919433594,59.64298629760742,58.75307846069336],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-350.2971801757813,62.67428970336914,58.75154876708984],\"RentPrice\":100,\"rCode\":\"nrN8fW\",\"garage\":{\"state\":0},\"EnterCoord\":[-350.8865051269531,57.69403076171875,58.74643325805664],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-364.6502380371094,59.07054138183594,58.75776290893555],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-362.49163818359377,62.6180305480957,58.75315856933594],\"RentPrice\":100,\"rCode\":\"dNPAQM\",\"garage\":{\"state\":0},\"EnterCoord\":[-362.34954833984377,57.72758865356445,58.74774932861328],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]},{\"PaymentDate\":\"Not Rented Yet\",\"WardrobeCoord\":[-368.8405151367188,56.6843147277832,58.75018310546875],\"AutoPay\":false,\"InteriorType\":\"Economy\",\"ownerName\":\"No Owner\",\"StashCoord\":[-373.1167907714844,53.56340789794922,58.74992370605469],\"RentPrice\":100,\"rCode\":\"JB7Ikx\",\"garage\":{\"state\":0},\"EnterCoord\":[-366.6871337890625,53.13175582885742,58.74785614013672],\"StashWeight\":20,\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"DoorHash\":-165345653,\"Teleport\":false,\"Keys\":[]}]\n', 140000, 1000, '{\"x\": -369.49450683594, \"y\": 50.198177337646, \"z\": 54.429756164551}', '{\"x\": -369.84078979492, \"y\": 41.919914245605, \"z\": 51.020458221436}', 25, 500, 1, 3);
                ]], {["@mcode"] = Resmon.Lib.GenerateCode() }, function(inserted)
                    StartServer()
                end)

                MySQL.Async.execute([[
                    INSERT INTO `0r_motels` (`mcode`, `apartment`, `name`, `rooms`, `saleprice`, `rentprice`, `coords`, `garage`, `discount`, `money`, `floor`, `revenue`, `blip`)
                    VALUES ('tyyasxsad', 1, 'Banner Apartments', '[{\"StashWeight\":20,\"RentDate\":\"2023-10-22\",\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.05825805664066,-834.1322631835938,95.25498962402344],\"rCode\":\"JIkw45\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"InteriorType\":\"Double\",\"BucketId\":1003,\"AmountPay\":120,\"PaymentDate\":\"Not Rented Yet\",\"Lock\":false,\"garage\":{\"state\":0},\"Day\":1,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.9420166015625,-836.3258056640625,95.25498962402344],\"rCode\":\"HZJpME\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-227.05271911621098,-836.6587524414063,95.25508880615236],\"rCode\":\"ZOSCCj\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-227.91217041015626,-838.8856811523438,95.25508880615236],\"rCode\":\"DxxbdN\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"RentDate\":\"2023-10-22\",\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":true,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.2127227783203,-838.8497924804688,95.25498962402344],\"rCode\":\"BOX4Wm\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"InteriorType\":\"Double\",\"AmountPay\":120000,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":true,\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Day\":1000,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.78384399414066,-841.1177978515625,95.25498962402344],\"rCode\":\"z4mXEW\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.11322021484376,-834.1233520507813,100.76588439941406],\"rCode\":\"CqxkTS\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-235.0747833251953,-836.279052734375,100.76587677001952],\"rCode\":\"g9dUul\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-227.0373992919922,-836.7311401367188,100.76588439941406],\"rCode\":\"eqCNcV\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-228.01303100585936,-838.84716796875,100.76588439941406],\"rCode\":\"cH1GVu\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.0712890625,-838.8644409179688,100.76577758789064],\"rCode\":\"aXqzE3\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.7706298828125,-841.1199340820313,100.76577758789064],\"rCode\":\"8eQsmD\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.1670379638672,-834.02880859375,95.2550811767578],\"rCode\":\"2337wl\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.97555541992188,-836.3145751953125,95.2550811767578],\"rCode\":\"0js1fU\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-227.0304718017578,-836.668701171875,95.25497436523438],\"rCode\":\"i8Bd5z\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-228.05001831054688,-838.831787109375,95.25498962402344],\"rCode\":\"gp06N8\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.1187286376953,-838.8837890625,95.2551040649414],\"rCode\":\"eGpZwI\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.77642822265626,-841.1168212890625,95.25509643554688],\"rCode\":\"Sp5z7b\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.1606597900391,-834.1395263671875,100.76578521728516],\"rCode\":\"IL70I2\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-234.866943359375,-836.3512573242188,100.76578521728516],\"rCode\":\"muNAjv\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-227.1830291748047,-836.6514892578125,100.76587677001952],\"rCode\":\"jooqom\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-228.00729370117188,-838.8528442382813,100.76587677001952],\"rCode\":\"X74ZZQ\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.16709899902345,-838.8076782226563,100.7658920288086],\"rCode\":\"VotSHp\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]},{\"StashWeight\":20,\"EditMenuCoord\":[-225.31480407714845,-843.6209106445313,105.3927001953125],\"AutoPay\":false,\"RentPrice\":200,\"WardrobeCoord\":[-223.10580444335936,-838.1527099609375,108.15139770507813],\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"Keys\":[],\"EnterCoord\":[-221.8629150390625,-841.0889892578125,100.76588439941406],\"rCode\":\"y79sjT\",\"ExitCoord\":[-226.2884063720703,-839.8973999023438,105.3926010131836],\"PaymentDate\":\"Not Rented Yet\",\"InteriorType\":\"Double\",\"garage\":{\"state\":0},\"Lock\":true,\"DefaultColor\":\"marble\",\"Teleport\":true,\"StashCoord\":[-224.66439819335936,-833.6179809570313,108.15139770507813]}]\n', 140000, 1000, '{\"x\": -287.4010925293, \"y\": -1061.4113769531, \"z\": 27.205381393433}', '{\"x\": -308.70608520508, \"y\": -1091.9794921875, \"z\": 23.025787353516}', 25, 500, 2, 1, 5);
                ]], {["@mcode"] = Resmon.Lib.GenerateCode() }, function(inserted)
                    StartServer()
                end)

                MySQL.Async.execute([[
                    INSERT INTO `0r_motels` (`mcode`, `apartment`, `name`, `rooms`, `saleprice`, `rentprice`, `coords`, `garage`, `discount`, `money`, `revenue`, `blip`)
                    VALUES ('6ass1', 0, 'The Motor Motel', '[{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"1befTJ","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1142.3353271484376,2654.61474609375,38.15029907226562],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"ZsE8Bj","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1142.3218994140626,2650.9775390625,38.14092254638672],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"COwEz4","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1142.3641357421876,2643.5556640625,38.14375686645508],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"VZsV3r","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1141.19287109375,2641.7373046875,38.14374923706055],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"TgROL1","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1136.42431640625,2641.73974609375,38.14370346069336],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"QatDQS","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1132.5374755859376,2641.73974609375,38.1436767578125],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"ownerName":"No Owner","Day":0,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","RentDate":"","Keys":[],"rCode":"caiZAN","DefaultColor":"standart","EditMenuCoord":[1.0,1.0,1.0],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1125.1875,2641.6962890625,38.14380645751953],"StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"Teleport":true,"InteriorType":"Standard","AmountPay":85,"RentPrice":100,"Lock":true},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"MIhph0","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1121.288330078125,2641.73974609375,38.14384078979492],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"p49WfM","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1114.76513671875,2641.654296875,38.14374923706055],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"HTi85r","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1107.322265625,2641.739501953125,38.14375305175781],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"0IrlV6","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1106.1072998046876,2649.0078125,38.14093017578125],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"iwAxLL","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1106.15185546875,2652.732421875,38.14093017578125],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"}]\n', 10000, 1000, '{\"x\": 1142.3271484375, \"y\": 2664.2819824219, \"z\": 38.160869598389}', 0, 25, 500, 1, 4);
                ]], {["@mcode"] = Resmon.Lib.GenerateCode() }, function(inserted)
                    StartServer()
                end)

                MySQL.Async.execute([[
                    INSERT INTO `0r_motels` (`mcode`, `apartment`, `name`, `rooms`, `saleprice`, `rentprice`, `coords`, `garage`, `discount`, `money`, `revenue`, `blip`)
                    VALUES ('badball', 0, 'Bayview Lodge', '[{\"rCode\":\"KNqK5I\",\"AutoPay\":false,\"RentPrice\":100,\"AmountPay\":80,\"WardrobeCoord\":[-711.9969482421875,5764.67333984375,17.53824424743652],\"Day\":0,\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"Keys\":[],\"DoorHash\":-1563640173,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"RentDate\":\"\",\"garage\":{\"state\":0},\"StashCoord\":[-708.6083374023438,5766.0185546875,17.53823852539062],\"EnterCoord\":[-709.9420776367188,5768.1796875,17.53824043273925],\"InteriorType\":\"Rustic\"},{\"rCode\":\"feVOVK\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-707.6421508789063,5763.68603515625,17.53824615478515],\"StashCoord\":[-704.6753540039063,5764.173828125,17.53824615478515],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-706.0880737304688,5766.78515625,17.51103019714355],\"InteriorType\":\"Rustic\"},{\"rCode\":\"C8QvhM\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-703.7176513671875,5761.892578125,17.70548439025879],\"StashCoord\":[-700.8271484375,5762.27099609375,17.53824806213379],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-702.0496215820313,5764.609375,17.53055763244629],\"InteriorType\":\"Rustic\"},{\"rCode\":\"rLhPAc\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-699.9835205078125,5759.666015625,17.53823852539062],\"StashCoord\":[-696.9047241210938,5760.462890625,17.53824615478515],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-698.1594848632813,5762.958984375,17.51103401184082],\"InteriorType\":\"Rustic\"},{\"rCode\":\"h7jhb3\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-696.0758666992188,5757.81396484375,17.45316505432129],\"StashCoord\":[-692.7881469726563,5758.49365234375,17.8536148071289],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-694.2390747070313,5760.9140625,17.53127479553222],\"InteriorType\":\"Rustic\"},{\"rCode\":\"qEhYgh\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-691.9697265625,5755.9970703125,17.5417366027832],\"StashCoord\":[-689.0672607421875,5756.79345703125,17.54174041748047],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-690.4349365234375,5759.330078125,17.51105690002441],\"InteriorType\":\"Rustic\"},{\"rCode\":\"Ybad1t\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-684.0538940429688,5757.1962890625,17.76569557189941],\"StashCoord\":[-684.7509765625,5760.2509765625,17.53824424743652],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-687.0946655273438,5758.74365234375,17.52380561828613],\"InteriorType\":\"Rustic\"},{\"rCode\":\"OxcFBj\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-682.225830078125,5761.12255859375,17.49560928344726],\"StashCoord\":[-682.8606567382813,5764.13330078125,17.53824615478515],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-684.9961547851563,5762.49853515625,17.53827095031738],\"InteriorType\":\"Rustic\"},{\"rCode\":\"Fg1aQS\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-679.9181518554688,5765.0126953125,17.53827285766601],\"StashCoord\":[-680.96142578125,5768.34765625,18.02703094482422],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-683.2754516601563,5766.51318359375,17.52599143981933],\"InteriorType\":\"Rustic\"},{\"rCode\":\"yIrLmS\",\"AutoPay\":false,\"ownerName\":\"No Owner\",\"Owner\":\"]]..Config.Lang[Config.Locale]["NoOwner"]..[[\",\"WardrobeCoord\":[-678.7409057617188,5769.0556640625,17.53793334960937],\"StashCoord\":[-679.2013549804688,5771.978515625,17.53824234008789],\"Teleport\":false,\"PaymentDate\":\"Not Rented Yet\",\"StashWeight\":20,\"garage\":{\"state\":0},\"Keys\":[],\"RentPrice\":1500,\"DoorHash\":-1563640173,\"EnterCoord\":[-681.6415405273438,5770.71484375,17.51762199401855],\"InteriorType\":\"Rustic\"}]\n', 10000, 1000, '{\"x\": -702.56170654297, \"y\": 5789.5458984375, \"z\": 17.517681121826}', 0, 15, 500, 1, 5);
                ]], {["@mcode"] = Resmon.Lib.GenerateCode() }, function(inserted)
                    StartServer()
                end)

                MySQL.Async.execute([[
                    INSERT INTO `0r_motels` (`mcode`, `apartment`, `name`, `rooms`, `saleprice`, `rentprice`, `coords`, `garage`, `discount`, `money`, `revenue`, `blip`)
                    VALUES ('77asd1', 0, 'Callisto Apartments', '[{\"DoorHash\":-807362247,\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"Day\":0,\"PaymentDate\":\"Not Rented Yet\",\"AmountPay\":1350,\"RentDate\":\"\",\"AutoPay\":false,\"Keys\":[],\"StashCoord\":[436.1139831542969,-8.15689945220947,99.64585876464844],\"EnterCoord\":[429.7999877929688,-7.50228214263916,99.6457061767578],\"garage\":{\"state\":0},\"Owner\":\"No Owner\",\"WardrobeCoord\":[433.009033203125,-5.06928730010986,99.64595794677736],\"StashWeight\":30,\"Teleport\":false,\"rCode\":\"JaAWc7\"},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[431.6573486328125,-15.96233177185058,99.64620971679688],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"6MTTpO\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[429.3995971679688,-11.43373107910156,99.6469268798828],\"garage\":{\"state\":0},\"EnterCoord\":[425.9205932617188,-13.96467399597168,99.64554595947266],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[426.8908386230469,-23.90965461730957,99.64582824707033],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"vQyvkq\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[421.926513671875,-24.35721778869629,99.64583587646485],\"garage\":{\"state\":0},\"EnterCoord\":[422.2395324707031,-19.98462677001953,99.6457061767578],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[422.61517333984377,-31.64704322814941,99.64586639404296],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"ToAd8l\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[420.176513671875,-27.414644241333,99.7103271484375],\"garage\":{\"state\":0},\"EnterCoord\":[416.7986145019531,-29.71491622924804,99.64554595947266],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[408.1788940429688,-35.20040130615234,99.64154052734377],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"g1khra\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[408.0046691894531,-30.37723350524902,99.64603424072266],\"garage\":{\"state\":0},\"EnterCoord\":[412.2193603515625,-30.68317985534668,99.64564514160156],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[400.0801696777344,-30.67793083190918,99.64586639404296],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"gwD9V3\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[404.5939636230469,-28.40886116027832,99.64586639404296],\"garage\":{\"state\":0},\"EnterCoord\":[402.2149658203125,-24.99072456359863,99.64554595947266],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[392.2663269042969,-25.96917724609375,99.64596557617188],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"TuEvL7\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[391.6378784179688,-20.90121459960937,99.64596557617188],\"garage\":{\"state\":0},\"EnterCoord\":[395.9710083007813,-21.25547409057617,99.64571380615236],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[391.37646484375,-11.9232702255249,99.64582061767578],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"bsTh3b\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[396.1161193847656,-11.87003326416015,99.64582061767578],\"garage\":{\"state\":0},\"EnterCoord\":[395.9780578613281,-15.68670177459716,99.64568328857422],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[395.7691955566406,-3.96752786636352,99.64591217041016],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"a7fFaR\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[398.1102600097656,-8.35076236724853,99.64591217041016],\"garage\":{\"state\":0},\"EnterCoord\":[401.5545959472656,-6.12365341186523,99.64553833007813],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[400.6028747558594,4.05134487152099,99.64596557617188],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"MZiqHn\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[405.42340087890627,4.23455286026001,99.64600372314452],\"garage\":{\"state\":0},\"EnterCoord\":[405.2298583984375,0.12563355267047,99.6456298828125],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[414.72369384765627,12.814546585083,99.6374053955078],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"jRf6pN\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[415.3813781738281,7.55464649200439,99.64605712890624],\"garage\":{\"state\":0},\"EnterCoord\":[411.1446533203125,8.01425457000732,99.64568328857422],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[423.1173706054688,8.08668994903564,99.64583587646485],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"hxpWmI\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[419.0859680175781,5.5440125465393,99.64583587646485],\"garage\":{\"state\":0},\"EnterCoord\":[420.9850769042969,2.3438229560852,99.6455307006836],\"AutoPay\":false},{\"Keys\":[],\"DoorHash\":-807362247,\"StashCoord\":[430.7880859375,3.46211767196655,99.64596557617188],\"RentPrice\":1500,\"ownerName\":\"No Owner\",\"InteriorType\":\"Deluxe\",\"StashWeight\":30,\"PaymentDate\":\"Not Rented Yet\",\"Teleport\":false,\"rCode\":\"LyBEc4\",\"Owner\":\"No Owner\",\"WardrobeCoord\":[431.104736328125,-1.42688643932342,99.6459732055664],\"garage\":{\"state\":0},\"EnterCoord\":[426.9307861328125,-1.14523696899414,99.64563751220705],\"AutoPay\":false}]\n', 10000, 1000, '{\"x\": 399.0270690918, \"y\": -18.243541717529, \"z\": 91.935417175293}', 0, 15, 500, 1, 1);
                ]], {["@mcode"] = Resmon.Lib.GenerateCode() }, function(inserted)
                    StartServer()
                end)
            else
                StartServer() 
            end
        end)
    end)
end)

local function RoomDayV(mcode, RoomId, Eklenecek)
    local rooms = {}

    for k,v in pairs(Config.Motels) do
        for q, s in pairs(v.rooms) do
            if q == RoomId then
                if s.PaymentDate ~= Config.Lang[Config.Locale]["NotRented"] then
                    local year, month, day = string.match(s.PaymentDate, "(%d+)-(%d+)-(%d+)")
                    local currentPaymentDate = os.time{year=year, month=month, day=day}
                    local newPaymentDate = currentPaymentDate + Eklenecek * 24 * 60 * 60
                    local new_year = os.date("%Y", newPaymentDate)
                    local new_month = os.date("%m", newPaymentDate)
                    local new_day = os.date("%d", newPaymentDate)
                    s.PaymentDate = string.format("%04d-%02d-%02d", new_year, new_month, new_day)
                end
            end
        end
        rooms = v.rooms
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(rooms), mcode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end

local function GetIdFromBill(mcode, roomId)
    local bill = {}
    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            if #v.bills > 0 then
                for q,s in pairs(v.bills) do
                    if s.RoomId == roomId then
                        bill = s.Status
                    end
                end
            else
                bill = false
            end
        end
    end
    return bill
end

function GetItemBySlot(source, slot)
    local Player = Resmon.Lib.GetPlayerFromSource(source)
    slot = tonumber(slot)
    return Player.PlayerData.items[slot]
end

Resmon.Lib.RegisterUsableItem(Config.DoorLockPickItem, function(source, item)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    TriggerClientEvent('0R:Motels:Client:UseLockpick', source)
    xPlayer.RemoveItem(item, 1)
end)

function OxInventoryStash()
    if not Inventory.ox then return end
    for k,v in pairs(Config.Motels) do
        for q,s in pairs(v.rooms) do
            exports.ox_inventory:RegisterStash(v.mcode..'_'..s.rCode, Config.Lang[Config.Locale]["Room"].. ' '..q, 200, tonumber(s.StashWeight)*1000, true, false, false)
        end
    end
end

RegisterNetEvent('0R:Motels:Server:ChangeMotelDoorStatus', function(Room, State, No)
    DoorStates[Room] = {State = State}
	TriggerClientEvent("0R:Motels:Client:ChangeDoorStatusEveryone", -1, Room, DoorStates[Room], No)
	if State == 1 then 
		DoorStates[Room] = nil
	end
end)

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(Config.Motels) do
            if #v.rooms > 0 then
                for q, s in pairs(v.rooms) do
                    if s.AutoPay then
                        if s.PaymentDate ~= "" and s.PaymentDate <= os.date('%Y-%m-%d') and s.Owner ~= Config.Lang[Config.Locale]["NoOwner"] then
                            local bill = GetIdFromBill(v.mcode, q)
                            if not bill then
                                if s.Owner ~= Config.Lang["NoOwner"] then
                                    local RoomOwner = Resmon.Lib.GetPlayerByIdentifier(s.Owner)                            
                                    if RoomOwner then
                                        Rowner = Resmon.Lib.GetPlayerFromSource(RoomOwner)
                                        if Rowner.GetAccountData('bank') >= s.AmountPay then
                                            Rowner.RemoveMoney('bank', s.AmountPay)
                                            TriggerClientEvent('0R:Motels:Notify', Rowner.source, {type = 'success', text = string.format(Config.Lang[Config.Locale]["TahsinEdildi"], s.AmountPay)})
                                            AddBill(v.mcode, q, s.Owner, s.AmountPay, s.RentPrice, 1)
                                            RoomDayV(v.mcode, q, s.Day)
                                            AddNotification(v.mcode, s.Owner, Config.Lang[Config.Locale]["RoomFeeCharged"], string.format(Config.Lang[Config.Locale]["RoomFeeChargedDesc"], s.AmountPay, q))
                                            AddMotelMoney(v.mcode, s.AmountPay)
                                        else
                                            AddNotification(v.mcode, s.Owner, Config.Lang[Config.Locale]["ItIsCancelled"], Config.Lang[Config.Locale]["Feshedildi"])
                                            KickMotelRoom(v.mcode, q)
                                        end
                                    else
                                        local PlayerMoney = nil
                                        if exports["0r_lib"]:GetFramework() == 'ESX' then
                                            local pData = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = ?', {s.Owner})
                                            PlayerMoney = json.decode(pData[1].accounts)
                                        else
                                            local pData = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = ?', {s.Owner})
                                            PlayerMoney = json.decode(pData[1].charinfo)
                                        end
                                        
                                        if PlayerMoney.bank >= s.AmountPay then
                                            PlayerMoney.bank = PlayerMoney.bank - s.AmountPay
                                            AddMotelMoney(v.mcode, s.AmountPay)
                                            AddBill(v.mcode, q, s.Owner, s.AmountPay, s.RentPrice, 1)
                                            AddNotification(v.mcode, s.Owner, Config.Lang[Config.Locale]["RoomFeeCharged"], string.format(Config.Lang[Config.Locale]["RoomFeeChargedDesc"], s.AmountPay))
                                            RoomDayV(v.mcode, q, s.Day)
                                            MySQL.update('UPDATE users SET accounts = ? WHERE identifier = ?', {json.encode(PlayerMoney), s.Owner})
                                        else
                                            KickMotelRoom(v.mcode, q)
                                            AddNotification(v.mcode, s.Owner, Config.Lang[Config.Locale]["ItIsCancelled"], Config.Lang[Config.Locale]["CancelDesc"])
                                        end
                                        hasUnpaidBill = true
                                    end
                                end
                            end
                        end
                    else
                        if s.PaymentDate ~= "" and s.PaymentDate <= os.date('%Y-%m-%d') then
                            local hasUnpaidBill = false

                            local newDate = nil
                            local year, month, day = string.match(s.PaymentDate, "(%d+)-(%d+)-(%d+)")
                            local currentPaymentDate = os.time{year=year, month=month, day=day}
                            local newPaymentDate = currentPaymentDate + Config.DueDate * 24 * 60 * 60
                            local new_year = os.date("%Y", newPaymentDate)
                            local new_month = os.date("%m", newPaymentDate)
                            local new_day = os.date("%d", newPaymentDate)
                            newDate = string.format("%04d-%02d-%02d", new_year, new_month, new_day)

                            if not hasUnpaidBill and next(v.bills) then
                                for x, y in pairs(v.bills) do
                                    if y.RoomId == q and y.Status == 0 then
                                        hasUnpaidBill = true
                                        break
                                    end
                                end
                            end

                            if not hasUnpaidBill then
                                AddNotification(v.mcode, s.Owner, Config.Lang[Config.Locale]["CreatedInvoice"], string.format(Config.Lang[Config.Locale]["CreatedInvoiceDesc"], q, newDate))
                                AddBill(v.mcode, q, s.Owner, s.AmountPay, s.RentPrice, 0)
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(1000)
    end
end)



Citizen.CreateThread(function()
    while true do
        local billX = {}
        for k, v in pairs(Config.Motels) do
            for billID, bill in pairs(v.bills) do
                local Roomv = Config.Motels[k].rooms[bill.RoomId]
                if bill.Status == 0 and not Roomv.AutoPay then
                    local inputDate = bill.PayDate
                    local currentDate = os.date("%Y-%m-%d")
                    local difference = Resmon.Lib.DaysBetweenDates(inputDate, currentDate)
                    if difference >= Config.DueDate then
                        bill.Status = 3
                        KickMotelRoom(v.mcode, bill.RoomId)
                        AddNotification(v.mcode, Roomv.Owner, Config.Lang[Config.Locale]["ItIsCancelled"], Config.Lang[Config.Locale]["CancelDesc"])
                    end
                    billX = v.bills
                    Resmon.Lib.UpdateMotelSQL("bills", json.encode(billX), v.mcode)
                    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
                end
            end
        end
        Citizen.Wait(2500)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:DoorDataLoad', function(source, cb)
    cb(DoorStates)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateMotelOwner', function(source, cb, data)
    local mCode = data.mcode
    local Motels = Config.Motels 

    if data.source ~= "nosahip" then
        local TargetSource = tonumber(data.source)
        local TargetPedShot = data.img
        local TargetPlayer = Resmon.Lib.GetPlayerFromSource(TargetSource)
        if TargetPlayer then
            
            for k,v in pairs(Motels) do
                if v.mcode == mCode then
                    v.owner = TargetPlayer.identifier
                    v.ownerName = TargetPlayer.name
                end
            end

            Config.Motels = Motels
            local full = TargetPlayer.identifier
            local base64Image = TargetPedShot
            local editIdentifier = string.gsub(full, ":", "_")
            -- Kaydedilecek dosyanın yolunu buraya belirtin
            local filePath = '/web/pimg/'..editIdentifier..'.png'
            
            -- Fonksiyonu çağırarak PNG dosyasını kaydetme işlemini gerçekleştirin
            saveBase64ImageToFile(base64Image, filePath)
            local queryCheck = 'UPDATE 0r_motels SET owner = ? WHERE mcode = ?'
            MySQL.Async.execute(queryCheck, {TargetPlayer.identifier, mCode})

            TriggerClientEvent('0R:Motels:Client:SendServerData', source, Config.Motels)
            TriggerClientEvent('0R:Motels:Client:SendServerData', TargetSource, Config.Motels)

            cb(true)
        end
    else
        for k,v in pairs(Motels) do
            if v.mcode == mCode then
                v.owner = nil
                v.ownerName = Config.Lang[Config.Locale]["NoOwner"]
            end
        end

        Config.Motels = Motels
        local queryCheck = 'UPDATE 0r_motels SET owner = ? WHERE mcode = ?'
        MySQL.Async.execute(queryCheck, {nil, mCode})

        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    end
end) 

Resmon.Lib.Callback.Register('0R:Motels:Server:LeaveMotelRoom', function(source, cb, data)
    local RoomId = tonumber(data.roomid)
    local mCode = data.mcode
    local Rooms = {}
    local type = false

    for k,v in pairs(Config.Motels) do
        for q,s in pairs(v.rooms) do
            if v.mcode == data.mcode then
                if RoomId == q then
                    s.Owner = Config.Lang[Config.Locale]["NoOwner"]
                    s.RentDate = ""
                    s.ownerName = Config.Lang[Config.Locale]["NoOwner"]
                    s.PaymentDate = ""
                    s.rCode = Resmon.Lib.GenerateCode()
                    s.Keys = {}
                    s.AutoPay = false
                    s.Day = 0
                    s.garage.state = 0
                    type = true
                end
            end
            Rooms = v.rooms
        end
    end
     
    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(Rooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(type)
end)

function GetPlayerCache(source, motel)
    local ResData = Resmon.Lib.GetPlayerFromSource(source)
    local IntData = {}
    for k,v in ipairs(Config.Motels) do
        for q,s in pairs(v.caches) do
            if not motel then
                if s.Motel == false then
                    if s.Identifier == ResData.identifier then
                        IntData = s
                    end
                end
            else
                if s.Motel then
                    if s.Identifier == ResData.identifier then
                        IntData = s
                    end
                end
            end
            if s.Garage ~= 'none' then
                if s.Identifier == ResData.identifier then
                    IntData = s
                end
            end
        end
    end

    return IntData
end

Resmon.Lib.Callback.Register('0R:Motels:Server:LeaveApartment', function(source, cb)
    local GetPlayerCache = GetPlayerCache(source, true)
    cb(GetPlayerCache)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:OutVehicleGarage', function(source, cb, plate)
    local GetPlayerCache = GetPlayerCache(source, true)
    local rooms = {}
    local mCode = nil

    for k,v in pairs(Config.Motels) do
        for q,s in pairs(v.rooms) do
            if s.garage.plate == plate then
                mCode = v.mcode
                s.garage = {state = 0}
            end
        end
        rooms = v.rooms
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(rooms), mCode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(GetPlayerCache)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:LeaveRoom', function(source, cb )
    local GetPlayerCache = GetPlayerCache(source, false)
    -- print(Resmon.Lib.DumpTable(GetPlayerCache))
    cb(GetPlayerCache)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:PayInvoice', function(source, cb, data)
    local mCode, Amount, BillID, RoomId, Eklenecek = data.mcode, tonumber(data.amount), tonumber(data.billid), tonumber(data.roomid), tonumber(data.eklenecekler)    
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local xPlayerBank = xPlayer.GetAccountData('bank')
    local bills = {}
    local rooms = {}

    if xPlayerBank >= Amount then
        xPlayer.RemoveMoney('bank', Amount)

        for k,v in pairs(Config.Motels) do
            if v.mcode == mCode then

                for q,s in pairs(v.bills) do
                    if RoomId == s.RoomId then
                        s.Status = 1
                    end
                end
            
                for q, s in pairs(v.rooms) do
                    if q == RoomId then
                        local year, month, day = string.match(s.PaymentDate, "(%d+)-(%d+)-(%d+)")
                        local currentPaymentDate = os.time{year=year, month=month, day=day}
                        local newPaymentDate = currentPaymentDate + Eklenecek * 24 * 60 * 60
                        local new_year = os.date("%Y", newPaymentDate)
                        local new_month = os.date("%m", newPaymentDate)
                        local new_day = os.date("%d", newPaymentDate)
                        s.PaymentDate = string.format("%04d-%02d-%02d", new_year, new_month, new_day)
                    end
                end

                AddMotelMoney(mCode, Amount)
            end

            rooms = v.rooms
            bills = v.bills
        end

        Resmon.Lib.UpdateMotelSQL("bills", json.encode(bills), mCode)
        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(rooms), mCode)

        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

        cb(true)
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:RentMotelRoom', function(source, cb, data, img)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local mCode = data.mcode 
    local day = tonumber(data.day)
    local MotelData = GetCodeFromMotel(data.mcode)
    local RoomPrice = tonumber(data.price)
    local MotelRoom = MotelData.rooms[tonumber(data.roomid)]
    local SelectedRoom = {}
    local xPlayerBank = xPlayer.GetAccountData('bank')
    
    if xPlayerBank >= RoomPrice then
        local currentDate = os.date('%Y-%m-%d')
        xPlayer.RemoveMoney('bank', RoomPrice)
        AddMotelMoney(mCode, RoomPrice)
        AddPlayerMotelCard(xPlayer, mCode, tonumber(data.roomid))
        AddNotification(mCode, xPlayer.identifier, Config.Lang[Config.Locale]["YourNewRoom"], string.format(Config.Lang[Config.Locale]["YourNewRoomDesc"], data.roomid))
        local startTimestamp = os.time() -- Kiralama başlangıç zamanı
        local rentalDays = day -- Kiralama süresi

        local paymentTimestamp = startTimestamp + (rentalDays * 24 * 60 * 60) -- Saniye cinsinden ödeme tarihi hesaplaması
        local paymentDate = os.date('%Y-%m-%d', paymentTimestamp) -- Tarih formatına çevirme
        AddRecentRent(source, xPlayer, mCode, tonumber(data.roomid), RoomPrice, paymentDate, MotelRoom.InteriorType)

        local full = xPlayer.identifier
        local base64Image = img
        local editIdentifier = string.gsub(full, ":", "_")
        local filePath = '/web/pimg/'..editIdentifier..'.png'
        local file = io.open(filePath, "r")

        if file then
            io.close(file)
            saveBase64ImageToFile(base64Image, filePath)
        else
            saveBase64ImageToFile(base64Image, filePath)
        end

        for k,v in pairs(Config.Motels) do
            if v.mcode == mCode then
                for q,s in pairs(v.rooms) do
                    if q == tonumber(data.roomid) then
                        s.Owner = xPlayer.identifier 
                        s.ownerName = xPlayer.name
                        s.RentDate = currentDate
                        s.PaymentDate = paymentDate 
                        s.AmountPay = RoomPrice
                        s.Day = rentalDays
                    end
                    SelectedRoom = v.rooms
                end
            end
        end

        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(SelectedRoom), mCode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('0R:Motels:Server:DoorLockTeleport', function(MotelNo, MotelRoomId, State)
    Config.Motels[MotelNo].rooms[MotelRoomId].Lock = State
    TriggerClientEvent('0R:Motels:Client:DoorLockTeleport', -1, MotelNo, MotelRoomId, State)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:AutoPayChange', function(source, cb, data)
    local mCode = data.mcode 
    local RoomId = tonumber(data.roomid)
    local RoomAutoPay = data.autopay
    local rooms = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            for q,s in pairs(v.rooms) do
                if q == RoomId then
                    s.AutoPay = RoomAutoPay
                end
            end
            rooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(rooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UzatOdaTime', function(source, cb, data)
    local mCode, Room, RoomPrice, Eklenecek = data.mcode, tonumber(data.roomid), tonumber(data.price), tonumber(data.eklenecek)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local xPlayerBank = xPlayer.GetAccountData("bank")
    local Temp = {}
    if xPlayerBank >= RoomPrice then
        for k, v in pairs(Config.Motels) do
            if v.mcode == mCode then
                for q, s in pairs(v.rooms) do
                    if q == Room then
                        local year, month, day = string.match(s.PaymentDate, "(%d+)-(%d+)-(%d+)")
                        local currentPaymentDate = os.time{year=year, month=month, day=day}
                        local newPaymentDate = currentPaymentDate + Eklenecek * 24 * 60 * 60
                        local new_year = os.date("%Y", newPaymentDate)
                        local new_month = os.date("%m", newPaymentDate)
                        local new_day = os.date("%d", newPaymentDate)
                        s.PaymentDate = string.format("%04d-%02d-%02d", new_year, new_month, new_day)
                    end
                end
                Temp = v.rooms
            end
        end

        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(Temp), mCode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

        xPlayer.RemoveMoney('bank', RoomPrice)
        cb(true)
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:CopyMotelRoomKey', function(source, cb, data)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    if xPlayer.bank >= Config.KeyPrices.CopyKeyPrice then
        xPlayer.RemoveMoney('bank', Config.KeyPrices.CopyKeyPrice)
        AddPlayerMotelCard(xPlayer, data.mcode, tonumber(data.room))
        cb(true)
    else
        cb(false, Config.KeyPrices.CopyKeyPrice-xPlayer.bank)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:ChangeMotelRoomKey', function(source, cb, data)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    if xPlayer.bank >= Config.KeyPrices.ChangeKeyPrice then
        xPlayer.RemoveMoney('bank', Config.KeyPrices.ChangeKeyPrice)
        local rooms = {}
        for k,v in pairs(Config.Motels) do
            if v.mcode == data.mcode then
                for q,s in pairs(v.rooms) do
                    if s.rCode == data.rcode then
                        s.rCode = Resmon.Lib.GenerateCode()
                    end
                end
                rooms = v.rooms
            end
        end

        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(rooms), data.mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

        AddPlayerMotelCard(xPlayer, data.mcode, tonumber(data.room))
        cb(true)
    else
        cb(false, Config.KeyPrices.ChangeKeyPrice-xPlayer.bank)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:SetVehicle', function(source, cb, plate, props)
    local p = Resmon.Lib.GetPlayerFromSource(source)
    MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)', {
        p.identifier,
        plate,
        json.encode(props),
    })    
    cb(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:DeleteFeedBack', function(source, cb, data)
    local tableV = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == data.mcode then
            table.remove(v.feedbacks, tonumber(data.id))
        end
        tableV = v.feedbacks
    end

    Resmon.Lib.UpdateMotelSQL("feedbacks", json.encode(tableV), data.mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    cb(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:BuyBusinessMotel', function(source, cb, id, img)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local SalePrice = Config.Motels[id].saleprice 
    local TargetPedShot = img

    if xPlayer.GetAccountData("bank") >= SalePrice then
        xPlayer.RemoveMoney('bank', SalePrice)
        local full = xPlayer.identifier
        local base64Image = TargetPedShot
        local editIdentifier = string.gsub(full, ":", "_")
        local filePath = '/web/pimg/'..editIdentifier..'.png'
        local file = io.open(filePath, "r")
        if file then
            io.close(file)
            saveBase64ImageToFile(base64Image, filePath)
        else
            saveBase64ImageToFile(base64Image, filePath)
        end
        Config.Motels[id].owner = xPlayer.identifier
        Config.Motels[id].ownerName = xPlayer.name
        Resmon.Lib.UpdateMotelSQL("owner", xPlayer.identifier, Config.Motels[id].mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    else
        cb(false)
    end
end)

local function GetTypeFromRoomCoords(type)
    for k,v in pairs(Config.RoomTypes) do
        if v.RoomLabel == type then
            return v
        end
    end
end

function AddMoneyLog(mcode, money, type)
    local meme = {}
    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            table.insert(v.moneylogs, {
                type = type,
                money = money
            })
        end
        meme = v.moneylogs
    end

    Resmon.Lib.UpdateMotelSQL("moneylogs", json.encode(meme), mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end

Resmon.Lib.Callback.Register('0R:Motels:Server:KickAllRooms', function(source, cb, mcode)
    local rooms = {}
    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            for q,s in pairs(v.rooms) do
                s.Owner = Config.Lang[Config.Locale]["NoOwner"]
                s.PaymentDate = Config.Lang[Config.Locale]["NotRented"]
                s.garage.state = 0
            end
            rooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(rooms), mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(true)
end)

-- Resmon.Lib.Callback.Register('0R:Motels:Server:AddMotelRoom', function(source, cb, data, coords)
--     local GetMotels = Config.Motels
--     local mCode = data.mcode
--     local int = data.roomtype
--     local rprice = tonumber(data.price)
--     local roomInfo = GetTypeFromRoomCoords(int)
--     local roomTable = {}

--     for k, v in pairs(GetMotels) do
--         if v.mcode == mCode then
--             roomTable = v.rooms
--         end
--     end

--     local defaultColor = 'standart'

--     for k,v in pairs(Config.RoomTypes) do
--         if v.RoomLabel == data.roomtype then
--             if v.Colors then
--                 for q,s in pairs(v.Colors) do
--                     if s.default then
--                         defaultColor = s.name
--                     end
--                 end
--             end
--         end
--     end

--     local cachTable = {
--         Owner = Config.Lang[Config.Locale]["NoOwner"],
--         ownerName = Config.Lang[Config.Locale]["NoOwner"],
--         garage = {state = 0},
--         InteriorType = int,
--         Lock = true,
--         AutoPay = false,
--         Teleport = true,
--         PaymentDate = Config.Lang[Config.Locale]["NotRented"],
--         rCode = Resmon.Lib.GenerateCode(),
--         DefaultColor = defaultColor,
--         EnterCoord = {coords.x, coords.y, coords.z},
--         ExitCoord = {roomInfo.Coords.Exit.x, roomInfo.Coords.Exit.y, roomInfo.Coords.Exit.z},
--         StashCoord = {roomInfo.Coords.Stash.x, roomInfo.Coords.Stash.y, roomInfo.Coords.Stash.z},
--         EditMenuCoord = {roomInfo.EditRoomMenu.x, roomInfo.EditRoomMenu.y, roomInfo.EditRoomMenu.z},
--         StashWeight = tonumber(data.weightnew),
--         WardrobeCoord = {roomInfo.Coords.Wardrobe.x, roomInfo.Coords.Wardrobe.y, roomInfo.Coords.Wardrobe.z},
--         Keys = {},
--         RentPrice = rprice or 500
--     }

--     table.insert(roomTable, cachTable)

--     for k, v in pairs(GetMotels) do
--         if v.mcode == mCode then
--             v.rooms = roomTable
--             v.odaSayi = #v.rooms
--         end
--     end
    
--     Config.Motels = GetMotels

--     Resmon.Lib.UpdateMotelSQL("rooms", json.encode(roomTable), mCode)

--     TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
--     cb(true)
-- end)

Resmon.Lib.Callback.Register('0R:Motels:Server:AddMotelRoomTeleport', function(source, cb, data, coordgiris, coordstash, coordwardrobe)
    local GetMotels = Config.Motels
    local mCode = data.mcode
    local rprice = tonumber(data.price)

    local roomTable = {}

    for k, v in pairs(GetMotels) do
        if v.mcode == mCode then
            roomTable = v.rooms
        end
    end

    local cachTable = {
        Owner = Config.Lang[Config.Locale]["NoOwner"],
        garage = {state = 0},
        ownerName = Config.Lang[Config.Locale]["NoOwner"],
        InteriorType = data.roomtip,
        PaymentDate = Config.Lang[Config.Locale]["NotRented"],
        Teleport = false,
        AutoPay = false,
        StashWeight = tonumber(data.weight),
        EnterCoord = {coordgiris.x, coordgiris.y, coordgiris.z},
        rCode = Resmon.Lib.GenerateCode(),
        StashCoord = {coordstash.x, coordstash.y, coordstash.z},
        WardrobeCoord = {coordwardrobe.x, coordwardrobe.y, coordwardrobe.z},
        Keys = {},
        RentPrice = tonumber(data.roomPrice),
        DoorHash = tonumber(data.doorHash),
    }

    table.insert(roomTable, cachTable)

    for k, v in pairs(GetMotels) do
        if v.mcode == mCode then
            v.rooms = roomTable
            v.odaSayi = #v.rooms
        end
    end
    
    Config.Motels = GetMotels

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(roomTable), mCode)
    OxInventoryStash()
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:AddMotelRoom', function(source, cb, data, coords)
    -- Veri doğrulama
    if not data or not data.mcode or not data.roomtype or not data.price or not data.weightnew then
        cb(false)
        return
    end

    local GetMotels = Config.Motels
    local mCode = data.mcode
    local int = data.roomtype
    local rprice = tonumber(data.price)
    local roomInfo = GetTypeFromRoomCoords(int)
    local roomTable = {}

    for k, v in pairs(GetMotels) do
        if v.mcode == mCode then
            roomTable = v.rooms
        end
    end

    local defaultColor = 'standart'

    for k, v in pairs(Config.RoomTypes) do
        if v.RoomLabel == data.roomtype then
            if v.Colors then
                for q, s in pairs(v.Colors) do
                    if s.default then
                        defaultColor = s.name
                    end
                end
            end
        end
    end

    local cacheTable = {
        Owner = Config.Lang[Config.Locale]["NoOwner"],
        ownerName = Config.Lang[Config.Locale]["NoOwner"],
        garage = {state = 0},
        InteriorType = int,
        Lock = true,
        AutoPay = false,
        Teleport = true,
        PaymentDate = Config.Lang[Config.Locale]["NotRented"],
        rCode = Resmon.Lib.GenerateCode(),
        DefaultColor = defaultColor,
        EnterCoord = {coords.x, coords.y, coords.z},
        ExitCoord = {roomInfo.Coords.Exit.x, roomInfo.Coords.Exit.y, roomInfo.Coords.Exit.z},
        StashCoord = {roomInfo.Coords.Stash.x, roomInfo.Coords.Stash.y, roomInfo.Coords.Stash.z},
        EditMenuCoord = {roomInfo.EditRoomMenu.x, roomInfo.EditRoomMenu.y, roomInfo.EditRoomMenu.z},
        StashWeight = tonumber(data.weightnew),
        WardrobeCoord = {roomInfo.Coords.Wardrobe.x, roomInfo.Coords.Wardrobe.y, roomInfo.Coords.Wardrobe.z},
        Keys = {},
        RentPrice = rprice or 500
    }

    table.insert(roomTable, cacheTable)

    for k, v in pairs(GetMotels) do
        if v.mcode == mCode then
            v.rooms = roomTable
            v.odaSayi = #v.rooms
        end
    end

    Config.Motels = GetMotels

    -- Eşzamanlılık kontrolü ve güncelleme
    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(roomTable), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(true)
end)


Resmon.Lib.Callback.Register('0R:Motels:Server:AddNewFloorMotel', function(source, cb, mcode)
    local memati = 0

    for k,v in pairs(Config.Motels) do
        if v.mcode == mcode then
            if v.apartment == 1 then
                v.floor = v.floor + 1
                memati = v.floor
            end
        end
    end
    
    if memati > 0 then
        Resmon.Lib.UpdateMotelSQL("floor", memati, mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateRoomColor', function(source, cb, motel, room, data)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source) 
    data.price = tonumber(data.price)
    local roomTable = {}
    if xPlayer.bank >= data.price then
        xPlayer.RemoveMoney('bank', data.price)
        AddMotelMoney(Config.Motels[motel].mcode, data.price)
        for k,v in pairs(Config.Motels) do
            if k == motel then
                for q,s in pairs(v.rooms) do
                    if q == room then
                        s.DefaultColor = data.color
                    end
                end
                roomTable = v.rooms
            end
        end

        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(roomTable), Config.Motels[motel].mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateRoomInterior', function(source, callback, data)
    local mCode = data.mcode 
    local RoomId = tonumber(data.roomid)
    local CacheRooms = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            for q,s in pairs(v.rooms) do
                if q == RoomId then
                    s.InteriorType = data.int
                end
            end
            CacheRooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(CacheRooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    callback(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:CheckVehicleOwner', function(source, cb, plate, id)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local sqlInfo = Resmon.Lib.GetVehiclesTableName()
    local vehicles = MySQL.Sync.fetchAll('SELECT * FROM '..sqlInfo[1]..' WHERE plate = ?', {plate})
    if #vehicles >= 1 then
        if vehicles[1][sqlInfo[2]] == xPlayer.identifier then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateRoomStashWeight', function(source, cb, data)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local UpdatedRooms = {}
    if xPlayer.bank >= tonumber(data.para) then
        xPlayer.RemoveMoney('bank', tonumber(data.para))
        AddMotelMoney(data.mcode, tonumber(data.para))
        for k,v in pairs(Config.Motels) do
            if v.mcode == data.mcode then
                for q,s in pairs(v.rooms) do
                    if q == tonumber(data.roomId) then
                        s.StashWeight = tonumber(data.weightnew)
                    end
                end
                UpdatedRooms = v.rooms
            end
        end

        OxInventoryStash()

        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(UpdatedRooms), data.mcode)

        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        
        cb(true)
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:CreateFeedBack', function(source, cb, data)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local GetMotel = GetCodeFromMotelId(data.mcode)

    local Feedback = {
        StartPoint = tonumber(data.feedbackstars),
        WriterName = xPlayer.name,
        Writer = xPlayer.identifier,
        Text = data.text,
        Date = os.date('%Y-%m-%d'),
        Type = data.roomtype,
    }

    table.insert(Config.Motels[GetMotel].feedbacks, Feedback)
    Resmon.Lib.UpdateMotelSQL("feedbacks", json.encode(Config.Motels[GetMotel].feedbacks), data.mcode)
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
    cb(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:RemoveKeyByRoom', function(source, cb, data)
    local xMotel = GetCodeFromMotel(data.mcode)
    local deleted = false 

    for k,v in pairs(xMotel.rooms) do
        if v.rCode == data.rcode then
            if v.Owner == data.cid then
                cb(false)
            else
                for q,s in pairs(v.Keys) do
                    if s.keyowner == data.cid then
                        table.remove(v.Keys, q)
                        deleted = true
                    end
                end
            end
        end
    end

    if deleted then
        Resmon.Lib.UpdateMotelSQL("rooms", json.encode(xMotel.rooms), data.mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateMotelData', function(source, callback, data)
    local Money, SalePrice, Discount = tonumber(data.money), tonumber(data.saleprice), tonumber(data.discount)

    if not data.yumurcak then
        for k,v in pairs(Config.Motels) do
            if v.mcode == data.mcode then
                v.money = Money
                v.discount = Discount 
                v.name = data.name
                v.saleprice = SalePrice
            end
        end
    else
        for k,v in pairs(Config.Motels) do
            if v.mcode == data.mcode then
                for q,s in pairs(v.rooms) do
                    s.RentPrice = Money
                end
                v.discount = Discount 
                v.name = data.name
            end
        end
    end

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    MySQL.update('UPDATE 0r_motels SET name = ?, discount = ?, saleprice = ?, money = ? WHERE mcode = ?', {data.name, Discount, SalePrice, Money, data.mcode})

    callback(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:TranferMotelOwnership', function(source, cb, targetid, mcode)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local xTarget = Resmon.Lib.GetPlayerFromSource(targetid)
    if xTarget then
        
        if xTarget.identifier == xPlayer.identifier then
            return cb(false)
        end

        for k,v in pairs(Config.Motels) do
            if v.mcode == mcode then
                v.owner = xTarget.identifier
            end
        end

        Resmon.Lib.UpdateMotelSQL("owner", xTarget.identifier, mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', xTarget.source, Config.Motels)
        TriggerClientEvent('0R:Motels:Client:SendServerData', xPlayer.source, Config.Motels)

        cb(true)
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:DeleteMotel', function(source, callback, data)
    local Temp = Config.Motels

    for k,v in pairs(Temp) do
        if v.mcode == data.mcode then
           table.remove(Config.Motels, k)
        end
    end

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    MySQL.update('DELETE FROM 0r_motels WHERE mcode = ?', {data.mcode})

    callback(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:GetAllPlayers', function(source, callback)
    local Players = Resmon.Lib.AllPlayers()
    local X = {}
    for k,v in pairs(Players) do
        local Player = Resmon.Lib.GetPlayerFromSource(v)
        table.insert(X, {source = Player.source, name = Player.name})
    end
    callback(X)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:GivePlayerKeyCard', function(source, cb, data)
    local xSrc, Room = tonumber(data.source), tonumber(data.room)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local zPlayer = Resmon.Lib.GetPlayerFromSource(xSrc)
    local hasGiveKey = false 

    if zPlayer.identifier == xPlayer.identifier then
        cb(false)
    else
        AddPlayerMotelCard(zPlayer, data.mcode, Room)
        cb(true)
    end
end) 

Resmon.Lib.Callback.Register('0R:Motels:Server:GetAllPlayersArea', function(source, callback, data)
    local Players = Resmon.Lib.AllPlayers()
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local X = {}
    for k,v in pairs(Players) do
        local Player = Resmon.Lib.GetPlayerFromSource(v)
        if #(xPlayer.coords - Player.coords) <= 10.0 then
            table.insert(X, {source = Player.source, name = Player.name, mcode = data.mcode, room = tonumber(data.room)})
        end
    end
    callback(X)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:MotelRoomPriceUpdate', function(source, callback, data)
    local mCode = data.mcode 
    local RentPrice = tonumber(data.price)
    local RoomId = tonumber(data.roomid)
    local CacheRooms = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            for q,s in pairs(v.rooms) do
                if q == RoomId then
                    s.RentPrice = RentPrice
                end
            end
            CacheRooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(CacheRooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    callback(true)
end)

RegisterNetEvent('0R:Motels:Server:ToggleTeleportRoomLock', function(motel, room, state)
    Config.Motels[motel].rooms[room] = state
    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:KickMotelRoom', function(source, callback, data)
    local mCode = data.mcode 
    local RoomId = tonumber(data.roomid)
    local CacheRooms = {}

    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            for q,s in pairs(v.rooms) do
                if q == RoomId then
                    s.Owner = Config.Lang[Config.Locale]["NoOwner"]
                    s.RentDate = ""
                    s.ownerName = Config.Lang[Config.Locale]["NoOwner"]
                    s.Keys = {}
                    s.rCode = Resmon.Lib.GenerateCode()
                    s.PaymentDate = Config.Lang[Config.Locale]["NotRented"]
                    s.AutoPay = false
                    s.Day = 0
                end
            end
            CacheRooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(CacheRooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    callback(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:DepositOrWith', function(source, cb, data)
    local xPlayer = Resmon.Lib.GetPlayerFromSource(source)
    local Value = tonumber(data.money)
    local state = false 
    local newMoney = 0

    for k,v in pairs(Config.Motels) do
        if v.mcode == data.mcode then
            if data.type == 'deposit' then
                if xPlayer.bank >= Value then
                    v.money = v.money + Value
                    newMoney = v.money
                    state = true
                end
            else
                if v.money >= Value then
                    xPlayer.RemoveMoney('bank', Value)
                    v.money = v.money - Value
                    newMoney = v.money
                    state = true 
                end
            end
        end
    end

    if state then
        AddMoneyLog(data.mcode, Value, data.type)
        Resmon.Lib.UpdateMotelSQL("money", newMoney, data.mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    else
        cb(false)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:DeleteMotelRoom', function(source, callback, data)
    local mCode = data.mcode 
    local RoomId = tonumber(data.roomid)

    for k,v in pairs(Config.Motels) do
        if v.mcode == mCode then
            table.remove(v.rooms, RoomId)
            CacheRooms = v.rooms
        end
    end

    Resmon.Lib.UpdateMotelSQL("rooms", json.encode(CacheRooms), mCode)

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    callback(true)
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateMotelCorridorColor', function(source, cb, data)
    local state = false 

    for k,v in pairs(Config.Motels) do
        if v.mcode == data.mcode then
            v.theme = data.color
            state = true
        end
    end

    if state then
        Resmon.Lib.UpdateMotelSQL("theme", data.color, data.mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:UpdateMotelGarageColor', function(source, cb, data)
    local state = false 

    for k,v in pairs(Config.Motels) do
        if v.mcode == data.mcode then
            v.garageth = data.color
            state = true
        end
    end

    if state then
        Resmon.Lib.UpdateMotelSQL("garageth", data.color, data.mcode)
        TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)
        cb(true)
    end
end)

Resmon.Lib.Callback.Register('0R:Motels:Server:CreateNewMotel', function(source, cb, data, reception, garage)
    local mCode = Resmon.Lib.GenerateCode()
    local floor = 1
    local garageH = nil 
    local garajBand = false
    if data.apartment then data.apartment = 1 floor = 2 end if not data.apartment then data.apartment = 0 end
    local query = 'INSERT INTO `0r_motels` (mcode, apartment, name, theme, garageth, rooms, saleprice, coords, garage, discount, money, revenue, blip) VALUES (@mcode, @apartment, @name, @theme, @garageTheme, @rooms, @saleprice, @coords, @garage, @discount, @money, @revenue, @blip)'
    if data.garage then
        garageH = '{"x": '..garage.x..', "y": '..garage.y..', "z": '..garage.z..'}'
        garajBand = vector3(garage.x, garage.y, garage.z)
    else
        garageH = false
    end

    MySQL.Async.execute(query, {
        ["@mcode"] = mCode,
        ["@apartment"] = data.apartment,
        ["@name"] = data.motelname,
        ["@theme"] = data.apartmentTheme,
        ["@garageTheme"] = data.garageTheme,
        ["@rooms"] = '[]',
        ["@revenue"] = 0,
        ["@saleprice"] = tonumber(data.motelprice),
        ["@coords"] = '{"x": '..reception.x..', "y": '..reception.y..', "z": '..reception.z..'}',
        ["@garage"] = garageH,
        ["@discount"] = tonumber(data.discount),
        ["@money"] = 500,
        ["@floor"] = floor,
        ["@blip"] = tonumber(data.blipid)
    })

    local TableReplace = {
        owner = nil,
        name = data.motelname,
        mcode = mCode,
        apartment = tonumber(data.apartment),
        floor = floor,
        bills = {},
        rooms = {},
        saleprice = tonumber(data.motelprice),
        coords = vector3(reception.x, reception.y, reception.z),
        garage = garajBand,
        discount = tonumber(data.discount),
        fullRoomSayi = 0,
        ownerName = Config.Lang[Config.Locale]["NoOwner"],
        odaSayi = 0,
        money = 500,
        blip = tonumber(data.blipid)
    }

    table.insert(Config.Motels, TableReplace)

    for k,v in pairs(Config.Motels) do
        if mCode == v.mcode then
            v.apartment = tonumber(data.apartment)
            v.ownerName = Resmon.Lib.GetPlayerOfflineName(v.owner)
            v.odaSayi = 0
        end
    end

    TriggerClientEvent('0R:Motels:Client:SendServerData', -1, Config.Motels)

    cb(true)
end)

RegisterNetEvent('0R:Motels:Server:RequestData', RequestClientData)

RegisterCommand(Config.MotelAdminMenuCommand, OpenMotelAdmin)