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

require("base.lookat")
require("base.common")
require("item.general.checks")

module("item.general.wood", package.seeall)

-- Normal Items:
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN (17,39,40,57,65,70,76,207,208,209,212,213,214,215,216,217,218,219,263,312,522,524,550,551,2193,2194,2445,2448,2525,2527,2528,2530,2541,2544,2548,2549,2561,2566,2567,2570,2572,2573,2584,2585,2646,2659,2664,2685,2708,2714,2718,2727,2739,2780,2782,2783,2784,2785,2875,2876,2877,2878,2879,2880,2885,2913,2914,2915,2916);

-- Priest Items
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN ();

-- Weapons:
-- UPDATE common SET com_script='item.general.wood' WHERE com_itemid IN ();

function LookAtItem(user, item)
    return base.lookat.GenerateLookAt(user, item, base.lookat.WOOD)
end

function MoveItemBeforeMove(User,SourceItem,TargetItem)

	if TargetItem:getType() == 4 then --inventory, not belt
	
		return item.general.checks.checkLevel(User,SourceItem);
		
	else
	
		return true;
		
	end
	
	return true; --just in case
end