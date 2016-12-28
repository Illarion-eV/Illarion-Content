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

function M.initEffect(victim, duration, tickTime)
    local isSlowed, effect = victim.effects:find(801)
    if isSlowed then
        effect:setData("enhanced", 1)
        effect:addValue("ticks", duration)
        effect.nextCalled = tickTime
    else
        local slowEffect = LongTimeEffect(801, tickTime)
        victim.effects:addEffect(slowEffect)
        slowEffect:addValue("ticks", duration)
        victim:inform("Eine kühle Schwere legt sich um deine Körper und erschwer dein Vorankommen.", "Cold winds surround your body making moving a pain.")
    end
    world:gfx(9,victim.pos)
end

function M.callEffect(effect, victim)
    local _, ticks = effect:findValue("ticks")
    local isEnhanced, _ = effect:findValue("enhanced")

    if ticks > 0 then
        if isEnhanced then
            local movepoints = victim:increaseAttrib("movepoints", 0)
            victim:increaseAttrib("movepoints", -movepoints)
            victim:inform("Das Eis hält dich an Ort und Stelle fest", "The ice stops your moving completley")
        else
            victim:increaseAttrib("movepoints", -reducedMovePoints)
            victim:inform("Die Kälte verlangsamt dich", "The coldness slows you down")
        end
        return true
    else
        victim:inform("Die Kälte die dich umgab schwindet und du kannst dich wieder frei bewegen.", "The chill surrounding you vanishes and you can once again roam freely")
        return false
    end
end

function M.loadEffect(effect, victim)
    -- loaded after char was logged out!
    return true
end

return M