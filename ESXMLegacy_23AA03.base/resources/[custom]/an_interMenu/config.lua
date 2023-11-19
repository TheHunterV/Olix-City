Config = {}

-- Configure here
Config.RefreshRate = 20 -- Refresh rate when menu is visible -- Higher number = better performance = more flickering ( I recommend setting it between 5 and 25 )
Config.IdleRefreshRate = 500 -- Refresh rate when menu is not visible
Config.ButtonSuccessCooldown = 500 -- Time to wait after initiating an action successfully and being on the right distance
Config.ButtonFailedCooldown = 1500 -- Time to wait after clicking a button and not being on the required distance
Config.Debug = false -- Enables dev mode
Config.Demo = true -- Enables the /testmenu and /testmenu2 command
Config.toofarMSG = "You are not close enough to initiate that action." -- msg shown as a notification for when someone isn't in the required distance to initiate an action

function notify(msg,type)
    print(type..": "..msg) -- We only print the messages for now.
    -- here you can add your own notification system
    -- Example for QBCore: QBCore.Functions.Notify(msg, type, 8000)
end

----------------
--- Template ---
----------------
---- Adding an interaction Menu ----
--[[
exports["an_interMenu"]:add({
    entity = entity, -- if you want to show the interaction menu on an entity, then use this and comment the one below
    coords = coords, -- if you want to show the interaction menu on specific coords, then use this and comment the one above
    actions = { -- check the demo on the client.lua for more information
        [1] = {key = "X", label = "label", event = "SVevent:name", type = "sv", args = { entity = targetEntity }, useDist = 1.5 },
        [2] = {key = "Y", label = "label", command = "command args1 args2 args3", useDist = 3.0 },
        [3] = {key = "E", label = "label", event = "CLevent:name",  type = "cl", args = {}, useDist = 6.0 },
    },
    showDist = 8.0,
    offset = {x = 1.0, y = 2.0, z = 1.0}, -- this is used to set an offset for the menu when using an entity
    handle = "something_unique_14581" -- a unique name ( must be different each time you add a new menu ) - used to identify interaction menus
})
]]
---- Hiding the interaction Menu ----
--[[
exports["an_interMenu"]:hide("something_unique_14581") -- use the same unique name that you typed when adding the interaction menu
]]
---- Removing an Interaction Menu ----
--[[
exports["an_interMenu"]:remove("something_unique_14581") -- use the same unique name that you typed when adding the interaction menu
]]
----------------
----------------

--- Do not touch
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