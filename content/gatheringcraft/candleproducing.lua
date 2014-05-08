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

-- wax (431) --> candles (43)

-- additional static tool: chandler table (428)

-- additional tool: candlemold(429)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.candleproducing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local candleproducing = content.gathering.candleproducing;

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
	if (User:countItemAt("all",429)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Kerzenform um Kerzen herzustellen.",
		"You need a candle mold for producing candles." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 429 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 429 ) then
			base.common.HighInformNLS( User,
			"Du musst die Kerzenform in der Hand haben!",
			"You have to hold the candle mold in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	if (User:countItemAt("all",431)==0) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Wachs um Kerzen herzustellen.",
		"You need wax for producing candles." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		candleproducing.SavedWorkTime[User.id] = candleproducing:GenWorkTime(User, toolItem);
		User:startAction( candleproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Kerzen zu ziehen.", "#me starts to make candles.")
		return
	end

	-- since we're here, we're working

	if candleproducing:FindRandomItem(User) then
		return
	end

	User:learn( candleproducing.LeadSkill, candleproducing.SavedWorkTime[User.id], candleproducing.LearnLimit);
	User:eraseItem( 431, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 43, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 43, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",431)>0) then  -- there are still items we can work on
			candleproducing.SavedWorkTime[User.id] = candleproducing:GenWorkTime(User, toolItem);
			User:startAction( candleproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Wachs mehr.",
			"You have no wax anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, candleproducing:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Kerzenform zerbricht.",
		"Your old candle mold breaks.");
		return
	end
end
