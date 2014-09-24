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

-- UPDATE items SET itm_script='item.id_734_brickmould' WHERE itm_id IN (734);

local licence = require("base.licence")
local bricksproducing = require("content.gatheringcraft.bricksproducing")
local wood = require("item.general.wood")

local M = {}

M.LookAtItem = wood.LookAtItem

function getOven(User)

	local targetItem = base.common.GetFrontItem(User);
	if (targetItem ~= nil and targetItem.id == 313) then
		return targetItem;
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (targetItem ~= nil and targetItem.id == 313) then
					return targetItem;
				end
			end
		end
	end
	return nil;
end

function M.UseItem(User, SourceItem, ltstate)
	if licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

	local ovenItem = getOven(User);
	if ovenItem then
		bricksproducing.StartGathering(User, ovenItem, ltstate);
		return
	end

	base.common.InformNLS(User,
		"Du musst neben einem Schmelzoven stehen um die Ziegelform zu benutzen.",
		"You must stand next to a meltoven to use the brick mould.");
end

return M

