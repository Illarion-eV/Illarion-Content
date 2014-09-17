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

-- UPDATE items SET itm_script='item.tree' WHERE itm_id IN (308, 586, 1804, 1807, 1808, 1809, 1817, 960, 961, 962, 963, 589,203,892,893,894,910,911,912,913,959,960,961,962,963,1193,1194,1195,1198,1807,1808);

local teacher = require("alchemy.base.teacher")
local common = require("base.common")
local lookat = require("base.lookat")
local herbgathering = require("content.gatheringcraft.herbgathering")
local woodchopping = require("content.gatheringcraft.woodchopping")

module("item.tree", package.seeall)

function UseItem(User, SourceItem, ltstate)
    -- alchemy stuff
	if SourceItem.pos == position(432,238,0) then
		teacher.UseItem(User, SourceItem, ltstate)
		return
	end
	-- alchemy end

	-- Try to harvest herbs first
	if herbgathering.isHerbItem(SourceItem) and
			herbgathering.GetValidProduct(SourceItem) and
			User:countItemAt("body",126) > 0 then
		herbgathering.StartGathering(User, SourceItem, ltstate);
		return;
	end
	
	if woodchopping.isUnchoppableTree(SourceItem,User) then
		return
	end

	-- Try to chop tree
	if woodchopping.isChoppableTree(SourceItem) then
		woodchopping.StartGathering(User, SourceItem, ltstate);
		return;
	end
	
end

function LookAtItem(User,Item)
    -- alchemy stuff
	if Item.pos == position(432,238,0) then
		return teacher.LookAtItem(User, Item)

	end
	-- alchemy end

	return lookat.GenerateLookAt(User, Item)

end
