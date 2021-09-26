fx_version 'bodacious'
game 'gta5'

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/js/script.js', 
	'html/css/stylesheet.css',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/main.lua',
	'config.lua'
}

server_scripts {
	'config.lua'
}

exports {
	'showInteraction',
	'hideInteraction',
}