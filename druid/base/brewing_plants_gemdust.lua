-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("druid.base.alchemy")

module("druid.base.brewing_plants_gemdust", package.seeall)



function BrewingPlant(User,SourceItem,TargetItem,Counter,Param,ltstate)
	-- no stock and char tries to filter it
	if (TargetItem:getData("stockData") == "") and (SourceItem.id == 157) then
		User:talkLanguage(Character.say, Player.german, "nichts zum filtern");
        User:talkLanguage(Character.say, Player.english, "nothing to filter");
		--[[base.common.InformNLS( User,
		"Es befindet sich nichts zum Filtern im Kessel.",
		"There is nothing to filter in the cauldron."
		   );]]
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
	
	
end	

function BrewingGemDust(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
	-- no stock, no water
	if (TargetItem:getData("stockData") == "") and (TargetItem:getData("cauldronFilledWith") ~= "water") then
	   User:talkLanguage(Character.say, Player.german, "brauchst wasser oder sud im kessel");
       User:talkLanguage(Character.say, Player.english, "need water or stock in cauldron");
	   --[[base.common.InformNLS( User,
		"Im Kessel muss sich ein Sud oder Wasser befinden.",
		"There has to be a stock or water in the cauldron."
			   );]]
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