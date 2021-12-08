fx_version 'cerulean'
ui_page 'html/ui.html'
game 'gta5'

files {
	'html/*',
    'html/belt.svg',
}

client_scripts {
    'client/*.lua',
    '@lib/clients/cl_rpc.lua',
}

server_scripts {
    'server/*.lua'
}

exports {
    'backToVoiceHud',
}
