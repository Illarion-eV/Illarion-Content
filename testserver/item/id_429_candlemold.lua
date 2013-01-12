-- wax (431) --> candles (43)

-- additional static tool: chandler table (428)

-- UPDATE common SET com_script='item.id_429_candlemold' WHERE com_itemid IN (429);

require("base.common")
require("content.gathering")
require("item.general.wood")

module("item.id_429_candlemold", package.seeall)

function UseItem(User, SourceItem, ltstate)
	content.gathering.InitGathering();
	local candleproducing = content.gathering.candleproducing;
	
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
  local staticTool = base.common.GetItemInArea(User.pos, 428);
  if (staticTool == nil) then
    base.common.HighInformNLS( User,
    "Du musst an einem Kerzenziehertisch arbeiten!",
    "You have to work at a chandler table!" );
    return;
  end
	
	if (SourceItem:getType() ~= 4) then -- tool in hand
		base.common.HighInformNLS( User,
		"Du musst die Kerzenform in der Hand haben!",
		"You have to hold the candle mold in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, staticTool.pos ) then -- check looking direction
		base.common.TurnTo( User, staticTool.pos ); -- turn if necessary
	end
	
	-- any other checks?

	if (User:countItemAt("all",431)==0) then -- check for items to work on
		base.common.HighInformNLS( User, 
		"Du brauchst Wachs um Kerzen herzustellen.", 
		"You need wax for producing candles." );
		return;
	end
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		candleproducing.SavedWorkTime[User.id] = candleproducing:GenWorkTime(User,SourceItem);
		User:startAction( candleproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Kerzen zu ziehen.");
		User:talkLanguage( Character.say, Player.english, "#me starts to make candles."); 
		return
	end

	-- since we're here, we're working

	if candleproducing:FindRandomItem(User) then
		return
	end

	User:learn( candleproducing.LeadSkill, candleproducing.SavedWorkTime[User.id], 20);
	User:eraseItem( 431, 1 ); -- erase the item we're working on
	local amount = 1; -- set the amount of items that are produced
	local notCreated = User:createItem( 43, amount, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 43, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (User:countItemAt("all",431)>0) then  -- there are still items we can work on
			candleproducing.SavedWorkTime[User.id] = candleproducing:GenWorkTime(User,SourceItem);
			User:startAction( candleproducing.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			base.common.HighInformNLS(User,
			"Du hast kein Wachs mehr.",
			"You have no wax anymore.");
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Kerzenform zerbricht.",
		"Your old candle mold breaks.");
		return
	end
end

function LookAtItem(User,Item)
  item.general.wood.LookAtItem(User,Item)
end
