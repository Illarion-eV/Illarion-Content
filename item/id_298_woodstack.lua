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
-- I_298 Holzstapel entfachen (Lagerfeuer)

local common = require("base.common")

module("item.id_298_woodstack", package.seeall)

-- UPDATE items SET itm_script='item.id_298_woodstack' WHERE itm_id IN (298);

function UseItem(User, SourceItem)
    
	if (SourceItem:getType()==3) then
        SourceItem.wear = 4;
        SourceItem.id = 12;
        SourceItem.number = 3;
        world:changeItem(SourceItem);
        world:makeSound(7,User.pos);
    else
        common.InformNLS( User,
            "Du willst Dich nicht selbst verbrennen!",
            "You don't want to burn yourself!");
    end
end