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
local shared = require("craft.base.shared")
local treasure = require("item.base.treasure")
local gwynt = require("magic.arcane.enchanting.effects.gwynt")
local anemo = require("magic.arcane.enchanting.effects.anemo")
local nomizo = require("magic.arcane.enchanting.effects.nomizo")
local gems = require("base.gems")

local M = {}

local RandomItem = {
    ID = 0,
    Quantity = 1,
    Quality = 333,
    Data = {},
    Probability = 0,
    MessageDE = nil,
    MessageEN = nil,
};

local GatheringCraft = {
    RandomItems = { },
    Monsters = { },
    LeadSkill = 0,
    SavedWorkTime = { },
    Treasure = 0,
    TreasureMsg = { },
    FastActionFactor = 1,
    LearnLimit = 20
};

local Monster = {
    MonsterID = 0,
    Probability = 100,
    MessageDE = "",
    MessageEN = "",
    Sound = nil,
    GFX = nil
};

function GatheringCraft:new(gc)
    gc = gc or {};
    setmetatable(gc, self);
    self.__index = self;
    gc.RandomItems = {};
    gc.InterruptMsg = {};
    gc.Monsters = {};
    gc.TreasureMsg = {};
    return gc;
end

function RandomItem:new(item)
    item = item or {};
    setmetatable(item, self);
    self.__index = self;
    return item;
end

function Monster:new(m)
    m = m or {};
    setmetatable(m, self);
    self.__index = self;
    return m;
end

function GatheringCraft:SetTreasureMap(User,Probability, MessageDE, MessageEN)
    self.Treasure = Probability;
    self.TreasureMsg[1] = MessageDE;
    self.TreasureMsg[2] = MessageEN;
end

function GatheringCraft:AddMonster(user,MonsterID, Probability, MessageDE, MessageEN, Sound, GFX)
    if not user:isNewPlayer() then
        table.insert(self.Monsters, Monster:new{["MonsterID"] = MonsterID, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN, ["Sound"] = Sound, ["GFX"] = GFX});
    end
end

function GatheringCraft:AddRandomItem(ItemID, Quantity, Quality, Data, Probability, MessageDE, MessageEN)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN});
end

function GatheringCraft:AddRandomPureElement(User,Probability)
    local skill = common.Limit(User:getSkill(self.LeadSkill), 0, 100);
    if skill >= 80 then
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2551, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.", ["MessageEN"] = "For your hard and honest labour Findari, the Goddess of Air, rewards you with a treasure of Pure Air."}); -- Pure Air
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2553, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Bragon, der Gott des Feuers, mit einem Kleinod aus Reinem Feuer.", ["MessageEN"] = "For your hard and honest labour Bragon, the god of fire, rewards you with a treasure of Pure Fire."}); -- Pure Fire
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2554, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.", ["MessageEN"] = "For your hard and honest labour Tanora, the Goddess of Water, rewards you with a treasure of Pure Water."}); -- Pure Water
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2552, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.", ["MessageEN"] = "For your hard and honest labour Ushara, the Goddess of Earth, rewards you with a treasure of Pure Earth."}); -- Pure Earth
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 3607, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Eldan, der Gott des Geistes, mit einem Kleinod aus Reinem Geist.", ["MessageEN"] = "For your hard and honest labour Eldan, the God of Spirit, rewards you with a treasure of Pure Spirit."}); -- Pure Spirit
    end
end

function GatheringCraft:FindRandomItem(User, toolItem)

  -- FindRandomItem is called when the User is currently working. If there was
  -- a reload, the working time will be nil. Check for this case.
  if (self.SavedWorkTime[User.id] == nil) then
    -- Just generate the work time again. Does not matter really if this is not
    -- exactly the original value.
    self.SavedWorkTime[User.id] = self:GenWorkTime(User);
  end

    common.GetHungry(User, self.SavedWorkTime[User.id]*4);

    -- check for Prison Mine
    if (common.isInPrison(User.pos)) then
       return false
    end

    local guaranteeMap = false

    local guaranteeElement = false

    local guaranteeRareItem = false

    local guaranteeOccasionalItem = false

    local guaranteeFrequentItem = false

    if nomizo.increaseTreasureChance(User, toolItem, self.LeadSkill) then
        local rand = math.random()
        -- See nomizo.lua in magic/arcane/enchanting/effects for an explanation of the %s
        if rand <= 0.05 then -- 5% chance
            guaranteeMap = true
        elseif rand <= 0.10 then -- 5% chance
            guaranteeElement = true
        elseif rand <= 0.20 then -- 10% chance
            guaranteeRareItem = true
        elseif rand <= 0.40 then -- 20% chance
            guaranteeOccasionalItem = true
        else -- 60% chance
            guaranteeFrequentItem = true
        end
    end

    local skill  = common.Limit(User:getSkill(self.LeadSkill), 0, 100);
    if (self.Treasure > 0) then
        local rand = math.random();
        if ((rand < self.Treasure*self.FastActionFactor) or guaranteeMap) and treasure.createMapFromSkill(User, skill) then
            common.InformNLS(User, self.TreasureMsg[1], self.TreasureMsg[2]);
            return true
        end
    end

    if (#self.Monsters > 0) then
        local ra = math.random(#self.Monsters);
        local pa = math.random();
        if (pa < self.Monsters[ra].Probability*self.FastActionFactor) then
            local TargetPos = common.GetFreePositions(User.pos, 1, true, true)()
            if TargetPos == nil then
                return false
            end
            if not anemo.monsterSpawnPrevented(User) then
                world:createMonster(self.Monsters[ra].MonsterID, TargetPos, 20);
            end
            if ( self.Monsters[ra].GFX ~= nil ) then
                world:gfx(self.Monsters[ra].GFX, TargetPos);
            end
            if(self.Monsters[ra].Sound ~= nil) then
                world:makeSound(self.Monsters[ra].Sound, TargetPos);
            end
            common.InformNLS(User, self.Monsters[ra].MessageDE, self.Monsters[ra].MessageEN);
            return true;
        end
    end

    if(#self.RandomItems > 0) then

        local elements = {2551, 2553, 2554, 2552, 3607}

        local itemIndexList = {}

        local elementCount = 0

        local rareItemExists = false

        local occasionalItemExists = false

        for _, randomItem in pairs(self.RandomItems) do
            if randomItem.Probability == M.prob_rarely then
                rareItemExists = true
            end
            if randomItem.Probability == M.prob_occasionally then
                occasionalItemExists = true
            end
        end

        if not rareItemExists and guaranteeRareItem then
            guaranteeRareItem = false
            guaranteeOccasionalItem = true
        end

        if not occasionalItemExists and guaranteeOccasionalItem then
            guaranteeOccasionalItem = false
            guaranteeFrequentItem = true -- This way even if no occasional item exists for the gathering skill, you always get something
        end

        for it = 1, #self.RandomItems, 1 do

            local guaranteeThisItem = false

            for _, element in pairs(elements) do
                if self.RandomItems[it].ID == element and guaranteeElement and elementCount ~= 5 then

                    local randomElement = math.random(1,5-elementCount)

                    if randomElement == 1 then
                        elementCount = 5
                        guaranteeThisItem = true
                    end
                end
            end

            if (self.RandomItems[it].Probability == M.prob_occasionally and guaranteeOccasionalItem) or (self.RandomItems[it].Probability == M.prob_frequently and guaranteeFrequentItem) or (self.RandomItems[it].Probability == M.prob_rarely and guaranteeRareItem) then
                guaranteeThisItem = true

            end

            local rand = math.random()

            local itemObtainedNormally = rand <= self.RandomItems[it].Probability*self.FastActionFactor

            if itemObtainedNormally or guaranteeThisItem then

                table.insert(itemIndexList, it)

                -- since an item was awarded, we reset whichever one it was incase of duplicates in the category
                guaranteeRareItem, guaranteeOccasionalItem, guaranteeFrequentItem = false, false, false

            end
        end

        if ( #itemIndexList > 0 ) then -- For the unlikely case that two items were found at once, we just give one to the player
            local ind = itemIndexList[math.random(1,#itemIndexList)];
            common.InformNLS(User, self.RandomItems[ind].MessageDE, self.RandomItems[ind].MessageEN);
            common.CreateItem(User, self.RandomItems[ind].ID, self.RandomItems[ind].Quantity, self.RandomItems[ind].Quality, self.RandomItems[ind].Data)
            return true;
        end

    end
    return false;
end

-- Generate working time for gathering actions
function GatheringCraft:GenWorkTime(User)

  local minTime = 15; --Minimum time for skill 100
  local maxTime = 45; --Maximum time for skill 0

  local skill  = common.Limit(User:getSkill(self.LeadSkill), 0, 100);
  local workTime = common.Scale(maxTime, minTime, skill); --scaling with the skill

  workTime = math.ceil(workTime*self.FastActionFactor); --for fast actions.

  return workTime;
end

-- Check the amount
function M.GetAmount(maxAmount, SourceItem, depleted)

    local amountStr = SourceItem:getData("amount")
    local amount = 0

    local timestamp = SourceItem:getData("timestamp")

    local respawnShouldveHappened = false

    if depleted then

        local itemStats = world:getItemStatsFromId(depleted)

        local ageingSpeed = itemStats.AgeingSpeed*3*60 --Amount of seconds it takes for the resource to recover normally

        local time = world:getTime("unix")

        if not common.IsNilOrEmpty(timestamp) then
            if time >= timestamp + ageingSpeed then
                respawnShouldveHappened = true
            end
        end
    end

    if not common.IsNilOrEmpty(amountStr) and not respawnShouldveHappened then
        amount = tonumber(amountStr)
    elseif SourceItem.wear == 255 then
        amount = maxAmount
    end

    return amount

 end

 function M.rollsAsRare(user, leadSkill, toolItem)

    local leadAttribValue

    if leadSkill then
        local leadAttribNames = common.GetLeadAttributeName(leadSkill)
        local leadAttribValue1 = user:increaseAttrib(leadAttribNames.first, 0) * 0.6 -- 60% of the impact dex had on its own in the past
        local leadAttribValue2 = user:increaseAttrib(leadAttribNames.second, 0) * 0.4 -- 40% of the impact dex had on its own in the past
        leadAttribValue = leadAttribValue1 + leadAttribValue2
    else --It's foraging
        leadAttribValue = user:increaseAttrib("constitution", 0)
    end

    local attributeBonus = 0
    local toolBonus = 0
    local gemBonus = 0

    if leadAttribValue then
        attributeBonus = common.GetAttributeBonusHigh(leadAttribValue)
    end

    if toolItem then
        toolBonus = common.GetQualityBonusStandard(toolItem)
        gemBonus = gems.getGemBonus(toolItem)
    end

    local meanQuality = 5

    meanQuality = meanQuality*(1+attributeBonus+toolBonus)+gemBonus/100 --Apply boni of attribs, tool quality and gems.
    meanQuality = common.Limit(meanQuality, 1, 8.5) --Limit to a reasonable maximum to avoid overflow ("everything quality 9"). The value here needs unnatural attributes.
    local rolls = 8 --There are eight chances to increase the quality by one. This results in a quality distribution 1-9.
    local quality = 1 + common.BinomialByMean((meanQuality-1), rolls)
    quality = common.Limit(quality, 1, common.ITEM_MAX_QUALITY)

    if quality ~= 9 then
        return
    end

    -- 1 = common, 2 = uncommon, 3 = rare, 4 = unique
    -- Max chances: 0.4% unique, 2% rare, 10% uncommon, 87.6% common (includes the chance to get perfect items to even get here)

    local retVal = 1

    local maxPerfectChance = 0.5967194738 --Maximum probability for quality 9(perfect) items

    local rarities = {(0.004)/maxPerfectChance, (0.02)/maxPerfectChance, (0.1)/maxPerfectChance} --unique, rare, uncommon

    local rand = math.random()

    for _, rarity in ipairs(rarities) do
        if rarity >= rand then
            retVal = retVal+1
        end
    end

    if retVal <= 1 then
        return
    end

    return {rareness = retVal, craftedRare = "true"}
 end

-- Find a resource from a source
function M.FindResource(user, SourceItem, amount, resourceID, leadSkill, toolItem)

    amount = amount - 1
    SourceItem:setData("amount", "" .. amount)
    SourceItem:setData("timestamp", tostring(world:getTime("unix")))
    world:changeItem(SourceItem)

    local resourceAmount = 1
    local commonItem = world:getItemStatsFromId(resourceID)

    if gwynt.includeExtraResource(user, commonItem.Level) then
        resourceAmount = 2
    end

    local data = M.rollsAsRare(user, leadSkill, toolItem)

    local created = common.CreateItem(user, resourceID, resourceAmount, 333, data)

    return created, amount

end

-- Swap the source with the depleted source.
function M.SwapSource(SourceItem, depletedSourceID, restockWear)

    SourceItem:setData("amount","")
    SourceItem.id = depletedSourceID
    SourceItem.wear = restockWear
    world:changeItem(SourceItem)

end

-- Collector for recurring functions
function M.InitGathering(user, sourceItem, toolID, maxAmount, skill, depletedItemId)

    common.TurnTo(user, sourceItem.pos)

    local success = false
    local toolItem

    if toolID then
        toolItem = shared.getTool(user, toolID)
    end

    local amount= M.GetAmount(maxAmount, sourceItem, depletedItemId)
    local gatheringBonus= shared.getGatheringBonus(user, toolItem, skill)

    if ((toolID and toolItem) or not toolID) and common.CheckItem(user, sourceItem) and common.FitForWork(user) and M.SkillCheck(user, sourceItem, skill) then -- security checks
        success = true
    end

    return success, toolItem, amount, gatheringBonus

end

-- Skill check
function M.SkillCheck(User, SourceItem, skill)

    if User:getSkill(skill) < world:getItemStatsFromId(SourceItem.id).Level then
        User:inform("Deine Fertigkeit "..User:getSkillName(skill).." ist zu niedrig, um hier etwas zu sammeln.", "Your skill "..User:getSkillName(skill).." is not high enough to gather this resource.", Character.highPriority)
        return false
    else
        return true
    end

end

function M.getMaxAmountFromResourceList(resourceList, resourceId)
    for _, resource in pairs(resourceList) do
        if resource.id == resourceId then
            return resource.maxAmount
        end
    end
end

function M.getProductId(resourceList, resourceId)
    for _, resource in pairs(resourceList) do
        if resource.id == resourceId then
            return resource.productId
        end
    end
end

function M.getDepletedObject(resourceList, resourceId)
    for _, resource in pairs(resourceList) do
        if resource.id == resourceId then
            return resource.depletedId
        end
    end
end

function M.passesLevelReq(user, sourceItem, skillLevel)
    local itemCommon = world:getItemStatsFromId(sourceItem.id)
    local levelReq = itemCommon.level or 0
    if levelReq <= skillLevel then
        return true
    end
return false, levelReq
end

local function checkIfGMQuestItem(theResource)
    local descriptionEn = theResource:getData("descriptionEn")
    local nameEn = theResource:getData("nameEn")
    local descriptionDe = theResource:getData("descriptionDe")
    local nameDe = theResource:getData("nameDe")

    local gmItem = descriptionEn..nameEn..descriptionDe..nameDe

    if gmItem ~= "" then
        return false --One of the descriptions or names were customized indicating its a resource item being used for GM purposes
    end

    return true
end

function M.isDepletableResource(user, theResource, resourceList)

    if not theResource then
        return false
    end

    for _, resource in pairs(resourceList) do
        if theResource.id == resource.id then
            return checkIfGMQuestItem(theResource)
        end
    end

    return false
end

function M.getDepletableResource(user, resourceList)
    local targetItem = common.GetFrontItem(user)
    if M.isDepletableResource(user, targetItem, resourceList) then
        return targetItem
    end
    local radius = 1
    for x=-radius,radius do
        for y=-radius,radius do
            local targetPos = position(user.pos.x + x, user.pos.y + y, user.pos.z)
            if (world:isItemOnField(targetPos)) then
                targetItem = world:getItemOnField(targetPos)
                if M.isDepletableResource(user, targetItem, resourceList) then
                    return targetItem
                end
            end
        end
    end
    return nil
end

M.GatheringCraft = GatheringCraft

M.prob_frequently = 1/2000;
M.prob_occasionally = 1/4000;
M.prob_rarely = 1/40000;
M.prob_monster = 1/10000;
M.prob_element = 1/6000; --Chance for one specific element, there are five elements in total. So in total, it is 1/1200.
M.prob_map = 1/2000;

return M
