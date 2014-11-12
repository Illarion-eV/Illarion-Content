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

local lookat = require("base.lookat")
local common = require("base.common")
local checks = require("item.general.checks")

local M = {}

-- Normal Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN (225, 1840, 1858);

-- Priest Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN (62,67,71,82,83,334,463,465);

-- Weapon Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN ();

function M.LookAtItem(user, item)
    return lookat.GenerateLookAt(user, item, lookat.JEWELLERY)
end;


function M.UseItem(User, SourceItem, ltstate)
    -- list with jewles and the functions belonging to them
    UseMe={}
	-- UseMe[ITEMID] = function(...) UseJewl_ITEMID(...) end
	
	if not UseMe[SourceItem.id] then -- security check
	    return -- if the jewel is not defined yet, we return
    else
        UseMe[SourceItem.id](User, SourceItem, TargetItem, ltstate)
    end
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

