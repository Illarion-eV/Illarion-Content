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
	
	-- check the amount 
	local MaxAmount = 10
	local changeItem = false;
	local amountStr = SourceItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	elseif ( SourceItem.wear == 255 ) then
		-- first time that a (static!) herb item is harvested
		amount = MaxAmount;
		SourceItem:setData("amount","" .. MaxAmount);
		changeItem = true;
	end
	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		return;
	end
	if ( amount <= 1 ) then
		-- check for regrow even at amount==1, so a continuous working is guaranteed
		-- only non farming items regrow
		local serverTime = world:getTime("unix");
		for i=1,MaxAmount do 
			local t = SourceItem:getData("next_regrow_" .. i);
			if ( t ~= "" and tonumber(t) <= serverTime ) then
				-- regrow
				amount = amount + 1;
				SourceItem:setData("next_regrow_" .. i, "");
				changeItem = true;
			end
		end
		if ( amount == 0 ) then
			-- not regrown...
			base.common.HighInformNLS( User, 
			"Dieser Bienenstock ist leer. Gib den Bienen einige Zeit neuen Honig zu machen.", 
			"This beehive is empty. Give the bees sometime to make new honey." );
			if ( changeItem ) then
				world:changeItem(SourceItem);
			end
			return;
		elseif ( amount > MaxAmount ) then
			-- this should never happen
			User:inform("[ERROR] Too high amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
			if ( changeItem ) then
				world:changeItem(SourceItem);
			end
			return;
		else
			SourceItem:setData("amount", "" .. amount);
			changeItem = true;
		end
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
	amount = amount - 1
	-- update the amount
	SourceItem:setData("amount", "" .. amount);
	changeItem = true;
	-- and update the next regrow
	local regrowOk = false;
	for i=1,MaxAmount do 
		local t = SourceItem:getData("next_regrow_" .. i);
		-- look for a free slot
		if ( t == "") then
			-- set the next regrow time according to season and grow factor
			local season = math.ceil(world:getTime("month")/4);
			SourceItem:setData("next_regrow_" .. i, "" .. world:getTime("unix") + 300)
			regrowOk = true;
			changeItem = true;
			break;
		end
	end
	if ( not regrowOk ) then
		-- there was no free slot, this should never happen
		User:inform("[ERROR] There was no regrow slot for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		if ( changeItem ) then
			world:changeItem(SourceItem);
		end
		return;
	end
	
	if ( changeItem ) then
		world:changeItem(SourceItem);
	end
	
	-- since we're here, everything should be alright
	User:learn( honeygathering.LeadSkill, honeygathering.SavedWorkTime[User.id], 100);
	local notCreated = User:createItem( 2529, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( 2529, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if amount > 0 then  -- there are still items we can work on
			honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
			User:changeSource(SourceItem)
			User:startAction( honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		else -- no items left
			-- only inform for non farming items. Farming items with amount==0 should already be erased.
			base.common.HighInformNLS(User,
			"Dieser Bienenstock ist leer. Gib den Bienen einige Zeit neuen Honig zu machen.", 
			"This beehive is empty. Give the bees sometime to make new honey." );
		end
	end
end