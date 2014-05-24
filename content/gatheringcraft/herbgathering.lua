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

-- plants and various trees

-- additional tool: sickle ( 126 )

require("base.common")
require("content.gathering")

module("content.gatheringcraft.herbgathering", package.seeall)

function StartGathering(User, SourceItem, ltstate)

	content.gathering.InitGathering();
	local theCraft = content.gathering.herbgathering;

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

	-- additional tool item is needed
	if (User:countItemAt("all",126)==0) then
		base.common.HighInformNLS( User,
		"Du brauchst eine Sichel um zu ernten.",
		"You need a sickle for harvesting." );
		return
	end
	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~=126 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 126 ) then
			base.common.HighInformNLS( User,
			"Du musst die Sichel in der Hand haben!",
			"You have to hold the sickle in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	base.common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- check the amount
	local MaxAmount = 10;
	local RegrowTime = 300;
	local changeItem = false;
	local amountStr = SourceItem:getData("amount");
	local amount = 0;
	if ( amountStr ~= "" ) then
		amount = tonumber(amountStr);
	elseif (SourceItem.wear == 255 ) then
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
			"Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
			"This plant is already completely harvested. Give it time to grow again." );
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

	if ( changeItem ) then
		world:changeItem(SourceItem);
	end

	-- there is a harvestable item, but does the ground fit?
	local harvestProduct = GetValidProduct(SourceItem);
	if ( harvestProduct == nil ) then
		base.common.HighInformNLS( User,
		"Diese Pflanze trägt nichts Nützliches, das du mit deiner Sichel schneiden kannst. Vielleicht wird diese Art Pflanze in einem anderen Boden besser gedeihen.",
		"This plant yields nothing useful which you can cut with your sickle. Maybe this type of plant will flourish better in another soil." );
		return;
	end

	-- currently not working -> let's go
	if ( ltstate == Action.none ) then
		theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User, toolItem);
		User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		User:talk(Character.say, "#me beginnt mit der Sichel Kräuter zu schneiden.", "#me starts to cut herbs with the sickle.")
		return;
	end

	-- since we're here, we're working

	if theCraft:FindRandomItem(User) then
		return
	end

	-- update the amount
	amount = amount - 1;
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
			SourceItem:setData("next_regrow_" .. i, "" .. world:getTime("unix") + math.floor(RegrowTime*harvestProduct.growFactors[season]));
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
	User:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[User.id], theCraft.LearnLimit);
	local notCreated = User:createItem( harvestProduct.productId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( harvestProduct.productId, notCreated, User.pos, true, 333, nil );
		base.common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		-- try to find a next item of the same farming type
		local nextItem = getHerbItem(User, true);
		if ( amount > 0 or nextItem~=nil) then  -- there are still items we can work on
			if (amount < 1) then
				base.common.TurnTo( User, nextItem.pos ); -- turn, so we find this item in next call as first item
				SourceItem = nextItem;
			end
			theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User, toolItem);
			User:changeSource(SourceItem);
			User:startAction( theCraft.SavedWorkTime[User.id], 0, 0, 0, 0);
		else
			base.common.HighInformNLS( User,
			"Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
			"This plant is already completely harvested. Give it time to grow again." );
		end
	end

	if base.common.GatheringToolBreaks( User, toolItem, theCraft:GenWorkTime(User, toolItem) ) then -- damage and possibly break the tool
		base.common.HighInformNLS(User,
		"Deine alte Sichel zerbricht.",
		"Your old sickle breaks.");
		return
	end

end

function IsRegrown(Item)
	local serverTime = world:getTime("unix");
	for i=1,10 do
		local t = Item:getData("next_regrow_" .. i);
		if ( t ~= "" and tonumber(t) <= serverTime ) then
			-- At least one slot is regrown.
			return true;
		end
	end
	return false;
end

function GetValidProduct(TargetItem)

	if (HerbItems[TargetItem.id] == nil) then
		return nil;
	end

	if (TargetItem:getData("amount") == "0" and not IsRegrown(TargetItem)) then
		return nil;
	end

	local GroundType = base.common.GetGroundType(world:getField(TargetItem.pos):tile());
	for _,hp in pairs(HerbItems[TargetItem.id]) do
		if (hp.groundType == nil or GroundType == hp.groundType) then
			return hp
		end
	end
	return nil;
end

-- for GroundType, see base.common.GroundType. If it doesn't matter, just set it to nil
-- GrowFactors define how fast the plants regrow in the 4 seasons
function CreateHarvestProduct(ProductId, GroundType, GrowFactors)
    local retValue = {};
    retValue.productId = ProductId;
    retValue.groundType = GroundType;
    if (GrowFactors == nil) then
        GrowFactors = {1,1,1,1};
    end
    retValue.growFactors = GrowFactors;

    return retValue;
end

function isHerbItem(Plant)
	InitHerbItems();

	if (Plant ~= nil and HerbItems[Plant.id] ~= nil and Plant.wear == 255) then
		return true;
	end
	return false;
end

function getHerbItem(User, OnlyValidProducts)

	local targetItem = base.common.GetFrontItem(User);
	if (isHerbItem(targetItem)) then
		if ((not OnlyValidProducts) or (GetValidProduct(targetItem) ~= nil)) then
			return targetItem;
		end
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (isHerbItem(targetItem)) then
					if ((not OnlyValidProducts) or (GetValidProduct(targetItem) ~= nil)) then
						return targetItem;
					end
				end
			end
		end
	end
	return nil;
end

function InitHerbItems()

	if HerbItems ~= nil then
		return
	end

	HerbItems = {};

    -- just for short writing
    local gt = base.common.GroundType;

	-- herbs marked with TODO probably have the wrong name in the database. Correct names in German are given in the old list below
    -- druid herbs
    HerbItems[273] = {                                   -- flower
    CreateHarvestProduct(144, gt.rocks),                         -- virgins weed
    CreateHarvestProduct(137, gt.sand),                          -- flamegoblet blossom
    CreateHarvestProduct(135, gt.grass),                         -- yellow weed
    CreateHarvestProduct(148, gt.forest),                        -- firnis blossom
    CreateHarvestProduct(763, gt.dirt),                          -- mash flower
    CreateHarvestProduct(767, gt.water)                          -- water blossom
	}

    HerbItems[274] = {                                   -- fern
    CreateHarvestProduct(140, gt.forest),                        -- donf blade
    CreateHarvestProduct(156, gt.sand),                          -- steppe fern
    CreateHarvestProduct(153, gt.grass),                         -- foot leaf
    CreateHarvestProduct(752, gt.rock)                         -- mandrake
	}

    HerbItems[301] = {                                   -- hedge
    CreateHarvestProduct(147, gt.forest),                        -- blackberry
    CreateHarvestProduct(142, gt.sand),                          -- sandberry
    CreateHarvestProduct(143, gt.grass),                         -- red elder
    CreateHarvestProduct(136, gt.dirt)                          -- anger berry
    }

    HerbItems[338] = {                                   -- reed
    CreateHarvestProduct(134, gt.grass),                         -- fourleafed oneberry
    CreateHarvestProduct(155, gt.water)                         -- sibanac leaf
    }

    HerbItems[1782] = {                                   -- grass
    CreateHarvestProduct(151, gt.forest),                        -- strawberry
    CreateHarvestProduct(141, gt.rocks),                         -- black thistle
    CreateHarvestProduct(145, gt.grass)                         -- heath flower
    }

    HerbItems[1783] = {                                   -- grass
    CreateHarvestProduct(151, gt.forest),                        -- strawberry
    CreateHarvestProduct(141, gt.rocks),                         -- black thistle
    CreateHarvestProduct(145, gt.grass)                         -- heath flower
    }

    HerbItems[1791] = {                                   -- sunflower
    CreateHarvestProduct(133, nil)                         -- sun herb
    }

    HerbItems[1807] = {                                   -- blooming ceridern
    CreateHarvestProduct(753, nil)                             -- blue bird's berry
    }

    -- mushrooms
	HerbItems[159] = {									-- toadstool
    CreateHarvestProduct(159, nil)								-- toadstool
    }

	HerbItems[160] = {									-- red head
    CreateHarvestProduct(160, nil)								-- red head
    }

	HerbItems[161] = {									-- herder's mushroom
    CreateHarvestProduct(161, nil)								-- herder's mushroom
    }

	HerbItems[162] = {									-- birth mushroom
    CreateHarvestProduct(162, nil)								-- birth mushroom
    }

	HerbItems[421] = {									-- bulbsponge mushroom
    CreateHarvestProduct(158, nil)								-- bulbsponge mushroom
    }

	HerbItems[158] = {									-- bulbsponge mushroom
    CreateHarvestProduct(158, nil)								-- bulbsponge mushroom
    }

	HerbItems[1790] = {									-- mushroom circle
    CreateHarvestProduct(163, nil)								-- champignon
    }

    -- helper herb
	HerbItems[2169] = {									-- old log
	CreateHarvestProduct(157, nil)								-- rotten tree bark
	}

	HerbItems[2170] = {									-- old log
	CreateHarvestProduct(157, nil)  							-- rotten tree bark
	}

	HerbItems[1156] = {									-- old log
	CreateHarvestProduct(157, nil)								-- rotten tree bark
	}

	HerbItems[1157] = {									-- old log
	CreateHarvestProduct(157, nil)  							-- rotten tree bark
	}

	HerbItems[1158] = {									-- old log
	CreateHarvestProduct(157, nil)								-- rotten tree bark
	}

	HerbItems[1159] = {									-- old log
	CreateHarvestProduct(157, nil)  							-- rotten tree bark
	}


	-- anything else
	HerbItems[308] = {									-- fir tree
    CreateHarvestProduct(149, nil)								-- fir tree sprout
    }
	HerbItems[1812] = {									-- palm tree
    CreateHarvestProduct(80, gt.sand)							-- banana
    }
	HerbItems[1813] = {									-- palm tree
    CreateHarvestProduct(80, gt.sand)							-- banana
    }

	HerbItems[ 1809 ] = {								-- eldan oak
	CreateHarvestProduct(759, nil, {0.5,0.5,0.5,0.5})			-- nuts (was actually in harvest.lua with 20 MaxAmount, so just let it regrow twice as fast)
	}
end
