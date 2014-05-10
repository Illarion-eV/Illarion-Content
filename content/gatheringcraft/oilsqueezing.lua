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

-- squeezer (44)

-- 2x black thistle (141) --> lamp oil (390)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.oilsqueezing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local oilsqueezing = content.gathering.oilsqueezing;

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

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	if (User:countItemAt("all",141)<1) then -- check for items to work on
		if (User:countItemAt("all",141)==0) then
			base.common.HighInformNLS( User,
			"Du brauchst schwarze Disteln um daraus Öl zu pressen.",
			"You need black thistles for squeezing oil." );
		else
			base.common.HighInformNLS( User,
			"Du hast nicht genug schwarze Disteln um daraus Öl zu pressen.",
			"You don't have enough black thistles for squeezing oil." );
		end
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		oilsqueezing.SavedWorkTime[User.id] = oilsqueezing:GenWorkTime(User,nil);
		User:startAction( oilsqueezing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Öl zu pressen.", "#me starts to squeeze oil.")
		return
	end

	-- since we're here, we're working

	if oilsqueezing:FindRandomItem(User) then
		return
	end

	User:learn( oilsqueezing.LeadSkill, oilsqueezing.SavedWorkTime[User.id], oilsqueezing.LearnLimit);
	User:eraseItem( 141, 2 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 390, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 390, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",141)>=2) then  -- there are still items we can work on
			oilsqueezing.SavedWorkTime[User.id] = oilsqueezing:GenWorkTime(User,nil);
			User:startAction( oilsqueezing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast nicht mehr genug schwarze Disteln.",
			"You don't have enough black thistles anymore.");
		end
	end
end
