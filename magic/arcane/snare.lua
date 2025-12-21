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
local effectScaling = require("magic.arcane.effectScaling")
local testing = require("base.testing")

local M = {}

function M.getSpeed(user, target, spell, ORL)

    local retVal = 0.2
    local scaling = effectScaling.getEffectScaling(user, target, spell)
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

    local raceBonus

    if rune then
        raceBonus = magicDamage.checkIfRaceBonus(target, rune)
    end

    if raceBonus then
        retVal = retVal + 0.1
    end

    if ORL then
        retVal = retVal - 0.2
    end

    if retVal <= 0 then
        retVal = 0.1 -- A minimum of 0.1 no matter how high the enemies magic resist is, so it at least has some impact
    end

    retVal = retVal*100 -- because LTE's store values as integers

    retVal = math.floor(retVal*scaling)

    return retVal
end

function M.applySnare(user, targets, spell, ORL, level)

    local SUL = runes.checkSpellForRuneByName("SUL", spell)
    local JUS = runes.checkSpellForRuneByName("JUS", spell)
    local QWAN = runes.checkSpellForRuneByName("QWAN", spell)
    local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
    local URA = runes.checkSpellForRuneByName("URA", spell)
    local YEG = runes.checkSpellForRuneByName("YEG", spell)

    if not JUS or not SUL then
        return
    end

    local racialBonuses = {{name = "TAUR", present = TAUR}, {name = "URA", present = URA}, {name = "YEG", present = YEG}}

    local ticks = 60

    for _, target in pairs(targets.targets) do

        local getSpeed = M.getSpeed(user, target, spell, ORL)

        if not getSpeed then
            return
        end

        local raceBonus
        local myEffectNumber = 15
        local userEffectNumber = 30


        for _, racialBonus in pairs(racialBonuses) do
            local check = magicDamage.checkIfRaceBonus(target, racialBonus.name)
            if racialBonus.present and magicDamage.checkIfRaceBonus(target, racialBonus.name) then
                raceBonus = check
            end
        end

        local foundEffect, myEffect = target.effects:find(myEffectNumber)

        if not foundEffect then
            myEffect = LongTimeEffect(myEffectNumber, 10)
            myEffect:addValue("speed", getSpeed)
            myEffect:addValue("ticks", ticks)
            myEffect:addValue("spell", spell)
            myEffect:addValue("level", level)
            target.effects:addEffect(myEffect)
        else
            local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
            if foundRemainingSpeed then
                if getSpeed < remainingSpeed then
                    return -- existing slow is already greater than the one that would be applied.
                end
                myEffect:addValue("speed", getSpeed - remainingSpeed)
                myEffect:addValue("ticks", ticks)
                myEffect:addValue("level", level)
                M.addEffect(myEffect, target)
            end
        end
    end
end

function M.addEffect(myEffect, target)

    local foundSpeed, speed = myEffect:findValue("speed")
    if foundSpeed then
        local speedChange = speed / 100 -- Convert from int % to float

        local formerSpeed = target.speed
        local newSpeed = math.max(0, formerSpeed - speedChange)
        local actualReduction = formerSpeed - newSpeed
        target.speed = newSpeed

        -- Get existing remainingSpeed, assuming it's stored as int percentage
        local _, existingRemainingRaw = myEffect:findValue("remainingSpeed")
        local existingRemaining = (existingRemainingRaw or 0) / 100

        local totalRemaining = existingRemaining + actualReduction

        -- Store as integer percentage again
        myEffect:addValue("remainingSpeed", math.floor(totalRemaining * 100 + 0.5))

        if testing.active then
            target:talk(Character.say,
                "#me was snared. Speed changed from " .. formerSpeed ..
                " to " .. target.speed ..
                ". Actual reduction: " .. actualReduction ..
                ", Total to recover: " .. totalRemaining)
        end
    end
end

function M.callEffect(myEffect, target)

    local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
    local foundTicks, ticks = myEffect:findValue("ticks")

    if foundRemainingSpeed and foundTicks and ticks >= 1  then

        local speedIncrease = math.ceil(remainingSpeed/ticks)

        if remainingSpeed > 0 then

            local newRemainingSpeed = 0

            if speedIncrease < 1 or ticks == 1 then

                local formerSpeed = target.speed
                local speedChange = remainingSpeed/100

                target.speed = target.speed + speedChange

                if testing.active then
                    target:talk(Character.say,"#me's snare ticked to "..target.speed.." from "..formerSpeed..". This was the last tick.")
                end

            else

                local formerSpeed = target.speed
                local speedChange = speedIncrease/100

                target.speed = target.speed + speedChange

                if testing.active then
                    target:talk(Character.say,"#me's snare ticked to "..target.speed.." from "..formerSpeed)
                end

                newRemainingSpeed = remainingSpeed - speedIncrease
            end

            myEffect:addValue("remainingSpeed", newRemainingSpeed)
            myEffect:addValue("ticks", ticks-1)
            myEffect.nextCalled = 10

            return true
        end
    end

    if target.speed == 1 then
        target:inform("Deine Füße fühlen sich wieder normal an, während die Wirkung des Zaubers, von dem du zuvor getroffen wurdest, nachlässt.", "Your feet feel normal again as the effect of the spell you were previously hit by wears off.")
    end

    return false
end

function M.loadEffect(myEffect, target)

    local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
    if foundRemainingSpeed then
        if remainingSpeed > 0 then
            local speedChange = remainingSpeed/100

            local formerSpeed = target.speed

            target.speed = target.speed - speedChange

            if testing.active then
                target:talk(Character.say,"#me was snared and had their speed set to "..target.speed.." with a former speed of "..formerSpeed)
            end

            myEffect.nextCalled = 10
        end
    end
end

return M
