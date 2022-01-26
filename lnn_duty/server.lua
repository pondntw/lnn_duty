ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('lnn_duty:toggleduty')
AddEventHandler('lnn_duty:toggleduty', function(v)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Grade = xPlayer.job.grade
    if xPlayer.job.name == v.Onduty then 
        xPlayer.setJob(v.Offduty, Grade)
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = 'คุณได้ลงชื่อออกเวรเเล้ว',
            type = 'success',
            queue = "duty",
            timeout = 10000,
            layout = "bottomCenter"
        })
    else 
        xPlayer.setJob(v.Onduty, Grade)
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = 'คุณได้ลงชื่อเข้าเวรเเล้ว',
            type = 'success',
            queue = "duty",
            timeout = 10000,
            layout = "bottomCenter"
        })
    end
end)