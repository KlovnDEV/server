ESX          = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
	TriggerEvent('esx_status:set', 'stress', 100000)

end)

AddEventHandler('playerSpawned', function()

	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F',
		function(status)
			return false
		end,
		function(status)
			status.remove(200)
		end
	)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1',
		function(status)
			return false
		end,
		function(status)
			status.remove(250)
		end
	)

	TriggerEvent('esx_status:registerStatus', 'stress', 100000, '#cadfff', 
		function(status)
			return false
		end, function(status)
			status.add(20)
		end
	)

	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth
			local stressVal  = 0

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				
				if status.val == 0 then

					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end

				end

			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				
				if status.val == 0 then

					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end

				end

			end)

			TriggerEvent('esx_status:getStatus', 'stress', function(status)
				stressVal = status.val
			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed,  health)
			end

			if stressVal >= 750000 then
				Citizen.Wait(3000)
				ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.16)
			elseif stressVal >= 700000 then
				Citizen.Wait(4000)
				ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.12)
			elseif stressVal >= 600000 then
				Citizen.Wait(5000)
				ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.07)
			elseif stressVal >= 350000 then
				Citizen.Wait(6000)
				ShakeGameplayCam('MEDIUM_EXPLOSION_SHAKE', 0.03)
			end

		end
end)

	Citizen.CreateThread(function()

		while true do

			Wait(0)

			local playerPed = GetPlayerPed(-1)
			
			if IsEntityDead(playerPed) and not IsDead then
				IsDead = true
			end

		end

	end)

end)

RegisterNetEvent('esx_basicneeds:eatBurger')
AddEventHandler('esx_basicneeds:eatBurger', function()
  
  local pid = PlayerPedId()
  
  RequestAnimDict("mp_player_inteat@burger")
  
  while not HasAnimDictLoaded("mp_player_inteat@burger") do
  	Wait(0)
  end

  TaskPlayAnim(pid, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 1.0, -1.0, 2000, 0, 1, true, true, true)
end)

RegisterNetEvent('esx_basicneeds:drinkWater')
AddEventHandler('esx_basicneeds:drinkWater', function()

  local pid = PlayerPedId()
  
  RequestAnimDict("amb@world_human_drinking@coffee@male@idle_a")
  
  while not HasAnimDictLoaded("amb@world_human_drinking@coffee@male@idle_a") do
  	Wait(0)
  end

  TaskPlayAnim(pid, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_a', 1.0, -1.0, 2000, 0, 1, true, true, true)

end)
