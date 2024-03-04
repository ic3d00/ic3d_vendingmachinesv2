fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'IC3D_'

client_scripts {
	'client.lua'
}
shared_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
  'config.lua'
}
server_scripts {
	"server.lua"
}

ui_page "html/index.html"


files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css',
    'html/vending.png'
}

dependencies {
	'es_extended'
}

shared_script '@es_extended/imports.lua'
