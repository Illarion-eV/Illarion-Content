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
local magicDamage = require("magic.arcane.magicDamage")
local snare = require("magic.arcane.snare")
local staticObjects = require("magic.arcane.staticObjects")
local effectScaling = require("magic.arcane.effectScaling")
local M = {}

local howManySecondsUntilFullSpeed = 10

function M.getSpeed(user, target, spell, earthTrap)
    local scaling
    if not earthTrap then
        scaling = effectScaling.getEffectScaling(user, target, spell)
    else
        scaling = earthTrap:getData("scaling")
    end
    local retVal = 10
    local Taur = runes.checkSpellForRuneByName("Taur", spell)
    local Ura = runes.checkSpellForRuneByName("Ura", spell)
    local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
    local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
    local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
    local rune
        if Taur then
            rune = "Taur"
        elseif Ura then
            rune = "Ura"
        elseif Yeg then
            rune = "Yeg"
        end
    local raceBonus
        if rune then
            raceBonus = magicDamage.checkIfRaceBonus(target, rune)
        end
        if raceBonus then
            retVal = retVal + 10
        end
        if Qwan then
            retVal = retVal + 10
        end
        retVal = retVal*scaling
        if Lhor then
            retVal = false
        end
    return retVal
end

function M.getField(target)
    local positionToCheck = M.getPosition(target)
    return world:getField(positionToCheck)
end

local suitableSoilList = {3, 4, 8, 9, 10, 11, 12, 14, 16, 74, 76}

function M.checkForSuitableSoil(field)
    local myFieldId = field:tile()
    for _, soil in pairs(suitableSoilList) do
        if myFieldId == soil then
            return true
        end
    end
return false
end

function M.getPosition(target)
local positionToCheck
    if target.category == "character" then
        positionToCheck = target.pos
    elseif target.category == "item" then
        positionToCheck = target.position
    elseif target.category == "position" then
        positionToCheck = target
    end
return positionToCheck
end


function M.createEntanglingPlant(user, targets, spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local Luk = runes.checkSpellForRuneByName("Luk", spell)
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
local plantID = 3644
local wear = staticObjects.getWearBasedOnDuration(user, spell)
    if Orl then --To prevent overlap of plant and trap, trap as the stronger one takes priority. Trap will instead get plant graphic if this rune is used.
        return
    end
    for _, target in pairs(targets) do
        local scaling = effectScaling.getEffectScaling(user, target, spell)
        if SOLH and Luk then
            local field = M.getField(target)
            if not field then
                return
            end
            if target.category == "item" then
                if not field:isPassable() then
                    return
                end
            end
            if not M.checkForSuitableSoil(field) then
                return
            end
            local myPosition = M.getPosition(target)
            local plant = world:createItemFromId(plantID, 1, myPosition, true, 999, {["illusion"] = tostring(Lhor), ["scaling"] = scaling})
            plant.wear = wear
            world:changeItem(plant)
        end
    end
end

function M.applyPlantRootForEntanglingPlant(sourceItem, target)
    local spell = sourceItem:getData("spell")
    local getSpeed = M.getSpeed(false, target, spell, sourceItem)
    local foundEffect, myEffect = target.effects:find(16)
    if not getSpeed then
        return
    end
    if not foundEffect then
        myEffect = LongTimeEffect(16, 10)
        myEffect:addValue("speed", getSpeed)
        myEffect:addValue("remainingSpeed", getSpeed)
        myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
        target.effects:addEffect(myEffect)
    else
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            myEffect:addValue("speed", getSpeed - remainingSpeed)
            myEffect:addValue("remainingSpeed", getSpeed)
            myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
            M.addEffect(myEffect, target)
        end
    end
end

function M.applyPlantRoot(user, targets, spell, earthTrap)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    for _, target in pairs(targets) do
        if target.category == "character" and SOLH then
            local getSpeed = M.getSpeed(target.target, spell)
            if not getSpeed then
                return
            end
            local foundEffect, myEffect = target.target.effects:find(16)
            if not foundEffect then
                myEffect = LongTimeEffect(16, 10)
                myEffect:addValue("speed", getSpeed)
                myEffect:addValue("remainingSpeed", getSpeed)
                myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                target.target.effects:addEffect(myEffect)
            else
                local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
                if foundRemainingSpeed then
                    myEffect:addValue("speed", getSpeed - remainingSpeed)
                    myEffect:addValue("remainingSpeed", getSpeed)
                    myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                    M.addEffect(myEffect, target.target)
                end
            end
        end
    end
end

function M.addEffect(myEffect, target)
    snare.addEffect(myEffect, target)
end

function M.callEffect(myEffect, target)
    snare.callEffect(myEffect, target)
end

function M.loadEffect(myEffect, target)
    snare.loadEffect(myEffect, target)
end


return M
