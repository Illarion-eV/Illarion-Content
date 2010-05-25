--Buch
function UseItem(User,SourceItem,TargetItem,Counter,Param)    
    if ((TargetItem.id == 266) or (TargetItem.id == 267)) then
        world:erase(SourceItem,1);
        return
    end
    
    if (SourceItem.id == 1) then
        if (User:getPlayerLanguage() == 0) then
            if (User:get_race() ~= 4) then
                User:inform("Diese Play-Ork Sonderausgabe zeigt kaum bekleidete, schwergewichtige Ork-Damen, die lüstern grinsend mit schweren, zweihändigen Klingenwaffen posieren.");
            else
                User:inform("Diese Play-Ork Sonderausgabe zeigt gut gebaute, wohlgerundete Orkinnen mit schweren Äxten - was will ein Krieger mehr?");
            end         
        else
            if (User:get_race() ~= 4) then
                User:inform("This Play-Orc special edition shows barely clothed, heavyweight Orc-women, who are posing lustful grining with heavy, two handed slashing weapons.");
            else
                User:inform("This Play-Orc special edition shows well-built, well-rounded Orcesses with heavy axes - what else does a worrior need?");
            end
        end
        return
    end
    if Counter ==1 then User:inform("You find nothing new in this book ") end
     --User:learn(4,"library research",2,100)
end

function LookAtItem(User,Item)
    if ( User:getPlayerLanguage() == 0 ) then
        if ( Item.data == 1) then
            world:itemInform( User, Item, "Du siehst eine Play-Ork Sonderausgabe" );
        else
            world:itemInform( User, Item, "Du siehst "..world:getItemName( Item.id, 0 ) );
        end
    else
        if (Item.data == 1) then
            world:itemInform( User, Item, "You see a Play-Orc special editon" );
        else
            world:itemInform( User, Item, "You see "..world:getItemName( Item.id, 1 ) );
        end
    end
end