-- Fairy's Tears oder Trolls Blood erhalten (Quellwasser)
-- Alternativ: Gesegnetes Wasser von Irundar erhalten
-- vilarion

-- UPDATE common SET com_script='item.id_2498_empty_bottle' WHERE com_itemid IN (2498);

require("base.common");
module("item.id_2498_empty_bottle", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param)
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
	  "Du kannst Flaschen an einem Brunnen oder an einem Gewässer füllen.", 
	  "You can fill bottles at a well or at some waters.");
      return
	end
	    
    if ( ltstate == Action.none ) then 
		User:startAction( 20, 21, 5, 10, 25);
			User:talkLanguage( Character.say, User.german, "#me beginnt Flaschen zu befüllen.");
			User:talkLanguage( Character.say, User.english, "#me starts to fill bottle."); 
		return
	end
	
	local notCreated = User:createItem( 2496, 1, 999, nil ); -- create the new produced items
	world:erase(SourceItem,1)	
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2496, notCreated, User.pos, true, 999, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten.",
		"You can't carry any more.");
	else -- character can still carry something
		if User:countItem(2498) <= 0 then
            return
        else
		    --User:startAction( 20, 21, 5, 10, 25);
			User:talkLanguage( Character.say, User.german, "#me beginnt Flaschen zu befüllen.");
			User:talkLanguage( Character.say, User.english, "#me starts to fill bottle."); 
		end	
	end
--[[ !!! OLD OLD OLD !!!
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