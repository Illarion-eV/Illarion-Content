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
-- UPDATE items SET itm_script = 'item.rings' WHERE itm_id IN (68, 277, 278, 279, 280, 281, 282);

local lookat = require("base.lookat")
local common = require("base.common")
local checks = require("item.general.checks")
local jewel = require("item.general.jewel")

local M = {}

function M.LookAtItem(User,Item)
	return jewel.LookAtItem(User,Item);
end

function M.MoveItemBeforeMove(User,SourceItem,TargetItem)

	if TargetItem:getType() == 4 then --inventory, not belt
	
		return checks.checkLevel(User,SourceItem);
		
	else
	
		return true;
		
	end
	
	return true; --just in case
end
return M

