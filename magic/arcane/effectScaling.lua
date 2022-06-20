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

local MR = require("magic.arcane.magicResistance")
local MP = require("magic.arcane.magicPenetration")
local runes = require("magic.arcane.runes")
local magicDamage = require("magic.arcane.magicDamage")


local M = {}

function M.getEffectScaling(user, target, spell, earthTrap)
    local element = runes.fetchElement(spell)
    local magicResistance = 0

    if target.pos and not target.itempos then
        magicResistance = MR.getMagicResistance(target, spell)
    end

    local magicPenetration

    if not earthTrap then
        magicPenetration = MP.getMagicPenetration(user, element, spell)
    else
        magicPenetration = earthTrap:getData("magicPenetration")
    end

    local wandQualityImpact = magicDamage.getWandQualityImpact(user)
    local attributeImpact = magicDamage.getAttribBonusForMagic(user, spell)
    local magicGemImpact = magicDamage.getMagicGemImpact(user)

    local retVal = 1 + magicPenetration - magicResistance

    retVal = retVal*wandQualityImpact*attributeImpact*magicGemImpact

    return retVal
end


return M
