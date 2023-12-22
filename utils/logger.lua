-- /utils/logger.lua
-- A simple logging utility that demonstrates data manipulation and structuring through log outputs.

local logger = {}

function logger.log(message)
    if type(message) == "table" then
        for key, value in pairs(message) do
            print(tostring(key) .. ": " .. tostring(value))
        end
    else
        print(tostring(message))
    end
end

return logger
