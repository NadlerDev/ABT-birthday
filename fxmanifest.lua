fx_version 'bodacious'
games { 'rdr3', 'gta5' }

author 'ABT Resources | https://discord.gg/TAp46jSK5F'
description 'A birthday system thats give reward when player has birthday.'
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
