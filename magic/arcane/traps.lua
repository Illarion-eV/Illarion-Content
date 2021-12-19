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
local effectScaling = require("magic.arcane.effectScaling")
local magicGFX = require("magic.arcane.magicGFX")
local dealDamage = require("magic.arcane.dealMagicDamage")
local stun = require("magic.arcane.stun")
local MSReduction = require("magic.arcane.manaStaminaReduction")
local illuminate = require("magic.arcane.illuminate")
local snare = require("magic.arcane.snare")
local stallMana = require("magic.arcane.stallMana")
local MP = require("magic.arcane.magicPenetration")
local targeting = require("magic.arcane.targeting")

local M = {}

local function trapCreation(user, target, spell, item)
    local graphicID = 372
    local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
    local Luk = runes.checkSpellForRuneByName("Luk", spell)
    local element = runes.fetchElement(spell)
    local wear = staticObjects.getWearBasedOnDuration(user, target, spell)
    local scaling = effectScaling.getEffectScaling(user, target, spell)
    local field = plantRoot.getField(target)
    local magicPenetration = MP.getMagicPenetration(user, element, spell)
    if not field then
        return
    end
    if Luk then
        if plantRoot.checkForSuitableSoil(field) then
            graphicID = 3644
        end
    end
    if item then
        if not field:isPassable() then
            return
        end
    end
    local myPosition = plantRoot.getPosition(target)
    local trap = world:createItemFromId(graphicID, 1, myPosition, true, 999, {["illusion"] = tostring(Lhor), ["spell"] = spell, ["illuminateWear"] = wear, ["scaling"] = scaling, ["magicPenetration"] = magicPenetration})
    trap.wear = wear
    world:changeItem(trap)
end

function M.createEarthTraps(user, targets, spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)

    if not SOLH or not Orl then
        return
    end
    for _, item in pairs(targets.items) do
        if Orl then
            trapCreation(user, item, spell, true)
        end
    end

    for _, target in pairs(targets.targets) do
        if not Orl then
            return
        end
        trapCreation(user, target, spell)
    end

    for _, pos in pairs(targets.positions) do
        if not Orl then
            return
        end
        trapCreation(user, pos, spell)
    end
end


function M.triggerEarthTrap(sourceItem, trapTarget)
    world:erase(sourceItem, 1)
    log("target speed pre trap: "..trapTarget.speed)
local myPosition = trapTarget.pos
local spell = sourceItem:getData("spell")
local targets = targeting.getPositionsAndTargets(false, spell, myPosition)
local element = runes.fetchElement(spell)
local illusion = sourceItem:getData("illusion")
local wear = sourceItem.wear
local earthCloud = sourceItem:getData("earthCloud")
    if earthCloud ~= "true" then
        dealDamage.applyMagicDamage(false, targets, spell, element, false, sourceItem)
        illuminate.CheckIfIlluminate(false, targets, spell, sourceItem)
        snare.applySnare(false, targets, spell, false, sourceItem)
        stun.checkForStun(spell, targets)
        MSReduction.checkForIncreaseStamina(false, targets, spell, sourceItem)
        stallMana.applyManaStalling(false, targets, spell, sourceItem)
    end
    plantRoot.applyPlantRoot(false, targets, spell, sourceItem)
    magicGFX.getTargetGFX(targets, spell, true)
    if sourceItem.id == 3466 then
        local newPlant = world:createItemFromId(3466, 1, myPosition, true, 999, {["illusion"] = illusion})
        newPlant.wear = wear
        world:changeItem(newPlant)
    end
    log("target speed post trap: "..trapTarget.speed)
end


return M
