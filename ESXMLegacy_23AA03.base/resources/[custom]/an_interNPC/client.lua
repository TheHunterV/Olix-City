------ Framework shit ------
--
ESX = nil
QBCore = nil
PlayerData = nil
--
Citizen.CreateThread(function()
	if Config.usingESX then
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
		
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end
		
		PlayerData = ESX.GetPlayerData()
	else
		QBCore = exports['qb-core']:GetCoreObject()
	end
end)
--
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)
--

------ Actual script ------
local interMenuHandle = "npc_interactionmenu" -- a unique name to be used with an_interMenu
local frozenNPCs = {}
local robbedNPCs = {}
local restrainedNPCs = {}
local lootedPeds = {}
local carriedPeds = {}
local myFollowers = {}
local onRobCooldown = false
local onLootCooldown = false
local onlineCops = 0

CreateThread(function()
    local wait = 500
    while true do
        Wait(wait)
        local ped = PlayerPedId()
        local aiming, targetEntity = GetEntityPlayerIsFreeAimingAt(PlayerId())
        if aiming then
            if DoesEntityExist(targetEntity) and GetEntityType(targetEntity) == 1 and not IsPedInAnyVehicle(targetEntity, false) and not IsPedAPlayer(targetEntity) and not IsPedInCombat(targetEntity, ped) and not IsPedInMeleeCombat(targetEntity) and not Config.blacklistPeds[GetEntityModel(targetEntity)] then
                local pedType = GetPedType(targetEntity)
				if pedType == 4 or pedType == 5 then
                    local mCoords, tCoords = GetEntityCoords(ped), GetEntityCoords(targetEntity)
                    local dist = #(mCoords - tCoords)
                    if dist <= Config.distRequired then
                        if not IsPedDeadOrDying(targetEntity) and not IsEntityPlayingAnim(targetEntity, 'nm', 'firemans_carry', 3) then
                            if not showing1 then
                                if frozenNPCs[targetEntity] ~= "letgo" then
                                    if (IsPedArmed(ped, 4) or IsPedArmed(ped, 2)) then
                                        if not restrainedNPCs[targetEntity] then
                                            wait = 150
                                            FreezeEntityPosition(targetEntity, true) -- FREEZE NPC
                                            frozenNPCs[targetEntity] = true
                                            --- Make the NPC less alerted and prevent him from running away
                                            SetPedDropsWeaponsWhenDead(targetEntity, false)
                                            ClearPedTasks(targetEntity)
                                            SetBlockingOfNonTemporaryEvents(targetEntity, true)
                                            TaskSetBlockingOfNonTemporaryEvents(targetEntity, true)
                                            SetPedFleeAttributes(targetEntity, 0, 0)
                                            SetPedCombatAttributes(targetEntity, 17, 1)
                                            SetPedSeeingRange(targetEntity, 0.0)
                                            SetPedHearingRange(targetEntity, 0.0)
                                            SetPedAlertness(targetEntity, 0)
                                            SetPedConfigFlag(targetEntity, 301, true) -- Makes the bot stand still
                                            LoadAnimDict("missfbi5ig_22")
                                            TaskPlayAnim(targetEntity, "missfbi5ig_22", "hands_up_loop_scientist", 8.0, 1.0, -1, 1)
                                            ---
                                            showing1 = true
                                            exports["an_interMenu"]:add({
                                                entity = targetEntity,
                                                actions = {
                                                    [1] = {key = Config.robKey, label = "Rob", event = "an_interNPC:rob", type = "cl", args = { entity = targetEntity }, useDist = 1.5 },
                                                    [2] = {key = Config.restrainKey, label = "Restrain", event = "an_interNPC:restrain", type = "cl", args = { entity = targetEntity, requiredItem = Config.requiredItems["restrain"] }, useDist = 3.0 },
                                                    [3] = {key = Config.meleeKey, label = "Melee", event = "an_interNPC:melee",  type = "cl", args = { entity = targetEntity }, useDist = 2.5 },
                                                    [4] = {key = Config.threatenKey, label = "Threaten", event = "an_interNPC:threaten",  type = "cl", args = { entity = targetEntity }, useDist = Config.distRequired },
                                                    [5] = {key = Config.letGoKey, label = "Let go", event = "an_interNPC:letGo",  type = "cl", args = { entity = targetEntity }, useDist = Config.distRequired },
                                                },
                                                showDist = 7.0,
                                                offset = {x=0.0,y=0.0,z=0.0},
                                                handle = interMenuHandle,
                                            })
                                        else
                                            wait = 150
                                            SetPedDropsWeaponsWhenDead(targetEntity, false)
                                            SetBlockingOfNonTemporaryEvents(targetEntity, true)
                                            TaskSetBlockingOfNonTemporaryEvents(targetEntity, true)
                                            SetPedFleeAttributes(targetEntity, 0, 0)
                                            SetPedCombatAttributes(targetEntity, 17, 1)
                                            SetPedSeeingRange(targetEntity, 0.0)
                                            SetPedHearingRange(targetEntity, 0.0)
                                            SetPedAlertness(targetEntity, 0)
                                            SetPedConfigFlag(targetEntity, 301, true) -- Makes the bot stand still
                                            local followElement = {key = Config.followKey, label = Config.followMeLabel, event = "an_interNPC:followMe",  type = "cl", args = { entity = targetEntity }, useDist = 5.0 }
                                            if myFollowers[targetEntity] then
                                                followElement = {key = Config.followKey, label = Config.stopFollowLabel, event = "an_interNPC:followMe",  type = "cl", args = { entity = targetEntity, undo = true }, useDist = 5.0 }
                                            end
                                            showing1 = true
                                            exports["an_interMenu"]:add({
                                                entity = targetEntity,
                                                actions = {
                                                    [1] = {key = Config.robKey, label = Config.robLabel, event = "an_interNPC:rob", type = "cl", args = { entity = targetEntity }, useDist = 1.5 },
                                                    [2] = {key = Config.restrainKey, label = Config.unrestrainLabel, event = "an_interNPC:restrain", type = "cl", args = { entity = targetEntity, undo = true, requiredItem = Config.requiredItems["unrestrain"] }, useDist = 3.0 },
                                                    [3] = {key = Config.meleeKey, label = Config.meleeLabel, event = "an_interNPC:melee",  type = "cl", args = { entity = targetEntity }, useDist = 2.5 },
                                                    [4] = {key = Config.threatenKey, label = Config.threatenLabel, event = "an_interNPC:threaten",  type = "cl", args = { entity = targetEntity }, useDist = 5.0 },
                                                    [5] = followElement,  
                                                },
                                                showDist = 7.0,
                                                offset = {x=0.0,y=0.0,z=0.0},
                                                handle = interMenuHandle,
                                            })
                                            Wait(500)
                                        end
                                    end
                                end
                            end
                        else
                            if not showing2 then
                                exports["an_interMenu"]:remove(interMenuHandle)
                                if (IsPedArmed(ped, 4) or IsPedArmed(ped, 1) or IsPedArmed(ped, 2)) then
                                    showing2 = true
                                    exports["an_interMenu"]:add({
                                        entity = targetEntity,
                                        actions = {
                                            [1] = {key = Config.lootKey, label = Config.lootBodyLabel, event = "an_interNPC:lootBody", type = "cl", args = { entity = targetEntity }, useDist = 2.0 },
                                            [2] = {key = Config.carryKey, label = Config.carryBodyLabel, event = "an_interNPC:carryBody", type = "cl", args = { entity = targetEntity, uncarryKey = Config.uncarryKey }, useDist = 3.0 },
                                        },
                                        showDist = 7.0,
                                        offset = {x=0.0,y=0.0,z=-1.0},
                                        handle = interMenuHandle,
                                    })
                                    Wait(500)
                                end
                            end
                        end
                    end
                end
            else
                exports["an_interMenu"]:remove(interMenuHandle)
                showing1, showing2 = false, false
                wait = 500
            end
        else
            exports["an_interMenu"]:remove(interMenuHandle)
            showing1, showing2 = false, false
            wait = 500
            for k,v in pairs(frozenNPCs) do
                local target = k
                if v == true and not IsPedDeadOrDying(target) and not restrainedNPCs[target] then
                    frozenNPCs[k] = "cooldown"
                end
                Wait(300)
            end
        end
    end
end)

RegisterNetEvent("onClientResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        exports["an_interMenu"]:remove(interMenuHandle)
    end
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(frozenNPCs) do
            local target = k
            if v == "cooldown" and not IsPedDeadOrDying(target) and not restrainedNPCs[target] then
                cooldownToLetGo(target)
            end
        end
        Citizen.Wait(3000)
    end
end)

function cooldownToLetGo(entity)
    Citizen.CreateThread(function()
        local timer = Config.autoLetGoNPCs
        while true do
            Citizen.Wait(1000)
            if frozenNPCs[entity] == "cooldown" then
                timer = timer - 1000
            else
                break
            end
            if timer <= 0 then
                TriggerEvent("an_interNPC:letGo", {entity = entity})
                break
            end
        end
    end)
end

local maleBegSpeeches = {
    { s = "GUN_BEG", t = "A_M_Y_BEACH_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BEACH_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BEACH_02_BLACK_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BEVHILLS_01_BLACK_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BEVHILLS_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BEVHILLS_02_BLACK_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BEVHILLS_02_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BUSINESS_01_BLACK_FULL_01" },
    { s = "GUN_BEG", t = "A_M_M_BUSINESS_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "S_M_Y_GENERICCHEAPWORKER_01_BLACK_MINI_02" },
    { s = "GUN_BEG", t = "S_M_Y_GENERICWORKER_01_LATINO_MINI_02" },
    { s = "GUN_BEG", t = "S_M_Y_GENERICWORKER_01_WHITE_MINI_01" },
}

local femaleBegSpeeches = {
    { s = "GUN_BEG", t = "A_F_M_BEACH_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_F_M_BEVHILLS_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_F_M_BEVHILLS_02_BLACK_FULL_01" },
    { s = "GUN_BEG", t = "A_F_M_BEVHILLS_02_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_F_M_BEVHILLS_02_WHITE_FULL_02" },
    { s = "GUN_BEG", t = "A_F_M_BODYBUILD_01_BLACK_FULL_01" },
    { s = "GUN_BEG", t = "A_F_M_BODYBUILD_01_WHITE_FULL_01" },
    { s = "GUN_BEG", t = "A_F_M_DOWNTOWN_01_BLACK_FULL_01" },
}

RegisterNetEvent("an_interNPC:threaten", function(data)
    local ped = PlayerPedId()
    local chosen = Config.threatenAnims[math.random(1,#Config.threatenAnims)]
    LoadAnimDict(chosen.dict)
    threatenVoice()
    TaskPlayAnim(ped, chosen.dict, chosen.anim, 2.0, 0.6, 2000, 1)
    Citizen.Wait(2000)
    if GetPedType(data.entity) == 5 then
        local chosen = femaleBegSpeeches[math.random(1,#femaleBegSpeeches)]
        PlayPedAmbientSpeechWithVoiceNative(data.entity, chosen.s, chosen.t, "SPEECH_PARAMS_FORCE_SHOUTED", 0)
    else
        local chosen = maleBegSpeeches[math.random(1,#maleBegSpeeches)]
        PlayPedAmbientSpeechWithVoiceNative(data.entity, chosen.s, chosen.t, "SPEECH_PARAMS_FORCE_SHOUTED", 0)
    end
    ClearPedTasks(ped)
end)


function threatenVoice()
    local ped = PlayerPedId()
    local sounds = {
        { s = "FIGHT", t = "JOE" },
        { s = "FIGHT", t = "G_M_Y_FAMCA_01_BLACK_MINI_03" },
        { s = "FIGHT", t = "S_M_Y_COP_01_BLACK_MINI_01" },
        { s = "FIGHT", t = "S_M_Y_COP_01_BLACK_MINI_02" },
        { s = "FIGHT", t = "S_M_Y_COP_01_BLACK_FULL_02" },
        { s = "FIGHT", t = "S_M_Y_COP_01_WHITE_FULL_01" },
        { s = "FIGHT", t = "S_M_Y_COP_01_WHITE_FULL_02" },
        { s = "FIGHT", t = "G_M_Y_LOST_03_WHITE_MINI_02" },
        { s = "FIGHT", t = "G_M_Y_LOST_02_LATINO_FULL_01" },
        { s = "PROVOKE_GENERIC", t = "G_M_Y_LOST_03_WHITE_MINI_02" },
        { s = "PROVOKE_GENERIC", t = "G_M_Y_LOST_02_WHITE_MINI_02" },
        { s = "PROVOKE_GENERIC", t = "G_M_Y_FAMCA_01_BLACK_MINI_03" },
        { s = "PROVOKE_GENERIC", t = "G_M_Y_LOST_02_LATINO_FULL_01" },
        { s = "PROVOKE_GENERIC", t = "S_M_Y_COP_01_BLACK_MINI_01" },
        { s = "PROVOKE_GENERIC", t = "S_M_Y_COP_01_BLACK_MINI_02" },
        { s = "PROVOKE_GENERIC", t = "S_M_Y_COP_01_BLACK_FULL_02" },
        { s = "PROVOKE_GENERIC", t = "S_M_Y_COP_01_WHITE_FULL_02" },
        { s = "PROVOKE_GENERIC", t = "S_M_Y_COP_01_WHITE_FULL_01" },
        { s = "DRAW_GUN", t = "G_M_Y_LOST_02_LATINO_FULL_01" },
        { s = "DRAW_GUN", t = "G_M_Y_LOST_02_WHITE_MINI_02" },
        { s = "DRAW_GUN", t = "G_M_Y_LOST_03_WHITE_MINI_02" },
    }
    local random = math.random(1, #sounds)
    local pos = GetEntityCoords(ped)
    -- print("reading .. ".. sounds[random].s .. " from "..sounds[random].t)
    RequestModel("S_M_Y_COP_01")
    while not HasModelLoaded("S_M_Y_COP_01") do
        RequestModel("S_M_Y_COP_01")
        Wait(100)
    end
    local newped = CreatePed(0, GetHashKey("S_M_Y_COP_01"), pos, 0, false, false)
    SetEntityInvincible(newped, true)
    SetEntityVisible(newped, false, false)
    SetEntityCollision(newped, false, false)
    SetEntityCollision_2(newped, p1, p2)
    SetEntityNoCollisionEntity(newped, true, true)
    AttachEntityToEntity(newped, ped, 0, 0, 0, 1.0, 0, 0, 0, 0, false, false, false, 2, false)
    PlayPedAmbientSpeechWithVoiceNative(newped, sounds[random].s, sounds[random].t, "SPEECH_PARAMS_FORCE_SHOUTED", 6)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            if not IsAmbientSpeechPlaying(newped) then
                DetachEntity(newped, false, false)
                DeleteEntity(newped)
                break
            end
        end
    end)
end

RegisterNetEvent("an_interNPC:melee", function(data)
    local ped = PlayerPedId()
    LoadAnimDict(Config.meleeAnim.dict)
    TaskPlayAnim(ped, Config.meleeAnim.dict, Config.meleeAnim.anim, 8.0, 1.0, 1200, 1)
    Citizen.Wait(500)
    PlaySFX(Config.meleeSound)
    if GetPedType(data.entity) == 5 then
        PlayPedAmbientSpeechWithVoiceNative(data.entity, "GENERIC_FRIGHTENED_HIGH", "G_F_Y_BALLAS_01_BLACK_MINI_03", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
    else
        PlayPedAmbientSpeechWithVoiceNative(data.entity, "DYING_MOAN", "G_M_Y_FAMCA_01_BLACK_FULL_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
    end
    Citizen.Wait(700)
    ApplyDamageToPed(data.entity, 50, false)
    ApplyPedDamagePack(data.entity, "Skin_Melee_0", 100, 100)
    ClearPedTasks(ped)
end)

RegisterNetEvent("an_interNPC:rob", function(data)
    if onRobCooldown then
        notify(Config.messages["rob_cooldown"], "error", 8000)
        return
    end
    if onlineCops < Config.minRobCops then
        notify(Config.messages["not_enough_cops"], "error", 8000)
        return
    end
    if not robbedNPCs[data.entity] then
        local ped = PlayerPedId()
        ClearPedTasks(data.entity)
        Wait(100)
        TaskStandStill(data.entity, Config.robTime + 500)
        FreezeEntityPosition(data.entity, true)
        Wait(500)
        notify(Config.messages["started_robbing"], "info", 3000)
        local pedcoords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent('an_interNPC:notifycops', Config.dispatchRobMsg, pedcoords)
        PlaySFX(Config.robSound)
        if Config.usingESX then
            if Config.useLegacy then
                ESX.Progressbar(Config.messages["progress_robbing"], Config.robTime, {
                    FreezePlayer = true,
                    animation = {
                        type = "anim",
                        dict = Config.robAnim.dict,
                        lib = Config.robAnim.anim,
                        flags = 1,
                    },
                    onFinish = function()
                        notify(Config.messages["rob_success"], "info", 8000)
                        robbedNPCs[data.entity] = true
                        exports["an_interMenu"]:remove(interMenuHandle)
                        onCooldown("rob")
                        showing1, showing2 = false, false
                        FreezeEntityPosition(data.entity, false)
                        rewardPlayer(Config.robRewards)
                end, onCancel = function()
                    notify(Config.messages["canceled_robbery"], "error", 8000)
                end
                })
            else
                LoadAnimDict(Config.robAnim.dict)
                TaskPlayAnim(ped, Config.robAnim.dict, Config.robAnim.anim, 8.0, 1.0, -1, 1)
                robbedNPCs[data.entity] = true
                exports["an_interMenu"]:remove(interMenuHandle)
                onCooldown("rob")
                showing1, showing2 = false, false
                Citizen.Wait(Config.robTime)
                notify(Config.messages["rob_success"], "info", 8000)
                FreezeEntityPosition(data.entity, false)
                ClearPedTasks(ped)
                rewardPlayer(Config.lootRewards)
            end
        else
            QBCore.Functions.Progressbar("progress_robbing", Config.messages["progress_robbing"], Config.robTime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = Config.robAnim.dict,
                anim = Config.robAnim.anim,
                flags = 1,
            }, {}, {}, function() -- Done
                StopAnimTask(ped, Config.robAnim.dict, Config.robAnim.anim, 1.0)
                robbedNPCs[data.entity] = true
                exports["an_interMenu"]:remove(interMenuHandle)
                showing1, showing2 = false, false
                notify(Config.messages["rob_success"], "info", 8000)
                onCooldown("rob")
                FreezeEntityPosition(data.entity, false)
                ClearPedTasks(ped)
                rewardPlayer(Config.lootRewards)
            end, function() -- Cancel
                StopAnimTask(ped, Config.robAnim.dict, Config.robAnim.anim, 1.0)
                notify(Config.messages["canceled_robbery"], "error", 8000)
            end)
        end
    else
        notify(Config.messages["already_robbed"], "error", 8000)
    end
end)

RegisterNetEvent("an_interNPC:restrain", function(data)
    if data.requiredItem then
        local hasItem = hasItem(data.requiredItem.name)
        if not hasItem then
            notify(Config.messages["missing_required_item"].. " "..data.requiredItem.label, "error", 12000)
            return
        end
    end
    if not restrainedNPCs[data.entity] then
        local ped = PlayerPedId()
        SetPedConfigFlag(data.entity, 301, true)
        ClearPedTasksImmediately(data.entity)
        TaskStandStill(data.entity, Config.restrainTime)
        SetEntityHeading(data.entity, GetEntityHeading(ped))
        LoadAnimDict("mp_pol_bust_out")
        LoadAnimDict("mp_prison_break")
		LoadAnimDict(Config.restrainedAnim.dict)
		LoadAnimDict('mp_arrest_paired')
        TaskPlayAnim(data.entity, 'mp_pol_bust_out', 'guard_handsup_loop', 6.0, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(1000)
        TaskPlayAnim(ped, 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -1.0, 1000, 51, 0, 0, 0, 0)
        TaskPlayAnim(data.entity, 'mp_prison_break', 'handcuffed', 2.0, -1.0, 1000, 51, 0, 0, 0, 0)
        Citizen.Wait(1000)
        TaskPlayAnim(data.entity, Config.restrainedAnim.dict, Config.restrainedAnim.anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
        restrainedNPCs[data.entity] = true
        frozenNPCs[data.entity] = nil
        exports["an_interMenu"]:remove(interMenuHandle)
        showing1, showing2 = false, false
        PlaySFX(Config.restrainSound)
        local succeed = false
        notify(Config.messages["started_restraining"], "info", 4000)
        if Config.usingESX then
            if Config.useLegacy then
                ESX.Progressbar(Config.messages["progress_restraining"], Config.restrainTime, {
                    FreezePlayer = true,
                    animation = {
                        type = "anim",
                        dict = Config.restrainAnim.dict, 
                        lib = Config.restrainAnim.anim,
                        flags = 51,
                    },
                    onFinish = function()
                        notify(Config.messages["success_restraining"], "success", 8000)
                        SetPedConfigFlag(data.entity, 301, false)
                        ClearPedTasks(ped)
                        Wait(100)
                        TaskStandStill(data.entity)
                        succeed = true
                end, onCancel = function()
                    notify(Config.messages["canceled_action"], "error", 8000)
                end
                })
            else
                LoadAnimDict(Config.restrainAnim.dict)
                TaskPlayAnim(ped, Config.restrainAnim.dict, Config.restrainAnim.anim, 2.0, -2, Config.restrainTime, 51, 0, 0, 0, 0)
                Citizen.Wait(Config.restrainTime)
                notify(Config.messages["success_restraining"], "success", 8000)
                SetPedConfigFlag(data.entity, 301, false)
                ClearPedTasks(ped)
                Wait(100)
                TaskStandStill(data.entity)
                succeed = true
            end
        else
            QBCore.Functions.Progressbar("progress_restraining", Config.messages["progress_restraining"], Config.restrainTime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = Config.restrainAnim.dict,
                anim = Config.restrainAnim.anim,
                flags = 51,
            }, {}, {}, function() -- Done
                StopAnimTask(ped, Config.restrainAnim.dict, Config.restrainAnim.anim, 1.0)
                notify(Config.messages["success_restraining"], "success", 8000)
                SetPedConfigFlag(data.entity, 301, false)
                ClearPedTasks(ped)
                Wait(100)
                TaskStandStill(data.entity)
                succeed = true
            end, function() -- Cancel
                StopAnimTask(ped, Config.restrainAnim.dict, Config.restrainAnim.anim, 1.0)
                notify(Config.messages["canceled_action"], "error", 8000)
            end)
        end
        if succeed then
            Citizen.CreateThread(function()
                while true do
                    Wait(1000)
                    if restrainedNPCs[data.entity] then
                        if not IsEntityPlayingAnim(data.entity, Config.restrainedAnim.dict, Config.restrainedAnim.anim, 3) then
                            TaskPlayAnim(data.entity, Config.restrainedAnim.dict, Config.restrainedAnim.anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
                            Wait(1000)
                        end
                        if IsPedDeadOrDying(data.entity) then
                            restrainedNPCs[data.entity] = nil
                            RemoveAnimDict(Config.restrainedAnim.dict)
                            break
                        end
                    else
                        break
                    end
                end
            end)
        end
    else
        if data.undo then
            local ped = PlayerPedId()
            NetworkRequestControlOfEntity(data.entity)
            while not NetworkHasControlOfEntity(data.entity) do
                Wait(0)
            end
            TaskStandStill(data.entity, Config.unrestrainTime)
            SetEntityHeading(data.entity, GetEntityHeading(ped))
            exports["an_interMenu"]:remove(interMenuHandle)
            showing1, showing2 = false, false
            if Config.usingESX then
                if Config.useLegacy then
                    ESX.Progressbar(Config.messages["progress_unrestraining"], Config.unrestrainTime, {
                        FreezePlayer = true,
                        animation = {
                            type = "anim",
                            dict = Config.restrainAnim.dict, 
                            lib = Config.restrainAnim.anim,
                            flags = 51,
                        },
                        onFinish = function()
                            notify(Config.messages["success_unrestraining"], "success", 8000)
                            restrainedNPCs[data.entity] = nil
                            frozenNPCs[data.entity] = true
                            ClearPedTasksImmediately(data.entity)
                            FreezeEntityPosition(data.entity, false)
                    end, onCancel = function()
                        notify(Config.messages["canceled_action"], "error", 8000)
                    end
                    })
                else
                    LoadAnimDict(Config.restrainAnim.dict)
                    TaskPlayAnim(ped, Config.restrainAnim.dict, Config.restrainAnim.anim, 2.0, -2, Config.unrestrainTime, 51, 0, 0, 0, 0)
                    Citizen.Wait(Config.unrestrainTime)
                    notify(Config.messages["success_unrestraining"], "success", 8000)
                    restrainedNPCs[data.entity] = nil
                    frozenNPCs[data.entity] = true
                    ClearPedTasksImmediately(data.entity)
                    FreezeEntityPosition(data.entity, false)
                end
            else
                QBCore.Functions.Progressbar("progress_unrestraining", Config.messages["progress_unrestraining"], Config.unrestrainTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = Config.restrainAnim.dict,
                    anim = Config.restrainAnim.anim,
                    flags = 51,
                }, {}, {}, function() -- Done
                    StopAnimTask(ped, Config.restrainAnim.dict, Config.restrainAnim.anim, 1.0)
                    notify(Config.messages["success_unrestraining"], "success", 8000)
                    restrainedNPCs[data.entity] = nil
                    frozenNPCs[data.entity] = true
                    ClearPedTasksImmediately(data.entity)
                    FreezeEntityPosition(data.entity, false)
                end, function() -- Cancel
                    StopAnimTask(ped, Config.restrainAnim.dict, Config.restrainAnim.anim, 1.0)
                    notify(Config.messages["canceled_action"], "error", 8000)
                end)
            end
        end
    end
end)

RegisterNetEvent("an_interNPC:followMe", function(data)
    if restrainedNPCs[data.entity] then
        if not myFollowers[data.entity] then
            Wait(250)
            myFollowers[data.entity] = true
            exports["an_interMenu"]:remove(interMenuHandle)
            showing1, showing2 = false, false
            SetPedConfigFlag(data.entity, 301, false)
            FreezeEntityPosition(data.entity, false)
            notify(Config.messages["npc_following"], "success", 8000)
            TaskGoToEntity(data.entity, PlayerPedId(), 99999999999, 4.0, 100.0, 0, 0)
            TaskGoToEntity(entity, target, duration, distance, speed, p5, p6)
            Citizen.CreateThread(function()
                while true do
                    if myFollowers[data.entity] and DoesEntityExist(data.entity) then
                        if GetDistanceBetweenCoords(GetEntityCoords(data.entity), GetEntityCoords(PlayerPedId()), true) >= 100.0 then
                            SetEntityCoords(data.entity, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, 0.0))
                        end
                        if GetDistanceBetweenCoords(GetEntityCoords(data.entity), GetEntityCoords(PlayerPedId()), true) >= 5.0 then
                            SetEntityAsMissionEntity(data.entity)
                            TaskGoToEntity(data.entity, PlayerPedId(), 99999999999, 4.0, 100.0, 0, 0)
                            SetPedKeepTask(data.entity, true)
                        end
                        if IsPedDeadOrDying(data.entity) then
                            myFollowers[data.entity] = nil
                            SetEntityAsNoLongerNeeded(data.entity)
                            notify(Config.messages["npc_following_died"], "error", 8000)
                            break
                        end
                    else
                        break
                    end
                    Wait(500)
                end
            end)
        else
            if data.undo then
                Wait(250)
                exports["an_interMenu"]:remove(interMenuHandle)
                showing1, showing2 = false, false
                SetEntityAsNoLongerNeeded(data.entity)
                myFollowers[data.entity] = nil
                notify(Config.messages["npc_unfollow"], "success", 8000)
            end
        end
    end
end)

RegisterNetEvent("an_interNPC:carryBody", function(data)
    if data.entity then
        if IsEntityAttachedToEntity(data.entity, PlayerPedId()) then
            SetPedConfigFlag(data.entity, 301, false)
            DetachEntity(data.entity, PlayerPedId(), true)
            ClearPedTasks(data.entity)
            ClearPedTasks(PlayerPedId())
            SetEntityHealth(data.entity, 0)
            carriedPeds[data.entity] = nil
            SetEntityAsNoLongerNeeded(data.entity)
        else
            local coords = GetEntityCoords(data.entity)
            NetworkRequestControlOfEntity(data.entity)
            while not NetworkHasControlOfEntity(data.entity) do
                Wait(0)
            end
            SetEntityAsMissionEntity(data.entity)
            ResurrectPed(data.entity)
            ClearPedTasksImmediately(data.entity)
            SetEntityHealth(data.entity, 100)
            SetEntityCoords(data.entity, coords)
            SetPedConfigFlag(data.entity, 301, true)
            ----- Makes the NPC more NPC
            SetPedDropsWeaponsWhenDead(data.entity, false)
            ClearPedTasks(data.entity)
            TaskTurnPedToFaceEntity(data.entity, PlayerPedId(), 3.0)
            SetBlockingOfNonTemporaryEvents(data.entity, true)
            TaskSetBlockingOfNonTemporaryEvents(data.entity, true)
            SetPedFleeAttributes(data.entity, 0, 0)
            SetPedCombatAttributes(data.entity, 17, 1)
            SetPedSeeingRange(data.entity, 0.0)
            SetPedHearingRange(data.entity, 0.0)
            SetPedAlertness(data.entity, 0)
            SetPedConfigFlag(data.entity, 301, true) -- Makes the bot stand still
            --
            Citizen.Wait(300)
            LoadAnimDict('nm')
            LoadAnimDict('missfinale_c2mcs_1')
            TaskPlayAnim(data.entity, 'nm', 'firemans_carry', 8.0, -1, -1, 1, 1, 0, 0, 0)
            AttachEntityToEntity(data.entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 40269), -0.1, 0.0, 0.1, 25.0, -290.0, -150.0, 1, 1, 0, 1, 0, 1)
            TaskPlayAnim(PlayerPedId(), 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 1.0, -1, -1, 50, 0, 0, 0, 0)
            carriedPeds[data.entity] = true
            notify(Config.messages["npc_carry"], "success", 8000)
            Wait(1000)
            notify(Config.messages["npc_button_drop"] .." ["..data.uncarryKey.."]", "info", 10000)
            Citizen.CreateThread(function()
                while true do
                    Wait(0)
                    if IsControlJustPressed(0, Keys[data.uncarryKey]) then
                        for k,v in pairs(carriedPeds) do
                            if v then
                                SetPedConfigFlag(data.entity, 301, false)
                                local coords = GetOffsetFromEntityInWorldCoords(data.entity, 0.0, 0.0, -1.0)
                                DetachEntity(k, PlayerPedId(), true)
                                ClearPedTasksImmediately(k)
                                ClearPedTasks(PlayerPedId())
                                SetEntityCoords(data.entity, coords)
                                SetEntityHealth(data.entity, 0)
                                FreezeEntityPosition(data.entity, false)
                                carriedPeds[data.entity] = nil
                            end
                        end
                        break
                    end
                end
            end)
        end
    end
end)

RegisterNetEvent("an_interNPC:lootBody", function(data)
    if onLootCooldown then
        notify(Config.messages["loot_cooldown"], "error", 8000)
        return
    end
    if onlineCops < Config.minLootCops then
        notify(Config.messages["not_enough_cops"], "error", 8000)
        return
    end
    if not lootedPeds[data.entity] then
        if IsPedDeadOrDying(data.entity) then
            local ped = PlayerPedId()
            Wait(250)
            lootedPeds[data.entity] = true
            exports["an_interMenu"]:remove(interMenuHandle)
            showing1, showing2 = false, false
            local pedcoords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('an_interNPC:notifycops', Config.dispatchLootMsg, pedcoords)
            PlaySFX(Config.lootSound)
            if Config.usingESX then
                if Config.useLegacy then
                    ESX.Progressbar(Config.messages["progress_looting"], Config.lootTime, {
                        FreezePlayer = true,
                        animation = {
                            type = "anim",
                            dict = Config.lootAnim.dict, 
                            lib = Config.lootAnim.anim
                        },
                        onFinish = function()
                            notify(Config.messages["loot_success"], "info", 8000)
                            onCooldown("loot")
                            ClearPedTasks(ped)
                            rewardPlayer(Config.lootRewards)
                    end, onCancel = function()
                        notify(Config.messages["canceled_action"], "error", 8000)
                        lootedPeds[data.entity] = false
                    end
                    })
                else
                    LoadAnimDict(Config.lootAnim.dict)
                    TaskPlayAnim(ped, Config.lootAnim.dict, Config.lootAnim.anim, 8.0, 1.0, -1, 1)
                    Citizen.Wait(Config.lootTime)
                    notify(Config.messages["loot_success"], "info", 8000)
                    onCooldown("loot")
                    ClearPedTasks(ped)
                    rewardPlayer(Config.lootRewards)
                end
            else
                QBCore.Functions.Progressbar("progress_looting", Config.messages["progress_looting"], Config.unrestrainTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = Config.lootAnim.dict,
                    anim = Config.lootAnim.anim,
                    flags = 1,
                }, {}, {}, function() -- Done
                    StopAnimTask(ped, Config.lootAnim.dict, Config.lootAnim.anim, 1.0)
                    notify(Config.messages["loot_success"], "info", 8000)
                    onCooldown("loot")
                    ClearPedTasks(ped)
                    rewardPlayer(Config.lootRewards)
                end, function() -- Cancel
                    StopAnimTask(ped, Config.lootAnim.dict, Config.lootAnim.anim, 1.0)
                    notify(Config.messages["canceled_action"], "error", 8000)
                    lootedPeds[data.entity] = false
                end)
            end
        end
    else
        notify(Config.messages["already_looted"], "error", 8000)
    end
end)

RegisterNetEvent("an_interNPC:letGo", function(data)
    FreezeEntityPosition(data.entity, false)
    SetBlockingOfNonTemporaryEvents(data.entity, false)
    TaskSetBlockingOfNonTemporaryEvents(data.entity, false)
    SetPedFleeAttributes(data.entity, 0, true)
    SetPedSeeingRange(data.entity, 50.0)
    SetPedHearingRange(data.entity, 50.0)
    SetPedAlertness(data.entity, 2)
    SetPedConfigFlag(data.entity, 301, false)
    ClearPedTasks(data.entity)
    TaskSmartFleePed(data.entity, PlayerPedId(), Config.fleeDistance, -1, 1.0, 1.0)
    SetPedKeepTask(data.entity, true)
    SetEntityAsNoLongerNeeded(data.entity)
    frozenNPCs[data.entity] = "letgo"
    Wait(250)
    exports["an_interMenu"]:remove(interMenuHandle)
    showing1, showing2 = false, false
end)

function PlaySFX(name)
    SendNUIMessage({
        action = "play",
        sound = name
    })
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function rewardPlayer(rewards)
    TriggerServerEvent("an_interNPC:rewardPlayer", rewards)
end

function hasItem(name)
    if Config.usingESX then
        local inv = ESX.GetPlayerData().inventory
        local hasItem = false
        for i = 1, #inv do
            if inv[i].name == name then
                if inv[i].count > 0 then
                    hasItem = true
                end
            end
        end
        return hasItem
    else
        local hasItem = QBCore.Functions.HasItem(name)
        return hasItem
    end
end

RegisterNetEvent('an_interNPC:notifycopsCL')
AddEventHandler('an_interNPC:notifycopsCL', function(msg,coords)
	local job = getjob()
	if Config.policeJobs[job] then
        PlaySFX(Config.alertSound)
		SetNewWaypoint(coords.x, coords.y)
		TriggerEvent('chat:addMessage', { args = {msg}})
	end
end)

RegisterNetEvent('an_interNPC:notify', function(msg,type,duration)
    notify(msg,type,duration)
end)

RegisterNetEvent('an_interNPC:updatecops', function(cops)
    onlineCops = cops
end)

function notify(msg,type,duration)
    if Config.usingESX then
        ESX.ShowNotification(msg, type, duration)
    else
        if type == "info" then
            type = 'primary'
        end
        QBCore.Functions.Notify(msg, type, duration)
    end
end

function getjob()
    if Config.usingESX then
		job = PlayerData.job.name
	else
        local Player = QBCore.Functions.GetPlayerData()
		job = Player.job.name
	end
	return job
end

function onCooldown(type)
    if type == "rob" then
        local timer = Config.robCD
        onRobCooldown = true
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1000)
                timer = timer - 1000
                if timer <= 0 then
                    onRobCooldown = false
                    break
                end
            end
        end)
    elseif type == "loot" then
        local timer = Config.lootCD
        onLootCooldown = true
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1000)
                timer = timer - 1000
                if timer <= 0 then
                    onLootCooldown = false
                    break
                end
            end
        end)
    end
end