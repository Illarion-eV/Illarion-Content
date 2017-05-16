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
local treasure = require("item.base.treasure")
local gems = require("item.gems")

module("base.gatheringcraft", package.seeall)

RandomItem = {
    ID = 0,
    Quantity = 1,
    Quality = 333,
    Data = {},
    Probability = 0,
    MessageDE = nil,
    MessageEN = nil,
};

GatheringCraft = {
    RandomItems = { },
    InterruptMsg = { },
    Monsters = { },
    LeadSkill = 0,
    SavedWorkTime = { },
    Treasure = 0,
    TreasureMsg = { },
  FastActionFactor = 1,
  LearnLimit = 20
};

Monster = {
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


function GatheringCraft:SetTreasureMap(Probability, MessageDE, MessageEN)
    self.Treasure = Probability;
    self.TreasureMsg[1] = MessageDE;
    self.TreasureMsg[2] = MessageEN;
end

function GatheringCraft:AddInterruptMessage(MessageDE, MessageEN)
    table.insert(self.InterruptMsg, { MessageDE, MessageEN });
    return;
end

function GatheringCraft:AddMonster(MonsterID, Probability, MessageDE, MessageEN, Sound, GFX)
    table.insert(self.Monsters, Monster:new{["MonsterID"] = MonsterID, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN, ["Sound"] = Sound, ["GFX"] = GFX});
    return;
end

function GatheringCraft:AddRandomItem(ItemID, Quantity, Quality, Data, Probability, MessageDE, MessageEN)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN});
    return;
end

function GatheringCraft:AddRandomMagicGem(Quantity, Quality, Data, Probability)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.EMERALD), ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Die Arbeit ist anstrengend aber nicht kompliziert. Du siehst dich um und entdeckst ein grünliches Leuchten. Du schaust genauer hin und findest einen magischen Smaragd.", ["MessageEN"] = "The work is exhausting but not difficult. You look around and discover a greenish glow. You look closer and find a magical emerald."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.OBSIDIAN), ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Seit wann leuchtet Schmutz? Du wischst etwas Staub bei Seite und hältst einen magischen Obsidian in der Hand.", ["MessageEN"] = "Since when does dirt glow? You wipe dust aside and hold a magical obsidian in your hand."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.RUBY), ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Erschrocken springst du zurück, als ein Funke auf deinen Fuß fällt. Als du genauer hinschaust siehst du, dass es sich um einen magischen Rubin handelt.", ["MessageEN"] = "Frightened, you spring back as a spark falls on your foot. As you look closer you can see that it is a magic ruby."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.TOPAZ), ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Ist es ein Sonnenstrahl, der dir ins Auge sticht? Nein dort liegt etwas Gelbes. Du findest einen magischen Topas.", ["MessageEN"] = "Is it a sunbeam that hits your eye? No there is something yellow. You find a magical topaz."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.AMETHYST), ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Du setzt dein Werkzeug kurz ab. Als du es wieder aufnimmst, findest du darunter einen magischen Amethysten.", ["MessageEN"] = "For a short moment you put your tool down. When you pick it back up, you find a magical amethyst."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.SAPPHIRE), ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Schweiß tropft dir von der Stirn. Dort wo er aufschlägt verwandelt er sich. Oder lag der magische Saphir schon vorher dort?", ["MessageEN"] = "Sweat drips from your forehead. Where it reaches the ground it changes. Or was the magical sapphire already there?"});
    return;
end

function GatheringCraft:FindRandomItem(User)

  -- FindRandomItem is called when the User is currently working. If there was
  -- a reload, the working time will be nil. Check for this case.
  if (self.SavedWorkTime[User.id] == nil) then
    -- Just generate the work time again. Does not matter really if this is not
    -- exactly the original value.
    self.SavedWorkTime[User.id] = self:GenWorkTime(User,nil);
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

    if (self.Treasure > 0) then
        local rand = math.random();
        if(rand < self.Treasure*self.FastActionFactor) and treasure.createMap(User) then
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
function GatheringCraft:GenWorkTime(User, toolItem)

  local minTime = 12; --Minimum time for skill 100 and normal tool
  local maxTime = 60; --Maximum time for skill 0 and normal tool

  local skill  = common.Limit(User:getSkill(self.LeadSkill), 0, 100);
  local workTime = common.Scale(maxTime, minTime, skill); --scaling with the skill

  -- apply the quality bonus
  if ( toolItem ~= nil ) then
    local qual = common.Limit(math.floor(toolItem.quality/100), 1, 9); -- quality integer in [1,9]
    workTime = workTime - workTime*0.20*((qual-5)/4); --+/-20% depending on tool quality
  end

  workTime = math.ceil(workTime*self.FastActionFactor); --for fast actions.

  return workTime;
end
