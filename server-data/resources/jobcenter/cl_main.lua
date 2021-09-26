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