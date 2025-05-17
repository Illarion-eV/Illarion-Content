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

-- This is the script required to turn a specific monster into a monster of madness.
-- This means that the monster can't be killed during night time and during mas but instead rises again upon death as
-- two new monsters.

local common = require("base.common")
local hooks = require("monster.base.hooks")

local function _isNumber(value)
    return type(value) == "number"
end

local function _isTable(value)
    return type(value) == "table"
end

local function isSpecialTime()
    if world:getTime("month") == 16 then
        return true -- It is Mas!
    end
    local hour = world:getTime("hour")
    -- "Special time" from 20:00 to 3:59
    return hour >= 20 or hour <= 3
end

return function(params)
    if not _isTable(params) then
        error("The parameter for the madness creation function are not set.")
    end

    if not _isNumber(params.monsterId) then
        error("The required monster id is not set.")
    end
    local monsterId = tonumber(params.monsterId);

    local monsterCount = 2;
    if _isNumber(params.count) then
        monsterCount = tonumber(params.count);
        if monsterCount < 1 then
            error("The amount of newly spawned monster has to be at least 1.")
        end
    end

    local gfxId = 5
    if _isNumber(params.gfxId) then
        gfxId = tonumber(params.gfxId);
    end

    local function spawnNewMonster(pos)
        local newMonster = world:createMonster(monsterId, pos, 0)
        if newMonster ~= nil and isValidChar(newMonster) then
            world:gfx(gfxId, pos);
        end
    end

    local self = {}
    function self.addCallbacks(t)
        if not _isTable(t) then
            error("Adding the magic callbacks requires a table as parameter that contains the already set callbacks.")
        end

        local oldOnDeath = t.onDeath
        t.onDeath = function(monster)
            if isSpecialTime() and not hooks.isForcedDeath(monster) then
                local spawnPositions = common.GetFreePositions(monster.pos, 1, true, true)
                -- Special time! Respawn new monsters for more fun!
                for _ = 1, monsterCount do
                    spawnNewMonster(spawnPositions() or monster.pos)
                end
                hooks.setNoDrop(monster)
            end

            if oldOnDeath ~= nil then
                oldOnDeath(monster)
            end
        end

        return t
    end
    return self
end