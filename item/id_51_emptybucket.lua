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
-- fill bucket from ...
--- cauldron
--- well
--- waters

-- UPDATE items SET itm_script='item.id_51_emptybucket' WHERE itm_id IN (51);

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local licence = require("base.licence")

local M = {}

-- Wassereimer fuellen
function M.UseItem(User, SourceItem, ltstate)
  -- check for cauldron
  local TargetItem = GetCauldron(User);
  if (TargetItem ~= nil) then
	common.TurnTo( User, TargetItem.pos ); -- turn if necessary
    FillFromCauldron(User,SourceItem,TargetItem,ltstate);
    return;
  end

  if User:countItem(51) <= 0 then
        return
  end

  local foundSource = false;
  -- check for well or fountain
  TargetItem = common.GetItemInArea(User.pos, 2207);
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
    foundSource=true
  end

  -- check for water tile
  local targetPos = GetWaterTilePosition(User);
  if (targetPos ~= nil) then
	common.TurnTo( User, targetPos ); -- turn if necessary
    foundSource=true
  end

   if not foundSource then
	  -- nothing found to fill the bucket.
	  common.InformNLS(User,
	  "Du kannst den Eimer an einem Brunnen oder an einem Gewässer füllen.",
	  "You can fill the bucket at a well or at some waters.");
      return
	end

    if ( ltstate == Action.abort ) then
		common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end

    if ( ltstate == Action.none ) then
		User:startAction( 20, 21, 5, 10, 25);
		User:talk(Character.say, "#me beginnt Eimer zu befüllen.", "#me starts to fill buckets.")
		return
	end

	local notCreated = User:createItem( 52, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 52, notCreated, User.pos, true, 333, nil );
		common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
		world:erase(SourceItem,1)
		return
	else -- character can still carry something
		if SourceItem.number == 1 then
		    world:erase(SourceItem,1)
			return
        else
		    world:erase(SourceItem,1)
			SourceItem.number = SourceItem.number-1
			world:changeItem(SourceItem)
			User:changeSource(SourceItem)
			User:startAction( 20, 21, 5, 10, 25);
		end
	end
end

function FillFromCauldron(User,SourceItem,TargetItem,ltstate)

    if ( ltstate == Action.abort ) then
		common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end

	-- is the char an alchemist?
	local anAlchemist = alchemy.CheckIfAlchemist(User)
	if not anAlchemist then
		User:inform("Auf dem Schriftstück steht nur dir unverständliches Alchemistengeschwafel.","For you the document only appears to contain unintelligible alchemical gibberish.")
		return
	end

	if ( ltstate == Action.none ) then
		User:startAction( 20, 21, 5, 0, 0)
		return
	end

  common.InformNLS(User,
  "Du füllst den Eimer mit dem Wasser im Kessel.",
  "You fill the bucket with the water in the cauldron.");

	world:makeSound(10,TargetItem.pos)
	TargetItem.id = 1008
	TargetItem:setData("filledWith","")
	world:changeItem(TargetItem)

	if SourceItem.number > 1 then
	    world:erase(SourceItem,1)
		local notCreated=User:createItem(52,1,333,nil)
		if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
			world:createItemFromId(52,1,User.pos,true,333,nil)
			common.HighInformNLS(User,
			"Du kannst nichts mehr halten.",
			"You can't carry any more.");
		end
	else
		SourceItem.id = 52
		SourceItem.quality = 333
		world:changeItem(SourceItem)
	end
end

-- returns a cauldron filled with water if one is found next to the user.
function GetCauldron(User)
  -- first check in front
  local frontPos = common.GetFrontPosition(User);
  if (world:isItemOnField(frontPos)) then
    local item = world:getItemOnField(frontPos);
    if (item.id == 1010 and item:getData("filledWith") == "water") then
      return item;
    end
  end
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local targetPos = position(User.pos.x + x, User.pos.y, User.pos.z);
      if (world:isItemOnField(targetPos)) then
        local item = world:getItemOnField(targetPos);
        if (item.id == 1010 and item:getData("filledWith") == "water") then
          return item;
        end
      end
    end
  end
  return nil;
end

function GetWaterTilePosition(User)
  local targetPos = common.GetFrontPosition(User);
  if (common.GetGroundType(world:getField(targetPos):tile()) == common.GroundType.water) then
        return targetPos;
  end

  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      targetPos = position(User.pos.x + x, User.pos.y, User.pos.z);
      if (common.GetGroundType(world:getField(targetPos):tile()) == common.GroundType.water) then
        return targetPos;
      end
    end
  end
  return nil;
end

return M

