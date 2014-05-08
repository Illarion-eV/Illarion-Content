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

require("base.common")
require("content.gathering")

module("content.gatheringcraft.milking", package.seeall)

function isMilkable(targetCharacter)

	local milkableAnimals = {181, 371}; -- sheep, cow

	for i=1, #milkableAnimals do
		if targetCharacter:getMonsterType() == milkableAnimals[i] then
			return true;
		end
	end
	return false;
end


function StartGathering(User, SourceAnimal, ltstate)

	content.gathering.InitGathering();
	local milking = content.gathering.milking;

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

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceAnimal.pos ); -- turn if necessary

	if (User:countItemAt("all",2498) == 0) then -- check for items to work on
		base.common.HighInformNLS( User,
		"Du brauchst eine leere Flasche um zu melken.",
		"You need an empty bottle for milking." );
		return;
	end

	-- should be fine already, but check it nevertheless
	if ( SourceAnimal == nil or (SourceAnimal ~= nil and not isMilkable(SourceAnimal) )) then
		base.common.HighInformNLS( User,
		"Du musst vor einem Tier stehen, um es zu melken.",
		"You have to stand in front of an animal for milk it." );
		return;
	end

	-- check if animal still gives milk
	local foundEffect, milkingEffect = SourceAnimal.effects:find(401);
    if (not foundEffect) then
		milkingEffect = LongTimeEffect(401, 3000); -- call every 5min
		milkingEffect:addValue("gatherAmount", 0);
		SourceAnimal.effects:addEffect(milkingEffect);
	end
	local foundAmount, gatherAmount = milkingEffect:findValue("gatherAmount");

	-- currently not working, let's go
	if ( ltstate == Action.none ) then

		if gatherAmount >= 3 then
			base.common.HighInformNLS( User,
			"Dieses Tier wurde rest kürzlich gemolken und gibt momentan keine Milch.",
			"This animal was milked recently and doesn't give milk right now." );
			return;
		end
		milking.SavedWorkTime[User.id] = milking:GenWorkTime(User, nil);
		SourceAnimal.movepoints = -1 * milking.SavedWorkTime[User.id]; -- make sure the animal doesn't move away
		User:startAction(milking.SavedWorkTime[User.id], 21, 5, 10, 25);
		User:talk(Character.say, "#me beginnt ein Tier zu melken.", "#me starts to milk an animal.")
		return;
	end

	-- since we're here, we're working
	if milking:FindRandomItem(User) then
		return
	end

	User:learn( milking.LeadSkill, milking.SavedWorkTime[User.id], milking.LearnLimit);

	gatherAmount = gatherAmount + 1
	milkingEffect:addValue("gatherAmount", gatherAmount);

	User:eraseItem(2498, 1);
	local notCreated = User:createItem( 2502, 1, 333, nil); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2502, notCreated, User.pos, true, 333, nil);
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	elseif gatherAmount < 3 then  -- character can still carry something and more milk is available
		if User:countItemAt("all",2498) == 0 then -- no empty bottles left
			return
		end
		milking.SavedWorkTime[User.id] = milking:GenWorkTime(User, nil);
		SourceAnimal.movepoints = -1 * milking.SavedWorkTime[User.id]; -- make sure the animal doesn't move away
		User:startAction(milking.SavedWorkTime[User.id], 21, 5, 10, 25);
	else
		base.common.HighInformNLS( User,
		"Dieses Tier ist ausreichend gemolken und gibt keine Milch mehr.",
		"This animal is milked properly and doesn't give any more milk." );
	end
end
