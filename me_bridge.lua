-- me_bridge.lua
-- Module to interface with the ME Bridge block from the Applied Energistics 2 mod.

local meBridge = {}

-- This is the type of peripheral for the ME Bridge
local meBridgePeripheralType = "meBridge" 

-- Finds and returns the ME Bridge peripheral
function meBridge.findMEBridge()
    local mePeripheral = peripheral.find(meBridgePeripheralType)
    if not mePeripheral then
        error("No ME Bridge found.")
    end
    return mePeripheral
end

-- List all the items in the ME system with their name, amount, and whether they are craftable
function meBridge.listItems(mePeripheral)
    return mePeripheral.listItems()
end

-- Craft an item using the ME Bridge
function meBridge.craftItem(mePeripheral, itemName, amount)
    local craftables = mePeripheral.getCraftables({name=itemName})
    for _, craftable in ipairs(craftables) do
        if craftable.getItemStack().name == itemName then
            -- Assuming craftable.request(amount) starts a crafting job for the specified amount
            local status, err = craftable.request(amount)
            if not status then
                return false, err
            end
            return true
        end
    end
    return false, "Item is not craftable."
end

return meBridge
