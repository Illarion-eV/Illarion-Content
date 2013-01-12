-- honeycomb (2529) --> wax (431)

-- additional tool: crucible-pincers(2751)

-- UPDATE common SET com_script='item.id_428_candletable' WHERE com_itemid IN (428);

require("base.common")
require("content.gathering")

module("item.id_428_candletable", package.seeall)

function UseItem( User, SourceItem, TargetItem, ltstate )
	content.gathering.InitGathering();
	local waxproducing = content.gathering.waxproducing;
  
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
	if (User:countItemAt("all",2751)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Tiegelzange um Wachs zu schmelzen.", 
		"You need a pair of crucible-pincers for melting wax." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2751 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2751 ) then
			base.common.HighInformNLS( User,
			"Du musst die Tiegelzange in der Hand haben!",
			"You have to hold the crucible-pincers in your hand!" );
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

	if (User:countItemAt("all",2529)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Honigwaben um Wachs herzustellen.", 
		"You need honeycombs for producing wax." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		waxproducing.SavedWorkTime[User.id] = waxproducing:GenWorkTime(User,toolItem);
		User:startAction( waxproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Wachs zu schmelzen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to melt wax."); 
		return
	end

	-- since we're here, we're working

	if waxproducing:FindRandomItem(User) then
		return
	end

	User:learn( waxproducing.LeadSkill, waxproducing.SavedWorkTime[User.id], 20);
	User:eraseItem( 2529, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 431, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 431, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",2529)>0) then  -- there are still items we can work on
			waxproducing.SavedWorkTime[User.id] = waxproducing:GenWorkTime(User,toolItem);
			User:startAction( waxproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast keine Honigwaben mehr.",
			"You have no honeycombs anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Tiegelzange zerbricht.",
		"Your old crucible-pincers break.");
		return
	end
end
