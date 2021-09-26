-- By Nikez (enota)

function showInteraction(text , type)
	SendNUIMessage({
		action = 'show',
		text = text,
		color = type,
	})
end

RegisterCommand('test', function()
    showInteraction("[E] maika mu da eba", 'info')
end)


function hideInteraction()
	SendNUIMessage({
		action = 'hide'
	})
end