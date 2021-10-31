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

exports["polyzones"]:AddBoxZone("jobcenter", vector3(-72.99, -816.34, 243.39), 1.6, 2, {
    name="jobcenter",
    heading=340,
    --debugPoly=true,
    minZ=242.39,
    maxZ=244.39
})

local jobs = {
    {name="Unemployed", id="unemployed", desc="Free guy 24/7"},
    {name="Fisherman", id="fisherman", desc="Get fishstick and go !"},
    {name="Miner", id="miner", desc="Dig stones all day"},
    {name="Burgershot", id="burgershot", desc="Make burgers"},
    {name="Taxi Driver", id="taxi", desc="Drive cab"},
    {name="Reporter", id="reporter", desc="BBC News Reporter"},
  }

RegisterNetEvent('polyzones:enter')
AddEventHandler('polyzones:enter', function(name)
    if name == "jobcenter1" then
        listenForKeypress('jobcenter1')
        exports['interaction']:showInteraction('[E] To Enter')
    elseif name == "jobcenter2" then
        listenForKeypress('jobcenter2')
        exports['interaction']:showInteraction('[E] To Leave')
    elseif name == "jobcenter" then
        listenForKeypress('jobcenter')
        exports['interaction']:showInteraction('[E] To View Jobs')
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
    elseif name == "jobcenter" then
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
                    SetEntityCoords(PlayerPedId(), -75.8466, -826.9893, 243.3859)
                    SetEntityHeading(PlayerPedId(), 78.277153014137)
                elseif name == 'jobcenter2' then
                    SetEntityCoords(PlayerPedId(), 173.0222, -25.99045, 68.34541)
                    SetEntityHeading(PlayerPedId(), 164.44773864746)
                elseif name == 'jobcenter' then
                    RPC.execute('client', 'jobcenterGUI', '')
                else
                    print('F')
                end
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

-- -72.01786, -814.48, 243.386 , 159.91372680664- npc coords

RegisterNetEvent('jobcenterGUI')
AddEventHandler('jobcenterGUI', function()
    MenuData = {
		{
			id = 1,
			header = "Jobs",
			txt = "List of jobs you can be",
			params = {
				event = "jobcetner:jobs"
			}
		},
		{
			id = 2,
			header = "Ask for job",
			txt = "Ask for high paid job",
			params = {
				event = "policeSharedGarage"
			}
		}
	}

	exports['context']:showContextMenu(MenuData)
    exports['interaction']:hideInteraction()
end)

RegisterNetEvent('jobcetner:setjob')
AddEventHandler('jobcetner:setjob', function(name, grade)
    TriggerServerEvent('jobsystem:Job', name, grade)
    local mess = "Congrats you have new job !"
    exports['nots']:SendNotify("info", "", mess, 3000)
end)

RegisterCommand('twt', function(source, args, rawCommand)
    local inputMessage = exports["interact"]:KeyboardInput({rows = {{id = 0, txt = "Message"}}})

    exports['nots']:SendNotify("twitter", "", inputMessage[1].input, 3000)
end)

RegisterNetEvent('jobcetner:jobs')
AddEventHandler('jobcetner:jobs', function(name, grade)
    BackData = {
        {
            id = 1,
            header = "❮ Go Back",
            txt = "",
            params = {
                event = "jobcenterGUI",
            }
        },
    }
    exports['context']:showContextMenu(BackData)
    for _, item in pairs(jobs) do
        local nameJob = item.name
        local idJob = item.id
        local descJob = item.desc
    MenuData = {
        {
            id = idJob,
            header = nameJob,
            txt = descJob,
            params = {
                event = "jobcetner:setjob",
                args = {

                }
            }
        },
	}
	exports['context']:showContextMenu(MenuData)
    exports['interaction']:hideInteraction()
    end
end)

local foodPeds = {
  { model="a_m_y_business_01", voice="GENERIC_HI", x=-72.01786, y=-814.48, z=243.386, a=159.91372680664},
  { model="mp_m_shopkeep_01", voice="GENERIC_HI", x=24.376, y=-1345.558, z=29.421, a=267.940}
}

Citizen.CreateThread(function()
	for k,v in ipairs(foodPeds) do
		RequestModel(GetHashKey(v.model))
		while not HasModelLoaded(GetHashKey(v.model)) do
			Wait(0)
		end

		local storePed = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z, v.a, false, false)
		SetBlockingOfNonTemporaryEvents(storePed, false)
		GiveWeaponToPed(storePed, 0x1D073A89, 2800, false, true)
		SetPedFleeAttributes(storePed, 0, 0)
        SetPedArmour(storePed, 100)
        SetPedMaxHealth(storePed, 100)
		SetPedDiesWhenInjured(storePed, false)
		SetAmbientVoiceName(storePed, v.voice)
		TaskStartScenarioInPlace(storePed, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)

		SetModelAsNoLongerNeeded(GetHashKey(v.model))
	end
end)