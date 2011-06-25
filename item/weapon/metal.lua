require("base.lookat")

module("item.weapon.metal", package.seeall)

-- UPDATE common SET com_script='item.weapon.metal' WHERE com_itemid IN (25,27,77,78,88,91,188,189,190,204,205,206,226,230,231,283,2626,2627,2629,2635,2636,2642,2645,2654,2655,2656,2658,2660,2662,2668,2671,2672,2675,2689,2693,2694,2701,2704,2705,2723,2725,2731,2737,2740,2742,2757,2775,2777,2778,2788);

function LookAtItem(User,Item)
    if ((Item.id == 2701) and (Item.data == 50)) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Runenverziertes Langschwert");
        else            
            world:itemInform(User,Item,"rune ornated longsword");
        end
    elseif ((Item.id == 3035) and (Item.data == 50)) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Schwert des Arena Siegers");            
        else
            world:itemInform(User,Item,"Sword of the Arena Champion");
        end
    elseif ((Item.id == 95) and (Item.data == 50)) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Wappenschild des grauen Lichtes");            
        else
            world:itemInform(User,Item,"heraldic shield of the grey light");
        end
    elseif ((Item.id==27) and (Item.data == 10000)) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Auffälliger Dolch");            
        else
            world:itemInform(User,Item,"peculiar dagger");
        end
    else
        world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,1,true,false ));
    end
end

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltState)
    if ((SourceItem.id == 2701) and (SourceItem.data == 50)) then
        if (User:getSkill("dwarf language") > 70) then
            if (User:getPlayerLanguage() == 0) then
                User:inform("Du bist in der Lage die Runen als eine Art Zwergenrunen zu identifizieren.");
                User:inform("Auf dem Schwert steht soviel wie: \"Ich bin das Schwert des Kriegers der in der Gunst der Vorväter der Norodaj steht.\"");
            else
                User:inform("You are able to identify the runes as a kind of dwarven runes.");
                User:inform("On the sword is something written like: \"I'm the sword of the warrior who has the grace of the ancestors of the Norodaj.\"");
            end 
        elseif (User:increaseAttrib("intelligence",0) > 15) then
            if (User:getPlayerLanguage() == 0) then
                User:inform("Du kannst die Schrift nicht lesen, aber du meinst das diese Runen wohl Zwergenrunen sind.");
            else
                User:inform("You can't read whats written here. But you think these runes could be dwarfen runes.");
            end
        else
            if (User:getPlayerLanguage() == 0) then
                User:inform("Du kannst die Runen nicht auf dem Schwert nicht deuten.");
            else
                User:inform("You don't know what the runes on the sword are about.");
            end
        end
    -- added by abcfantasy: blessed longsword
    elseif ( (SourceItem.id == 2701 ) and ( SourceItem.data == 100 ) ) then
        if ( ( SourceItem.itempos == 5 ) or ( SourceItem.itempos == 6 ) ) then
            found, blsEffect = User.effects:find( 2701 );
            
            if ( not found ) then
                blsEffect = CLongTimeEffect( 2701, 18000 );
                --blsEffect = CLongTimeEffect( 2701, 600 );
                User.effects:addEffect( blsEffect );
            else
                User:inform( "The power of the sword appears to be drained." );
            end;   
        else
            User:inform( "You must be wielding the sword to invoke its power." );
        end;      
    end;
end
