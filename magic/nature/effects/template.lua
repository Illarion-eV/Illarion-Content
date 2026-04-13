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

--Template for druid weave spells

local M = {}

function M.effect(user, location, target)
    -- Consume sigil charges
    -- Spell effect goes here
    user:talk(Character.say, "#me wirke einen Zauber.", "#me casts a spell.")
end

function M.checksToPass(user, location, target)
    -- Check if you have enough sigil charges
    -- If it needs to pass a check before casting, put it here. Return false if it does not pass.
    return true
end

return M
