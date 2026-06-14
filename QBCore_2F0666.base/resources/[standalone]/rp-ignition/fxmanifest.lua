fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'rp-ignition'
description 'Manuel kontak — M ile çalıştır/durdur, yakınlık chat log'
version '1.0.0'

client_scripts {
    'client/keybinds.lua',
    'client/main.lua',
}

dependency 'qb-core'
dependency 'qb-vehiclekeys'
dependency 'rp-chat'
