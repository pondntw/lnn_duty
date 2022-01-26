ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local sleep = true
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        sleep = true
        local Ped = PlayerPedId()
        local Coords = GetEntityCoords(Ped)
        for k, v in pairs(Config.Duty) do
            if GetDistanceBetweenCoords(Coords, v.Position, true) < 50 then 
                sleep = false 
                local px, py, pz = table.unpack(v.Position)
                DrawMarker(v.Marker.Id, px, py, pz, 0, 0, 0, 0, 0, 0,1.0, 1.0,1.0, 0,255, 0, 165, 1,0, 0,1)
                if GetDistanceBetweenCoords(Coords, v.Position, true) < 1.5 then 
                    ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to ~g~enter~s~/~r~exit~s~ duty')
                    if IsControlJustReleased(0, 38) then 
                        if ESX.GetPlayerData().job.name == v.Onduty or ESX.GetPlayerData().job.name == v.Offduty then 
                            TriggerServerEvent('lnn_duty:toggleduty', v)
                        end
                    end
                end
            end 
        end
        if sleep then 
            Citizen.Wait(500)
        end
    end     
end)