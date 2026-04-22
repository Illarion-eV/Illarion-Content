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

local M = {}

local poisonEffectId = 39

local poisonDuration = 10 -- 10 seconds

function M.applyPoison(target, damage)

    damage = math.floor(damage) -- ensure whole integer

    local foundEffect, myEffect = target.effects:find(poisonEffectId)

    if foundEffect then

        local foundAmount, amount = myEffect:findValue("poisonAmount")

        if not foundAmount then
            amount = 0
        end

        local newAmount = math.max(amount+damage, 0) -- Ensure no healing values

        myEffect:addValue("poisonAmount", newAmount) -- Add poison value to existing poison
        myEffect:addValue("ticks", poisonDuration) --Reset duration with the added poison value
    else
        if damage > 0 then --Otherwise it is an antidote that has no effect when not poisoned
            myEffect = LongTimeEffect(poisonEffectId,10)

            myEffect:addValue("poisonAmount", damage)
            myEffect:addValue("ticks", poisonDuration)

            target.effects:addEffect(myEffect)
        end
    end
end

function M.applyAntidote(target, amount)
    M.applyPoison(target, -amount)
end

function M.addEffect(effect, user)
    user:inform("Du fühlst dich geschwächt, während ein Gift durch deine Adern fließt.", "You feel weakened as a poison courses through your veins.")
end

function M.callEffect(effect, user)

    if character.GetHP(user) == 0 then --Already dead, so we end the poison LTE
        return false
    end

    local foundAmount, amount = effect:findValue("poisonAmount")

    local foundTicks, remainingTicks = effect:findValue("ticks")

    if not foundAmount or not foundTicks then
        return false
    end

    local damage = math.floor(amount/remainingTicks)

    if damage <= 0 then
        M.removeEffect(effect, user)
        return false
    end

    character.ChangeHP(user, -damage)

    if remainingTicks-1 == 0 then
        M.removeEffect(effect, user)
        return false
    end

    effect:addValue("poisonAmount", amount-damage)

    effect:addValue("ticks", remainingTicks-1)

    effect.nextcalled = 10 -- Call once per second

    return true

end

function M.loadEffect(effect, user)

end

function M.removeEffect(effect, user)
    user:inform("Du spürst, wie das Gift dein System verlässt.", "You feel the poison leave your system.")
end

return M
