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
local castingSpeed = require("magic.arcane.castingSpeed")
local hieros = require("magic.arcane.enchanting.effects.hieros")
local dendron = require("magic.arcane.enchanting.effects.dendron")
local dwyfol = require("magic.arcane.enchanting.effects.dwyfol")
local character = require("base.character")

local M = {}

local texts = {
    burn = {english = "You've been inflicted with a magical burn, causing you to suffer fire damage over time.", german = "Dir wurde eine magische Verbrennung zugefügt, du erleidest mit der Zeit Feuerschaden."},
    frostburn = {english = "You've been inflicted with a magical frostburn, causing you to suffer frost damage over time.", german = "Du wurdest mit einem magischen Frostbrand belegt, der dir über Zeit Frostschaden zufügt."},
    }

function M.dealMagicDoT(user, targets, spell, element, level, castDuration)
    for _, target in pairs(targets.targets) do

        if isValidChar(target) and target.position ~= user.pos then

            local damage = magicDamage.getMagicDamage(user, spell, element, target, true, false, false, castDuration)
            local manaReduction = 0
            local foodReduction = 0
            local CUN = runes.checkSpellForRuneByName("CUN", spell)
            local IRA = runes.checkSpellForRuneByName("IRA", spell)
            local KAH = runes.checkSpellForRuneByName("KAH", spell)

            if damage > 0 and user then
                local hierosApplied, newDamage = hieros.increaseDamage(user, target, damage)

                if hierosApplied then   -- chance to apply extra damage on hit in the form of fire
                    damage = newDamage
                end
            end

            if KAH and IRA then
                damage = damage/2
            end

            if IRA then
                manaReduction = damage
            end

            if KAH then
                foodReduction = damage*6 --There's 10k mana/health but 60k food
            end

            if user and not IRA and (damage > 0) and dwyfol.deflectAttackAsLightning(target, user) then -- This glyph if activated deflects the attack, dealing the same amount they would have taken as magic damage to the attacker instead in the form of a lightning strike
                damage = math.min(damage/1.5, 1000) -- It shouldn't be possible to luck into killing off a max skill chara with a no skill character!
                mdamage.dealMagicDamage(nil, user, spell, damage, level, false, castDuration) --Remove DoT damage bonus and reflect as single time attack
                return
            end

            if damage > 0 and not IRA and not KAH then

                local addValue = true

                local foundEffect, DoT = target.effects:find(1)
                local foundEffect2, lifesteal

                if user then
                    foundEffect2, lifesteal = user.effects:find(3)
                end

                if not foundEffect then
                    DoT = LongTimeEffect(1,10)
                else
                    local foundRemaining, remaining = DoT:findValue("remainingDamage")
                    if foundRemaining then
                        if remaining >= damage then --the DoT refresh wouldnt add value
                            addValue = false
                        end
                    end
                end

                if addValue then
                    DoT:addValue("remainingDamage", damage)
                    DoT:addValue("remainingTicks", 15)
                    DoT:addValue("spell", spell)
                    DoT:addValue("level", level)

                    if user then
                        DoT:addValue("caster", user.id)
                    end
                end

                if not foundEffect then
                    target.effects:addEffect(DoT)
                end

                if addValue and runes.checkSpellForRuneByName("SIH", spell) and CUN then
                    if not foundEffect2 then
                        lifesteal = LongTimeEffect(3, 10)
                    end
                    lifesteal:addValue("remainingDamage", damage)
                    lifesteal:addValue("remaininingTicks", 15)
                    lifesteal:addValue("spell", spell)
                    if not foundEffect2 then
                        user.effects:addEffect(lifesteal)
                    end
                end

                dendron.lifesteal(user, damage/1.5) -- chance to heal for a portion of the damage you deal, but as it is instant the damage is scaled down by 1.5 to match fire spells instead for instant damage values
            end
            if manaReduction > 0 and CUN then

                local addValue = true

                local foundEffect3, MoT = target.effects:find(9)
                if not foundEffect3 then
                    MoT = LongTimeEffect(9,10)
                else
                    local foundRemaining, remaining = MoT:findValue("remainingManaReduction")
                    if foundRemaining then
                        if remaining >= manaReduction then --the DoT refresh wouldnt add value
                            addValue = false
                        end
                    end
                end
                if addValue then
                    MoT:addValue("remainingManaReduction", manaReduction)
                    MoT:addValue("remainingTicks", 15)
                    MoT:addValue("spell", spell)
                    MoT:addValue("level", level)
                end
                if not foundEffect3 then
                    target.effects:addEffect(MoT)
                end
            end
            if foodReduction > 0 and CUN then

                local addValue = true

                local foundEffect4, SoT = target.effects:find(10)
                if not foundEffect4 then
                    SoT = LongTimeEffect(10,10)
                else
                    local foundRemaining, remaining = SoT:findValue("remainingStaminaReduction")
                    if foundRemaining then
                        if remaining >= foodReduction then --the DoT refresh wouldnt add value
                            addValue = false
                        end
                    end
                end

                if addValue then
                    SoT:addValue("remainingStaminaReduction", foodReduction)
                    SoT:addValue("remainingTicks", 15)
                    SoT:addValue("spell", spell)
                    SoT:addValue("level", level)
                end
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

function M.removeEffect(myEffect, target)

    myEffect:addValue("remainingDamage", 0)
    myEffect:addValue("remainingTicks", 0)

end


function M.callEffect(myEffect, target)
    local foundSpell, spell = myEffect:findValue("spell")
    local foundDamage, remainingDamage =  myEffect:findValue("remainingDamage")
    local foundTicks, remainingTicks =  myEffect:findValue("remainingTicks")
    local foundLevel, level =  myEffect:findValue("level")
    local foundCaster, caster =  myEffect:findValue("caster")

    if not foundLevel then
        level = 0
    end

    if not foundCaster then
        caster = 0
    end

    if character.WasKilledRecently(target) then
        return false
    end

    local LUK = runes.checkSpellForRuneByName("LUK", spell)
    local CUN = runes.checkSpellForRuneByName("CUN", spell)
    if foundDamage and foundTicks and foundSpell then
        if remainingTicks > 0 then
            local damage = math.floor(remainingDamage/remainingTicks)
            if LUK and CUN then
                if remainingTicks == 1 then
                    damage = remainingDamage --ensure the last bit is dealt in one go when one tick is left
                else
                    damage = math.floor(remainingDamage/5) -- 20, 36, 48.8, 59.04, etc of the total damage done with each tick instead of the usual 6.66% per tick
                end
            end
            local castDuration = castingSpeed.arcaneSpellCastSpeed(nil, spell, true)
            mdamage.dealMagicDamage(nil, target, spell, damage, level, true, castDuration, caster)
            myEffect:addValue("remainingDamage", remainingDamage - damage)
            myEffect:addValue("remainingTicks", remainingTicks - 1)
            myEffect.nextCalled=30
            return true
        end
    end

    world:gfx(12, target.pos) -- The DoT is over and it "fizzles out" to give a graphical clue to the caster that they might want to re-apply the DoT

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
