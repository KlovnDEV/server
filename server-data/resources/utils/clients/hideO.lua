-- 1 : WANTED_STARS
-- 2 : WEAPON_ICON
-- 3 : CASH
-- 4 : MP_CASH
-- 5 : MP_MESSAGE
-- 6 : VEHICLE_NAME
-- 7 : AREA_NAME
-- 8 : VEHICLE_CLASS
-- 9 : STREET_NAME
-- 10 : HELP_TEXT
-- 11 : FLOATING_HELP_TEXT_1
-- 12 : FLOATING_HELP_TEXT_2
-- 13 : CASH_CHANGE
-- 14 : RETICLE
-- 15 : SUBTITLE_TEXT
-- 16 : RADIO_STATIONS
-- 17 : SAVING_GAME
-- 18 : GAME_STREAM
-- 19 : WEAPON_WHEEL
-- 20 : WEAPON_WHEEL_STATS
-- 21 : HUD_COMPONENTS
-- 22 : HUD_WEAPONS

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(2)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(17)
    end
end)