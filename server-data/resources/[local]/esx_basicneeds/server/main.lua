ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- ESX.RegisterUsableItem('hamburger', function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	xPlayer.removeInventoryItem('hamburger', 1)
-- 	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
-- 	TriggerClientEvent('esx_basicneeds:onEat', source)
-- 	TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
-- end)

-- RegisterNetEvent("drinking:water")
-- AddEventHandler("drinking:water", function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
-- end)
