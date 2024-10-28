fx_version 'bodacious'
games { 'rdr3', 'gta5' }

author 'ABT Resources | https://discord.gg/TAp46jSK5F'
description 'A birthday system that gives a reward when the player has a birthday.'
version '1.0.0'

client_script 'client/cl_abt.lua'
server_script 'server/sv_abt.lua'
shared_script 'config.lua'

ui_page('html/index.html')

files {
    'html/index.html',
    'html/style.css',
    'html/fonts/*.ttf',
    'html/img/*.png'
}

lua54 'yes'
