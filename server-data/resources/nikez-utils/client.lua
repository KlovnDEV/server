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
        LastVehicle = vehicle
    end
end)

RegisterNetEvent("server-utilities:sitInVehicle")
AddEventHandler("server-utilities:sitInVehicle", function()
    local ped = PlayerPedId()
    TaskWarpPedIntoVehicle(ped,  LastVehicle, -1)
    print(LastVehicle)
end)

RegisterNetEvent('server-utilities:coords')
AddEventHandler('server-utilities:coords', function()
    plr = PlayerPedId()
    xyz = GetEntityCoords(plr)
    heading = GetEntityHeading(plr)
    print('XYZ: '..xyz.. 'Heading: '..heading)
end)

RegisterNetEvent('server-utilities:teleportMarker')
AddEventHandler('server-utilities:teleportMarker', function()
    local plr = PlayerPedId()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
    for height = 1, 1000 do
        SetPedCoordsKeepVehicle(plr, waypointCoords["x"], waypointCoords["y"], height + 0.0)
    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
    if foundGround then
        SetPedCoordsKeepVehicle(plr, waypointCoords["x"], waypointCoords["y"], height + 0.0)
    break
        end
    Citizen.Wait(5)
        end
    end
end)