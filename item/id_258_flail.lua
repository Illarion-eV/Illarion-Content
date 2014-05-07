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
-- flail ( 258 )

-- bundle of grain (249)  --> grain (259)

-- UPDATE common SET com_script='item.id_258_flail' WHERE com_itemid IN (258);

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_258_flail", package.seeall, package.seeall(item.general.wood))

LookAtItem = item.general.wood.LookAtItem

function UseItem(User, SourceItem, ltstate)
	content.gathering.InitGathering();
	local flailing = content.gathering.flailing;

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

	if (SourceItem:getType() ~= 4) then -- tool in Hand
		base.common.HighInformNLS( User,
		"Du musst den Dreschflegel in der Hand haben!",
		"You have to hold the flail in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if (User:countItemAt("all",249)==0) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst Getreidebündel um Getreide zu dreschen.",
		"You need bundles of grain for flailing grain." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		flailing.SavedWorkTime[User.id] = flailing:GenWorkTime(User,SourceItem);
		User:startAction( flailing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt Getreide zu dreschen.", "#me starts to flail grain.")
		return
	end

	-- since we're here, we're working

	if flailing:FindRandomItem(User) then
		return
	end

	User:learn( flailing.LeadSkill, flailing.SavedWorkTime[User.id], flailing.LearnLimit);
	User:eraseItem( 249, 1 ); -- erase the item we're working on
	-- you always get at least one
  local amount = 1;
  -- in 50% of all cases one more
  if (math.random(1,2) == 1) then
    amount = amount + 1;
  end
  -- and another one depending on the skill
  if (User:getSkill(flailing.LeadSkill) > math.random(1,100)) then
    amount = amount + 1;
  end
	local notCreated = User:createItem( 259, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 259, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",249)>0) then  -- there are still items we can work on
			flailing.SavedWorkTime[User.id] = flailing:GenWorkTime(User,SourceItem);
			User:startAction( flailing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Getreidebündel mehr.",
			"You have no bundle of grain anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem, flailing:GenWorkTime(User,SourceItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein alter Dreschflegel zerbricht.",
		"Your old flail breaks.");
		return
	end
end
