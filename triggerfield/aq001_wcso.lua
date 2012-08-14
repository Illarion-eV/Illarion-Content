-- Location: 33 195 -12
-- Purpose: switch for secret passage to well

require("base.common")

module("triggerfield.aq001_wcso", package.seeall)

function MoveToField( user )

    if( world:isCharacterOnField(position( 33, 185, -12)) ) then
        base.common.removeItemIdFromFieldStack( 287, position( 28, 190, -12) );
    end;

end


function MoveFromField( user )

    if( not base.common.isItemIdInFieldStack( 287, position( 28, 190, -12) ) ) then
        world:createItemFromId( 287, 1, position( 28, 190, -12 ), true, 333, 0 );
    end;

end
