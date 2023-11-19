fx_version 'cerulean'
game 'gta5'

author 'Lord Darth Sidious.'

version '2.1'

shared_scripts {
    'shared/shared.lua',
    'locales/en.lua',
}

client_scripts {
    'cl_config.lua',
    --'sh_config.lua',
    'client/main.lua',
    'client/crafts.lua',
    'client/ingredients.lua',
}

server_scripts{
    'sv_config.lua',
    --'sh_config.lua',
    'server/main.lua',
    'server/ingredients.lua',
}

dependencies {
    'es_extended'
}