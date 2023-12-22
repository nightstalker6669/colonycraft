-- application.lua
local monitorManager = require "monitor_manager"
local CraftingMonitor = require "monitoring/crafting_monitor"
local inventoryManager = require "inventory_manager"
local ColonyIntegrator = require "colony_integrator"
local application = {}

function application.main()
    local integrator = ColonyIntegrator.findIntegrator()
    local monitor = monitorManager.findMonitor()
    
    -- Continuous loop to keep the system running
    while true do
        -- Check and update crafting queue
        inventoryManager.checkAndCraftItems()

        -- Gather colony information for the display
        local builderData = ColonyIntegrator.getBuilderData(integrator)
        local alerts = ColonyIntegrator.getAlerts(integrator) -- INPUT_REQUIRED {Assumed alerts retrieval method}
        local happiness = ColonyIntegrator.getHappiness(integrator) -- INPUT_REQUIRED {Assumed happiness retrieval method}
        local craftingIssues = inventoryManager.getCraftingIssues()
        
        local colonyInformation = {builderData, alerts, happiness}

        -- Display Colony Information
        monitorManager.displayColonyInformation(monitor, colonyInformation)

        -- Display crafting queue status and crafting issues
        CraftingMonitor.displayCraftingQueue(monitor, inventoryManager.getCraftingQueue())
        monitorManager.displayCraftingIssues(monitor, craftingIssues)
        
        -- Wait for a short duration before refreshing the data
        os.sleep(5)
    end
end

return application
