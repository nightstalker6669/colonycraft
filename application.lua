local monitorManager = require "monitor_manager"
local CraftingMonitor = require "monitoring/crafting_monitor"
local inventoryManager = require "inventory_manager"
local ColonyIntegrator = require "colony_integrator"
local AlertDisplay = require "monitoring/alert_display"
local HappinessAlert = require "monitoring/happiness_alert"
local application = {}

function application.main()
    local integrator = ColonyIntegrator.findIntegrator()
    local monitor = monitorManager.findMonitor()
    
    while true do
        local builderData = ColonyIntegrator.getBuilderData(integrator)
        local alerts = ColonyIntegrator.getAlerts(integrator)
        local happiness = ColonyIntegrator.getHappiness(integrator)
        local craftingIssues = inventoryManager.getCraftingIssues()
        
        local colonyInformation = {builderData, alerts, happiness}

        if alerts.isUnderAttack then
            AlertDisplay.displayUnderAttack(monitor)
        end
        
        HappinessAlert.displayHappinessAlert(monitor, happiness)

        monitorManager.displayColonyInformation(monitor, colonyInformation)

        CraftingMonitor.displayCraftingQueue(monitor, inventoryManager.getCraftingQueue())
        monitorManager.displayCraftingIssues(monitor, craftingIssues)
        
        os.sleep(5)
    end
end

return application
