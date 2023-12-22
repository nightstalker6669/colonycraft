-- This module extends the ColonyIntegrator module to handle colony alerts

local Alerts = {}

function Alerts.getColonyAlerts(integratorPeripheral)
    if not integratorPeripheral then
        error("Integrator peripheral is required")
    end
    -- [INPUT_REQUIRED] Use actual method to retrieve alerts if different from 'getColonyAlerts'
    local alerts = integratorPeripheral.isUnderAttack()
    return alerts
end

return Alerts
