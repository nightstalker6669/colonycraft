-- /colony_info/colony_happiness.lua
-- Module to handle the retrieval of colony happiness levels.

local ColonyIntegrator = require "colony_integrator"
local colony_happiness = {}

function colony_happiness.getHappiness()
    local integrator = ColonyIntegrator.findIntegrator()
    local happiness = ColonyIntegrator.getHappiness(integrator)
    return happiness
end

return colony_happiness
