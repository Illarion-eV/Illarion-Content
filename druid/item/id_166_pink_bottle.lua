-- Druidsystem: potion

require("base.common")
require("druid.base.alchemy")
require("base.character")

module("druid.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='druid.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000         ,50000      ,10000          ,7000  ,7000    ,10000        ,50000        ,7000}
attribList ={"hitpointsOT","foodlevel","poisonvalueOT","mana","manaOT","poisonvalue","foodlevelOT","hitpoints"};




function DrinkPotion(User,SourceItem)
     
	local potionData = tonumber(SourceItem:getData("potionData"));
	local dataZList = druid.base.alchemy.SplitBottleData(User,potionData);
	
   for i=1,8 do
		
		-- effects
		if (i == 3) or (i == 6) then  -- poison
			CalculationStep = ((10-dataZList[i])-5) -- we need a slightly different calculation for poison
		else
			CalculationStep = (dataZList[i]-5) -- for everything else
		end
		
		local Val = (dataZList[i]-5) * (topBorder[i]/5) * base.common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );
		
		-- over time effect values
		if ( attribList[i] == "hitpointsOT" ) then
			hitpointsOT = (Val * 1.25) / 5;
		elseif ( attribList[i] == "poisonvalueOT" ) then
			   poisonvalueOT = (Val * 1.25) / 5;
		elseif ( attribList[i] == "manaOT" ) then
			   manaOT = (Val * 1.25) / 5;
		elseif ( attribList[i] == "foodlevelOT" ) then     			
			   foodlevelOT = (Val * 1.25) / 5;
		-- instatnt poison value cannot be < 0
		elseif ( attribList[i] == "poisonvalue" ) then
			Val = base.common.Limit( (User:getPoisonValue() + Val) , 0, 10000 ); 
			User:setPoisonValue( Val );
		-- instant foodlevel; you cannot overeat on food potion
		elseif ( attribList[i] == "foodlevel" ) then
		    Val = base.common.Limit( (User:increaseAttrib("foodlevel",0) + Val) , 0 , 60000 );
		else
			User:increaseAttrib(attribList[i],Val);
		end
	
	end
	
    -- taste
	druid.base.alchemy.generateTasteMessage(User,dataZList); 
	
	-- effect message
	ListPositiveEffectDE = {}
	ListNegativeEffectDE = {}
	ListPositiveEffectEN = {}
	ListNegativeEffectEN = {}
	
	ListPositiveEffectDE = {"hitpointsOT positive. ","foodlevel positive. ","poisonvalueOT positive. ","mana positive. ","manaOT positive. ","poisonvalue positive. ","foodlevelOT positive. ","hitpoints positive. "}
	ListNegativeEffectDE = {"hitpointsOT negative. ","foodlevel negative. ","poisonvalueOT negative. ","mana negative. ","manaOT negative. ","poisonvalue negative. ","foodlevelOT negative. ","hitpoints negative. "}
	ListPositiveEffectEN = {"hitpointsOT positive. ","foodlevel positive. ","poisonvalueOT positive. ","mana positive. ","manaOT positive. ","poisonvalue positive. ","foodlevelOT positive. ","hitpoints positive. "}
	ListNegativeEffectEN = {"hitpointsOT negative. ","foodlevel negative. ","poisonvalueOT negative. ","mana negative. ","manaOT negative. ","poisonvalue negative. ","foodlevelOT negative. ","hitpoints negative. "}

	local effectMessageDE = ""
	local effectMessageEN = ""
	
	for i=1,8 do
		if (dataZList[i] > 5) then
		   effectMessageDE = effectMessageDE..ListPositiveEffectDE[i]
		   effectMessageEN = effectMessageEN..ListPositiveEffectEN[i]
	   elseif (dataZList[i] < 5) then
			effectMessageDE = effectMessageDE..ListNegativeEffectDE[i]
			effectMessageEN = effectMessageEN..ListNegativeEffectEN[i]
	   end
	end
	
	if (effeceMessageDE == "") and (effeceMessageEN == "") then
	    effectMessageDE = "Du spührst keine Wirkung."
		effectMessageEN = "You don't feel any effect."
	end
	
	base.common.InformNLS(User,effectMessageDE,effectMessageEN);
	
	-- LTE is being added for the effects over time 
	find, myEffect = User.effects:find(166)

	if not find then
	   myEffect=LongTimeEffect(166,1); 
	   User.effects:addEffect(myEffect); -- create the effect
   
	 find, myEffect = User.effects:find(166)
	 if not find then  -- security check 
		 User:inform("An error occured, inform a developer.");
		 return;
	   end  
   end
	-- now we add the values
   myEffect:addValue("hitpointsIncrease",hitpointsOT)
   myEffect:addValue("manaIncrease",manaOT)
   myEffect:addValue("foodlevelIncrease",foodlevelOT)
   myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
   myEffect:addValue("counterPink",10)	   
   myEffect:addValue("cooldownPink",5)
end

function UseItem(User,SourceItem,TargetItem,Counter,Param, ltstate)

	if base.common.GetFrontItemID(User) == 1008 then -- infront of a cauldron?
	   local cauldron = base.common.GetFrontItem( User );
	
	   if (cauldron:getData("cauldronData") ~= "") then 
	      base.common.InformNLS( User,
					"In dem Kessel befindet sich bereits etwas. Du kannst nichts mehr hinzutun.",
					"There is already something in the cauldron. You cannot add something else to it."
						   );
	       return;
      
	  elseif (cauldron:getData("cauldronData") == "") then -- nothing in the cauldron, so the stock is being filled in
	      
		  if ( ltstate == Action.abort ) then
                base.common.InformNLS( User,
                "Du brichst Deine Arbeit ab.",
                "You abort your work."
                       );
		        return;
            end
			
			if (ltstate == Action.none) then
			   User:startAction(20,21,5,0,0);
			   return
			end
		  
		  local ID_potion = SourceItem.id			 
		  cauldron:setData("potionID", ""..ID_potion);
		  cauldron:setData("cauldronData",""..SourceItem:getData("potionData"))
	      cauldron.quality = SourceItem.quality
		  world:changeItem(cauldron)
		  User:talkLanguage(Character.say, Player.german, "#me kippt einen Trank in den Kessel.");
          User:talkLanguage(Character.say, Player.english, "#me pours a potion into the cauldron.");
		  world:makeSound(10,User.pos);
		  world:erase(SourceItem,1);
		  User:createItem(164, 1, 333, 0);
	      return;
	   end  
	end
	
	-- not infront of a cauldron: let's drink the potion!
	if User.attackmode then
        base.common.InformNLS(User,
			"Du kannst den Trank nicht benutzen, während Du kämpfst.",
			"You can't use the potion while you are fighting.");
		return;
	end
	
	if User.effects:find(166) then
	   base.common.InformNLS( User,
                "Der Trank hätte jetzt keine Wirkung.",
                "The potion wouldn't have any effect now."
                       );  
	   return;
	end	
	
	base.character.ChangeFightingpoints(User, -20);
	world:makeSound(12,User.pos);
	world:erase(SourceItem,1);
	   if(math.random(20) == 1) then
           base.common.InformNLS(User, "Die Flasche zerbricht.", "The bottle breaks.");
        else
            User:createItem(164, 1, 333, 0);
        end
	DrinkPotion(User, SourceItem);
end

function LookAtItem(User,Item)
    if (User:getPlayerLanguage()==0) then
        world:itemInform(User,Item,"Du siehst ein Flaschenetikett mit der Aufschrift: \"Zaubertrank\"");
    else
        world:itemInform(User,Item,"You look at a sticker telling: \"Potion\"");
        
    end
end