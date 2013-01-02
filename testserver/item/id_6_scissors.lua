-- UPDATE common SET com_script='item.id_6_scissors' WHERE com_itemid IN (6);

-- sheep (monster 18) --> wool (170)
-- entrails (63) --> thread (50)

require("item.general.metal")
require("item.base.crafts")

module("item.id_6_scissors", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	-- first decide if we're cutting wool or entrails
	local targetCharacter = base.common.GetFrontCharacter(User);
	-- check for sheep in front
	if (targetCharacter ~= nil and targetCharacter:getRace()==18) then
		UseItemWoolCutting( User, SourceItem, TargetItem, Counter, Param, ltstate, targetCharacter );
		return;
	end
	-- look for a nearby sheep
	for x=-1,1 do 
		for y=-1,1 do 
			local pos = position(User.pos.x+x,User.pos.y+y,User.pos.z);
			if ( world:isCharacterOnField(pos) ) then
				targetCharacter = world:getCharacterOnField(pos);
				if ( targetCharacter:getRace() == 18 ) then
					UseItemWoolCutting( User, SourceItem, TargetItem, Counter, Param, ltstate, targetCharacter );
					return;
				end
			end
		end
	end
	if (User:countItemAt("all",63)>0) then -- check for entrails
		UseItemEntrailsCutting( User, SourceItem, TargetItem, Counter, Param, ltstate );
		return;
	end
	-- there is no sheep and no entrails
	base.common.HighInformNLS( User,
	"Du brauchst entweder ein Schaf, um es zu scheren, oder Eingeweide, um sie zu Garn zu zerschneiden.",
	"You need either a sheep for shearing it, or entrails for cutting it and thus producing thread." );
end

function UseItemWoolCutting( User, SourceItem, TargetItem, Counter, Param, ltstate, Sheep )
	content.gathering.InitGathering();
	local woolcutting = content.gathering.woolcutting;

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
		"Du musst die Schere in der Hand haben!",
		"You have to hold the scissors in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end
	
	if not base.common.IsLookingAt( User, Sheep.pos ) then -- check looking direction
		base.common.TurnTo( User, Sheep.pos ); -- turn if necessary
	end
	-- Sheep should actually be already a sheep character struct, but check it nevertheless
	if ( Sheep == nil or (Sheep ~= nil and Sheep:getRace()~=18) ) then
		base.common.HighInformNLS( User,
		"Du musst vor einem Schaf stehen, um es zu scheren.",
		"You have to stand in front of a sheep for shearing it." );
		return;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User,SourceItem);
		User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt ein Schaf zu scheren.");
		User:talkLanguage( Character.say, Player.english, "#me starts to shear a sheep."); 
		-- make sure the sheep doesn't move away
		Sheep.movepoints = math.min(Sheep.movepoints - woolcutting.SavedWorkTime[User.id], -1*woolcutting.SavedWorkTime[User.id]);
		return;
	end

	-- since we're here, we're working

	if woolcutting:FindRandomItem(User) then
		return
	end

	User:learn( woolcutting.LeadSkill, woolcutting.SavedWorkTime[User.id], 100);
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 170, amount, 333, nil); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 170, notCreated, User.pos, true, 333, nil);
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		woolcutting.SavedWorkTime[User.id] = woolcutting:GenWorkTime(User,SourceItem);
		User:startAction( woolcutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		-- the sheep may move away
		Sheep.movepoints = Sheep.movepoints - 0.8*woolcutting.SavedWorkTime[User.id];
	end

	if base.common.ToolBreaks( User, SourceItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end
end

function UseItemEntrailsCutting( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local entrailscutting = content.gathering.entrailscutting;

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
		"Du musst die Schere in der Hand haben!",
		"You have to hold the scissors in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end
	
	-- any other checks?

	if (User:countItemAt("all",63)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Eingeweide um daraus Garn herzustellen.", 
		"You need entrails for producing thread." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		entrailscutting.SavedWorkTime[User.id] = entrailscutting:GenWorkTime(User,SourceItem);
		User:startAction( entrailscutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Eingeweide zu zerschneiden.");
		User:talkLanguage( Character.say, Player.english, "#me starts to cut entrails."); 
		return
	end

	-- since we're here, we're working

	if entrailscutting:FindRandomItem(User) then
		return
	end

	User:learn( entrailscutting.LeadSkill, entrailscutting.SavedWorkTime[User.id], 100);
	User:eraseItem( 63, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 50, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 50, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",63)>0) then  -- there are still items we can work on
			entrailscutting.SavedWorkTime[User.id] = entrailscutting:GenWorkTime(User,SourceItem);
			User:startAction( entrailscutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast keine Eingeweide mehr.",
			"You have no entrails anymore.");
		end
	end

	if base.common.ToolBreaks( User, SourceItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Schere zerbricht.",
		"Your old scissors break.");
		return
	end
end

function LookAtItem(User,Item)
    item.general.metal.LookAtItem(User,Item)
end
