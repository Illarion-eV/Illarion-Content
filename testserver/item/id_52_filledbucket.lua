-- fill cauldron
-- large empty bottle (2498) --> blue potion (2496) aka bottle with water
-- extinguish forge (2835) --> (2836)
-- extinguish fire
-- pour on character
-- UPDATE common SET com_script='item.id_52_filledbucket' WHERE com_itemid IN (52);

require("base.common")
require("alchemy.base.alchemy")

module("item.id_52_filledbucket", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

  -- look for cauldron
  TargetItem = GetCauldron(User);
  if (TargetItem ~= nil) then
    if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
      base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
    end
    WaterIntoCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate);
    return;
  end
  
  -- look for bottle
  if (User:countItemAt("all",2498)>0) then
    base.common.InformNLS( User,
		"Du füllst eine Flasche mit Wasser.",
		"You fill a bottle with water." );
    User:eraseItem(2498, 1);
    local notCreated = User:createItem( 2496, 1, 333, nil );
    if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
      world:createItemFromId( 2496, notCreated, User.pos, true, 333, nil );
      base.common.InformNLS(User,
      "Du kannst nichts mehr halten und musst die Flasche auf den Boden stellen.",
      "You can't carry any more and you have to put the bottle on the ground.");
    end
    world:makeSound(10,User.pos);
    world:swap(SourceItem, 51, 333);
    return;
  end
  
  -- look for forge
  TargetItem = base.common.GetItemInArea(User.pos, 2835, 1, true);
  if (TargetItem ~= nil) then
    world:makeSound(9, TargetItem.pos)
    world:swap(TargetItem, 2836, 333);
    base.common.InformNLS(User,
    "Du löschst das Feuer in der Esse.",
    "You extinguish the fire in the forge.");
    world:swap(SourceItem, 51, 333);
    return;
  end
  
  -- look for fire
  TargetItem = base.common.GetItemInArea(User.pos, 12, 1, true);
  if (TargetItem == nil or TargetItem.wear == 255) then
    local i = base.common.GetItemInArea(User.pos, 12, 1, true);
    if (i ~= nil) then
      TargetItem = i;
    end
  end
  if (TargetItem ~= nil) then
    if not base.common.IsLookingAt( User, TargetItem.pos ) then -- check looking direction
      base.common.TurnTo( User, TargetItem.pos ); -- turn if necessary
    end
    -- TODO is a noobia check needed?
    -- Don't extinguish static fires.
    world:makeSound(9, TargetItem.pos);
    if (TargetItem.wear == 255) then
      base.common.InformNLS(User,
      "Das Wasser verdampft in dem Feuer ohne es zu löschen.",
      "The water vaporises in the fire but it does not extinguish it.");
    else
      world:erase(TargetItem, 1);
      base.common.InformNLS(User,
      "Du löschst das Feuer.",
      "You extinguish the fire.");
    end
    world:swap(SourceItem, 51, 333);
    return;
  end
  
  -- pour water on character. Either on the one in front or on the User himself.
  local TargetChar = base.common.GetFrontCharacter(User);
  if (TargetChar ~= nil) then
    -- is this really a player?
    local players = world:getPlayersInRangeOf(TargetChar.pos, 0);
    for _,p in pairs(players) do 
      if (p.id == TargetChar.id) then
        base.common.InformNLS(User,
        "Du schüttest das Wasser über die Person vor dir.",
        "You pour the water on the person in front of you.");
        PourOnCharacter(TargetChar, SourceItem);
        return;
      end
    end    
  end
  -- no person in front found. Pour on self.
  PourOnCharacter(User, SourceItem);
end

function PourOnCharacter (TargetCharacter, SourceItem )
  world:makeSound( 9, TargetCharacter.pos );
  world:swap(SourceItem, 51, 333);
	base.common.InformNLS(TargetCharacter, 
  "Du fühlst dich gleich viel sauberer.", 
  "You feel much cleaner.");
end

function WaterIntoCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate)
    local cauldron = TargetItem
	
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

	-- water, essence brew, potion or stock is in the cauldron; leads to a failure
	if cauldron:getData("filledWith") == "water" then
		base.common.InformNLS( User,
				"Der Kessel läuft über. Offensichtlich war schon Wasser in ihm.",
				"The water runs over. Obviously, ther was already water in it.")
		world:makeSound(9,cauldron.pos)
		world:gfx(11,cauldron.pos)
		
	elseif cauldron:getData("filledWith") == "essenceBrew" then 
		world:gfx(1,cauldron.pos)
		base.common.InformNLS(User, "Der Inhalt des Kessels verpufft, als du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
		base.alchemy.base.RemoveAll(cauldron)		
									
	elseif cauldron:getData("filledWith") == "potion" then
		base.alchemy.base.RemoveAll(cauldron)
		if cauldron.id == 1013 then
		    world:makeSound(10,cauldron.pos)
		    cauldron:setData("filledWith","water")
		else
			base.common.InformNLS(User, "Der Inhalt des Kessels verpufft, als du das Wasser hinzu tust.", 
										"The substance in the cauldron blows out, as you fill the water in.")
		end
		world:gfx(1,cauldron.pos)
		
	elseif cauldron:getData("filledWith") == "stock" then
		world:gfx(1,cauldron.pos)
		base.common.InformNLS(User, "Der Inhalt des Kessels verpufft, als du das Wasser hinzu tust.", 
		                            "The substance in the cauldron blows out, as you fill the water in.")
	    alchemy.base.alchemy.RemoveAll(cauldron)
	    
	else -- nothing in the cauldron, we just fill in the water
	    world:makeSound(10,cauldron.pos)
		cauldron:setData("filledWith","water")
		cauldron.id = 1010
    end

	world:changeItem(cauldron)
	SourceItem.id = 51
	SourceItem.quality = 333
	world:changeItem(SourceItem)
end

function GetCauldron(User)
  -- first check in front
  local frontPos = base.common.GetFrontPosition(User);
  if (world:isItemOnField(frontPos)) then
    local item = world:getItemOnField(frontPos);
    if (item.id > 1007 and item.id < 1019) then
      return item;
    end
  end
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do 
      local targetPos = position(User.pos.x + x, User.pos.y, User.pos.z);
      if (world:isItemOnField(targetPos)) then
        local item = world:getItemOnField(targetPos);
        if (item.id > 1007 and item.id < 1019) then
          return item;
        end
      end
    end
  end
  return nil;
end

function LookAtItem(User, Item)
  world:itemInform(User, Item, base.lookat.GetItemDescription(User, Item, base.lookat.WOOD))
end