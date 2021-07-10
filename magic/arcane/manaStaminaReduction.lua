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

local M = {}

function M.getManaToReduce()
    return 2000
end

function M.getStaminaToReduce()
    return 10000
end

local function applyReduceManaOrStamina(target, mana, stamina, increase)
local manaToReduce = M.getManaToReduce()
local staminaToReduce = M.getStaminaToReduce()
    if mana then
        if target:increaseAttrib("mana", 0) > manaToReduce then
            target:increaseAttrib("mana", -manaToReduce)
        else
            target:setAttrib("mana", 0)
        end
    end

    if stamina then
        if increase then
            target:increaseAttrib("foodlevel", staminaToReduce)
        elseif target:increaseAttrib("foodlevel", 0) > staminaToReduce then
            target:increaseAttrib("foodlevel", -staminaToReduce)
        else
            target:setAttrib("foodlevel", 0)
        end
    end
end

function M.checkForIncreaseStamina(targets, spell)
local stamina = false
    if runes.checkSpellForRuneByName("SOLH", spell) and runes.checkSpellForRuneByName("Kah", spell) then
        stamina = true
    end

    for _, target in pairs(targets) do
        if target.category == "character" then
            applyReduceManaOrStamina(target.target, false, stamina, true)
        end
    end

end

function M.checkForReduceManaOrStamina(targets, spell)
local RA = runes.checkSpellForRuneByName("RA", spell)
local Kah = runes.checkSpellForRuneByName("Kah", spell)
local Ira = runes.checkSpellForRuneByName("Ira", spell)
local mana = false
local stamina = false

    if Kah then
        stamina = true
    end
    if Ira then
        mana = true
    end
    if RA then
        for _, target in pairs(targets) do
            if target.category == "character" then
                applyReduceManaOrStamina(target.target, mana, stamina)
            end
        end
    end
end

return M
