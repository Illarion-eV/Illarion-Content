-- shuts the loo door on entering and fills the bucket with water
-- position: -73, -68, 0
-- author: vilarion

require("base.keys")

module("triggerfield.loo_door", package.seeall)

function MoveToField( User )

    if User:getFaceTo() == 2 then -- looking east, probably walking inside
        local door = world:getItemOnField( position( -74, -68, 0 ) );
        base.doors.CloseDoor( door );
        door = world:getItemOnField( position( -74, -68, 0 ) );
        base.keys.LockDoor( door );
        door = world:getItemOnField( position( -74, -68, 0 ) );
        if door.quality == 333 and base.doors.CheckClosedDoor( door.id ) then
            local bucket = world:getItemOnField( position( -72, -69, 0 ) );
            if bucket.id == 51 then
                bucket.id = 52;
                world:changeItem( bucket );
            elseif bucket.id == 524 then
                bucket = world:createItemFromId( 52, 1, position( -72, -69, 0 ), true, 333, 0 );
                bucket.wear = 255;
                world:changeItem( bucket );
            end;
        end;
    end;
end
