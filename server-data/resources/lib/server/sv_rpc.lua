local Promises, Functions , CallIdentifier = {}, {}, GetCurrentResourceName()

RPC = {}

------------------------------------------------------------------
--                  (Receive Remote Calls)                      --
------------------------------------------------------------------

function log(type, event, params, callID)
	local time = os.date("%d/%m/%Y %X")
	local data = "{Date: "..time.."}{Type: "..type.."}{Event: "..event.."}{Function: "..params.."}{callID: "..callID.."}"
	
	local content = LoadResourceFile(GetCurrentResourceName(), "log.js")
	local newContent = content .. '\r\n' .. data
	SaveResourceFile(GetCurrentResourceName(), "log.js", newContent, -1)
end

------------------------------------------------------------------
--                          (Events)                            --
------------------------------------------------------------------

RegisterNetEvent('tmaxserver')
AddEventHandler('tmaxserver', function(money)
    print('RPC.execute => | Event: tmaxserver | Function: '..money)
end)

RegisterNetEvent('log')
AddEventHandler('log', function(type, event, params, callID)
    log(type, event, params, callID)
end)