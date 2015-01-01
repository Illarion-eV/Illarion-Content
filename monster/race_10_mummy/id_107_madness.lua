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
--ID 107, Mummy of Madness, Level: 2, Armourtype: -, Weapontype: slashing

local base = require("monster.base.base")
local hooks = require("monster.base.hooks")
local mummies = require("monster.race_10_mummy.base")
local M = mummies.generateCallbacks()

local function isSpecialTime()
    if world:getTime("month") == 16 then
        return true -- It is Mas!
    end
    local hour = world:getTime("hour")
    -- "Special time" from 20:00 to 3:59
    return hour >= 20 or hour <= 3
end

local function spawnNewMummy(pos)
    local newMummy = world:createMonster(107, pos, 0)
    if newMummy ~= nil and isValidChar(newMummy) then
        world:gfx(5, newMummy.pos);
    end
end

-- The mummy of madness needs to spawn two new monsters of the same kind upon it's death.
local orgOnDeath = M.onDeath

function M.onDeath(monster)
    if isSpecialTime() then
        -- Special time! Respawn two new mummies to create more fun!
        for _ = 1, 2 do
            spawnNewMummy(monster.pos)
        end
        hooks.setNoDrop(monster)
    end

    if orgOnDeath ~= nil then
        orgOnDeath(monster)
    end
end

return M