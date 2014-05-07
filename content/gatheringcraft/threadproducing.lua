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

-- spinning wheel ( 171 )

-- 2x wool (170)  --> thread (50)
-- 3x sibanac leaf (155) --> thread (50)

-- additional tool: scissors (6)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.threadproducing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local threadproducing = content.gathering.threadproducing;

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
	if (User:countItemAt("all",6)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Schere um Garn herzustellen.",
		"You need a pair of scissors for producing thread." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 6 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 6 ) then
			base.common.HighInformNLS( User,
			"Du musst die Schere in der Hand haben!",
			"You have to hold the scissors in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	if (User:countItemAt("all",170)<1 and User:countItemAt("all",155)<3) then -- check for items to work on
		if (User:countItemAt("all",170)==0 and User:countItemAt("all",155)==0) then
			base.common.HighInformNLS( User,
			"Du brauchst Wolle oder Sibanacblätter um Garn herzustellen.",
			"You need wool or sibanac leaves for producing thread." );
		else
			base.common.HighInformNLS( User,
			"Du hast nicht genug Wolle oder Sibanacblätter um Garn herzustellen.",
			"You don't have enough wool or sibanac leaves for producing thread." );
		end
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		threadproducing.SavedWorkTime[User.id] = threadproducing:GenWorkTime(User,toolItem);
		User:startAction( threadproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Garn herzustellen.", "#me starts to produce thread.")
		return
	end

	-- since we're here, we're working

	if threadproducing:FindRandomItem(User) then
		return
	end

	User:learn( threadproducing.LeadSkill, threadproducing.SavedWorkTime[User.id], threadproducing.LearnLimit);
	local itemId = 170; -- first check for wool
	local eraseCount = 1;
	if ( User:countItemAt("all",170)<1 ) then
		itemId = 155; -- not enough wool, then there must be enough sibanac leaves
		eraseCount = 3;
		if ( User:countItemAt("all",155)<3 ) then
			-- this should never happen ...
			User:inform("[ERROR] Not enough wool and sibanac leaves. Please inform a developer.");
			return;
		end
	end
	User:eraseItem( itemId, eraseCount ); -- erase the item we're working on

	local notCreated = User:createItem( 50, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 50, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if ((User:countItemAt("all",170)>=1 or User:countItemAt("all",155)>=3)) then  -- there are still items we can work on
			threadproducing.SavedWorkTime[User.id] = threadproducing:GenWorkTime(User,toolItem);
			User:startAction( threadproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- not enough items left
			base.common.HighInformNLS( User,
			"Du hast nicht mehr genug Wolle oder Sibanacblätter.",
			"You don't have enough wool or sibanac leaves anymore." );
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, threadproducing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end

end
