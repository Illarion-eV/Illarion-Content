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

require("base.lookat")

module("item.id_293_throwing_spear", package.seeall)

function LookAtItem(User, Item)
	
	--local customText = base.lookat.GetItemDescription(User,Item,base.lookat.WOOD,false,false);
	--if tonumber(Item:getData("spearData")) > 2^30 then
	--	world:itemInform( User, Item, customText );
	--else
		world:itemInform( User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.WOOD));
	--end
end
