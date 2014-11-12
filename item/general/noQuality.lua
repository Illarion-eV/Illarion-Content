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
-- UPDATE common SET com_script='item.id_293_throwing_spear' WHERE com_itemid IN (293);

local lookat = require("base.lookat")
local common = require("base.common")
local checks = require("item.general.checks")

local M = {}

--This script can limit equipping e.g. throwing weapons without having to show the quality

--No lookAt with quality, e.g. for stackable items

function M.MoveItemBeforeMove(User,SourceItem,TargetItem)

	if TargetItem:getType() == 4 then --inventory, not belt
	
		return checks.checkLevel(User,SourceItem);
		
	else
	
		return true;
		
	end
	
	return true; --just in case
end

	


return M

