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

-- INSERT INTO triggerfields VALUES (789, 295, -9,'triggerfield.lakeoflife_teleport');
-- INSERT INTO triggerfields VALUES (559, 258, 0,'triggerfield.lakeoflife_teleport');
-- INSERT INTO triggerfields VALUES (727, 324, -9,'triggerfield.lakeoflife_teleport');
-- INSERT INTO triggerfields VALUES (756, 351, -9,'triggerfield.lakeoflife_teleport');
-- INSERT INTO triggerfields VALUES (753, 333, -9,'triggerfield.lakeoflife_teleport');


--Teleporters in the Lake of Life dungeon

local common = require("base.common")

local M = {}

function M.MoveToField( User )

	if User:getType() ~= Character.player then
		return
	end

    if User.pos == position(789, 295, -9) then -- to the boss area
	    world:gfx(41, User.pos)
	    world:makeSound(13, User.pos)
        User:warp(position(559, 260, 0))
	    world:gfx(41, User.pos)
	    world:makeSound(13, User.pos)
	elseif User.pos == position(559, 258, 0) then -- back down to Lake of Life Main Dungeon
		world:gfx(41, User.pos)
	    world:makeSound(13, User.pos)
        User:warp(position(788, 295, -9))
        world:gfx(41, User.pos)
        world:makeSound(13, User.pos)
	elseif User.pos == position(727, 324, -9) then -- Boat to Island of Zenia
		common.InformNLS(User, "Als du in das Boot steigst, setzt es sich in Bewegung, bevor du dich hinsetzen kannst, um dich zu einer entfernten Insel zu tragen.", "As you step into the boat, it starts moving before you have a chance to sit down, transporting you to a distant island.")
		world:gfx(11, User.pos)
	    world:makeSound(9, User.pos)
        User:warp(position(756, 341, -9))
        world:gfx(11,User.pos)
        world:makeSound(9, User.pos)
	elseif User.pos == position(756, 351, -9) then -- Boat back to the dock
		common.InformNLS(User, "Als du in das Boot steigst, setzt es sich in Bewegung, bevor du dich hinsetzen kannst, um dich zurück zur Anlegestelle zu tragen.", "As you step into the boat, it starts moving before you have a chance to sit down, transporting you back to the dock.")
		world:gfx(11, User.pos)
	    world:makeSound(9, User.pos)
        User:warp(position(734, 323, -9))
        world:gfx(11, User.pos)
        world:makeSound(9, User.pos)
    elseif User.pos == position(753, 333, -9) then -- trapped on Zenia island so out to Hempty
	    world:gfx(41, User.pos)
	    world:makeSound(13, User.pos)
        User:warp(position(680, 473, 0))
	    world:gfx(41, User.pos)
	    world:makeSound(13, User.pos)
	end

end

return M
