-- 5x ball of wool (168) --> grey cloth (176)

-- additional tool: scissors (6)

-- UPDATE common SET com_script='item.id_169_loom' WHERE com_itemid IN (169);

require("base.common")
require("content.gathering")

module("item.id_169_loom", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local weaving = content.gathering.weaving;
	
	-- is the target position needed?
	local TargetPos = base.common.GetFrontPosition(User);

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
	if (User:countItemAt("all",6)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Schere um weben.", 
		"You need a pair of scissors for weaving." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 6 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 6 ) then
			base.common.HighInformNLS( User,
			"Du musst die Schere in der Hand haben!",
			"You have to hold the scissors in your hand!" );
			return
		end
	end

	if base.common.Encumbrence(User) then
		base.common.HighInformNLS( User,
		"Deine Rüstung behindert Dich beim Weben.",
		"Your armour disturbs you while weaving." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",168)<5) then -- check for items to work on
    if (User:countItemAt("all",168)==0) then
      base.common.HighInformNLS( User, 
      "Du brauchst Wollknäuel um zu weben.", 
      "You need balls of wool for weaving." );
    else
      base.common.HighInformNLS( User, 
      "Du hast nicht genug Wollknäuel um zu weben.", 
      "You don't have enough balls of wool for weaving." );
    end
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		weaving.SavedWorkTime[User.id] = weaving:GenWorkTime(User,toolItem);
		User:startAction( weaving.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt zu weben.");
		User:talkLanguage( Character.say, Player.english, "#me starts to weave."); 
		return
	end

	-- since we're here, we're working

	if weaving:FindRandomItem(User) then
		return
	end

	User:learn( weaving.LeadSkill, weaving.SavedWorkTime[User.id], 100);
	User:eraseItem( 168, 5 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 176, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 176, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",168)>4) then  -- there are still items we can work on
			weaving.SavedWorkTime[User.id] = weaving:GenWorkTime(User,toolItem);
			User:startAction( weaving.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast nicht mehr genug Wollknäuel.",
			"You don't have enough balls of wool anymore.");
		end
	end

	if base.common.ToolBreaks( User, toolItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissor break.");
		return
	end
end
