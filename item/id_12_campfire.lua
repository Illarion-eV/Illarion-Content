-- UPDATE common SET com_script='item.id_12_campfire' where com_itemid=12;

-- logs (2560,543,544,3) --> potash (314)

require("base.common")
require("content.gathering")

module("item.id_12_campfire", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local potashproducing = content.gathering.potashproducing;

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
		"Deine Rüstung behindert Dich beim Herstellen der Pottasche.",
		"Your armour disturbs you while producing potash." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if ((User:countItemAt("all",2560) == 0) and (User:countItemAt("all",543) == 0) and
		(User:countItemAt("all",544) == 0) and (User:countItemAt("all",3) == 0)) then -- check for items to work on
		base.common.InformNLS( User, 
		"Du brauchst Holz um Pottasche zu produzieren.", 
		"You need wood for producing potash." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		potashproducing.SavedWorkTime[User.id] = potashproducing:GenWorkTime(User,nil);
		User:startAction( potashproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Pottasche herzustellen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to produce potash."); 
		return
	end

	-- since we're here, we're working

	if potashproducing:FindRandomItem(User) then
		return
	end

	User:learn( potashproducing.LeadSkill, potashproducing.LeadSkillGroup, potashproducing.SavedWorkTime[User.id], 100, User:increaseAttrib(potashproducing.LeadAttribute,0) );
	local woodList = {2560,543,544,3};
	local woodID = 0;
	for _,wood in pairs(woodList) do
	if (User:countItemAt("all",wood)>0) then
					woodID = wood;
					break;
			end
	end
	User:eraseItem( woodID, 1 ); -- erase the item we're working on
	local amount = 3; -- set the amount of items that are produced
	local notCreated = User:createItem( 314, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 314, notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if ((User:countItemAt("all",2560) > 0) and (User:countItemAt("all",543) > 0) and
            (User:countItemAt("all",544) > 0) and (User:countItemAt("all",3) > 0)) then   -- there are still items we can work on
			potashproducing.SavedWorkTime[User.id] = potashproducing:GenWorkTime(User,nil);
			User:startAction( potashproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.InformNLS(User,
			"Du hast kein Holz mehr.",
			"You have no wood anymore.");
		end
	end
end

function CharacterOnField(User)
    base.common.InformNLS( User,
      "Du fühlst die aufsteigende Hitze des Feuers.",
      "You feel the heat of the fire." );
	--Damage from campfires is annoying and abuseable; deactivated.  
    --[[if not (User:getQuestProgress(2) > 0) and not (User:increaseAttrib("hitpoints",0) < 2000) then
		User:increaseAttrib("hitpoints",-math.random(200,400));
	end]]
end
