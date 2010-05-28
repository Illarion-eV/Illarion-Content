-- Location: -29 193 -8
-- Purpose: react on by mirror expandable ladder

require("quest_isItemIdInFieldStack")
require("quest_removeItemIdFromFieldStack")

module("triggerfield.aq001_mirror", package.seeall)

function MoveFromField( user )

    if( isItemIdInFieldStack( 35, position(-32, 193, -8) ) ) then
        if user:getPlayerLanguage()==0 then
            user:inform("Als du dich entfernst ist die Leiter verschwunden...");
        else
            user:inform("As you turn away, the ladder has vanished...");
        end
        removeItemIdFromFieldStack( 35, position(-32, 193, -8) );
    end;
    
end


function CharacterOnField( user )

    if( isItemIdInFieldStack( 35, position(-32, 193, -8) ) and ( user:get_face_to() ~= 2 ) ) then
        if user:getPlayerLanguage()==0 then
            user:inform("Als du dich wegdrehst ist die Leiter verschwunden...");
        else
            user:inform("As you turn away, the ladder has vanished...");
        end
        removeItemIdFromFieldStack( 35, position(-32, 193, -8) );
    end;

end