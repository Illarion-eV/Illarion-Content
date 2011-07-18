-- Schaf melken
-- Nop

-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")

module("item.id_164_emptybottle", package.seeall)

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- the following few lines are for the alchemy system
    -- getting the stock or potion from the cauldron into the bottle
   if base.common.GetFrontItemID(User) == 1008 then   -- is the char infront of a culdron?
   local cauldron = base.common.GetFrontItem( User );
   
   if cauldron.data < 11111111 then -- no stock
        base.common.InformNLS( User,
                "In dem Kessel befindet sich nichts zum Abfüllen.",
                "There is nothing to be bottled in the cauldron."
                       );
		return;
	end
	
    if cauldron.data >= 11111111 and cauldron.data <= 99999999 then -- a normal stock
	   SourceItem.id = 331
       SourceItem.data = cauldron.data
       SourceItem.quality = cauldron.quality
       world:changeItem(SourceItem)
       cauldron.data = 0
	   cauldron.quality = 333
	   world:changeItem(cauldron)
	   world:makeSound(10,User.pos);
	   User:talkLanguage(Character.say, Player.german, "#me füllt den Inhalt des Kessels in eine Flasche.");
       User:talkLanguage(Character.say, Player.english,"#me bottles the substances from the cauldron.");
	   return;
	end
	
	if cauldron.data > 99999999 then -- a potion
	   local PotionMarker = cauldron.data-(math.floor(cauldron.data/10))*10
	   if PotionMarker == 1 then
	      PotionId = 165;
	   elseif PotionMarker == 2 then
	      PotionId = 59;
       elseif PotionMarker == 3 then
	      PotionId =  327;
	   elseif PotionMarker == 4 then
	      PotionId =  329;
	   elseif PotionMarker == 5 then
	      PotionId =  166;
	   elseif PotionMarker == 6 then
	      PotionId =  328;
       elseif PotionMarker == 7 then
	      PotionId =  330;
       end
	   
	   SourceItem.id = PotionId
	   SourceItem.data = cauldron.data
	   SourceItem.quality = cauldron.quality
	   world:changeItem(SourceItem)
	   cauldron.data = 0
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
		if frontChar and frontChar:get_race() == 18 then
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
		
		local frontItem = base.common.GetFrontItem(User);
		-- fill bottle with language potion (druid system)
		-- used with barrels in druid house? user=druid?
		if frontItem and frontItem.id == 513 and equapos( frontItem.pos, position(-391,-154,0) )
		 and User:getMagicType() == 3 then
			local gText, eText;
			-- druid can still get a potion?
			if User:getQuestProgress(23) <10 then
				User:setQuestProgress(23, 1 + User:getQuestProgress(23));
				base.common.TempInformNLS(User,
				"Du füllst die Flasche mit einer weißen Flüssigkeit.",
				"You fill the bottle with a white liquid.");
				SourceItem.id = 330;
				SourceItem.quality = 888;
				local val = math.random(3)
				if val == 1 then
					SourceItem.data = 95738184;     --gnomisch
				elseif val == 2 then
					SourceItem.data = 49582625;     --fee'isch					
				else
					SourceItem.data = 53261566;     --goblin						
				end
				world:changeItem(SourceItem);
			else
				base.common.TempInformNLS(User,
				"Anscheinend ist keine Flüssigkeit mehr für dich übrig.",
				"Obviously there is no liquid left for you.");
			end
		end
	end
end
