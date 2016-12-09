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

-- INSERT INTO triggerfields VALUES (768, 250, -3,'triggerfield.ushara_garden_teleport');
-- INSERT INTO triggerfields VALUES (768, 273, -3,'triggerfield.ushara_garden_teleport');
-- INSERT INTO triggerfields VALUES (787, 280, -3,'triggerfield.ushara_garden_teleport');


--Teleporters in the Ushara Garden

local common = require("base.common")

local M = {}

function M.MoveToField( User )

    if User:getType() ~= Character.player then
        return
    end

    if User.pos == position(768, 250, -3) then -- Boat from sunken garden to new garden
        world:gfx(11, User.pos)
        world:makeSound(9, User.pos)
        User:warp(position(767, 273, -3))
        world:gfx(11,User.pos)
        world:makeSound(9, User.pos)
    elseif User.pos == position(768, 273, -3) then -- Boat from new garden to old sunken one
        world:gfx(11, User.pos)
        world:makeSound(9, User.pos)
        User:warp(position(767, 249, -3))
        world:gfx(11, User.pos)
        world:makeSound(9, User.pos)
    elseif User.pos == position(787, 280, -3) then -- warp back to surface from restored garden
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
        User:warp(position(740, 252, 0))
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
    end

end

return M
