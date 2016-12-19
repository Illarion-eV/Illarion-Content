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

-- INSERT INTO triggerfields VALUES (119, 624, -1,'triggerfield.cadomyr_teleport');


--Teleporters in the Ushara Garden

local common = require("base.common")

local M = {}

function M.MoveToField( User )

    if User:getType() ~= Character.player then
        return
    end

    if User.pos == position(119, 624, -1) then -- warp back to surface from restored garden
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
        User:warp(position(118, 644, 0))
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
    end

end

return M
