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

function M.getSpeed(user, target, spell, JUS, SOLH, Orl, earthTrap)
local retVal = 0
local scaling
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
local rune
    if earthTrap then
        scaling = earthTrap:getData("scaling")
    else
        scaling = effectScaling.getEffectScaling(user, target, spell)
    end
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
    if JUS then
        retVal = 0.5
    elseif SOLH then -- JUS only has one speed spell, while SOLH has multiple, hence SOLH is lower so the spell won't be too strong on its own.
        retVal = 0.3
    end
    if raceBonus and (JUS or SOLH) then
        retVal = retVal + 0.1
    end
    if Orl and JUS then
        retVal = retVal - 0.2
    end
    if SOLH and Qwan then
        retVal = retVal + 0.1
    end
    retVal = retVal*100 -- because LTE's store values as integers
    retVal = math.floor(retVal*scaling)
    if Lhor and SOLH then
        retVal = false
    end
return retVal
end

function M.applySnare(user, targets, spell, Orl, earthTrap)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local Sih = runes.checkSpellForRuneByName("Sih", spell)
local Tah = runes.checkSpellForRuneByName("Tah", spell)
local Qwan = runes.checkSpellForRuneByName("Qwan", spell)
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local rune
    if Taur then
        rune = "Taur"
    elseif Ura then
        rune = "Ura"
    elseif Yeg then
        rune = "Yeg"
    end
local ticks = 10
    for _, target in pairs(targets.targets) do
        if Sul and (SOLH or JUS) then
            local getSpeed = M.getSpeed(user, target, spell, JUS, SOLH, Orl)
            if not getSpeed then
                return
            end
            local raceBonus
            if rune then
                raceBonus = magicDamage.checkIfRaceBonus(target, rune)
            end
            if SOLH and Tah then
                getSpeed = -getSpeed
            end
            local foundEffect, myEffect = target.effects:find(15)
            if not foundEffect then
                myEffect = LongTimeEffect(15, 10)
                myEffect:addValue("speed", getSpeed)
                myEffect:addValue("remainingSpeed", getSpeed)
                myEffect:addValue("ticks", ticks)
                target.effects:addEffect(myEffect)
            else
                local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
                if foundRemainingSpeed then
                    myEffect:addValue("speed", getSpeed - remainingSpeed)
                    myEffect:addValue("remainingSpeed", getSpeed)
                    myEffect:addValue("ticks", ticks)
                    M.addEffect(myEffect, target)
                end
            end
            if Sih and not Tah then
                local amountStolen = 10  -- 10% stolen of speed taken from target
                    if Qwan then
                        amountStolen = amountStolen + 5
                    end
                    if raceBonus then
                        amountStolen = amountStolen + 5
                    end
                local mySpeed = (getSpeed/100)*amountStolen
                local foundUserEffect, userEffect = user.effects:find(15)
                if not foundUserEffect then
                    userEffect = LongTimeEffect(15, 10)
                    userEffect:addValue("speed", mySpeed)
                    userEffect:addValue("remainingSpeed", mySpeed)
                    userEffect:addValue("ticks", ticks)
                    user.effects:addEffect(userEffect)
                else
                    local foundRemainingSpeed, remainingSpeed = userEffect:findValue("remainingSpeed")
                    if foundRemainingSpeed then
                        userEffect:addValue("speed", mySpeed - remainingSpeed)
                        userEffect:addValue("remainingSpeed", mySpeed)
                        userEffect:addValue("ticks", ticks)
                        M.addEffect(userEffect, user)
                    end
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
    if foundRemainingSpeed and foundTicks  then
        if ticks >= 1 then
            local speedIncrease = math.floor(remainingSpeed/ticks)
            if remainingSpeed > 0 then
            local newRemainingSpeed
                if remainingSpeed/ticks < 1 or ticks == 0 then
                    target.speed = target.speed + remainingSpeed/100
                    newRemainingSpeed = 0
                else
                    target.speed = target.speed + speedIncrease/100
                    newRemainingSpeed = remainingSpeed - speedIncrease
                end
                myEffect:addValue("remainingSpeed", newRemainingSpeed)
                myEffect.nextCalled = 10
                return true
            end
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
            log("Loaded snare effect, speed is now: "..tostring(target.speed))
        end
    end

end
return M
