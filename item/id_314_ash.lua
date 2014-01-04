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
require("base.common")

module("item.id_314_ash", package.seeall)

-- UPDATE common SET com_script='item.id_314_ash' WHERE com_itemid = 314;

function LookAtItem(User,Item)

    -- Mummy            -> 101
    -- Skeleton		-> 111
    -- Demonskeleton 	-> 171
    -- Skulls		-> 211
    -- Ghostskeleton    -> 231

    if ( Item.quality == 101) then -- Mummie
		base.lookat.SetSpecialName(Item, "Grünliche Asche", "Greenish ash")
    elseif ( Item.quality == 111 ) then -- Skeleton
        base.lookat.SetSpecialName(Item, "Reine weiße Asche", "Pure white ash");
    elseif ( Item.quality == 171 ) then -- Demonskeleton
        base.lookat.SetSpecialName(Item, "Rötliche Asche", "Reddish ash");
    elseif ( Item.quality == 211 ) then --Skulls
        base.lookat.SetSpecialName(Item, "Silbrige Asche", "Silverish ash");
    elseif ( Item.quality == 231 ) then --Ghostskeleton
		base.lookat.SetSpecialName(Item, "Bläuliche Asche", "Blueish ash");
    else
		base.lookat.SetSpecialName(Item, "Asche", "Ash");
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end

