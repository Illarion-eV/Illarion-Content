-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("druid.base.alchemy")

module("druid.base.brewing_plants_gemdust", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
       -- information: take also item.id_164_emptybottle in account, please. 
	   -- this script changes the cauldron; the bottle script changes the bottle
	   
	   
	   -- first of all, the char has to stand infront of a cauldron
	   if base.common.GetFrontItemID(User) ~= 1008 then
          return;
	   end  
       -- if there is a cauldron, it will become our object of changes; let's save it
       local cauldron = base.common.GetFrontItem( User );
	   
	   -- is the char a druid?
	   if User:getMagicType() ~= 3 then
	      base.common.TempInformNLS( User,
                "Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
                "Only those who have been introduced to the art of alchemy are able to work here."
			                );
		  return;
	   end
	   
	   -- check if the SourceItem is a herb used for alchemy
	  local AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem);
	  if AlchemyPlant then
            -- if there is the data "potionType", it is a completed potion   
            if (cauldron:getData("potionID") ~= "") then 
		     base.common.TempInformNLS( User,
                "Einem fertigen Trank kannst Du nichts mehr beifügen.",
                "You cannot add something to a completed potion."
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
			
			
			-- if there is no cauldronData, we will create one    
			if (cauldron:getData("cauldronData") == "") then
			   cauldron:setData("cauldronData","55555555");
			end

			local cauldronData = tonumber(cauldron:getData("cauldronData"));

		    -- splitting of plant data and cauldron data (creating a list)
            local Plant = SourceItem.id
			local plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(Plant);
            local dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);

           -- "overflow" leads to explosion of the stock
            if dataZList[plusWertPos] == 9 or dataZList[minusWertPos] == 1 then
		      world:makeSound(10,cauldron.pos);
			  User:increaseAtPos(SourceItem.itempos,-1);
		      world:makeSound(5,cauldron.pos);
	          world:gfx(9,cauldron.pos);
		      base.common.InformNLS( User,
                "Deine letzte Handlung scheint den Sud zerstört und zu einer Explosion geführt zu haben.",
                "Your last doing seems to have destroyed the stock and caused an explosion."
			                );
			  cauldron:setData("cauldronData","");
			  world:changeItem(cauldron)
			  User:increaseAttrib("hitpoints", -3000);
			  return;
		    end 

		    -- and now, depending on the plant's data, active agents are raised or lowered
			if plusWertPos == 0 then
		       dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
		    elseif minusWertPos == 0 then
		           dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
		    else
		        dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
                dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
            end
		
		    -- delete the plant
			world:makeSound(10,cauldron.pos);
		    User:increaseAtPos(SourceItem.itempos,-1);
			
			-- the new data value is being created
			
			local newData = druid.base.alchemy.PasteCauldronData(User,dataZList);
			cauldron:setData("cauldronData",""..newData);
            world:changeItem(cauldron)
			
		end
		
      -- check if it is gem dust
	  local GemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem);
	  if GemDust then
             
            if (cauldron:getData("potionID") ~= "") then 
		     base.common.TempInformNLS( User,
                "Einem fertigen Trank kannst Du nichts mehr beifügen.",
                "You cannot add something to a completed potion."
                       );
		        return;
			end
			-- no stock, no potion!	
		    if (cauldron:getData("cauldronData") == "") then
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
			world:makeSound(13,cauldron.pos);
			world:gfx(52,cauldron.pos);
			cauldron:setData("potionID", ""..ID_potion);
			cauldron.quality = 999; -- !!!!!!!!!!!!!!!!!!!!!! note to myself (merung): replace it with a proper calculation  !!!!!!!!!!!!!!!!!!
			world:changeItem(cauldron);
		    
		    
			User:increaseAtPos(SourceItem.itempos,-1); -- delete gemdust
		    
		end
	end	   	