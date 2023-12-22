-- main.lua
local ColonyIntegrator = require "colony_integrator"
local inventoryManager = require "inventory_manager"
local application = require "application"
local colony_alerts = require "colony_info/colony_alerts"
local colony_happiness = require "colony_info/colony_happiness"
local logger = require "utils/logger"

local function main()
    -- Find the Colony Integrator
    local integrator = ColonyIntegrator.findIntegrator()
    
    -- Check and craft items if necessary
    inventoryManager.checkAndCraftItems()
    -- Retrieve extended colony information
    local alerts = colony_alerts.getAlerts()
    local happiness = colony_happiness.getHappiness()
    -- Log the extended colony information
    logger.log("Colony Alerts: ")
    logger.log(alerts)
    logger.log("Colony Happiness: ")
    logger.log(happiness)

    -- Call the main application which will now handle user interface rendering
    application.main()
end

main()
