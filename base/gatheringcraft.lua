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
local treasure = require("base.treasure")

local M = {}

M.RandomItem = {
	ID = 0,
    Quantity = 1,
    Quality = 333,
    Data = {},
	Probability = 0,
    MessageDE = nil,
	MessageEN = nil,
};

M.GatheringCraft = {
	RandomItems = { },
	InterruptMsg = { },
	Monsters = { },
	LeadSkill = 0,
	SavedWorkTime = { },
	Treasure = 0,
	TreasureMsg = { },
	FoodLevel = 100,
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

function M.GatheringCraft:new(gc)
    gc = gc or {};
    setmetatable(gc, self);
    self.__index = self;
	gc.RandomItems = {};
	gc.InterruptMsg = {};
	gc.Monsters = {};
	gc.TreasureMsg = {};
    return gc;
end

function M.RandomItem:new(item)
	item = item or {};
	setmetatable(item, self);
	self.__index = self;
	return item;
end

function M.Monster:new(m)
	m = m or {};
	setmetatable(m, self);
	self.__index = self;
	return m;
end

function M.GatheringCraft:SetFoodLevel(FoodLevel)
	self.FoodLevel = FoodLevel;
end

function M.GatheringCraft:SetTreasureMap(Probability, MessageDE, MessageEN)
	self.Treasure = Probability;
	self.TreasureMsg[1] = MessageDE;
	self.TreasureMsg[2] = MessageEN;
end

function M.GatheringCraft:AddInterruptMessage(MessageDE, MessageEN)
	table.insert(self.InterruptMsg, { MessageDE, MessageEN });
	return;
end

function M.GatheringCraft:AddMonster(MonsterID, Probability, MessageDE, MessageEN, Sound, GFX)
	table.insert(self.Monsters, Monster:new{["MonsterID"] = MonsterID, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN, ["Sound"] = Sound, ["GFX"] = GFX});
	return;
end

function M.GatheringCraft:AddRandomItem(ItemID, Quantity, Quality, Data, Probability, MessageDE, MessageEN)
	table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["Probability"] = Probability, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN});
	return;
end

-- @return If something was done
function GatheringCraft:FindRandomItem(User)
--[[Deactivate the call of interrupting messages.
  if math.random(1,100) == 50 then --why complicated if you can solve it simple... 1% chance for an interruption
    if(#self.InterruptMsg > 0) then
      local m = math.random(#self.InterruptMsg);
      common.InformNLS(User, self.InterruptMsg[m][1], self.InterruptMsg[m][2]);
      return true;
    end
  end
--]]

	common.GetHungry(User, self.FoodLevel);

  -- FindRandomItem is called when the User is currently working. If there was
  -- a reload, the working time will be nil. Check for this case.
  if (self.SavedWorkTime[User.id] == nil) then
    -- Just generate the work time again. Does not matter really if this is not
    -- exactly the original value.
    self.SavedWorkTime[User.id] = self:GenWorkTime(User,nil);
  end

	-- check for Noobia
	if (common.IsOnNoobia(User.pos)) then
		return false;
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
			local TargetPos = common.getFreePos(User.pos, 1)
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
			local notCreated = User:createItem(self.RandomItems[ind].ID, self.RandomItems[ind].Quantity, self.RandomItems[ind].Quality, self.RandomItems[ind].Data);
			if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
				world:createItemFromId( self.RandomItems[ind].ID, notCreated, User.pos, true, self.RandomItems[ind].Quality, self.RandomItems[ind].Data );
				common.HighInformNLS(User,
				"Du kannst nichts mehr halten.",
				"You can't carry any more.");
			end
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

  workTime = workTime*self.FastActionFactor; --for fast actions.

  return math.ceil(workTime);
end
