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
-- lumberjacking
-- UPDATE items SET itm_script='item.id_74_axe' WHERE itm_id IN (74,2946);

local common = require("base.common")
local woodchopping = require("content.gatheringcraft.woodchopping")
local metal = require("item.general.metal")

local M = {}

M.LookAtItem = metal.LookAtItem

function M.UseItem(User, SourceItem, ltstate)

	local treeItem = woodchopping.getTree(User);
	if treeItem then
		woodchopping.StartGathering(User, treeItem, ltstate);
		return;
	end
	
	if treeItem == nil then
		common.HighInformNLS( User,
		"Um Holz zu hacken musst du zu einem Baum gehen.",
		"For chopping wood you have to go to a tree." );
	end
end


return M

