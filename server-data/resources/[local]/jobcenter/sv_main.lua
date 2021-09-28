ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jobsystem:Job')
AddEventHandler('jobsystem:Job', function(source, name)
	local xPlayer = ESX.GetPlayerFromId(source)
    print(json.encode(name))
    xPlayer.setJob(name, 0)
	if xPlayer then
            print(json.encode(name))
            xPlayer.setJob(name, 0)
	end
end)