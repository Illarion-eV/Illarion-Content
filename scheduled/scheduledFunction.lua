--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
-- INSERT INTO scheduledscripts VALUES('scheduled.scheduledFunction', 1, 1, 'onExecute');

-- This is an scheduled script that works to support any other scripts that require to call another function with
-- some delay. It is possible to register functions in that script that will be executed afer a set delay.
local M = {}

-- The list of functions and their counters that are scheduled to be executed
local executionQueue = {}

local firstExecution = true
local firstExecutionTime = 0

function M.registerFunction(delay, callFunction)
    if firstExecution then
        debug("Scheduled functions script was not yet executed!!")
    end
    table.insert(executionQueue, {counter = delay, exec = callFunction})
    if firstExecution then
        debug("?????????? function scheduled with delay: " .. delay)
    else
        debug(firstExecutionTime .. " function scheduled with delay: " .. delay)
    end
end

function M.onExecute()
    if firstExecution then
        debug("Scheduled functions script are executed for the first time now!")
        firstExecutionTime = world:getTime("unix")
        firstExecution = false
    end
    if (#executionQueue > 0) then
        debug(firstExecutionTime .. " There are functions scheduled")
        local currentQueue = executionQueue
        executionQueue = {}

        for _, data in pairs(currentQueue) do
            data.counter = data.counter - 1
            if data.counter <= 0 then
                debug(firstExecutionTime .. " Executing function")
                data.exec()
            else
                table.insert(executionQueue, data)
                debug(firstExecutionTime .. " Resheduling function. Remaining delay: " .. data.counter)
            end
        end
    else
        debug(firstExecutionTime .. " There are NO functions scheduled")
    end
end

return M