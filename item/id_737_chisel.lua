-- Chisel ( 737 )

-- raw stones (735)  --> stone blocks
-- stone blocks (733) --> small stones (1266)

-- Arbeitscyclus: 4s - 5s

-- UPDATE common SET com_script='item.id_737_chisel' WHERE com_itemid IN (737);

require("item.general.metal")
require("item.base.crafts")

module("item.id_737_chisel", package.seeall, package.seeall(item.general.metal))

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local stonecutting = content.gathering.stonecutting;
	-- we have to distinguish if we work on raw stones or stone blocks
	-- otherwise we would not be able to detect when to stop working on raw stones and the script would continue to work on stone blocks
	if ( WorkOnStone == nil ) then
		WorkOnStone = {}; -- an array that holds the id of the item we're working on for each user
		Stones = {};
		Stones[735] = {};
		Stones[735].productId = 733;
		Stones[735].amount = 1;
		Stones[735].nameDE = "rohen Steine";
		Stones[735].nameEN = "raw stones";
		
		Stones[733] = {};
		Stones[733].productId = 1266;
		Stones[733].amount = 10;
		Stones[733].nameDE = "Steinquader";
		Stones[733].nameEN = "stone blocks";
	end

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
		"Du musst den Meiﬂel in der Hand haben!",
		"You have to hold the chisel in your hand!" );
		return
	end

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine R¸stung behindert Dich bei Behauen der Steine.",
		"Your armour disturbs you while cutting stones." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end
	
	-- any other checks?

	if (User:countItemAt("all",733)==0 and User:countItemAt("all",735)==0) then -- check for items to work on
		base.common.InformNLS( User, 
		"Du brauchst rohe Steine oder Steinquader um sie zu behauen.", 
		"You need raw stones or stone blocks for cutting them." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		stonecutting.SavedWorkTime[User.id] = stonecutting:GenWorkTime(User,SourceItem);
		User:startAction( stonecutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Steine zu behauen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to cut stones."); 
		-- save the item we're working on
		if ( User:countItemAt("all",735) > 0 ) then
			WorkOnStone[User.id] = 735; -- if there are raw stones, we work on those
		else
			WorkOnStone[User.id] = 733; -- no raw stones? Then there must be stone blocks
		end
		return
	end

	-- since we're here, we're working
	-- But do we still have the stone type we're really working on?
	if ( User:countItemAt("all",WorkOnStone[User.id]) == 0 ) then
		base.common.InformNLS( User, 
		"Du hast keine " .. Stones[WorkOnStone[User.id]].nameDE .. " mehr.", 
		"You have no " .. Stones[WorkOnStone[User.id]].nameEN .. " anymore." );
		return;
	end

	if stonecutting:FindRandomItem(User) then
		return
	end

	User:learn( stonecutting.LeadSkill, stonecutting.SavedWorkTime[User.id], 100, User:increaseAttrib(stonecutting.LeadAttribute,0) );
	User:eraseItem( WorkOnStone[User.id], 1 ); -- erase the item we're working on
	local notCreated = User:createItem( Stones[WorkOnStone[User.id]].productId, Stones[WorkOnStone[User.id]].amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( Stones[WorkOnStone[User.id]].productId, notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest f‰llt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",WorkOnStone[User.id])>0) then  -- there are still items we can work on
			stonecutting.SavedWorkTime[User.id] = stonecutting:GenWorkTime(User,SourceItem);
			User:startAction( stonecutting.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.InformNLS( User, 
			"Du hast keine " .. Stones[WorkOnStone[User.id]].nameDE .. " mehr.", 
			"You have no " .. Stones[WorkOnStone[User.id]].nameEN .. " anymore." );
		end
	end

	if base.common.ToolBreaks( User, SourceItem, false ) then -- damage and possibly break the tool
		base.common.InformNLS(User,
		"Dein alter Meiﬂel zerbricht.",
		"Your old chisel breaks.");
		return
	end
end

function LookAtItem( User, Item )
    world:itemInform( User, Item, base.lookat.GetItemDescription( User, Item, 1, false, false) );
end
