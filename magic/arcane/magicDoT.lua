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

local mdamage = require("magic.arcane.dealMagicDamage")
local magicDamage = require("magic.arcane.magicDamage")
local runes = require("magic.arcane.runes")
local manaStaminaReduction = require("magic.arcane.manaStaminaReduction")

local M = {}

function M.dealMagicDoT(user, targets, spell, element)
    for _, target in pairs(targets.targets) do
        if target.position ~= user.pos then
            local damage = magicDamage.getMagicDamage(user, spell, element, target, true)
            local manaReduction = 0
            local foodReduction = 0
            local CUN = runes.checkSpellForRuneByName("CUN", spell)
            local Ira = runes.checkSpellForRuneByName("Ira", spell)
            local Kah = runes.checkSpellForRuneByName("Kah", spell)
            if Ira then
                manaReduction = manaStaminaReduction.getManaToReduce(user, target, spell)
            end
            if Kah then
                foodReduction = manaStaminaReduction.getStaminaToReduce(user, target, spell)
            end
            if damage > 0 then
                local foundEffect = target.effects:find(1)
                local foundEffect2 = target.effects:find(3)
                local DoT = LongTimeEffect(1,10)
                DoT:addValue("remainingDamage", damage)
                DoT:addValue("remainingTicks", 5)
                DoT:addValue("spell", spell)
                if not foundEffect then
                    target.effects:addEffect(DoT)
                end

                if runes.checkSpellForRuneByName("Sih", spell) and CUN then
                    local lifesteal = LongTimeEffect(3, 10)
                    lifesteal:addValue("remainingDamage", damage)
                    lifesteal:addValue("remaininingTicks", 5)
                    lifesteal:addValue("spell", spell)
                    if not foundEffect2 then
                        user.effects:addEffect(lifesteal)
                    end
                end
            end
            if manaReduction > 0 and CUN then
                local foundEffect3 = target.effects:find(9)
                local MoT = LongTimeEffect(9,10)
                MoT:addValue("remainingManaReduction", manaReduction)
                MoT:addValue("remainingTicks", 5)
                MoT:addValue("spell", spell)
                if not foundEffect3 then
                    target.effects:addEffect(MoT)
                end
            end
            if foodReduction > 0 and CUN then
                local foundEffect4 = target.effects:find(10)
                local SoT = LongTimeEffect(10,10)
                SoT:addValue("remainingStaminaReduction", foodReduction)
                SoT:addValue("remainingTicks", 5)
                SoT:addValue("spell", spell)
                if not foundEffect4 then
                    target.effects:addEffect(SoT)
                end
            end
        end
    end
end

function M.addEffect(myEffect, target)
    local foundspell, spell = myEffect:findValue("spell")
    local burn
    local poison
    if foundspell then
        burn = runes.checkSpellForRuneByName("RA", spell)
        poison = runes.checkSpellForRuneByName("CUN", spell)
    end
    if burn then
        target:inform("","You've been inflicted with a magical burn, causing you to suffer fire damage over time.")
    elseif poison then
        target:inform("","You've been inflicted with a magical poison, causing you to suffer poisonous damage over time.")
    end
end

function M.callEffect(myEffect, target)
    local foundSpell, spell = myEffect:findValue("spell")
    local foundDamage, remainingDamage =  myEffect:findValue("remainingDamage")
    local foundTicks, remainingTicks =  myEffect:findValue("remainingTicks")
    local Luk = runes.checkSpellForRuneByName("Luk", spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    if foundDamage and foundTicks and foundSpell then
        if remainingTicks > 0 then
            local damage = math.floor(remainingDamage/remainingTicks)
            if Luk and CUN then
                damage = math.floor(remainingDamage/2)
            end
            mdamage.dealMagicDamage(nil, target, spell, damage)
            myEffect:addValue("remainingDamage", remainingDamage - damage)
            myEffect:addValue("remainingTicks", remainingTicks - 1)
            myEffect.nextCalled=30
            return true
        end
    end
return false
end

function M.loadEffect(myEffect, target)
    local found, ticks = myEffect:findValue("remainingTicks")
    local _, spell = myEffect:findValue("spell")
    local burn = runes.checkSpellForRuneByName("RA", spell)
    local poison = runes.checkSpellForRuneByName("CUN", spell)
    if found then
        if ticks > 0 then
            if burn then
                target:inform("","You've been inflicted with a magical burn, causing you to suffer fire damage over time.")
            elseif poison then
                target:inform("","You've been inflicted with a magical poison, causing you to suffer poisonous damage over time.")
            end
            myEffect.nextCalled=10
        end
    end
end

return M
