exports["polyzones"]:AddBoxZone("jobcenter1", vector3(173.11, -26.06, 68.34), 1.2, 1.4, {
  name="jobcenter1",
  heading=340,
--   debugPoly=true,
  minZ=67.34,
  maxZ=69.34
})

exports["polyzones"]:AddBoxZone("jobcenter2", vector3(-77.65, -826.39, 243.39), 1.4, 1.0, {
    name="jobcenter2",
    heading=340,
    -- debugPoly=true,
    minZ=240.39,
    maxZ=244.39
  })

RegisterNetEvent('polyzones:enter')
AddEventHandler('polyzones:enter', function(name)
    if name == "jobcenter1" then
        listenForKeypress('jobcenter1')
        exports['interaction']:showInteraction('[E] To Enter')
    elseif name == "jobcenter2" then
        listenForKeypress('jobcenter2')
        exports['interaction']:showInteraction('[E] To Leave')
    end
end)

RegisterNetEvent('polyzones:exit')
AddEventHandler('polyzones:exit', function(name)
    if name == "jobcenter1" then
        listening = false
        exports['interaction']:hideInteraction()
    elseif name == "jobcenter2" then
        listening = false
        exports['interaction']:hideInteraction()
    end
end)

function listenForKeypress(name)
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if name == 'jobcenter1' or 'jobcenter2' then
            if IsControlJustReleased(0, 38) then
                if name == 'jobcenter1' then
                    print(name)
                    SetEntityCoords(PlayerPedId(), -75.8466, -826.9893, 243.3859)
                elseif name == 'jobcenter2' then
                    print(name)
                    SetEntityCoords(PlayerPedId(), 173.0222, -25.99045, 68.34541)
                else
                    print('fuck')
                end
-- -================================================================================
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
-- if name == 'jobcenter1' then
    -- listening = true
    -- SetEntityCoords(PlayerPedId(), -75.8466, -826.9893, 243.3859)
-- elseif name == 'jobcenter2' then
    -- listening = true
    -- SetEntityCoords(PlayerPedId(), 173.0222, -25.99045, 68.34541)