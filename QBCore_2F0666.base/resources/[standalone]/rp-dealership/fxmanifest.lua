fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'rp-dealership'
description 'NPC / marker galeri — filtreli araç listesi ve satın alma'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js',
}

dependencies {
    'qb-core',
    'oxmysql',
}
