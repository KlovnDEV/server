blips = {
    {name = "Job Center", colour = 17, typeid = 351, x = 173.0222, y = -25.99045, z = 68.34541},
    {name = "Helicopter Pad", colour = 5, typeid = 64, x = 449.3402, y = -981.4315, z = 43.69},
    {name = "Police Station", colour = 38, typeid = 60, x = 419.9072, y = -982.2098, z = 29.9},
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.typeid)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)