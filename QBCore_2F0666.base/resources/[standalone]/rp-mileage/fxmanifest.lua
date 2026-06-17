fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'rp-mileage'
description 'Kalıcı araç km takibi (ekranda km, player_vehicles.drivingdistance)'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

dependencies {
    'qb-core',
    'oxmysql',
}
