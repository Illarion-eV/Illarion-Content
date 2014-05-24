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

-- smokingoven (305)

-- pork (307) --> ham (306)
-- trout (73) --> smoked fish (455)
-- salmon (355) --> smoked fish (455)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.egggathering", package.seeall)

function StartGathering(User, SourceItem, ltstate)
	local EMPTY_NEST = 1172
	local FILLED_NEST = 1171
	local EGG = 1150

	content.gathering.InitGathering();
	local egggathering = content.gathering.egggathering;

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

	-- Disabled in order to give a hungry player a chance to strengthen.
	-- if not base.common.FitForWork( User ) then -- check minimal food points
		-- return
	-- end
	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	if SourceItem.id == EMPTY_NEST  then
      User:inform("Hier befinden sich keine Eier.","There are no eggs here.",Player.highPriority)
	  return;
	end
	-- check the amount
	local amountStr = SourceItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	else
		-- first time that this item is harvested
		amount = 10;
		SourceItem:setData("amount","" .. amount);
		world:changeItem(SourceItem);
    User:changeSource(SourceItem);
	end
	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		return;
	end
	if ( amount == 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Zero amount for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		return;
	end

	-- since we're here, there is something we can harvest

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		egggathering.SavedWorkTime[User.id] = egggathering:GenWorkTime(User,nil);
		User:startAction( egggathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Eier zu sammeln.", "#me starts to gather eggs.")
		return
	end

	-- since we're here, we're working

	if egggathering:FindRandomItem(User) then
		return
	end

	User:learn( egggathering.LeadSkill, egggathering.SavedWorkTime[User.id], egggathering.LearnLimit);
	amount = amount - 1;
	local notCreated = User:createItem( EGG, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( EGG, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (amount>0) then  -- there are still fruits we can gather
			egggathering.SavedWorkTime[User.id] = egggathering:GenWorkTime(User,nil);
			User:startAction( egggathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		end
	end
	if (amount<=0) then
      base.common.HighInformNLS(User,
      "Dieses Nest ist leer.",
      "This nest is empty." );
	  -- reset amount
		amount = 10;
		SourceItem:setData("amount","" .. amount);
		world:changeItem(SourceItem);
			-- change item id
		world:swap(SourceItem, EMPTY_NEST, 333);
		return;
    end

	SourceItem:setData("amount","" .. amount);
	world:changeItem(SourceItem);
	User:changeSource(SourceItem);
end
