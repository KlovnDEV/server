exports["polyzones"]:AddBoxZone("jobcenter1", vector3(173.11, -26.06, 68.34), 1.2, 1.4, {
  name="jobcenter1",
  heading=340,
--   debugPoly=true,
  minZ=67.34,
  maxZ=69.34
})

RegisterNetEvent('polyzones:enter')
AddEventHandler('polyzones:enter', function(name)
    if name == "jobcenter1" then
        listenForKeypress('jobcenter1')
        exports['interaction']:showInteraction('[E] To Enter')
    elseif name == "PoliceArmoryMRPD" then

    elseif name == "PoliceLockerMRPD" then

    elseif name == "PoliceFingerprintMRPD" then

    end
end)

RegisterNetEvent('polyzones:exit')
AddEventHandler('polyzones:exit', function(name)
    if name == "jobcenter1" then
        exports['interaction']:hideInteraction()
    elseif name == "PoliceArmoryMRPD" then
        exports['interaction']:hideInteraction()
    elseif name == "PoliceLockerMRPD" then
        exports['interaction']:hideInteraction()
    elseif name == "PoliceFingerprintMRPD" then
        exports['interaction']:hideInteraction()
    end
end)

function listenForKeypress(name)
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if name == 'jobcenter1' then
            if IsControlJustReleased(0, 38) then
                print('jobcenter_enter')
                    print(name)
                    SetEntityCoords(PlayerPedId(),-75.8466, -826.9893, 243.3859)
                    while currentTats == nil do
                        Citizen.Wait(0)
                    end
                exports['interaction']:hideInteraction()
                end
            end
            Wait(0)
        end
    end)
end

-- x=-1081.8293457031, y=-248.12872314453, z=37.763294219971