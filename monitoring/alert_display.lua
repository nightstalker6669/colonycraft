local AlertDisplay = {}

function AlertDisplay.displayUnderAttack(monitor)
    local startY = 2
    monitor.setCursorPos(1, startY)
    monitor.setTextColor(colors.red)
    monitor.setBackgroundColor(colors.black)
    monitor.write("WARNING: Colony under attack!")
    monitor.setTextColor(colors.white)
end

return AlertDisplay
