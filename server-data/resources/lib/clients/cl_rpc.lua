local Promises, Functions, RequestID, CallIdentifier = {}, {}, math.random(1,99999), GetCurrentResourceName()

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
        print("RPC => "..type.." side => requestID: "..RequestID.." => callID: "..callID)

        TriggerEvent(event, params)
        RPC.log(type, event, params, callID)

    elseif type == 'server' then
        print("RPC => "..type.." side => requestID: "..RequestID.." => callID: "..callID)

        TriggerServerEvent(event, params, callID)
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
            print("RPC => "..type.." side => requestID: "..RequestID.." => timeout: "..timeout.." => callID: "..callID)
        end
    end)
end

function RPC.log(type, event, params, callID)
    TriggerServerEvent('log', type, event, params, callID)
end

------------------------------------------------------------------
--                          (Exports)                           --
------------------------------------------------------------------

exports('RPC.execute', type, event, params)

exports('RPC.executeLatent', type, event, params, timeout)

exports('RPC.log', type, event, params)

------------------------------------------------------------------
--                          (Events)                           --
------------------------------------------------------------------