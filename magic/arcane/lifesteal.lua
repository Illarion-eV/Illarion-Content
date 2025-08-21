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
local mana = require("magic.arcane.mana")
local testing = require("base.testing")

local M = {}

local texts = {
    health = {english = "You siphon some health from your target.", german = "Du entziehst deinem Ziel Lebensenergie."},
    mana = {english = "You siphon some mana from your target.", german = "Du entziehst deinem Ziel Mana."},
    overTime = {english = "You siphon health from your target, recovering your own over time.", german = "Du entziehst deinem Ziel Lebensenergie, während sich deine mit der Zeit erholt."}
}

function M.instantLifeOrManaSteal(user, targets, spell, ORL)

    local JUS = runes.checkSpellForRuneByName("JUS", spell)
    local IRA = runes.checkSpellForRuneByName("IRA", spell)
    local SIH = runes.checkSpellForRuneByName("SIH", spell)
    local YEG = runes.checkSpellForRuneByName("YEG", spell)
    local URA = runes.checkSpellForRuneByName("URA", spell)
    local TAUR = runes.checkSpellForRuneByName("TAUR", spell)
    local rune

    if YEG then
        rune = "YEG"
    elseif TAUR then
        rune = "TAUR"
    elseif URA then
        rune = "URA"
    end

    local amountStolen = 525 -- RA IRA is 700, so for RA IRA to not be useless this needs to be lower as it has a second effect of giving you mana

    local appliedJUSIRA = false

    for _, target in pairs(targets.targets) do

        if JUS and isValidChar(target) then

            local scaling = effectScaling.getEffectScaling(user, target, spell)
            amountStolen = amountStolen*scaling

            if rune then
                if magicDamage.checkIfRaceBonus(target, rune) then
                    amountStolen = amountStolen*1.5
                end
            end
            if ORL then
                amountStolen = amountStolen/2
            end
            if SIH then
                character.ChangeHP(user, amountStolen)
                character.ChangeHP(target, -amountStolen)
                user:inform(texts.health.german, texts.health.english)
            end
            if IRA then

                local increase = amountStolen -- For PvP it is the same value

                if target:getType() == Character.monster then --Monsters have no mana to steal, so you only get half the effect. To compensate we double the mana regen.
                    increase = increase*2
                    --[[
                    This poses a dilemma, however. We could end up with a situation where you want to drag around a low level mob as a
                    "mana battery". So the returned mana must always be lower than or equal to the spells cost in PvE.
                    As such, a maximum cap of the spells mana cost must be in place. After all, mana potions need to still be useful
                    and there shouldnt be a way to speed up mana regen without them. All JUS IRA spells will do is increase your
                    up time in PvE scenarios. That does mean it is pointless to cast only JUS IRA, but it will be useful to weave into
                    other spells. Instead, in PvE the purpose of JUS IRA becomes to reduce the cost of the total spell in exchange for
                    a longer cast time and thus increasing your active time.
                    ]]
                    local manaCost = mana.arcaneSpellCost(user, spell)

                    manaCost = manaCost*0.7 -- Cap at 70% of the cost

                    if manaCost < increase then
                        increase = manaCost
                    end

                end

                if target:getType() == Character.player then
                    if target:increaseAttrib("mana", 0) < increase then -- This way a friend can not be used as an infinite mana battery
                        increase = target:increaseAttrib("mana", 0)
                    end
                end

                if target:increaseAttrib("mana", 0) > amountStolen then
                    target:increaseAttrib("mana", -amountStolen)
                    if testing.active then
                        target:talk(Character.say, "#me loses "..amountStolen.." mana.")
                    end
                else
                    target:increaseAttrib("mana", 0)
                    if testing.active then
                        target:talk(Character.say, "#me loses "..target:increaseAttrib("mana", 0).." mana.")
                    end
                end

                if target:getType() == Character.monster and not appliedJUSIRA or target:getType() == Character.player then
                    user:increaseAttrib("mana", increase)
                    if target:getType() == Character.monster then
                        appliedJUSIRA = true
                    end
                end

                if testing.active then
                    user:talk(Character.say, "#me gains "..increase.." mana.")
                end
                user:inform(texts.mana.german, texts.mana.english)
            end
        end
    end
end


function M.addEffect(myEffect, target)
    target:inform(texts.overTime.german, texts.overTime.english)
end

function M.removeEffect(myEffect, target)

    myEffect:addValue("remainingDamage", 0)
    myEffect:addValue("remainingTicks", 0)

end


function M.callEffect(myEffect, target)
    local foundDamage, remainingDamage =  myEffect:findValue("remainingDamage")
    local foundTicks, remainingTicks =  myEffect:findValue("remainingTicks")
    if foundDamage and foundTicks then

        if remainingDamage == 0 then
            return false
        end

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
