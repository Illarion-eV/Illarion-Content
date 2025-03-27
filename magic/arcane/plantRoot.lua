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
local lookat = require("base.lookat")
local antiTroll = require("magic.base.antiTroll")
local M = {}

local howManySecondsUntilFullSpeed = 90

M.plantRootTexts = {
    name = {
        english = "Entangling Plant",
        german = "Schlingpflanze"},
    description = {
        english = "Upon closer inspection, you may notice the leaves of the plant having a magical looking glow to them.",
        german = "Bei genauerer Betrachtung stellst du fest, dass die Blätter der Pflanze ein magisches Leuchten abgeben."},
    entangled = {
        english = "Stepping onto the plant, yo uare entangled by its vines, slowing you down.",
        german = "Als du auf die Pflanze trittst wirst du von ihren Ranken umschlungen und wirst langsamer."
    }
}

function M.getSpeed(user, target, spell, earthTrap)
    local scaling
    if earthTrap then
        scaling = earthTrap:getData("scaling")
    else
        scaling = effectScaling.getEffectScaling(user, target, spell)
    end
    local retVal = 0.5
    local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
    local URA = runes.checkSpellForRuneByName("URA", spell)
    local YEG = runes.checkSpellForRuneByName("YEG", spell)
    local LHOR = runes.checkSpellForRuneByName("LHOR", spell)
    local QWAN = runes.checkSpellForRuneByName("QWAN", spell)
    local rune
        if TAUR then
            rune = "TAUR"
        elseif URA then
            rune = "URA"
        elseif YEG then
            rune = "YEG"
        end
    local raceBonus
        if rune then
            raceBonus = magicDamage.checkIfRaceBonus(target, rune)
        end
        if raceBonus then
            retVal = retVal + 0.1
        end
        if QWAN then
            retVal = retVal + 0.2
        end
        retVal = retVal*100
        retVal = math.floor(retVal*scaling)

        if retVal <= 0 then
            retVal = 0.1 -- A minimum of 0.1 no matter how high the enemies magic resist is, so it at least has some impact
        end

        if LHOR then
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

    if target.pos then
        positionToCheck = target.pos
    else
        positionToCheck = target
    end

    return positionToCheck
end

local function plantCreation(user, target, spell, item, level)
    local LHOR = runes.checkSpellForRuneByName("LHOR", spell)
    local plantID = 3644
    local wear = staticObjects.getWearBasedOnDuration(user, target, spell)
    local scaling = effectScaling.getEffectScaling(user, target, spell)
    local field = M.getField(target)
        if not field or not antiTroll.passesAntiTrollCheck(target) then
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
        local plant = world:createItemFromId(plantID, 1, myPosition, true, 999, {["illusion"] = tostring(LHOR), ["scaling"] = scaling, ["spell"] = spell, ["level"] = level})
        plant.wear = wear
        lookat.SetSpecialName(plant, M.plantRootTexts.name.german, M.plantRootTexts.name.english)
        lookat.SetSpecialDescription(plant, M.plantRootTexts.description.german, M.plantRootTexts.description.english)
        world:changeItem(plant)
end

function M.createEntanglingPlant(user, targets, spell, level)
    local ORL = runes.checkSpellForRuneByName("ORL", spell)
    local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    local LUK = runes.checkSpellForRuneByName("LUK", spell)

    if ORL then --To prevent overlap of plant and trap, trap as the stronger one takes priority. Trap will instead get plant graphic if this rune is used.
        return
    end

    if not (SOLH and LUK) then
        return
    end

    for _, target in pairs(targets.targets) do
        plantCreation(user, target, spell, false, level)
    end

    for _, item in pairs(targets.items) do
        plantCreation(user, item, spell, true, level)
    end

    for _, pos in pairs(targets.positions) do
        plantCreation(user, pos, spell, false, level)
    end
end

function M.applyPlantRootForEntanglingPlant(sourceItem, target)
    local spell = tonumber(sourceItem:getData("spell"))
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
        myEffect:addValue("spell", spell)
        target.effects:addEffect(myEffect)
    else
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            if getSpeed < remainingSpeed then
                return -- existing slow is already greater than the one that would be applied.
            end
            myEffect:addValue("speed", getSpeed - remainingSpeed)
            myEffect:addValue("remainingSpeed", getSpeed)
            myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
            myEffect:addValue("spell", spell)
            M.addEffect(myEffect, target)
        end
    end
    target:inform(M.plantRootTexts.entangled.german, M.plantRootTexts.entangled.english)
end

function M.applyPlantRoot(user, targets, spell, earthTrap)
    local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    local QWAN = runes.checkSpellForRuneByName("QWAN", spell)
    local SIH = runes.checkSpellForRuneByName("SIH", spell)
    local TAH = runes.checkSpellForRuneByName("TAH", spell)
    local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
    local URA = runes.checkSpellForRuneByName("URA", spell)
    local YEG = runes.checkSpellForRuneByName("YEG", spell)
    local rune

    if TAUR then
        rune = "TAUR"
    elseif URA then
        rune = "URA"
    elseif YEG then
        rune = "YEG"
    end

    for _, target in pairs(targets.targets) do
        local myEffectNumber = 16
        local TahEffectNumber = 28
        local userEffectNumber = 31
        if TAH then
            myEffectNumber = TahEffectNumber
        end
        local raceBonus
        if rune then
            raceBonus = magicDamage.checkIfRaceBonus(target, rune)
        end
        local getSpeed = M.getSpeed(user, target, spell, earthTrap)
        if SOLH then
            if not getSpeed then
                return
            end
            local foundEffect, myEffect = target.effects:find(myEffectNumber)
            if not foundEffect then
                myEffect = LongTimeEffect(myEffectNumber, 10)
                myEffect:addValue("speed", getSpeed)
                myEffect:addValue("remainingSpeed", getSpeed)
                myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                myEffect:addValue("spell", spell)
                target.effects:addEffect(myEffect)
            else
                local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
                if foundRemainingSpeed then
                        if getSpeed < remainingSpeed then
                            return -- existing slow is already greater than the one that would be applied.
                        end
                    myEffect:addValue("speed", getSpeed - remainingSpeed)
                    myEffect:addValue("remainingSpeed", getSpeed)
                    myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                    myEffect:addValue("spell", spell)
                    M.addEffect(myEffect, target)
                end
            end
        end
        if SIH and not TAH and SOLH then
            local amountStolen = 20  -- 20% stolen of speed taken from target
                if QWAN then
                    amountStolen = amountStolen + 5
                end
                if raceBonus then
                    amountStolen = amountStolen + 5
                end
            local mySpeed = (getSpeed/100)*amountStolen
            local foundUserEffect, userEffect = user.effects:find(userEffectNumber)
            if not foundUserEffect then
                userEffect = LongTimeEffect(userEffectNumber, 10)
                userEffect:addValue("speed", mySpeed)
                userEffect:addValue("remainingSpeed", mySpeed)
                userEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                userEffect:addValue("spell", spell)
                userEffect:addValue("user", 1)
                user.effects:addEffect(userEffect)
            else
                local foundRemainingSpeed, remainingSpeed = userEffect:findValue("remainingSpeed")
                if foundRemainingSpeed then
                    if mySpeed < remainingSpeed then
                        return -- existing slow is already greater than the one that would be applied.
                    end
                    userEffect:addValue("speed", mySpeed - remainingSpeed)
                    userEffect:addValue("remainingSpeed", mySpeed)
                    userEffect:addValue("ticks", howManySecondsUntilFullSpeed)
                    userEffect:addValue("spell", spell)
                    userEffect:addValue("user", 1)
                    M.addEffect(userEffect, user)
                end
            end
        end
    end
end

function M.addEffect(myEffect, target)
    local TAH
    local SOLH
    local SIH
    local KAH
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")

    if foundUser then
        if 1 == isUser then
            SIH = true
        end
    end
    if foundSpell then
        TAH = runes.checkSpellForRuneByName("TAH", spell)
        SOLH = runes.checkSpellForRuneByName("SOLH", spell)
        KAH = runes.checkSpellForRuneByName("KAH", spell)
    end

    if KAH and SOLH then
        return --KAH makes it a friendly feeding spell so no slow applied
    end

    local foundSpeed, speed = myEffect:findValue("speed")
    if foundSpeed then
        local speedChange = speed/100 --Divided by 100 because speed is a percentage value due to it being stored as integers.
        if TAH and SOLH then
            speedChange = -speedChange/5 --20% speed given
        end
        if SIH then
            speedChange = -speedChange
        end
        target:inform("Als du von dem Zauber getroffen wirst, fühlst du dich langsamer, als wären deine Füße von Schlamm bedeckt, der dich hinabzieht.", "As you're hit by the spell, you feel yourself slow down as if your feet are covered in mud that's dragging you down.")
        target.speed = target.speed - speedChange
    end
end

function M.callEffect(myEffect, target)
    local TAH
    local SOLH
    local SIH
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
        if foundSpell then
            TAH = runes.checkSpellForRuneByName("TAH", spell)
            SOLH = runes.checkSpellForRuneByName("SOLH", spell)
        end
        if foundUser then
            if 1 == isUser then
                SIH = true
            end
        end
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        local foundTicks, ticks = myEffect:findValue("ticks")
        if foundRemainingSpeed and foundTicks  then
            if ticks >= 1 then
                local speedIncrease = math.floor(remainingSpeed/ticks)
                if remainingSpeed > 0 then
                local newRemainingSpeed
                    if remainingSpeed/ticks < 1 and ticks == 1 then
                        local speedChange = remainingSpeed/100
                        if TAH and SOLH then
                            speedChange = -speedChange/5 --20% speed given
                        end
                        if SIH then
                            speedChange = -speedChange
                        end
                        target.speed = target.speed + speedChange
                        newRemainingSpeed = 0
                    elseif remainingSpeed/ticks > 1 then
                        local speedChange = speedIncrease/100
                        if TAH and SOLH then
                            speedChange = -speedChange/5 --20% speed given
                        end
                        if SIH then
                            speedChange = -speedChange
                        end
                        target.speed = target.speed + speedChange
                        newRemainingSpeed = remainingSpeed - speedIncrease
                    else
                        newRemainingSpeed = remainingSpeed
                    end
                    myEffect:addValue("remainingSpeed", newRemainingSpeed)
                    myEffect:addValue("ticks", ticks-1)
                    myEffect.nextCalled = 10
                    return true
                end
            end
        end
        target:inform("Deine Füße fühlen sich wieder leichter an, als die Wirkung des Zaubers, von dem du zuvor getroffen wurdest, nachlässt.", "Your feet feel lighter once more as the effect of the spell you were previously hit by wears off.")
    return false
end

function M.callEffect(myEffect, target)
    local TAH
    local SOLH
    local SIH
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
    if foundSpell then
        TAH = runes.checkSpellForRuneByName("TAH", spell)
        SOLH = runes.checkSpellForRuneByName("SOLH", spell)
    end
    if foundUser then
        if 1 == isUser then
            SIH = true
        end
    end
    local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
    local foundTicks, ticks = myEffect:findValue("ticks")
    if foundRemainingSpeed and foundTicks  then
        if ticks >= 1 then
            local speedIncrease = math.floor(remainingSpeed/ticks)
            if remainingSpeed > 0 then
            local newRemainingSpeed
                if remainingSpeed/ticks < 1 and ticks == 1 then
                    local speedChange = remainingSpeed/100
                    if TAH and SOLH then
                        speedChange = -speedChange/5 --20% speed given
                    end
                    if SIH then
                        speedChange = -speedChange
                    end
                    target.speed = target.speed + speedChange
                    newRemainingSpeed = 0
                elseif remainingSpeed/ticks > 1 then
                    local speedChange = speedIncrease/100
                    if TAH and SOLH then
                        speedChange = -speedChange/5 --20% speed given
                    end
                    if SIH then
                        speedChange = -speedChange
                    end
                    target.speed = target.speed + speedChange
                    newRemainingSpeed = remainingSpeed - speedIncrease
                else
                    newRemainingSpeed = remainingSpeed
                end
                myEffect:addValue("remainingSpeed", newRemainingSpeed)
                myEffect:addValue("ticks", ticks-1)
                myEffect.nextCalled = 10
                return true
            end
        end
    end
    return false
end

function M.loadEffect(myEffect, target)
    local TAH
    local SOLH
    local SIH
    local foundUser, isUser = myEffect:findValue("user")
    local foundSpell, spell = myEffect:findValue("spell")
        if foundSpell then
            TAH = runes.checkSpellForRuneByName("TAH", spell)
            SOLH = runes.checkSpellForRuneByName("SOLH", spell)
        end
        if foundUser then
            if 1 == isUser then
                SIH = true
            end
        end
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            if remainingSpeed > 0 then
                local speedChange = remainingSpeed/100
                if TAH and SOLH then
                    speedChange = -speedChange/5 --20% speed given
                end
                if SIH then
                    speedChange = -speedChange
                end
                target.speed = target.speed - speedChange
                myEffect.nextCalled = 10
            end
        end
    end

return M
