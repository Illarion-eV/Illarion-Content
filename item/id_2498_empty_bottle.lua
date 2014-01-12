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

-- UPDATE common SET com_script='item.id_2498_empty_bottle' WHERE com_itemid IN (2498);

require("base.common");
module("item.id_2498_empty_bottle", package.seeall)

function UseItem(User, SourceItem, ltstate)

	-- milking

	-- check for sheep or cow in front
	local targetCharacter = base.common.GetFrontCharacter(User);
	if (targetCharacter ~= nil and isMilkable(targetCharacter)) then
		UseItemMilking(User, SourceItem, ltstate, targetCharacter);
		return;
	end

	-- look for a nearby sheep or cow
	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isCharacterOnField(pos) ) then
				targetCharacter = world:getCharacterOnField(pos);
				if (isMilkable(targetCharacter)) then
					UseItemMilking(User, SourceItem, ltstate, targetCharacter);
					return;
				end
			end
		end
	end


	-- water scooping

	-- check for well or fountain
	local TargetItem = base.common.GetItemInArea(User.pos, 2207);
	if (TargetItem == nil) then
		TargetItem = base.common.GetItemInArea(User.pos, 631);
		if (TargetItem == nil) then
			TargetItem = base.common.GetItemInArea(User.pos, 2079);
		end
	end
	if (TargetItem ~= nil) then
		if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
			base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
		end
		UseItemScooping(User, SourceItem, ltstate);
		return;
	end

	-- check for water tile
	local targetPos = GetWaterTilePosition(User);
	if (targetPos ~= nil) then
		if not base.common.IsLookingAt( User, targetPos ) then -- check looking direction
			base.common.TurnTo( User, targetPos ); -- turn if necessary
		end
		UseItemScooping(User, SourceItem, ltstate);
		return;
	end

	-- nothing found to fill the bottle
	base.common.InformNLS(User,
	  "Du kannst Flaschen an einem Brunnen oder an einem Gewässer füllen, oder ein geeignetes Tier melken.",
	  "You can fill bottles at a well or at some waters, or milk an adequate domestic animal.");

end

function GetWaterTilePosition(User)
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local targetPos = position(User.pos.x + x, User.pos.y, User.pos.z);
      if (base.common.GetGroundType(world:getField(targetPos):tile()) == base.common.GroundType.water) then
        return targetPos;
      end
    end
  end
  return nil;
end

function UseItemScooping(User, SourceItem, ltstate)

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

	-- currently not working, let's go
    if ( ltstate == Action.none ) then
		User:startAction( 20, 21, 5, 10, 25);
		User:talk(Character.say, "#me beginnt eine Flasche zu befüllen.", "#me starts to fill a bottle.")
		return
	end

	-- actually do the work, but only once because nobody wants to fill multiple bottles
	world:erase(SourceItem, 1);
	local notCreated = User:createItem( 2496, 1, 999, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2496, notCreated, User.pos, true, 999, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
	end

--[[ !!! OLD OLD OLD !!!
-- Fairy's Tears oder Trolls Blood erhalten (Quellwasser)
-- Alternativ: Gesegnetes Wasser von Irundar erhalten
-- vilarion

   if (base.common.IsItemInHands(SourceItem)) then
        -- bottle in hand
		local frontPos = base.common.GetFrontPosition(User);
		-- TODO: convert quests & positions to New Illarion
        -- if ( frontPos == position( 32, 190, -12 ) ) then -- Irundar
            -- local progress = User:getQuestProgress(1);
            -- if ((LuaAnd( progress, 64 ) == 0) or (LuaAnd( progress, 3840 ) ~= (world:getTime("month")-1)*256)) then
				-- if ( User:createItem( 2496, 1, 999, 3 ) == 0 ) then
					-- world:erase(SourceItem,1);
					-- world:gfx(41,User.pos);
					-- world:gfx(41,position( 25, 190, -12 ));
					-- world:makeSound(13,User.pos);
					-- world:makeSound(13,position( 25, 190, -12 ));
					-- User:warp(position( 25, 190, -12 ));

					-- progress = LuaOr( progress, 64 ); -- set "fetched at least once"
					-- progress = LuaAnd( progress, 4294963455 ); -- clear bit 9-12 (last month when fetched)
					-- progress = LuaOr( progress, (world:getTime("month")-1)*256 ); -- set bit 13-16 (last month when fetched)
					-- User:setQuestProgress( 1, progress );
				-- end;
			-- else
				-- if User:getPlayerLanguage(  ) == 0 then
					-- User:inform("Der Springbrunnen ist ausgetrocknet.");
				-- else
					-- User:inform("The fountain has dried up.");
				-- end;
            -- end;
		-- elseif (frontPos == position(51, -55, 0)) then -- Troll's Vein
            -- --User:inform("at vein");
			-- local itempos = SourceItem.itempos;
			-- local number = SourceItem.number;
			-- world:erase(SourceItem,number);
			-- User:createAtPos(itempos, 2496, number);
			-- local bottles = User:getItemAt(itempos);
			-- bottles.data = 1;
			-- bottles.number = number;
			-- world:changeItem(bottles);
		-- elseif (frontPos == position(116, -121, 0)) then -- Fairy's Tears
            -- --User:inform("at tears");
			-- local itempos = SourceItem.itempos;
			-- local number = SourceItem.number;
			-- world:erase(SourceItem,number);
			-- User:createAtPos(itempos, 2496, number);
			-- local bottles = User:getItemAt(itempos);
			-- bottles.data = 2;
			-- bottles.number = number;
			-- world:changeItem(bottles);
        -- end;
    end;
	OLD END ]]
end

function isMilkable(targetCharacter)

	local milkableAnimals = {181, 371}; -- sheep, cow

	for i=1, #milkableAnimals do
		if targetCharacter:getMonsterType() == milkableAnimals[i] then
			return true;
		end
	end
	return false;
end

function UseItemMilking(User, SourceItem, ltstate, Animal)

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

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, Animal.pos ) then -- check looking direction
		base.common.TurnTo( User, Animal.pos ); -- turn if necessary
	end

	-- should be fine already, but check it nevertheless
	if ( Animal == nil or (Animal ~= nil and not isMilkable(Animal) )) then
		base.common.HighInformNLS( User,
		"Du musst vor einem Tier stehen, um es zu melken.",
		"You have to stand in front of an animal for milk it." );
		return;
	end

	-- check if animal still gives milk
	local foundEffect, milkingEffect = Animal.effects:find(401);
    if (not foundEffect) then
		milkingEffect = LongTimeEffect(401, 3000); -- call every 5min
		milkingEffect:addValue("gatherAmount", 0);
		Animal.effects:addEffect(milkingEffect);
	end
	local foundAmount, gatherAmount = milkingEffect:findValue("gatherAmount");

	-- currently not working, let's go
	if ( ltstate == Action.none ) then

		if gatherAmount >= 3 then
			base.common.HighInformNLS( User,
			"Dieses Tier wurde rest kürzlich gemolken und gibt momentan keine Milch.",
			"This animal was milked recently and doesnt give milk right now." );
			return;
		end
		milking.SavedWorkTime[User.id] = milking:GenWorkTime(User, SourceItem);
		Animal.movepoints = -1 * milking.SavedWorkTime[User.id]; -- make sure the animal doesn't move away
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

	world:erase(SourceItem, 1);
	local notCreated = User:createItem( 2502, 1, 333, nil); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2502, notCreated, User.pos, true, 333, nil);
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	elseif gatherAmount < 3 then  -- character can still carry something and more milk is available
		if not base.common.CheckItem( User, SourceItem ) then -- no empty bottles left
			return
		end
		milking.SavedWorkTime[User.id] = milking:GenWorkTime(User, SourceItem);
		Animal.movepoints = -1 * milking.SavedWorkTime[User.id]; -- make sure the animal doesn't move away
		User:startAction(milking.SavedWorkTime[User.id], 21, 5, 10, 25);
	else
		base.common.HighInformNLS( User,
		"Dieses Tier ist ausreichend gemolken und gibt keine Milch mehr.",
		"This animal is milked properly and doesnt give any more milk." );
	end
end
