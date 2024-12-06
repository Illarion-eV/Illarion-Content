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

local function getDuration(user, spell, target, earthTrap)
local scaling
    if earthTrap then
        scaling = earthTrap:getData("scaling")
    else
        scaling = effectScaling.getEffectScaling(user, target, spell)
    end
local numberOfSeconds = 10
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
    local raceBonus
    if rune then
        raceBonus = magicDamage.checkIfRaceBonus(target, rune)
    end
    if Qwan then
        numberOfSeconds = numberOfSeconds + 5
    end
    if raceBonus then
        numberOfSeconds = numberOfSeconds + 5
    end
return numberOfSeconds*scaling
end

function M.applyManaStalling(user, targets, spell, earthTrap)
local Ira = runes.checkSpellForRuneByName("Ira", spell)
local SOLH = runes.checkSpellForRuneByName("SOLH", spell)
local Lhor = runes.checkSpellForRuneByName("Lhor", spell)
    if Lhor then
        return
    end
    if Ira and SOLH then
        for _, target in pairs(targets.targets) do
            local duration = getDuration(user, spell, target, earthTrap)
            local foundEffect, myEffect = target.effects:find(17)
            if not foundEffect then
                myEffect = LongTimeEffect(17, 10)
                myEffect:addValue("seconds", duration)
                target.effects:addEffect(myEffect)
            else
                myEffect:addValue("seconds", duration)
            end
        end
    end
end

function M.addEffect(myEffect, target)
    target:setQuestProgress(246, 1)
end


function M.callEffect(myEffect, target)
    local foundSeconds, seconds = myEffect:findValue("seconds")
    if foundSeconds then
        if seconds > 0 then
            myEffect:addValue("seconds", seconds-1)
            myEffect.nextCalled = 10
            return true
        end
    end
    return false
end

function M.loadEffect(myEffect, target)
local foundSeconds, seconds = myEffect:findValue("seconds")
    if foundSeconds then
        if seconds > 0 then
            myEffect:addValue("seconds", seconds-1)
            myEffect.nextCalled = 10
        end
    end
end

function M.removeEffect(myEffect, target)
    target:setQuestProgress(246, 0)
end
return M
