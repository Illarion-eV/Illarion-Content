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

-- UPDATE items SET itm_script='item.id_429_candlemold' WHERE itm_id IN (429);

local common = require("base.common")
local licence = require("base.licence")
local candleproducing = require("content.gatheringcraft.candleproducing")
local wood = require("item.general.wood")

module("item.id_429_candlemold", package.seeall)

LookAtItem = wood.LookAtItem

function getChandlerTable(User)

	local targetItem = common.GetFrontItem(User);
	if (targetItem ~= nil and targetItem.id == 428) then
		return targetItem;
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (targetItem ~= nil and targetItem.id == 428) then
					return targetItem;
				end
			end
		end
	end
	return nil;
end

function UseItem(User, SourceItem, ltstate)
	if licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end


	local chandlertableItem = getChandlerTable(User);
	if chandlertableItem then
		candleproducing.StartGathering(User, chandlertableItem, ltstate);
		return
	end

	common.HighInformNLS( User,
		"Du musst an einem Kerzenziehertisch arbeiten!",
		"You have to work at a chandler table!" );

end
