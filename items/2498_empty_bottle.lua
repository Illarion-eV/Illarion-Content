-- Fairy's Tears oder Trolls Blood erhalten (Quellwasser)
-- Alternativ: Gesegnetes Wasser von Irundar erhalten
-- vilarion

-- UPDATE common SET com_script='items.2498_empty_bottle' WHERE com_itemid IN (2498);

module("items.2498_empty_bottle", package.seeall)

function UseItemWithField(User,SourceItem,TargetPos,Counter,Param)
    --User:inform("using bottle on field");
    if ((User:getItemAt(6).id == 2498)or(User:getItemAt(5).id == 2498)) then
        --User:inform("bottle in hand");
        if (User:getItemAt(6).id == 2498) then
            itempos = 6;
        else 
            itempos = 5;
        end
        bottles = User:getItemAt(itempos);
        number = bottles.number;
        -- if at trolls vein spring
        if ((TargetPos.x == 51) and (TargetPos.y==-55) and (TargetPos.z==0)) then
            --User:inform("at vein");
           world:erase(SourceItem,number);
           User:createAtPos(itempos, 2496, number);
           bottles = User:getItemAt(itempos);
           bottles.data = 1;
           bottles.number = number;
           world:changeItem(bottles);
        end
        if ((TargetPos.x == 116) and (TargetPos.y==-121) and (TargetPos.z==0)) then
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


function UseItem(User,SourceItem,TargetItem,Counter,Param)
    if ((User:getItemAt(6).id == 2498)or(User:getItemAt(5).id == 2498)) then
        --User:inform("bottle in hand");
        if (User:getItemAt(6).id == 2498) then
            itempos = 6;
        else 
            itempos = 5;
        end
        bottles = User:getItemAt(itempos);
        if equapos( TargetItem.pos, position( 32, 190, -12 ) ) then
            local progress = User:getQuestProgress(1);
            if ((LuaAnd( progress, 64 ) == 0) or (LuaAnd( progress, 3840 ) ~= (world:getTime("month")-1)*256)) then
		if ( User:createItem( 2496, 1, 999, 3 ) == 0 ) then
			world:erase(bottles,1);
			world:gfx(41,User.pos);
			world:gfx(41,position( 25, 190, -12 ));
			world:makeSound(13,User.pos);
			world:makeSound(13,position( 25, 190, -12 ));
			User:warp(position( 25, 190, -12 ));
			
	                progress = LuaOr( progress, 64 ); -- set "fetched at least once"
        		progress = LuaAnd( progress, 4294963455 ); -- clear bit 9-12 (last month when fetched)
        		progress = LuaOr( progress, (world:getTime("month")-1)*256 ); -- set bit 13-16 (last month when fetched)
        		User:setQuestProgress( 1, progress );
		end;
            else
                if User:getPlayerLanguage(  ) == 0 then
		    User:inform("Der Springbrunnen ist ausgetrocknet.");
		else
		    User:inform("The fountain has dried up.");
		end;
            end;
        end;
    end;
end
