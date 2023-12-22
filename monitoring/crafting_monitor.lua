-- monitoring/crafting_monitor.lua
-- Module for monitoring the crafting status.

local CraftingMonitor = {}

local monitorManager = require "monitor_manager"
local Queue = require "utils/queue"

-- Function to display the crafting queue status on the monitor
function CraftingMonitor.displayCraftingQueue(monitor, craftingQueue)
    monitorManager.setupMonitor(monitor) -- Clear and set up the monitor
    local line = 1
    if Queue.is_empty(craftingQueue) then
        monitor.setCursorPos(1, line)
        monitor.write("Crafting queue is empty.")
        return
    end
    
    for i = craftingQueue.first, craftingQueue.last do
        local itemToCraft = craftingQueue[i]
        monitor.setCursorPos(1, line)
        monitor.write("Crafting " .. itemToCraft.name .. ": " .. itemToCraft.amount)
        line = line + 1
    end
end

return CraftingMonitor
