-- sowing seeds
require("base.common")

module("item.seeds", package.seeall)

-- UPDATE common SET com_script='item.seeds' WHERE com_itemid IN (259,291,534,2494,2917,728,773,779);

-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 247 WHERE com_itemid = 246;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 248 WHERE com_itemid = 247;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 246 WHERE com_itemid = 248;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 259 WHERE com_itemid = 259;

-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 289 WHERE com_itemid = 288;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 290 WHERE com_itemid = 289;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 291 WHERE com_itemid = 290;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 291 WHERE com_itemid = 291;

-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 536 WHERE com_itemid = 535;
-- UPDATE common SET com_agingspeed = 2, com_objectafterrot = 537 WHERE com_itemid = 536;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 534 WHERE com_itemid = 537;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 534 WHERE com_itemid = 534;

-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 2491 WHERE com_itemid = 2490;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 2492 WHERE com_itemid = 2491;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2494 WHERE com_itemid = 2492;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2494 WHERE com_itemid = 2494;

-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 539 WHERE com_itemid = 538;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 540 WHERE com_itemid = 539;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2917 WHERE com_itemid = 540;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 2917 WHERE com_itemid = 2917;

-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 730 WHERE com_itemid = 729;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 731 WHERE com_itemid = 730;
-- UPDATE common SET com_agingspeed = 3, com_objectafterrot = 732 WHERE com_itemid = 731;
-- UPDATE common SET com_agingspeed = 4, com_objectafterrot = 732 WHERE com_itemid = 732;

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	local farming = content.gathering.farming;
    
    if ( seedPlantList == nil ) then
        seedPlantList = {};
        seedPlantList[259] = 246; -- grain
        seedPlantList[291] = 288; --cabbage
        seedPlantList[534] = 535; --onions
        seedPlantList[2494] = 2490; --carrots
        seedPlantList[2917] = 538; --tomatoes
        seedPlantList[728] = 729; --hop
        seedPlantList[773] = 774; --tobacco
        seedPlantList[779] = 780; --sugarcane
    end
    
    if ( seedPlantList[SourceItem.id] == nil ) then
        User:inform("[ERROR] Unknown seed item id: " .. SourceItem.id .. ". Please inform a developer.");
        return;
    end
	
	-- is the target position needed?
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
		"Du musst das Saatgut in der Hand haben!",
		"You have to hold the seeds in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, TargetPos ) then -- check looking direction
		base.common.TurnTo( User, TargetPos ); -- turn if necessary
	end
	
    -- only on farm land
	local Field = world:getField( TargetPos )
    local groundType = base.common.GetGroundType( Field:tile() );
    if ( groundType ~= 1 ) then
        base.common.HighInformNLS(User,
        "Du kannst nur auf Ackerboden Saatgut aussäen.",
        "Sowing seeds is only possible on farm land.");
        return
    end
    
    -- not in winter
    local month=world:getTime("month");
    local season=math.ceil(month/4);
    if (season == 4) then
        base.common.HighInformNLS(User,
        "Der Boden ist tief gefroren. Im Winter wirst du nichts anbauen können.",
        "The ground is frozen deeply. You won't be able to plant anything in winter.");
        return
    end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		farming.SavedWorkTime[User.id] = farming:GenWorkTime(User,nil);
		User:startAction( farming.SavedWorkTime[User.id], 0, 0, 0, 0);
        -- this is no batch action => no emote message, only inform player
		if farming.SavedWorkTime[User.id] > 15 then
            base.common.InformNLS(User,
            "Du säst Saatgut aus.",
            "You sow seeds.");
        end
		return
	end

	-- since we're here, we're working

	if farming:FindRandomItem(User) then
		return
	end

	User:learn( farming.LeadSkill, farming.SavedWorkTime[User.id], 20);
	local amount = math.random(1,3); -- set the amount of items that are produced
	world:createItemFromId( seedPlantList[SourceItem.id], 1, TargetPos, true, 333 ,{["amount"] = "" .. amount});
	world:erase( SourceItem, 1 ); -- erase the seed
end

-- some plants rot to seeds again, those have a different data value
function MoveItemBeforeMove(User, SourceItem, TargetItem)
    local amount = SourceItem:getData("amount");
    if (amount ~= "") then
        amount = tonumber(amount);
        if (TargetItem:getType() == 3) then -- item on the map
            local notCreated = User:createItem(SourceItem.id, amount, 333, nil);
            if (notCreated > 0) then
                world:createItemFromId( SourceItem.id, notCreated, SourceItem.pos, true, 333, nil );
            end
        else
            world:createItemFromId( SourceItem.id, amount, SourceItem.pos, true, 333, nil );
        end
        world:erase( SourceItem, SourceItem.number );
    end
    return true;
end

function MoveItemAfterMove(User, SourceItem, TargetItem)
    if (SourceItem:getData("amount") ~= "") then
        world:erase( SourceItem, SourceItem.number );
    end
end
