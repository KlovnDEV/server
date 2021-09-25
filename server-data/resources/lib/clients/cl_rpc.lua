local Promises, Functions, CallIdentifier = {}, {}, GetCurrentResourceName()

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

        TriggerEvent(event, params)
        RPC.log(type, event, params, callID)

    elseif type == 'server' then
        print("RPC => "..type.." side => callID: "..callID)

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

            print('debug '..timeout)
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

--- {TEST}

RegisterCommand('tmax', function(type, event, params)
    RPC.execute('server', 'tmaxserver', '125$')
end)

RegisterCommand('regev', function(event, funct)
    RPC.execute('client', 'tmax1', '940$')
end)

RegisterCommand('timeout', function(name, timeout)
    RPC.executeLatent('tmax', 5000)
end)

------------------------------------------------------------------
--                          (Events)                           --
------------------------------------------------------------------

RegisterNetEvent('tmax1')
AddEventHandler('tmax1', function(money)
    print('RPC.execute => | Event: tmax1 | Function: '..money)
end)

RegisterNetEvent('tmax2')
AddEventHandler('tmax2', function(money)
    print('RPC.execute => | Event: tmax2 | Function: '..money)
end)