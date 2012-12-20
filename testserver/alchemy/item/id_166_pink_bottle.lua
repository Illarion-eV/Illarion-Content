-- Druidsystem: potion

require("base.common")
require("alchemy.base.alchemy")
require("base.character")

module("alchemy.item.id_166_pink_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000       ,7000  ,50000      ,10000        ,7000         ,7000    ,50000        ,10000}
attribList ={"hitpoints","mana","foodlevel","poisonvalue","hitpointsOT","manaOT","foodlevelOT","poisonvalueOT"}

function DrinkPotion(User,SourceItem)
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	
	if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
	
	elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer  
	    
		-- there is already an effect; sadly,therefore, the current potion will have no effect
		local foundEffect, myEffect = User.effects:find(166)
		if foundEffect then
			base.common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert. Scheinbar verhindert der bereits wirkende Heiltranktrank weitere Effekte.", 
			"You don't have the feeling that something happens. It seems that the already affecting healing potion prevents other effects.")
			return
	    end
	
	    local dataZList = alchemy.base.alchemy.SplitData(User,potionEffectId)
	    -- taste and effect message
	    alchemy.base.alchemy.generateTasteMessage(User,dataZList)
		GenerateEffectMessage(User,dataZList)
		
		local hitpointsOT, poisonvalueOT, manaOT, foodlevelOT
		for i=1,8 do
			-- effects
			local CaulcularionSetp
			if (i == 3) or (i == 6) then  -- poison
				CalculationStep = ((10-dataZList[i])-5) -- we need a slightly different calculation for poison
			else
				CalculationStep = (dataZList[i]-5) -- for everything else
			end
			
			local Val = CalculationStep * (topBorder[i]/5) * base.common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );
			
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
	    -- LTE
		local myEffect=LongTimeEffect(166,70);
		-- now we add the values
	   myEffect:addValue("hitpointsIncrease",hitpointsOT)
	   myEffect:addValue("manaIncrease",manaOT)
	   myEffect:addValue("foodlevelIncrease",foodlevelOT)
	   myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
	   myEffect:addValue("counterPink",5)	   
	   User.effects:addEffect(myEffect)
	else
	    --whatever
	end	
end

function GenerateEffectMessage(User,dataZList)
    local effectMessageDE = ""
	local effectMessageEN = ""
	local anyEffect = false
	
	ListPositiveEffectDE = {"Deine Lebenskraft nimmt sofort zu."   ,"Dein Mana nimmt sofort zu."   ,"Du fühlst dich sofort satter."      ,"Das Gift in dir wird geschwächt."       ,"Deine Lebenskraft nimmt mit der Zeit zu.","Dein Mana nimmt mit der Zeit zu.","Mit der Zeit nimmt dein Hunger ab.","Das Gift in dir wird mit der Zeit schwächer."}
	ListNegativeEffectDE = {"Deine Lebenskraft nimmt sofort ab."   ,"Dein Mana nimmt sofort ab."   ,"Du fühlst dich plötlzich hungriger.","Gift breitet sich in dir aus."          ,"Deine Lebenskraft nimmt mit der Zeit ab.","Dein Mana nimmt mit der Zeit ab.","Mit der Zeit nimmt dein Hunger zu.","Mit der Zeit breitet sich ein stärker werdendes Gift aus."}
	ListPositiveEffectEN = {"Your life energy increases instantly.","Your mana increases instanly.","You feel instantly more sated."     ,"The poison in you is instalny weakened.","Your life energy increases with time."   ,"Your mana increases with time."  ,"Your hunger decreases with time."  ,"The poison is weakend with time."}
	ListNegativeEffectEN = {"Your life energy decreases instantly.","Your mana decreases instanly.","You feel instantly more hungry."    ,"You are poisoned."                      ,"Your life energy decreases with time."   ,"Your mana decreases with time."  ,"Your hunger increases with time."  ,"A with time stronger getting poison spreads in your body."}
	
	for i=1,8 do
		if (dataZList[i] > 5) then
		   effectMessageDE = effectMessageDE.." "..ListPositiveEffectDE[i]
		   effectMessageEN = effectMessageEN.." "..ListPositiveEffectEN[i]
	       anyEffect = true
	   elseif (dataZList[i] < 5) then
			effectMessageDE = effectMessageDE.." "..ListNegativeEffectDE[i]
			effectMessageEN = effectMessageEN.." "..ListNegativeEffectEN[i]
	        anyEffect = true
	   end
	end
	if anyEffect == false then
	    effectMessageDE = "Du spührst keine Wirkung."
		effectMessageEN = "You don't feel any effect."
	end
	base.common.InformNLS(User,effectMessageDE,effectMessageEN);
end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
 
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.base.alchemy.FillIntoCauldron(User,SourceItem,cauldron,Counter,Param,ltstate)
	
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
			User:talkLanguage(Character.say, Player.german, "#me trinkt eine rote Flüssigkeit.");
			User:talkLanguage(Character.say, Player.english, "#me drinks a red liquid.");
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
	    end
	end  
    EmptyBottle(User,SourceItem)	
end

function LookAtItem(User,Item)
    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
end   