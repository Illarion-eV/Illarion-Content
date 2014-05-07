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

-- shoal in water ( 1170 )

-- additional tool: fishingrod ( 72 )

require("base.common")
require("content.gathering")
require("scheduled.placeShoal")

module("content.gatheringcraft.fishing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local fishing = content.gathering.fishing;

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
	if (User:countItemAt("all",72)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Angel um zu fischen.",
		"You need a fishing rod for catching fish." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 72 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 72 ) then
			base.common.HighInformNLS( User,
			"Du musst die Angel in der Hand haben!",
			"You have to hold the fishing rod in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- check the amount
	local MaxAmount = 20
	local changeItem = false;
	local amountStr = SourceItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	elseif ( SourceItem.wear == 255 ) then
		amount = MaxAmount;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User,toolItem);
		User:startAction( fishing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt zu fischen.", "#me starts to fish.")
		return
	end

	if fishing:FindRandomItem(User) then
		return
	end

	-- since we're here, we're working

	User:learn( fishing.LeadSkill, fishing.SavedWorkTime[User.id], fishing.LearnLimit);
	local fished = 1; -- set the amount of items that are produced
	local fishID = 0;
	local chance = Random.uniform(1,100);
	if chance <= 45 then
		fishID = 355; -- salmon
	elseif chance <= 75 then
		fishID =73; -- trout;
	elseif chance <= 99 then
		fishID = 1209 -- horse mackerel
	else
		fishID = 1210 -- rose fish
	end

	-- GFX + Sound for a splash
	world:gfx(11,SourceItem.pos);
	world:makeSound(9,SourceItem.pos);

	amount = amount - 1
	SourceItem:setData("amount",amount)
	world:changeItem(SourceItem)

	local notCreated = User:createItem( fishID, fished, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( fishID, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if amount > 0 then  -- there are still items we can work on
			fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User,toolItem);
			User:changeSource(SourceItem);
			User:startAction( fishing.SavedWorkTime[User.id], 0, 0, 0, 0);
		end
	end
	if amount == 0 then
		table.insert(scheduled.placeShoal.shoalPositions,{counter = Random.uniform(15,20),shoalPosition = SourceItem.pos})
		world:erase(SourceItem,1)
		User:inform("Du scheinst hier alles leergefischt zu haben.",
			        "You seem to have caught all the fish here.",Player.highPriority)
		return
	end

	if base.common.GatheringToolBreaks( User, toolItem, fishing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Angel zerbricht.",
		"Your old fishing rod breaks.");
		return
	end
end
