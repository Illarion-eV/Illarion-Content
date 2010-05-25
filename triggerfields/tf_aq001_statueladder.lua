-- Location: -29 195 -9
-- Purpose: react on by statue expandable ladder

dofile("quest_isItemIdInFieldStack.lua")
dofile("quest_removeItemIdFromFieldStack.lua")

function MoveToField( user )
    
    if( isItemIdInFieldStack( 35, position(-29, 195, -9) ) ) then
        user:warp( position( -30, 195, -8 ) );
        removeItemIdFromFieldStack( 35, position(-29, 195, -9) );
    end;
    
end