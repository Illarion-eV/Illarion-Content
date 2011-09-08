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
	      base.common.InformNLS( User,
                "Nur jene, die in die Kunst der Alchemie eingeführt worden sind, können hier ihr Werk vollrichten.",
                "Only those who have been introduced to the art of alchemy are able to work here."
			                );
		  return;
	   end
	   
	   -- check if the SourceItem is a herb used for alchemy
	  local AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem);
	  if AlchemyPlant then
            -- if there is the data "potionType", it is a completed potion   
            if (cauldron:getData("potionType") ~= "") then 
		     base.common.InformNLS( User,
                "Einem fertigen Trank kannst Du nichts mehr beifügen.",
                "You cannot add something to a completed potion."
                       );
		        return;
			end	
			
		    -- if there is no cauldronData, we will create one    
			if (cauldron:getData("cauldronData") == "") then
			   User:inform("nummer 1")
			   cauldron:setData("cauldronData",55555555);
			   User:inform("nummer 2")
			end

			local cauldronData = tonumber(cauldron:getData("cauldronData"));

		   
		   -- if the cauldronData is < 11111111, which should not be possible anyway
		   if cauldronData < 11111111 then
			  User:inform("nummer 3")
			  cauldron:setData("cauldronData",55555555);
			  User:inform("nummer 4")
		   end
		 
		 
		 
		 -- splitting of plant data and cauldron data (creating a list)
            local Plant = SourceItem.id
			local plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(Plant);
            local dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);

           -- "overflow" leads to explosion of the stock
            if dataZList[plusWertPos] == 9 or dataZList[minusWertPos] == 1 then
		      world:gfx(21,User.pos)
			  world:makeSound(10,User.pos);
	          User:increaseAtPos(SourceItem.itempos,-1);
		      world:makeSound(5,User.pos);
	          world:gfx(9,cauldron.pos);
		      base.common.InformNLS( User,
                "Deine letzte Handlung scheint den Sud zerstört und zu einer Explosion geführt zu haben.",
                "Your last doing seems to have destroyed the stock and caused an explosion."
			                );
			  cauldron:setData("cauldronData", 0);
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
			world:gfx(21,User.pos)
			world:makeSound(10,cauldron.pos);
		    User:increaseAtPos(SourceItem.itempos,-1);
			
			-- the new data value is being created
			local newData = druid.base.alchemy.PasteCauldronData(User,dataZList);
			cauldron:setData("cauldronData", 55555555);
			world:changeItem(cauldron);
	   
	        User.movepoints=User.movepoints-30 --Delay of 30 movepoints for scaling skillgain and prevent macro abuse. If you change this, also change the movepoints in the learn(...) line in alchemy.lua
	   end
		
      -- check if it is gem dust
	  local GemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem);
	  if GemDust then
          -- data > 99999999 means that it is a completed potion   
            if (cauldron:getData("potionType") ~= "") then 
		     base.common.InformNLS( User,
                "Einem fertigen Trank kannst Du nichts mehr beifügen.",
                "You cannot add something to a completed potion."
                       );
		        return;
			end
			-- no stock, no potion!	
		    if cauldronData < 11111111 or (cauldronData == "") then
			   base.common.InformNLS( User,
                "Im Kessel muss sich ein Sud befinden, um diesen zu verazaubern.",
                "There has to be a stock in the cauldron so that you can enchant it."
                       );
		        return;
			end
			
			if SourceItem.id == 446 then --bluestone
			   gemDustType = 1
			elseif SourceItem.id == 447 then  -- ruby
                   gemDustType = 2
            elseif SourceItem.id == 448 then  -- emerald
                   gemDustType = 3
            elseif SourceItem.id ==	449 then  -- blackstone
                   gemDustType = 4
            elseif SourceItem.id == 450 then -- amethyst
                   gemDustType = 5
            elseif SourceItem.id == 451 then -- topaz
                   gemDustType = 6
            elseif SourceItem.id == 452 then -- diamond
                   gemDustType = 7
            end 
            
			-- change cauldron's data and quality
			cauldron:setData("potionType", gemDustType);
			cauldron.quality = 999; -- !!!!!!!!!!!!!!!!!!!!!! note to myself (merung): replace it with a proper calculation  !!!!!!!!!!!!!!!!!!
			world:changeItem(cauldron);
		    
		    
			User:increaseAtPos(SourceItem.itempos,-1); -- delete gemdust
		    
			User.movepoints=User.movepoints-30 --Delay of 30 movepoints for scaling skillgain and prevent macro abuse. If you change this, also change the movepoints in the learn(...) line in alchemy.lua
		end
	end	   	