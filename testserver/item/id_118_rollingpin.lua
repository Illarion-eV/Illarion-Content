-- 5x flour (2) + bucket of water (52) --> 5x dough (5)

-- additional static tool: any table (36, 320, 522, 524, 2879, 2880, 2885)

-- UPDATE common SET com_script='item.id_118_rollingpin' WHERE com_itemid IN (118);

require("base.common")

module("item.id_118_rollingpin", package.seeall);

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local doughproducing = content.gathering.doughproducing;
  if (TableList == nil) then
    TableList = {36, 320, 522, 524, 2879, 2880, 2885};
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
  
  -- check for some static item around
  local staticTool = nil;
  local tableIndex = 1;
  while (staticTool == nil and tableIndex <= table.getn(TableList)) do 
    staticTool = base.common.GetItemInArea(User.pos, TableList[tableIndex]);
    tableIndex = tableIndex + 1;
  end
  if (staticTool == nil) then
    base.common.HighInformNLS( User,
    "Du musst an einem Tisch arbeiten!",
    "You have to work at a Tisch!" );
    return;
  end

	if base.common.Encumbrence(User) then
		base.common.HighInformNLS( User,
		"Deine Rüstung behindert Dich bei der Teigherstellung.",
		"Your armour disturbs you while producing dough." );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, staticTool.pos ) then -- check looking direction
		base.common.TurnTo( User, staticTool.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",2)==0 or User:countItemAt("all",52)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Mehl und einen Eimer mit Wasser um Teig herzustellen.", 
		"You need flour and a bucket of water for producing dough." );
		return;
	elseif (User:countItemAt("all",2)<5) then
		base.common.HighInformNLS( User, 
		"Du hast nicht genug Mehl um Teig herzustellen.", 
		"You dont't have enough flour for producing dough." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		doughproducing.SavedWorkTime[User.id] = doughproducing:GenWorkTime(User,SourceItem);
		User:startAction( doughproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Teig herzustellen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to produce dough."); 
		return
	end

	-- since we're here, we're working

	if doughproducing:FindRandomItem(User) then
		return
	end

	User:learn( doughproducing.LeadSkill, doughproducing.SavedWorkTime[User.id], 100);
	User:eraseItem( 2, 5 ); -- erase the item we're working on
  local theBucket = base.common.GetItemInInventory(User, 52);
  local bucketAmount = 0;
  local bucketString = theBucket:getData("amount");
  if (bucketString ~= "") then
    bucketAmount = tonumber(bucketString);
  end
  if (bucketAmount < 1) then
    User:inform("[ERROR] Filled bucket has no amount. Data string: " .. bucketString .. ". Please informa developer.");
    world:swap(theBucket, 51, 333);
    return;
  end
  bucketAmount = bucketAmount - 1;
  local bucketNotCreated = 0;
  if (bucketAmount < 1) then
    User:eraseItem( 52, 1 )
    bucketNotCreated = User:createItem( 51, 1, 333, nil ); -- create an empty bucket
  else
    theBucket:setData("amount", bucketAmount);
  end
	local amount = 5; -- set the amount of items that are produced
	local notCreated = User:createItem( 5, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 or bucketNotCreated > 0) then -- too many items -> character can't carry anymore
		world:createItemFromId( 5, notCreated, User.pos, true, 333, nil );
		world:createItemFromId( 51, bucketNotCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",2)>=5 and User:countItemAt("all",52)>0) then  -- there are still items we can work on
			doughproducing.SavedWorkTime[User.id] = doughproducing:GenWorkTime(User,SourceItem);
			User:startAction( doughproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast nicht mehr genug Mehl und Eimer mit Wasser.",
			"You don't have enough flour and buckets of water anymore.");
		end
	end

	if base.common.ToolBreaks( User, SourceItem, false ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Dein altes Nudelholz zerbricht.",
		"Your old rolling pin breaks.");
		return
	end
end
