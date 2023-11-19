Config = {}

--------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- Start Configuring here -------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

-- Framework --
Config.usingESX = false -- Set this to false if you're using QBCore
Config.useLegacy = true -- [ESX Feature | Ignore if you're on QBCore] set this to false if you're using ESX 1.2 or older versions

-- Rewards --
Config.robRewards = { -- Rewards that the player can get after robbing an NPC
    { item = "money", chance = 2, minAmount = 50, maxAmount = 200 }, -- -- item = "money" means it's not an item | chance can be from 1 to 10, 1 being the rarest
    { item = "phone", chance = 8, minAmount = 1, maxAmount = 2 }, -- This gives the player an item called "phone" | chance can be from 1 to 10, 1 being the rarest
}
Config.lootRewards = { -- Rewards that the player can get after looting a dead NPC
    { item = "money", chance = 1, minAmount = 50, maxAmount = 100 }, -- item = "money" means it's not an item | chance can be from 1 to 10, 1 being the rarest
    { item = "phone", chance = 8, minAmount = 1, maxAmount = 2 }, -- This gives the player an item called "phone" | chance can be from 1 to 10, 1 being the rarest
}

-- Distances --
Config.distRequired = 6.0 -- Distance between the player and NPC required for the interaction to happen
Config.fleeDistance = 300 -- Distance that fleeing NPCs should travel before they stop and get back to their normal life

-- Timers --
Config.restrainTime = 4000 -- in milliseconds, Restraining time
Config.unrestrainTime = 5000 -- in milliseconds, Unrestraining time
Config.robTime = 6000 -- in milliseconds, Robbing time -- if you want to make it longer, do 15000 and use "frisk-15s" instead of "frisk-6s" in Config.robSound
Config.lootTime = 15000 -- in milliseconds, Time for Looting dead bodies -- if you want to go less than 15 seconds, try using "frisk-6s" instead of "frisk-12s" in Config.lootSound
Config.autoLetGoNPCs = 15000 -- in milliseconds, Time after your last interaction with an NPC, for the script to let them go automatically | Recommended: 10000 | must be longer than Config.robTime
Config.robCD = 120000 -- cooldown between robbing NPCs
Config.lootCD = 60000 -- cooldown between looting NPCs

-- Keys --
Config.robKey = "X" -- Key used to rob NPCs
Config.restrainKey = "Y" -- Key used to restrain NPCs
Config.meleeKey = "E" -- Key used to melee attack NPCs
Config.threatenKey = "K" -- Key used to threaten NPCs
Config.letGoKey = "G" -- Key used to let the NPCs go
Config.followKey = "G" -- Key used to make NPCs follow you / stop following you
Config.lootKey = "E" -- Key used to loot dead NPCs
Config.carryKey = "Y" -- Key used to carry dead bodies
Config.uncarryKey = "Y" -- Key used to drop carried dead bodies

-- Sounds --
Config.restrainSound = "ziptie" -- name of sound ( located in: an_interNPC/ui/sounds/... )
Config.lootSound = "frisk-15s" -- name of sound ( located in: an_interNPC/ui/sounds/... )
Config.robSound = "frisk-6s" -- name of sound ( located in: an_interNPC/ui/sounds/... )
Config.meleeSound = "melee" -- name of sound ( located in: an_interNPC/ui/sounds/... )
Config.alertSound = "alert" -- name of sound ( located in: an_interNPC/ui/sounds/... )

-- Items --
Config.requiredItems = { -- Only supports QBCore & ESX
    -- ["restrain"] = { name = "ziptie", label = "Ziptie" }, -- item required to restrain NPCs
    -- ["unrestrain"] = { name = "scissors", label = "Scissors" }, -- item required to unrestrain NPCs
}

-- Blacklisted Peds --
Config.blacklistPeds = { -- Add here all peds that you don't want people to interact with.
    -- "mp_m_freemode_01" = true,
    -- "mp_f_freemode_01" = true,
}

-- Police --
Config.minRobCops = 0 -- minimum cops for robbing NPCs
Config.minLootCops = 0 -- minimum cops for looting dead NPCs
Config.policeJobs = { -- Jobs that should be alerted when someone robs or loots a dead body
    ["police"] = true,
    ["sheriff"] = true,
    -- ["fbi"] = true,
}
Config.dispatchRobMsg = '^*^1[911 Dispatch] ^r^0Ongoing 10-31, a person is being robbed - Location has been sent to your GPS.' -- Dispatch robbing alert message
Config.dispatchLootMsg = '^*^1[911 Dispatch] ^r^0Possible 187, a person is seen with a 10-54 ( dead body ) - Location has been sent to your GPS.' -- Dispatch looting alert message

-- Translation / Labels --
Config.robLabel = "Rob"
Config.unrestrainLabel = "Unrestrain"
Config.meleeLabel = "Melee"
Config.threatenLabel = "Threaten"
Config.followMeLabel = "Follow me"
Config.stopFollowLabel = "Stop following"
Config.lootBodyLabel = "Loot Body"
Config.carryBodyLabel = "Carry Body"
Config.messages = { -- Notifications and other messages | only change the text on the right, do not touch the one in the left!
    ["missing_required_item"] = "You are missing:",
    ["rob_loot_rewards"] = "You have found:",
    ["no_rewards"] = "You found nothing!",
    ["npc_ran_away"] = "The person ran away.",
    ["rob_cooldown"] = "You cannot rob that person because you are on cooldown!",
    ["loot_cooldown"] = "You cannot loot that body because you are on cooldown!",
    ["not_enough_cops"] = "Not enough cops!",
    ["started_robbing"] = "You started robbing the person.",
    ["progress_robbing"] = "Robbing the person",
    ["progress_looting"] = "Looting the body",
    ["rob_success"] = "You successfully robbed the person.",
    ["loot_success"] = "You successfully looted the dead person.",
    ["canceled_robbery"] = "You canceled the robbery.",
    ["already_robbed"] = "You already robbed that person.",
    ["already_looted"] = "You already looted that body.",
    ["started_restraining"] = "You started restraining the person...",
    ["progress_restraining"] = "Restraining the person",
    ["progress_unrestraining"] = "Unrestraining the person",
    ["success_restraining"] = "You successfully restrained the person.",
    ["success_unrestraining"] = "You successfully unrestrained the person.",
    ["canceled_action"] = "You canceled the action.",
    ["npc_following"] = "The person is now following you.",
    ["npc_following_died"] = "Your follower died.",
    ["npc_unfollow"] = "The person will no longer follow you.",
    ["npc_carry"] = "You are now carrying a dead body.",
    ["npc_button_drop"] = "You can drop the body using the key:",
}

--------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- End of Configuration --------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


--- Do not touch unless you know what you're doing
--- Do not touch unless you know what you're doing
--- Do not touch unless you know what you're doing

-- Animations --
Config.robAnim = { dict = "oddjobs@shop_robbery@rob_till", anim = "loop" } -- animation used in robbing NPCs
Config.meleeAnim = { dict = "melee@pistol@streamed_fps", anim = "plyr_takedown_front_pistol" } -- animation used in meleeing NPCs
Config.restrainedAnim = { dict = "re@stag_do@idle_a", anim = "idle_a_ped" } -- animation used for ziptied/restrained NPCs
Config.restrainAnim = { dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer" } -- animation used by the player for restraining NPCs
Config.lootAnim = { dict = "amb@medic@standing@tendtodead@idle_a", anim = "idle_c" } -- animation used by the player for looting NPCs
Config.threatenAnims = { -- animations used by the player for threatening the NPCs
    {dict = "random@bicycle_thief@ask_help", anim = "my_dads_going_to_kill_me"}, 
    {dict = "missheistpaletoscore2mcs_2_pt1", anim = "intimidate_intro_trevor"},
    {dict = "missmartin1@pointing_sky1@idle_a", anim = "idle_a"},
    {dict = "random@shop_robbery", anim = "robbery_action_b"},
    {dict = "combat@aim_variations@arrest", anim = "cop_med_arrest_01"},
    {dict = "combat@aim_variations@arrest", anim = "cop_med_arrest_02"},
    {dict = "combat@aim_variations@arrest", anim = "cop_med_arrest_03"},
    {dict = "combat@aim_variations@arrest", anim = "cop_med_arrest_04"},
}

-- Controls
Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}