-- By Nikez (enota)


-- function showInteraction(text , type)
-- 	SendNUIMessage({
-- 		action = 'show',
-- 		text = text,
-- 		color = type,
-- 	})
-- end
-- function nearClothingMotel()
-- 	if #(vector3(78.44719, -1391.75, 29.378533) - GetEntityCoords(PlayerPedId())) < 8.5 then
-- 		return true
-- 	end	
-- 	return false
-- end

function showInteraction(text)
	SendNUIMessage({
		action = 'show',
		text = text,
	})
end

function hideInteraction()
	SendNUIMessage({
		action = 'hide'
	})
end