-- main.lua

local ColonyIntegrator = require "colony_integrator"
local inventoryManager = require "inventory_manager"
local application = require "application"

local function main()
    -- Find the Colony Integrator
    local integrator = ColonyIntegrator.findIntegrator()
    
    -- Check and craft items if necessary
    inventoryManager.checkAndCraftItems()

    -- Get colony data
    local colonyData = ColonyIntegrator.getColonyData(integrator)

    -- Do something with the colony data, e.g., print it to the terminal for now
    print(textutils.serialize(colonyData))
    
    -- Call the main application which will now handle user interface rendering
    application.main()
end

main()
