local Promises, Functions , CallIdentifier = {}, {}, GetCurrentResourceName()

RPC = {}

------------------------------------------------------------------
--                  (Receive Remote Calls)                      --
------------------------------------------------------------------

function RPC.execute(type, event, params)
    local callID, solved = CallIdentifier, false

    local p = promise.new()

    if (params == nil) then
        params = {}
    end

    if type == 'client' then
        print("RPC => "..type.." side => callID: "..callID)

        TriggerClientEvent(event, params)
        RPC.log(type, event, params, callID)

    elseif type == 'server' then
        print("RPC => "..type.." side => callID: "..callID)

        TriggerEvent(event, params, callID)
        RPC.log(type, event, params, callID)
    end
end

function RPC.executeLatent(type, event, params, timeout)
    local callID, solved = CallIdentifier, false

    Promises[callID] = callID

    Citizen.SetTimeout(timeout, function()
        if (solved == false) then

            if type == 'client' then
                TriggerEvent(event, params)
            elseif type == 'server' then
                TriggerServerEvent(event, params)
            end

            print('debug '..timeout)
        end
    end)
end

function RPC.log(type, event, params, callID)
    TriggerEvent('log', type, event, params, callID)
end

------------------------------------------------------------------
--                         (Exports)                            --
------------------------------------------------------------------

exports('RPC.execute', type, event, params)

exports('RPC.executeLatent', type, event, params, timeout)

exports('RPC.log', type, event, params)

------------------------------------------------------------------
--                          (Events)                            --
------------------------------------------------------------------

-- RegisterNetEvent('log')
-- AddEventHandler('log', function(type, event, params, callID)
    -- log(type, event, params, callID)
-- end)

-- function log(type, event, params, callID)
-- 	local time = os.date("%d/%m/%Y %X")
-- 	local data = "{Date: "..time.."}{Type: "..type.."}{Event: "..event.."}{Function: "..params.."}{callID: "..callID.."}"
	
-- 	local content = LoadResourceFile("log.js")
-- 	local newContent = content .. '\r\n' .. data
-- 	SaveResourceFile(GetCurrentResourceName(), "log.js", newContent, -1)
-- end