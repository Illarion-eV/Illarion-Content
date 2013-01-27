require("base.common")
require("base.lookat")

module("content.doors", package.seeall)


function initDoors()
    -- AddDoor({x, y, z}, lockId, lookAtEN, lookAtDE) -- description
	-- if you want no lookat, just use false: AddDoor({1, 1, 1}, 343, false, false)
	-- if you just want lookats, but no lock: AddDoor({1, 1, 1}, false, "Door without lock", "Tür ohne Schloss")
	
	-- Galmair 1xx
	AddDoor({341, 207, 0}, 100,"Private chamber of the Don","Privatkammer des Dons"); -- Don's private room

    -- Runewick 2xx

	-- Cadomyr 3xx
	
	-- Irundar xxx
    --AddDoor( -42, 193, -9,  X00); -- Irundar Gate
    --AddDoor( -49, 174, -9,  X01); -- Irundar Smith
    --AddDoor( -49, 175, -9,  X01); -- Irundar Smith
    --AddDoor( -35, 195, -9,  X02); -- Irundar Mage Tower
    --AddDoor( -35, 196, -9,  X02); -- Irundar Mage Tower
    --AddDoor( -30, 194, -7,  X03); -- Irundar Mage Tower
    --AddDoor( -53, 159, -9,  X04); -- Irundar General Store
    --AddDoor( -50, 166, -9,  X04); -- Irundar General Store
    --AddDoor( -51, 166, -9,  X04); -- Irundar General Store
    --AddDoor( -47, 147, -9,  X05); -- Irundar Castle - Advisor
    --AddDoor( -45, 149, -9,  X05); -- Irundar Castle - Advisor
    --AddDoor( -44, 150, -8,  X06); -- Irundar Castle - Bedroom
    --AddDoor( -44, 151, -8,  X06); -- Irundar Castle - Bedroom
    --AddDoor( -44, 143, -8,  X07) -- Irundar Castle - Storage Room
    --AddDoor( -49, 142, -8,  X08); -- Irundar Castle - Tower
	
end

function AddDoor(posList,lockId, lookAtEN, lookAtDE)
    local DoorPos=position(posList[1],posList[2],posList[3]);
	if world:isItemOnField(DoorPos) then
        local thisDoor = world:getItemOnField(DoorPos);
        local doorOOK = base.doors.CheckOpenDoor(thisDoor.id);
        local doorCOK = base.doors.CheckClosedDoor(thisDoor.id);
        if (doorOOK or doorCOK) then
            if lockId then
				thisDoor:setData("lockId", lockId);
				thisDoor:setData("doorLock","locked")
			end
			if lookAtEN and lookAtDE then
			    base.lookat.SetSpecialDescription(thisDoor,LookAtDE,lookAtEN)
			end	
			world:changeItem(thisDoor);
			if (doorOOK) then
                base.doors.CloseDoor(thisDoor);
			end
		end
    end
end	