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
require("base.lookat")
require("base.ranklist")

-- UPDATE common SET com_script='item.id_661_lectern' WHERE com_itemid IN (661, 660);

module("item.id_661_lectern", package.seeall)

function UseItem(User,SourceItem,ltstate)
	if SourceItem.pos == position(138, 551, 0) or SourceItem.pos == position(358, 217, 0) or SourceItem.pos == position(896, 761, 1) then
		base.ranklist.getRanklist(User,"explorerRanklist", true);
	end
end

function LookAtItem(User, Item)
	if Item.pos == position(138, 551, 0) or Item.pos == position(358, 217, 0) or Item.pos == position(896, 761, 1) then
		base.lookat.SetSpecialDescription(Item, "Rangliste der Entdeckergilde.", "Ranklist of the explorer guild");
	end
	return lookat.GenerateLookAt(User, Item, base.lookat.NONE)
end