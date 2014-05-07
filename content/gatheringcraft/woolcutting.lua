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

-- sheep (monster 18) --> wool (170)

-- additional tool: scissors (6)

require("base.common")
require("content.gathering")

module("content.gatheringcraft.woolcutting", package.seeall)

function StartGathering(User, SourceAnimal, ltstate)

	content.gathering.InitGathering();
	local woolcutting = content.gathering.woolcutting;

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

--	if not base.common.CheckItem( User, SourceItem ) then -- security check
--		return
--	end

	-- additional tool item is needed
	if (User:countItemAt("all",6)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Schere um zu Wolle zu scheren.",
		"You need a pair of scissors for shearing a sheep." );
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

	base.common.TurnTo( User, SourceAnimal.pos ); -- turn if necessary

	-- Sheep should actually be already a sheep character struct, but check it nevertheless
	if ( SourceAnimal == nil or (SourceAnimal ~= nil and SourceAnimal:getRace()~=18) ) then
		base.common.HighInformNLS( User,
		"Du musst vor einem Schaf stehen, um es zu scheren.",
		"You have to stand in front of a sheep for shearing it." );
		return;
	end

	-- check if sheep still gives wool
	local foundEffect, shearingEffect = SourceAnimal.effects:find(402);
    if (not foundEffect) then
		shearingEffect = LongTimeEffect(402, 1800); -- call every 3min
		shearingEffect:addValue("gatherAmount", 0);
		SourceAnimal.effects:addEffect(shearingEffect);
	end
	local foundAmount, gatherAmount = shearingEffect:findValue("gatherAmount");

	if ( ltstate == Action.none ) then -- currently not working -> let's go

		if gatherAmount >= 100 then
			base.common.HighInformNLS( User,
			"Dieses Schaf wurde kürzlich erst geschoren und gibt momentan keine Wolle.",
			"This sheep has been sheared recently and doesn't give wool right now." );
			return;
		end
		woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User, toolItem);
		User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 2, 20);
		User:talk(Character.say, "#me beginnt ein Schaf zu scheren.", "#me starts to shear a sheep.")
		-- make sure the sheep doesn't move away
		SourceAnimal.movepoints = math.min(SourceAnimal.movepoints, -1*woolcutting.SavedWorkTime[User.id]);
		return;
	end

	-- since we're here, we're working

	if woolcutting:FindRandomItem(User) then
		return
	end

	User:learn( woolcutting.LeadSkill, woolcutting.SavedWorkTime[User.id], woolcutting.LearnLimit);

	gatherAmount = gatherAmount + 1
	shearingEffect:addValue("gatherAmount", gatherAmount);

	local notCreated = User:createItem( 170, 1, 333, nil); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 170, notCreated, User.pos, true, 333, nil);
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	elseif gatherAmount < 100 then -- character can still carry something and more wool is available
		woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User, toolItem);
		User:changeSource(SourceAnimal);
		User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 2, 20);
		-- make sure the sheep doesn't move away
		SourceAnimal.movepoints = math.min(SourceAnimal.movepoints, -1*woolcutting.SavedWorkTime[User.id]);
	else
		base.common.HighInformNLS( User,
		"Dieses Schaf ist nun geschoren und gibt keine Wolle mehr.",
		"This sheep is now sheared properly and doesn't give any more wool." );
	end

	if base.common.GatheringToolBreaks( User, toolItem, woolcutting:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end
end
