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

local M = {}

function M.getStaminaToReduce(user, target, spell, earthTrap)
local scaling
    if not earthTrap then
        scaling = effectScaling.getEffectScaling(user, target, spell)
    else
        scaling = earthTrap:getData("scaling")
    end
local baseStaminaToReduce = 1000
return baseStaminaToReduce*scaling
end

local function applyReduceManaOrStamina(user, target, stamina, increase, spell, earthTrap)

local staminaToReduce = M.getStaminaToReduce(user, target, spell, earthTrap)


    if stamina then
        if increase then
            target:increaseAttrib("foodlevel", staminaToReduce)
            target:talk(Character.say, "#me gains "..staminaToReduce.." stamina.")
        elseif target:increaseAttrib("foodlevel", 0) > staminaToReduce then
            target:increaseAttrib("foodlevel", -staminaToReduce)
            target:talk(Character.say, "#me loses "..staminaToReduce.." stamina.")
        else
            target:setAttrib("foodlevel", 0)
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

function M.checkForReduceManaOrStamina(user, targets, spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local KAH = runes.checkSpellForRuneByName("KAH", spell)
local stamina = false

    if KAH then
        stamina = true
    end

    if RA then
        for _, target in pairs(targets.targets) do
            applyReduceManaOrStamina(user, target, stamina, false, spell)
        end
    end
end

return M
