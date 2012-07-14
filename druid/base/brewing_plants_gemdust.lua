-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("druid.base.alchemy")

module("druid.base.brewing_plants_gemdust", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
   
   -- infront of a cauldron?
   if base.common.GetFrontItemID(User) == 1008 then
	  
       --[[if ( ltstate == Action.abort ) then
			base.common.TempInformNLS( User,
			"Du brichst Deine Arbeit ab.",
			"You abort your work."
				   );
			return;
	   end
	   
	   if (ltstate == Action.none) then
	        User:startAction(20,21,5,0,0);
	        return
	    end]]
	   
	   -- the cauldron becomce our TargetItem
	   local TargetItem = base.common.GetFrontItem( User );
	   
	   -- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  base.common.TempInformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here."
							);
		  return;
	    end
	   
	    -- there is a complete potions; we cannot add anything to it
		if (TargetItem:getData("potionEffectId") ~= "") then 
	        base.common.TempInformNLS( User,
		    "Einem fertigen Trank kannst Du nichts mehr beifügen.",
		    "You cannot add something to a completed potion."
			   );
		    return;
	    end
	
		local AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem);
	    local GemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem);
		-- check if the SourceItem is a herb used for alchemy
		if AlchemyPlant or SourceItem.id == 157 then
		    BrewingPlant(User,SourceItem,TargetItem,Counter,Param,ltstate)
	        
		    -- bucket
		elseif (SourceItem.id == 51) or (SourceItem.id == 52) then
		    WaterCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate) 
			
			-- check if it is gem dust
	    elseif GemDust then
		   BrewingGemDust(User,SourceItem,TargetItem,Counter,Param,ltstate)
	    end
    end
end

function BrewingPlant(User,SourceItem,TargetItem,Counter,Param,ltstate)
	-- no stock and char tries to filter it
	if (TargetItem:getData("stockData") == "") and (SourceItem.id == 157) then
		base.common.TempInformNLS( User,
		"Es befindet sich nichts zum Filtern im Kessel.",
		"There is nothing to filter in the cauldron."
		   );
		return
        -- we want to filter and there is a stock
	elseif (SourceItem.id == 157) then
	    cauldronData = tonumber(TargetItem:getData("stockData"));
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
		TargetItem:setData("stockData",""..newStockData);
		User:inform(""..newStockData)
		world:changeItem(TargetItem)
	end	
	
	-- alchemy herb but no water, no stock, no essence brew
	User:inform(""..TargetItem:getData("cauldronFilledWith"))
	if (SourceItem.id ~= 157) and ((TargetItem:getData("stockData") == "") and (TargetItem:getData("cauldronFilledWith") ~= "water") and (TargetItem:getData("cauldronFilledWith") ~= "essenceBrew")) then
	    base.common.TempInformNLS( User,
		"Es befindet sich keine Flüssigkeit im Kessel, in der Du das Kraut hinein tun könntest.",
		"There is no fluid in the cauldron you could put the herb into."
		   );
		return
	elseif SourceItem.id ~= 157 then -- not a rotten tree bark; a normal alchemy herb
		
		-- stock or water
		if (TargetItem:getData("stockData") ~= "") or (TargetItem:getData("cauldronFilledWith") == "water") then
		    
			if (TargetItem:getData("stockData") == "") then -- in case it is water, we will treat is as a normal stock
	            TargetItem:setData("stockData","55555555");
	        end
			
			cauldronData = tonumber(TargetItem:getData("stockData"));
	        dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);
		    Plant = SourceItem.id
		    plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(Plant);
		
			-- "overflow" leads to explosion of the stock
			if dataZList[plusWertPos] == 9 or dataZList[minusWertPos] == 1 then
			  druid.base.alchemy.StockExplosion(User, SourceItem, TargetItem);
			  return;
			end 

			if plusWertPos == 0 then
			   dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
			elseif minusWertPos == 0 then
				   dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
			else
				dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
				dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
			end
	
	        -- we change our stock
			newStockData = druid.base.alchemy.PasteCauldronData(User,dataZList);
			TargetItem:setData("stockData",""..newStockData);
			TargetItem:setData("cauldronFilledWith","")
			User:inform(""..newStockData)
			world:changeItem(TargetItem)
		
		elseif (TargetItem:getData("cauldronFilledWith") == "essenceBrew") then -- essence brew
		    
			if TargetItem:getData("essenceHerb1") == "" then -- no herb added yet
		        TargetItem:setData("essenceHerb1",""..SourceItem.id)
			    world:changeItem(TargetItem)
			elseif TargetItem:getData("essenceHerb8") ~= "" then
			    base.common.TempInformNLS( User,
				"Es kann kein weiteres Kraut mehr essenziert werden.",
				"No herb can be essenced any further."
				   );
				return
		    else
			    for i=2,8 do
				    if (TargetItem:getData("essenceHerb"..i) == "") then
		                TargetItem:setData("essenceHerb"..i,""..SourceItem.id)
                        world:changeItem(TargetItem)
                        break
                    end
                end 					
	        end
	    end
	end
	
	-- delete the plant
	world:makeSound(10,TargetItem.pos);
	User:increaseAtPos(SourceItem.itempos,-1);
	
	-- learn!
	User:learn("alchemy",6,10,100,User:increaseAttrib("perception",0))
end	

function WaterCauldron(User,SourceItem,TargetItem,Counter,Param,ltstate)
    
	if (SourceItem.id == 52) and (TargetItem:getData("cauldronFilledWith") ~= "") then
        base.common.TempInformNLS( User,
		"Der Kessel ist bereits mit etwas gefüllt - noch mehr und er würde überlaufen.",
		"The cauldron is already filled with something - more and it will spill over."
			   );
		return;
    elseif (SourceItem.id == 51) and (TargetItem:getData("cauldronFilledWith") ~= "water") then
	    base.common.TempInformNLS( User,
		"Hier ist kein Wasser im Kessel, dass Du abschöpfen könntest.",
		"There is no water in the cauldon for you to scoop out."
			   );
		return;
	
	else	
		
		if (SourceItem.id == 51) then
		    newFilled = ""
			newBucketId = 52
		else
		    newFilled = "water"
			newBucketId = 51
		end	
		
		TargetItem:setData("cauldronFilledWith",newFilled);
	    world:changeItem(TargetItem)
		
		SourceItem.id = newBucketId;
	    SourceItem.data = 0;
	    world:changeItem(SourceItem);
        world:makeSound(10,TargetItem.pos);
	end
end

function BrewingGemDust(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
	-- no stock, no water
	if (TargetItem:getData("stockData") == "") and (TargetItem:getData("cauldronFilledWith") ~= "water") then
	   base.common.TempInformNLS( User,
		"Im Kessel muss sich ein Sud oder Wasser befinden.",
		"There has to be a stock or water in the cauldron."
			   );
		return;
	end
	
	if (TargetItem:getData("stockData") ~= "") then -- stock
	    if (SourceItem.id == 447) or (SourceItem.id == 450) then 
		    potionEffectId = TargetItem:getData("stockData")
	    else 
		    potionEffectId = 0
        end			
	    TargetItem:setData("potionEffectId",potionEffectId)
	    TargetItem:setData("stockData","")
		potionQuality = 999
	    TargetItem:setData("potionQuality",""..potionQuality)
	end
	
	if (TargetItem:getData("cauldronFilledWith") == "water") then -- water -> we create essence brew
	    TargetItem:setData("cauldronFilledWith","essenceBrew")
	end	
	
	if SourceItem.id == 446 then --bluestone
	   Id_potion = 165 -- id of the matching potion
	elseif SourceItem.id == 447 then  -- ruby
		   Id_potion = 59
	elseif SourceItem.id == 448 then  -- emerald
		   Id_potion = 327
	elseif SourceItem.id ==	449 then  -- blackstone
		   Id_potion = 329
	elseif SourceItem.id == 450 then -- amethyst
		   Id_potion = 166
	elseif SourceItem.id == 451 then -- topaz
		   Id_potion = 328
	elseif SourceItem.id == 452 then -- diamond
		   Id_potion = 330
	end 
	TargetItem:setData("potionId", ""..Id_potion);
	
	-- change cauldron's data and quality
	world:makeSound(13,TargetItem.pos);
	world:gfx(52,TargetItem.pos);
	world:changeItem(TargetItem);
	
	User:increaseAtPos(SourceItem.itempos,-1); -- delete gemdust
	-- learn!
	User:learn("alchemy",6,10,100,User:increaseAttrib("essence",0));
end	   	