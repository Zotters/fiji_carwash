fx_version 'cerulean'
games { 'gta5' }

author 'bot'
description 'Fiji Carwash Extended'
version '1.0.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

server_scripts {
    'core/server.lua'
}
client_scripts {
    'core/carwash.lua',
    'core/client.lua'
    
}