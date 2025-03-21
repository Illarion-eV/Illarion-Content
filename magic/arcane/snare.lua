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

local M = {}

function M.getSpeed(user, target, spell, JUS, SOLH, ORL, earthTrap)
local retVal = 0
local scaling
local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
local URA = runes.checkSpellForRuneByName("URA", spell)
local YEG = runes.checkSpellForRuneByName("YEG", spell)
local LHOR = runes.checkSpellForRuneByName("LHOR", spell)
local QWAN = runes.checkSpellForRuneByName("QWAN", spell)
local SUL = runes.checkSpellForRuneByName("SUL", spell)
local rune

    if earthTrap then
        scaling = earthTrap:getData("scaling")
    else
        scaling = effectScaling.getEffectScaling(user, target, spell)
    end

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

    if JUS then
        retVal = 0.5
    elseif SOLH then -- JUS only has one speed spell, while SOLH has multiple, hence SOLH is lower so the spell won't be too strong on its own.
        retVal = 0.3
    end

    if raceBonus and (JUS or SOLH) then
        retVal = retVal + 0.1
    end

    if ORL and JUS then
        retVal = retVal - 0.2
    end

    if SOLH and QWAN then
        retVal = retVal + 0.1
    end

    if SOLH and SUL then
        retVal = retVal + 0.2
    end

    retVal = retVal*100 -- because LTE's store values as integers

    retVal = math.floor(retVal*scaling)

    if LHOR and SOLH then
        retVal = false
    end
return retVal
end

function M.applySnare(user, targets, spell, ORL, earthTrap, level)
local SUL = runes.checkSpellForRuneByName("SUL", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local SIH = runes.checkSpellForRuneByName("SIH", spell)
local QWAN = runes.checkSpellForRuneByName("QWAN", spell)
local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
local URA = runes.checkSpellForRuneByName("URA", spell)
local YEG = runes.checkSpellForRuneByName("YEG", spell)
local TAH = runes.checkSpellForRuneByName("TAH", spell)
local rune
    if TAUR then
        rune = "TAUR"
    elseif URA then
        rune = "URA"
    elseif YEG then
        rune = "YEG"
    end
local ticks = 10
    for _, target in pairs(targets.targets) do
        if SUL and (SOLH or JUS) then
            local getSpeed = M.getSpeed(user, target, spell, JUS, SOLH, ORL, earthTrap)
            if not getSpeed then
                return
            end
            local raceBonus
            local myEffectNumber = 15
            local TahEffectNumber = 27
            local userEffectNumber = 30
            if TAH then
                myEffectNumber = TahEffectNumber
            end
            if rune then
                raceBonus = magicDamage.checkIfRaceBonus(target, rune)
            end
            local foundEffect, myEffect = target.effects:find(myEffectNumber)
            if not foundEffect then
                myEffect = LongTimeEffect(myEffectNumber, 10)
                myEffect:addValue("speed", getSpeed)
                myEffect:addValue("remainingSpeed", getSpeed)
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
                    myEffect:addValue("remainingSpeed", getSpeed)
                    myEffect:addValue("ticks", ticks)
                    myEffect:addValue("level", level)
                    M.addEffect(myEffect, target)
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
                    userEffect:addValue("ticks", ticks)
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
                        userEffect:addValue("ticks", ticks)
                        userEffect:addValue("spell", spell)
                        userEffect:addValue("user", 1)
                        M.addEffect(userEffect, user)
                    end
                end
            end
        end
    end
end

function M.addEffect(myEffect, target)
    log("Magic testing: "..tostring(target.name).."'s speed before application of snare: "..tostring(target.speed))
local TAH
local SOLH
local SIH
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
        target.speed = target.speed - speedChange
    end
    log("Magic testing: "..tostring(target.name).."'s speed after application of snare: "..tostring(target.speed))
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
    log("Magic testing: "..tostring(target.name).."'s speed after last call of snare: "..tostring(target.speed))
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
