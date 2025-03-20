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

function M.addEffect(myEffect, target)
    target:inform("Du sp�rst wie etwas Mana aus deinem K�rper flie�t.", "You can feel some of your mana being drained from out of your body.")
end

function M.callEffect(myEffect, target)
    local foundManaReduction, remainingManaReduction =  myEffect:findValue("remainingManaReduction")
    local foundTicks, remainingTicks =  myEffect:findValue("remainingTicks")
    if foundManaReduction and foundTicks then
        if remainingTicks > 0 then
            local manaReduction = math.floor(remainingManaReduction/remainingTicks)
            if target:increaseAttrib("mana", 0) > manaReduction then
                target:increaseAttrib("mana", -manaReduction)
                target:talk(Character.say, "#me loses "..manaReduction.." mana.")
            else
                target:setAttrib("mana", 0)
            end
            myEffect:addValue("remainingManaReduction", remainingManaReduction - manaReduction)
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
