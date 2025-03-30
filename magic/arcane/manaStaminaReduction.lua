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
local testing = require("base.testing")

local M = {}

function M.getStaminaToReduce(user, target, spell, earthTrap)
local scaling
    if not earthTrap then
        scaling = effectScaling.getEffectScaling(user, target, spell, false, true)
    else
        scaling = earthTrap:getData("scaling")
    end
local baseStaminaToReduce = 3000
return baseStaminaToReduce*scaling
end

local function applyReduceManaOrStamina(user, target, stamina, increase, spell, earthTrap)

local staminaToReduce = M.getStaminaToReduce(user, target, spell, earthTrap)


    if stamina then
        if increase then
            target:increaseAttrib("foodlevel", staminaToReduce)
            if testing.active then
                target:talk(Character.say, "#me gains "..staminaToReduce.." stamina.")
            end
        end
    end
end

function M.checkForIncreaseStamina(user, targets, spell, earthTrap)
local stamina = false
    if runes.checkSpellForRuneByName("SOLH", spell) and runes.checkSpellForRuneByName("KAH", spell) then
        stamina = true
    end

    for _, target in pairs(targets.targets) do
        applyReduceManaOrStamina(user, target, stamina, true, spell, earthTrap)
    end

end

return M
