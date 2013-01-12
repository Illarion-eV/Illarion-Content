-- flail ( 258 )

-- bundle of grain (249)  --> grain (259)

-- UPDATE common SET com_script='item.id_258_flail' WHERE com_itemid IN (258);

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_258_flail", package.seeall, package.seeall(item.general.wood))

function UseItem( User, SourceItem, TargetItem, ltstate )
	content.gathering.InitGathering();
	local flailing = content.gathering.flailing;

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
	
	if (SourceItem:getType() ~= 4) then -- tool in Hand
		base.common.HighInformNLS( User,
		"Du musst den Dreschflegel in der Hand haben!",
		"You have to hold the flail in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if (User:countItemAt("all",249)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Getreidebündel um Getreide zu dreschen.", 
		"You need bundles of grain for flailing grain." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		flailing.SavedWorkTime[User.id] = flailing:GenWorkTime(User,SourceItem);
		User:startAction( flailing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Getreide zu dreschen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to flail grain."); 
		return
	end

	-- since we're here, we're working

	if flailing:FindRandomItem(User) then
		return
	end

	User:learn( flailing.LeadSkill, flailing.SavedWorkTime[User.id], 20);
	User:eraseItem( 249, 1 ); -- erase the item we're working on
	local amount = math.random(1,4); -- set the amount of items that are produced
	local notCreated = User:createItem( 259, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 259, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",249)>0) then  -- there are still items we can work on
			flailing.SavedWorkTime[User.id] = flailing:GenWorkTime(User,SourceItem);
			User:startAction( flailing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Getreidebündel mehr.",
			"You have no bundle of grain anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein alter Dreschflegel zerbricht.",
		"Your old flail breaks.");
		return
	end
end

function LookAtItem(User,Item)
    item.general.wood.LookAtItem(User,Item)
end
