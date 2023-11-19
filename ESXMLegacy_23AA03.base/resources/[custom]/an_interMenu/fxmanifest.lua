fx_version 'cerulean'
games { 'rdr3', 'gta5' }
author 'aymannajim' -- Discord: https://discord.gg/KxdPzC5EeJ
description 'AN Interaction Menu | GTA VI Inspired Interaction Menu'
version '1.2.0'
lua54 'yes'

ui_page 'ui/index.html'

shared_scripts {
	'config.lua',
}

client_scripts {
	'client.lua',
}

files {
    "ui/index.html",
    "ui/style.css",
    "ui/main.js",
    "ui/sounds/*.mp3",
}

exports {
    "hide",
    "add",
    "remove",
}

escrow_ignore {
    "*",
    "*/*",
    "*/*/*",
}
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'