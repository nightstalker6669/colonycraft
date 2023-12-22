-- /colony_info/colony_alerts.lua
-- Module to handle the retrieval of colony alerts.

local ColonyIntegrator = require "colony_integrator"
local colony_alerts = {}

function colony_alerts.getAlerts()
    local integrator = ColonyIntegrator.findIntegrator()
    local alerts = ColonyIntegrator.getAlerts(integrator)
    return alerts
end

return colony_alerts
