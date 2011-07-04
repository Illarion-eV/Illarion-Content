-- warps you downstairs with the keyword and opens the door / empties the bucket
-- position: -72, -67, 0
-- author: vilarion

require("base.keys")

module("triggerfield.loo_seat", package.seeall)

function CharacterOnField(Character)
    if( string.find( Character.lastSpokenText, "[Hh][Oo][Kk][Uu][Ss][Ll][Oo][Kk][Uu][Ss]" ) ~= nil ) then
        local bucket = world:getItemOnField( position( -72, -69, 0 ) );
        local door = world:getItemOnField( position( -74, -68, 0 ) );
        if bucket.id == 52 and door.quality == 333 and CheckClosedDoor( door.id ) then
            base.keys.UnlockDoor( door );
            door = world:getItemOnField( position( -74, -68, 0 ) );
            base.doors.OpenDoor( door );
            bucket.id = 51;
            world:changeItem( bucket );
            Character:warp( position( -72, -67, -3 ) );
        end;
    end;
end;
