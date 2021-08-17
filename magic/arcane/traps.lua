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
local plantRoot = require("magic.arcane.plantRoot")
local staticObjects = require("magic.arcane.staticObjects")
local magicDamage = require("magic.arcane.magicDamage")
local effectScaling = require("magic.arcane.effectScaling")
local magicGFX = require("magic.arcane.magicGFX")
local dealDamage = require("magic.arcane.dealMagicDamage")
local stun = require("magic.arcane.stun")
local MSReduction = require("magic.arcane.manaStaminaReduction")
local illuminate = require("magic.arcane.illuminate")
local snare = require("magic.arcane.snare")
local stallMana = require("magic.arcane.stallMana")

local M = {}

function M.createEarthTraps(user, targets, spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local Luk = runes.checkSpellForRuneByName("Luk", spell)
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
local wear = staticObjects.getWearBasedOnDuration(user, spell)
local element = runes.fetchElement(spell)
    if SOLH and Orl then
        local graphicID = 372
        for _, target in pairs(targets) do
            local scaling = effectScaling.getEffectScaling(user, target.target, spell)
            local damage = magicDamage.getMagicDamage(user, spell, element, target.target, false, target.category, false)
            local field = plantRoot.getField(target)
            if not field then
                return
            end
            if Luk then
                if plantRoot.checkForSuitableSoil(field) then
                    graphicID = 3644
                end
            end
            if target.category == "item" then
                if not field:isPassable() then
                    return
                end
            end
            local myPosition = plantRoot.getPosition(target)
            local trap = world:createItemFromId(graphicID, 1, myPosition, true, 999, {["illusion"] = tostring(Lhor), ["spell"] = spell, ["illuminateWear"] = wear, ["damage"] = damage, ["scaling"] = scaling})
            trap.wear = wear
            world:changeItem(trap)
        end
    end
end

function M.triggerEarthTrap(sourceItem, trapTarget)
local myPosition = trapTarget.pos
local targets = {{target = trapTarget, category = "character"}}
local spell = sourceItem:getData("spell")
local element = runes.fetchElement(spell)
local illusion = sourceItem:getData("illusion")
local wear = sourceItem.wear
    dealDamage.applyMagicDamage(false, targets, spell, element, false, true)
    illuminate.CheckIfIlluminate(false, targets, spell, true)
    snare.applySnare(false, targets, spell, false, true)
    magicGFX.getTargetGFX(targets, spell, true)
    stun.checkForStun(false, spell, targets, true)
    MSReduction.checkForIncreaseStamina(false, targets, spell, true)
    plantRoot.applyPlantRoot(false, targets, spell, true)
    stallMana.applyManaStalling(false, targets, spell, true)
    world:erase(sourceItem, 1)
    if sourceItem.id == 3466 then
        local newPlant = world:createItemFromId(3466, 1, myPosition, true, 999, {["illusion"] = illusion})
        newPlant.wear = wear
        world:changeItem(newPlant)
    end
end


return M
