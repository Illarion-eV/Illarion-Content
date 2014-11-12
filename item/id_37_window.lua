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
--Ronagan's Ancient Temple
--Dyluck
--[[ Not used yet. Commented out for now. -Dyluck Dec 13, 2012

local M = {}


--Window_ID37
--A window that the player can use to enter/exit the temple
--Part of Ronagan's Temple questid(n/a) and related NPCs/scripts...

function M.UseItem(User, SourceItem, ltstate)

	local win = position(504, 215, 0); --location of the window; to be changed
	local inside = position(505, 215, 0); --location that entering window warps to; to be changed
	local outside = position(503, 215, 0); --location that exiting window warps to be changed
	--player must face window directly in order to climb through

	--quest progress; quest id to be changed
	--local queststatus = User:getQuestProgress(n/a); uncomment later
	local queststatus = 1; --remove later


	if SourceItem.pos == win then
		if queststatus >= 1 then
			if User.pos == outside then
				User:inform("You climb in through the window");
				world:gfx(41,User.pos); --probably no graphics needed, just testing
				world:makeSound(13,User.pos); --maybe some kind of jumping/landing sound
				User:warp(inside);
				world:gfx(41,User.pos);
				world:makeSound(13,User.pos);
				return;
			elseif User.pos == inside then
				User:inform("You climb out through the window");
				world:gfx(41,User.pos);
				world:makeSound(13,User.pos);
				User:warp(outside);
				world:gfx(41,User.pos);
				world:makeSound(13,User.pos);
				return;
			end
		end
	end
end

]]
return M

