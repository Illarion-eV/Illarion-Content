require("base.common")
require("base.treasure")

module("base.gatheringcraft", package.seeall)

RandomItem = {
	ID = 0,
    Quantity = 1,
    Quality = 333,
    Data = 0,
	MinProb = 0,
	MaxProb = 0,
    MessageDE = nil,
	MessageEN = nil,
};

GatheringCraft = {
	RandomItems = { },
	InterruptMsg = { },
	Monsters = { },
	LeadAttribute = "",
	LeadSkill = "",
	LeadSkillGroup = 2,
	SavedWorkTime = { },
	Treasure = 0,
	TreasureMsg = { },
	FoodLevel = 100
};

Monster = {
	MonsterID = 0,
	Probability = 100,
	MessageDE = "",
	MessageEN = "",
	Sound = nil,
	GFX = {}
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
	self.Treasure = Probability * 1000;
	self.TreasureMsg[1] = MessageDE;
	self.TreasureMsg[2] = MessageEN;
end

function GatheringCraft:AddRandomItem(ItemID, Quantity, Quality, Data, Probability)
	local minr;
	local maxr;
	if(table.maxn(self.RandomItems) > 0) then
		minr = self.RandomItems[table.maxn(self.RandomItems)].MaxProb;
		maxr = minr + Probability * 1000;
	else
		minr = 0;
		maxr = Probability * 1000;
	end
	table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["MinProb"] = minr, ["MaxProb"] = maxr});
	return;
end

function GatheringCraft:AddInterruptMessage(MessageDE, MessageEN)
	table.insert(self.InterruptMsg, { MessageDE, MessageEN });
	return;
end

function GatheringCraft:AddMonster(MonsterID, Probability, MessageDE, MessageEN, Sound, GFX)
	table.insert(self.Monsters, Monster:new{["MonsterID"] = MonsterID, ["Probability"] = (Probability * 100), ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN, ["Sound"] = Sound, ["GFX"] = GFX});
	return;
end

function GatheringCraft:AddSpecialRandomItem(ItemID, Quantity, Quality, Data, Probability, MessageDE, MessageEN)
	local minr;
	local maxr;
	if(table.maxn(self.RandomItems) > 0) then
		minr = self.RandomItems[table.maxn(self.RandomItems)].MaxProb;
		maxr = minr + Probability * 1000;
	else
		minr = 0;
		maxr = Probability * 1000;
	end
	table.insert(self.RandomItems, RandomItem:new{["ID"] = ItemID, ["Quantity"] = Quantity, ["Quality"] = Quality, ["Data"] = Data, ["MinProb"] = minr, ["MaxProb"] = maxr, ["MessageDE"] = MessageDE, ["MessageEN"] = MessageEN});
	return;
end

function GatheringCraft:FindRandomItem(User)
    if base.common.IsInterrupted(User) then
		if(table.maxn(self.InterruptMsg) > 0) then
			local m = math.random(table.maxn(self.InterruptMsg));
			base.common.InformNLS(User, self.InterruptMsg[m][1], self.InterruptMsg[m][2]);
			return false
		end
    end
	if not base.common.FitForWork(User) then
		return false
	end
	base.common.GetHungry(User, self.FoodLevel);
	
	-- Deactivated on Noobia
	if (User.pos.z == 100) or (User.pos.z == 101) then
		return true
	end
	
	if (self.Treasure > 0) then
		local rand = math.random(10000);
		if(rand < self.Treasure) and base.treasure.createMap(User) then
			base.common.InformNLS(User, self.TreasureMsg[1], self.TreasureMsg[2]);
			return false
		end
	end
	
	if (table.maxn(self.Monsters) > 0) then
		local ra = math.random(table.maxn(self.Monsters));
		local pa = math.random(10000);
		if(pa < self.Monsters[ra].Probability) then
			local TargetPos = base.common.GetFrontPosition(User);
			world:createMonster(self.Monsters[ra].MonsterID, TargetPos, 20);
			for g = 0, table.maxn(self.Monsters[ra].GFX), 1 do
				world:gfx(self.Monsters[ra].GFX[g], TargetPos);
			end
			if(self.Monsters[ra].Sound ~= nil) then
				world:makeSound(self.Monsters[ra].Sound, TargetPos);
			end
			base.common.InformNLS(User, self.Monsters[ra].MessageDE, self.Monsters[ra].MessageEN);
			return false
		end
	end
	
	if(table.maxn(self.RandomItems) > 0) then
		local p = math.random(100000);
		for it = 1, table.maxn(self.RandomItems), 1 do
			if(p >= self.RandomItems[it].MinProb and p <= self.RandomItems[it].MaxProb) then
				if (self.RandomItems[it].MessageDE ~= nil) and (self.RandomItems[it].MessageEN ~= nil) then
					base.common.InformNLS(User, self.RandomItems[it].MessageDE, self.RandomItems[it].MessageEN);
				end
				local notcreated = User:createItem(self.RandomItems[it].ID, self.RandomItems[it].Quantity, self.RandomItems[it].Quality, self.RandomItems[it].Data);
				if(notcreated > 0) then
					world:createItemFromId(self.RandomItems[it].ID, notcreated, User.pos, true, self.RandomItems[it].Quality, self.RandomItems[it].Data);
					base.common.InformNLS(User, "Du kannst nichts mehr halten!", "You can't carry anymore!");
					return false
				end
			end
		end
	end
	return true
end

-- Arbeitszeit Generieren
function GatheringCraft:GenWorkTime(User, toolItem, fastAction)
    local skill  = User:getSkill(self.LeadSkill);
    local attrib = User:increaseAttrib(self.LeadAttrib, 0);
    
    local skillBonus=0;
	local timeBonus=0;
    if(toolItem ~= nil) then
		local gem1, str1, gem2, str2=base.common.GetBonusFromTool(toolItem);
		if gem1==3 then     -- ruby modifies skill!
			skillBonus=str1;
		end
		if gem2==3 then
			skillBonus=skillBonus+str2;
		end
		if gem1==6 then     -- amethyst modifies time needed
			timeBonus=str1;
		end
		if gem2==6 then
			timeBonus=timeBonus+str2;
		end
	end
    -- gem boni should range in [0,1]
	-- currently: linear distribution
	-- current max (2 gems, lvl 10): 20
	skillBonus = math.min(20,skillBonus) / 20;
	timeBonus = math.min(20,timeBonus) / 20;
    
    local maxTime = 80; -- without random
    local minTime = 10; -- without random
    local randomChange = 5; -- randomly change result by a value between -5 and +5
    local timeNoAttribFullSkill = 50;
    
    -- skill should not exceed 100
    local skillMultiplier = math.min(100,skill);
    -- add skill according to bonus
    skillMultiplier = skillMultiplier + skillBonus*(100-skillMultiplier);
    -- skillMultiplier is now in range of [0,1]
    skillMultiplier = math.min(100,skillMultiplier) / 100;
    
    -- basically the best, so the minimum, time that can be achieved with maximum skill
    -- a maximum attribute value of 25 is assumed
    local retValue = timeNoAttribFullSkill - (timeNoAttribFullSkill - minTime) * math.min(25,attrib) / 25;
    -- modulate best achievable time with skillMultiplier
    retValue = math.max(minTime, maxTime - (maxTime-retValue) * skillMultiplier);
    
    -- fill the remaining time if there is a time bonus
    retValue = math.max(minTime, retValue - ( (retValue-minTime)*timeBonus ) );
    
    -- add/subtract random change
    retValue = retValue + math.random(0,randomChange*2) - randomChange;
    
    if fastAction then
        retVal = math.ceil(retVal/3);
    end
    return retValue;
    
    
    --[[ alternative algorithm
	local skillBonus=0;
	local timeBonus=0;
	if(toolItem ~= nil) then
		local gem1, str1, gem2, str2=base.common.GetBonusFromTool(toolItem);
		if gem1==3 then     -- ruby modifies skill!
			skillBonus=str1;
		end
		if gem2==3 then
			skillBonus=skillBonus+str2;
		end
		if gem1==6 then     -- amethyst modifies time needed
			timeBonus=str1;
		end
		if gem2==6 then
			timeBonus=timeBonus+str2;
		end
	end
	-- gem boni should range in [0,1]
	-- currently: linear distribution
	-- current max (2 gems, lvl 10): 20
	skillBonus = skillBonus / 20;
	timeBonus = timeBonus / 20;
	
	-- time (1/10s):
    local maxSkillTime = 100;
    local maxAttribTime = 30;
    
    local randomChange = 5;
    
    local minAll = 5;
    local maxAll = minAll + maxSkillTime + maxAttribTime + 2*randomChange;
    
    local maxSkillBonus = 50;
    local maxTimeBonus = (maxSkillTime + maxAttribTime)/2;
    
    -- add skill bonus from gem
    skill = skill + maxSkillBonus*skillBonus;
    -- clamp skill
	skill = math.max(0, math.min(100, skill));
    -- clamp attrib
    local bestAttrib = 30;
    attrib = math.max(0, math.min(bestAttrib, attrib));
    
    -- init with min value
    local retVal = minAll + randomChange;
    -- add skill time
    retVal = retVal + maxSkillTime*(100-skill)/100;
    -- add attrib time
    retVal = retVal + maxAttribTime*(bestAttrib-attrib)/bestAttrib;
    -- subtract time bonus from gem
    retVal = retVal - maxTimeBonus*timeBonus;
    -- limit to overall boundaries without random change
    retVal = math.max(minAll+randomChange, math.min(retVal, maxAll-randomChange));
    -- add random change
    retVal = retVal + math.random(0,randomChange*2) - randomChange;
    -- limit to overall boundaries
    retVal = math.floor(math.max(minAll, math.min(maxAll, retVal)));
    
    if fastAction then
        retVal = math.ceil(retVal/3);
    end
	return retVal;
	]]
    
	-- -- old algorithm
	-- if(toolItem ~= nil) then
		-- gem1, str1, gem2, str2=base.common.GetBonusFromTool(toolItem);
		-- local step=0;
		-- if gem1==3 then     -- ruby modifies skill!
			-- step=str1;
		-- end
		-- if gem2==3 then
			-- step=step+str2;
		-- end
		-- Skill=Skill+step;
		-- step=0;
		-- if gem1==6 then     -- amethyst modifies time needed
			-- step=str1;
		-- end
		-- if gem2==6 then
			-- step=step+str2;
		-- end
		-- step=step*1.75;
		-- return math.floor( (( -0.2 * ((skill * 1.2)+attrib) + 50) + math.random(0,40))*(100-step)/100);
	-- else
		-- return math.floor( -0.4 * ((skill * 1.2)+attrib) + 70);
	-- end 
end
