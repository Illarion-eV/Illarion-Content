-- Schaf melken
-- Nop
-- Merung 2011: fill stock or potion into bottle
-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")

module("item.id_164_emptybottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- the following few lines are for the alchemy system
   if base.common.GetFrontItemID(User) == 1008 then   -- is the char infront of a culdron?
   
       TargetItem = base.common.GetFrontItem( User ) 
	   
	   if ( ltstate == Action.abort ) then
                User:talkLanguage(Character.say, Player.german, "abbruch arbeit");
                User:talkLanguage(Character.say, Player.english, "abort work");
				--[[base.common.TempInformNLS( User,
                "Du brichst Deine Arbeit ab.",
                "You abort your work."
                       );]]
		        return;
        end
			
		if (ltstate == Action.none) then
		   User:startAction(20,21,5,0,0);
		   return
		end
		
	   if (TargetItem:getData("cauldronFilledWith") == "water") then -- water belongs into a bucket, not a potion bottle!
	        User:talkLanguage(Character.say, Player.german, "zuviel wasser. nehm eimer");
            User:talkLanguage(Character.say, Player.english, "too much water. use bucket");
			--[[base.common.TempInformNLS( User,
					"Es ist zu viel Wasser im Kessel, als dass es in die Flaschen passen würde. Ein Eimer wäre hilfreicher.",
					"There is too much water in the cauldron to bottle it. Better use a bucket."
						   );]]
			return;
	    -- no stock, no potion, not essence brew -> nothing we could fil into the bottle
	    elseif (TargetItem:getData("stockData") == "") and (TargetItem:getData("potionEffectId") == "") and (TargetItem:getData("cauldronFilledWith") == "") then
	        User:talkLanguage(Character.say, Player.german, "nichts zum abfüllen");
            User:talkLanguage(Character.say, Player.english, "notthing to bottle");
			--[[base.common.TempInformNLS( User,
					"Es befindet sich nichts zum Abfüllen im Kessel.",
					"There is nothing to be bottled in the cauldron."
						   );]]
			return;
	    end
	   
	   if (TargetItem:getData("stockData") ~= "") then  -- stock
	        SourceItem.id = 331
	        SourceItem:setData("stockData",TargetItem:getData("stockData"))
	        world:changeItem(SourceItem) -- got the stock

            TargetItem:setData("stockData","")
            world:changeItem(TargetItem) -- clean cauldron
            world:makeSound(10,TargetItem.pos);		
	   
	   elseif (TargetItem:getData("cauldronFilledWith") == "essenceBrew") then -- essence Brew
	        SourceItem.id = tonumber(TargetItem:getData("potionId"))
	        SourceItem:setData("essenceBrew","true")
			SourceItem:setData("essenceHerb1",TargetItem:getData("essenceHerb1"))
	        SourceItem:setData("essenceHerb2",TargetItem:getData("essenceHerb2"))
	        SourceItem:setData("essenceHerb3",TargetItem:getData("essenceHerb3"))
	        SourceItem:setData("essenceHerb4",TargetItem:getData("essenceHerb4"))
	        SourceItem:setData("essenceHerb5",TargetItem:getData("essenceHerb5"))
	        SourceItem:setData("essenceHerb6",TargetItem:getData("essenceHerb6"))
	        SourceItem:setData("essenceHerb7",TargetItem:getData("essenceHerb7"))
	        SourceItem:setData("essenceHerb8",TargetItem:getData("essenceHerb8"))
	        world:changeItem(SourceItem) -- our essence brew
			
			TargetItem:setData("potionId","")
	        TargetItem:setData("cauldronFilledWith","")
			TargetItem:setData("essenceHerb1","")
	        TargetItem:setData("essenceHerb2","")
	        TargetItem:setData("essenceHerb3","")
	        TargetItem:setData("essenceHerb4","")
	        TargetItem:setData("essenceHerb5","")
	        TargetItem:setData("essenceHerb6","")
	        TargetItem:setData("essenceHerb7","")
	        TargetItem:setData("essenceHerb8","")
	        world:changeItem(TargetItem) -- clean cauldron
	        world:makeSound(10,TargetItem.pos);
			
	   elseif (TargetItem:getData("potionEffectId") ~= "") then -- potion
	        SourceItem.id = tonumber(TargetItem:getData("potionId"))
	        SourceItem.quality = tonumber(TargetItem:getData("potionQuality"))
	        SourceItem:setData("potionEffectId",TargetItem:getData("potionEffectId"))
	        world:changeItem(SourceItem) -- we have a out potion
			
			TargetItem:setData("potionId","")
			TargetItem:setData("potionQuality","")
			TargetItem:setData("potionEffectId","")
			world:changeItem(TargetItem) -- we clean our cauldron
	        world:makeSound(10,TargetItem.pos);
	   
	   end
	end
    
    -- bottle in hand?
	if SourceItem:getType() == 4 and (SourceItem.itempos == 5 or SourceItem.itempos == 6) then

		-- check for sheep
		local frontChar = base.common.GetFrontCharacter(User);
		if frontChar and frontChar:getRace() == 18 then
			-- get milk
			world:erase(SourceItem,1);
            User:createItem(330,1,333,0);
			return;
		end
		
		-- check for frontPos
		local frontPos = base.common.GetFrontPosition(User);
		-- TODO: convert quests & positions to New Illarion
		-- if equapos(frontPos, position(51, -55, 0)) then -- Troll's Vein
            -- --User:inform("at vein");
			-- local itempos = SourceItem.itempos;
			-- local number = SourceItem.number;
			-- world:erase(SourceItem,number);
			-- User:createAtPos(itempos, 2496, number);
			-- local bottles = User:getItemAt(itempos);
			-- bottles.data = 1;
			-- bottles.number = number;
			-- world:changeItem(bottles);
			-- return;
		-- elseif equapos(frontPos, position(116, -121, 0)) then -- Fairy's Tears
            -- --User:inform("at tears");
			-- local itempos = SourceItem.itempos;
			-- local number = SourceItem.number;
			-- world:erase(SourceItem,number);
			-- User:createAtPos(itempos, 2496, number);
			-- local bottles = User:getItemAt(itempos);
			-- bottles.data = 2;
			-- bottles.number = number;
			-- world:changeItem(bottles);
			-- return;
        -- end;
	end	
end
