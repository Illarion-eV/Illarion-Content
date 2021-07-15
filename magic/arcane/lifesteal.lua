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

    for _, target in pairs(targets) do
        local scaling = effectScaling.getEffectScaling(user, target, spell)
        amountStolen = amountStolen*scaling
        if JUS and target.category == "character" then
            if rune then
                if magicDamage.checkIfRaceBonus(target.target, rune) then
                    amountStolen = amountStolen + (amountStolen/2)
                end
            end
            if Orl then
                amountStolen = amountStolen/2
            end
            if Sih then
                character.ChangeHP(user, amountStolen)
                character.ChangeHP(target.target, -amountStolen)
                user:inform("","You siphon some health from your target.")
            end
            if Ira then
                if target.target:increaseAttrib("mana", 0) > amountStolen then
                    target.target:increaseAttrib("mana", -amountStolen)
                else
                    target.target:increaseAttrib("mana", 0)
                end
                user:increaseAttrib("mana", amountStolen)
                user:inform("","You siphon some mana from your target.")
            end
        end
    end
end


function M.addEffect(myEffect, target)
    target:inform("","You siphon health from your target, recovering your own over time.") -- replace with different inform depending on spell type
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
