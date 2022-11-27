fx_version 'cerulean'
games { 'gta5' }

author 'bot'
description 'Fiji Carwash, NDCore + OxLib'
version '1.0.1'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'src/server.lua'
}
client_scripts {
    'src/zones.lua',
	'src/client.lua'
    
}