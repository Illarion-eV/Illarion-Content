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

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")
local gwynt = require("magic.arcane.enchanting.effects.gwynt")

local M = {}

-- for GroundType, see common.GroundType. If it doesn't matter, just set it to nil
-- GrowFactors define how fast the plants regrow in the 4 seasons
local function CreateHarvestProduct(ProductId, GroundType, GrowFactors)
    local retValue = {};
    retValue.productId = ProductId;
    retValue.groundType = GroundType;
    if (GrowFactors == nil) then
        GrowFactors = {1,1,1,1};
    end
    retValue.growFactors = GrowFactors;

    return retValue;
end

local HerbItems = {}

-- just for short writing
local gt = common.GroundType;

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

HerbItems[1178] = {                                   -- fern
    CreateHarvestProduct(140, gt.forest),                        -- donf blade
    CreateHarvestProduct(156, gt.sand),                          -- steppe fern
    CreateHarvestProduct(153, gt.grass),                         -- foot leaf
    CreateHarvestProduct(752, gt.rock)                         -- mandrake
}

HerbItems[301] = {                                   -- hedge
    CreateHarvestProduct(142, gt.sand),                          -- sandberry
    CreateHarvestProduct(136, gt.dirt)                          -- anger berry
}

HerbItems[338] = {                                   -- reed
    CreateHarvestProduct(134, gt.grass),                         -- fourleafed oneberry
    CreateHarvestProduct(155, gt.water)                         -- sibanac leaf
}

HerbItems[1177] = {                                   -- reed
    CreateHarvestProduct(134, gt.grass),                         -- fourleafed oneberry
    CreateHarvestProduct(155, gt.water)                         -- sibanac leaf
}

HerbItems[1782] = {                                   -- grass
    CreateHarvestProduct(141, gt.rocks),                         -- black thistle
    CreateHarvestProduct(145, gt.grass)                         -- heath flower
}

HerbItems[1783] = {                                   -- grass
    CreateHarvestProduct(141, gt.rocks),                         -- black thistle
    CreateHarvestProduct(145, gt.grass)                         -- heath flower
}

HerbItems[1791] = {                                   -- sunflower
    CreateHarvestProduct(133, nil)                         -- sun herb
}

-- mushrooms
HerbItems[159] = {                                    -- toadstool
    CreateHarvestProduct(159, nil)                                -- toadstool
}

HerbItems[161] = {                                    -- herder's mushroom
    CreateHarvestProduct(161, nil)                                -- herder's mushroom
}

HerbItems[421] = {                                    -- bulbsponge mushroom
    CreateHarvestProduct(158, nil)                                -- bulbsponge mushroom
}

HerbItems[158] = {                                    -- bulbsponge mushroom
    CreateHarvestProduct(158, nil)                                -- bulbsponge mushroom
}

-- helper herb
HerbItems[2169] = {                                    -- old log
    CreateHarvestProduct(157, nil)                                -- rotten tree bark
}

HerbItems[2170] = {                                    -- old log
    CreateHarvestProduct(157, nil)                              -- rotten tree bark
}

HerbItems[1156] = {                                    -- old log
    CreateHarvestProduct(157, nil)                                -- rotten tree bark
}

HerbItems[1157] = {                                    -- old log
    CreateHarvestProduct(157, nil)                              -- rotten tree bark
}

HerbItems[1158] = {                                    -- old log
    CreateHarvestProduct(157, nil)                                -- rotten tree bark
}

HerbItems[1159] = {                                    -- old log
    CreateHarvestProduct(157, nil)                              -- rotten tree bark
}

local function IsRegrown(Item)
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

local function GetValidProduct(TargetItem)

    if (HerbItems[TargetItem.id] == nil) then
        return nil;
    end

    if (TargetItem:getData("amount") == "0" and not IsRegrown(TargetItem)) then
        return nil;
    end

    local GroundType = common.GetGroundType(world:getField(TargetItem.pos):tile());
    for _,hp in pairs(HerbItems[TargetItem.id]) do
        if (hp.groundType == nil or GroundType == hp.groundType) then
            return hp
        end
    end
    return nil;
end

local function isHerbItem(Plant)
    if (Plant ~= nil and HerbItems[Plant.id] ~= nil and Plant.wear == 255) then
        return true
    end

    for _, herb in pairs(M.herbList) do
        if Plant ~= nil and (herb.id == Plant.id or Plant.id == herb.depletedId) then
            return true
        end
    end

    return false
end

local function isDepletedHerb(plant)

    for _, herb in pairs(M.herbList) do
        if herb.depletedId == plant.id then
            return true
        end
    end
end

local function getHerbItem(User, OnlyValidProducts)
    local targetItem = common.GetFrontItem(User);
    if (isHerbItem(targetItem)) then
        if ((not OnlyValidProducts) or (not isDepletedHerb(targetItem) or GetValidProduct(targetItem))) then
            return targetItem;
        end
    end

    local Radius = 1;
    for x=-Radius,Radius do
        for y=-Radius,Radius do
            local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
            if (world:isItemOnField(targetPos)) then
                targetItem = world:getItemOnField(targetPos);
                if (isHerbItem(targetItem)) then
                    if ((not OnlyValidProducts) or (not isDepletedHerb(targetItem) or GetValidProduct(targetItem))) then
                        return targetItem;
                    end
                end
            end
        end
    end
    return nil;
end

M.skill = "herblore"

M.herbList = {

    -- Berries and mushrooms

    {id = Item.blueberryBush, depletedId = Item.blueberryBushEmpty, productId = Item.blueberry, maxAmount = 20},
    {id = Item.strawberryPlant, depletedId = Item.strawberryPlantEmpty, productId = Item.strawberry, maxAmount = 20},
    {id = Item.blackberryBush, depletedId = Item.blackberryBushEmpty, productId = Item.blackberry, maxAmount = 20},
    {id = Item.elderberryBush, depletedId = Item.elderberryBushEmpty, productId = Item.redElder, maxAmount = 20},
    {id = Item.champignonCircle, depletedId = Item.champignonCircleEmpty, productId = Item.champignon, maxAmount = 20},
    {id = Item.raspberryBush, depletedId = Item.raspberryBushEmpty, productId = Item.raspberry, maxAmount = 10},
    {id = Item.birthMushroomCluster, depletedId = Item.birthMushroomClusterEmpty, productId = Item.birthMushroom, maxAmount = 10},
    {id = Item.cloudberryPlant, depletedId = Item.cloudberryPlantEmpty, productId = Item.cloudberry, maxAmount = 10},
    {id = Item.redheadCluster, depletedId = Item.redheadClusterEmpty, productId = Item.redHead, maxAmount = 5},
    {id = Item.deerberryBush, depletedId = Item.deerberryBushEmpty, productId = Item.berries, maxAmount = 5},
    {id = Item.chanterelleCluster, depletedId = Item.chanterelleClusterEmpty, productId = Item.chanterelle, maxAmount = 5},

    --Herbs

    {id = Item.firTree, depletedId = Item.prunedFirTree, productId = Item.firTreeSprout, maxAmount = 20},
    {id = Item.bloomingCeridern, depletedId = Item.ceridernTree, productId = Item.blueBirdsberry, maxAmount = 10},
    {id = Item.sunflowers, depletedId = Item.sunflowersEmpty, productId = Item.sunHerb, maxAmount = 20},
}

local herbList = M.herbList

 --This will become the StartGathering function once all herbs have distinct graphics and are moved over
local function newGathering(user, sourceItem, actionState)

    local herblore = gathering.GatheringCraft:new{LeadSkill = Character.herblore, LearnLimit = 100}
    local toolID = Item.sickle
    local maxAmount = gathering.getMaxAmountFromResourceList(herbList, sourceItem.id)
    local GFX = 21
    local resourceID = gathering.getProductId(herbList, sourceItem.id)
    local depletedResourceID = gathering.getDepletedObject(herbList, sourceItem.id)
    local restockWear = 4 -- 15 minutes

    local success, toolItem, amount, gatheringBonus = gathering.InitGathering(user, sourceItem, toolID, maxAmount, herblore.LeadSkill, depletedResourceID)

    if not success then
        return
    end

    if not gathering.isDepletableResource(user, sourceItem, herbList) then
        return
    end

    herblore:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element
    herblore:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"Unter einer Lage Blätter stößt du auf eine Schatzkarte. Hoffentlich ist der Besitzer nicht in der Nähe.","Under a layer of leaves you find a treasure map. Hopefully, the owner is not nearby!");
    herblore:AddMonster(user,271,gathering.prob_monster/gatheringBonus,"Eine Wespe steigt aus dem Gestrüpp auf, offensichtlich unerfreut über die Störung.","A pesky wasp rises from the bushes apparently displeased with your disturbance.",4,7);
    herblore:AddRandomItem(2183,1,333,{},gathering.prob_rarely,"Ein alter Krug liegt verlassen und einsam im Gebüsch.","An old mug lies abandoned and lonesome in the bushes."); --Mug
    herblore:AddRandomItem(799,1,333,{},gathering.prob_occasionally,"Ein Weidenkorb liegt am Boden. Er scheint noch brauchbar zu sein.","A wicker basket lies on the ground. It still seems to be usable."); --Basket
    herblore:AddRandomItem(2570,1,333,{},gathering.prob_frequently,"Ein Griff einer alten Sichel liegt achtlos weggeworfen zwischen Ästen und Blättern herum.","A handle of an old sickle lies between the leaves and branches, but the blade is no where in sight."); --Sickle hilt


    --Case 1: Interrupted
    if ( actionState == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    common.TurnTo( user, sourceItem.pos ) -- turn if necessary

    --Case 2: Initialise action
    if ( actionState == Action.none ) then -- currently not working -> let's go
        herblore.SavedWorkTime[user.id] = herblore:GenWorkTime(user)
        user:startAction( herblore.SavedWorkTime[user.id], GFX, herblore.SavedWorkTime[user.id], 0, 0)
        return
    end

    --Case 3: Action executed

    user:learn( herblore.LeadSkill, herblore.SavedWorkTime[user.id], herblore.LearnLimit)

    herblore:FindRandomItem(user, toolItem)

    local created, newAmount = gathering.FindResource(user, sourceItem, amount, resourceID, herblore.LeadSkill, toolItem) -- create the new produced items


    if created then

        local nextItem = getHerbItem(user, true)
        if (newAmount > 0 or nextItem) and not shared.toolBreaks( user, toolItem, herblore:GenWorkTime(user)) then  -- there are still items we can work on

            if amount < 1 then
                common.TurnTo( user, nextItem.pos )
                sourceItem = nextItem
            end

            herblore.SavedWorkTime[user.id] = herblore:GenWorkTime(user)
            user:changeSource(sourceItem)

            user:startAction( herblore.SavedWorkTime[user.id], GFX, herblore.SavedWorkTime[user.id], 0, 0)
        else
            common.TempInformNLS( user,
            "Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
            "This plant is already completely harvested. Give it time to grow again." );
        end
    end

    if newAmount and newAmount <= 0 then
        gathering.SwapSource(sourceItem, depletedResourceID, restockWear)
        return
    end
end


local function isInNewList(sourceItem)

    for _, herb in pairs(herbList) do
        if herb.id == sourceItem.id or herb.depletedId == sourceItem.id then
            return true
        end
    end

    return false

end

function M.StartGathering(User, SourceItem, ltstate)

    if isInNewList(SourceItem) then --temporary until all herbs are reworked
        newGathering(User, SourceItem, ltstate)
        return
    end

    local toolItem=shared.getTool(User, 126) --sickle (126)

    if not toolItem then
        return
    end

    local gatheringBonus=shared.getGatheringBonus(User, toolItem, Character.herblore)

    local theCraft = gathering.GatheringCraft:new{LeadSkill = Character.herblore, LearnLimit = 100}; -- id_126_sickle
    theCraft:AddRandomPureElement(User,gathering.prob_element*gatheringBonus); -- Any pure element
    theCraft:SetTreasureMap(User,gathering.prob_map*gatheringBonus,"Unter einer Lage Blätter stößt du auf eine Schatzkarte. Hoffentlich ist der Besitzer nicht in der Nähe.","Under a layer of leaves you find a treasure map. Hopefully, the owner is not nearby!");
    theCraft:AddMonster(User,271,gathering.prob_monster/gatheringBonus,"Eine Wespe steigt aus dem Gestrüpp auf, offensichtlich unerfreut über die Störung.","A pesky wasp rises from the bushes apparently displeased with your disturbance.",4,7);
    theCraft:AddRandomItem(2183,1,333,{},gathering.prob_rarely,"Ein alter Krug liegt verlassen und einsam im Gebüsch.","An old mug lies abandoned and lonesome in the bushes."); --Mug
    theCraft:AddRandomItem(799,1,333,{},gathering.prob_occasionally,"Ein Weidenkorb liegt am Boden. Er scheint noch brauchbar zu sein.","A wicker basket lies on the ground. It still seems to be usable."); --Basket
    theCraft:AddRandomItem(2570,1,333,{},gathering.prob_frequently,"Ein Griff einer alten Sichel liegt achtlos weggeworfen zwischen Ästen und Blättern herum.","A handle of an old sickle lies between the leaves and branches, but the blade is no where in sight."); --Sickle hilt

    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

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
            common.TempInformNLS( User,
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
        common.TempInformNLS( User,
        "Diese Pflanze trägt nichts Nützliches, das du mit deiner Sichel schneiden kannst. Vielleicht wird diese Art Pflanze in einem anderen Boden besser gedeihen.",
        "This plant yields nothing useful which you can cut with your sickle. Maybe this type of plant will flourish better in another soil." );
        return;
    end

    -- currently not working -> let's go
    if ( ltstate == Action.none ) then
        theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User);
        User:startAction( theCraft.SavedWorkTime[User.id], 21, theCraft.SavedWorkTime[User.id], 0, 0)
        return;
    end

    -- since we're here, we're working

    theCraft:FindRandomItem(User, toolItem)

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

    -- temp glyph effect until herbgathering is streamlined like other gathering skills
    local productAmount = 1

    if gwynt.includeExtraResource(User, 0) then
        productAmount = 2
    end
    -- end of glyph
    local data = gathering.rollsAsRare(User, theCraft.LeadSkill, toolItem)
    local created = common.CreateItem(User, harvestProduct.productId, productAmount, 333, data) -- create the new produced items
    if created then -- character can still carry something
        -- try to find a next item of the same farming type
        local nextItem = getHerbItem(User, true);
        if ( amount > 0 or nextItem~=nil) then  -- there are still items we can work on
            if (amount < 1) then
                common.TurnTo( User, nextItem.pos ); -- turn, so we find this item in next call as first item
                SourceItem = nextItem;
            end
            theCraft.SavedWorkTime[User.id] = theCraft:GenWorkTime(User);
            User:changeSource(SourceItem);
            if not shared.toolBreaks( User, toolItem, theCraft:GenWorkTime(User) ) then -- damage and possibly break the tool
                User:startAction( theCraft.SavedWorkTime[User.id], 21, theCraft.SavedWorkTime[User.id], 0, 0)
            end
        else
            common.TempInformNLS( User,
            "Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
            "This plant is already completely harvested. Give it time to grow again." );
        end
    end
end

--used by item.tree
M.isHerbItem = isHerbItem
M.GetValidProduct = GetValidProduct

--used by item.id_126_sickle
M.getHerbItem = getHerbItem

return M
