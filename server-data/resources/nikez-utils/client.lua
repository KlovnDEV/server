RegisterNetEvent("server-utilities:spawnVehicle")
AddEventHandler("server-utilities:spawnVehicle", function(vehicleModel)
    local model = GetHashKey(vehicleModel)
    local ped = GetPlayerPed(-1)

    if IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do Citizen.Wait(0) end

        local spawnPosition = GetOffsetFromEntityInWorldCoords(ped, 0.0, 5.0, 0.0)
        local spawnHeading = GetEntityHeading(ped)
        local vehicle = CreateVehicle(model, spawnPosition.x, spawnPosition.y, spawnPosition.z, spawnHeading, true, false)

        if IsPedInAnyVehicle(ped, false) then
            local inVehicle = GetVehiclePedIsIn(ped, false)
            SetEntityAsMissionEntity(inVehicle, true, true)
            DeleteVehicle(inVehicle)
        end
    end
end)

RegisterCommand('kon', function(source, args, rawCommand)
    RPC.execute('client', 'server-utilities:spawnVehicle', args[1])
    RPC.execute('client', 'health', '')
end)

RegisterNetEvent('health')
AddEventHandler('health', function()
    plr = PlayerPedId()
    hlt = GetEntityHealth(plr)
    print(hlt)
end)

RegisterNetEvent("server-utilities:sitInVehicle")
AddEventHandler("server-utilities:sitInVehicle", function(vehicleModel)
    local model = GetHashKey(vehicleModel)
    local ped = PlayerPedId()

    SetPedIntoVehicle(ped, vehicle, -1)
end)