if SERVER then return end

local notifications = {}
local notificationDuration = 5 
local notificationFadeTime = 1 


function AddCustomNotification(text)
    local notification = {
        text = text,
        startTime = CurTime(),
        alpha = 255,
    }
    table.insert(notifications, notification)
end


hook.Add("HUDPaint", "DrawCustomNotifications", function()
    local x, y = ScrW() - 300, ScrH() - 100 
    local gap = 10

    for i, notification in ipairs(notifications) do
        local timeElapsed = CurTime() - notification.startTime

        
        if timeElapsed > notificationDuration then
            notification.alpha = math.max(255 - ((timeElapsed - notificationDuration) / notificationFadeTime) * 255, 0)
        end

        
        if notification.alpha <= 0 then
            table.remove(notifications, i)
        else

            draw.RoundedBox(8, x, y - (#notifications - i) * (30 + gap), 280, 30, Color(30, 30, 30, notification.alpha))
            draw.SimpleText(notification.text, "Trebuchet24", x + 140, y - (#notifications - i) * (30 + gap) + 15, Color(255, 255, 255, notification.alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
end)


concommand.Add("test_custom_notification", function()
    AddCustomNotification("Bu bir özel bildirim!")
end)
