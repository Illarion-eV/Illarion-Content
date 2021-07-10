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

local M = {}

function M.getSpeed(target, spell, JUS, SOLH, Orl)
local retVal = 0
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
local raceBonus
    if rune then
        raceBonus = magicDamage.checkIfRaceBonus(target, rune)
    end
    if JUS then
        retVal = 0.3
    elseif SOLH then
        retVal = 0.5
    end
    if raceBonus and JUS then
        retVal = retVal + 0.1
    end
    if Orl and JUS then
        retVal = retVal - 0.2
    end
return retVal
end

function M.applySnare(targets, spell, Orl)
local Sul = runes.checkSpellForRuneByName("Sul", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local myEffect = LongTimeEffect(15, 10)
local howManySecondsUntilFullSpeed = 10
    for _, target in pairs(targets) do
        if target.category == "character" and Sul and (SOLH or JUS) then
            local getSpeed = M.getSpeed(target.target, spell, JUS, SOLH, Orl)
            target.target.effects:addEffect(myEffect)
            myEffect:addValue("speed", getSpeed)
            myEffect:addValue("remainingSpeed", getSpeed)
            myEffect:addValue("ticks", howManySecondsUntilFullSpeed)
        end
    end
end

function M.addEffect(myEffect, target)
local foundSpeed, speed = myEffect:findValue("speed")
    if foundSpeed then
        target.speed = target.speed - speed
    end
end

function M.callEffect(myEffect, target)
    local foundRemainingSpeed, remainingSpeed = myEffect:findValue("remainingSpeed")
    local foundTicks, ticks = myEffect:findValue("ticks")
    if foundRemainingSpeed and foundTicks then
        if remainingSpeed > 0 then
            target.speed = target.speed + remainingSpeed/ticks
            myEffect:addValue("speed", target.speed)
            myEffect.nextCalled = 10
            return true
        end
    end
    return false
end

function M.loadEffect(myEffect, target)
    local foundSpeed, speed = myEffect:findValue("speed")
    if foundSpeed then
        target.speed = speed
    end
    if target.speed < 1 then
        myEffect.nextCalled = 10
    end
end

return M
