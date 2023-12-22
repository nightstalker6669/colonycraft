-- startup/startup.lua

-- Initialize CC:Tweaked environment
-- and print a message to verify it's running

-- This function checks that the basic environment is set up
local function checkEnvironment()
    if not os.version then
        error("CC:Tweaked environment not found.")
    end
end

-- This function prints basic system information to verify
-- that the environment is connected and the script is being executed
local function printSystemInfo()
    print("CC:Tweaked version: " .. os.version())
    print("Executing on computer ID: " .. os.getComputerID())
end

local function main()
    checkEnvironment()
    printSystemInfo()
    
    -- Here we could establish basic connections if needed
    -- For example, connecting to peripherals or setting up network
    print("Setup complete. The computer is connected and ready.")
end

-- Call the main function to perform setup operations
main()
