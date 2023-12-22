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

        -- Get updated builder data
        local builderData = ColonyIntegrator.getBuilderData(integrator)
        local craftingIssues = inventoryManager.getCraftingIssues() -- get crafting issues

        -- Display builder data, crafting queue status, and crafting issues
        monitorManager.setupMonitor(monitor)
        monitorManager.displayBuilderInfo(monitor, builderData)
        CraftingMonitor.displayCraftingQueue(monitor, inventoryManager.getCraftingQueue())
        monitorManager.displayCraftingIssues(monitor, craftingIssues) -- display crafting issues
        
        -- Wait for a short duration before refreshing the data
        os.sleep(5)
    end
end

return application
