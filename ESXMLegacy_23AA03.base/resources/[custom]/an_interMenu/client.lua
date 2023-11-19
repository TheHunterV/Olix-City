-- local interactionMenu = {}
local interactionMenus = {}
local OnCooldown = false
local currMenu = nil

local currMenu = nil
function add(data)
    if interactionMenus[data.handle] == nil then
        if Config.Debug then
            print("^5Adding an interaction Menu:^0")
            print("^5| ^1Handle: ^0"..data.handle)
            if data.entity then
                print("^5| ^2Entity: ^0"..data.entity)
            elseif data.coords then
                print("^5| ^3Coords: ^0"..data.coords)
            end
            print("^5| ^5Actions: ^0"..json.encode(data.actions))
            print("^5| ^6Show Distance: ^0"..data.showDist)
            print("^5| ^5Offsets: ^0"..json.encode(data.offset))
        end
        interactionMenus[data.handle] = {
            entity = data.entity,
            coords = data.coords,
            actions = data.actions,
            showDist = data.showDist,
            offset = data.offset or {x = 0.0, y = 0.0, z = 0.0},
        }
    else
        if Config.Debug then
            print("^1You are trying to add an Interaction Menu over the same one that is already there.^0")
            print("^1| ^2Interaction Menu Handle: ^0"..data.handle)
        end
    end
end

function remove(handle)
    if interactionMenus[handle] then
        if Config.Debug then
            print("^1> Removing Interaction Menu - handle: ^0"..handle)
        end
        if currMenu == handle then
            hide(handle)
        end
        interactionMenus[handle] = nil
    end
end

function hide(handle)
    if interactionMenus[handle] and currMenu == handle then
        if Config.Debug then
            print("^1> Hiding Interaction Menu - handle: ^0"..handle)
        end
        SendNUIMessage({
            action = "hide",
        })
        interactionMenus[handle].visible = false
        currMenu = nil
    end
end

---- This snippet was made for testing multiple interaction Menus at once

-- Citizen.CreateThread(function()
--     local zones = {
--         ["CJ"] = {
--             Pos = {
--                 vector3(96.82, -1958.35, 20.75),
--                 vector3(94.43, -1960.95, 20.75),
--                 vector3(91.35, -1964.49, 20.75),
--                 vector3(88.56, -1967.91, 20.75),
--                 vector3(86.09, -1970.78, 20.75),
--                 vector3(83.21, -1974.2, 20.9),
--             },
--         },
--         ["Grove"] = {
--             Pos = {
--                 vector3(101.95, -1936.06, 20.8),
--                 vector3(97.89, -1932.11, 20.8),
--                 vector3(94.34, -1929.93, 20.8),
--                 vector3(90.03, -1927.13, 20.8),
--                 vector3(85.67, -1923.44, 20.8),
--                 vector3(81.25, -1919.86, 20.94),
--             },
--         },
--     }
--     Wait(2000)
--     for k, v in pairs(zones) do
--         for i = 1, #v.Pos do
--             print(k .. "_" .. i)
--             print(v.Pos[i])
--             add({
--                 coords = v.Pos[i],
--                 actions = {
--                     [1] = {key = "X", label = k .. "_" .. i, event = "somerandomevent", type = "cl", args = { key = "X" }, useDist = 1.5 },
--                     [2] = {key = "Y", label = k .. "_" .. i, event = "somerandomevent", type = "cl", args = { key = "Y" }, useDist = 1.5 },
--                     [3] = {key = "Z", label = k .. "_" .. i, event = "somerandomevent", type = "cl", args = { key = "Z" }, useDist = 1.5 },
--                 },
--                 showDist = 1.0,
--                 offset = {x = 1.0, y = 2.0, z = 1.0},
--                 handle = k .. "_" .. i
--             })
--         end
--     end
-- end)

----

-- Demo
if Config.Demo then
    RegisterCommand("testmenu", function(s,a,r)
        local ped = PlayerPedId()
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, -1.0)
        add({
            coords = coords,
            actions = {
                [1] = {key = "X", label = "Take Assault Rifle", event = "somerandomevent", type = "cl", args = { key = "X" }, useDist = 3.0 },
                [2] = {key = "E", label = "Close Menu", command = "closemenu", useDist = 3.0 },
            },
            showDist = 3.0,
            handle = "demonstration_menu",
        })
    end)
    RegisterCommand("closemenu", function(s,a,r)
        print("^3You clicked the ^1E^3 key and a command was executed.^0")
        Wait(250)
        hide("demonstration_menu")
    end)
    local spawnedPed
    RegisterCommand("testmenu2", function(s,a,r)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local h = GetEntityHeading(ped)
        local coords2 = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0.0)
        local model = GetHashKey("a_m_y_vinewood_04")
        local dict,anim = "missfbi5ig_21", "hands_up_anxious_scientist"
        if model then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
                RequestModel(model)
            end
            spawnedPed = CreatePed(4, model, coords2, h, true, true)
            if dict and anim then
                RequestAnimDict(dict)
                while (not HasAnimDictLoaded(dict)) do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(spawnedPed, dict, anim, -1, -1, 0.5, 51, 1, false, false, false)
                add({
                    entity = spawnedPed,
                    actions = {
                        [1] = {key = "X", label = "Do something", event = "somerandomevent", type = "cl", args = { key = "X" }, useDist = 3.0 },
                        [2] = {key = "Y", label = "Do something else", event = "somerandomevent",  type = "cl", args = { key = "Y" }, useDist = 6.0 },
                        [3] = {key = "G", label = "A really really really really really long text", event = "somerandomevent",  type = "cl", args = { key = "G" }, useDist = 4.0 },
                        [4] = {key = "E", label = "Close Menu", command = "closemenu2", useDist = 10.0 },
                    },
                    showDist = 10.0,
                    offset = {x = 0.0, y = 0.0, z = 0.0}, -- this is used to set an offset for the menu
                    handle = "demonstration_menu_2",
                })
            end
        end
    end)
    RegisterCommand("closemenu2", function(s,a,r)
        print("^3You clicked the ^1E^3 key and a command was executed.^0")
        Wait(250)
        hide("demonstration_menu_2")
        if spawnedPed and DoesEntityExist(spawnedPed) then
            NetworkRequestControlOfEntity(spawnedPed)
            while not NetworkHasControlOfEntity(spawnedPed) do
                Wait(10)
            end
            SetEntityAsNoLongerNeeded(spawnedPed)
            DeleteEntity(spawnedPed)
        end
    end)
    RegisterNetEvent("somerandomevent", function(data)
        print("^3You clicked the ^1"..data.key.."^3 key and an event was triggered.^0")
    end)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if interactionMenus ~= {} then
            local plrpos = GetEntityCoords(PlayerPedId())
            local resx, resy = GetActiveScreenResolution()
            local notOnScreen, lowestdist = true, math.huge
            if interactionMenus ~= {} then
                for k,v in pairs(interactionMenus) do
                    if v then
                        local coords = v.coords
                        if v.entity and not v.coords then
                            coords = GetOffsetFromEntityInWorldCoords(v.entity, v.offset.x, v.offset.y, v.offset.z)
                        end
                        local dist = #(plrpos - coords)
                        if lowestdist > dist then lowestdist = dist end
                        if dist <= v.showDist then
                            if Config.Debug then
                                print(k.." is near you!")
                            end
                            local onscreen, x, y =
                                GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)
                            if onscreen then
                                notOnScreen = false
                                if IsPauseMenuActive() == false then
                                    v.left = (x * resx) * 0.75
                                    v.top = y * resy
                                    v.visible = true
                                    v.scale = (1 / dist)
        
                                    if v.scale > 1 then
                                        v.scale = 1
                                    end
                                    if v.scale < 0.5 then
                                        v.scale = 0.5
                                    end
                                    currMenu = k
                                    if Config.Debug then
                                        print("updating ".. k .. " - visible: "..tostring(v.visible) .. " - top: "..v.top)
                                    end
                                        SendNUIMessage({
                                        action = "update",
                                        visible = v.visible,
                                        top = v.top,
                                        left = v.left,
                                        scale = v.scale,
                                        actions = v.actions,
                                    })
                                    for key,val in pairs(v.actions) do
                                        -- DisableControlAction(0, Keys[v.key], true)
                                        if IsDisabledControlJustPressed(0, Keys[val.key]) or IsControlPressed(0, Keys[val.key]) then
                                            if not OnCooldown then
                                                if Config.Debug then
                                                    print("CLICKED " .. val.key)
                                                end
                                                if val.useDist > dist then
                                                    if val.event then
                                                        if val.type == "cl" then
                                                            TriggerEvent(val.event, val.args)
                                                        elseif val.type == "sv" then
                                                            TriggerServerEvent(val.event, val.args)
                                                        end
                                                    elseif val.command then
                                                        ExecuteCommand(val.command)
                                                    end
                                                    SendNUIMessage({
                                                        action = "onkey",
                                                        key = val.key,
                                                        id = key,
                                                        success = true,
                                                    })
                                                    if Config.Debug then
                                                        print("Interaction Button " .. val.key .. " was initiated successfully.")
                                                    end
                                                    timeOutButtons(Config.ButtonSuccessCooldown)
                                                else
                                                    SendNUIMessage({
                                                        action = "onkey",
                                                        key = val.key,
                                                        id = key,
                                                        success = false,
                                                    })
                                                    if Config.Debug then
                                                        print("Interaction Button " .. val.key .. " was not initiated.")
                                                    end
                                                    notify(Config.toofarMSG, "error")
                                                    timeOutButtons(Config.ButtonFailedCooldown)
                                                end
                                            else
                                                if Config.Debug then
                                                    print("You cannot initiate any actions because you are on cooldown.")
                                                end
                                            end
                                        end
                                    end
                                else
                                    v.visible = false
                                    hide(k)
                                end
                            else
                                v.visible = false
                                hide(k)
                            end
                        else
                            v.visible = false
                            hide(k)
                        end
                    end
                end
            end
            if notOnScreen == false then
                -- print("active refreshing")
                Citizen.Wait(Config.RefreshRate)
            else
                -- print("idle refreshing")
                Citizen.Wait(Config.IdleRefreshRate)
            end
        end
    end
end)

function timeOutButtons(time)
    OnCooldown = true
    Citizen.CreateThread(function()
        local timer = time
        while true do
            Citizen.Wait(50)
            timer = timer - 50
            if timer <= 0 then
                OnCooldown = false
                break
            end
        end
    end)
end