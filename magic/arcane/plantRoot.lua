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

local staticObjects = require("magic.arcane.staticObjects")
local effectScaling = require("magic.arcane.effectScaling")
local M = {}

local howManySecondsUntilFullSpeed = 10

function M.getSpeed(user, target, spell, earthTrap)
    local scaling = effectScaling.getEffectScaling(user, target, spell, earthTrap)
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
        positionToCheck = target.target.pos
    elseif target.category == "item" then
        positionToCheck = target.position
    elseif target.category == "position" then
        positionToCheck = target.target
    end
return positionToCheck
end

local function plantCreation(user, target, spell, item)
    local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
    local plantID = 3644
    local wear = staticObjects.getWearBasedOnDuration(user, target, spell)
    local scaling = effectScaling.getEffectScaling(user, target, spell)
    local field = M.getField(target)
        if not field then
            return
        end
        if item then
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

function M.createEntanglingPlant(user, targets, spell)
local Orl = runes.checkSpellForRuneByName("Orl", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local Luk = runes.checkSpellForRuneByName("Luk", spell)

    if Orl then --To prevent overlap of plant and trap, trap as the stronger one takes priority. Trap will instead get plant graphic if this rune is used.
        return
    end

    if not (SOLH and Luk) then
        return
    end

    for _, target in pairs(targets.targets) do
        plantCreation(user, target, spell)
    end

    for _, item in pairs(targets.items) do
        plantCreation(user, item, spell, true)
    end

    for _, pos in pairs(targets.positions) do
        plantCreation(user, pos, spell)
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
    for _, target in pairs(targets.targets) do
        if SOLH then
            local getSpeed = M.getSpeed(user, target, spell, earthTrap)
            if not getSpeed then
                return
            end
            local foundEffect, myEffect = target.effects:find(16)
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
    end
end

function M.addEffect(myEffect, target)
    local foundSpeed, speed = myEffect:findValue("speed")
        if foundSpeed then
            target.speed = target.speed - (speed/100) --Divided by 100 because speed is a percentage value due to it being stored as integers.
        end
    end

    function M.callEffect(myEffect, target)
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        local foundTicks, ticks = myEffect:findValue("ticks")
        if foundRemainingSpeed and foundTicks then
            if remainingSpeed > 0 then
                local speedIncrease = (remainingSpeed/100)/ticks
                target.speed = target.speed + speedIncrease
                myEffect:addValue("ticks", ticks-1)
                myEffect:addValue("speed", target.speed)
                myEffect:addValue("remainingSpeed", remainingSpeed-(remainingSpeed/ticks))
                myEffect.nextCalled = 10
                return true
            end
        end
        return false
    end

    function M.loadEffect(myEffect, target)
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            if remainingSpeed > 0 then
                target.speed = target.speed - ((remainingSpeed)/100)
                myEffect.nextCalled = 10
            end
        end
    end

return M
