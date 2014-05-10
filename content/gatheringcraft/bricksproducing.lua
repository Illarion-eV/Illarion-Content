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

-- clay (26) --> unfired bricks (736)
-- 1x unfired bricks (736) --> 1x bricks (2588)

-- additional tool: brick mould (734)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.bricksproducing", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();

    if (User:countItemAt("all",26)>0) then
      ProduceUnfiredBricks( User, SourceItem, ltstate );
    elseif (User:countItemAt("all",736)>0) then
      ProduceBricks( User, SourceItem, ltstate );
    else
      base.common.HighInformNLS( User,
      "Du brauchst Lehm oder ungebrannte Ziegel um mit der Ziegelform hier zu arbeiten.",
      "You need clay or unfired bricks to work here with the brick mould." );
    end
end

function ProduceUnfiredBricks( User, SourceItem, ltstate )
	local bricksproducing = content.gathering.bricksproducing;

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
	if (User:countItemAt("all",734)==0) then
		User:inform("[ERROR] No brick mould found. Please inform a developer.");
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 734 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 734 ) then
			base.common.HighInformNLS( User,
			"Du musst die Ziegelform in der Hand haben!",
			"You have to hold the brick mould in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?
  if (User:countItemAt("all",26)==0) then
		User:inform("[ERROR] No clay found. Please inform a developer.");
		return
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
		User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt ungebrannte Ziegel herzustellen.", "#me starts to produce unfired bricks.")
		return
	end

	-- since we're here, we're working

	if bricksproducing:FindRandomItem(User) then
		return
	end

	User:learn( bricksproducing.LeadSkill, bricksproducing.SavedWorkTime[User.id], bricksproducing.LearnLimit);
	User:eraseItem( 26, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 736, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 736, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",26)>0) then  -- there are still items we can work on
			bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
			User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
      -- Should actually never reach this, handle it nevertheless.
			base.common.HighInformNLS(User,
			"Du hast keinen Lehm mehr.",
			"You have no clay anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, bricksproducing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Ziegelform zerbricht.",
		"Your old brick mould breaks.");
		return
	end
end

function ProduceBricks( User, SourceItem, ltstate )
	local bricksproducing = content.gathering.bricksproducing;

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
	if (User:countItemAt("all",734)==0) then
		User:inform("[ERROR] No brick mould found. Please inform a developer.");
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 734 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 734 ) then
			base.common.HighInformNLS( User,
			"Du musst die Ziegelform in der Hand haben!",
			"You have to hold the brick mould in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?
  if (User:countItemAt("all",736)<1) then
		User:inform("[ERROR] Not enough unfired bricks found. Please inform a developer.");
		return
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
		User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Ziegel zu brennen.", "#me starts to fire bricks.")
		return
	end

	-- since we're here, we're working

	if bricksproducing:FindRandomItem(User) then
		return
	end

	User:learn( bricksproducing.LeadSkill, bricksproducing.SavedWorkTime[User.id], bricksproducing.LearnLimit);
	User:eraseItem( 736, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 2588, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2588, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",736)>0) then  -- there are still items we can work on
			bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
			User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
      -- Should actually never reach this, handle it nevertheless.
			base.common.HighInformNLS(User,
			"Du hast nicht mehr genug ungebrannte Ziegel.",
			"You don't have enough unfired bricks anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, bricksproducing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Ziegelform zerbricht.",
		"Your old brick mould breaks.");
		return
	end
end
