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

-- logs (2560,543,544,3) --> potash (314)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.potashproducing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local potashproducing = content.gathering.potashproducing;

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

	if ((User:countItemAt("all",2560) == 0) and (User:countItemAt("all",543) == 0) and
		(User:countItemAt("all",544) == 0) and (User:countItemAt("all",3) == 0)) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Holz um Pottasche zu produzieren.",
		"You need wood for producing potash." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		potashproducing.SavedWorkTime[User.id] = potashproducing:GenWorkTime(User,nil);
		User:startAction( potashproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Pottasche herzustellen.", "#me starts to produce potash.")
		return
	end

	-- since we're here, we're working

	if potashproducing:FindRandomItem(User) then
		return
	end

	User:learn( potashproducing.LeadSkill, potashproducing.SavedWorkTime[User.id], potashproducing.LearnLimit);
	local woodList = {2560,543,544,3};
	local woodID = 0;
	for _,wood in pairs(woodList) do
	if (User:countItemAt("all",wood)>0) then
					woodID = wood;
					break;
			end
	end
	User:eraseItem( woodID, 1 ); -- erase the item we're working on
	local amount = 3; -- set the amount of items that are produced
	local notCreated = User:createItem( 314, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 314, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if ((User:countItemAt("all",2560) > 0) or (User:countItemAt("all",543) > 0) or
            (User:countItemAt("all",544) > 0) or (User:countItemAt("all",3) > 0)) then   -- there are still items we can work on
			potashproducing.SavedWorkTime[User.id] = potashproducing:GenWorkTime(User,nil);
			User:startAction( potashproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Holz mehr.",
			"You have no wood anymore.");
		end
	end
end
