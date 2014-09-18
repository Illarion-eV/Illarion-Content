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

-- UPDATE items SET itm_script='item.id_2751_cruciblepincers' WHERE itm_id IN (2751);

local licence = require("base.licence")
local oremelting = require("content.gatheringcraft.oremelting")
local waxproducing = require("content.gatheringcraft.waxproducing")
local metal = require("item.general.metal")

module("item.id_2751_cruciblepincers", package.seeall)

LookAtItem = metal.LookAtItem

function getFurnace(User)
	furnaces = {}
	furnaces[2834] = true
	furnaces[2835] = true
	furnaces[2836] = true
	furnaces[2837] = true

	local targetItem = base.common.GetFrontItem(User);
	if (targetItem ~= nil and furnaces[targetItem.id] ~= nil) then
		return targetItem;
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (targetItem ~= nil and furnaces[targetItem.id] ~= nil) then
					return targetItem;
				end
			end
		end
	end
	return nil;
end

function getChandlerTable(User)

	local targetItem = base.common.GetFrontItem(User);
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

	local furnaceItem = getFurnace(User);
	if furnaceItem then
		oremelting.StartGathering(User, furnaceItem, ltstate);
		return
	end

	local chandlertableItem = getChandlerTable(User);
	if chandlertableItem then
		waxproducing.StartGathering(User, chandlertableItem, ltstate);
		return
	end

	base.common.InformNLS(User,
		"Du musst neben einem Schmelzofen oder Kerzenziehertisch stehen um die Tiegelzange zu benutzen.",
		"You must stand next to a furnace or a chandler table to use the crucible-pincers.");
end
