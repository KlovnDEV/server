TriggerEvent('chat:addSuggestion', '/tpm', 'Teleport to marker')
TriggerEvent('chat:addSuggestion', '/sit', 'Sit in spawned car')
TriggerEvent('chat:addSuggestion', '/car', 'Spawn Car [args]')
TriggerEvent('chat:addSuggestion', '/coords', 'Player Coordinates')
TriggerEvent('chat:addSuggestion', '/id', 'Your ID')
TriggerEvent('chat:addSuggestion', '/fix', 'Fix vehicle')
TriggerEvent('chat:addSuggestion', '/devmode', 'On/off devmode mode')
TriggerEvent('chat:addSuggestion', '/debug', 'On/off debug mode')
TriggerEvent('chat:addSuggestion', '/hud', 'Enable/Disable Hud')
TriggerEvent('chat:addSuggestion', '/teleport', 'Teleport to xyz')
TriggerEvent('chat:addSuggestion', '/debug', 'Enable/Disable Debug')
TriggerEvent('chat:addSuggestion', '/relax', 'Relax (low the stress)')
TriggerEvent('chat:addSuggestion', '/plate', 'Get vehicle plate')

RegisterCommand('coords', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:xyz', '')
end)

RegisterCommand('plate', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:changeVehiclePlate', '')
end)

RegisterCommand('car', function(source, args, rawCommand)
    local vehicleInput = exports["interact"]:KeyboardInput({rows = {{id = 0, txt = "Vehicle Model"}}})
    RPC.execute('client', 'server-utilities:spawnVehicle', vehicleInput[1].input)
end)

RegisterCommand('sit', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:sitInVehicle', '')
end)

RegisterCommand('hud', function(source, args, rawCommand)
    RPC.executeLatent('client', 'rpc:isloggedin', '', 1000)
end)

RegisterCommand('tpm', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:teleportMarker', '')
end)

RegisterCommand('sj', function(source, args, rawCommand)
    RPC.execute('client', 'raid_clothes:openClothing', '')
end)

RegisterCommand('ad', function(source, args, rawCommand)
    RPC.execute('server', 'adminCheck', '')
end)

RegisterCommand('relax', function(source, args, rawCommand)
    RPC.execute('server', 'relaxStress', '')
end)

RegisterCommand('devmode', function(source, args, rawCommand)
    RPC.execute('client', 'np-admin:devmode', '')
end)

RegisterCommand('debug', function(source, args, rawCommand)
    RPC.execute('client', 'hud:enabledebug', '')
end)

RegisterCommand('ids', function(source, args, rawCommand)
    RPC.execute('client', 'getId', '')
end)

RegisterCommand('teleport', function(source, args, rawCommand)
    plr = PlayerPedId()
    SetEntityCoords(plr, args[1], args[2], args[3])
end)

RegisterCommand('fix', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:fixVehicle', '')
end)

RegisterCommand('heal', function(source, args, rawCommand)
    plr = PlayerPedId()

    if args[1] == 'h' then
        SetEntityHealth(plr, 200)
    elseif args[1] == 'b' then
        SetPedArmour(plr, 60)
    end
end)