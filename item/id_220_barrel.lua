-- white dye (2683) + gray cloth (176) --> white cloth (178)
-- color dye + white cloth (178) --> colored cloth (see below for details)

-- additional tool: dyeing rod (2781)

-- UPDATE common SET com_script='item.id_220_barrel' WHERE com_itemid IN (220);

require("base.common")
require("content.gathering")

module("item.id_220_barrel", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local dyeing = content.gathering.dyeing;
  
  if (dyersList == nil) then
    -- format: {dyeID, neededClothID, producedClothID}
    dyersList = {
     {2678, 178, 175},  -- black
     {2679, 178, 54},   -- green
     {2680, 178, 179},  -- blue
     {2681, 178, 174},  -- red
     {2682, 178, 177},  -- yellow
     {2683, 176, 178}   -- white
    };
  end

	base.common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
		if (User:increaseAttrib("sex",0) == 0) then
			gText = "seine";
			eText = "his";
		else
			gText = "ihre";
			eText = "her";
		end
		User:talkLanguage(Character.say, Player.german, "#me unterbricht "..gText.." Arbeit.");
		User:talkLanguage(Character.say, Player.english,"#me interrupts "..eText.." work.");
		return
	end

	if not base.common.CheckItem( User, SourceItem ) then -- security check
		return
	end
  
	-- additional tool item is needed
	if (User:countItemAt("all",2781)==0) then
		base.common.InformNLS( User,
		"Du brauchst einen Färberstab um Stoffe zu färben.", 
		"You need a dyeing rod for dyeing cloth." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2781 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2781 ) then
			base.common.InformNLS( User,
			"Du musst den Färberstab in der Hand haben!",
			"You have to hold the dyeing rod in your hand!" );
			return
		end
	end

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine Rüstung behindert Dich beim Färben.",
		"Your armour disturbs you while dyeing." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?
  
  local dye = nil;
  for _,d in pairs(dyersList) do 
    if (User:countItemAt("all",d[1])>0 and User:countItemAt("all",d[2])>0) then
      dye = d;
      break;
    end
  end

	if (dye == nil) then -- check for items to work on
		base.common.InformNLS( User, 
		"Du brauchst weiße Farbe und grauen Stoff oder eine andere Farbe und weißen Stoff um zu färben.", 
		"You need white dye and grey cloth or any other dye and white cloth for dyeing." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		dyeing.SavedWorkTime[User.id] = dyeing:GenWorkTime(User,toolItem);
		User:startAction( dyeing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Stoff zu färben.");
		User:talkLanguage( Character.say, Player.english, "#me starts to dye cloth.");
		return
	end

	-- since we're here, we're working

	if dyeing:FindRandomItem(User) then
		return
	end

	User:learn( dyeing.LeadSkill, dyeing.SavedWorkTime[User.id], 100);
	User:eraseItem( dye[1], 1 ); -- erase the item we're working on
  User:eraseItem( dye[2], 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( dye[3], amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( dye[3], notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
    dye = nil;
    for _,d in pairs(dyersList) do 
      if (User:countItemAt("all",d[1])>0 and User:countItemAt("all",d[2])>0) then
        dye = d;
        break;
      end
    end
		if (dye ~= nil) then  -- there are still items we can work on
			dyeing.SavedWorkTime[User.id] = dyeing:GenWorkTime(User,toolItem);
			User:startAction( dyeing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.InformNLS(User,
			"Du hast keine Farbe und passenden Stoff mehr.",
			"You have no dye and respective cloth anymore.");
		end
	end

	if base.common.ToolBreaks( User, toolItem, false ) then -- damage and possibly break the tool
		base.common.InformNLS(User,
		"Dein alter Färberstab zerbricht.",
		"Your old dyeing rod breaks.");
		return
	end
end