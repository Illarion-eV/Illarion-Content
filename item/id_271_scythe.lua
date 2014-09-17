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


-- UPDATE items SET itm_script='item.id_271_scythe' WHERE itm_id IN (271);

local common = require("base.common")
local grainharvesting = require("content.gatheringcraft.grainharvesting")
local metal = require("item.general.metal")

module("item.id_271_scythe", package.seeall)

LookAtItem = metal.LookAtItem

function getGrain(User)

	-- first check front position for grain
	local TargetItem = common.GetFrontItem(User);
	if ( TargetItem ~= nil and TargetItem.id == 248 ) then
		return TargetItem;
	end

	local foundYoungGrain = false; -- check if we only find not fully grown grain
	TargetItem, foundYoungGrain = grainharvesting.GetNearbyGrain(User);
	if ( TargetItem == nil ) then
		-- since we're here, there is no fully grown grain
		if ( foundYoungGrain ) then
			common.HighInformNLS( User,
			"Das Getreide ist noch nicht reif für den Schnitt.",
			"The grain is not ready for harvest yet." );
		else
			common.HighInformNLS( User,
			"Du brauchst Getriede um es mit der Sense zu schneiden.",
			"You need grain for harvesting it with the scythe." );
		end
		return nil;
	end

	return TargetItem;
end

function UseItem(User, SourceItem, ltstate)

	local grain = getGrain(User);
	if grain ~= nil then
		grainharvesting.StartGathering(User, grain, ltstate);
	end

end
