-- Dreschflegel ( 258 )

-- Getreidebündel  --> Getreidekörner

-- UPDATE common SET com_script='item.id_258_flail' WHERE com_itemid IN (258);

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_258_flail", package.seeall, package.seeall(item.general.wood))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local farming = content.gathering.farming;

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
		base.common.InformNLS( User,
		"Du musst den Dreschflegel in der Hand haben!",
		"You need to hold the flail in your hand!" );
		return
	end

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine Rüstung behindert Dich beim Getreide dreschen.",
		"Your armour disturbs you while flailing grain." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if (User:countItemAt("all",249)==0) then -- check for items to work on
		base.common.InformNLS( User, 
		"Du brauchst Getreidebündel um Getreide zu dreschen.", 
		"You need bundles of grain for flailing grain." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,SourceItem);
		User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Getreide zu dreschen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to flail grain."); 
		return
	end

	-- since we're here, we're working

	if farming:FindRandomItem(User) then
		return
	end

	User:learn( farming.LeadSkill, farming.LeadSkillGroup, farming.SavedWorkTime[User.id], 100, User:increaseAttrib(farming.LeadAttribute,0) );
	User:eraseItem( 249, 1 ); -- erase the item we're working on
	local amount = math.random(1,4); -- set the amount of items that are produced
	local notCreated = User:createItem( 259, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 259, notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",249)>0) then  -- there are still items we can work on
			farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,SourceItem);
			User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.InformNLS(User,
			"Du hast kein Getreidebündel mehr.",
			"You have no bundle of grain anymore.");
		end
	end

	if base.common.ToolBreaks( User, SourceItem, false ) then -- damage and possibly break the tool
		base.common.InformNLS(User,
		"Dein alter Dreschflegel zerbricht.",
		"Your old flail breaks.");
		return
	end
end