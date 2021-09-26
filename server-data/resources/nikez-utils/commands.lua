RegisterCommand('coords', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:coords', '')
end)

RegisterCommand('car', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:spawnVehicle', args[1])
end)

RegisterCommand('sit', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:sitInVehicle', '')
end)

RegisterCommand('tpm', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:teleportMarker', '')
end)

RegisterCommand('spawn', function(source, args, rawCommand)
    RPC.execute('client', 'spawnselector:setNui', 'spawn')
end)

RegisterCommand('heal', function(source, args, rawCommand)
    RPC.execute('client', 'healDumbass', '')
end)