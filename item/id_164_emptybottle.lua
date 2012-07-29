-- Schaf melken
-- Nop
-- Merung 2011: fill stock or potion into bottle
-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")

module("item.id_164_emptybottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- alchemy
   if base.common.GetFrontItemID(User) == 1008 then   -- is the char infront of a culdron?
   
       cauldron = base.common.GetFrontItem( User ) 
	   
	   if ( ltstate == Action.abort ) then
	        User:talkLanguage(Character.say, Player.german, "abbruch arbeit");
		    base.common.InformNLS(User, "Du brichst deine Arbeit ab.", "You abort your work.")
	       return
		end
			
		if (cauldron:getData("cauldronFilledWith") == "water") then -- water belongs into a bucket, not a potion bottle!
	        base.common.InformNLS( User,
					"Es ist zu viel Wasser im Kessel, als dass es in die Flaschen passen würde. Ein Eimer wäre hilfreicher.",
					"There is too much water in the cauldron to bottle it. Better use a bucket.")
			return;
	    
		-- no stock, no potion, not essence brew -> nothing we could fil into the bottle
	    elseif (cauldron:getData("stockData") == "") and (cauldron:getData("potionEffectId") == "") and (cauldron:getData("cauldronFilledWith") == "") then
	        base.common.InformNLS( User,
					"Es befindet sich nichts zum Abfüllen im Kessel.",
					"There is nothing to be bottled in the cauldron.")
			return;
	    end
		
		if (ltstate == Action.none) then
		   User:startAction(20,21,5,15,25);
		   return
		end
		
	   if (cauldron:getData("stockData") ~= "") then  -- stock
	        SourceItem.id = 331
	        SourceItem:setData("stockData",cauldron:getData("stockData"))
	        cauldron:setData("stockData","")
            	
	   elseif (cauldron:getData("cauldronFilledWith") == "essenceBrew") then -- essence Brew
	        SourceItem.id = tonumber(cauldron:getData("potionId"))
	        SourceItem:setData("essenceBrew","true")
			for i=1,8 do
			    SourceItem:setData("essenceHerb"..i,cauldron:getData("essenceHerb"..i))
			    world:changeItem(SourceItem)
			end
			
			cauldron:setData("potionId","")
	        cauldron:setData("cauldronFilledWith","")
			for i=1,8 do 
			    cauldron:setData("essenceHerb"..i,"")
			    world:changeItem(cauldron)
	        end
			
		elseif (cauldron:getData("potionEffectId") ~= "") then -- potion
	        SourceItem.id = tonumber(cauldron:getData("potionId"))
	        SourceItem.quality = tonumber(cauldron:getData("potionQuality"))
	        SourceItem:setData("potionEffectId",cauldron:getData("potionEffectId"))
	        
			cauldron:setData("potionId","")
			cauldron:setData("potionQuality","")
			cauldron:setData("potionEffectId","")
		end
	    world:changeItem(cauldron)
		world:changeItem(SourceItem)
		world:makeSound(10,cauldron.pos)
	end
    
    --[[-- bottle in hand?
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
	end	]]
end
