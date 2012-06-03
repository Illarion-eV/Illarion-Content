require("base.doors")
require("base.keys")
module("scheduled.closedoors", package.seeall)

function AddClosingDoor(DX, DY, DZ, DTime, DLock)  -- DX, DY, DZ: Coordinates, DTime: cycles to survive opened, DLock: 0 if it should be closed but not locked, 1 if it should be closed AND locked
    if (DLock==0) then
        newQual=233;
    else
        newQual=333;
    end
    table.insert(DoorsToClose,{DX, DY, DZ, DTime, newQual});
    table.insert(DoorCloseCountdown,DTime)
end

function initDoorsToClose()    -- add doors to be closed
    AddClosingDoor(-35, 195,-9,3,1);
    AddClosingDoor(-35, 196,-9,3,1);
    AddClosingDoor(-42, 193,-9,3,1);
    AddClosingDoor(-49, 174,-9,3,1);
    AddClosingDoor(-49, 175,-9,3,1);
end

function checkAllDoors(DoorsToClose)        -- loop through all doors in the list and check wheter we should do something
    for DoorNr=1, table.getn(DoorsToClose) do       -- loop through all doors that should be closed
        thisDoorPos=position(DoorsToClose[DoorNr][1],DoorsToClose[DoorNr][2],DoorsToClose[DoorNr][3]);  -- get position of that door
        if world:isItemOnField(thisDoorPos) then
            thisDoor=world:getItemOnField(thisDoorPos);     -- get this door
            doorOOK, doorDummy=base.doors.CheckOpenDoor(thisDoor.id);      -- check whether it IS a door and if it's opened and its position in the list of doors
            doorCOK, doorDummy2=base.doors.CheckClosedDoor(thisDoor.id);
            if (doorOOK) then                 -- if it is an open door
                if (DoorCloseCountdown[DoorNr]==1) then    -- door should be closed now
                    base.doors.CloseDoor(thisDoor);    -- so, close it
                    if DoorsToClose[DoorNr][5]==333 then        -- should door be locked?
                        thisDoor=world:getItemOnField(thisDoorPos);  -- get door object again
                        base.keys.LockDoor(thisDoor);     -- lock it
                    end
                    DoorCloseCountdown[DoorNr]=DoorsToClose[DoorNr][4];     -- for the next closing procedure
                else    -- door not yet to close but opened, count down timer
                    DoorCloseCountdown[DoorNr]=DoorCloseCountdown[DoorNr]-1;
                end
            elseif (doorCOK and thisDoor.quality~=333) then
                base.keys.LockDoor(thisDoor);
            end
        end
    end
end

function closeDoors()
    if firstCall==nil then
        firstCall=1;
        DoorCloseCountdown={};
        DoorsToClose={};
        initDoorsToClose(); -- init list of all doors that should be closed
    end
    checkAllDoors(DoorsToClose);
end
