-- TriggerEvent('tasknotify:guiupdate', '', 'Your id: '..id, 5000)

-- exports['nots']:SendNotify("info", "", "The vehicle has been fixed", 3000)

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(500)
    end
end)

RegisterCommand('outfits', function()
    TriggerEvent("clothes:open:outfits")
end)

-- ====================================================

RegisterNetEvent("clothes:open:outfits")
AddEventHandler("clothes:open:outfits", function(slot)
    print(slot)

    MenuData = {
        {
            id = slot,
            header = slot,
            txt = "",
            params = {
                event = "clothes:open:wardrobe_outfits",
                args = slot
            },
        },
        {
            id = 2,
            header = "Save Current Outfit",
            txt = "",
            params = {
                event = "clothes:open:save_outfit",
            }
        },
    }
    exports['context']:showContextMenu(MenuData)
end)

RegisterNetEvent("clothes:open:wardrobe_outfits")
AddEventHandler("clothes:open:wardrobe_outfits", function(slot)
    MenuData = {
        {
            id = 1,
            header = "❮ Go Back",
            txt = "",
            params = {
                event = "clothes:back:slot",
            }
        },
        {
            id = 2,
            header = "Use",
            txt = "",
            params = {
                event = "clothes:open:set_outfit",
                args = slot,
            }
        },
        {
            id = 3,
            header = "Delete",
            txt = "",
            params = {
                event = "clothes:open:delete_outfit",
            }
        },
    }
    exports['context']:showContextMenu(MenuData)
end)

RegisterNetEvent("clothes:open:save_outfit")
AddEventHandler("clothes:open:save_outfit", function()
    local keyboard, slot, name = exports["interact"]:Keyboard({
        header = "", 
        rows = {"Slot", "Name"}
    })

    if keyboard then
        if name and tonumber(slot) then
            TriggerServerEvent("raid_clothes:save_outfit", source, slot, name)
        end
    end
        print(slot, name)
end)

RegisterNetEvent("clothes:back:slot")
AddEventHandler("clothes:back:slot", function(source)
    TriggerServerEvent("wardrobe:get:slot", source)
end)

RegisterNetEvent("clothes:open:set_outfit")
AddEventHandler("clothes:open:set_outfit", function(slot)
    TriggerServerEvent('wardrobe:get:outfit',src, slot)
    print(slot)
end)

RegisterNetEvent("clothes:open:delete_outfit")
AddEventHandler("clothes:open:delete_outfit", function(slot)
    -- event
end)

RegisterNetEvent("clothes:open:print")
AddEventHandler("clothes:open:print", function(result)
    print("result: "..result)
end)