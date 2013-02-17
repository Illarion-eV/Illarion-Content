require("base.common")
require("base.lookat")

module("content.doors", package.seeall)


function initDoors()
    -- AddDoor({x, y, z}, lockId, lookAtEN, lookAtDE) -- description
	-- if you want no lookat, just use false: AddDoor({1, 1, 1}, 343, false, false)
	-- if you just want lookats, but no lock: AddDoor({1, 1, 1}, false, "Door without lock", "Tür ohne Schloss")
	
	-- Galmair 1xx
	AddDoor({341, 207, 0}, 100,"Golden Dreams, the private chamber of the Don","Goldträume, die Privatkammer des Dons"); -- Don's private room

    -- Runewick 2xx
    --Tower of Fire 20x
    AddDoor({901, 763, 2}, 200,"Archmage Elvaine Morgan's rooms", "Die Räumlichkeiten von Erzmagier Elvaine Morgan"); -- Archmage's room
    AddDoor({901, 764, 2}, 200,"Archmage Elvaine Morgan's rooms", "Die Räumlichkeiten von Erzmagier Elvaine Morgan"); -- Archmage's room
 
	AddDoor({902, 770, 4}, 201,"Tower of Fire Apartment 1","Turm des Feuers Appartment 1") -- 2 Persons
    AddDoor({902, 771, 4}, 201,"Tower of Fire Apartment 1","Turm des Feuers Appartment 1") -- 2 Persons

    AddDoor({902, 777, 4}, 202,"Tower of Fire Apartment 1","Turm des Feuers Appartment 2") -- 3 Persons	+ Balcony	
    AddDoor({903, 777, 4}, 202,"Tower of Fire Apartment 1","Turm des Feuers Appartment 2") -- 3 Persons	+ Balcony	
            
    
    --Tower of Air 21x
    AddDoor({907, 833, 4}, 210,"Tower of Air Apartment 1","Turm der Luft Appartment 1") -- 2 Persons
    AddDoor({906, 833, 4}, 210,"Tower of Air Apartment 1","Turm der Luft Appartment 1") -- 2 Persons
    
    AddDoor({898, 834, 4}, 211,"Tower of Air Apartment 2","Turm der Luft Appartment 2") -- 3 Persons
    AddDoor({898, 835, 4}, 211,"Tower of Air Apartment 2","Turm der Luft Appartment 2") -- 3 Persons
    
    --Tower of Earth 22x
    AddDoor({946, 763, 4}, 220,"Tower of Earth Apartment 1","Turm der Erde Appartment 1") -- 3 Persons
    AddDoor({947, 763, 4}, 220,"Tower of Earth Apartment 1","Turm der Erde Appartment 1") -- 3 Persons
            
    AddDoor({946, 759, 4}, 221,"Tower of Earth Apartment 2","Turm der Erde Appartment 2") -- 1 Person
    AddDoor({947, 759, 4}, 221,"Tower of Earth Apartment 2","Turm der Erde Appartment 2") -- 1 Person
    
    AddDoor({944, 764, 2}, 222,"Tower of Earth Apartment 3","Turm der Erde Appartment 3") -- 2 Persons + Balcony
    AddDoor({944, 765, 2}, 222,"Tower of Earth Apartment 3","Turm der Erde Appartment 3") -- 2 Persons + Balcony

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
			    world:changeItem(thisDoor)
			end
			if lookAtEN and lookAtDE then
			    base.lookat.SetSpecialDescription(thisDoor,lookAtDE,lookAtEN)
				world:changeItem(thisDoor)
			end	
			if (doorOOK) then
                base.doors.CloseDoor(thisDoor);
			end
		end
    end
end	
