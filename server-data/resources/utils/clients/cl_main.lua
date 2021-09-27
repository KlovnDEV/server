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

RegisterNetEvent('server-utilities:xyz')
AddEventHandler('server-utilities:xyz', function()
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

RegisterNetEvent('server-utilities:fixVehicle')
AddEventHandler('server-utilities:fixVehicle', function()
local ped = PlayerPedId()
if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
    if (IsPedSittingInAnyVehicle(ped)) then
        local vehicle = GetVehiclePedIsIn( ped, false)
        if (GetPedInVehicleSeat(vehicle, -1) == ped) then
        SetVehicleEngineHealth(vehicle, 1000)
        SetVehicleEngineOn(vehicle, true, true)
        SetVehicleFixed(vehicle)
          end
       end
    end
end)

RegisterNetEvent('getId')
AddEventHandler('getId', function(id)
    plr = PlayerPedId()
    id = GetPlayerServerId(NetworkGetEntityOwner(plr))
    TriggerEvent('chat:addMessage', {
        color = {255,255,255},
        multiline = true,
        args = {"Your ID is: "..id}
      })
end)