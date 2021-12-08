local Models = {}
local Zones = {}
local CurrentTarget = nil

Citizen.CreateThread(function()
    RegisterKeyMapping("+playerTarget", "Player Targeting", "keyboard", "LMENU") --Removed Bind System and added standalone version
    RegisterCommand('+playerTarget', playerTargetEnable, false)
    RegisterCommand('-playerTarget', playerTargetDisable, false)
    TriggerEvent("chat:removeSuggestion", "/+playerTarget")
    TriggerEvent("chat:removeSuggestion", "/-playerTarget")
end)

if Config.ESX then
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end

        PlayerJob = ESX.GetPlayerData().job

        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function(job)
            PlayerJob = job
        end)
    end)
else
    PlayerJob = Config.NonEsxJob()
end

function playerTargetEnable()
    if success then return end
    if IsPedArmed(PlayerPedId(), 6) then return end

    targetActive = true

    SendNUIMessage({response = "openTarget"})

    while targetActive do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1))
        local hit, coords, entity = RayCastGamePlayCamera(20.0)

        if hit == 1 then
            if GetEntityType(entity) ~= 0 then
                for _, model in pairs(Models) do
                    if _ == GetEntityModel(entity) then
                        for k , v in ipairs(Models[_]["job"]) do 
                            if v == "all" or v == PlayerJob.name then
                                if _ == GetEntityModel(entity) then
                                    if #(plyCoords - coords) <= Models[_]["distance"] then

                                        success = true

                                        SendNUIMessage({response = "validTarget", data = Models[_]["options"]})

                                        while success and targetActive do
                                            local plyCoords = GetEntityCoords(GetPlayerPed(-1))
                                            local hit, coords, entity = RayCastGamePlayCamera(20.0)

                                            DisablePlayerFiring(PlayerPedId(), true)

                                            if (IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24)) then
                                                SetNuiFocus(true, true)
                                                SetCursorLocation(0.5, 0.5)
                                            end

                                            if GetEntityType(entity) == 0 or #(plyCoords - coords) > Models[_]["distance"] then
                                                success = false
                                            end

                                            Citizen.Wait(1)
                                        end
                                        SendNUIMessage({response = "leftTarget"})
                                    end
                                end
                            end
                        end
                    end
                end
            end

            for _, zone in pairs(Zones) do
                if Zones[_]:isPointInside(coords) then
                    for k , v in ipairs(Zones[_]["targetoptions"]["job"]) do 
                        if v == "all" or v == PlayerJob.name then
                            if #(plyCoords - Zones[_].center) <= zone["targetoptions"]["distance"] then

                                success = true

                                SendNUIMessage({response = "validTarget", data = Zones[_]["targetoptions"]["options"]})
                                while success and targetActive do
                                    local plyCoords = GetEntityCoords(GetPlayerPed(-1))
                                    local hit, coords, entity = RayCastGamePlayCamera(20.0)

                                    DisablePlayerFiring(PlayerPedId(), true)

                                    if (IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24)) then
                                        SetNuiFocus(true, true)
                                        SetCursorLocation(0.5, 0.5)
                                    elseif not Zones[_]:isPointInside(coords) or #(vector3(Zones[_].center.x, Zones[_].center.y, Zones[_].center.z) - plyCoords) > zone.targetoptions.distance then
                                    end
        
                                    if not Zones[_]:isPointInside(coords) or #(plyCoords - Zones[_].center) > zone.targetoptions.distance then
                                        success = false
                                    end
        

                                    Citizen.Wait(1)
                                end
                                SendNUIMessage({response = "leftTarget"})
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(250)
    end
end

function playerTargetDisable()
    if success then return end

    targetActive = false

    SendNUIMessage({response = "closeTarget"})
end

--NUI CALL BACKS

RegisterNUICallback('selectTarget', function(data, cb)
    SetNuiFocus(false, false)

    success = false

    targetActive = false

    TriggerEvent(data.event)
end)

RegisterNUICallback('closeTarget', function(data, cb)
    SetNuiFocus(false, false)

    success = false

    targetActive = false
end)

--Functions from https://forum.cfx.re/t/get-camera-coordinates/183555/14

function RotationToDirection(rotation)
    local adjustedRotation =
    {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction =
    {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

function GetEntityPlayerIsLookingAt(pDistance, pRadius, pFlag, pIgnore)
    local distance = pDistance or 3.0
    local originCoords = GetPedBoneCoords(PlayerPedId(), 31086)
    local forwardVectors = GetForwardVector(GetGameplayCamRot(2))
    local forwardCoords = originCoords + (forwardVectors * (IsInVehicle and distance + 1.5 or distance))

    if not forwardVectors then return end

    local _, hit, targetCoords, _, targetEntity = RayCast(originCoords, forwardCoords, pFlag or 286, pIgnore, pRadius or 0.2)

    if not hit and targetEntity == 0 then return end

    local entityType = GetEntityType(targetEntity)

    return targetEntity, entityType, targetCoords
end

function GetForwardVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.sin(rot.z) * math.abs(math.cos(rot.x)), math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function RayCast(origin, target, options, ignoreEntity, radius)
    local handle = StartShapeTestSweptSphere(origin.x, origin.y, origin.z, target.x, target.y, target.z, radius, options, ignoreEntity, 0)
    return GetShapeTestResult(handle)
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination =
    {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
    return b, c, e
end

--Exports

function AddCircleZone(name, center, radius, options, targetoptions)
    Zones[name] = CircleZone:Create(center, radius, options)
    Zones[name].targetoptions = targetoptions
end

function AddBoxZone(name, center, length, width, options, targetoptions)
    Zones[name] = BoxZone:Create(center, length, width, options)
    Zones[name].targetoptions = targetoptions
end

function AddPolyzone(name, points, options, targetoptions)
    Zones[name] = PolyZone:Create(points, options)
    Zones[name].targetoptions = targetoptions
end

function AddTargetModel(models, parameteres)
    for _, model in pairs(models) do
        Models[model] = parameteres
    end
end

function RemoveZone(name)
    if not Zones[name] then return end
    if Zones[name].destroy then
        Zones[name]:destroy()
    end

    Zones[name] = nil
end

Citizen.CreateThread(function()
    while true do
        local idle = 250

        PlayerPed = PlayerPedId()

        local entity, entityType, entityCoords = GetEntityPlayerIsLookingAt(3.0, 0.2, 286, PlayerPed)

        if entity and entityType ~= 0 then
            if entity ~= CurrentTarget then
                CurrentTarget = entity
                TriggerEvent('cn-target:changed', CurrentTarget, entityType, entityCoords)
            end
        elseif CurrentTarget then
            CurrentTarget = nil
            TriggerEvent('cn-target:changed', CurrentTarget)
        end

        Citizen.Wait(idle)
    end
end)

exports('GetCurrentEntity', function()
    return CurrentTarget
end)

exports("AddCircleZone", AddCircleZone)

exports("AddBoxZone", AddBoxZone)

exports("AddPolyzone", AddPolyzone)

exports("AddTargetModel", AddTargetModel)

exports("RemoveZone", RemoveZone)
