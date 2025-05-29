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
local magic = require("base.magic")

local M = {}

function M.getEffectScaling(user, target, spell, earthTrap, ignoreMR) --For positive spells like feeding, we ignore MR

    local element = runes.fetchElement(spell)
    local magicPenetration
    local elementBonus
    local wandGemBonus
    local cloakGemBonus = 0
    local magicResistance = 0

    if target and isValidChar(target) and target.pos and not target.itempos then -- It is a character, not an item, so it has magic resistance and possibly a gemmed cloak
        magicResistance = MR.getMagicResistance(target, spell)
        cloakGemBonus = magic.getGemBonusCloak(target)/100
    end

    if not earthTrap then -- It is not a trap so we can draw stats from the user
        magicPenetration = MP.getMagicPenetration(user, element, spell)
        elementBonus = magic.checkElementBonus(user, element)
        wandGemBonus = magic.getGemBonusWand(user)/100
    else -- It is a trap so we have to get the data from the trap itself
        magicPenetration = earthTrap:getData("magicPenetration")
        elementBonus = earthTrap:getData("elementBonus")
        wandGemBonus = earthTrap:getData("gemBonus")
    end

    if ignoreMR then
        magicResistance = 0
    end

    local retVal = 1*(1+magicDamage.intImpact(user)+magicDamage.getEquipmentImpact(user, elementBonus))

    retVal = magicDamage.resistanceAndPenetrationImpact(magicResistance, magicPenetration, retVal)

    retVal = magicDamage.crit(user, retVal) -- Up to 50% increase if crit, based on perception stat and RNG

    retVal = retVal * (1 + wandGemBonus-cloakGemBonus) -- Gems can increase/decrease the effect up to 60% (more likely 30%(tier 5 set), as tier 10 sets are nigh impossible to get ever)

    return retVal
end


return M
