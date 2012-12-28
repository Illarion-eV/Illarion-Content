-- This script is the central item lookat.

require("base.lookat")

module("server.itemlookat", package.seeall)

--- Item Lookat
-- The task of this function is to generate the lookat on a item.
-- This function is called by the server.
--
-- @param[in] player 	the player that is supposed to receive the inform
-- @param[in] item      the item the player is looking at
-- @return TRUE in case the script generated the lookat
function lookAtItem(player, item)
	local lookAt = base.lookat.GenerateLookAt(player, item)
	world:itemInform(player, item, lookAt)
	return true
end
