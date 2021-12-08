ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("cash:remove")
AddEventHandler("cash:remove",function(src,amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeMoney(amount)
end)

-- RegisterServerEvent("useitem:drink:maikavi")
-- AddEventHandler("useitem:drink:maikavi",function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
-- end)

-- RegisterServerEvent("useitem:eat:maikavi")
-- AddEventHandler("useitem:eat:maikavi",function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
-- end)

-- RegisterCommand('s12', function(source)
--     TriggerEvent("useitem:eat:maikavi", source)
-- end)