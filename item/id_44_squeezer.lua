-- squeezer

-- 2x black thistle (141) --> lamp oil (390)

-- UPDATE common SET com_script='item.id_44_squeezer' WHERE com_itemid IN (44);

require("base.common")

module("item.id_44_squeezer", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local oilsqueezing = content.gathering.oilsqueezing;

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

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine Rüstung behindert Dich beim Pressen des Öls.",
		"Your armour disturbs you while squeezing oil." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",141)<1) then -- check for items to work on
		if (User:countItemAt("all",141)==0) then
			base.common.InformNLS( User, 
			"Du brauchst schwarze Disteln um daraus Öl zu pressen.", 
			"You need black thistles for squeezing oil." );
		else
			base.common.InformNLS( User, 
			"Du hast nicht genug schwarze Disteln um daraus Öl zu pressen.", 
			"You don't have enough black thistles for squeezing oil." );
		end
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		oilsqueezing.SavedWorkTime[User.id] = oilsqueezing:GenWorkTime(User,nil);
		User:startAction( oilsqueezing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Öl zu pressen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to squeeze oil."); 
		return
	end

	-- since we're here, we're working

	if oilsqueezing:FindRandomItem(User) then
		return
	end

	User:learn( oilsqueezing.LeadSkill, oilsqueezing.LeadSkillGroup, oilsqueezing.SavedWorkTime[User.id], 100, User:increaseAttrib(oilsqueezing.LeadAttribute,0) );
	User:eraseItem( 141, 2 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 390, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 390, notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",141)>=2) then  -- there are still items we can work on
			oilsqueezing.SavedWorkTime[User.id] = oilsqueezing:GenWorkTime(User,nil);
			User:startAction( oilsqueezing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.InformNLS(User,
			"Du hast nicht mehr genug schwarze Disteln.",
			"You don't have enough black thistles anymore.");
		end
	end
end