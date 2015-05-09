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

local common = require("base.common")
local gathering = require("content.gathering")

module("content.gatheringcraft.fruitgathering", package.seeall)

local function gatherFromHolyVine(user)
    local questStatus, lastSet = user:getQuestProgress(451)
    
    if questStatus == 0 or questStatus < world:getTime("day") or world:getTime("unix") - lastSet > 30000 then
    
        local datas = {nameDe = "Heilige Trauben", nameEn = "Holy Grapes", descriptionDe = "Die Weintrauben geben einen sehr angenehmen süßlichen Geruch von sich.", descriptionEn = "The grapes have a very pleasant, sweet scent."}
        
        local notCreated = user:createItem(388, 1, 333, datas)
        if notCreated > 0 then
            world:createItemFromId(388, notCreated, user.pos, true, 333, datas)
            common.HighInformNLS(user,
            "Du kannst nichts mehr halten und der Rest fällt zu Boden.",
            "You can't carry any more and the rest drops to the ground.")
        end
        
        user:inform("Du sammelst ein einzelne Rebe von dem Weinstock.","You collect a single vine from the plant.")
        user:setQuestProgress(451, world:getTime("day"))
    else
        user:inform("Jedes mal, als du eine Rebe zu greifen versuchts, greifst du daneben. So sehr du dich auch anstrengst, deine Hand geht vorbei.", "Everytime you try to get hold of a vine, you miss. No matter how hard you try, your hand seems always to be to far to the left of to the right of the vine.")
    end
end

function StartGathering(User, SourceItem, ltstate)

    if SourceItem:getData("nameEn") == "Holy Vine" then
        gatherFromHolyVine(User)
        return
    end

	InitHarvestItems();

	gathering.InitGathering();
	local fruitgathering = gathering.fruitgathering

    common.ResetInterruption( User, ltstate );
	if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
		return
	end

	if not common.CheckItem( User, SourceItem ) then -- security check
		return
	end

	-- Disabled in order to give a hungry player a chance to strengthen.
	-- if not common.FitForWork( User ) then -- check minimal food points
		-- return
	-- end
	common.TurnTo( User, SourceItem.pos ); -- turn if necessary

	-- any other checks?
	-- check if there is a harvestable item or any item at all
	local harvestItem = HarvestItems[SourceItem.id];
	if ( harvestItem == nil) then
		User:inform("[ERROR] Unknown harvest item, id: " .. SourceItem.id .. ". Please inform a developer.");
		return;
	end
	-- there is a harvestable item, but does the ground fit?
	local GroundType = common.GetGroundType(world:getField(SourceItem.pos):tile());
	local harvestProduct
	for _,hp in pairs(harvestItem) do
		if (hp.groundType == nil or GroundType == hp.groundType) then
			harvestProduct = hp;
			break;
		end
	end
	if ( harvestProduct == nil ) then
    if (IsTree[SourceItem.id] == true) then
      common.HighInformNLS( User,
      "Dieser Baum trägt keine Früchte. Vielleicht wird diese Art Baum in einem anderen Boden besser gedeihen.",
      "This tree bears no fruits. Maybe this type of tree will flourish better in another soil." );
    else
      common.HighInformNLS( User,
      "Diese Pflanze trägt keine Früchte. Vielleicht wird diese Art Pflanze in einem anderen Boden besser gedeihen.",
      "This plant bears no fruits. Maybe this type of plant will flourish better in another soil." );
    end
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
    User:changeSource(SourceItem);
	end
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
		User:talk(Character.say, "#me beginnt Früchte zu sammeln.", "#me starts to gather fruits.")
		return
	end

	-- since we're here, we're working

	if fruitgathering:FindRandomItem(User) then
		return
	end

	User:learn( fruitgathering.LeadSkill, fruitgathering.SavedWorkTime[User.id], fruitgathering.LearnLimit);
	amount = amount - 1;
	local notCreated = User:createItem( harvestProduct.productId, 1, 333, nil ); -- create the new produced items
	if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
		world:createItemFromId( harvestProduct.productId, notCreated, User.pos, true, 333, nil );
		common.HighInformNLS(User,
		"Du kannst nichts mehr halten und der Rest fällt zu Boden.",
		"You can't carry any more and the rest drops to the ground.");
	else -- character can still carry something
		if (amount>0) then  -- there are still fruits we can gather
			fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User,nil);
			User:startAction( fruitgathering.SavedWorkTime[User.id], 0, 0, 0, 0);
		end
	end
	if (amount<=0) then
    if (IsTree[SourceItem.id] == true) then
      common.HighInformNLS(User,
      "Dieser Baum ist schon komplett abgeerntet. Gib ihm Zeit um nachzuwachsen.",
      "This tree is already completely harvested. Give it time to grow again." );
    else
      common.HighInformNLS(User,
      "Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
      "This plant is already completely harvested. Give it time to grow again." );
    end
		-- reset amount
		amount = harvestProduct.maxAmount;
    SourceItem:setData("amount","" .. amount);
    world:changeItem(SourceItem);
		-- change item id
    world:swap(SourceItem, harvestProduct.nextItemId, 333);
    return;
    -- regrow according to season: currently deactivated
		-- local season = math.ceil(world:getTime("month")/4);
		-- SourceItem.wear = SourceItem.wear + harvestProduct.growCycles[season];
	end
	SourceItem:setData("amount","" .. amount);
	world:changeItem(SourceItem);
  User:changeSource(SourceItem);
end

function InitHarvestItems()
	if ( HarvestItems ~= nil ) then
		return;
	end
	HarvestItems = {};

	RegrowTime = 300;

  -- just for short writing
  local gt = common.GroundType;

  IsTree = {};
  IsTree[14] = true;
  IsTree[300] = true;
  IsTree[1195] = true;

	HarvestItems[ 14 ] = {									-- apple tree
	CreateHarvestProduct(15, nil, nil, 10, 11)					-- apple
	}
	HarvestItems[ 300 ] = {									-- cherry tree
	CreateHarvestProduct(302, nil, nil, 20, 299)				-- cherry
	}
	HarvestItems[ 1195 ] = {									-- orange tree
	CreateHarvestProduct(1207, nil, nil, 15, 1193)					-- orange
	}
	HarvestItems[ 387 ] = {									-- bush
	CreateHarvestProduct(81, gt.forest, nil, 5, 386),			-- berries
	CreateHarvestProduct(388, gt.grass, nil, 10, 386)			-- grapes
	}
	HarvestItems[ 3613 ] = {
    	CreateHarvestProduct(199, gt.sand, nil, 7, 3612),			-- tangerine
    }
end

-- for GroundType, see common.GroundType. If it doesn't matter, just set it to nil
-- GrowCycles define how fast the plants regrow in the 4 seasons. 1 cycle takes 3 minutes
function CreateHarvestProduct(ProductId, GroundType, GrowCycles, MaxAmount, NextItemId)
  local retValue = {};
  retValue.productId = ProductId;
  retValue.groundType = GroundType;
  -- NOTE: regrow according to season is currently deactivated, so growCycles is not used
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
