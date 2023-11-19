fx_version 'cerulean'
games { 'rdr3', 'gta5' }
author 'aymannajim' -- Discord: https://discord.gg/KxdPzC5EeJ
description 'AN NPC Interactions'
version '1.0.0'
lua54 'yes'

ui_page 'ui/index.html'

server_scripts {
	'server.lua',
}

shared_scripts {
	'config.lua',
}

client_scripts {
	'client.lua',
}

files {
    "ui/index.html",
    "ui/main.js",
    "ui/sounds/*.mp3",
}

escrow_ignore {
    "*",
    "*/*",
}
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'