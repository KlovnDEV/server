RegisterCommand('car', function(source, args, raw)
    if args[1] == nil then return end
    TriggerClientEvent("server-utilities:spawnVehicle", source, args[1])
end, true)

RegisterCommand('sit', function(source, args, raw)
    TriggerClientEvent("server-utilities:sitInVehicle", source, args[1])
end, true)