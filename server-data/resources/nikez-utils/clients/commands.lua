TriggerEvent('chat:addSuggestion', '/tpm', 'Teleport to marker')
TriggerEvent('chat:addSuggestion', '/sit', 'Sit in spawned car')
TriggerEvent('chat:addSuggestion', '/car', 'Spawn Car [args]')
TriggerEvent('chat:addSuggestion', '/coords', 'Player Coordinates')
TriggerEvent('chat:addSuggestion', '/id', 'Your ID')
TriggerEvent('chat:addSuggestion', '/debug', 'Enable/Disable Debug')

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

RegisterCommand('ad', function(source, args, rawCommand)
    RPC.execute('server', 'adminCheck', '')
end)

RegisterCommand('debug', function(source, args, rawCommand)
    RPC.execute('client', 'hud:enabledebug', '')
end)

RegisterCommand('id', function(source, args, rawCommand)
    RPC.execute('client', 'getId', '')
end)

RegisterCommand('heal', function(source, args, rawCommand)
    plr = PlayerPedId()

    if args[1] == 'h' then
        SetEntityHealth(plr, 200)
    elseif args[1] == 'b' then
        SetPedArmour(plr, 60)
    end
end)