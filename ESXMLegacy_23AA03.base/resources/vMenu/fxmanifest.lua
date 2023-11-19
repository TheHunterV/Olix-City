
-- Manifest data
fx_version 'bodacious'
games {'gta5'}

-- Resource stuff
name 'PF-vMenu'
description 'A fork of vMenu, a server sided menu for FiveM with custom permissions.'
version 'v3.5.1-PF'
author 'ribbitpoison/Tom Grobbe'
url 'https://github.com/ProjectFairnessLabs/PF-vMenu/'
ui_page 'storage.html'

-- Adds additional logging, useful when debugging issues.
client_debug_mode 'false'
server_debug_mode 'false'

-- Leave this set to '0' to prevent compatibility issues 
-- and to keep the save files your users.
experimental_features_enabled '0'

-- Files & scripts
files {
    'Newtonsoft.Json.dll',
    'MenuAPI.dll',
    'config/locations.json',
    'config/addons.json',
    'storage.html'
}

client_script 'vMenuClient.net.dll'
server_script 'vMenuServer.net.dll'
