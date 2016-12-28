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

local M = {}
local reducedMovePoints = 10

function M.initEffect(user, duration, tickTime)
    local isProtected, effect = user.effects:find(802)
    if isProtected then
        effect:addValue("ticks", duration)
        effect.nextCalled = tickTime
    else
        local protEffect = LongTimeEffect(802, tickTime)
        user.effects:addEffect(protEffect)
        protEffect:addValue("ticks", duration)
        user:inform("Dein Körper wird von mächtigen Winden umgeben, die deine Gegner von dir stoßen", "Your body gets surrounded by mighty winds, pushing enemies away")
    end
    world:gfx(9,user.pos)
end

function M.callEffect(effect, user)
    local _, ticks = effect:findValue("ticks")

    if ticks > 0 then
        effect:addValue("ticks", ticks-1)
        local enemies = world:getCharactersInRangeOf(user.pos, 1)

        for enemy in enemies do
            local push = position(
                enemy.pos.x - (enemy.pos.x - user.pos.x)*2,
                enemy.pos.y - (enemy.pos.y - user.pos.y)*2,
                user.pos.z
            )
            world:gfx(9, enemy.pos)
            enemy.warp(push)
        end

        return true
    else
        user:inform("Die schützenden Winde verlassen dich", "The protecting winds are leaving you")
        return false
    end
end

function M.loadEffect(effect, victim)
    -- loaded after char was logged out!
    return true
end

return M

