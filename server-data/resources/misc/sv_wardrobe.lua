ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('gettingWardrobe')
AddEventHandler('gettingWardrobe', function(source, slot)
if not slot then return end
local src = source

local xPlayer = ESX.GetPlayerFromId(src)
local characterId = xPlayer.getIdentifier()

if not characterId then return end

MySQL.Async.fetchAll("SELECT * FROM users_outfits WHERE cid = @cid and slot = @slot", {['cid'] = characterId, ['slot'] = slot}, function(result)
    if result and result[1] then
        -- print(json.encode(result, result[1]))

        TriggerClientEvent("clothes:open:print", source, json.encode(result))
        
        if result[1].model == nil then
            TriggerClientEvent("DoLongHudText", src, "Can not use.",2)
        return

           end
        end
    end)
end)

-------- tova e gotovo za polzvane outfituse 1,2,3,4,5,6,7, tn

RegisterNetEvent("wardrobe:get:outfit")
AddEventHandler("wardrobe:get:outfit", function(pSrc, slot)
    local src = (not pSrc and source or pSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local characterId = xPlayer.getIdentifier()

    if not characterId then return end

    MySQL.Async.fetchAll("SELECT * FROM users_outfits WHERE cid = @cid and slot = @slot", {['cid'] = characterId,['slot'] = slot}, function(result)
        if result and result[1] then
            local temp_data = {
            ["cid"] = characterId,
            ["slot"] = slot,
            ["name"] = name,
            model = result[1].model,
            drawables = json.decode(result[1].drawables),
            props = json.decode(result[1].props),
            drawtextures = json.decode(result[1].drawtextures),
            proptextures = json.decode(result[1].proptextures),
            hairColor = json.decode(result[1].hairColor)
            }
        TriggerClientEvent("raid_clothes:setclothes", src, temp_data, 0)
        end
	end)
end)

RegisterNetEvent("wardrobe:get:slot")
AddEventHandler("wardrobe:get:slot", function(pSrc, result)
    local src = (not pSrc and source or pSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local characterId = xPlayer.getIdentifier()

    if not characterId then return end

    MySQL.Async.fetchScalar('SELECT slot FROM users_outfits WHERE cid = @cid', {['cid'] = characterId}, function(result)
        print(result)
        TriggerClientEvent("clothes:open:outfits", src, 3)
	end)
end)

RegisterCommand("51", function(source, slot)
    TriggerEvent("gettingWardrobe", source, 1)
end)

RegisterCommand("sgr", function(source, args)
    -- TriggerEvent('wardrobe:get:outfit', source, args[1])
    TriggerEvent("wardrobe:get:slot", source, args[1])
end)

RegisterCommand("outfituse", function(source, args)
    TriggerEvent('wardrobe:get:outfit', source, args[1])
end)