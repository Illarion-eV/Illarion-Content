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
require("base.common")
require("base.treasure")

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

function GatheringCraft:SetFoodLevel(FoodLevel)
	self.FoodLevel = FoodLevel;
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

-- @return If something was done
function GatheringCraft:FindRandomItem(User)

  if math.random(1,100) == 50 then --why complicated if you can solve it simple... 1% chance for an interruption
    if(table.getn(self.InterruptMsg) > 0) then
      local m = math.random(table.getn(self.InterruptMsg));
      base.common.InformNLS(User, self.InterruptMsg[m][1], self.InterruptMsg[m][2]);
      return true;
    end
  end
  
	base.common.GetHungry(User, self.FoodLevel);
  
  -- FindRandomItem is called when the User is currently working. If there was
  -- a reload, the working time will be nil. Check for this case.
  if (self.SavedWorkTime[User.id] == nil) then
    -- Just generate the work time again. Does not matter really if this is not
    -- exactly the original value.
    self.SavedWorkTime[User.id] = self:GenWorkTime(User,nil);
  end
	
	-- check for Noobia
	if (base.common.IsOnNoobia(User.pos)) then
		return false;
	end
	
	if (self.Treasure > 0) then
		local rand = math.random();
		if(rand < self.Treasure*self.FastActionFactor) and base.treasure.createMap(User) then
			base.common.InformNLS(User, self.TreasureMsg[1], self.TreasureMsg[2]);
			return true;
		end
	end
	
	if (table.getn(self.Monsters) > 0) then
		local ra = math.random(table.getn(self.Monsters));
		local pa = math.random();
		if(pa < self.Monsters[ra].Probability*self.FastActionFactor) then
			local TargetPos = base.common.GetFrontPosition(User);
			world:createMonster(self.Monsters[ra].MonsterID, TargetPos, 20);
			if ( self.Monsters[ra].GFX ~= nil ) then
				world:gfx(self.Monsters[ra].GFX, TargetPos);
			end
			if(self.Monsters[ra].Sound ~= nil) then
				world:makeSound(self.Monsters[ra].Sound, TargetPos);
			end
			base.common.InformNLS(User, self.Monsters[ra].MessageDE, self.Monsters[ra].MessageEN);
			return true;
		end
	end
	
	if(table.getn(self.RandomItems) > 0) then
		
		-- check all items with same random number and choose any possible item again randomly

		local itemIndexList = {};

		-- list all items that are possible
		for it = 1, table.getn(self.RandomItems), 1 do
			local rand = math.random();
			
			if (rand <= self.RandomItems[it].Probability*self.FastActionFactor) then
			
				table.insert(itemIndexList, it);
			
			end
		end
		if ( table.getn(itemIndexList) > 0 ) then -- For the unlikely case that two items were found at once, we just give one to the player
			local ind = itemIndexList[math.random(1,table.getn(itemIndexList))];
			base.common.InformNLS(User, self.RandomItems[ind].MessageDE, self.RandomItems[ind].MessageEN);
			local notCreated = User:createItem(self.RandomItems[ind].ID, self.RandomItems[ind].Quantity, self.RandomItems[ind].Quality, self.RandomItems[ind].Data);
			if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
				world:createItemFromId( self.RandomItems[ind].ID, notCreated, User.pos, true, self.RandomItems[ind].Quality, self.RandomItems[ind].Data );
				base.common.HighInformNLS(User,
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
  local skill  = math.min(100,math.max(0,User:getSkill(self.LeadSkill)));
  local attribName = base.common.GetLeadAttributeName(Skill);  
  local attrib = 5;
  if attribName ~= nil then
    math.min(20,math.max(0,User:increaseAttrib(attribName, 0)));
  end

  --[[ DESCRIPTION
  Assume a gaussian distribution. The mean is determined by the skill.
  The standard deviation is determined by the attribute value.
  The algorithm approximates a skewed gaussian, where the skew linearly 
  depends on the attribute. For attribute==10, there is no skew.
  For attribute<10 the gaussian is skewed in positive direction, 
  for attribute>10 the gaussian is skewed in negative direction.
  The skew is approximated by simply two gaussians with the same mean 
  but with different standard deviations, depending if the sample falls 
  to the left or right of the mean. This decision is just uniformly sampled.
  ]]

  local minTime = 10;
  local maxTime = 50;

  -- apply the quality bonus
  if ( toolItem ~= nil ) then
    local qual = math.min(9,math.max(1,math.floor(toolItem.quality/100))) - 1; -- quality integer in [0,8]
    maxTime = maxTime - maxTime*0.25*(qual/8);
  end

  -- mean of the gaussian is determined by the skill
  local mean = maxTime - (maxTime-minTime)*skill/100;

  local minSdev = (maxTime-minTime)/10;
  local maxSdev = (maxTime-minTime)/5;

  -- decide randomly if time is added or subtracted
  local dir = math.random(0,1)*2-1; -- dir is now element of {-1,1}

  -- scale standard deviation according to attribute value, which should be in [0,20]
  local sdev = (maxSdev-minSdev)*attrib/20;
  if (sdev<0) then
    -- time is subtracted => large sdev is good
    sdev = minSdev + sdev;
  else
    -- time is added => small sdev is good
    sdev = maxSdev - sdev;
  end

  -- draw a sample from a normal distribution
  local workTime = Random.normal(0, sdev)
  -- depending on dir, add or subtract the time
  workTime = mean + dir*math.abs(workTime);
  workTime = math.min(maxTime, math.max(minTime, workTime));

  workTime = workTime*self.FastActionFactor;

  -- clamp at last
  workTime = math.min(maxTime, math.max(5, workTime));

  return math.floor(workTime);
end
