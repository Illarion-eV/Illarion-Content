-- Rohleder und Felle zu Leder
-- { raw leather (69), fur (2586) } --> leather (2547)

-- Arbeitscyclus: 2s - 5s

-- additional tool: razor blade (2746)

-- UPDATE common SET com_script='item.id_2052_stretcher' WHERE com_itemid = 2052;

require("base.common")
require("content.gathering")

module("item.id_2052_stretcher", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local leatherproducing = content.gathering.leatherproducing;

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
	if (User:countItemAt("all",2746)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Rasierklinge um Leder zu gerben.", 
		"You need a razor blade for tanning leather." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 2746 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2746 ) then
			base.common.HighInformNLS( User,
			"Du musst das Rasierklinge in der Hand haben!",
			"You have to hold the razor blade in your hand!" );
			return
		end
	end

	if base.common.Encumbrence(User) then
		base.common.HighInformNLS( User,
		"Deine Rüstung behindert Dich beim Gerben.",
		"Your armour disturbs you while tanning." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",2586)==0 and User:countItemAt("all",69)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Fell oder rohes Leder um es zu gerben.", 
		"You need fur or raw leather for tanning it." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		leatherproducing.SavedWorkTime[User.id] = leatherproducing:GenWorkTime(User,toolItem);
		User:startAction( leatherproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Leder zu gerben.");
		User:talkLanguage( Character.say, Player.english, "#me starts to tan leather."); 
		return
	end

	-- since we're here, we're working

	if leatherproducing:FindRandomItem(User) then
		return
	end
  
  local tanItemId = 0;
  if (User:countItemAt("all",69)>0) then
    tanItemId = 69;
  elseif (User:countItemAt("all",2586)>0) then
    tanItemId = 2586;
  end
  if (tanItemId == 0) then
    User:inform("[ERROR] No tanning item found. Please inform a developer.");
    return;
  end
	User:learn( leatherproducing.LeadSkill, leatherproducing.SavedWorkTime[User.id], 100);
	User:eraseItem( tanItemId, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 2547, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2547, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",2586)>0 or User:countItemAt("all",69)>0) then  -- there are still items we can work on
			leatherproducing.SavedWorkTime[User.id] = leatherproducing:GenWorkTime(User,toolItem);
			User:startAction( leatherproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Fell und rohes Leder mehr.",
			"You have no fur and raw leather anymore.");
		end
	end

	if base.common.ToolBreaks( User, toolItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Rasierklinge zerbricht.",
		"Your old razor blade breaks.");
		return
	end
end