-- colony_integrator.lua

-- This module interfaces with the Advanced Peripherals mod's Colony Integrator block.

local ColonyIntegrator = {}

local integratorPeripheralType = "colonyIntegrator" -- This is the type of peripheral for the Colony Integrator

-- Finds and returns the integrator peripheral
function ColonyIntegrator.findIntegrator()
    local integratorPeripheral = peripheral.find(integratorPeripheralType)
    if not integratorPeripheral then
        error("No Colony Integrator block found.")
    end
    return integratorPeripheral
end

-- Retrieves colony data from the Colony Integrator peripheral
function ColonyIntegrator.getColonyData(integratorPeripheral)
    local colonyData = integratorPeripheral.getColonyData()
    return colonyData
end

-- Retrieve builder-specific data including construction tasks and required materials
function ColonyIntegrator.getBuilderData(integratorPeripheral)
    local builders = integratorPeripheral.getBuilders()
    local builderData = {}
    for _, builder in pairs(builders) do
        local builderInfo = {
            name = builder.name,
            location = builder.location,
            materialsNeeded = integratorPeripheral.getNeededItems(builder.id)
        }
        table.insert(builderData, builderInfo)
    end
    return builderData
end

return ColonyIntegrator
