-- Script for Vartaroth Sword (only he and the questchar can take this sword)
dofile( "base_weap_lookat_metal.lua" );
require("base.common")
function MoveItemBeforeMove( who, sourceItem, targetItem)
    -- check if its the Vartaroth sword
    if ( sourceItem.data == 50 ) then 
        if ( who.id == 706080789 or who.id == 2145878323 ) then
            return true;
        else
            base.common.InformNLS( who,"Eiseskaelte durchstroemt deinen Arm als du das Schwert beruehrst. Du kannst es nicht aufheben.","A freezing cold travels through your arm as you touch the sword. You can't pick it up");
            return false;
        end
    end
    return true;
end

function LookAtItem(User,Item)
    if ( Item.data == 50 ) then
        if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Du siehst das unheilige Schwert von Vartaroth");            
        else
            world:itemInform(User,Item,"You see the unholy sword of Vartaroth");
        end
    else
        world:itemInform(User,Item,GetItemDescription(User,Item,1,false,false ));
    end
end


