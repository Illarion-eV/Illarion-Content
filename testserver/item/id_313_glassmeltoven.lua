-- quartz sand (316) + potash (314) --> glass ingot (41)
-- additional tool: glass blow pipe (311)

-- clay (26) --> unfired bricks (736)
-- 5x unfired bricks (736) --> 5x bricks (2588)
-- additional tool: brick mould (734)

-- UPDATE common SET com_script='item.id_313_glassmeltoven' WHERE com_itemid IN (313);

require("base.common")
require("content.gathering")

module("item.id_313_glassmeltoven", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
  content.gathering.InitGathering();
  if (User:countItemAt("all",311)==0 and User:countItemAt("all",734)==0) then
    -- no tool at all
    base.common.HighInformNLS( User,
		"Du brauchst ein Glasblasrohr oder eine Ziegelform um hier zu arbeiten.", 
		"You need a glass blow pipe or a brick mould to work here." );
  elseif (User:countItemAt("all",311)>0 and User:countItemAt("all",734)==0) then
    -- only glass blow pipe
    ProduceGlassIngots( User, SourceItem, TargetItem, Counter, Param, ltstate );
  elseif (User:countItemAt("all",311)==0 and User:countItemAt("all",734)>0) then
    -- only brick mould
    if (User:countItemAt("all",26)>0) then
      ProduceUnfiredBricks( User, SourceItem, TargetItem, Counter, Param, ltstate );
    elseif (User:countItemAt("all",736)>4) then
      ProduceBricks( User, SourceItem, TargetItem, Counter, Param, ltstate );
    else
      base.common.HighInformNLS( User,
      "Du brauchst Lehm oder fünf ungebrannte Ziegel um mit der Ziegelform hier zu arbeiten.", 
      "You need clay or five unfired bricks to work here with the brick mould." );
    end
  else
    -- both tools
    if (User:countItemAt("all",26)>0) then
      ProduceUnfiredBricks( User, SourceItem, TargetItem, Counter, Param, ltstate );
    elseif (User:countItemAt("all",736)>4) then
      ProduceBricks( User, SourceItem, TargetItem, Counter, Param, ltstate );
    elseif (User:countItemAt("all",316)>0 and User:countItemAt("all",314)>0) then
      ProduceGlassIngots( User, SourceItem, TargetItem, Counter, Param, ltstate );
    else
      base.common.HighInformNLS( User,
      "Für die Ziegelform brauchst du Lehm oder fünf ungebrannte Ziegel, für das Glasblasrohr brauchst du Quarzsand und Pottasche.", 
      "For the brick mould you need clay or five unfired bricks, for the glass blow pipe you need quartz sand and potash." );
    end
  end
end

function ProduceGlassIngots( User, SourceItem, TargetItem, Counter, Param, ltstate )

  local glassingotproducing = content.gathering.glassingotproducing;

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
	if (User:countItemAt("all",311)==0) then
		User:inform("[ERROR] No glass blowing pipe found. Please inform a developer.");
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 311 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 311 ) then
			base.common.HighInformNLS( User,
			"Du musst das Glasblasrohr in der Hand haben!",
			"You have to hold the glass blow pipe in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",316)==0 or User:countItemAt("all",314)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Quarzsand und Pottasche um Glasblöcke herzustellen.", 
		"You need quartz sand and potash for producing glass ingots." );
    return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		glassingotproducing.SavedWorkTime[User.id] = glassingotproducing:GenWorkTime(User,toolItem);
		User:startAction( glassingotproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Glasblöcke herzustellen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to produce glass ingots."); 
		return
	end

	-- since we're here, we're working

	if glassingotproducing:FindRandomItem(User) then
		return
	end

	User:learn( glassingotproducing.LeadSkill, glassingotproducing.SavedWorkTime[User.id], 20);
	User:eraseItem( 316, 1 ); -- erase the item we're working on
  User:eraseItem( 314, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 41, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 41, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",316)>0 and User:countItemAt("all",314)>0) then  -- there are still items we can work on
			glassingotproducing.SavedWorkTime[User.id] = glassingotproducing:GenWorkTime(User,toolItem);
			User:startAction( glassingotproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du brauchst Quarzsand und Pottasche um Glasblöcke herzustellen.", 
      "You need quartz sand and potash for producing glass ingots." );
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein altes Glasblasrohr zerbricht.",
		"Your old glass blow pipe breaks.");
		return
	end
end

function ProduceUnfiredBricks( User, SourceItem, TargetItem, Counter, Param, ltstate )
	local bricksproducing = content.gathering.bricksproducing;

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
	if (User:countItemAt("all",734)==0) then
		User:inform("[ERROR] No brick mould found. Please inform a developer.");
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 734 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 734 ) then
			base.common.HighInformNLS( User,
			"Du musst die Ziegelform in der Hand haben!",
			"You have to hold the brick mould in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?
  if (User:countItemAt("all",26)==0) then
		User:inform("[ERROR] No clay found. Please inform a developer.");
		return
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
		User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt ungebrannte Ziegel herzustellen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to produce unfired bricks."); 
		return
	end

	-- since we're here, we're working

	if bricksproducing:FindRandomItem(User) then
		return
	end

	User:learn( bricksproducing.LeadSkill, bricksproducing.SavedWorkTime[User.id], 20);
	User:eraseItem( 26, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 736, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 736, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",26)>0) then  -- there are still items we can work on
			bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
			User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
      -- Should actually never reach this, handle it nevertheless.
			base.common.HighInformNLS(User,
			"Du hast keinen Lehm mehr.",
			"You have no clay anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Ziegelform zerbricht.",
		"Your old brick mould breaks.");
		return
	end
end

function ProduceBricks( User, SourceItem, TargetItem, Counter, Param, ltstate )
	local bricksproducing = content.gathering.bricksproducing;

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
	if (User:countItemAt("all",734)==0) then
		User:inform("[ERROR] No brick mould found. Please inform a developer.");
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~= 734 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 734 ) then
			base.common.HighInformNLS( User,
			"Du musst die Ziegelform in der Hand haben!",
			"You have to hold the brick mould in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?
  if (User:countItemAt("all",736)<5) then
		User:inform("[ERROR] Not enough unfired bricks found. Please inform a developer.");
		return
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
		User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Ziegel zu brennen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to fire bricks."); 
		return
	end

	-- since we're here, we're working

	if bricksproducing:FindRandomItem(User) then
		return
	end

	User:learn( bricksproducing.LeadSkill, bricksproducing.SavedWorkTime[User.id], 20);
	User:eraseItem( 736, 5 ); -- erase the item we're working on
	local amount = 5; -- set the amount of items that are produced
	local notCreated = User:createItem( 2588, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2588, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",736)>4) then  -- there are still items we can work on
			bricksproducing.SavedWorkTime[User.id] = bricksproducing:GenWorkTime(User,toolItem);
			User:startAction( bricksproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
      -- Should actually never reach this, handle it nevertheless.
			base.common.HighInformNLS(User,
			"Du hast nicht mehr genug ungebrannte Ziegel.",
			"You don't have enough unfired bricks anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Ziegelform zerbricht.",
		"Your old brick mould breaks.");
		return
	end
end
