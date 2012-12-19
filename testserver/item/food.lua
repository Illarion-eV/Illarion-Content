-- Food script
require("base.common")


module("item.food", package.seeall)

-- UPDATE common SET com_script='item.food' WHERE com_itemid IN (15,49,73,80,81,142,143,147,151,158,159,160,161,162,163,191,199,200,201,302,303,306,307,353,354,355,388,453,454,455,552,553,554,555,556,557,559,2276,2277,2278,2456,2459,2493,2922,2923,2934,2940,3051);

require("content.furtunecookies")
require("alchemy.base.alchemy")
require("alchemy.base.herbs")
require("content.craft.baking")
require("content.craft.cooking")

-- buff types, they have exactly two attributes
BUFFS = {
  {"constitution", "strength"},
  {"agility", "dexterity"}
};

-- this is updated while adding food items
MAX_DIFFICULTY = 0;

MIN_CRAFTED_FOODVALUE = 5000;
MAX_CRAFTED_FOODVALUE = 45000;

VALUE_SMALL = 0.25;
VALUE_LARGE = 0.5

--[[ create FoodList
FoodList:add() adds an element
  @param integer - item ID
  @param integer - food value
  @param integer - leftover item id
  @param integer - common diet value
  @param table{ 10 integer } - racial diet value which is added to the common
  @param table{ 10 boolean } - if not eatable for each race. Do not set it if eatable for all
  @param integer - poison value OR nil if no poison at all

--
if parameter is nil the default values are chosen.
the racial tables have the following struct (in order of the race numbers):
{ human, dwarf, halfling, elf, orc, lizardman, gnome, fairy, goblin, *all others* }
]]
FoodList = { add = function (self,id,Value,Leftover,BuffType,RacialFactor,UnEatable,Poison)
				self[id] = {};
				self[id].value = Value or VALUE_LARGE;
				self[id].leftover = Leftover or 0;
        self[id].buffType = BuffType;
				self[id].difficulty = nil;
				self[id].racialFactor = racialFactor or {1,1,1,1,1,1,1,1,1,1};
				self[id].unEatable = UnEatable or {};
				self[id].poison = Poison;
			end
};

-- Free Food
FoodList:add(  15,	 VALUE_LARGE,	   0); -- apple
FoodList:add(  80,	 VALUE_LARGE,	   0); -- banana
FoodList:add(  81,	 VALUE_SMALL,	   0); -- berries
FoodList:add( 142,	 VALUE_SMALL,	   0); -- sand berry
FoodList:add( 143,	 VALUE_SMALL,	   0); -- red elder
FoodList:add( 147,	 VALUE_SMALL,	   0); -- black berry
FoodList:add( 151,	 VALUE_SMALL,	   0); -- strawberries
FoodList:add( 160,	 VALUE_SMALL,	   0); -- redhead
FoodList:add( 161,	 VALUE_SMALL,	   0); -- herders mushroom
FoodList:add( 163,	 VALUE_SMALL,	   0); -- champignon
FoodList:add( 199,	 VALUE_SMALL,	   0); -- tangerine
FoodList:add( 200,	 VALUE_SMALL,	   0); -- tomato
FoodList:add( 201,	 VALUE_SMALL,	   0); -- onion
FoodList:add( 302,	 VALUE_SMALL,	   0); -- cherry
FoodList:add( 388,	 VALUE_SMALL,	   0); -- grapes
FoodList:add( 759,	 VALUE_LARGE,	   0); -- nuts
FoodList:add(2493,	 VALUE_LARGE,	   0); -- carrots

-- Racial Food
FoodList:add(  73,	 VALUE_LARGE,	   0,	nil,	nil,	{true,true,true,true,true,false,true,true,true,true}); -- trout (lizard)
FoodList:add( 307,	 VALUE_LARGE,	   0,	nil,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- pork (orc)
FoodList:add( 355,	 VALUE_LARGE,	   0,	nil,	nil,	{true,true,true,true,true,false,true,true,true,true}); -- salmon (lizard)
FoodList:add( 552,	 VALUE_LARGE,	   0,	nil,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- deer meat (orc)
FoodList:add( 553,	 VALUE_LARGE,	   0,	nil,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- rabbit meat (orc)
FoodList:add(2934,	 VALUE_LARGE,	   0,	nil,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- lamb meat (orc)

-- Simple Food
FoodList:add( 306,	 VALUE_LARGE,	   0); -- ham
FoodList:add( 455,	 VALUE_LARGE,	   0); -- smoked fish

-- Crafted Food
FoodList:add(3051,	nil,	   0,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- sausage
FoodList:add( 191,	nil,	   0,	 1,	{1,1,1,1,1,0.5,1,1,1,1}); -- bread roll
FoodList:add(2940,	nil,	   0,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- steak
FoodList:add(2456,	nil,	2935,	 2,	{1,1,1,1,0.5,1,1,1,1,1}); -- mushroom soup
FoodList:add( 453,	nil,	   0,	 2,	{1,1,2,1,0.5,0.5,1,2,1,1}); -- cookies
FoodList:add(2923,	nil,	2935,	 2,	{1,1,1,1,0.5,1,1,1,1,1}); -- onion soup
FoodList:add(2459,	nil,	2952,	 1,	{1,1,0.5,1,1,2,1,0.5,1,1}); -- fish filet dish
FoodList:add(  49,	nil,	   0,	 1,	{1,1,1,1,1,0.5,1,1,1,1}); -- bread
FoodList:add(2278,	nil,	2935,	 2,	{1,1,1,1,0.5,1,1,1,1,1}); -- cabbage stew
FoodList:add( 556,	nil,	2952,	 1,	{1,1,0.5,1,1,2,1,0.5,1,1}); -- salmon dish
FoodList:add(2276,	nil,	2935,	 2,	{1,1,1,1,0.5,1,1,1,1,1}); -- mulligan
FoodList:add( 454,	nil,	   0,	 2,	{1,1,2,1,0.5,0.5,1,2,1,1}); -- muffin
FoodList:add(2277,	nil,	2952,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- meat dish
FoodList:add( 353,	nil,	   0,	 2,	{1,1,2,1,0.5,0.5,1,2,1,1}); -- applecake
FoodList:add(2922,	nil,	2952,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- sausages dish
FoodList:add( 557,	nil,	2952,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- steak dish
FoodList:add( 303,	nil,	   0,	 2,	{1,1,2,1,0.5,0.5,1,2,1,1}); -- cherrycake
FoodList:add( 555,	nil,	2952,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- rabbit dish
FoodList:add( 354,	nil,	   0,	 2,	{1,1,2,1,0.5,0.5,1,2,1,1}); -- strawberry cake
FoodList:add( 559,	nil,	2952,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- lamb dish
FoodList:add( 554,	nil,	2952,	 1,	{1,1,1,1,2,1,1,0.5,1,1}); -- venison dish

-- Poisoned Food
FoodList:add( 162,	 VALUE_SMALL,	   0,	nil,	nil,	nil,	 600); -- birth mushroom
FoodList:add( 158,	 VALUE_SMALL,	   0,	nil,	nil,	nil,	 400); -- bulbsponge mushroom
FoodList:add( 159,	 VALUE_SMALL,	   0,	nil,	nil,	nil,	1000); -- toadstool

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	if (Init == nil) then
    Init = 1;
    -- import difficulties from crafts
    for _,product in pairs(content.craft.baking.baking.products) do 
      if (FoodList[product.item] ~= nil) then
        FoodList[product.item].difficulty = product.difficulty;
        MAX_DIFFICULTY = math.max(MAX_DIFFICULTY, product.difficulty);
      end
    end
    for _,product in pairs(content.craft.cooking.cooking.products) do 
      if (FoodList[product.item] ~= nil) then
        FoodList[product.item].difficulty = product.difficulty;
        MAX_DIFFICULTY = math.max(MAX_DIFFICULTY, product.difficulty);
      end
    end
    -- now we now the max difficulty, so set the food value with linear distribution
    local diff = MAX_CRAFTED_FOODVALUE - MIN_CRAFTED_FOODVALUE;
    local halfMin = MIN_CRAFTED_FOODVALUE/2;
    for _,food in pairs(FoodList) do 
      if (food.difficulty ~= nil) then
        food.value = MIN_CRAFTED_FOODVALUE + diff*(food.difficulty/MAX_DIFFICULTY);
      else
        -- for non crafted foods, the maximum foodvalue is half the MIN_CRAFTED_FOODVALUE
        food.value = math.min(halfMin, food.value);
      end
    end
  end
	-- check if used for alchemy purpose
	local isPlant, ignoreIt = alchemy.base.alchemy.getPlantSubstance(SourceItem.id, User)
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User,SourceItem)
	if (cauldron ~= nil) and isPlant then
	    alchemy.base.herbs.UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )
		return
	end	
	
	-- item should not be static
	if SourceItem.wear == 255 then
    base.common.HighInformNLS(User,
    "Das kannst du nicht essen.",
    "You can't eat that.");
		return;
	end
  
  local food = FoodList[ SourceItem.id ];
  -- known food item?
  if (food == nil ) then
    User:inform("[ERROR] unknown food item. ID: " .. SourceItem.id .. ". Please inform a developer.");
    return; 
  end
	-- define user's race (+1 for valid table index), non-playable races are set to 10
	local race = math.min(User:getRace()+1, 10);
	-- not eatable for user's race
	if food.unEatable[race] then
    base.common.HighInformNLS(User,
    "Das kannst du nicht essen.",
    "You can't eat that.");
		return;
	end
	-- user should not fight
	if User.attackmode then
    base.common.HighInformNLS( User,
    "Du kannst nicht während eines Kampfes essen.",
    "You cannot eat during a fight.");
    return;
  end
  
  -- fortune cookies
  if (SourceItem.id == 453) then
    if (math.random(1,100)==1) then
      local deText, enText = content.furtunecookies.cookie();
      base.common.InformNLS( User,
      "Du findest ein Stück Papier in dem Keks: \""..deText.."\"",
      "You find a piece of paper inside the cookie: \""..enText.."\"");
    end
  end
  
  -- consume food
  world:erase(SourceItem,1);
  local foodLevel = User:increaseAttrib("foodlevel",0);
  -- adjust food value for small races
  local foodVal;
  if ( User:getRace() == 7 ) then                                    -- fairy (food * 1.8)
    foodVal = math.ceil( food.value * 1.8 )
  elseif ( User:getRace() == 2 ) or ( User:getRace() == 6 ) or ( User:getRace() == 8 ) then    -- halfling or gnome and goblin (food * 1.4)
    foodVal = math.ceil( food.value * 1.4 )
  else                                                                -- other races
    foodVal = food.value;
  end
  
  -- create leftovers
  if( food.leftover > 0 ) then
    if( math.random( 50 ) <= 1 ) then
      base.common.HighInformNLS( User, "Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.");
    else
      User:createItem( food.leftover, 1, 333, nil);
    end
  end
  
  -- check for poison
  local poison = food.poison;
  if (poison ~= nil) then
    User:setPoisonValue( base.common.Limit( (User:getPoisonValue() + poison) , 0, 10000) );
    base.common.HighInformNLS(User,
    "Du fühlst dich krank und etwas benommen.",
    "You feel sick and a little dizzy.");
    SetNewFoodLevel(User, foodLevel-foodVal);
    return;
  end
  
  foodLevel = foodLevel + foodVal;
  -- check if ate too much. Grant a buffer of half of the actual food value 
  if (60000 + (0.5*foodVal) - foodLevel < 0) then
    base.common.HighInformNLS( User,
    "Du bekommst kaum noch was runter und dir wird schlecht.",
    "You hardly manage to eat something more and get sick!");
    -- check for newbie state
    if (not base.common.IsOnNoobia(User.pos) and not (User:increaseAttrib("hitpoints",0) < 2000)) then
      User:increaseAttrib("hitpoints",-1000);
    end
    SetNewFoodLevel(User, 50000);
    return;
  end
  
  -- inform the player about the food level
  if  (foodLevel > 55000) then
    base.common.InformNLS( User,
    "Nur mit Mühe kannst du dir noch etwas hinunter zwingen.",
    "You hardly manage to eat something more.");
  elseif  (foodLevel > 50000) then
    base.common.InformNLS( User,
    "Du bist sehr satt.",
    "You have had enough.");
  elseif  (foodLevel > 40000) then
    base.common.InformNLS( User,
    "Du bist satt.",
    "You are stuffed.");
  elseif  (foodLevel > 30000) then
    base.common.InformNLS( User,
    "Du fühlst dich noch etwas hungrig.",
    "You still feel a little hungry.");
  elseif  (foodLevel > 20000) then
    base.common.InformNLS( User,
    "Du hast noch immer Hunger.",
    "You are still hungry.");
  elseif  (foodLevel > 5000) then
    base.common.InformNLS( User,
    "Dein Magen schmerzt noch immer vor Hunger.",
    "Your stomach still hurts because of your hunger.");
  end
  
  -- check for buffs
  if (food.buffType ~= nil) then
    debug("check buff");
    -- calculate how long the buff will last, at least 5min, maximal 30min
    local newDuration = 3000;
    -- add 5 more minutes each in 5 more random experiments
    for i=1,5 do 
      -- grant even easy craftable items a good chance by adding 5
      if (math.random(1,105) <= food.difficulty+5) then
        newDuration = newDuration + 3000;
      end
    end
    -- determine number of increased attributes
    local newBuffAmount = 1;
    if (math.random(1,105) <= food.difficulty+5) then
      newBuffAmount = 2;
    end
    debug("diff " .. food.difficulty .. ", newDuration " .. newDuration .. ", newBuffAmount " .. newBuffAmount);
    -- add buff, if it is better than the previous one
    local newIsBetter = true;
    local foundEffect,dietEffect=User.effects:find(12);
    if (foundEffect) then
      debug("found dietEffect");
      local foundType, buffType = dietEffect:findValue("buffType");
      if (foundType) then
        local foundAmount, buffAmount = dietEffect:findValue("buffAmount");
        if (foundAmount) then
          -- check if old one is better
          debug("oldAmount " .. buffAmount .. ", old nextCalled " .. dietEffect.nextCalled);
          if (buffAmount > newBuffAmount or (buffAmount == newBuffAmount and dietEffect.nextCalled > newDuration)) then
            debug("old is better");
            newIsBetter = false;
          end
        else
          User:inform("[ERROR] Found diet effect without buffAmount. Adding new buff. Please inform a developer.");
        end
      else
        User:inform("[ERROR] Found diet effect without buffType. Adding new buff. Please inform a developer.");
      end
    end
    if (newIsBetter) then
      dietEffect=LongTimeEffect(12, duration);
      dietEffect:addValue("buffType", food.buffType);
      dietEffect:addValue("buffAmount", newBuffAmount);
      User.effects:addEffect(dietEffect);
    end
  end
end

function SetNewFoodLevel(User, NewFoodLevel)
  NewFoodLevel = base.common.Limit(NewFoodLevel, 0, 60000);
  local foodToAdd = NewFoodLevel - User:increaseAttrib("foodlevel",0);
  while true do
    User:increaseAttrib("foodlevel",math.min(10000,foodToAdd));
    foodToAdd = foodToAdd - math.min(10000,foodToAdd);
    if (foodToAdd == 0) then
      break;
    end
  end
end