fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'rp-ignition'
description 'Manuel kontak, sunucu tuşları (F2/M/K/L) ve yakınlık chat log'
version '1.0.0'

client_scripts {
    'client/main.lua',
    'client/keybinds.lua',
}

dependency 'qb-core'
dependency 'qb-vehiclekeys'
dependency 'rp-chat'
