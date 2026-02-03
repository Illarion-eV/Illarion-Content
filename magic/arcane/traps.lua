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
local stallMana = require("magic.arcane.stallMana")
local MP = require("magic.arcane.magicPenetration")
local targeting = require("magic.arcane.targeting")
local lookat = require("base.lookat")
local antiTroll = require("magic.base.antiTroll")
local magic = require("base.magic")
local common = require("base.common")
local castingSpeed = require("magic.arcane.castingSpeed")

local M = {}

local earthTrapTexts = {
    name = {english = "Earth Cloud", german = "Erdwolke"},
    description = {english = "A misty green cloud with an earthy scent to it.", german = "Eine nebelige gründe Wolke mit erdigem Geruch."},
    cloud = {english = "Stepping into the cloud of earth magic, the gaseous substance flocks towards you in an attempt to enter your body.", german = "Als du die Wolke aus Erdmagie berührst, strömt das Gas auf dich zu und versucht in deinen Körper einzudringen."},
    plant = {english = "As you step onto the plant, it releases a gaseous substance that seems to flock towards you in an attempt to enter your body.", german = "Als du die Pflanze berührst, stößt sie ein Gas aus welches versucht in deinen Körper einzudringen."},
    illusion = {english = "As you step into the cloud of earth magic, nothing happens to you. Was it just an illusion?", german = "Als du die Wolke aus Erdmagieberührst pasiert....nichts. War es etwa nur eine Illusion?"}
}

local function trapCreation(user, target, spell, item, level)
    local graphicID = 372
    local LHOR = runes.checkSpellForRuneByName("LHOR", spell)
    local LUK = runes.checkSpellForRuneByName("LUK", spell)
    local element = runes.fetchElement(spell)
    local wear = staticObjects.getWearBasedOnDuration(user, target, spell)
    local scaling = effectScaling.getEffectScaling(user, target, spell)
    local field = plantRoot.getField(target)
    local magicPenetration = MP.getMagicPenetration(user, element, spell)
    local elementBonus = magic.checkElementBonus(user, element)

    if not field or not antiTroll.passesAntiTrollCheck(target) then
        return
    end
    if LUK then
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

    local wandGemBonus = 0

    if user then
        wandGemBonus = magic.getGemBonusWand(user)
        if user.pos == myPosition then
            return
        end
    end
    if staticObjects.checkForPreExistingTraps(myPosition) then
        return
    end
    local gemBonus = magic.getGemBonusWand(user)/100
    local trap = world:createItemFromId(graphicID, 1, myPosition, true, 999, {["illusion"] = tostring(LHOR), ["spell"] = spell, ["illuminateWear"] = wear, ["scaling"] = scaling, ["magicPenetration"] = magicPenetration, ["elementBonus"] = elementBonus, ["gemBonus"] = gemBonus, ["level"] = level, ["wandGemBonus"] = wandGemBonus})
    trap.wear = wear
    if graphicID == 372 then
        lookat.SetSpecialName(trap, earthTrapTexts.name.german, earthTrapTexts.name.english)
        lookat.SetSpecialDescription(trap, earthTrapTexts.description.german, earthTrapTexts.description.english)
    else
        lookat.SetSpecialName(trap, plantRoot.plantRootTexts.name.german, plantRoot.plantRootTexts.name.english)
        lookat.SetSpecialDescription(trap, plantRoot.plantRootTexts.description.german, plantRoot.plantRootTexts.description.english)
    end
    world:changeItem(trap)
end

function M.createEarthTraps(user, targets, spell, level)
local ORL = runes.checkSpellForRuneByName("ORL", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)

    if not SOLH or not ORL then
        return
    end

    for _, item in pairs(targets.items) do
        if ORL then
            trapCreation(user, item, spell, true, level)
        end
    end

    for _, target in pairs(targets.targets) do
        if not ORL then
            return
        end
        trapCreation(user, target, spell, false, level)
    end

    for _, pos in pairs(targets.positions) do
        if not ORL then
            return
        end
        trapCreation(user, pos, spell, false, level)
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
targets = targeting.addTargets(nil, spell, targets)
local element = runes.fetchElement(spell)
local illusion = sourceItem:getData("illusion")
local level = sourceItem:getData("level")
local wandGemBonus = sourceItem:getData("wandGemBonus")

if common.IsNilOrEmpty(level) then
    level = 0
end

local wear = sourceItem.wear
local earthCloud = sourceItem:getData("earthCloud")
    if earthCloud ~= "true" then
        local castDuration = castingSpeed.arcaneSpellCastSpeed(nil, spell, true)
        dealDamage.applyMagicDamage(false, targets, spell, element, false, sourceItem, level, castDuration)
        illuminate.CheckIfIlluminate(false, targets, spell, sourceItem)
        stun.checkForStun(false, spell, targets)
        MSReduction.checkForIncreaseStamina(false, targets, spell, sourceItem)
        stallMana.applyManaStalling(false, targets, spell, sourceItem)
    end
    plantRoot.applyPlantRoot(false, targets, spell, sourceItem)
    magicGFXSFX.getTargetGFXSFX(targets, spell, true)
    if sourceItem.id == 3644 then
        local newPlant = world:createItemFromId(3644, 1, myPosition, true, 999, {["illusion"] = illusion, ["level"] = level, ["wandGemBonus"] = wandGemBonus})
        newPlant.wear = wear
        world:changeItem(newPlant)
        if illusion == "false" then
            trapTarget:inform(earthTrapTexts.plant.german, earthTrapTexts.plant.english)
        end
    else
        if illusion == "true" then
            trapTarget:inform(earthTrapTexts.illusion.german, earthTrapTexts.illusion.english)
        else
            trapTarget:inform(earthTrapTexts.cloud.german, earthTrapTexts.cloud.english)
        end
    end
end


return M
