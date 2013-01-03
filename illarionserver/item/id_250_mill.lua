-- grain (259) --> flour (2)

-- additional tool: wooden shovel (312)

-- UPDATE common SET com_script='item.id_250_mill' WHERE com_itemid IN (250);

require("base.common")
require("content.gathering")

module("item.id_250_mill", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local graingrinding = content.gathering.graingrinding;

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
	if (User:countItemAt("all",312)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Holzkelle um Getreide zu mahlen.", 
		"You need a wooden shovel for grinding grain." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 312 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 312 ) then
			base.common.HighInformNLS( User,
			"Du musst die Holzkelle in der Hand haben!",
			"You have to hold the wooden shovel in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",259)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Getreide um es zu mahlen.", 
		"You need grain for grinding it." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		graingrinding.SavedWorkTime[User.id] = graingrinding:GenWorkTime(User,toolItem);
		User:startAction( graingrinding.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Getreide zu mahlen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to grind grain.");
		return
	end

	-- since we're here, we're working

	if graingrinding:FindRandomItem(User) then
		return
	end

	User:learn( graingrinding.LeadSkill, graingrinding.SavedWorkTime[User.id], 100);
	User:eraseItem( 259, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 2, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",259)>0) then  -- there are still items we can work on
			graingrinding.SavedWorkTime[User.id] = graingrinding:GenWorkTime(User,toolItem);
			User:startAction( graingrinding.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Getreide mehr.",
			"You have no grain anymore.");
		end
	end

	if base.common.ToolBreaks( User, toolItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Holzkelle zerbricht.",
		"Your old wooden shovel breaks.");
		return
	end
end
