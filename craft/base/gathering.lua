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

function GatheringCraft:AddMonster(User,MonsterID, Probability, MessageDE, MessageEN, Sound, GFX)
    if not User:isNewPlayer() then
        table.insert(self.Monsters, Monster:new{["MonsterID"] = MonsterID, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN, ["Sound"] = Sound, ["GFX"] = GFX});
    end
end

function GatheringCraft:AddRandomItem(ItemID, Quantity, Quality, Data, Probability, MessageDE, MessageEN)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN});
end

function GatheringCraft:AddRandomPureElement(User,Probability)
    local skill = common.Limit(User:getSkill(self.LeadSkill), 0, 100);
    if skill >= 80 then
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2551, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.", ["MessageEN"] = "For your hard and honest labour Findari, the Godess of Air, rewards you with a treasure of Pure Air."}); -- Pure Air
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2553, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Bragon, der Gott des Feuers, mit einem Kleinod aus Reinem Feuer.", ["MessageEN"] = "For your hard and honest labour Bragon, the god of fire, rewards you with a treasure of Pure Fire."}); -- Pure Fire
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2554, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.", ["MessageEN"] = "For your hard and honest labour Tanora, the Godess of Water, rewards you with a treasure of Pure Water."}); -- Pure Water
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 2552, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.", ["MessageEN"] = "For your hard and honest labour Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."}); -- Pure Earth
        table.insert(self.RandomItems, RandomItem:new{["ID"] = 3607, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability), ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Eldan, der Gott des Geistes, mit einem Kleinod aus Reinem Geist.", ["MessageEN"] = "For your hard and honest labour Eldan, the God of Spirit, rewards you with a treasure of Pure Spirit."}); -- Pure Spirit
    end
end

function GatheringCraft:FindRandomItem(User)

  -- FindRandomItem is called when the User is currently working. If there was
  -- a reload, the working time will be nil. Check for this case.
  if (self.SavedWorkTime[User.id] == nil) then
    -- Just generate the work time again. Does not matter really if this is not
    -- exactly the original value.
    self.SavedWorkTime[User.id] = self:GenWorkTime(User);
  end

    common.GetHungry(User, self.SavedWorkTime[User.id]*4);

    -- check for Noobia
    if (common.isOnNoobia(User.pos)) then
        return false;
    end

    -- check for Prison Mine
    if (common.isInPrison(User.pos)) then
       return false
    end

    local skill  = common.Limit(User:getSkill(self.LeadSkill), 0, 100);
    if (self.Treasure > 0) then
        local rand = math.random();
        if(rand < self.Treasure*self.FastActionFactor) and treasure.createMapFromSkill(User, skill) then
            common.InformNLS(User, self.TreasureMsg[1], self.TreasureMsg[2]);
            return true;
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
            world:createMonster(self.Monsters[ra].MonsterID, TargetPos, 20);
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

        -- check all items with same random number and choose any possible item again randomly

        local itemIndexList = {};

        -- list all items that are possible
        for it = 1, #self.RandomItems, 1 do
            local rand = math.random();

            if (rand <= self.RandomItems[it].Probability*self.FastActionFactor) then

                table.insert(itemIndexList, it);

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
function M.GetAmount(maxAmount, SourceItem)

    local amountStr = SourceItem:getData("amount");
    local amount = 0;
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr);
    elseif ( SourceItem.wear == 255 ) then
        amount = maxAmount
    else
        amount = 0
    end
    
    return amount
    
 end

-- Find a resource from a source
function M.FindResource(User, SourceItem, amount, resourceID)

    amount = amount - 1
    SourceItem:setData("amount", "" .. amount)
    world:changeItem(SourceItem)
        
    local created = common.CreateItem(User, resourceID, 1, 333, nil)
    
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
function M.InitGathering(User, SourceItem, toolID, maxAmount, skill)

    common.TurnTo(User, SourceItem.pos)
    local success = false
    local toolItem=shared.getTool(User, toolID)
    local amount=M.GetAmount(maxAmount, SourceItem) 
    local gatheringBonus=shared.getGatheringBonus(User, toolItem)

    if toolItem and common.CheckItem(User, SourceItem) and common.FitForWork(User) and M.SkillCheck(User, SourceItem, skill) then -- security checks
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

M.GatheringCraft = GatheringCraft

M.prob_frequently = 1/2000;
M.prob_occasionally = 1/4000;
M.prob_rarely = 1/40000;
M.prob_monster = 1/10000;
M.prob_element = 1/6000; --Chance for one specific element, there are five elements in total. So in total, it is 1/1200.
M.prob_map = 1/2000;

return M
