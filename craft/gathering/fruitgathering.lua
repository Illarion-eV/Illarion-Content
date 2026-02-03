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
local gathering = require("craft.base.gathering")
local gwynt = require("magic.arcane.enchanting.effects.gwynt")

local M = {}

local function gatherFromHolyVine(user)
    local questStatus, lastSet = user:getQuestProgress(451)

    if questStatus == 0 or questStatus < world:getTime("day") or world:getTime("unix") - lastSet > 30000 then

        local datas = {nameDe = "Heilige Trauben", nameEn = "Holy Grapes", descriptionDe = "Die Weintrauben geben einen sehr angenehmen süßlichen Geruch von sich.", descriptionEn = "The grapes have a very pleasant, sweet scent."}
        common.CreateItem(user, 388, 1, 333, datas)
        user:inform("Du sammelst ein einzelne Rebe von dem Weinstock.","You collect a single vine from the plant.")
        user:setQuestProgress(451, world:getTime("day"))
    else
        user:inform("Jedes mal, als du eine Rebe zu greifen versuchts, greifst du daneben. So sehr du dich auch anstrengst, deine Hand geht vorbei.", "Everytime you try to get hold of a vine, you miss. No matter how hard you try, your hand seems always to be to far to the left of to the right of the vine.")
    end
end

-- GrowCycles define how fast the plants regrow in the 4 seasons. 1 cycle takes 3 minutes
local function CreateHarvestProduct(ProductId, GroundType, GrowCycles, NextItemId, amount, originId)
    local retValue = {}
    retValue.productId = ProductId
    retValue.groundType = GroundType
    -- NOTE: regrow according to season is currently deactivated, so growCycles is not used
    retValue.growCycles = {1,1,1,1}
    if (GrowCycles ~= nil) then
        retValue.growCycles = GrowCycles
    end

    retValue.nextItemId = NextItemId

    retValue.amount = amount

    retValue.origin = originId

    return retValue
end

local HarvestItems = {}
table.insert(HarvestItems, CreateHarvestProduct(Item.apple, nil, nil, 11, 20, 14)) -- apple tree
table.insert(HarvestItems, CreateHarvestProduct(Item.cherries, nil, nil, 299, 20, 300))-- cherry tree
table.insert(HarvestItems, CreateHarvestProduct(Item.orange, nil, nil, 1193, 5, 1195)) -- orange tree
table.insert(HarvestItems, CreateHarvestProduct(Item.grapes, nil, nil, 386, 5, 387))-- bush
table.insert(HarvestItems, CreateHarvestProduct(Item.tangerine,nil, nil, 3612, 20, 3613)) -- tangerine
table.insert(HarvestItems, CreateHarvestProduct(Item.berries,nil, nil, 3742, 10, 3743)) -- berries
table.insert(HarvestItems, CreateHarvestProduct(Item.banana, nil, nil, 3866, 20, 3867)) -- banana tree
table.insert(HarvestItems, CreateHarvestProduct(Item.blackberry, nil, nil, 3893, 10, 3892)) -- blackberry bush
table.insert(HarvestItems, CreateHarvestProduct(Item.pear, nil, nil, 4254, 20, 4253)) -- pear tree
table.insert(HarvestItems, CreateHarvestProduct(Item.plum, nil, nil, 4342, 10, 4341)) -- plum tree
table.insert(HarvestItems, CreateHarvestProduct(Item.pineapple,nil, nil, 4244, 5,4245)) -- pineapple plant
table.insert(HarvestItems, CreateHarvestProduct(Item.peach,nil, nil, 4239, 20, 4238)) -- peach tree
table.insert(HarvestItems, CreateHarvestProduct(Item.mango,nil, nil, 4256, 10, 4255)) -- mango tree
table.insert(HarvestItems, CreateHarvestProduct(Item.nuts, nil, nil, 1809, 10, 4246)) -- nut tree

M.HarvestItems = HarvestItems

local IsTree = {}
IsTree[14] = true
IsTree[300] = true
IsTree[1195] = true
IsTree[3867] = true

function M.StartGathering(User, SourceItem, ltstate)

    if SourceItem:getData("nameEn") == "Holy Vine" then
        gatherFromHolyVine(User)
        return
    end

    local fruitgathering = gathering.GatheringCraft:new{FastActionFactor = 0.5}; -- harvest
    fruitgathering:AddRandomItem(65,1,333,{},gathering.prob_rarely,"Bei genauer Betrachtung entpuppt sich ein Ast am Boden als Bogen. Ob den ein elfischer Späher hier deponiert hat?","On closer inspection, a branch on the ground turns out to be a bow. Did an elven scout forget it here?"); --short bow
    fruitgathering:AddRandomItem(2295,1,333,{},gathering.prob_occasionally,"Über einem Ast hängt ein Paar alter Handschuhe. Der Besitzer vermisst sie offenbar nicht.","Over a branch hangs a pair of old gloves. Judging by their condition no one would miss them."); --cloth gloves
    fruitgathering:AddRandomItem(463,1,333,{},gathering.prob_frequently,"Eine Feder hat sich zwischen den Zweigen verfangen. Ob man mit ihr auch schreiben kann?","A feather lies entangled among the branches. Perhaps one could write with it?"); --quill

    common.ResetInterruption( User, ltstate )
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
    common.TurnTo( User, SourceItem.pos ) -- turn if necessary

    -- any other checks?
    -- check if there is a harvestable item or any item at all

    local harvestItem

    for _, selectedHarvestItem in pairs(HarvestItems) do
        if SourceItem.id == selectedHarvestItem.origin then
            harvestItem = selectedHarvestItem
        end
    end

    if ( harvestItem == nil) then
        User:inform("[ERROR] Unknown harvest item, id: " .. SourceItem.id .. ". Please inform a developer.")
        return
    end
    -- there is a harvestable item, but does the ground fit?
    local GroundType = common.GetGroundType(world:getField(SourceItem.pos):tile())
    local harvestProduct

    if (harvestItem.groundType == nil or GroundType == harvestItem.groundType) then
        harvestProduct = harvestItem
    end

    if ( harvestProduct == nil ) then
        if (IsTree[SourceItem.id] == true) then
          common.TempInformNLS( User,
          "Dieser Baum trägt keine Früchte. Vielleicht wird diese Art Baum in einem anderen Boden besser gedeihen.",
          "This tree bears no fruits. Maybe this type of tree will flourish better in another soil." )
        else
          common.TempInformNLS( User,
          "Diese Pflanze trägt keine Früchte. Vielleicht wird diese Art Pflanze in einem anderen Boden besser gedeihen.",
          "This plant bears no fruits. Maybe this type of plant will flourish better in another soil." )
        end
        return
    end
    -- check the amount
    local amountStr = SourceItem:getData("amount")
    local amount
    local isPlayerPlanted = SourceItem:getData("playerPlanted") ~= ""
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr)
    else
        -- first time that this item is harvested
        if isPlayerPlanted then
            amount = math.max(1, math.floor(harvestProduct.amount/2.5)) --Used to be 4, now it will be 2, 4, 8 (5, 10, 20)
        else
            amount = harvestProduct.amount
        end
        SourceItem:setData("amount","" .. amount)
        world:changeItem(SourceItem)
        User:changeSource(SourceItem)
    end
    if ( amount < 0 ) then
        -- this should never happen...
        User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.")
        return
    end
    if ( amount == 0 ) then
        -- this should never happen...
        User:inform("[ERROR] Zero amount for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.")
        return
    end

    -- since we're here, there is something we can harvest

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User)
        User:startAction( fruitgathering.SavedWorkTime[User.id], 21, fruitgathering.SavedWorkTime[User.id], 0, 0)
        return
    end

    -- since we're here, we're working

    fruitgathering:FindRandomItem(User, nil)

    --User:learn( fruitgathering.LeadSkill, fruitgathering.SavedWorkTime[User.id], fruitgathering.LearnLimit)
    amount = amount - 1

    local productAmount = 1

    -- temp glyph effect until fruitgathering is streamlined like other gathering skills
    if gwynt.includeExtraResource(User, 0) then
        productAmount = 2
    end
    -- end of glyph

    local data = gathering.rollsAsRare(User, false, false)

    local created = common.CreateItem(User, harvestProduct.productId, productAmount, 333, data) -- create the new produced items
    if created then -- character can still carry something
        if (amount>0) then  -- there are still fruits we can gather
            fruitgathering.SavedWorkTime[User.id] = fruitgathering:GenWorkTime(User)
            User:startAction( fruitgathering.SavedWorkTime[User.id], 21, fruitgathering.SavedWorkTime[User.id], 0, 0)
        end
    end
    if (amount<=0) then
        if (IsTree[SourceItem.id] == true) then
          common.TempInformNLS(User,
          "Dieser Baum ist schon komplett abgeerntet. Gib ihm Zeit um nachzuwachsen.",
          "This tree is already completely harvested. Give it time to grow again." )
        else
          common.TempInformNLS(User,
          "Diese Pflanze ist schon komplett abgeerntet. Gib ihr Zeit um nachzuwachsen.",
          "This plant is already completely harvested. Give it time to grow again." )
        end
        -- reset amount
        if isPlayerPlanted then
            amount = math.max(1, math.floor(harvestProduct.amount/2.5)) --Used to be 4, now it will be 2, 4, 8 (5, 10, 20)
        else
            amount = harvestProduct.amount
        end
        SourceItem:setData("amount","" .. amount)
        world:changeItem(SourceItem)
            -- change item id
        world:swap(SourceItem, harvestProduct.nextItemId, 333)
        return
        -- regrow according to season: currently deactivated
            -- local season = math.ceil(world:getTime("month")/4);
            -- SourceItem.wear = SourceItem.wear + harvestProduct.growCycles[season];
    end
    SourceItem:setData("amount","" .. amount)
    world:changeItem(SourceItem)
  User:changeSource(SourceItem)
end

return M
