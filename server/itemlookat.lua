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
-- This script is the central item lookat.

require("base.lookat")

module("server.itemlookat", package.seeall)

--- Item Lookat
-- The task of this function is to generate the lookat on a item.
-- This function is called by the server when an item has no script attached to it in the database.
--
-- @param[in] player 	the player that is supposed to receive the inform
-- @param[in] item      the item the player is looking at
function lookAtItem(player, item)
	return base.lookat.GenerateLookAt(player, item)
end
