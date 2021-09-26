-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'astra'
description 'utils'
version '1.0.0'

-- What to run
client_scripts {
    'clients/*.lua',
    '@lib/clients/cl_rpc.lua',
}
server_scripts {
    'server/*.lua',
    '@lib/clients/cl_rpc.lua',
    '@mysql-async/lib/MySQL.lua',
}