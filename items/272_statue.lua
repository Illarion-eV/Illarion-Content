require("base.common")

module("items.272_statue", package.seeall)

-- UPDATE common SET com_script='items.272_statue' WHERE com_itemid=272;

function UseItem( User, Item, TargetItem, counter, param )
    lang=User:getPlayerLanguage();
    if equapos(Item.pos,position(-28, 192, -9)) then
        if ( not base.common.isItemIdInFieldStack( 35, position(-29, 195, -9) ) ) then
            if lang==0 then
                User:inform("W�hrend du vorsichtig die Statue abtastest �ffnet sich pl�tzlich eine Luke in der Decke und eine h�lzerne Leiter f�hrt herab.");
            else
                User:inform("While you carefully feel the statue, suddenly a hatch in the ceiling opens and a wooden ladder slides down.");
            end
            world:createItemFromId( 35, 1, position(-29, 195, -9), true, 999,0 );
        else
            if lang==0 then
                User:inform("Nachdem du den verborgenen Schalter erneut bet�tigst gleitet die Leiter zur�ck in die Decke und die Luke schlie�t sich wieder.");
            else
                User:inform("After touching the hidden switch again the ladder slides back into the ceiling and the batch closes again.");
            end
            base.common.removeItemIdFromFieldStack( 35, position(-29, 195, -9) );
        end
    elseif equapos(Item.pos,position(-389,-218,2)) then
        if ((User:increaseAttrib("essence",0)+User:increaseAttrib("willpower",0)+User:increaseAttrib("intelligence",0))>29) then
            User:warp(position(102,56,52));
            if lang==0 then
                User:inform("Als du die Statue ber�hrst verschwimmt die Welt um dich und dir wird schwummrig. Als du wieder klar siehst, bist du an einem v�llig anderen Ort");
            else
                User:inform("You touch the statue and the world around you become blurred and you feel a little strange. A moment after you can see clearly again and you are on a completly other place");
            end
        end
    elseif equapos(Item.pos,position(102,55,52)) then
        User:warp(position(-389,-217,2));
        if lang==0 then
            User:inform("Als du die Statue ber�hrst verschwimmt die Welt um dich und dir wird schwummrig. Als du wieder klar siehst, bist du an einem v�llig anderen Ort");
        else
            User:inform("You touch the statue and the world around you become blurred and you feel a little strange. A moment after you can see clearly again and you are on a completly other place");
        end
    elseif equapos(Item.pos,position(-60,-229,0)) then
        for i=-69,-61 do
            posi = position(i,-227,0);
            item = world:createItemFromId(3097,1,posi,true,333,0);
            item.wear = 2;
            world:changeItem(item);
            if world:isCharacterOnField(posi) then
                item = world:createItemFromId(3101,1,posi,true,333,0);
                item.wear = 3;
                world:changeItem(item);
                Char = world:getCharacterOnField(posi);
                Char:increaseAttrib("hitpoints",-3000);
                Char:warp(i,-226,0);
            end
        end
    end            
end
