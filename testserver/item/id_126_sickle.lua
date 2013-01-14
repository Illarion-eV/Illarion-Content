-- harvesting herbs and field crops

-- UPDATE common SET com_script='item.id_126_sickle' WHERE com_itemid=126;

require("item.general.metal")
require("base.common")
module("item.id_126_sickle", package.seeall, package.seeall(item.general.metal))

LookAtItem = item.general.metal.LookAtItem

function UseItem(User, SourceItem, ltstate)
	content.gathering.InitGathering();
	InitHarvestItems();
  -- if we're gathering herbs or harvesting crops is determined below

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
		"Du musst die Sichel in der Hand haben!",
		"You have to hold the sickle in your hand!" );
		return
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end
  
  local TargetItem = GetHarvestItem(User);
  if ( TargetItem == nil) then
		base.common.HighInformNLS( User, 
		"Hier ist nichts, wofür du die Sichel benutzen kannst.", 
		"There is nothing for which you can use the sickle." );
		return;
	end
  harvestItem = HarvestItems[TargetItem.id];
  local TargetPos = TargetItem.pos;
	if not base.common.IsLookingAt( User, TargetPos ) then -- check looking direction
		base.common.TurnTo( User, TargetPos ); -- turn if necessary
	end
	
	-- there is a harvestable item, but does the ground fit?
	local GroundType = base.common.GetGroundType(world:getField(TargetPos):tile());
	local harvestProduct = nil;
	for _,hp in pairs(harvestItem) do 
		if (hp.groundType == nil or GroundType == hp.groundType) then
			harvestProduct = hp;
			break;
		end
	end
	if ( harvestProduct == nil ) then
		base.common.HighInformNLS( User, 
		"Diese Pflanze trägt nichts Nützliches, das du mit deiner Sichel schneiden kannst. Vielleicht wird diese Art Pflanze in einem anderen Boden besser gedeihen.", 
		"This plant yields nothing useful which you can cut with your sickle. Maybe this type of plant will flourish better in another soil." );
		return;
	end
	-- check the amount 
	local changeItem = false;
	local amountStr = TargetItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	elseif ( not harvestProduct.isFarmingItem and TargetItem.wear == 255 ) then
		-- first time that a (static!) herb item is harvested
		amount = MaxAmount;
		TargetItem:setData("amount","" .. MaxAmount);
		changeItem = true;
	end
	if ( amount < 0 ) then
		-- this should never happen...
		User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. TargetItem.id .. " at (" .. TargetPos.x .. "," .. TargetPos.y .. "," .. TargetPos.z .. "). Please inform a developer.");
		return;
	end
	if ( amount <= 1 and not harvestProduct.isFarmingItem ) then
		-- check for regrow even at amount==1, so a continuous working is guaranteed
		-- only non farming items regrow
		local serverTime = world:getTime("unix");
		for i=1,MaxAmount do 
			local t = TargetItem:getData("next_regrow_" .. i);
			if ( t ~= "" and tonumber(t) <= serverTime ) then
				-- regrow
				amount = amount + 1;
				TargetItem:setData("next_regrow_" .. i, "");
				changeItem = true;
			end
		end
		if ( amount == 0 ) then
			-- not regrown...
			base.common.HighInformNLS( User, 
			"Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.", 
			"This plant is already fully harvested. Give it time to grow again." );
			if ( changeItem ) then
				world:changeItem(TargetItem);
			end
			return;
		elseif ( amount > MaxAmount ) then
			-- this should never happen
			User:inform("[ERROR] Too high amount " .. amount .. " for item id " .. TargetItem.id .. " at (" .. TargetPos.x .. "," .. TargetPos.y .. "," .. TargetPos.z .. "). Please inform a developer.");
			if ( changeItem ) then
				world:changeItem(TargetItem);
			end
			return;
		else
			TargetItem:setData("amount", "" .. amount);
			changeItem = true;
		end
	elseif ( amount == 0 and harvestProduct.isFarmingItem ) then
		-- this is a farming item, it can't regrow
		base.common.HighInformNLS( User, 
		"Hier kannst du nichts ernten.", 
		"There is nothing you can harvest." );
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return;
	end
	
	-- since we're here, there is something we can harvest
	
	local theCraft = content.gathering.herbgathering;
	if ( harvestProduct.isFarmingItem ) then
		theCraft = content.gathering.farming;
	end

	if ( ltstate == Action.none ) then -- currently not working -> let's go
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		if ( amount > 1) then
			if ( harvestProduct.isFarmingItem ) then
				User:talkLanguage( Character.say, Player.german, "#me beginnt mit der Sichel zu ernten.");
				User:talkLanguage( Character.say, Player.english, "#me starts to harvest with the sickle.");
			else
				User:talkLanguage( Character.say, Player.german, "#me beginnt mit der Sichel Kräuter zu schneiden.");
				User:talkLanguage( Character.say, Player.english, "#me starts to cut herbs with the sickle.");
			end
		else
			-- this is no batch action => no emote message, only inform player
			if theCraft.SavedWorkTime[User.id] > 15 then
				if ( harvestProduct.isFarmingItem ) then
					base.common.InformNLS(User,
					"Du beginnst mit der Sichel zu ernten.",
					"You start to harvest with the sickle.");
				else
					base.common.InformNLS(User,
					"Du beginnst mit der Sichel Kräuter zu schneiden.",
					"You start to cut herbs with the sickle.");

				end
			end
		end
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return;
	end

	-- since we're here, we're working

	if theCraft:FindRandomItem(User) then
		if ( changeItem ) then
			world:changeItem(TargetItem);
		end
		return
	end

	amount = amount - 1;
	if ( harvestProduct.isFarmingItem ) then
		if ( amount == 0 ) then
			-- nothing left, remove the farming item
			world:erase(TargetItem, TargetItem.number);
		else
			-- just update the amount
			TargetItem:setData("amount", "" .. amount);
			changeItem = true;
		end
	else
		-- update the amount
		TargetItem:setData("amount", "" .. amount);
		changeItem = true;
		-- and update the next regrow
		local regrowOk = false;
		for i=1,MaxAmount do 
			local t = TargetItem:getData("next_regrow_" .. i);
			-- look for a free slot
			if ( t == "") then
				-- set the next regrow time according to season and grow factor
				local season = math.ceil(world:getTime("month")/4);
				TargetItem:setData("next_regrow_" .. i, "" .. world:getTime("unix") + math.floor(RegrowTime*harvestProduct.growFactors[season]));
				regrowOk = true;
				changeItem = true;
				break;
			end
		end
		if ( not regrowOk ) then
			-- there was no free slot, this should never happen
			User:inform("[ERROR] There was no regrow slot for item id " .. TargetItem.id .. " at (" .. TargetPos.x .. "," .. TargetPos.y .. "," .. TargetPos.z .. "). Please inform a developer.");
			if ( changeItem ) then
				world:changeItem(TargetItem);
			end
			return;
		end
	end
	-- since we're here, everything should be alright
	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], 20);
	local notCreated = User:createItem( harvestProduct.productId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( harvestProduct.productId, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
    local nextItem = GetHarvestItem(User);
		if ( amount > 0 or (nextItem~=nil and HarvestItems[nextItem.id].isFarmingItem == harvestProduct.isFarmingItem)) then  -- there are still items we can work on
			theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
			User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		elseif ( not harvestProduct.isFarmingItem ) then -- no items left
			-- only inform for non farming items. Farming items with amount==0 should already be erased.
			base.common.HighInformNLS(User,
			"Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.", 
			"This plant is already fully harvested. Give it time to grow again." );
    else
      base.common.HighInformNLS( User, 
      "Hier ist nichts mehr, wofür du die Sichel benutzen kannst.", 
      "There is nothing anymore for which you can use the sickle." );
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Sichel zerbricht.",
		"Your old sickle breaks.");
	end
	if ( changeItem ) then
		world:changeItem(TargetItem);
	end
end

-- check around the user for harvest items, only top items on the field!
function GetHarvestItem(User)
  -- first check front position
  local item = base.common.GetFrontItem(User);
  if (item ~= nil and HarvestItems[item.id] ~= nil and (item:getData("amount") ~= "" or item.wear == 255)) then
    return item;
  end
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do 
      local checkPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
      if (world:isItemOnField(checkPos)) then
        local item = world:getItemOnField(checkPos);
        -- harvest item has to be static or an amount has to be set
        if (HarvestItems[item.id] ~= nil and (item:getData("amount") ~= "" or item.wear == 255)) then
          return item;
        end
      end
    end
  end
  return nil;
end

-- for GroundType, see base.common.GroundType. If it doesn't matter, just set it to nil
-- GrowFactors define how fast the plants regrow in the 4 seasons
function CreateHarvestProduct(ProductId, GroundType, GrowFactors, IsFarmingItem)
    local retValue = {};
    retValue.productId = ProductId;
    retValue.groundType = GroundType;
    if (GrowFactors == nil) then
        GrowFactors = {1,1,1,1};
    end
    retValue.growFactors = GrowFactors;
	retValue.isFarmingItem = false;
	if ( IsFarmingItem == true ) then
		retValue.isFarmingItem = true;
	end
    return retValue;
end

function InitHarvestItems() 
    if (HarvestItems ~= nil) then
        return;
    end
    HarvestItems = {};
	-- some definitions
	MaxAmount = 10;
	RegrowTime = 300;
	
    -- just for short writing
    local gt = base.common.GroundType;
    
	-- herbs marked with TODO probably have the wrong name in the database. Correct names in German are given in the old list below
    -- druid herbs
    HarvestItems[273] = {                                   -- flower
    CreateHarvestProduct(144, gt.rocks),                         -- virgins weed
    CreateHarvestProduct(137, gt.sand),                          -- flamegoblet blossom
    CreateHarvestProduct(135, gt.grass),                         -- yellow weed
    CreateHarvestProduct(148, gt.forest),                        -- firnis blossom
    CreateHarvestProduct(763, gt.dirt),                          -- mash flower
    CreateHarvestProduct(767, gt.water)                          -- water blossom
	}
    
    HarvestItems[274] = {                                   -- fern
    CreateHarvestProduct(140, gt.forest),                        -- donf blade
    CreateHarvestProduct(156, gt.sand),                          -- steppe fern
    CreateHarvestProduct(153, gt.grass),                         -- foot leaf
    CreateHarvestProduct(752, gt.rock)                         -- mandrake
	}
    
    HarvestItems[301] = {                                   -- hedge
    CreateHarvestProduct(147, gt.forest),                        -- blackberry
    CreateHarvestProduct(142, gt.sand),                          -- sandberry
    CreateHarvestProduct(143, gt.grass),                         -- red elder
    CreateHarvestProduct(136, gt.dirt)                          -- anger berry
    }
    
    HarvestItems[338] = {                                   -- reed
    CreateHarvestProduct(134, gt.grass),                         -- fourleafed oneberry
    CreateHarvestProduct(155, gt.water)                         -- sibanac leaf
    }
    
    HarvestItems[1782] = {                                   -- grass
    CreateHarvestProduct(151, gt.forest),                        -- strawberry
    CreateHarvestProduct(141, gt.rocks),                         -- black thistle
    CreateHarvestProduct(145, gt.grass)                         -- heath flower
    }
    
    HarvestItems[1783] = {                                   -- grass
    CreateHarvestProduct(151, gt.forest),                        -- strawberry
    CreateHarvestProduct(141, gt.rocks),                         -- black thistle
    CreateHarvestProduct(145, gt.grass)                         -- heath flower
    }
	
    HarvestItems[1791] = {                                   -- sunflower
    CreateHarvestProduct(133, nil)                         -- sun herb
    }
    
    HarvestItems[1807] = {                                   -- blooming ceridern
    CreateHarvestProduct(753, nil)                             -- blue bird's berry
    }
    
    -- mushrooms
	HarvestItems[159] = {									-- toadstool
    CreateHarvestProduct(159, nil)								-- toadstool
    }
	
	HarvestItems[160] = {									-- red head
    CreateHarvestProduct(160, nil)								-- red head
    }
	
	HarvestItems[161] = {									-- herder's mushroom
    CreateHarvestProduct(161, nil)								-- herder's mushroom
    }
	
	HarvestItems[162] = {									-- birth mushroom
    CreateHarvestProduct(162, nil)								-- birth mushroom
    }
	
	HarvestItems[421] = {									-- bulbsponge mushroom
    CreateHarvestProduct(158, nil)								-- bulbsponge mushroom
    }
	
	HarvestItems[158] = {									-- bulbsponge mushroom
    CreateHarvestProduct(158, nil)								-- bulbsponge mushroom
    }
	
	HarvestItems[1790] = {									-- mushroom circle
    CreateHarvestProduct(163, nil)								-- champignon
    }
    
    -- helper herb
    HarvestItems[2169] = {									-- old log
    CreateHarvestProduct(157, nil)						-- rotten tree bark
	}
	
	HarvestItems[2170] = {									-- old log
    CreateHarvestProduct(157, nil)  						-- rotten tree bark
	}
	
	-- field crops
	HarvestItems[290] = {									-- cabbage
    CreateHarvestProduct(290, nil, nil, true)					-- cabbage
    }
	HarvestItems[537] = {									-- onion
    CreateHarvestProduct(201, nil, nil, true)					-- onion
    }
	HarvestItems[540] = {									-- tomato plant
    CreateHarvestProduct(200, nil, nil, true)					-- tomato
    }
	HarvestItems[731] = {									-- hop
    CreateHarvestProduct(154, nil, nil, true)					-- hop
    }
	HarvestItems[732] = {									-- old hops
    CreateHarvestProduct(728, nil, nil, true)					-- hop seeds
    }
	HarvestItems[2492] = {									-- greens
    CreateHarvestProduct(2493, nil, nil, true)					-- carrots
    }
	HarvestItems[782] = {									-- sugarcane
    CreateHarvestProduct(778, nil, nil, true)					-- sugarcane
    }
	HarvestItems[777] = {									-- withered tobacco plant
    CreateHarvestProduct(772, nil, nil, true)					-- tobacco
    }
  -- TODO when bug in MoveItem functions is resolved, remove these
  HarvestItems[779] = {									-- sugarcane seeds
    CreateHarvestProduct(779, nil, nil, true)
    }
  HarvestItems[773] = {									-- tobacco seeds
    CreateHarvestProduct(773, nil, nil, true)
    }
  HarvestItems[2917] = {								-- tomato seeds
    CreateHarvestProduct(2917, nil, nil, true)
    }
  HarvestItems[2494] = {								-- carrot seeds ("seeds")
    CreateHarvestProduct(2494, nil, nil, true)
    }
  HarvestItems[534] = {								  -- onion seeds
    CreateHarvestProduct(534, nil, nil, true)
    }
  HarvestItems[291] = {								  -- withered cabbage (seeds)
    CreateHarvestProduct(291, nil, nil, true)
    }
	
	-- anything else
	HarvestItems[308] = {									-- fir tree
    CreateHarvestProduct(149, nil)								-- fir tree sprout
    }
	HarvestItems[1812] = {									-- palm tree
    CreateHarvestProduct(80, gt.sand)							-- banana
    }
	HarvestItems[1813] = {									-- palm tree
    CreateHarvestProduct(80, gt.sand)							-- banana
    }
	
	HarvestItems[ 1809 ] = {								-- eldan oak
	CreateHarvestProduct(759, nil, {0.5,0.5,0.5,0.5})			-- nuts (was actually in harvest.lua with 20 MaxAmount, so just let it regrow twice as fast)
	}
	
end

--[[ old list
function InitHerblore()
    if (harvestItem == nil) then

        harvestItem = { };
        AreaHerbs = { };
        AreaTime = { };
        -- Format of entry: boden, difficulty, product, followup item, aviable in seasons[0..10]{spring,summer,fall,winter}
        -- Ground(field=1,forest=2,sand=3,grass=4,rocks=5,water=6,dirt=7,snow=8)
        
        
        -- Druidenkrï¿½uter
        
        harvestItem[ 273 ] = {                       -- Blume
        { 2, 5, 144, 0, {10, 1,10,16}, 37 },             -- Wald: 	Jungfernkraut
        { 3, 5, 137, 0, {10, 1,10,16}, 25 },             -- Sand: 	Flammkelchblüte
        { 4, 7, 135, 0, {16,10, 1,10}, 17 },             -- Wiese:	Gelbkraut
        { 5, 0, 148, 0, {10,16,10, 1}, 47 },             -- Fels: 	Firnisblüte
        { 6, 0, 763, 0, {10,16,10, 1}, 47 },             -- Wasser:	Sumpfblume
        { 7,50, 138, 0, { 1,10,16,10}, 26 },             -- Dreck:	Nachengelsblüte
        { 8,50, 757, 0, {10,16,10, 1}, 26 } };           -- Schnee:  Gottesblume
        
        harvestItem[ 274 ] = {                       -- Farn
        { 2,30, 140, 0, {10,16,10, 1}, 27 },               	-- Wald: 	Donfblatt
        { 3, 0, 156, 0, {10, 1,10,16}, 61 },               	-- Sand: 	Steppenfarn
        { 4,10, 153, 0, {16,10, 1,10}, 52 },               	-- Wiese:	Fußblatt
        { 5,20, 768, 0, {10,16,10, 1}, 52 },               	-- Fels: 	Wolfsfarn
		{ 6, 0, 754, 0, {10,16,10, 1}, 52 },            	-- Wasser:  Wasserfarn
		{ 7,50, 752, 0, { 1,10,16,10}, 26 },             	-- Dreck:	Alraune
		{ 8,50, 760, 0, { 1,10,16,10}, 26 } };             	-- Schnee:  Eisblatt
        
        harvestItem[ 301 ] = {                       -- Hecke
        { 2, 0, 147, 0, { 1,10,16,10}, 46 },              -- Wald: 	Brombeere
        { 3, 5, 142, 0, {10, 1,10,16}, 35 },              -- Sand: 	Sandbeere
        { 4, 0, 143, 0, { 1,10,16,10}, 36 },              -- Wiese: Roter Holunder
        { 5,20, 756, 0, {10,16,10, 1}, 52 },              -- Fels:  Frommbeere
        { 7,50, 136, 0, { 1,10,16,10}, 18 } };            -- Dreck: Wutbeere
        
        harvestItem[ 338 ] = {                       -- Schilf
        { 4, 5, 134, 0, {10, 1,10,16}, 16 },              -- Wiese:	 Vierblättrige Einbeere
        { 6,30, 155, 0, {10,16,10, 1}, 54 } };            -- Wasser: Sibanac Blatt
        
        harvestItem[ 1782 ] = {                      -- Gras
        { 2, 0, 151, 0, {10,16,10, 1}, 48 },             -- Wald: 	Erdbeere
        { 3, 5, 146, 0, { 1,10,16,10}, 28 },             -- Sand: 	Wüstenhimmelskapsel
        { 4,20, 141, 0, { 1,10,16,10}, 38 },             -- Wiese:	Schwarze Distel
        { 5,20, 145, 0, {16,10, 1,10}, 38 },             -- Stein:	Heideblüte
        { 6, 0, 761, 0, { 1,10,16,10}, 52 },             -- Wasser:  Regenkraut
        { 7,50, 762, 0, {10, 1,10,16}, 18 } };           -- Dreck:   Schwefelgras

        harvestItem[ 1783 ] = {                      -- Gras
        { 2, 0, 151, 0, {10,16,10, 1}, 48 },             -- Wald: 	Erdbeere
        { 3, 5, 146, 0, { 1,10,16,10}, 28 },             -- Sand: 	Wüstenhimmelskapsel
        { 4,20, 141, 0, { 1,10,16,10}, 38 },             -- Wiese:	Schwarze Distel
        { 5,20, 145, 0, {16,10, 1,10}, 38 },             -- Stein:	Heideblüte
        { 6, 0, 761, 0, { 1,10,16,10}, 52 },             -- Wasser:  Regenkraut
        { 7,50, 762, 0, {10, 1,10,16}, 18 } };           -- Dreck:   Schwefelgras
        
        harvestItem[ 1791 ] = {                      -- Sonnenblumen
        { 4,30, 133, 0, {10,16,10, 1}, 15 } };            -- Wiese: Sonnenkraut
        
        harvestItem[ 767 ] = {                      -- Wasserlilie
        { 6,30, 767, 0, {10,16,10,1}, 15 } };            -- Wasser: Wasserlilie
        
        harvestItem[ 1807 ] = {                      -- Ceridern
        { 0,30, 753, 0, {16,10, 1,10}, 15 } };            -- alle: Ceridern-Beere
        
        harvestItem[ 1808 ] = {                      -- Drachenbaum
        { 0,30, 755, 0, {16,10, 1,10}, 15 } };            -- alle: Feuerschote
        
        -- Pilze

        harvestItem[ 159 ] = {                       -- Fliegenpilz
        { 0, 0, 159, 0, { 1,10,16,10}, 11 }};             -- Alle: Fliegenpilz

         harvestItem[ 161 ] = {                       -- Hirtenpilz
        { 0, 0, 161, 0, { 1,10,16,10}, 11 }};             -- Alle: Hirtenpilz

        harvestItem[ 426 ] = {                       -- Pilz
        { 0, 0, 162, 0, {16,10, 1,10}, 11 }};             -- Alle: Geburtspilz

        harvestItem[ 158 ] = {                       -- Knollenschwamm
        { 0, 0, 158, 0, {10, 1,10,16}, 11 }};             -- Alle: Knollenschwamm

        
        harvestItem[ 1790 ] = {                      -- Pilzkreis
        { 0, 0, 163, 0, { 1,10,16,10}, 73 } };             -- Alle: Champignon
        
        -- Hilfskraut

        harvestItem[ 203 ] = {                       -- Palme
        { 0, 0, 157, 0, {10,10,10,10}, 11 }};             -- Alle: Faulbaumrinde
        
        harvestItem[ 2169 ] = {                      -- Alter Baumstamm
        { 2,30, 157, 0, {10,16,10,1}, 11 },                -- Wald: Faulbaumrinde
        { 7,10, 157, 0, {10,16,10,1}, 11 } };              -- Dreck: Faulbaumrinde

        harvestItem[ 2170 ] = {                      -- Alter Baumstamm
        { 2,30, 157, 0, {10,16,10,1}, 11 },                -- Wald: Faulbaumrinde
        { 7,10, 157, 0, {10,16,10,1}, 11 } };              -- Dreck: Faulbaumrinde



		-- Ackerbau

    	harvestItem[ 290 ] = {                       -- Kohl
        { 0, 0, 290, -1, {14,20,16,0}, 11 } };             -- Alle: Kohl
        
        harvestItem[ 537 ] = {                       -- reife Zwiebeln
        { 0, 0, 201, -1, {14,20,16,0}, 74 } };            -- Alle: Zwiebeln

        harvestItem[ 540 ] = {                       -- reife Tomaten
        { 0, 0, 200, -1, {14,20,16,0}, 82 } };            -- Alle: Tomaten

        harvestItem[ 731 ] = {                       -- Hopfen
        { 0, 0, 154, -1, {14,20,16,0}, 53 } };            -- Alle: Hopfen

        harvestItem[ 732 ] = {                       -- alter Hopfen
        { 0, 0, 728, -1, {14,20,16,0}, 11 } };            -- Alle: Hopfenwurzel
        
        harvestItem[ 2492 ] = {                      -- reife Karotten
        { 0, 0, 2493, -1, {14,20,16,0}, 11 } };            -- Alle: Karotten

		harvestItem[ 782 ] = {                      -- reifes Zuckerrohr
        { 0, 0, 778, -1, {14,20,16,0}, 73 } };            -- Alle: Zuckerrohr

        harvestItem[ 777 ] = {                      -- reifer Tabak
        { 0, 0, 772, -1, {14,20,16,0}, 82 } };            -- Alle: Tabak

		-- Sonstiges

        harvestItem[ 308 ] = {                       -- Tannenbaum
        { 0,0, 149, 0, {16,10,5,10}, 11 } };             -- Alle: Tannensetzling

        harvestItem[ 1812 ] = {                      -- kleine Palme
        { 3,20, 80, 0, {14,20,16,1}, 11 } };               -- Sand: Banane

        harvestItem[ 1813 ] = {                      -- kleine Palme
        { 3,20, 80, 0, {14,20,16,1}, 11 } };               -- Sand: Banane
        
        
        harvestItem[ 125 ] = {                       -- Baumstumpf Apfel
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 309 ] = {                       -- Baumstumpf Tanne
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 541 ] = {                       -- Baumstumpf Kirsche
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 542 ] = {                       -- Baumstumpf Cachdern
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 584 ] = {                       -- Baumstumpf Eldan-Eiche
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 585 ] = {                       -- Baumstumpf Kiefer
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz
        
        harvestItem[ 587 ] = {                       -- Baumstumpf Naldor
        { 0,0, 152, 0, {10, 1,10,16}, 11 } };             -- Alle: Lebenswurz


    end
end
--]]
