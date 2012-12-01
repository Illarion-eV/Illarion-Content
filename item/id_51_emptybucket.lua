-- fill bucket from ...
--- cauldron
--- well
--- waters

-- UPDATE common SET com_script='item.id_51_emptybucket' WHERE com_itemid IN (51);

require("base.common")
require("alchemy.base.alchemy")

module("item.id_51_emptybucket", package.seeall)

-- Wassereimer fuellen
function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
  -- check for cauldron
  TargetItem = GetCauldron(User);
  if (TargetItem ~= nil) then
    if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
      base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
    end
    FillFromCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate);
    return;
  end
  
  -- check for well or fountain
  TargetItem = base.common.GetItemInArea(User.pos, 2207);
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
    FillBucket(User, SourceItem);
    return;
  end
  
  -- check for water tile
  local targetPos = GetWaterTilePosition(User);
  if (targetPos ~= nil) then
    if not base.common.IsLookingAt( User, targetPos ) then -- check looking direction
      base.common.TurnTo( User, targetPos ); -- turn if necessary
    end
    FillBucket(User, SourceItem);
    return;
  end
  
  -- nothing found to fill the bucket.
  base.common.InformNLS(User, 
  "Du kannst den Eimer an einem Brunnen oder an einem Gewässer füllen.", 
  "You can fill the bucket at a well or at some waters.");
end

-- common bucket filling function
function FillBucket( User, SourceItem )
  if base.common.FitForWork( User ) then
    SourceItem.id = 52;
    SourceItem:setData("amount", "10");
    world:changeItem(SourceItem);
    base.common.GetHungry( User, 100 );
    base.common.InformNLS(User, 
    "Du füllst den Eimer mit Wasser.", 
    "You fill the bucket with water.");
  end
end

function FillFromCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate)
    
    if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end
		
	-- is the char an alchemist?
	    local anAlchemist = alchemy.base.alchemy.CheckIfAlchemist(User,"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
		if not anAlchemist then
		    return
	    end
		
	if ( ltstate == Action.none ) then
		User:startAction( 20, 21, 5, 0, 0)
		return
	end
  
  base.common.InformNLS(User, 
  "Du füllst den Eimer mit dem Wasser im Kessel.", 
  "You fill the bucket with the water in the cauldron.");

	world:makeSound(10,TargetItem.pos)
	TargetItem.id = 1008
	TargetItem:setData("filledWith","")
	world:changeItem(TargetItem)
  SourceItem.id = 52
  SourceItem:setData("amount", "1");
	SourceItem.quality = 333
	world:changeItem(SourceItem)
end

-- returns a cauldron filled with water if one is found next to the user.
function GetCauldron(User)
  -- first check in front
  local frontPos = base.common.GetFrontPosition(User);
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