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

local seegwynt = require("magic.nature.effects.seegwynt")

local M = {}

function M.effect(user, location, target)
    world:gfx(52, location)
    world:makeSound(13, location)
    seegwynt.spawnStaticObject(user, "Echogwynt", location, Item.druidicRunestone)
end

function M.checksToPass(user, location, target)
    return true
end

return M

