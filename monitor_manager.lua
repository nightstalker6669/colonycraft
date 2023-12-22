-- monitor_manager.lua
local monitorManager = {}
local monitorPeripheralType = "monitor"

local AlertDisplay = require "monitoring/alert_display"
local HappinessDisplay = require "monitoring/happiness_display"

function monitorManager.findMonitor()
    local monitorPeripheral = peripheral.find(monitorPeripheralType)
    if not monitorPeripheral then
        error("No monitor found.")
    end
    return monitorPeripheral
end

function monitorManager.setupMonitor(monitorPeripheral)
    monitorPeripheral.setTextScale(0.5)
    monitorPeripheral.setBackgroundColor(colors.black)
    monitorPeripheral.clear()
end

function monitorManager.displayBuilderInfo(monitorPeripheral, builderData)
    local line = 1
    for _, builder in pairs(builderData) do
        monitorPeripheral.setCursorPos(1, line)
        monitorPeripheral.write("Builder: " .. builder.name)
        line = line + 1

        for _, material in pairs(builder.materialsNeeded) do
            monitorPeripheral.setCursorPos(2, line)
            monitorPeripheral.write(material.name .. ": " .. material.amount)
            line = line + 1
        end
    end
end

function monitorManager.displayColonyInformation(monitorPeripheral, colonyInformation)
    local builderData, alerts, happiness = table.unpack(colonyInformation)
    monitorManager.setupMonitor(monitorPeripheral)
    monitorManager.displayBuilderInfo(monitorPeripheral, builderData)
    AlertDisplay.displayAlerts(monitorPeripheral, alerts)
    local happinessStartLine = #builderData * 2 + 3
    monitorPeripheral.setCursorPos(1, happinessStartLine)
    HappinessDisplay.displayHappiness(monitorPeripheral, happiness)
end

function monitorManager.displayCraftingIssues(monitorPeripheral, craftingIssues)
    if #craftingIssues == 0 then return end -- Only display if there are issues

    local startY = 2 -- Adjust based on the monitor layout
    monitorPeripheral.setCursorPos(1, startY)
    monitorPeripheral.setTextColor(colors.red)
    monitorPeripheral.write("Crafting Issues:")
    local line = startY + 1

    for _, issue in ipairs(craftingIssues) do
        monitorPeripheral.setCursorPos(2, line)
        monitorPeripheral.write(issue.itemName .. ": " .. issue.issue)
        line = line + 1
    end

    monitorPeripheral.setTextColor(colors.white) -- Reset text color
end

return monitorManager
