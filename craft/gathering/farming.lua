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

-- grops and seeds (grain is handled elsewhere)

-- additional tool: sickle ( 126 )

local common = require("base.common")
local shared = require("craft.base.shared")
local gathering = require("craft.base.gathering")
local gwynt = require("magic.arcane.enchanting.effects.gwynt")

local M = {}

local function getLevel(itemId)

    local itemCommon = world:getItemStatsFromId(itemId)

    return itemCommon.Level
end

M.skill = "farming"

local crops = {

    -- Vegetables

    {id = 248, produce = Item.bundleOfGrain, level = getLevel(248), tool = Item.scythe},
    {id = 540, produce = Item.tomato, level = getLevel(540), tool = Item.sickle},
    {id = 4333, produce = Item.cucumber, level = getLevel(4333), tool = Item.sickle},
    {id = 4828, produce = Item.lettuce, level = getLevel(4828), tool = Item.sickle},
    {id = 731, produce = Item.hop, level = getLevel(731), tool = Item.sickle},
    {id = 537, produce = Item.onion, level = getLevel(537), tool = Item.sickle},
    {id = 2492, produce = Item.carrots, level = getLevel(2492), tool = Item.sickle},
    {id = 3565, produce = Item.potato, level = getLevel(3565), tool = Item.sickle},
    {id = 3890, produce = Item.cabbage, level = getLevel(3890), tool = Item.sickle},
    {id = 4336, produce = Item.corn, level = getLevel(4336), tool = Item.scythe},
    {id = 782, produce = Item.sugarcane, level = getLevel(782), tool = Item.scythe},
    {id = 777, produce = Item.tobacco, level = getLevel(777), tool = Item.sickle},
    {id = 4330, produce = Item.bellpepper, level = getLevel(4336), tool = Item.sickle},
    {id = 4833, produce = Item.pumpkin, level = getLevel(4336), tool = Item.sickle},

    -- Seeds

    {id = Item.tomatoSeeds, produce = Item.tomatoSeeds, level = getLevel(Item.tomatoSeeds), tool = Item.sickle, seed = true},
    {id = Item.cucumberSeeds, produce = Item.cucumberSeeds, level = getLevel(Item.cucumberSeeds), tool = Item.sickle, seed = true},
    {id = Item.lettuceSeeds, produce = Item.lettuceSeeds, level = getLevel(Item.lettuceSeeds), tool = Item.sickle, seed = true},
    {id = 732, produce = Item.hopSeeds, level = getLevel(732), tool = Item.sickle, seed = true},
    {id = Item.onionSeeds, produce = Item.onionSeeds, level = getLevel(Item.onionSeeds), tool = Item.sickle, seed = true},
    {id = Item.carrotSeeds, produce = Item.carrotSeeds, level = getLevel(Item.carrotSeeds), tool = Item.sickle, seed = true},
    {id = Item.potatoSeeds, produce = Item.potatoSeeds, level = getLevel(Item.potatoSeeds), tool = Item.sickle, seed = true},
    {id = Item.witheredCabbage, produce = Item.witheredCabbage, level = getLevel(Item.witheredCabbage), tool = Item.sickle, seed = true},
    {id = Item.cornSeeds, produce = Item.cornSeeds, level = getLevel(Item.cornSeeds), tool = Item.sickle, seed = true},
    {id = Item.sugarcaneSeeds, produce = Item.sugarcaneSeeds, level = getLevel(Item.sugarcaneSeeds), tool = Item.sickle, seed = true},
    {id = Item.tobaccoSeeds, produce = Item.tobaccoSeeds, level = getLevel(Item.tobaccoSeeds), tool = Item.sickle, seed = true},
    {id = Item.bellpepperSeeds, produce = Item.bellpepperSeeds, level = getLevel(Item.bellpepperSeeds), tool = Item.sickle, seed = true},
    {id = Item.pumpkinSeeds, produce = Item.pumpkinSeeds, level = getLevel(Item.pumpkinSeeds), tool = Item.sickle, seed = true}
}

M.crops = crops

local function isFarmingItem(plant)

    if not plant or plant.wear == 255 then
        return false
    end

    for _, crop in pairs(crops) do
        if plant.id == crop.id then
            return true
        end
    end

    return false
end

local function getFarmingItem(user)

    local targetItem = common.GetFrontItem(user)

    if isFarmingItem(targetItem) then
        return targetItem
    end

    local radius = 1

    for x = -radius, radius do
        for y = -radius, radius do
            local targetPos = position(user.pos.x + x, user.pos.y + y, user.pos.z)

            if world:isItemOnField(targetPos) then

                targetItem = world:getItemOnField(targetPos)

                if isFarmingItem(targetItem) then
                    return targetItem
                end
            end
        end
    end
    return nil
end

local function getToolId(theCrop)

    for _, crop in pairs(crops) do
        if theCrop.id == crop.id then
            return crop.tool
        end
    end
end

local function getProductId(theCrop)

    for _, crop in pairs(crops) do
        if theCrop.id == crop.id then
            return crop.produce
        end
    end
end

local function isSeed(theCrop)

    for _, crop in pairs(crops) do
        if theCrop.id == crop.id then
            return crop.seed
        end
    end
end


local function passesLevelReq(user, theCrop)

    local farmingLevel = user:getSkill(Character.farming)

    local level = getLevel(theCrop.id)

    if farmingLevel < level then
        user:inform("Dein Landwirtschaftslevel ist nicht hoch genug, um das zu ernten." , "Your level of farming is not high enough to harvest this.")
        return false
    end

    return true
end

function M.StartGathering(user, theCrop, actionState)

    local toolId = getToolId(theCrop)

    if not toolId then
        return
    end

    local toolItem = shared.getTool(user, toolId)

    if not toolItem then
        return
    end

    local gatheringBonus = shared.getGatheringBonus(user, toolItem, Character.farming)

    local itemCommon = world:getItemStatsFromId(theCrop.id)

    local level = itemCommon.Level

    local theCraft = gathering.GatheringCraft:new{LeadSkill = Character.farming, LearnLimit = level+20}
    theCraft:AddRandomPureElement(user,gathering.prob_element*gatheringBonus); -- Any pure element
    theCraft:SetTreasureMap(user,gathering.prob_map*gatheringBonus,"In einer Ackerfurche findest du ein altes Pergament mit einem Kreuz darauf. Ob sie dich zu einem vergrabenen Schatz weisen wird?","In a furrow you find an old parchment with a cross on it. Will it show you the way to a buried treasure?");
    theCraft:AddMonster(user,114,gathering.prob_monster/gatheringBonus,"Du stößt bei der Erdarbeit auf alte Knochen. Leider hat sie kein Hund hier vergraben und die Störung der Totenruhe bleibt nicht ungesühnt.","While ploughing, you find some old bones. Unfortunately, no dog has buried them here, and the disturbance of the dead unleashes Cherga's wrath.",4,7);
    theCraft:AddRandomItem(1840,1,333,{},gathering.prob_rarely,"Im Ackerboden ist ein angelaufender Kupferkelch zu finden.","In the arable soil you find a tarnished copper goblet."); --copper goblet
    theCraft:AddRandomItem(2935,1,333,{},gathering.prob_occasionally,"Da hat wohl jemand eine Schüssel verloren, mit der er Saatgut augestreut hat.","Someone lost an old bowl for sowing here."); --soup bowl
    theCraft:AddRandomItem(51,1,333,{},gathering.prob_frequently,"Da hat wohl jemand einen Eimer verloren. Nun gehört er dir.","You dig up an old bucket. Now it belongs to you."); --bucket

    common.ResetInterruption(user, actionState)
    if actionState == Action.abort then -- work interrupted
        return
    end

    if not common.CheckItem(user, theCrop) then -- security check
        return
    end

    if not common.FitForWork(user) then -- check minimal food points
        return
    end

    if not passesLevelReq(user, theCrop) then
        return
    end

    common.TurnTo(user, theCrop.pos ) -- turn if necessary

    -- check the amount
    local amountStr = theCrop:getData("amount")
    local amount = 0
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr)
    end

    if isSeed(theCrop) and theCrop:getData("seedBonusApplied") ~= "true" then --Ensure you always get more seeds than you planted
        amount = amount + 1
        theCrop:setData("seedBonusApplied", "true")
        world:changeItem(theCrop)
    end


    if ( amount == 0 ) then
        -- this is a farming item, it can't regrow
        common.TempInformNLS( user,
        "Hier kannst du nichts ernten.",
        "There is nothing you can harvest." )
        return
    end

    local GFX = 21

    -- currently not working -> let's go
    if ( actionState == Action.none ) then
        theCraft.SavedWorkTime[user.id] = theCraft:GenWorkTime(user)
        user:startAction( theCraft.SavedWorkTime[user.id], GFX, theCraft.SavedWorkTime[user.id], 0, 0)
        return;
    end

    -- since we're here, we're working

    theCraft:FindRandomItem(user, toolItem)

    amount = amount - 1

    if ( amount == 0 ) then
        -- nothing left, remove the farming item
        world:erase(theCrop, theCrop.number)
    else
        -- just update the amount
        theCrop:setData("amount", tostring(amount))
        world:changeItem(theCrop)
    end

    -- since we're here, everything should be alright
    user:learn( theCraft.LeadSkill, theCraft.SavedWorkTime[user.id], theCraft.LearnLimit)

    local productAmount = 1

    -- temp glyph effect until farming is streamlined like other gathering skills
    if gwynt.includeExtraResource(user, 0) then
        productAmount = 2
    end
    -- end of glyph

    local productId = getProductId(theCrop)

    if not productId then
        return
    end

    local created = common.CreateItem(user, productId, productAmount, 333, nil) -- create the new produced items

    if created then -- character can still carry something
        -- try to find a next item of the same farming type
        local nextItem = getFarmingItem(user)
        if ( amount > 0 or nextItem~=nil) then  -- there are still items we can work on
            if (amount < 1) then
                common.TurnTo( user, nextItem.pos ) -- turn, so we find this item in next call as first item
                theCrop = nextItem

                if not passesLevelReq(user, theCrop) then
                    return
                end

                toolId = getToolId(theCrop)

                if not toolId then
                    return
                end

                local newToolItem = shared.getTool(user, toolId)

                if not newToolItem then
                    return
                end

                if toolItem ~= newToolItem then
                    --We start again, to redo checks and gatheringbonuses
                    M.StartGathering(user, theCrop, actionState)
                    return
                end
            end
            theCraft.SavedWorkTime[user.id] = theCraft:GenWorkTime(user);
            user:changeSource(theCrop)
            if not shared.toolBreaks( user, toolItem, theCraft:GenWorkTime(user) ) then -- damage and possibly break the tool
                user:startAction( theCraft.SavedWorkTime[user.id], 0, 0, 0, 0)
            end
        else
            common.TempInformNLS( user,
            "Hier ist nichts mehr, was du ernten kannst.",
            "There is nothing anymore which you can harvest." )
        end
    end
end

M.getFarmingItem = getFarmingItem

return M
