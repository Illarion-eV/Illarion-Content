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

local shared = require("magic.nature.shared")
local testing = require("base.testing")

local M = {}

function M.getSpeed(user, target, spellName)

    local retVal = 0.4
    retVal = shared.scaleEffect(user, spellName, retVal, target)

    if retVal <= 0 then
        retVal = 0.1 -- A minimum of 0.1 no matter how high the enemies resist is, so it at least has some impact
    end

    retVal = retVal*100 -- because LTE's store values as integers

    return math.floor(retVal)
end

function M.addEffect(myEffect, target)

    local foundSpeed, speed = myEffect:findValue("speed")
    if foundSpeed then
        local speedChange = speed / 100 -- Convert from int % to float

        local formerSpeed = target.speed
        local newSpeed = math.max(0.01, formerSpeed - speedChange)
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
                "#me was entangled. Speed changed from " .. formerSpeed ..
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
                    target:talk(Character.say,"#me's entangle ticked to "..target.speed.." from "..formerSpeed..". This was the last tick.")
                end

            else

                local formerSpeed = target.speed
                local speedChange = speedIncrease/100

                target.speed = target.speed + speedChange

                if testing.active then
                    target:talk(Character.say,"#me's entangle ticked to "..target.speed.." from "..formerSpeed)
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
        target:inform("Die verschlingenden Wurzeln, die dich verlangsamt haben, lösen schließlich ihren Griff um deine Beine und erlauben dir, dich wieder normal zu bewegen.", "The entangling roots that were slowing you down finally loosen their hold on your legs, allowing you to move normally again.")
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
                target:talk(Character.say,"#me was entangled and had their speed set to "..target.speed.." with a former speed of "..formerSpeed)
            end

            myEffect.nextCalled = 10
        end
    end
end

function M.effect(user, location, target)

    world:gfx(58, location)
    world:makeSound(13, location)

    local ticks = 120

    local getSpeed = M.getSpeed(user, target, "Entangwynt")

    if not getSpeed then
        return
    end

    local myEffectNumber = 38

    local foundEffect, myEffect = target.effects:find(myEffectNumber)

    if not foundEffect then
        myEffect = LongTimeEffect(myEffectNumber, 10)
        myEffect:addValue("speed", getSpeed)
        myEffect:addValue("ticks", ticks)
        target.effects:addEffect(myEffect)
    else
        local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
        if foundRemainingSpeed then
            if getSpeed < remainingSpeed then
                return -- existing slow is already greater than the one that would be applied.
            end
            myEffect:addValue("speed", getSpeed - remainingSpeed)
            myEffect:addValue("ticks", ticks)
            M.addEffect(myEffect, target)
        end
    end
end

function M.checksToPass(user, location, target)
    return true
end

return M
