local AlertDisplay = {}

function AlertDisplay.displayAlerts(monitor, alerts)
    local startY = 1 -- Set based on monitor layout
    monitor.setCursorPos(1, startY)
    monitor.setTextColor(colors.yellow)
    monitor.setBackgroundColor(colors.black)
    monitor.write("Colony Alerts:")

    local line = startY + 1
    if alerts.isUnderAttack then
        monitor.setCursorPos(1, line)
        monitor.write("Under attack!")
        line = line + 1
    end
 
    monitor.setTextColor(colors.white) -- Reset text color
    -- Add display code for other alert types as required, updating 'line' as needed
    -- INPUT_REQUIRED {additional alert types display logic}
end

return AlertDisplay
