-- Schaf melken
-- Nop

-- UPDATE common SET com_script='item.id_164_emptybottle' WHERE com_itemid IN (164);

require("base.common")

module("item.id_164_emptybottle", package.seeall)

function UseItemWithCharacter(User,SourceItem,Character,Counter,Param)
    --User:inform("char selected");
    -- target is a sheep
    if( Character:get_race() == 18 ) then
       -- User:inform("sheep selected");
        -- empty bottle in hand
        if ((User:getItemAt(6).id == 164)or(User:getItemAt(5).id == 164)) then
            --User:inform("milking");
            -- replace by bottle with sheep milk
            world:erase(SourceItem,1)
            User:createItem(330,1,333,0)
        end
    end
end

-- Fairy's Tears oder Trolls Blood erhalten (Quellwasser)
-- vilarion
function UseItemWithField(User,SourceItem,TargetPos,Counter,Param)
    --User:inform("using bottle on field");
    if ((User:getItemAt(6).id == 164)or(User:getItemAt(5).id == 164)) then
        --User:inform("bottle in hand");
        if (User:getItemAt(6).id == 164) then
            itempos = 6;
        else
            itempos = 5;
        end
        bottles = User:getItemAt(itempos);
        number = bottles.number;
        -- if at trolls vein spring
        if ((TargetPos.x == 49) and (TargetPos.y==-54) and (TargetPos.z==0)) then
            --User:inform("at vein");
           world:erase(SourceItem,number);
           User:createAtPos(itempos, 2496, number);
           bottles = User:getItemAt(itempos);
           bottles.data = 1;
           bottles.number = number;
           world:changeItem(bottles);
        end
        if ((TargetPos.x == 118) and (TargetPos.y==-122) and (TargetPos.z==0)) then
            --User:inform("at tears");
           world:erase(SourceItem,number);
           User:createAtPos(itempos, 2496, number);
           bottles = User:getItemAt(itempos);
           bottles.data = 2;
           bottles.number = number;
           world:changeItem(bottles);
        end
    end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, ltstate )

	-- bottle in hand?
	if SourceItem:getType() == 4 and (SourceItem.itempos == 5 or SourceItem.itempos == 6) then

		-- fill bottle with language potion (druid system)
		-- used with barrels in druid house? user=druid?
		if TargetItem.id == 513 and equapos( TargetItem.pos, position(-391,-154,0) )
		 and User:getMagicType() == 3 then
			local gText, eText;
			-- druid can still get a potion?
			if User:getQuestProgress(23) <10 then
				User:setQuestProgress(23, 1 + User:getQuestProgress(23));
				base.common.TempInformNLS(User,
				"Du fï¿½llst die Flasche mit einer weiï¿½en Flï¿½ssigkeit.",
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
				"Anscheinend ist keine Flï¿½ssigkeit mehr für dich ï¿½brig.",
				"Obviously there is no liquid left for you.");
			end
		end
	end
end