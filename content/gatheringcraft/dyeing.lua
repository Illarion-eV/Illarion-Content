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

-- barrel (220)

-- white dye (2683) + gray cloth (176) --> white cloth (178)
-- color dye + (white cloth (178) or grey cloth (176) --> colored cloth (see below for details)

-- additional tool: dyeing rod (2781)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.dyeing", package.seeall)

-- format: {dyeID, neededClothID, producedClothID}
dyersList = {
  {2678, {176,0}, 175},  -- black
  {2679, {176,0}, 54},   -- green
  {2680, {176,0}, 179},  -- blue
  {2681, {176,0}, 174},  -- red
  {2682, {176,0}, 177},  -- yellow
  {2683, {176,0}, 178}   -- white
};

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local dyeing = content.gathering.dyeing;

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
	if (User:countItemAt("all",2781)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst einen Färberstab um Stoffe zu färben.",
		"You need a dyeing rod for dyeing cloth." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2781 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2781 ) then
			base.common.HighInformNLS( User,
			"Du musst den Färberstab in der Hand haben!",
			"You have to hold the dyeing rod in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	local dye = nil;
	for _,d in pairs(dyersList) do
		if (User:countItemAt("all",d[1])>0 and (User:countItemAt("all",d[2][1])>0 or User:countItemAt("all",d[2][2])>0)) then
			dye = d;
			break;
		end
	end

	if (dye == nil) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst grauen Stoff und Färbemittel um zu färben.",
		"You need grey cloth and dye for dyeing." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		dyeing.SavedWorkTime[User.id] = dyeing:GenWorkTime(User,toolItem);
		User:startAction( dyeing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Stoff zu färben.", "#me starts to dye cloth.")
		return
	end

	-- since we're here, we're working

	if dyeing:FindRandomItem(User) then
		return
	end

	User:learn( dyeing.LeadSkill, dyeing.SavedWorkTime[User.id], dyeing.LearnLimit);
	User:eraseItem( dye[1], 1 ); -- erase the item we're working on
	if User:countItemAt("all",dye[2][2]) == 0 then
		User:eraseItem( dye[2][1], 5 ); -- erase the item we're working on
	else
		User:eraseItem( dye[2][2], 5 ); -- erase the item we're working on
	end
	local amount = 5; -- set the amount of items that are produced
	local notCreated = User:createItem( dye[3], amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( dye[3], notCreated, User.pos, true, 333, nil );
		world:createItemFromId( 51, 1, User.pos, true, 333, nil ); -- giving back the bucket
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		notCreated = User:createItem( 51, 1, 333, nil ); -- giving back the bucket
		if ( notCreated > 0 ) then
			world:createItemFromId( 51, 1, User.pos, true, 333, nil );
			base.common.HighInformNLS(User,
			"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
			"You can't carry any more and the rest drops to the ground.");
		end
	end

	if (notCreated == 0) then -- character can go on
		dye = nil;
		for _,d in pairs(dyersList) do
			if (User:countItemAt("all",d[1])>0 and (User:countItemAt("all",d[2][1])>0 or User:countItemAt("all",d[2][2])>0)) then
				dye = d;
				break;
			end
		end
		if (dye ~= nil) then  -- there are still items we can work on
			dyeing.SavedWorkTime[User.id] = dyeing:GenWorkTime(User,toolItem);
			User:startAction( dyeing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast keine Farbe oder Stoff mehr.",
			"You have no dye or cloth anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, dyeing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein alter Färberstab zerbricht.",
		"Your old dyeing rod breaks.");
		return
	end
end
