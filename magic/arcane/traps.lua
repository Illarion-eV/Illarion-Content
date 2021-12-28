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
local magicGFXSFX = require("magic.arcane.magicGFXSFX")
local dealDamage = require("magic.arcane.dealMagicDamage")
local stun = require("magic.arcane.stun")
local MSReduction = require("magic.arcane.manaStaminaReduction")
local illuminate = require("magic.arcane.illuminate")
local snare = require("magic.arcane.snare")
local stallMana = require("magic.arcane.stallMana")
local MP = require("magic.arcane.magicPenetration")
local targeting = require("magic.arcane.targeting")
local lookat = require("base.lookat")

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
    if user then
        if user.pos == myPosition then
            return
        end
    end
    if staticObjects.checkForPreExistingTraps(myPosition) then
        return
    end
    local trap = world:createItemFromId(graphicID, 1, myPosition, true, 999, {["illusion"] = tostring(Lhor), ["spell"] = spell, ["illuminateWear"] = wear, ["scaling"] = scaling, ["magicPenetration"] = magicPenetration})
    trap.wear = wear
    if graphicID == 372 then
        lookat.SetSpecialName(trap,"","Earth Cloud")
        lookat.SetSpecialDescription(trap,"","A misty green cloud with an earthy scent to it.")
    else
        lookat.SetSpecialName(trap,"GERMAN HERE","Entangling Plant")
        lookat.SetSpecialDescription(trap,"GERMAN HERE","Upon closer inspection, you may notice the leaves of the plant having a magical looking glow to them.")
    end
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

local function deleteTrap(target, trap)
    local field = world:getField(target.pos)
    local count = field:countItems()
    local currentitem
    local items = { }
    for i=0, count-1 do
        currentitem = world:getItemOnField(target.pos)
        world:erase(currentitem, currentitem.number)
        if(currentitem.id ~= trap.id) then
            table.insert(items, currentitem)
        end
    end
    for i,item in pairs(items) do
        world:createItemFromItem(item, target.pos, true)
    end
end


function M.triggerEarthTrap(sourceItem, trapTarget)
deleteTrap(trapTarget, sourceItem)
local myPosition = trapTarget.pos
local spell = tonumber(sourceItem:getData("spell"))
local targets = targeting.getPositionsAndTargets(false, spell, myPosition, true)
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
    magicGFXSFX.getTargetGFXSFX(targets, spell, true)
    if sourceItem.id == 3644 then
        local newPlant = world:createItemFromId(3644, 1, myPosition, true, 999, {["illusion"] = illusion})
        newPlant.wear = wear
        world:changeItem(newPlant)
        if illusion == "false" then
            trapTarget:inform("","As you step onto the plant, it releases a gaseous substance that seems to flock towards you in an attempt to enter your body.")
        end
    else
        if illusion == "true" then
            trapTarget:inform("","As you step into the cloud of earth magic, nothing happens to you. Was it just an illusion?")
        else
            trapTarget:inform("", "Stepping into the cloud of earth magic, the gaseous substance flocks towards you in an attempt to enter your body.")
        end
    end
end


return M
