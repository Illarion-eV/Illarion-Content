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
local common = require("base.common")

local M = {}
-- Long time effect script for damage
-- this can't kill but hold the player at 1 HP
-- effect ID: 502

function M.addEffect( effect, target )
    effect.nextCalled = 1
end

function M.callEffect( effect, target )
    local currentHp
    local currentDamage

    local foundEffect, damageReductionLeft = effect:findValue("damageReduction")
    local _, damagePerCycle = effect:findValue("damagePerCycle")
    if not foundEffect then
        return false
    end

    if damageReductionLeft > 0 then
        currentHp = target:increaseAttrib("hitpoints", 0)
        if currentHp < 1 then -- char is dead
            effect:addValue("damageReduction", 0)
            effect:addValue("damagePerCycle", 0)
            return false
        elseif currentHp > 1 then
            currentDamage = math.min(damagePerCycle, damageReductionLeft, currentHp - 1)
            damageReductionLeft = math.max(0, (damageReductionLeft - currentDamage))
            effect:addValue("damageReduction", damageReductionLeft)
            if damageReductionLeft == 0 then
                effect:addValue("damagePerCycle", 0)
            end
            target:increaseAttrib("hitpoints", - currentDamage)
        end
        effect.nextCalled = 5
        return true
    end

    return false
end

function M.loadEffect( effect, target )
    effect.nextCalled = 5
end

function M.removeEffect( effect, target )

end

return M
