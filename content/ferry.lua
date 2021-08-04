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

local destinationPos = {}
local destinationDE = {}
local destinationEN = {}

destinationPos["Cadomyr"] = position(101,789,0)
destinationDE["Cadomyr"] = "Hafen von Cadomyr"
destinationEN["Cadomyr"] = "Cadomyr Harbour"

function M.SailTo(Character,destinationString)

    world:gfx(41,Character.pos)
    world:makeSound(13,Character.pos)
    Character:warp(destinationPos[destinationString])
    world:makeSound(13,Character.pos)
    world:gfx(41,Character.pos)
    Character.movepoints = Character.movepoints-20
    Character:inform(destinationDE,destinationEN,Character.lowPriority)

end

return M
