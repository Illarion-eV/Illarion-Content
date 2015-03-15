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

-- UPDATE items SET itm_script='item.id_2498_empty_bottle' WHERE itm_id IN (2498);

local common = require("base.common")
local milking = require("content.gatheringcraft.milking")

local M = {}

function getAnimal(User)

	-- check for sheep or cow in front
	local targetCharacter = common.GetFrontCharacter(User);
	if (targetCharacter ~= nil and milking.isMilkable(targetCharacter)) then
		return targetCharacter;
	end

	-- look for a nearby sheep or cow
	for x=-1,1 do
		for y=-1,1 do
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isCharacterOnField(pos) ) then
				targetCharacter = world:getCharacterOnField(pos);
				if (milking.isMilkable(targetCharacter)) then
					return targetCharacter;
				end
			end
		end
	end
	return nil;
end

function M.UseItem(User, SourceItem, ltstate)

	-- milking
	local animal = getAnimal(User);
	if animal ~= nil then
		milking.StartGathering(User, animal, ltstate);
		return
	end

	-- water scooping

	-- check for well or fountain
	local TargetItem = common.GetItemInArea(User.pos, 2207);
	if (TargetItem == nil) then
		TargetItem = common.GetItemInArea(User.pos, 631);
		if (TargetItem == nil) then
			TargetItem = common.GetItemInArea(User.pos, 2079);
		end
		if (TargetItem == nil) then
			TargetItem = common.GetItemInArea(User.pos, 1097);
		end
	end
	if (TargetItem ~= nil) then
		common.TurnTo( User, TargetItem.pos ); -- turn if necessary
		UseItemScooping(User, SourceItem, ltstate);
		return;
	end

	-- check for water tile
	local targetPos = GetWaterTilePosition(User);
	if (targetPos ~= nil) then
		common.TurnTo( User, targetPos ); -- turn if necessary
		UseItemScooping(User, SourceItem, ltstate);
		return;
	end

	-- nothing found to fill the bottle
	common.InformNLS(User,
	  "Du kannst Flaschen an einem Brunnen oder an einem Gewässer füllen, oder ein geeignetes Tier melken. Lämmer und Bullen können aus naheliegenden Gründen nicht gemolken werden.",
	  "You can fill bottles at a well or at some waters, or milk an adequate domestic animal. Lambs and bulls cannot be milked, obviously.");

end

function GetWaterTilePosition(User)
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local targetPos = position(User.pos.x + x, User.pos.y, User.pos.z);
      if (common.GetGroundType(world:getField(targetPos):tile()) == common.GroundType.water) then
        return targetPos;
      end
    end
  end
  return nil;
end

function UseItemScooping(User, SourceItem, ltstate)

	common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
      User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
      return
	end

	if not common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	if not common.FitForWork( User ) then -- check minimal food points
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
		common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
	end

end

return M

