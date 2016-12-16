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
-- Long Time Effect Script: Diet System
-- Effect ID: 12

local attributes = {"strength", "constitution", "agility", "dexterity", "intelligence", "essence", "perception", "willpower"}

local M = {}

function M.addEffect(dietEffect, user)

end

function M.callEffect(dietEffect, user)
    return false
end

function M.removeEffect(dietEffect, user)
    for    _, attribute in pairs(attributes) do
        local found, value = dietEffect:findValue(attribute)
        if found then
            user:increaseAttrib(attribute, -value)
        end
    end
    user:inform("[Ernährung] Die Wirkung des guten Essens vergeht.", "[Diet] The effect of the good food vanishes.")
end

function M.loadEffect(dietEffect, user)
    for _, attribute in pairs(attributes) do
        local found, value = dietEffect:findValue(attribute)
        if found then
            user:increaseAttrib(attribute, value)
        end
    end
end

return M