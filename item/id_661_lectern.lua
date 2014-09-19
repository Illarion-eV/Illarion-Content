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
local common = require("base.common")
local lookat = require("base.lookat")
local ranklist = require("base.ranklist")

-- UPDATE items SET itm_script='item.id_661_lectern' WHERE itm_id IN (661, 660);

local M = {}

function M.UseItem(User,SourceItem,ltstate)
	if SourceItem.pos == position(138, 551, 0) or SourceItem.pos == position(358, 217, 0) or SourceItem.pos == position(896, 761, 1) then
		ranklist.getRanklist(User,"explorerRanklist", true);
	end
end

function M.LookAtItem(User, Item)
	if Item.pos == position(138, 551, 0) or Item.pos == position(358, 217, 0) or Item.pos == position(896, 761, 1) then
		lookat.SetSpecialDescription(Item, "Rangliste der Entdeckergilde.", "Ranklist of the explorer guild");
	end
	return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

return M

