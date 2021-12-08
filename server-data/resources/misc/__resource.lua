-- Resource Metadata
fx_version 'cerulean'

description 'utils'
version '1.0.0'

-- What to run
client_scripts {
    'wardrobe.lua',
    '@fivem-rpc/lib.lua',
}

server_scripts {
    '@fivem-rpc/lib.lua',
    'sv_wardrobe.lua',
    '@mysql-async/lib/MySQL.lua',
}