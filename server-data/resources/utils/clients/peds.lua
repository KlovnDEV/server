RegisterNetEvent('billythesawped')
RegisterNetEvent('pandaped')
RegisterNetEvent('backToNormalPed1')
RegisterNetEvent('choosepedoption')
RegisterNetEvent('choosesavedpeds')
RegisterNetEvent('inputmodelname')

AddEventHandler('choosepedoption', function()
    PedsToChoose = {
                {
            id = 1,
            header = "Return To Your Character",
            txt = "",
            params = {
                event = "backToNormalPed1",
            }
        },
        {
            id = 2,
            header = "List Of Peds",
            txt = "",
            params = {
                event = "choosesavedpeds",
            }
        },
        {
            id = 3,
            header = "Input Model Name",
            txt = "",
            params = {
                event = "inputmodelname",
            }
        },
    }
    exports['context']:showContextMenu(PedsToChoose)
end)


AddEventHandler("choosesavedpeds", function()
    PedsToChoose = {
        {
            id = 1,
            header = "❮ Go Back",
            txt = "",
            params = {
                event = "choosepedoption",
            }
        },
        {
            id = 2,
            header = "",
            txt = "Jigsaw",
            params = {
                event = "billythesawped",
            }
        },
        {
            id = 3,
            header = "",
            txt = "Panda",
            params = {
                event = "pandaped",
            }
        },
    }
    exports['context']:showContextMenu(PedsToChoose)
end)

AddEventHandler('inputmodelname', function()
    local input = exports["interact"]:KeyboardInput({rows = {{id = 0, txt = "Model Name"}}})
    local ped = input[1].input
    local hash = GetHashKey(ped)
    RequestModel(hash)
    while not HasModelLoaded(hash)
        do RequestModel(hash)
            Citizen.Wait(0)
        end
    SetPlayerModel(PlayerId(), hash)
end)

--peds

AddEventHandler('backToNormalPed1', function()
    TriggerServerEvent('raid_clothes:get_character_current')
end)

AddEventHandler('billythesawped', function()
local ped = 'Billy SAW'
local hash = GetHashKey(ped)
  RequestModel(hash)
    while not HasModelLoaded(hash)
		do RequestModel(hash)
			Citizen.Wait(0)
		end	
	SetPlayerModel(PlayerId(), hash)
end)

AddEventHandler('pandaped', function()
    local ped = 'Panda'
    local hash = GetHashKey(ped)
      RequestModel(hash)
        while not HasModelLoaded(hash)
            do RequestModel(hash)
                Citizen.Wait(0)
            end	
        SetPlayerModel(PlayerId(), hash)
    end)

RegisterCommand('ped', function()
    TriggerEvent("choosepedoption")
end)