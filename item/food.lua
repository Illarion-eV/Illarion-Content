-- Food script
require("base.common")
require("druid.base.alchemy")

module("item.food", package.seeall)

-- UPDATE common SET com_script='item.food' WHERE com_itemid IN (15,49,73,80,81,142,143,147,151,158,159,160,161,162,163,191,199,200,201,302,303,306,307,353,354,355,388,453,454,455,552,553,554,555,556,557,559,2276,2277,2278,2456,2459,2493,2922,2923,2934,2940,3051);

require("content.furtunecookies")

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
FoodList = { add = function (self,id,Value,Leftover,Diet,RacialDiet,UnEatable,Poison)
				self[id] = {};
				self[id].Value = Value or 0;
				self[id].Leftover = Leftover or 0;
				self[id].Diet = Diet or 0;
				self[id].RacialDiet = RacialDiet or {0,0,0,0,0,0,0,0,0,0};
				self[id].UnEatable = UnEatable or {};
				self[id].Poison = Poison or nil;
			end
};

-- Free Food
FoodList:add(  15,	 2000,	   0,	-20,	{0,0,0,0,0,0,0,20,0,0}); -- apple
FoodList:add(  80,	 3000,	   0,	-30,	{0,0,0,0,0,0,0,30,0,0}); -- banana
FoodList:add(  81,	 1750,	   0,	-18,	{0,0,0,0,0,0,0,18,0,0}); -- berries
FoodList:add( 142,	 1500,	   0,	-15); -- sand berry
FoodList:add( 143,	 1250,	   0,	-13); -- red elder
FoodList:add( 147,	 1500,	   0, -15); -- black berry
FoodList:add( 151,	 1500,	   0,	-15,	{0,0,0,0,0,0,0,15,0,0}); -- strawberries
FoodList:add( 160,	  750,	   0,	 -8); -- redhead
FoodList:add( 161,	 1250,	   0,	-13); -- herders mushroom
FoodList:add( 163,	 1000,	   0,	-10); -- champignon
FoodList:add( 199,	 1000,	   0,	-10,	{0,0,0,0,0,0,0,10,0,0}); -- tangerine
FoodList:add( 200,	 1500,	   0,	-15); -- tomato
FoodList:add( 201,	  750,	   0,	 -8); -- onion
FoodList:add( 302,	 1250,	   0,	-13,	{0,0,0,0,0,0,0,13,0,0}); -- cherry
FoodList:add( 388,	 1750,	   0,	-18,	{0,0,0,0,0,0,0,18,0,0}); -- grapes
FoodList:add(2493,	 2500,	   0,	-25); -- carrots

-- Racial Food (no racial diet necessary)
FoodList:add(  73,	 4000,	   0,	-40,	nil,	{true,true,true,true,true,false,true,true,true,true}); -- trout (lizard)
FoodList:add( 307,	 3000,	   0,	-30,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- pork (orc)
FoodList:add( 355,	 5000,	   0,	-50,	nil,	{true,true,true,true,true,false,true,true,true,true}); -- salmon (lizard)
FoodList:add( 552,	 4500,	   0,	-45,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- deer meat (orc)
FoodList:add( 553,	 3500,	   0,	-35,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- rabbit meat (orc)
FoodList:add(2934,	 4000,	   0,	-40,	nil,	{true,true,true,true,false,true,true,true,true,true}); -- lamb meat (orc)

-- Simple Food
FoodList:add( 306,	 5000,	   0,	-10,	{0,0,0,0,10,0,0,-10,0,0}); -- ham
FoodList:add( 455,	 6000,	   0,	-10,	{0,0,-10,0,0,10,0,-10,0,0}); -- smoked fish

-- Processed Food
FoodList:add(3051,	 4000,	   0,	  0,	{0,0,0,0,5,0,0,-5,0,0}); -- sausage
FoodList:add( 191,	 5000,	   0,	  0,	{0,0,0,0,0,-5,0,0,0,0}); -- bread roll
FoodList:add(2940,	 7000,	   0,	  5,	{0,0,0,0,5,0,0,-5,0,0}); -- steak
FoodList:add(2456,	 8000,	2935,	  7,	{0,0,0,0,-7,0,0,0,0,0}); -- mushroom soup
FoodList:add( 453,	 3500,	   0,	 10,	{0,0,10,0,-10,-10,0,10,0,0}); -- cookies
FoodList:add(2923,	10000,	2935,	 15,	{0,0,0,0,-15,0,0,0,0,0}); -- onion soup
FoodList:add(2459,	12500,	2952,	 20,	{0,0,-20,0,0,20,0,-20,0,0}); -- fish filet dish
FoodList:add(  49,	10000,	   0,	 25,	{0,0,0,0,0,-25,0,0,0,0}); -- bread
FoodList:add(2278,	12500,	2935,	 30,	{0,0,0,0,-30,0,0,0,0,0}); -- cabbage stew
FoodList:add( 556,	15000,	2952,	 35,	{0,0,-35,0,0,35,0,-35,0,0}); -- salmon dish
FoodList:add(2276,	17000,	2935,	 40,	{0,0,0,0,-40,0,0,0,0,0}); -- mulligan
FoodList:add( 454,	 8000,	   0,	 45,	{0,0,45,0,-45,-45,0,45,0,0}); -- muffin
FoodList:add(2277,	20000,	2952,	 50,	{0,0,0,0,50,0,0,-50,0,0}); -- meat dish
FoodList:add( 353,	20000,	   0,	 55,	{0,0,55,0,-55,-55,0,55,0,0}); -- applecake
FoodList:add(2922,	25000,	2952,	 60,	{0,0,0,0,60,0,0,-60,0,0}); -- sausages dish
FoodList:add( 557,	30000,	2952,	 65,	{0,0,0,0,65,0,0,-65,0,0}); -- steak dish
FoodList:add( 303,	30000,	   0,	 70,	{0,0,70,0,-70,-70,0,70,0,0}); -- cherrycake
FoodList:add( 555,	35000,	2952,	 75,	{0,0,0,0,75,0,0,-75,0,0}); -- rabbit dish
FoodList:add( 354,	38000,	   0,	 80,	{0,0,80,0,-80,-80,0,80,0,0}); -- strawberry cake
FoodList:add( 559,	40000,	2952,	 85,	{0,0,0,0,85,0,0,-85,0,0}); -- lamb dish
FoodList:add( 554,	45000,	2952,	 90,	{0,0,0,0,90,0,0,-90,0,0}); -- venison dish

-- Poisoned Food
FoodList:add( 162,	 -300,	   0,	-30,	nil,	nil,	 600); -- birth mushroom
FoodList:add( 158,	 -200,	   0,	-20,	nil,	nil,	 400); -- bulbsponge mushroom
FoodList:add( 159,	 -500,	   0,	-50,	nil,	nil,	1000); -- toadstool

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	-- if the char uses the herb for alchemy, he shouldn't eat it
	if druid.base.alchemy.CheckIfAlchemyPlant and base.common.GetFrontItemID(User) == 1008 then
       return;
    end 
	-- Item not on map!
	if SourceItem.wear == 255 then
		return;
	end
	-- define user's race (+1 for valid table index), non-playable races are set to 10
	local race = math.min(User:getRace()+1, 10);
	-- not eatable for user's race
	if FoodList[SourceItem.id].UnEatable[race] then
		return;
	end
	
	-- user is not fighting
	if not User.attackmode then
		local food = FoodList[ SourceItem.id ];
		
		-- known food item?
		if (food ~= nil ) then
			-- consume food
			local poison = food.Poison;
			local foodLevel = User:increaseAttrib("foodlevel",0);
			-- adjust food value for small races
			local foodVal;
			if ( User:getRace() == 7 ) then                                    -- fairy (food * 1.8)
				foodVal = math.ceil( food.Value * 1.8 )
			elseif ( User:getRace() == 2 ) or ( User:getRace() == 6 ) or ( User:getRace() == 8 ) then    -- halfling or gnome and goblin (food * 1.4)
				foodVal = math.ceil( food.Value * 1.4 )
			else                                                                -- other races
				foodVal = food.Value;
			end
			foodLevel = foodLevel + foodVal;
			
			local domMalus = 0;
			if not poison then
				-- if ate too much, domMalus is negative. See diet system below for more.
				-- grant a buffer of half of the actual food value
				domMalus = ((60000 + (0.5*foodVal) - foodLevel) / 60000);
			else
				-- set poison value
				User:setPoisonValue( base.common.Limit( (User:getPoisonValue() + poison) , 0, 10000) );
				--User:increasePoisonValue(poison);
			end
			
			world:erase(SourceItem,1);
			
			-- create leftovers
			if( food.Leftover > 0 ) then
				if( math.random( 50 ) <= 1 ) then
					base.common.InformNLS( User, "Das alte Geschirr ist nicht mehr brauchbar.", "The old dishes are no longer usable.");
				else
					User:createItem( food.Leftover, 1, 333,0);
				end
			end
			-- inform the player
			if poison then
				base.common.InformNLS(User,
				"Du fühlst dich krank und etwas benommen.",
				"You feel sick and a little dizzy.");
			elseif (domMalus < 0) then
				base.common.InformNLS( User,
				"Du bekommst kaum noch was runter und dir wird schlecht. Dies schadet sicherlich deinem Körper.",
				"You hardly manage to eat something more and get sick! This surely harms your body.");
				-- check for newbie state
				if not (User:getQuestProgress(2) > 0) and not (User:increaseAttrib("hitpoints",0) < 2000) then
					User:increaseAttrib("hitpoints",-1000);
				end
				foodLevel = foodLevel - 10000;
			elseif  (foodLevel > 55000) then
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
			-- Glückskeks!
			--
			if (SourceItem.id == 453) then
                if (math.random(1,100)==1) then
                    local deText, enText = content.furtunecookies.cookie();
                    base.common.InformNLS( User,
                    "Du findest ein Stück Papier in dem Keks: \""..deText.."\"",
                    "You find a piece of paper inside the cookie: \""..enText.."\"");
                end
            end
			-- refill user's food level
			foodLevel = math.max(0,math.min(60000,foodLevel));
			local FoodToAdd = foodLevel - User:increaseAttrib("foodlevel",0);
			while true do
				User:increaseAttrib("foodlevel",math.min(10000,FoodToAdd));
				FoodToAdd = FoodToAdd - math.min(10000,FoodToAdd);
				if (FoodToAdd == 0) then
					break;
				end
			end
			
			---------- diet system ----------
			local foundEffect,dietEffect=User.effects:find(12);
			local found1, found2, dom, constModOld;
			-- check for diet LTE
			if not foundEffect then
				dietEffect=LongTimeEffect(12,2147483640);
				User.effects:addEffect(dietEffect);
				found1 = true;
				found2 = true;
				dom    = 0;
				constModOld = 0;
			else
				found1,dom = dietEffect:findValue("dom");
				found2,constModOld = dietEffect:findValue("constMod");
			end
			-- if something's missing, restore as good as possible
			if not found1 or not found2 then
				if found1 then
					if dom < 2500 then
						constModOld = 0;
					elseif dom < 7500 then
						constModOld = 1;
					else
						constModOld = 2;
					end
				elseif found2 then
					if constModOld <= 0 then
						dom = 0;
					elseif constModOld == 1 then
						dom = 2500;
					else
						dom = 7500;
					end
				else
					User:inform("Error: Diet values not found. Reset to 0");
					dom = 0;
					constModOld = 0;
				end
			end
			
			local domRange, foodMod, dietMod, dietType;
			if (dom<=2500) then domRange=0 end
			if (dom>2500 and dom<7500) then domRange=1 end
			if (dom>=7500) then domRange=2 end
			foodMod=food.Value/60000;

			dietMod = food.Diet + food.RacialDiet[race];

			if dietMod>=0 then
				if math.random(50)<=dietMod then
					dietType=2;
					if dietMod < 50 then
						dietMod = (dietMod + 75)/2;
					end
					dietMod=dietMod/100;
				else
					dietType=1;
					dietMod=(dietMod+50)/100;
				end
			else
				dietType=0;
				dietMod=(dietMod-50)/-100;
			end

			-- calculate DoM Modifier according to diet type and current DoM
			local domMod;
			if (dietType==0) then											-- Free Food
				if (domRange==0) then domMod=math.ceil(foodMod*dietMod*-115)
				elseif (domRange==1) then domMod=math.ceil(foodMod*dietMod*-350)
				elseif (domRange==2) then domMod=math.ceil(foodMod*dietMod*-700)
				end
			elseif (dietType==1) then										-- Cooked Food
				if (domRange==0) then domMod=math.ceil(foodMod*dietMod*350)
				elseif (domRange==2) then domMod=math.ceil(foodMod/dietMod*-350)
				elseif (dom<5000) then domMod=math.ceil(foodMod*dietMod*115)
				elseif (dom>5000) then domMod=math.ceil(foodMod*dietMod*-115)
				else domMod=0
				end
			elseif (dietType==2) then										-- High Quality Food
				if (domRange==0) then domMod=math.ceil(foodMod*dietMod*700)
				elseif (domRange==1) then domMod=math.ceil(foodMod*dietMod*350)
				elseif (domRange==2) then domMod=math.ceil(foodMod*dietMod*115)
				end
			else
				User:inform("Error: Unknown diet type. Please report bug.");
				return;
			end

			-- if ate too much, decrease surely the dom
			if (domMalus<0) then
				domMod = math.min(0,domMod) + math.ceil(domMalus*350);
			end

			dom=dom+domMod;

			dom = math.max( 0, math.min( 10000, dom ) );
			constModOld = math.max(0, math.min(constModOld, 2));
			local constMod = constModOld;
			if (dom>=0 and dom<2500) then
				constMod=0;
				if (constModOld < constMod) then
					base.common.InformNLS(User,
					"Durch deine ausgewogene Ernährung erlangt dein Körper seine gewohnte Verfassung wieder.",
					"Due to your balanced diet your body regains its usual condition.");
				elseif (constModOld > constMod) then
					base.common.InformNLS(User,
					"Durch deine nur gewöhnliche Ernährung kann dein Körper seine gute Verfassung nicht halten.",
					"Due to your commoners' diet your body cannot retain its good condition.");
				end
			elseif (dom>=2500 and dom<7500) then
				constMod=1;
				if (constModOld < constMod) then
					base.common.InformNLS(User,
					"Durch deine großartige Ernährung erlangt dein Körper eine gute Verfassung.",
					"Due to your great diet your body gains a good condition.");
				elseif (constModOld > constMod) then
					base.common.InformNLS(User,
					"Da du deine Ernährung etwas vernachlässigt hast, kann dein Körper seine großartige Verfassung nicht halten.",
					"As you have slightly neglected your dietary choices, your body can't retain its great condition.");
				end
			elseif (dom>=7500 and dom<=10000) then
				constMod=2;
				if (constModOld < constMod) then
					base.common.InformNLS(User,
					"Durch deine perfekte Ernährung erlangt dein Körper eine großartige Verfassung.",
					"Due to your perfect diet your body gains a great condition.");
				end
			else
				User:inform("Error: DoM not in range. Please report bug. Set to normal value again.");
				dom = 0;
			end
			if constModOld ~= constMod then
				User:setAttrib("constitution",User:increaseAttrib("constitution",0)+(constMod-constModOld));
				if (User:increaseAttrib("constitution",0)<1) then
					User:setAttrib("constitution",1);
				end
			end
			dietEffect:addValue("constMod",constMod);
			dietEffect:addValue("dom",dom);
			-------- end diet system --------
		else
			User:inform("unknown food item ");
		end
	else
		base.common.InformNLS( User,
			"Du kannst nicht während eines Kampfes essen.",
			"You cannot eat during a fight.");
	end
end
