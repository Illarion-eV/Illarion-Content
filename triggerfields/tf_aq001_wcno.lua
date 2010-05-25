-- Location: 33 185 -12
-- Purpose: switch for secret passage to well

dofile("quest_isItemIdInFieldStack.lua")
dofile("quest_removeItemIdFromFieldStack.lua")

function MoveToField( user )

    user:inform("*click*");
    if( world:isCharacterOnField(position( 33, 195, -12)) ) then
        removeItemIdFromFieldStack( 287, position( 28, 190, -12) );
    end;

end


function MoveFromField( user )

    user:inform("*clack*");
    if( not isItemIdInFieldStack( 287, position( 28, 190, -12) ) ) then
        world:createItemFromId( 287, 1, position( 28, 190, -12), true, 333,0 );
    end;

end
