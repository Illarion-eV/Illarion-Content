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

-- glassmeltoven(313)

-- quartz sand (316) + potash (314) --> glass ingot (41)

-- additional tool: glass blow pipe (311)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.glassingotproducing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local glassingotproducing = content.gathering.glassingotproducing;

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
	if (User:countItemAt("all",311)==0) then
		User:inform("[ERROR] No glass blowing pipe found. Please inform a developer.");
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 311 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 311 ) then
			base.common.HighInformNLS( User,
			"Du musst das Glasblasrohr in der Hand haben!",
			"You have to hold the glass blow pipe in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	if (User:countItemAt("all",316)==0 or User:countItemAt("all",314)==0) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Quarzsand und Pottasche um Glasblöcke herzustellen.",
		"You need quartz sand and potash for producing glass ingots." );
    return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		glassingotproducing.SavedWorkTime[User.id] = glassingotproducing:GenWorkTime(User,toolItem);
		User:startAction( glassingotproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Glasblöcke herzustellen.", "#me starts to produce glass ingots.")
		return
	end

	-- since we're here, we're working

	if glassingotproducing:FindRandomItem(User) then
		return
	end

	User:learn( glassingotproducing.LeadSkill, glassingotproducing.SavedWorkTime[User.id], glassingotproducing.LearnLimit);
	User:eraseItem( 316, 1 ); -- erase the item we're working on
  User:eraseItem( 314, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 41, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 41, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",316)>0 and User:countItemAt("all",314)>0) then  -- there are still items we can work on
			glassingotproducing.SavedWorkTime[User.id] = glassingotproducing:GenWorkTime(User,toolItem);
			User:startAction( glassingotproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du brauchst Quarzsand und Pottasche um Glasblöcke herzustellen.",
      "You need quartz sand and potash for producing glass ingots." );
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, glassingotproducing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein altes Glasblasrohr zerbricht.",
		"Your old glass blow pipe breaks.");
		return
	end
end
