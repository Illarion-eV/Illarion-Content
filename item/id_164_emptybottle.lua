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
					base.common.TempInformNLS( User,
					"In dem Kessel befindet sich nichts zum Abfüllen.",
					"There is nothing to be bottled in the cauldron."
						   );
			return;
	   end
	   
	   if (cauldron:getData("cauldronData") ~= "") and (cauldron:getData("potionID") == "") then
		    
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
			
			if (cauldron:getData("potionID") ~= "") then -- if there is not just a stock but a potion in the cauldron
		       local ID_potion = cauldron:getData("potionID")
		       SourceItem.id = ID_potion
			   SourceItem:setData("potionData",""..cauldronData)
		   else
		       SourceItem.id = 331
		       SourceItem:setData("stockData",""..cauldronData)
		   end
		   
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
