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

-- CLAY_PIT (1206)

-- additional tool: shovel ( 24 )

require("base.common")
require("content.gathering")

module("content.gatheringcraft.claydigging", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local claydigging = content.gathering.claydigging;

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
	if (User:countItemAt("all",24)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Schaufel um zu graben.",
		"You need a shovel for digging." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~=24 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 24 ) then
			base.common.HighInformNLS( User,
			"Du musst die Schaufel in der Hand haben!",
			"You have to hold the shovel in your hand!" );
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
		-- first time that a (static!) herb item is harvested
		amount = MaxAmount;
		SourceItem:setData("amount","" .. MaxAmount);
		changeItem = true;
	end
	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. ". Please inform a developer.");
		return;
	end
	if ( amount <= 1 ) then
		-- check for regrow even at amount==1, so a continuous working is guaranteed
		-- only non farming items regrow
		local serverTime = world:getTime("unix");
		for i=1,MaxAmount do
			local t = SourceItem:getData("next_regrow_" .. i);
			if ( t ~= "" and tonumber(t) <= serverTime ) then
				-- regrow
				amount = amount + 1;
				SourceItem:setData("next_regrow_" .. i, "");
				changeItem = true;
			end
		end
		if ( amount == 0 ) then
			-- not regrown...
			base.common.HighInformNLS( User,
			"An dieser Stelle gibt es nicht mehrs zu holen.",
			"There isn't anything left in this pit." );
			if ( changeItem ) then
				world:changeItem(SourceItem);
			end
			return;
		elseif ( amount > MaxAmount ) then
			-- this should never happen
			User:inform("[ERROR] Too high amount " .. amount .. " for item id " .. SourceItem.id .. ". Please inform a developer.");
			if ( changeItem ) then
				world:changeItem(SourceItem);
			end
			return;
		else
			SourceItem:setData("amount", "" .. amount);
			changeItem = true;
		end
	end

	-- currently not working -> let's go

	if ( ltstate == Action.none ) then
		claydigging.SavedWorkTime[User.id] = claydigging:GenWorkTime(User,toolItem);
		User:startAction( claydigging.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt nach Lehm zu graben.", "#me starts to dig for clay.")
		return
	end

	-- since we're here, we're working

	if claydigging:FindRandomItem(User) then
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return
	end

	amount = amount - 1;
	-- update the amount
	SourceItem:setData("amount", "" .. amount);
	changeItem = true;
	-- and update the next regrow
	local regrowOk = false;
	for i=1,MaxAmount do
		local t = SourceItem:getData("next_regrow_" .. i);
		-- look for a free slot
		if ( t == "") then
			SourceItem:setData("next_regrow_" .. i, "" .. world:getTime("unix") + 300);
			regrowOk = true;
			changeItem = true;
			break;
		end
	end
	if ( not regrowOk ) then
		-- there was no free slot, this should never happen
		User:inform("[ERROR] There was no regrow slot for item id " .. SourceItem.id .. ". Please inform a developer.");
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return;
	end

  if ( changeItem ) then
		world:changeItem(SourceItem);
	end

	User:learn( claydigging.LeadSkill, claydigging.SavedWorkTime[User.id], claydigging.LearnLimit);
	local notCreated = User:createItem( 26, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 26, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
	else -- character can still carry something
		claydigging.SavedWorkTime[User.id] = claydigging:GenWorkTime(User,toolItem);
		User:changeSource(SourceItem);
		User:startAction( claydigging.SavedWorkTime[User.id], 0, 0, 0, 0);
	end

	if base.common.GatheringToolBreaks( User, toolItem, claydigging:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schaufel zerbricht.",
		"Your old shovel breaks.");
		return
	end

end
