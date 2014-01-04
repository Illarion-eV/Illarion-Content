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
-- UPDATE common SET com_script='item.id_58_mortar' WHERE com_itemid=58;

require("base.common")
require("content.craft.dyemaking")
require("base.lookat")

module("item.id_58_mortar", package.seeall)

function UseItem(User, SourceItem, ltstate)

    content.craft.dyemaking.dyemaking:showDialog(User, SourceItem)
	
end 

function LookAtItem(User, Item)
    world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.JEWELLERY))
end

