--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- harvesting herbs and field crops

-- UPDATE common SET com_script='item.id_126_sickle' WHERE com_itemid=126;

require("item.general.metal")
require("base.common")
require("content.gathering")

module("item.id_126_sickle", package.seeall)

LookAtItem = item.general.metal.LookAtItem

function UseItem(User, SourceItem, ltstate)
	content.gathering.InitGathering();
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
		User:talk(Character.say, "#me unterbricht "..gText.." Arbeit.", "#me interrupts "..eText.." work.")
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

  -- first try to get only valid items
  local TargetItem = GetHarvestItem(User, true, false, false);
  if (TargetItem == nil) then
    -- no valid item ... try to get any item and inform later
    TargetItem = GetHarvestItem(User, false, false, false);
  end
  if ( TargetItem == nil) then
		base.common.HighInformNLS( User,
		"Hier ist nichts, wofür du die Sichel benutzen kannst.",
		"There is nothing for which you can use the sickle." );
		return;
	end

  local TargetPos = TargetItem.pos;
	if not base.common.IsLookingAt( User, TargetPos ) then -- check looking direction
		base.common.TurnTo( User, TargetPos ); -- turn if necessary
	end

	-- there is a harvestable item, but does the ground fit?
	local harvestProduct = GetValidProduct(TargetItem, false, false);
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
				User:talk(Character.say, "#me beginnt mit der Sichel zu ernten.", "#me starts to harvest with the sickle.")
			else
				User:talk(Character.say, "#me beginnt mit der Sichel Kräuter zu schneiden.", "#me starts to cut herbs with the sickle.")
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
  if ( changeItem ) then
		world:changeItem(TargetItem);
	end

	-- since we're here, everything should be alright
	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
	local notCreated = User:createItem( harvestProduct.productId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( harvestProduct.productId, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
    -- try to find a next item of the same (non-)farming type
    local nextItem = GetHarvestItem(User, true, harvestProduct.isFarmingItem, not harvestProduct.isFarmingItem);
		if ( amount > 0 or nextItem~=nil) then  -- there are still items we can work on
      if (amount < 1) then
        base.common.TurnTo( User, nextItem.pos ); -- turn, so we find this item in next call as first item
      end
			theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User,SourceItem);
			User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		elseif ( not harvestProduct.isFarmingItem ) then -- no items left
			base.common.HighInformNLS(User,
			"Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
			"This plant is already fully harvested. Give it time to grow again." );
    else
      base.common.HighInformNLS( User,
      "Hier ist nichts mehr, was du mit der Sichel ernten kannst.",
      "There is nothing anymore which you can harvest with the sickle." );
		end
	end

	if base.common.GatheringToolBreaks( User, SourceItem ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Sichel zerbricht.",
		"Your old sickle breaks.");
	end
end

function GetValidProduct(TargetItem, OnlyFarming, OnlyNonFarming)
  local harvestProduct = nil;
  if (HarvestItems[TargetItem.id] == nil) then
    return harvestProduct;
  end
  -- Check for not regrown static plants.
  if (TargetItem.wear == 255 and TargetItem:getData("amount") == "0" and not IsRegrown(TargetItem)) then
    return harvestProduct;
  end
  local GroundType = base.common.GetGroundType(world:getField(TargetItem.pos):tile());
	for _,hp in pairs(HarvestItems[TargetItem.id]) do
		if (hp.groundType == nil or GroundType == hp.groundType) then
			if (((not OnlyFarming) or hp.isFarmingItem) and ((not OnlyNonFarming) or (not hp.isFarmingItem))) then
        harvestProduct = hp;
        break;
      end
		end
	end
  return harvestProduct;
end

function IsRegrown(Item)
  local serverTime = world:getTime("unix");
  for i=1,MaxAmount do
    local t = Item:getData("next_regrow_" .. i);
    if ( t ~= "" and tonumber(t) <= serverTime ) then
      -- At least one slot is regrown.
      return true;
    end
  end
  return false;
end

-- check around the user for harvest items, only top items on the field!
function GetHarvestItem(User, OnlyValidProducts, OnlyFarming, OnlyNonFarming)
  -- first check front position
  local item = base.common.GetFrontItem(User);
  if (item ~= nil and HarvestItems[item.id] ~= nil and ((item:getData("amount") ~= "0" and item:getData("amount") ~= "") or item.wear == 255)) then
    if ((not OnlyValidProducts) or (GetValidProduct(item, OnlyFarming, OnlyNonFarming) ~= nil)) then
      return item;
    end
  end
  local Radius = 1;
  for x=-Radius,Radius do
    for y=-Radius,Radius do
      local checkPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
      if (world:isItemOnField(checkPos)) then
        local item = world:getItemOnField(checkPos);
        -- harvest item has to be static or an amount has to be set
        if (item ~= nil and HarvestItems[item.id] ~= nil and ((item:getData("amount") ~= "0" and item:getData("amount") ~= "") or item.wear == 255)) then
          if ((not OnlyValidProducts) or (GetValidProduct(item, OnlyFarming, OnlyNonFarming) ~= nil)) then
            return item;
          end
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

	HarvestItems[1156] = {									-- old log
	CreateHarvestProduct(157, nil)						-- rotten tree bark
	}

	HarvestItems[1157] = {									-- old log
	CreateHarvestProduct(157, nil)  						-- rotten tree bark
	}

	HarvestItems[1158] = {									-- old log
	CreateHarvestProduct(157, nil)						-- rotten tree bark
	}

	HarvestItems[1159] = {									-- old log
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

InitHarvestItems();
