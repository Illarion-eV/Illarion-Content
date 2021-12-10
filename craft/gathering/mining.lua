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

-- rocks

-- additional tool: pickaxe ( 2763 )

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")
local locations = require("craft.base.resourceLocations")

local M = {}
--[[add ores to item database sql:
UPDATE items SET itm_script='item.rock' WHERE itm_id IN(1234,1235,1236,1237,1238,1239);
UPDATE items SET itm_objectafterrot='1239', itm_agingspeed='4' WHERE itm_id IN(3719);
UPDATE items SET itm_objectafterrot='1237', itm_agingspeed='4' WHERE itm_id IN(3717);
UPDATE items SET itm_objectafterrot='1238', itm_agingspeed='4' WHERE itm_id IN(3718);
UPDATE items SET itm_objectafterrot='1235', itm_agingspeed='4' WHERE itm_id IN(3579);
UPDATE items SET itm_objectafterrot='1236', itm_agingspeed='4'WHERE itm_id IN(3580);
UPDATE items SET itm_objectafterrot='1234', itm_agingspeed='4'WHERE itm_id IN(3578);
]]

local oreList = {
{veinId = 1246, depletedId = 915, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 1245, depletedId = 1254, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 232, depletedId = 233, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 914, depletedId = 1265, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 1273, depletedId = 1257, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 1276, depletedId = 1278, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 1250, depletedId = 1251, productId = 735, maxAmount = 20, levelReq = 0},
{veinId = 1234, depletedId = 3578, productId = 21, maxAmount = 20, levelReq = 10},
{veinId = 1236, depletedId = 3580, productId = 22, maxAmount = 10, levelReq = 20},
{veinId = 1235, depletedId = 3579, productId = 2536, maxAmount = 10, levelReq = 30},
{veinId = 1238, depletedId = 3718, productId = 1062, maxAmount = 10, levelReq = 40},
{veinId = 1237, depletedId = 3717, productId = 234, maxAmount = 10, levelReq = 60},
{veinId = 1239, depletedId = 3719, productId = 2534, maxAmount = 3, levelReq = 80}
}

local gemList = {
{id = 251, level = 10, chance = 4},
{id = 255, level = 20, chance = 2},
{id = 252, level = 30, chance = 1.33},
{id = 253, level = 40, chance = 1},
{id = 256, level = 50, chance = 0.8},
{id = 257, level = 70, chance = 0.57},
{id = 254, level = 90, chance = 0.44}
}




local function checkIfGemMine(orePosition)
    for _, location in pairs(locations.mines) do
        if location.coordinates == orePosition then
            return location.gemMine
        end
    end
end

local function getResource(stoneId)
    for _, ore in pairs(oreList) do
        if ore.veinId == stoneId then
            return ore.productId
        end
    end
end

local function getAmount(stoneId)
    for _, ore in pairs(oreList) do
        if ore.veinId == stoneId then
            return ore.maxAmount
        end
    end
end

local function getDepletedObject(stoneId)
    for _, ore in pairs(oreList) do
        if ore.veinId == stoneId then
            return ore.depletedId
        end
    end
end

local function passesLevelReq(user, stoneId)
    local miningLevel = user:getSkill(Character.mining)
    local levelReq
    for _, ore in pairs(oreList) do
        if ore.veinId == stoneId then
            levelReq = ore.levelReq
            if levelReq <= miningLevel then
                return true
            end
        end
    end
    user:inform(common.GetNLS(user,"Du musst Level "..levelReq.." in Bergbau haben, um hier arbeiten zu können.","You must be level "..levelReq.." in mining to mine here."))
return false
end

local function reduceAmount(user, sourceItem)
    local maxAmount = getAmount(sourceItem.id)
    local amountLeft = sourceItem:getData("amount")
    sourceItem:setData("amount", tonumber(amountLeft)-1)
    world:changeItem(sourceItem)
    if tonumber(sourceItem:getData("amount")) == 0 then
        local depletedObject = getDepletedObject(sourceItem.id)
        world:erase(sourceItem, sourceItem.number)
        local newItem = world:createItemFromId(depletedObject, 1, sourceItem.pos, true, 333, nil);
        newItem:setData("amount", maxAmount)
    end
end

local function gotGem(user, sourceItem)
    local gemMine = checkIfGemMine(sourceItem.pos)
    local rand = math.random(1,10000);
    local cumulatedChance = 0
    local miningLevel = user:getSkill(Character.mining)
    for _, gems in pairs(gemList) do
        local gem = gems.id
        if miningLevel >= gems.level then
            local chance = gems.chance
                if gemMine then
                    chance = chance*2
                end
            cumulatedChance = cumulatedChance + chance
            if rand <= cumulatedChance*100 then --since math.random doesn't do decimals, multiply by 100 and random out of 10000
                common.CreateItem(user, gem, 1, 333, nil)
                reduceAmount(user, sourceItem)
                return true
            end
        end
    end
return false
end

local function isMinableRock(user, sourceItem)
    local correctRock
    local correctPosition
    if not sourceItem then
        return false
    end
    for _, rock in pairs(oreList) do
        if sourceItem.id == rock.veinId then
            correctRock = true
        end
    end
    for _, location in pairs(locations.mines) do
        if tostring(sourceItem.pos) == location.coordinates then
            correctPosition = true
        end
    end
    if correctRock and correctPosition then
        return true
    else
        return false
    end
end

function M.getRock(user)
    local targetItem = common.GetFrontItem(user);
    if isMinableRock(user, targetItem) then
        return targetItem;
    end
    local radius = 1;
    for x=-radius,radius do
        for y=-radius,radius do
            local targetPos = position(user.pos.x + x, user.pos.y + y, user.pos.z);
            if (world:isItemOnField(targetPos)) then
                targetItem = world:getItemOnField(targetPos);
                if isMinableRock(user, targetItem) then
                    return targetItem;
                end
            end
        end
    end
    return nil;
end

local function isPrison(positionOfItem)
    for _, location in pairs(locations.mines) do
        if location.coordinate == positionOfItem then
            if location.prisonMine then
                return true
            end
        end
    end
return false
end

function M.StartGathering(user, sourceItem, ltstate)

    local toolItem=shared.getTool(user, 2763) --pick-axe (2763)

    if not toolItem then
        return
    end

    if not isMinableRock(user, sourceItem) then
        return
    end

    if not passesLevelReq(user, sourceItem.id) then
        return
    end

    local gatheringBonus=shared.getGatheringBonus(user, toolItem)

    local mining = gathering.GatheringCraft:new{LeadSkill = Character.mining, LearnLimit = 100}; -- id_2763_pickaxe
    if not isPrison(sourceItem.pos) then --Prisoners don't get rewards
        mining:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element
        mining:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"In einer engen Felsspalte findest du ein altes Pergament, das wie eine Karte aussieht. Kein Versteck ist so sicher, dass es nicht gefunden wird.","In a narrow crevice you find an old parchment that looks like a map. No hiding place is too safe that it cannot be found.");
        mining:AddMonster(user,1052,gathering.prob_monster/gatheringBonus,"Als du den Fels malträtierst, läuft etwas Schleim aus einer Felsspalte...","As you slam your pick-axe on the rock, some slime flows out of the fissure...",4,7);
        mining:AddRandomItem(310,1,333,{},gathering.prob_rarely,"Zwerge scheinen alten Krügen keine Beachtung beizumessen, insbesondere, wenn sie leer sind. Auch hier liegt einfach einer herum.","Dwarves seem to pay no attention to old pitchers, especially if they are empty. As you work one catches your eye."); --mug with lid
        mining:AddRandomItem(2183,1,333,{},gathering.prob_occasionally,"Diese Mine wurde offensichtlich kürzlich von Zwergen aufgesucht. Wie sonst erklärt sich der Krug, den du zwischen dem Geröll findest?","This mine was occupied recently. How else would you explain the mug at your feet?"); --clay mug
        mining:AddRandomItem(391,1,333,{},gathering.prob_frequently,"In einer Felsspalte liegt eine alte Fackel. Hier ist wohl jemanden ein Licht aufgegangen.","In a crevice you spot an old torch."); --torch
    end
    common.ResetInterruption( user, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        return
    end

    if not common.CheckItem( user, sourceItem ) then -- security check
        return
    end

    if not common.FitForWork( user ) then -- check minimal food points
        return
    end

    common.TurnTo( user, sourceItem.pos ); -- turn if necessary

    -- user feedback per nice animation
    user:performAnimation(14)

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        mining.SavedWorkTime[user.id] = mining:GenWorkTime(user);
        user:startAction( mining.SavedWorkTime[user.id], 0, 0, 18, 15);
        return
    end

    -- since we're here, we're working
    if mining:FindRandomItem(user) then
        return
    end

    local productId = getResource(sourceItem.id);
    local maxAmount = getAmount(sourceItem.id)

    user:learn( mining.LeadSkill, mining.SavedWorkTime[user.id], mining.LearnLimit);
    local amount = 1; -- set the amount of items that are produced
    local created
    if not isPrison(sourceItem.pos) then
        created = gotGem(user, sourceItem)
    end
    local amountLeft = sourceItem:getData("amount")
    if not amountLeft or amountLeft == "" then
        sourceItem:setData("amount", maxAmount)
        world:changeItem(sourceItem)
        amountLeft = sourceItem:getData("amount")
    end
    if not created then
        created = common.CreateItem(user, productId, amount, 333, nil) -- create the new produced items
        reduceAmount(user, sourceItem)
    end

    if created then
        if tonumber(amountLeft) > 0 then  -- there are still items we can work on
            mining.SavedWorkTime[user.id] = mining:GenWorkTime(user);
            user:changeSource(sourceItem);
            if not shared.toolBreaks( user, toolItem, mining:GenWorkTime(user) ) then -- damage and possibly break the tool
                user:startAction( mining.SavedWorkTime[user.id], 0, 0, 18, 15);
            end
        else -- no items left (as the rock is still okay, this should never happen... handle it anyway)
            common.HighInformNLS(user,
            "Hier gibt es keine Steine mehr, an denen du arbeiten kannst.",
            "There are no stones for mining anymore.");
        end
    end
end

return M
