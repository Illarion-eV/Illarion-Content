-- Fairy's Tears oder Trolls Blood erhalten (Quellwasser)
-- Alternativ: Gesegnetes Wasser von Irundar erhalten
-- vilarion

-- UPDATE common SET com_script='item.id_2498_empty_bottle' WHERE com_itemid IN (2498);

require("base.common");
module("item.id_2498_empty_bottle", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if (base.common.IsItemInHands(SourceItem)) then
        -- bottle in hand
		local frontPos = base.common.GetFrontPosition(User);
		-- TODO: convert quests & positions to New Illarion
        -- if ( frontPos == position( 32, 190, -12 ) ) then -- Irundar
            -- local progress = User:getQuestProgress(1);
            -- if ((LuaAnd( progress, 64 ) == 0) or (LuaAnd( progress, 3840 ) ~= (world:getTime("month")-1)*256)) then
				-- if ( User:createItem( 2496, 1, 999, 3 ) == 0 ) then
					-- world:erase(SourceItem,1);
					-- world:gfx(41,User.pos);
					-- world:gfx(41,position( 25, 190, -12 ));
					-- world:makeSound(13,User.pos);
					-- world:makeSound(13,position( 25, 190, -12 ));
					-- User:warp(position( 25, 190, -12 ));
					
					-- progress = LuaOr( progress, 64 ); -- set "fetched at least once"
					-- progress = LuaAnd( progress, 4294963455 ); -- clear bit 9-12 (last month when fetched)
					-- progress = LuaOr( progress, (world:getTime("month")-1)*256 ); -- set bit 13-16 (last month when fetched)
					-- User:setQuestProgress( 1, progress );
				-- end;
			-- else
				-- if User:getPlayerLanguage(  ) == 0 then
					-- User:inform("Der Springbrunnen ist ausgetrocknet.");
				-- else
					-- User:inform("The fountain has dried up.");
				-- end;
            -- end;
		-- elseif (frontPos == position(51, -55, 0)) then -- Troll's Vein
            -- --User:inform("at vein");
			-- local itempos = SourceItem.itempos;
			-- local number = SourceItem.number;
			-- world:erase(SourceItem,number);
			-- User:createAtPos(itempos, 2496, number);
			-- local bottles = User:getItemAt(itempos);
			-- bottles.data = 1;
			-- bottles.number = number;
			-- world:changeItem(bottles);
		-- elseif (frontPos == position(116, -121, 0)) then -- Fairy's Tears
            -- --User:inform("at tears");
			-- local itempos = SourceItem.itempos;
			-- local number = SourceItem.number;
			-- world:erase(SourceItem,number);
			-- User:createAtPos(itempos, 2496, number);
			-- local bottles = User:getItemAt(itempos);
			-- bottles.data = 2;
			-- bottles.number = number;
			-- world:changeItem(bottles);
        -- end;
    end;
end
