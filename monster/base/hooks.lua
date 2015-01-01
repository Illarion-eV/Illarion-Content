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

-- Monster hooks are used to register functions that are executed during certain events. This is useful for callbacks
-- that need to be invoked as reaction on something happening with the monster.
-- This events will be cleaned automatically in case the monster they are attached to perishes.

local M = {}
local callbackRegister = {}
local noDropList = {}

local ON_DEATH = 1

local function register(event, monster, callback)
    if not isValidChar(monster) or monster:getType() ~= Character.monster then
        error("Registering a callback function requires a valid monster to register it to.")
    end
    if type(callback) ~= "function" then
        error("The callback to register is required to be a function.")
    end

    if callbackRegister[monster.id] == nil then
        callbackRegister[monster.id] = {}
    end
    if callbackRegister[monster.id][event] == nil then
        callbackRegister[monster.id][event] = {}
    end
    table.insert(callbackRegister[monster.id][event], callback)
end

local function execute(event, monster, ...)
    if not isValidChar(monster) or monster:getType() ~= Character.monster then
        error("Executing a callback function requires a valid monster to register it to.")
    end

    if callbackRegister[monster.id] == nil or callbackRegister[monster.id][event] == nil then
        -- no callbacks registered
        return
    end

    for _, callback in pairs(callbackRegister[monster.id][event]) do
       callback(...)
    end
end

-- Register a callback function that is executed in case the monster dies.
-- The callback function receives the monster as parameter and the killder in case he is known.
function M.registerOnDeath(monster, callback)
    register(ON_DEATH, monster, callback)
end

-- Execute the callback functions that are registered to be called in case the monster dies.
function M.executeOnDeath(monster, killer)
    execute(ON_DEATH, monster, monster, killer)
end

-- Removes all hooks registered to this monster. This should be called once the monster is getting removed.
function M.cleanHooks(monster)
    callbackRegister[monster.id] = nil
    noDropList[monster.id] = nil
end

-- Saves a monster as one that should not drop
function M.setNoDrop(monster)
    noDropList[monster.id] = true
end

function M.isNoDrop(monster)
    return noDropList[monster.id]
end

return M