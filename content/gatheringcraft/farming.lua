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

-- grops and seeds (grain is handled elsewhere)

-- additional tool: sickle ( 126 )

require("base.common")
require("content.gathering")

module("content.gatheringcraft.farming", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local theCraft = content.gathering.farming;

	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talk(Character.say, "#me unterbricht "..gText.." Arbeit.", "#me interrupts "..eText.." work.")
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	-- additional tool item is needed
	if (User:countItemAt("all",126)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Sichel um zu ernten.",
		"You need a sickle for harvesting." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~=126 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 126 ) then
			base.common.HighInformNLS( User,
			"Du musst die Sichel in der Hand haben!",
			"You have to hold the sickle in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- check the amount
	local amountStr = SourceItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	end

	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		return;
	end

	if ( amount == 0 ) then
		-- this is a farming item, it can't regrow
		base.common.HighInformNLS( User,
		"Hier kannst du nichts ernten.",
		"There is nothing you can harvest." );
		return;
	end

	-- currently not working -> let's go
	if ( ltstate == Action.none ) then
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User, toolItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt mit der Sichel zu ernten.", "#me starts to harvest with the sickle.")
		return;
	end

	-- since we're here, we're working

	if theCraft:FindRandomItem(User) then
		return
	end

	amount = amount - 1;

	if ( amount == 0 ) then
		-- nothing left, remove the farming item
		world:erase(SourceItem, SourceItem.number);
	else
		-- just update the amount
		SourceItem:setData("amount", "" .. amount);
		world:changeItem(SourceItem);
	end

	-- since we're here, everything should be alright
	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
	local notCreated = User:createItem( FarmingItems[SourceItem.id], 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( FarmingItems[SourceItem.id], notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		-- try to find a next item of the same farming type
		local nextItem = getFarmingItem(User);
		if ( amount > 0 or nextItem~=nil) then  -- there are still items we can work on
			if (amount < 1) then
				base.common.TurnTo( User, nextItem.pos ); -- turn, so we find this item in next call as first item
				SourceItem = nextItem;
			end
			theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User, toolItem);
			User:changeSource(SourceItem);
			User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		else
			base.common.HighInformNLS( User,
			"Hier ist nichts mehr, was du mit der Sichel ernten kannst.",
			"There is nothing anymore which you can harvest with the sickle." );
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, theCraft:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Sichel zerbricht.",
		"Your old sickle breaks.");
		return
	end

end


function InitFarmingItems()

	if FarmingItems ~= nil then
		return
	end

	FarmingItems = {};

	-- field crops
	FarmingItems[290] = 290									-- cabbage -> cabbage
	FarmingItems[537] = 201									-- onion plant -> onion
	FarmingItems[540] = 200									-- tomato plant -> tomato
	FarmingItems[731] = 154									-- hop plant -> hop
	FarmingItems[732] = 728									-- old hops -> hop seeds
	FarmingItems[2492] = 2493								-- greens -> carrots
	FarmingItems[782] = 778									-- sugarcane plant -> sugarcane
	FarmingItems[777] = 772									-- withered tobacco plant -> tabacco

	-- TODO when bug in MoveItem functions is resolved, remove these
	FarmingItems[779] = 779									-- sugarcane seeds
	FarmingItems[773] = 773									-- tobacco seeds
	FarmingItems[2917] = 2917								-- tomato seeds
	FarmingItems[2494] = 2494								-- carrot seeds ("seeds")
	FarmingItems[534] = 534									-- onion seeds
	FarmingItems[291] = 291									-- withered cabbage (seeds)

end

function isFarmingItem(Plant)
	if (Plant ~= nil and FarmingItems[Plant.id] ~= nil and ((Plant:getData("amount") ~= "0" and Plant:getData("amount") ~= "") or Plant.wear == 255)) then
		return true;
	end
	return false;
end

function getFarmingItem(User)
	InitFarmingItems();

	local targetItem = base.common.GetFrontItem(User);
	if (isFarmingItem(targetItem)) then
		return targetItem;
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (isFarmingItem(targetItem)) then
					return targetItem;
				end
			end
		end
	end
	return nil;
end
