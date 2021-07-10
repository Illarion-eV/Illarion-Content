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

local runes = require("magic.arcane.runes")
local castingSpeed = require("magic.arcane.castingSpeed")

local M = {}

function M.getBaseStunDuration()
local duration = castingSpeed.castingSpeedByRuneSize("Short") + castingSpeed.castingSpeedByRuneSize("Medium")*3 -- May need tweaking to prevent permastun

return duration
end

local function getTargetsResistance(target)
local maxReduction = M.getBaseStunDuration()
local retVal = 0
    if retVal > maxReduction then
        retVal = maxReduction
    end
return retVal
end

function M.applyStun(target)
local baseStunDuration = M.getBaseStunDuration()
local reduceStun = getTargetsResistance(target)
local stunDuration = baseStunDuration - reduceStun

target.movepoints = target.movepoints - stunDuration
end

function M.checkForStun(spell, targets)
local Hept = runes.checkSpellForRuneByName("Hept", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
    if not Hept or PEN then
        return
    end
    for _, target in pairs(targets) do
        if target.category == "character" then
            M.applyStun(target.target)
        end
    end
end

return M
