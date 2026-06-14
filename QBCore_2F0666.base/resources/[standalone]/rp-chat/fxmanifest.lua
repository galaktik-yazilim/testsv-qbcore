fx_version 'cerulean'
game 'gta5'

name 'rp-chat'
description 'RAGE MP tarzı şeffaf chat log — yakınlık, /me /b /do'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}

dependency 'chat'
dependency 'qb-core'

file 'style.css'
file 'theme.js'

chat_theme 'rp' {
    styleSheet = 'style.css',
    script = 'theme.js',
    msgTemplates = {
        default = '<span>{0}</span> <span>{1}</span>',
        defaultAlt = '{0}',
        print = '<pre>{0}</pre>',
    }
}

lua54 'yes'
