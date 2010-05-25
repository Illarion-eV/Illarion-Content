-- Osterquest Spezialscript

function LookAtItem(User,Item)
    if ( User:getPlayerLanguage() == 0 ) then
        if ( ( Item.data == 1) or ( Item.data == 2 ) ) then
            world:itemInform( User, Item, "Du siehst ein bunt angemaltes, eiförmiges Objekt." );
        else
            world:itemInform( User, Item, "Du siehst "..world:getItemName( Item.id, 0 ) );
        end
    else
        if ( ( Item.data == 1) or ( Item.data == 2 ) ) then
            world:itemInform( User, Item, "You see a colorful painted object with the shape of an egg." );
        else
            world:itemInform( User, Item, "You see "..world:getItemName( Item.id, 1 ) );
        end
    end
end

function UseItem( User, SourceItem, TargetItem, Counter, Param, LTState )
    if ( ( SourceItem.data == 1) or ( SourceItem.data == 2 ) ) then
        if ( User:getPlayerLanguage() == 0 ) then
            User:inform("Du untersuchst dieses Objekt und findest heraus das man es öffnen kann. Du öffnest es und findest etwas...");
        else
            User:inform("You look at that object and find out that you can open it. You open it and find something...");
        end
        if ( SourceItem.data == 2 ) then
            User:createItem(3109,1,333,2);
        else
            Itemlist = {6,9,15,22,23,24,34,45,46,51,52,58,59,61,62,63,68,72,73,81,90,92,97,126,155,159,165,167,201,225,222,224,234,235,271,277,278,279,280,281,282,283,284,285,291,303,306,311,312,322,327,328,329,330,331,332,333,334,335,336,353,354,355,356,374,388,549,553,555,1318,1319,1840,1858,1909,2276,2493,2502,2494,2529,2535,2550,2551,2552,2553,2554,2571,2647,2744,2752,2760,2917,2934,3051,3076,3077};
            User:createItem(Itemlist[math.random(1,table.getn(Itemlist))],1,555,0);
        end
        world:erase(SourceItem,1);
    end
end