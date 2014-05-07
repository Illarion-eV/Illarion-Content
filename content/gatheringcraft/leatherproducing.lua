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

-- stretcher(2052)

-- { raw leather (69), fur (2586) } --> leather (2547)

-- additional tool: razor blade (2746)


require("base.common")
require("content.gathering")

module("content.gatheringcraft.leatherproducing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local leatherproducing = content.gathering.leatherproducing;

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
	if (User:countItemAt("all",2746)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Rasierklinge um Leder zu gerben.",
		"You need a razor blade for tanning leather." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2746 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2746 ) then
			base.common.HighInformNLS( User,
			"Du musst das Rasierklinge in der Hand haben!",
			"You have to hold the razor blade in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?

	if (User:countItemAt("all",2586)==0 and User:countItemAt("all",69)==0) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Fell oder rohes Leder um es zu gerben.",
		"You need fur or raw leather for tanning it." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		leatherproducing.SavedWorkTime[User.id] = leatherproducing:GenWorkTime(User,toolItem);
		User:startAction( leatherproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Leder zu gerben.", "#me starts to tan leather.")
		return
	end

	-- since we're here, we're working

	if leatherproducing:FindRandomItem(User) then
		return
	end

  local tanItemId = 0;
  if (User:countItemAt("all",69)>0) then
    tanItemId = 69;
  elseif (User:countItemAt("all",2586)>0) then
    tanItemId = 2586;
  end
  if (tanItemId == 0) then
    User:inform("[ERROR] No tanning item found. Please inform a developer.");
    return;
  end
	User:learn( leatherproducing.LeadSkill, leatherproducing.SavedWorkTime[User.id], leatherproducing.LearnLimit);
	User:eraseItem( tanItemId, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 2547, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2547, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",2586)>0 or User:countItemAt("all",69)>0) then  -- there are still items we can work on
			leatherproducing.SavedWorkTime[User.id] = leatherproducing:GenWorkTime(User,toolItem);
			User:startAction( leatherproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Fell und rohes Leder mehr.",
			"You have no fur and raw leather anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, leatherproducing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Rasierklinge zerbricht.",
		"Your old razor blade breaks.");
		return
	end
end
