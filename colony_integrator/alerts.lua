-- This module extends the ColonyIntegrator module to handle colony alerts

local Alerts = {}

function Alerts.getColonyAlerts(integratorPeripheral)
    if not integratorPeripheral then
        error("Integrator peripheral is required")
    end
    local alerts = integratorPeripheral.isUnderAttack()
    return alerts
end

return Alerts
