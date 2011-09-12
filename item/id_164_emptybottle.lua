-- Schaf melken
-- Nop
-- Merung 2011: fill stock or potion into bottle
-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")

module("item.id_164_emptybottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- the following few lines are for the alchemy system
    -- getting the stock or potion from the cauldron into the bottle
   if base.common.GetFrontItemID(User) == 1008 then   -- is the char infront of a culdron?
   
       local cauldron = base.common.GetFrontItem( User );
       
	   local cauldronData = tonumber(cauldron:getData("cauldronData"));
	   

	   if (cauldron:getData("cauldronData") == "") then -- no stock
					base.common.InformNLS( User,
					"In dem Kessel befindet sich nichts zum Abfüllen.",
					"There is nothing to be bottled in the cauldron."
						   );
			return;
	   end
	   
	   if (cauldron:getData("cauldronData") ~= "") and (cauldron:getData("potionType") == "") then -- a normal stock
		  SourceItem:setData("stockData",""..cauldronData)
		  SourceItem.id = 331
		  SourceItem.quality = cauldron.quality
		  world:changeItem(SourceItem)
		  cauldron:setData("cauldronData","")
		  cauldron.quality = 333
		  world:changeItem(cauldron)
		  world:makeSound(10,User.pos);
		  User:talkLanguage(Character.say, Player.german, "#me füllt den Inhalt des Kessels in eine Flasche.");
		  User:talkLanguage(Character.say, Player.english,"#me bottles the substances from the cauldron.");
		  return;
	   end
	
	   if (cauldron:getData("potionType") ~= "") then -- a potion
	    
		   local potionKind = tonumber(cauldron:getData("potionType"));
	       if potionKind == 1 then
	          potionId = 165;
	       elseif potionKind == 2 then
	          potionId = 59;
           elseif potionKind == 3 then
	          potionId =  327;
	       elseif potionKind == 4 then
	          potionId =  329;
	       elseif potionKind == 5 then
	          potionId =  166;
	       elseif potionKind == 6 then
	          potionId =  328;
           elseif potionKind == 7 then
	          potionId =  330;
           end
	   
	   
	       SourceItem:setData("potionData",""..cauldronData)
	       SourceItem.id = potionId
	       SourceItem.quality = cauldron.quality
	       world:changeItem(SourceItem)
	   
	       cauldron:setData("cauldronData","")
	       cauldron:setData("potionType","")
	       cauldron.quality = 333
	       world:changeItem(cauldron)
	       world:makeSound(10,User.pos);
	       User:talkLanguage(Character.say, Player.german, "#me füllt den Inhalt des Kessels in eine Flasche.");
           User:talkLanguage(Character.say, Player.english,"#me bottles the substances from the cauldron.");
	       return;
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
