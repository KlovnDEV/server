RegisterNetEvent("server-utilities:spawnVehicle")
AddEventHandler("server-utilities:spawnVehicle", function(vehicleModel, vehicle)
    local model = GetHashKey(vehicleModel)
    local ped = PlayerPedId()

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

RegisterNetEvent("server-utilities:sitInVehicle")
AddEventHandler("server-utilities:sitInVehicle", function(vehicle, source, args, rawCommand)
    local ped = PlayerPedId()

    if vehicle then
        TaskWarpPedIntoVehicle(ped,  vehicle, -1)
        print(vehicle)
    else
        print('prost')
    end
end)

RegisterNetEvent('server-utilities:coords')
AddEventHandler('server-utilities:coords', function()
    plr = PlayerPedId()
    xyz = GetEntityCoords(plr)
    heading = GetEntityHeading(plr)
    print('XYZ: '..xyz.. 'Heading: '..heading)
end)