-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'alex♰'
description 'jobcenter'

client_scripts {
    '@lib/clients/cl_rpc.lua',
    'client/*.lua',
}
server_script {
    'server/*.lua'
}