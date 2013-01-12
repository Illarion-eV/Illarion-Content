-- fill bucket from ...
--- cauldron
--- well
--- waters

-- UPDATE common SET com_script='item.id_51_emptybucket' WHERE com_itemid IN (51);

require("base.common")
require("alchemy.base.alchemy")

module("item.id_51_emptybucket", package.seeall)

-- Wassereimer fuellen
function UseItem(User, SourceItem, ltstate)
  -- check for cauldron
  TargetItem = GetCauldron(User);
  if (TargetItem ~= nil) then
    if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
      base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
    end
    FillFromCauldron(User,SourceItem,TargetItem,ltstate);
    return;
  end
  
  if User:countItem(51) <= 0 then
        return
  end	
  
  local foundSource
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
    foundSource=true
  end
  
  -- check for water tile
  local targetPos = GetWaterTilePosition(User);
  if (targetPos ~= nil) then
    if not base.common.IsLookingAt( User, targetPos ) then -- check looking direction
      base.common.TurnTo( User, targetPos ); -- turn if necessary
    end
    foundSource=true
  end
  
   if not foundSource then
	  -- nothing found to fill the bucket.
	  base.common.InformNLS(User, 
	  "Du kannst den Eimer an einem Brunnen oder an einem Gewässer füllen.", 
	  "You can fill the bucket at a well or at some waters.");
      return
	end
	    
    if ( ltstate == Action.none ) then 
		User:startAction( 20, 21, 5, 10, 25);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Eimer zu befüllen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to fill buckets."); 
		return
	end
	
	local notCreated = User:createItem( 52, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 52, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
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
			User:changeSource(SourceItem)
			User:startAction( 20, 21, 5, 10, 25);
		end	
	end
end

function FillFromCauldron(User,SourceItem,TargetItem,ltstate)
    
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
    
	if SourceItem.number > 1 then
	    world:erase(SourceItem,1)
		local notCreated=User:createItem(52,1,333,nil)
		world:createItemFromId(52,1,User.pos,true,333,nil)
	else	
		SourceItem.id = 52
		SourceItem.quality = 333
		world:changeItem(SourceItem)
	end	
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