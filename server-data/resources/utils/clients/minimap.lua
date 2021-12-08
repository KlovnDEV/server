Citizen.CreateThread(
  function()
    local minimap = RequestScaleformMovie("minimap")
    while not HasScaleformMovieLoaded(minimap) do
      Wait(0)
    end

    SetMinimapClipType(0)
    SetMinimapComponentPosition("minimap", "L", "B", -0.0050, -0.022, 0.150, 0.188888)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0, 0.032, 0.150, 0.237)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.032, 0.002, 0.266, 0.237)


    SetRadarBigmapEnabled(true, false)
    Wait(100)
    SetRadarBigmapEnabled(false, false)
end)

Citizen.CreateThread(function()
  local minimap = RequestScaleformMovie("minimap")
  SetRadarBigmapEnabled(false, false)
  while true do
      Wait(0)
      BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
      ScaleformMovieMethodAddParamInt(3)
      EndScaleformMovieMethod()
  end
end)