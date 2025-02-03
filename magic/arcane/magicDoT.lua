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

local texts = {
    burn = {english = "You've been inflicted with a magical burn, causing you to suffer fire damage over time.", german = "Dir wurde eine magische Verbrennung zugefügt, du erleidest mit der Zeit Feuerschaden."},
    frostburn = {english = "You've been inflicted with a magical frostburn, causing you to suffer frost damage over time.", german = "Du wurdest mit einem magischen Frostbrand belegt, der dir über Zeit Frostschaden zufügt."},
    }

function M.dealMagicDoT(user, targets, spell, element, level)
    for _, target in pairs(targets.targets) do

        if isValidChar(target) and target.position ~= user.pos then
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
                DoT:addValue("remainingTicks", 15)
                DoT:addValue("spell", spell)
                DoT:addValue("level", level)
                if not foundEffect then
                    target.effects:addEffect(DoT)
                end

                if runes.checkSpellForRuneByName("Sih", spell) and CUN then
                    local lifesteal = LongTimeEffect(3, 10)
                    lifesteal:addValue("remainingDamage", damage)
                    lifesteal:addValue("remaininingTicks", 15)
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
                MoT:addValue("remainingTicks", 15)
                MoT:addValue("spell", spell)
                MoT:addValue("level", level)
                if not foundEffect3 then
                    target.effects:addEffect(MoT)
                end
            end
            if foodReduction > 0 and CUN then
                local foundEffect4 = target.effects:find(10)
                local SoT = LongTimeEffect(10,10)
                SoT:addValue("remainingStaminaReduction", foodReduction)
                SoT:addValue("remainingTicks", 15)
                SoT:addValue("spell", spell)
                SoT:addValue("level", level)
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
    local frostburn
    if foundspell then
        burn = runes.checkSpellForRuneByName("RA", spell)
        frostburn = runes.checkSpellForRuneByName("CUN", spell)
    end
    if burn then
        target:inform(texts.burn.german, texts.burn.english)
    elseif frostburn then
        target:inform(texts.frostburn.german, texts.frostburn.english)
    end
end

function M.callEffect(myEffect, target)
    local foundSpell, spell = myEffect:findValue("spell")
    local foundDamage, remainingDamage =  myEffect:findValue("remainingDamage")
    local foundTicks, remainingTicks =  myEffect:findValue("remainingTicks")
    local foundLevel, level =  myEffect:findValue("level")
    if not foundLevel then
        level = 0
    end
    local Luk = runes.checkSpellForRuneByName("Luk", spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    if foundDamage and foundTicks and foundSpell then
        if remainingTicks > 0 then
            local damage = math.floor(remainingDamage/remainingTicks)
            if Luk and CUN then
                if remainingTicks == 1 then
                    damage = remainingDamage --ensure the last bit is dealt in one go when one tick is left
                else
                    damage = math.floor(remainingDamage/5) -- 20, 36, 48.8, 59.04, etc of the total damage done with each tick instead of the usual 6.66% per tick
                end
            end
            mdamage.dealMagicDamage(nil, target, spell, damage, level, true)
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
    local frostburn = runes.checkSpellForRuneByName("CUN", spell)
    if found then
        if ticks > 0 then
            if burn then
                target:inform(texts.burn.german, texts.burn.english)
            elseif frostburn then
                target:inform(texts.frostburn.german, texts.frostburn.english)
            end
            myEffect.nextCalled=10
        end
    end
end

return M
