-- Location: -32 193 -8
-- Purpose: react on by mirror expandable ladder

dofile("quest_isItemIdInFieldStack.lua")

function MoveToField( user )
    
    if( isItemIdInFieldStack( 35, position(-32, 193, -8) ) ) then
        user:warp( position( -31, 193, -7 ) );
    end;
    
end