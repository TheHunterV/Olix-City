fx_version "bodacious"

game "gta5"

script "0r_motels"

writer "Kibra"

version "1.0.1"

lua54 "yes"

depencedy "0r_lib"

client_scripts {
    "@ox_lib/init.lua",
    "modules/client/pedShot.lua",
    "modules/client/main.lua",
    "modules/client/entity.lua",
    "modules/client/adminMenu.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "config/config_functions.lua",
    "modules/server/main.lua",
}

shared_scripts {
    "config/config_main.lua",
    "config/config_lang.lua",
    "config/config_functions.lua"
}

escrow_ignore {
    "config/config_main.lua",
    "config/config_lang.lua",
    "config/config_functions.lua",
    "modules/client/pedShot.lua",
    "modules/client/main.lua",
    "modules/client/entity.lua",
    "modules/client/adminMenu.lua",
    "modules/server/main.lua",
}

ui_page 'web/index.html'

files {
    "web/js/*",
    "web/index.html",
    "web/style.css",
    "web/pimg/*.png",
    "hash.json",
    "web/back.png",
    "web/back.jpg",
    "web/fonts/*.otf",
    "web/rooms/*"
}

depencedy '0r_lib'
dependency '/assetpacks'