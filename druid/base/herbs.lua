-- herbs 
-- alchemy system: using a herb infront of a cauldron - brewing

--NOTE: every herb used in the alchemy system will have this script attached to it. 
-- if you want to give a herb a special effect, like an effect when using it, better create an own script for this herb
-- but call the UseItem function of this script in the herb-own script, when infront of a cauldron


require("base.common")
require("druid.base.alchemy")

module("druid.base.herbs", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)

    -- infront of a cauldron?
   if base.common.GetFrontItemID(User) == 1008 then
	  
        -- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  base.common.InformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here."
				)
		  return;
	    end

        AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem)
	    if AlchemyPlant then
	        BrewingPlant(User,SourceItem,TargetItem,Counter,Param,ltstate)
	    elseif SourceItem.id == 157 then
		    Filter(User,SourceItem,TargetItem,Counter,Param,ltstate)
		end
    
	else
	    -- not infront of cauldron, maybe do something else with herbs
        return
	end
end

function BrewingPlant(User,SourceItem,TargetItem,Counter,Param,ltstate)
    cauldron = base.common.GetFronItem(User)
	
	if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end
	
	if (ltstate == Action.none) then
		   User:startAction(20,21,5,15,25);
		   return
	end
	
	if cauldron:getData("potionEffectId") ~= "" then -- potion in cauldron, failure
        cauldron:setData("potionEffectId","")
		cauldron:setData("potionId","")
		cauldron:setData("potionQuality","")
		world:gfx(1)
		base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Kraut hinzu tust.", 
		                            "The substance in the cauldron blows out, as you put the herb in.")
    
	elseif cauldron:getData("cauldronFilledWith")== "essenceBrew" then -- essence brew
		if cauldron:getData("essenceHerb8") ~= "" then -- already 8 herbs in the essence brew, failure 
		    druid.base.alchemy.CauldronExplosion(User,cauldron,{36})
        else
		    for i=1,8 do -- we put the herb inot the essence brew
				if (cauldron:getData("essenceHerb"..i) == "") then
					cauldron:setData("essenceHerb"..i,""..SourceItem.id)
					world:changeItem(cauldron)
					break
				end
            end 
		    User:learn("alchemy",6,20,100,Character:increaseAttrib("essence",0))
		end	
		
	elseif (cauldron:getData("stockData") ~= "") or (cauldron:getData("cauldronFilledWith") == "water") then -- water or a stock we put the herb in
	    if (cauldron:getData("stockData") == "") then -- in case it is water, we will treat is as a neutral stock
	        cauldron:setData("stockData","55555555");
	    end

		cauldronData = tonumber(cauldron:getData("stockData"));
		dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);
		Plant = SourceItem.id
		plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(Plant);
		
		-- "overflow" leads to explosion of the stock
		if dataZList[plusWertPos] == 9 or dataZList[minusWertPos] == 1 then
		    druid.base.alchemy.CauldronExplosion(User,cauldron,{4})
		 
        else
			if plusWertPos == 0 then
			   dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
			elseif minusWertPos == 0 then
				   dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
			else
				dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
				dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
			end
		    newStockData = druid.base.alchemy.PasteCauldronData(User,dataZList);
		    cauldron:setData("stockData",""..newStockData);
		    User:learn("alchemy",6,20,100,Character:increaseAttrib("essence",0))
		end
		
        cauldron:setData("cauldronFilledWith","")
	
	else -- there is nothing in the cauldron to put the herb in, failure
	    base.common.InformNLS(User, "Die Pflanze vertrockent auf dem Boden des heißen Kessels und zerfällt zu Asche.", 
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")
        world:makeSound(7,cauldron.pos)    
	end		
	world:changeItem(cauldron)
    world:eraseItem(SourceItem,1)	
end

function Filter(User,SourceItem,TargetItem,Counter,Param,ltstate)
    cauldron = base.common.GetFrontItem(User)
	
	if ( ltstate == Action.abort ) then
		base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	   return
	end
	
	if (ltstate == Action.none) then
		   User:startAction(20,21,5,15,25);
		   return
	end
	
	-- a potion in the cauldron, failure
	if cauldron:getData("potionEffectId")~="" then
        cauldron:setData("potionEffectId","")
		cauldron:setData("potionId","")
		cauldron:setData("potionQuality","")
		world:gfx(1)
		base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Kraut hinzu tust.", 
		                            "The substance in the cauldron blows out, as you put the herb in.")
    
	elseif cauldron:getData("cauldronFilledWith")=="essenceBrew" then -- essence brew in cauldron, failure
        for i=1,8 do
			cauldron:setData("essenceHerb"..i,"")
			world:changeItem(cauldron)
		end
		cauldron:setData("cauldronFilledWith","")
		cauldron:setData("potionId")
		world:gfx(1)
		base.common.InformNLS(User, "Du Inhalt des Kessels verpufft, als Du das Kraut hinzu tust.", 
		                            "The substance in the cauldron blows out, as you put the herb in.")
		
	elseif cauldron:getData("cauldronFilledWith")=="water" then -- water, the water is _not_ destroyed
        -- water stays
    
	elseif cauldron:getData("stockData")~="" then -- stock, let's filter
        cauldronData = tonumber(cauldron:getData("stockData"));
	    dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);
	    for i=1,8 do
			if dataZList < 5 then 
				dataZList[i] = dataZList[i] + 1
			elseif dataZList > 5 then
				dataZList[i] = dataZList[i] - 1
			end	
		end
	    -- we change our stock
	    newStockData = druid.base.alchemy.PasteCauldronData(User,dataZList);
		cauldron:setData("stockData",""..newStockData);

    else -- empty cauldron
        base.common.InformNLS(User, "Die Pflanze vertrockent auf dem Boden des heißen Kessels und zerfällt zu Asche", 
		                            "The plant dries up on the hot bottom of the cauldron and falls to ashes.")	
	end

	world:changeItem(cauldron)
    world:eraseItem(SourceItem,1)	
end
