ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- koil sucks

RegisterNetEvent('plr:set:armor')
AddEventHandler('plr:set:armor', function()
if not IsAnimated then
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
            ESX.Streaming.RequestAnimDict('missmic4', function()
            TaskPlayAnim(playerPed, 'missmic4', 'michael_tux_fidget', 8.0, -8, -1, 49, 0, 0, 0, 0)
                 exports["taskbar"]:taskBar(7000,"Armor")
                 animation = true
                 Citizen.Wait(1000)
                 animation = false
                 AddArmourToPed(playerPed, 50)
                --  SetPedComponentVariation(playerPed, 9, 27, 9, 2) -- bulletproof clothe
                 IsAnimated = false
                 ClearPedSecondaryTask(playerPed)
            end)
        end)
    end
end)

RegisterNetEvent('plr:smoke:stress')
AddEventHandler('plr:smoke:stress', function(source)
    local playerPed = PlayerPedId()
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
        exports["taskbar"]:taskBar(7000,"Joint")
        Citizen.Wait(7000)
        ClearPedTasksImmediately(PlayerPedId())
	end)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started.')
end)