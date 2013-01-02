-- UPDATE common SET com_script='item.id_1005_beehive' WHERE com_itemid=1005;

require("base.common")
require("content.gathering")

module("item.id_1005_beehive", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local honeygathering = content.gathering.honeygathering;

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
	
	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
		User:startAction( honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Honigwaben zu sammeln.");
		User:talkLanguage( Character.say, Player.english, "#me starts to collect honeycombs."); 
		return
	end

	-- since we're here, we're working

	if honeygathering:FindRandomItem(User) then
		return
	end

	User:learn( honeygathering.LeadSkill, honeygathering.SavedWorkTime[User.id], 100);
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 2529, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2529, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
		User:startAction( honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
	end
end
