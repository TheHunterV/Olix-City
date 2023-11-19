fx_version 'cerulean'

game 'gta5'
description 'ESXM UteKnark Modified by LordDarthSidious'
lua54 'yes'
version '1.2'

dependencies {'es_extended','oxmysql'}

shared_scripts {
    '@es_exended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'lib/octree.lua',
    'lib/growth.lua',
    'lib/cropstate.lua',
}
client_scripts {
    'lib/debug.lua',
    'cl_uteknark',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'sv_uteknark.lua',
}