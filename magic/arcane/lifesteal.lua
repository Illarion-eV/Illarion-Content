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

local character = require("base.character")
local runes = require("magic.arcane.runes")
local magicDamage = require("magic.arcane.magicDamage")
local effectScaling = require("magic.arcane.effectScaling")
local texts = require("magic.arcane.base.texts")

local M = {}

function M.instantLifeOrManaSteal(user, targets, spell, Orl)
local JUS = runes.checkSpellForRuneByName("JUS", spell)
local Ira = runes.checkSpellForRuneByName("Ira", spell)
local Sih = runes.checkSpellForRuneByName("Sih", spell)
local Yeg = runes.checkSpellForRuneByName("Yeg", spell)
local Ura = runes.checkSpellForRuneByName("Ura", spell)
local Taur = runes.checkSpellForRuneByName("Taur", spell)
local rune
    if Yeg then
        rune = "Yeg"
    elseif Taur then
        rune = "Taur"
    elseif Ura then
        rune = "Ura"
    end
local amountStolen = 500

    for _, target in pairs(targets.targets) do
        local scaling = effectScaling.getEffectScaling(user, target, spell)
        amountStolen = amountStolen*scaling
        if JUS then
            if rune then
                if magicDamage.checkIfRaceBonus(target, rune) then
                    amountStolen = amountStolen + (amountStolen/2)
                end
            end
            if Orl then
                amountStolen = amountStolen/2
            end
            if Sih then
                character.ChangeHP(user, amountStolen)
                character.ChangeHP(target, -amountStolen)
                user:inform(texts.lifestealTexts.health.german, texts.lifestealTexts.health.english)
            end
            if Ira then
                if target:increaseAttrib("mana", 0) > amountStolen then
                    target:increaseAttrib("mana", -amountStolen)
                else
                    target:increaseAttrib("mana", 0)
                end
                user:increaseAttrib("mana", amountStolen)
                user:inform(texts.lifestealTexts.mana.german, texts.lifestealTexts.mana.english)
            end
        end
    end
end


function M.addEffect(myEffect, target)
    target:inform(texts.lifestealTexts.overTime.german, texts.lifestealTexts.overTime.english)
end

function M.callEffect(myEffect, target)
    local foundDamage, remainingDamage =  myEffect:findValue("remainingDamage")
    local foundTicks, remainingTicks =  myEffect:findValue("remainingTicks")
    if foundDamage and foundTicks then
        if remainingTicks > 0 then
            local damage = math.floor(remainingDamage/remainingTicks)
            local lifesteal = damage/20 -- 5%
            character.ChangeHP(target, lifesteal)
            myEffect:addValue("remainingDamage", remainingDamage - damage)
            myEffect:addValue("remainingTicks", remainingTicks - 1)
            myEffect.nextCalled = 30
            return true
        end
    end
return false
end

function M.loadEffect(myEffect, target)
    local found, ticks = myEffect:findValue("remainingTicks")
    if found then
        if ticks > 0 then
            myEffect.nextCalled=10
        end
    end
end

return M
