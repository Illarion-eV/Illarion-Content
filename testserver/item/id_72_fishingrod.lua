-- UPDATE common SET com_script='item.id_72_fishingrod' WHERE com_itemid=72;

require("item.general.wood")
require("base.common")
require("content.gathering")

module("item.id_72_fishingrod", package.seeall, package.seeall(item.general.wood))

LookAtItem = item.general.wood.LookAtItem

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local fishing = content.gathering.fishing;
	
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
	
	if (SourceItem:getType() ~= 4) then -- tool in Hand
		base.common.HighInformNLS( User,
		"Du musst die Angel in der Hand haben!",
		"You have to hold the fishing rod in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, TargetPos ) then -- check looking direction
		base.common.TurnTo( User, TargetPos ); -- turn if necessary
	end
	
	if (world:getField(TargetPos):tile() ~= 6) then -- fishing only possible on water tiles
		base.common.HighInformNLS(User,
		"Die Chance im Wasser einen Fisch zu fangen ist bedeutend höher als auf dem Land.",
		"The chance to catch a fish is much higher in the water than on the land.");
		return
	end
	
	if (TargetPos.z < 0) then -- fishing underground is not possible
		base.common.HighInformNLS(User, 
		"In unterirdischen Wasserlöchern wird das Angeln kaum erfolgreich sein.", 
		"Fishing in underground waterholes wouldn't be successful.");
		return
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User,nil);
		User:startAction( fishing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt zu fischen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to fish."); 
		return
	end

	-- since we're here, we're working

	if fishing:FindRandomItem(User) then
		return
	end
	User:learn( fishing.LeadSkill, fishing.SavedWorkTime[User.id], 100);
	local amount = 1; -- set the amount of items that are produced
	local fishID = 0; 
	local chance = math.random(1,10);
	-- 40% for salmon, 60% for trout
	if (chance <= 4) then 
		fishID = 73; -- salmon
	else
		fishID = 355; -- trout;
	end
	
	-- GFX + Sound for a splash
	world:gfx(11,TargetPos);
	world:makeSound(9,TargetPos);
	
	local notCreated = User:createItem( fishID, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( fishID, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User,nil);
		User:startAction( fishing.SavedWorkTime[User.id], 0, 0, 0, 0);
	end

	if base.common.ToolBreaks( User, SourceItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Angel zerbricht.",
		"Your old fishing rod breaks.");
		return
	end
end
