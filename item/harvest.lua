-- Harvest various fruits
require("base.common")
require("content.gathering")

module("item.harvest", package.seeall)

-- UPDATE common SET com_script='item.harvest' WHERE com_itemid IN (14,300,387, 1809);

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
	content.gathering.InitGathering();
	InitHarvestItems();
	local fruitgathering = content.gathering.fruitgathering;

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

	if base.common.Encumbrence(User) then
		base.common.InformNLS( User,
		"Deine Rüstung behindert Dich beim Sammeln der Früchte.",
		"Your armour disturbs you while gathering fruits." );
		return
	end

	-- TODO: should it be disabled?
	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if not base.common.IsLookingAt( User, SourceItem.pos ) then -- check looking direction
		base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary
	end
	
	-- any other checks?
	-- check if there is a harvestable item or any item at all
	local harvestItem = nil;
	harvestItem = HarvestItems[SourceItem.id];
	if ( harvestItem == nil) then
		User:inform("[ERROR] Unknown harvest item, id: " .. SourceItem.id .. ". Please inform a developer.");
		return;
	end
	-- there is a harvestable item, but does the ground fit?
	local GroundType = base.common.GetGroundType(world:getField(SourceItem.pos):tile());
	local harvestProduct = nil;
	for _,hp in pairs(harvestItem) do 
		if (hp.groundType == nil or GroundType == hp.groundType) then
			harvestProduct = hp;
			break;
		end
	end
	if ( harvestProduct == nil ) then
		base.common.InformNLS( User, 
		"Diese Pflanze trägt keine Früchte. Vielleicht wird diese Art Pflanze in einem anderen Boden besser gedeihen.", 
		"This plant bears no fruits. Maybe this type of plant will flourish better in another soil." );
		return;
	end
	-- check the amount 
	local amountStr = SourceItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	else
		-- first time that this item is harvested
		amount = harvestProduct.maxAmount;
		SourceItem:setData("amount","" .. harvestProduct.maxAmount);
		world:changeItem(SourceItem);
	end
	User:inform("amount: " .. amount);
	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		return;
	end
	if ( amount == 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Zero amount for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
		return;
	end
	
	-- since we're here, there is something we can harvest
	
	if ( ltstate == Action.none ) then -- currently not working -> let's go
		fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User,nil);
		User:startAction( fruitgathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talkLanguage( Character.say, Player.german, "#me beginnt Früchte zu sammeln.");
		User:talkLanguage( Character.say, Player.english, "#me starts to gather fruits."); 
		return
	end

	-- since we're here, we're working

	if fruitgathering:FindRandomItem(User) then
		return
	end

	User:learn( fruitgathering.LeadSkill, fruitgathering.LeadSkillGroup, fruitgathering.SavedWorkTime[User.id], 100, User:increaseAttrib(fruitgathering.LeadAttribute,0) );
	amount = amount - 1;
	local notCreated = User:createItem( harvestProduct.productId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( harvestProduct.productId, notCreated, User.pos, true, 333, nil );
		base.common.InformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (amount>0) then  -- there are still fruits we can gather
			fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User,nil);
			User:startAction( fruitgathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		end
	end
	if (amount<=0) then
		base.common.InformNLS(User,
		"Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.", 
		"This plant is already fully harvested. Give it time to grow again." );
		-- reset amount
		amount = harvestProduct.maxAmount;
		-- change item id
		SourceItem.id = harvestProduct.nextItemId;
		local season = math.ceil(world:getTime("month")/4);
		SourceItem.wear = harvestProduct.growCycles[4];
	end
	SourceItem:setData("amount","" .. amount);
	world:changeItem(SourceItem);
end

function InitHarvestItems()
	if ( HarvestItems ~= nil ) then
		return;
	end
	HarvestItems = {};
	
	RegrowTime = 300;
	
    -- just for short writing
    local gt = base.common.GroundType;
	
	HarvestItems[ 14 ] = {									-- apple tree
	CreateHarvestProduct(15, nil, nil, 10, 11)					-- apple
	}
	HarvestItems[ 300 ] = {									-- cherry tree
	CreateHarvestProduct(302, nil, nil, 20, 299)				-- cherry
	}
	HarvestItems[ 387 ] = {									-- bush
	CreateHarvestProduct(81, gt.forest, nil, 5, 386),			-- berries
	CreateHarvestProduct(199, gt.sand, nil, 7, 386),			-- tangerine
	CreateHarvestProduct(388, gt.grass, nil, 10, 386)			-- grapes
	}
end

-- for GroundType, see base.common.GroundType. If it doesn't matter, just set it to nil
-- GrowCycles define how fast the plants regrow in the 4 seasons. 1 cycle takes 3 minutes
function CreateHarvestProduct(ProductId, GroundType, GrowCycles, MaxAmount, NextItemId)
    local retValue = {};
    retValue.productId = ProductId;
    retValue.groundType = GroundType;
	retValue.growCycles = {1,1,1,1};
    if (GrowCycles ~= nil) then
		retValue.growCycles = GrowCycles;
    end
	retValue.maxAmount = 10;
	if ( MaxAmount ~= nil ) then
		retValue.maxAmount = MaxAmount;
	end
	retValue.nextItemId = NextItemId;
    return retValue;
end

--[[ old list
		-- Format of entry: ground type, difficulty, product, followup item, available in seasons {spring,summer,fall,winter} (probability [0...10])
        -- ground types:
		-- -- all = 0
		-- -- Acker: = 1
        -- -- Wald:  = 2
        -- -- Sand:  = 3
        -- -- Wiese: = 4
        -- -- Fels:  = 5
        -- -- Wasser:= 6
        -- -- Dreck: = 7

        harvestItem[ 14 ] = {                        -- Apfelbaum
        { 0, 0, 15, 11, {5,8,10,0}, 81, 10 } };             -- Alle: Apfel

        harvestItem[ 300 ] = {                       -- Kirschbaum
        { 0, 0, 302, 299, {6,10,9,0}, 83, 20 } };           -- Alle: Kirsche
		
		harvestItem[ 1809 ] = {                        -- Eldan-Eiche
        { 0, 0, 759, 0, {5,0,10,10}, 83, 20 } };             -- Alle: Nüsse

        harvestItem[ 387 ] = {                       -- Strauch
        { 2, 0, 81,  386, {5,8,10,0}, 11,  5 },             -- Wald: Beeren
        { 3, 0, 199, 386, {6,10,9,0}, 11,  7 },             -- Sand: Mandarinen
        { 4, 0, 388, 386, {6,10,9,0}, 84, 10 } };           -- Wiese: Weintrauben
--]]