-- Location: -37 195 -9 && -37 196 -9 && -36 195 -9 && -36 196 -9
-- Purpose: Opens the Mage Tower with keyword Lothlendar

require("base.keys")

function CharacterOnField(Character)
    if( string.find( Character.lastSpokenText, "[Ll][Oo][Tt][Hh][Ll][Ee][Nn][Dd][Aa][Rr]" ) ~= nil ) then
        --local doora = GetDoorItem( position( -35, 195, -9 ) );
        --local doorb = GetDoorItem( position( -35, 196, -9 ) );
        local doora=world:getItemOnField(position( -35, 195, -9 ));
        local doorb=world:getItemOnField(position( -35, 196, -9 ));
        --Character:inform("got doors: "..doora.id.." && "..doorb.id);
        --Character:inform("doors qual: "..doora.quality.." && "..doorb.quality);
        base.keys.UnlockDoor( doora );
        base.keys.UnlockDoor( doorb );
        --if a then Character:inform("unlocked: true") else Character:inform("unlocked: false") end;
        doora=world:getItemOnField(position( -35, 195, -9 ));
        doorb=world:getItemOnField(position( -35, 196, -9 ));
        OpenDoor( doora );
        OpenDoor( doorb );
        --Character:inform("opened");
    end
end
