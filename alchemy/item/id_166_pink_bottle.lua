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
-- Druidsystem: potion

local common = require("base.common")
local alchemy = require("alchemy.base.alchemy")
local lookat = require("base.lookat")
local M = {}

-- UPDATE common SET com_script='alchemy.item.id_166_pink_bottle' WHERE com_itemid = 166;

bottomBorder = 2;
topBorder = {7000       ,7000  ,50000      ,10000        ,7000         ,7000    ,50000        ,10000}
attribList ={"hitpoints","mana","foodlevel","poisonvalue","hitpointsOT","manaOT","foodlevelOT","poisonvalueOT"}

function DrinkPotion(User,SourceItem)
    local potionEffectId = tonumber(SourceItem:getData("potionEffectId"))
	
	if potionEffectId == 0 or potionEffectId == nil  then -- no effect	
	    common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert.", 
		"You don't have the feeling that something happens.")
	    return
	
	elseif potionEffectId >= 11111111 and potionEffectId <= 99999999 then -- it's an attribute changer  
	    
		-- there is already an effect; sadly,therefore, the current potion will have no effect
		local foundEffect, myEffect = User.effects:find(166)
		if foundEffect then
			common.InformNLS(User, "Du hast nicht das Gefühl, dass etwas passiert. Scheinbar verhindert der bereits wirkende Heiltranktrank weitere Effekte.", 
			"You don't have the feeling that something happens. It seems that the already affecting healing potion prevents other effects.")
			return
	    end
	
	    local dataZList = alchemy.SplitData(User,potionEffectId)
	    -- taste and effect message
	    alchemy.generateTasteMessage(User,dataZList)
		GenerateEffectMessage(User,dataZList)
		
		local hitpointsOT, poisonvalueOT, manaOT, foodlevelOT
		for i=1,8 do
			
			local Val = (dataZList[i]-5) * (topBorder[i]/5) * common.Scale( 0.5, 1, math.floor(SourceItem.quality/100) * 11 );
			
			if ( attribList[i] == "hitpointsOT" ) then
				hitpointsOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "poisonvalueOT" ) then
				   poisonvalueOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "manaOT" ) then
				   manaOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "foodlevelOT" ) then     			
				   foodlevelOT = (Val * 1.25) / 5;
			elseif ( attribList[i] == "poisonvalue" ) then
				Val = common.Limit( (User:getPoisonValue() - Val) , 0, 10000 ); 
				User:setPoisonValue( Val );
			else
				User:increaseAttrib(attribList[i],Val);
			end
	    end
	    -- LTE
		local myEffect=LongTimeEffect(166,70);
		-- now we add the values
	    if hitpointsOT < 0 then
	        myEffect:addValue("hitpointsDecrease",hitpointsOT*-1)
	    else
			myEffect:addValue("hitpointsIncrease",hitpointsOT)
		end
        if manaOT < 0 then		
	        myEffect:addValue("manaDecrease",manaOT*-1)
	    else
		    myEffect:addValue("manaIncrease",manaOT)
		end
        if foodlevelOT < 0 then
            myEffect:addValue("foodlevelDecrease",foodlevelOT*-1)		
		else
	        myEffect:addValue("foodlevelIncrease",foodlevelOT)
		end	
	    if poisonvalueOT < 0 then
		    myEffect:addValue("poisonvalueDecrease",poisonvalueOT*-1)
	    else
	        myEffect:addValue("poisonvalueIncrease",poisonvalueOT)
		end	
	   myEffect:addValue("counterPink",5)	   
	   User.effects:addEffect(myEffect)
	
	elseif potionEffectId == 10 then 
	    -- potion to spit fire
		
		-- there is already a fire spitting potion effect going on
		-- char pukes out a flame on the map, no further effect added
		local foundEffect, myEffect = User.effects:find(60)
		if foundEffect then
			common.InformNLS(User, "Sofort steigt Hitze und Erbrochenes in dir auf.", 
			"Immediately, your body heats up and and some stomach contents comes up.")
			User:talk(Character.say, "#me übergibt sich und spuckt dabei einen großen Feuerball aus.", "#me throws up and pukes out a big fireball.")
			local frontPos = common.GetFrontPosition(User)
			world:makeSound(5,frontPos)
		    world:gfx(9,frontPos)
			world:createItemFromId(359,1,frontPos,true,333,nil)
			effectRemoved = User.effects:removeEffect(60)
			if not effectRemoved then
				common.InformNLS( User,"Fehler: Informiere einen Dev.", "Error: Inform a dev.")
				return
			end	
			return
	    end		
		-- inform and add effect
		User:inform("Die Flüssigkeit läuft deine Kehle hinunter und sofort merkst du ein starkes Brennen.",
		            "The potion runs down your throat and immediately, you get the feeling that throat was on fire.")
		
		-- quality determines length until char spits fire (better quality, shorter time)
		local firstCall = (20-(math.floor(SourceItem.quality/100)*1.5))*10
		
		local myEffect=LongTimeEffect(60,firstCall)
		myEffect:addValue("quality",math.floor(SourceItem.quality/100))
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
	common.InformNLS(User,effectMessageDE,effectMessageEN);
end

function M.UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.repairPotion(SourceItem)
	-- repair end
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.FillIntoCauldron(User,SourceItem,cauldron,ltstate)
	
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   common.InformNLS(User, "Du kannst das Gebräu nicht nutzen, während du kämpfst.", "You cannot use the potion while fighting.")
		else
		    User:talk(Character.say, "#me trinkt eine violette Flüssigkeit.", "#me drinks a violet liquid.")
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.EmptyBottle(User,SourceItem)
	    end
	end  
end

function M.LookAtItem(User,Item)
    return lookat.GenerateLookAt(User, Item, 0)
end   
return M

