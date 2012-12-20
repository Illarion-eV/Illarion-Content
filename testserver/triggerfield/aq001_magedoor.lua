-- Location: -37 195 -9 && -37 196 -9 && -36 195 -9 && -36 196 -9
-- Purpose: Opens the Mage Tower with keyword Lothlendar

require("base.keys")

module("triggerfield.aq001_magedoor", package.seeall)

function CharacterOnField(Character)
    if( string.find( Character.lastSpokenText, "[Ll][Oo][Tt][Hh][Ll][Ee][Nn][Dd][Aa][Rr]" ) ~= nil ) then
        local doora=world:getItemOnField(position( -35, 195, -9 ));
        local doorb=world:getItemOnField(position( -35, 196, -9 ));
        base.keys.UnlockDoor( doora );
        base.keys.UnlockDoor( doorb );
        doora=world:getItemOnField(position( -35, 195, -9 ));
        doorb=world:getItemOnField(position( -35, 196, -9 ));
        OpenDoor( doora );
        OpenDoor( doorb );
    end
end
