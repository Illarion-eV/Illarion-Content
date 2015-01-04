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
local ranklist = require("base.ranklist")

-- UPDATE items SET itm_script='item.id_661_lectern' WHERE itm_id IN (661, 660);

local M = {}

local function isRanklistLocation(pos)
	return pos == position(138, 551, 0) or pos == position(358, 217, 0) or pos == position(896, 761, 1)
end

function M.UseItem(user, sourceItem)
	if isRanklistLocation(sourceItem.pos) then
		ranklist.getRanklist(user, "explorerRanklist", true)
	end
end

function M.LookAtItem(user, item)
	if isRanklistLocation(item.pos) then
		lookat.SetSpecialDescription(item, "Rangliste der Entdeckergilde.", "Ranklist of the explorer guild")
	end
	return lookat.GenerateLookAt(user, item, lookat.NONE)
end

return M

