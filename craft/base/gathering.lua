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
local gems = require("base.gems")
local shard = require("item.shard")

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
    InterruptMsg = { },
    Monsters = { },
    LeadSkill = 0,
    SavedWorkTime = { },
    Treasure = 0,
    TreasureMsg = { },
    Shard = 0,
    ShardMsg = { },
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


function GatheringCraft:SetTreasureMap(Probability, MessageDE, MessageEN)
    self.Treasure = Probability;
    self.TreasureMsg[1] = MessageDE;
    self.TreasureMsg[2] = MessageEN;
end

function GatheringCraft:SetShard(Probability, MessageDE, MessageEN)
    self.Shard = Probability;
    self.ShardMsg[1] = MessageDE;
    self.ShardMsg[2] = MessageEN;
end

function GatheringCraft:AddInterruptMessage(MessageDE, MessageEN)
    table.insert(self.InterruptMsg, { MessageDE, MessageEN });
end

function GatheringCraft:AddMonster(MonsterID, Probability, MessageDE, MessageEN, Sound, GFX)
    table.insert(self.Monsters, Monster:new{["MonsterID"] = MonsterID, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN, ["Sound"] = Sound, ["GFX"] = GFX});
end

function GatheringCraft:AddRandomItem(ItemID, Quantity, Quality, Data, Probability, MessageDE, MessageEN)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN});
end

function GatheringCraft:AddRandomMagicGem(Level, Probability)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.EMERALD), ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = gems.getMagicGemData(Level), ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Die Arbeit ist anstrengend aber nicht kompliziert. Du siehst dich um und entdeckst ein grünliches Leuchten. Du schaust genauer hin und findest einen magischen Smaragd.", ["MessageEN"] = "The work is exhausting but not difficult. You look around and discover a greenish glow. You look closer and find a magical emerald."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.OBSIDIAN), ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = gems.getMagicGemData(Level), ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Seit wann leuchtet Schmutz? Du wischst etwas Staub bei Seite und hältst einen magischen Obsidian in der Hand.", ["MessageEN"] = "Since when does dirt glow? You wipe dust aside and hold a magical obsidian in your hand."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.RUBY), ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = gems.getMagicGemData(Level), ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Erschrocken springst du zurück, als ein Funke auf deinen Fuß fällt. Als du genauer hinschaust siehst du, dass es sich um einen magischen Rubin handelt.", ["MessageEN"] = "Frightened, you spring back as a spark falls on your foot. As you look closer you can see that it is a magic ruby."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.TOPAZ), ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = gems.getMagicGemData(Level), ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Ist es ein Sonnenstrahl, der dir ins Auge sticht? Nein dort liegt etwas Gelbes. Du findest einen magischen Topas.", ["MessageEN"] = "Is it a sunbeam that hits your eye? No there is something yellow. You find a magical topaz."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.AMETHYST), ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = gems.getMagicGemData(Level), ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Du setzt dein Werkzeug kurz ab. Als du es wieder aufnimmst, findest du darunter einen magischen Amethysten.", ["MessageEN"] = "For a short moment you put your tool down. When you pick it back up, you find a magical amethyst."});
    table.insert(self.RandomItems, RandomItem:new{["ID"] = gems.getMagicGemId(gems.SAPPHIRE), ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = gems.getMagicGemData(Level), ["Probability"] = tonumber(Probability) / 6, ["MessageDE"] = "Schweiß tropft dir von der Stirn. Dort wo er aufschlägt verwandelt er sich. Oder lag der magische Saphir schon vorher dort?", ["MessageEN"] = "Sweat drips from your forehead. Where it reaches the ground it changes. Or was the magical sapphire already there?"});
end

function GatheringCraft:AddRandomPureElement(Probability)
    table.insert(self.RandomItems, RandomItem:new{["ID"] = 2551, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability) / 5, ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Findari, die Göttin der Luft, mit einem Kleinod aus Reiner Luft.", ["MessageEN"] = "For your hard and honest labour Findari, the Godess of Air, rewards you with a treasure of Pure Air."}); -- Pure Air
    table.insert(self.RandomItems, RandomItem:new{["ID"] = 2553, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability) / 5, ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Bragon, der Gott des Feuers, mit einem Kleinod aus Reinem Feuer.", ["MessageEN"] = "For your hard and honest labour Bragon, the god of fire, rewards you with a treasure of Pure Fire."}); -- Pure Fire
    table.insert(self.RandomItems, RandomItem:new{["ID"] = 2554, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability) / 5, ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Tanora, die Göttin des Wassers, mit einem Kleinod aus Reinem Wasser.", ["MessageEN"] = "For your hard and honest labour Tanora, the Godess of Water, rewards you with a treasure of Pure Water."}); -- Pure Water
    table.insert(self.RandomItems, RandomItem:new{["ID"] = 2552, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability) / 5, ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Ushara, die Göttin der Erde, mit einem Kleinod aus Reiner Erde.", ["MessageEN"] = "For your hard and honest labour Ushara, the Godess of Earth, rewards you with a treasure of Pure Earth."}); -- Pure Earth
    table.insert(self.RandomItems, RandomItem:new{["ID"] = 3607, ["Quantity"] = 1, ["Quality"] = 333, ["Data"] = {}, ["Probability"] = tonumber(Probability) / 5, ["MessageDE"] = "Für deine harte und ehrliche Arbeit belohnt dich Eldan, der Gott des Geistes, mit einem Kleinod aus Reinem Geist.", ["MessageEN"] = "For your hard and honest labour Eldan, the God of Spirit, rewards you with a treasure of Pure Spirit."}); -- Pure Spirit
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

    if (self.Treasure > 0) then
        local rand = math.random();
        if(rand < self.Treasure*self.FastActionFactor) and treasure.createMap(User) then
            common.InformNLS(User, self.TreasureMsg[1], self.TreasureMsg[2]);
            return true;
        end
    end

    if (self.Shard > 0) then
        local rand = math.random();
        if(rand < self.Shard*self.FastActionFactor) then
            shard.createShardOnUser(User)
            common.InformNLS(User, self.ShardMsg[1], self.ShardMsg[2]);
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

M.GatheringCraft = GatheringCraft

M.prob_frequently = 0.0005; --0.05% (1/2000)
M.prob_occasionally = 0.00025; --0.025% (1/4000)
M.prob_rarely = 0.0001; --0.01% (1/10000)
M.prob_extremely_rarely = 0.000025; --0.0025% (1/40000)
M.prob_element = 0.0005; --0.05% (1/2000) *Placeholder for now*
M.prob_map = 0.001; --0.1% (1/1000) *Placeholder for now*
M.prob_shard = 0.001; --0.1% (1/1000) *Placeholder for now*

return M
