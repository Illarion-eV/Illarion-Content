-- warps upstairs if the loo is not occupied 
-- position: -72, -67, -3
-- author: vilarion

require("base.keys")

module("triggerfield.loo_ladder", package.seeall)

function MoveToField( User )

    local bucket = world:getItemOnField( position( -72, -69, 0 ) );
    local door = world:getItemOnField( position( -74, -68, 0 ) );
    if not ( bucket.id == 52 and door.quality == 333 and base.doors.CheckClosedDoor( door.id ) ) then
        User:warp( position( -72, -67, 0 ) );
    else
        User:inform( ( User:getPlayerLanguage(  ) == 0 and "Der Ort, zu dem diese Leiter reicht, scheint besetzt zu sein." or "The place where this ladder leads to seems to be occupied." ) );
    end;
end
