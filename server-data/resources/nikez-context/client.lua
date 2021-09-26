function hideContextMenu()
    SetNuiFocus(false, false)
    SendNuiMessage({
        action = 'CLOSE_MENU'
    })
end

function showContextMenu(data)
    if not data then return end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data,
    })
end

RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    TriggerEvent(data.event, data.args)
    cb('ok')
end)

RegisterNUICallback("cancel", function()
    SetNuiFocus(false)
end)


-- {EXAMPLE}
	-- MenuData = {
	-- 	{
	-- 		id = 1,
	-- 		header = "Personal Vehicles",
	-- 		txt = "List of owned vehicles",
	-- 		params = {
	-- 			event = "police-bennys-repair"
	-- 		}
	-- 	},
	-- 	{
	-- 		id = 2,
	-- 		header = "Shared Vehicles",
	-- 		txt = "List of shared vehicles",
	-- 		params = {
	-- 			event = "policeSharedGarage"
	-- 		}
	-- 	}
	-- }

	-- showContextMenu(MenuData)