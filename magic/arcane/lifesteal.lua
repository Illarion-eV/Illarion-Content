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
local amountStolen = 300

    for _, target in pairs(targets.targets) do
        local scaling = effectScaling.getEffectScaling(user, target, spell)
        amountStolen = amountStolen*scaling
        if JUS then
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
                if target:increaseAttrib("mana", 0) > amountStolen then
                    target:increaseAttrib("mana", -amountStolen)
                else
                    target:increaseAttrib("mana", 0)
                end
                user:increaseAttrib("mana", amountStolen)
                user:inform(texts.mana.german, texts.mana.english)
            end
        end
    end
end


function M.addEffect(myEffect, target)
    target:inform(texts.overTime.german, texts.overTime.english)
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
