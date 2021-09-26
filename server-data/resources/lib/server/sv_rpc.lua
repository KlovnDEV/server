local Promises, Functions , CallIdentifier = {}, {}, GetCurrentResourceName()

RPC = {}

------------------------------------------------------------------
--                  (Receive Remote Calls)                      --
------------------------------------------------------------------

-- function log(type, event, params, callID)
-- 	local time = os.date("%d/%m/%Y %X")
-- 	local data = "{Date: "..time.."}{Type: "..type.."}{Event: "..event.."}{Function: "..params.."}{callID: "..callID.."}"
	
-- 	local content = LoadResourceFile("log.js")
-- 	local newContent = content .. '\r\n' .. data
-- 	SaveResourceFile(GetCurrentResourceName(), "log.js", newContent, -1)
-- end

------------------------------------------------------------------
--                          (Events)                            --
------------------------------------------------------------------

-- RegisterNetEvent('log')
-- AddEventHandler('log', function(type, event, params, callID)
    -- log(type, event, params, callID)
-- end)

RegisterNetEvent('gethunger', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

RegisterNetEvent('getthirst', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
end)