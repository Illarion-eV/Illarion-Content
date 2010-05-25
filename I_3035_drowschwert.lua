-- Script for Vartaroth Sword (only he and the questchar can take this sword)
dofile( "base_lookat.lua" );
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
    world:itemInform(User,Item,base.lookat.GetItemDescription(User,Item,1,false,false ));
end


