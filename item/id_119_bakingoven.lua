-- 5x flour (2) + bucket of water (52) --> 5x dough (5)

-- additional tool: rolling pin ( 118 )

-- UPDATE common SET com_script='item.id_119_backingoven' WHERE com_itemid IN (119,120);

require("base.common")

module("item.id_119_bakingoven", package.seeall);

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local doughproducing = content.gathering.doughproducing;

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
	if (User:countItemAt("all",118)==0) then
		base.common.InformNLS( User,
		"Du brauchst ein Nudelholz um Teig herzustellen.", 
		"You need a rolling pin for producing dough." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 118 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 118 ) then
			base.common.InformNLS( User,
			"Du musst das Nudelholz in der Hand haben!",
			"You have to hold the rolling pin in your hand!" );
			return
		end
	end

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine Rüstung behindert Dich bei der Teigherstellung.",
		"Your armour disturbs you while producing dough." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",2)==0 or User:countItemAt("all",52)==0) then -- check for items to work on
		base.common.InformNLS( User, 
		"Du brauchst Mehl und einen Eimer mit Wasser um Teig herzustellen.", 
		"You need flour and a bucket of water for producing dough." );
		return;
	elseif (User:countItemAt("all",2)<5) then
		base.common.InformNLS( User, 
		"Du hast nicht genug Mehl um Teig herzustellen.", 
		"You dont't have enough flour for producing dough." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		doughproducing.SavedWorkTime[User.id] = doughproducing:GenWorkTime(User,toolItem);
		User:startAction( doughproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Teig herzustellen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to produce dough."); 
		return
	end

	-- since we're here, we're working

	if doughproducing:FindRandomItem(User) then
		return
	end

	User:learn( doughproducing.LeadSkill, doughproducing.LeadSkillGroup, doughproducing.SavedWorkTime[User.id], 100, User:increaseAttrib(doughproducing.LeadAttribute,0) );
	User:eraseItem( 2, 5 ); -- erase the item we're working on
	User:eraseItem( 52, 1 ); -- erase the item we're working on
	local bucketNotCreated = User:createItem( 51, 1, 333, nil ); -- create an empty bucket
	local amount = 5; -- set the amount of items that are produced
	local notCreated = User:createItem( 5, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 or bucketNotCreated > 0) then -- too many items -> character can't carry anymore
		world:createItemFromId( 5, notCreated, User.pos, true, 333, nil );
		world:createItemFromId( 51, bucketNotCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",2)>=5 and User:countItemAt("all",2)>0) then  -- there are still items we can work on
			doughproducing.SavedWorkTime[User.id] = doughproducing:GenWorkTime(User,toolItem);
			User:startAction( doughproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.InformNLS(User,
			"Du hast nicht mehr genug Mehl und Eimer mit Wasser.",
			"You don't have enough flour and buckets of water anymore.");
		end
	end

	if base.common.ToolBreaks( User, toolItem, false ) then -- damage and possibly break the tool
		base.common.InformNLS(User,
		"Dein altes Nudelholz zerbricht.",
		"Your old rolling pin breaks.");
		return
	end
end