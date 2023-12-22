local monitorManager = require "monitor_manager"

local HappinessDisplay = {}

function HappinessDisplay.displayHappiness(monitor, happiness)
    local startY = 1 -- Set based on monitor layout after the alert display
    monitor.setCursorPos(1, startY)
    monitor.setBackgroundColor(colors.black)
    local happinessColor = colors.green

    if happiness < 5 then
        happinessColor = colors.red
    elseif happiness < 7 then
        happinessColor = colors.orange
    end
    
    monitor.setTextColor(happinessColor)
    monitor.write("Colony Happiness: " .. tostring(happiness))
    monitor.setTextColor(colors.white) -- Reset text color
end

return HappinessDisplay
