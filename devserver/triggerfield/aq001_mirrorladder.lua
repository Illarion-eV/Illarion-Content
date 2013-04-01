-- Location: -32 193 -8
-- Purpose: react on by mirror expandable ladder

require("base.common")

module("triggerfield.aq001_mirrorladder", package.seeall)

function MoveToField( user )
    
    if( base.common.isItemIdInFieldStack( 35, position(-32, 193, -8) ) ) then
        user:warp( position( -31, 193, -7 ) );
    end;
    
end
