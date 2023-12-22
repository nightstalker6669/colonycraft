local HappinessAlert = {}

function HappinessAlert.displayHappinessAlert(monitor, happiness)
    local startY = 4
    monitor.setCursorPos(1, startY)
    if happiness < 5 then
        monitor.setTextColor(colors.red)
        monitor.write("CRITICAL: Colony happiness is very low!")
    elseif happiness < 7 then
        monitor.setTextColor(colors.orange)
        monitor.write("WARNING: Colony happiness is low.")
    else
        return
    end
    monitor.setTextColor(colors.white)
end

return HappinessAlert
