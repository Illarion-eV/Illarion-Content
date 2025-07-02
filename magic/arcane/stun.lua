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
local effectScaling = require("magic.arcane.effectScaling")
local common = require("base.common")
local testing = require("base.testing")


local M = {}


function M.applyStun(user, target, spell)
    local baseStunDuration = 1
    local scaling = effectScaling.getEffectScaling(user, target, spell)

    if target:getType() == Character.player then
        scaling = scaling - 0.5
    end

    local stunDuration = baseStunDuration * scaling

    if target:getType() == Character.player then --limits in PvP, mana cost and higher will/resistances for monsters should be enough in PvE
        stunDuration = math.max(1.2, math.min(2, stunDuration))
    end

    if testing.active then
        target:talk(Character.say, "#me is stunned for "..tostring(stunDuration))
    end

    common.ParalyseCharacter(target, stunDuration, false, true)
end

function M.checkForStun(user, spell, targets)
local HEPT = runes.checkSpellForRuneByName("HEPT", spell)
local PEN = runes.checkSpellForRuneByName("PEN", spell)
    if not HEPT or PEN then
        return
    end
    for _, target in pairs(targets.targets) do
        M.applyStun(user, target, spell)
    end
end

return M
