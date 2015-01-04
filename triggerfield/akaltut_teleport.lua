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
--Teleporters in the Akaltut Chambers Dungeon
--Evie Pryler

local common = require("base.common")

local M = {}

function M.MoveToField( User )

	if User:getType() ~= Character.player then
		return
	end

    if User.pos == position(466,798,-6) then --To the beginning of level.
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(466,740,-6));
	    world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
	elseif User.pos == position(503, 780, -6) then -- Wind 1 -
		common.InformNLS(User,"Eine heftige Böe reißt dich um und wirbelt dich durch die Luft.","Strong winds lift you off your feet and send you flying through the air."); --sending a message
	    world:gfx(7,User.pos);
	    world:makeSound(27,User.pos);
        User:warp(position(483,777,-6));
	    world:gfx(7,User.pos);
	    world:makeSound(27,User.pos);
	elseif User.pos == position(510, 776, -6) then -- Wind 2
		common.InformNLS(User,"Eine heftige Böe reißt dich um und wirbelt dich durch die Luft.","Strong winds lift you off your feet and send you flying through the air."); --sending a message
		world:gfx(7,User.pos);
	    world:makeSound(27,User.pos);
        User:warp(position(511,788,-6));
        world:gfx(7,User.pos);
        world:makeSound(27,User.pos);
	elseif User.pos == position(517, 778, -6) then -- Wind 3
		common.InformNLS(User,"Eine heftige Böe reißt dich um und wirbelt dich durch die Luft.","Strong winds lift you off your feet and send you flying through the air."); --sending a message
		world:gfx(7,User.pos);
	    world:makeSound(27,User.pos);
        User:warp(position(542, 772, -6));
        world:gfx(7,User.pos);
        world:makeSound(27,User.pos);
	elseif User.pos == position(512, 786, -6) then -- Wind 4
		common.InformNLS(User,"Eine heftige Böe reißt dich um und wirbelt dich durch die Luft.","Strong winds lift you off your feet and send you flying through the air."); --sending a message
		world:gfx(7,User.pos);
	    world:makeSound(27,User.pos);
        User:warp(position(528, 785, -6));
        world:gfx(7,User.pos);
        world:makeSound(27,User.pos);
	elseif User.pos == position(502, 732, -6) then -- End of Lava Trap
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(425,785, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(481, 843, -9) then -- To mud pit from skull room.
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(464, 798, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(481,847,-9) then -- From main dungeon to entrance of -9
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(477,842,-9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(453, 819, -9) then -- Exit from mud pit to -6
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(509, 777, -6));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(470, 773, -9) then -- lev -9 exit to surface
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(454, 770, 0));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(489, 764, -9) then -- from lava area to trap cave
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(446, 778, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(516, 766, -9) then -- To Island of the Undead area
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(496, 821, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(511, 817, -9) then -- Exit Island of the Undead area
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(503, 752, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(511, 743, -9) then -- To small southern mud area
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(516, 824, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(503, 769, -9) then -- From lava to island in stream
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(479, 795, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(517, 758, -9) then -- From lava to eastern swamp
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(498, 785, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(511, 781, -9) then -- Exit from eastern swamp to lava
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(496, 748, -9));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(511, 805, -9) then -- Boat to Island of the Undead.
		world:gfx(11,User.pos);
	    world:makeSound(9,User.pos);
        User:warp(position(508, 814, -9));
        world:gfx(11,User.pos);
        world:makeSound(9,User.pos);
	elseif User.pos == position(507, 814, -9) then -- Boat leaving the Island of the Undead.
		world:gfx(11,User.pos);
	    world:makeSound(9,User.pos);
        User:warp(position(509, 805, -9));
        world:gfx(11,User.pos);
        world:makeSound(9,User.pos);
	elseif User.pos == position(490, 884, -9) then -- exit from Akultut's Lair to surface
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(454, 770, 0));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	elseif User.pos == position(440, 777, -9) then -- Movement from lev -9 to -6 (Trap)
		world:gfx(41,User.pos);
	    world:makeSound(13,User.pos);
        User:warp(position(538, 754, -6));
        world:gfx(41,User.pos);
        world:makeSound(13,User.pos);
	end

end

return M

