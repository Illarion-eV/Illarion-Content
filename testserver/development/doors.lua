-- by Merung
require("development.doors")

module("development.doors", package.seeall)


function initDoors()
    -- AddDoor(x, y, z, lockData) -- description
	
	-- Galmair 1xx
	AddDoor( 341, 207, 0, 100); -- Don's private room

    -- Runewick 2xx

	-- Cadomyr 3xx
	
	

end

function AddDoor(DoorX,DoorY,DoorZ,lockId)
    DoorPos=position(DoorX,DoorY,DoorZ);
    if world:isItemOnField(DoorPos) then
        thisDoor = world:getItemOnField(DoorPos);
        doorOOK = base.doors.CheckOpenDoor(thisDoor.id);
        doorCOK = base.doors.CheckClosedDoor(thisDoor.id);
        if (doorOOK or doorCOK) then
            if (doorOOK) then
                    base.doors.CloseDoor(thisDoor);
				end
            end
			thisDoor:setData("lockId", lockId);
            thisDoor:setData("doorLock","locked")
            world:changeItem(thisDoor);
        end
    end
end