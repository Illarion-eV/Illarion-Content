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
		if (TargetItem:getData("potionID") ~= "") then 
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
	end
	
	if ( ltstate == Action.abort ) then
		base.common.TempInformNLS( User,
		"Du brichst Deine Arbeit ab.",
		"You abort your work."
			   );
		return;
	end
	
	if (ltstate == Action.none) then
	   User:startAction(20,21,5,0,0);
	   return
	end
	
	local dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);
	if SourceItem.id == 157 then -- rotten treebark
		-- try to neutralize a already neutral stock -> boom!
		if (TargetItem:getData("stockData") == "55555555") then
			druid.base.alchemy.StockExplosion(User, SourceItem, TargetItem);
			return;
		end
		
		-- there is a not neutral stock
		for i=1,8 do
			if dataZList < 5 then 
				dataZList[i] = dataZList[i] + 1
			elseif dataZList > 5 then
				dataZList[i] = dataZList[i] - 1
			end	
		end
	end
	
	-- if there is no cauldronData, we will create one    
	if (TargetItem:getData("stockData") == "") then
	   TargetItem:setData("stockData","55555555");
	end
	
	local cauldronData = tonumber(TargetItem:getData("stockData"));
	
	if SourceItem.id ~= 157 then -- not a rotten tree bark; a normal alchemy herb
		
		local Plant = SourceItem.id
		local plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(Plant);
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
	end
	
	-- delete the plant
	world:makeSound(10,TargetItem.pos);
	User:increaseAtPos(SourceItem.itempos,-1);
	
	-- learn!
	User:learn("alchemy",6,10,100,User:increaseAttrib("perception",0))
	
	-- the new data value is being created
	local newStockData = druid.base.alchemy.PasteCauldronData(User,dataZList);
	TargetItem:setData("stockData",""..newStockData);
	world:changeItem(TargetItem)
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
		
		if ( ltstate == Action.abort ) then
			base.common.TempInformNLS( User,
			"Du brichst Deine Arbeit ab.",
			"You abort your work."
				   );
			return;
	    end
		
		if (ltstate == Action.none) then
	        User:startAction(20,21,5,0,0);
	        return
	    end
		
		TargetItem:setData("cauldronFilledWith",newFilled);
	    world:changeItem(TargetItem)
		
		SourceItem.id = newBucketId;
	    SourceItem.data = 0;
	    world:changeItem(SourceItem);
    end
end

function BrewingGemDust(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
	-- no stock, no potion!	
	if (TargetItem:getData("stockData") == "") then
	   base.common.TempInformNLS( User,
		"Im Kessel muss sich ein Sud befinden, um diesen zu verazaubern.",
		"There has to be a stock in the cauldron so that you can enchant it."
			   );
		return;
	end
	
	if ( ltstate == Action.abort ) then
		base.common.TempInformNLS( User,
		"Du brichst Deine Arbeit ab.",
		"You abort your work."
			   );
		return;
	end
	
	if (ltstate == Action.none) then
	   User:startAction(20,21,5,0,0);
	   return
	end
	
	if SourceItem.id == 446 then --bluestone
	   ID_potion = 165 -- id of the matching potion
	elseif SourceItem.id == 447 then  -- ruby
		   ID_potion = 59
	elseif SourceItem.id == 448 then  -- emerald
		   ID_potion = 327
	elseif SourceItem.id ==	449 then  -- blackstone
		   ID_potion = 329
	elseif SourceItem.id == 450 then -- amethyst
		   ID_potion = 166
	elseif SourceItem.id == 451 then -- topaz
		   ID_potion = 328
	elseif SourceItem.id == 452 then -- diamond
		   ID_potion = 330
	end 
	
	-- change cauldron's data and quality
	world:makeSound(13,TargetItem.pos);
	world:gfx(52,TargetItem.pos);
	TargetItem:setData("potionID", ""..ID_potion);
	TargetItem.quality = 999; -- !!!!!!!!!!!!!!!!!!!!!! note to myself (merung): replace it with a proper calculation  !!!!!!!!!!!!!!!!!!
	world:changeItem(TargetItem);
	
	User:increaseAtPos(SourceItem.itempos,-1); -- delete gemdust
	-- learn!
	User:learn("alchemy",6,10,100,User:increaseAttrib("essence",0));
		
end	   	