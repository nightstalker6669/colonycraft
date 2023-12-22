-- inventory_manager.lua
local meBridge = require "me_bridge"
local Queue = require "utils/queue"

local inventoryManager = {}

local lowSupplyThreshold = 10
local craftingQueue = Queue.new()
local craftingIssues = {} -- Maintain a list of crafting issues

-- Function to process the crafting queue
local function processCraftingQueue(mePeripheral)
    craftingIssues = {} -- Reset the crafting issues before processing the queue
    while not Queue.is_empty(craftingQueue) do
        local itemToCraft = Queue.pop(craftingQueue)
        local success, err = meBridge.craftItem(mePeripheral, itemToCraft.name, itemToCraft.amount)
        if not success then
            print("Error crafting " .. itemToCraft.name .. ": " .. err)
            -- Reattempt crafting at a later time
            Queue.push(craftingQueue, itemToCraft)
            table.insert(craftingIssues, { itemName = itemToCraft.name, issue = err }) -- Add issues to the list
            break
        end
    end
end

function inventoryManager.getCraftingIssues()
    return craftingIssues
end

function inventoryManager.checkAndCraftItems()
    local mePeripheral = meBridge.findMEBridge()
    local itemsList = meBridge.listItems(mePeripheral)
    
    for _, item in ipairs(itemsList) do
        if item.craftable and item.amount <= lowSupplyThreshold then
            Queue.push(craftingQueue, {
                name = item.name,
                amount = lowSupplyThreshold - item.amount
            })
        end
    end

    processCraftingQueue(mePeripheral)
end

return inventoryManager
