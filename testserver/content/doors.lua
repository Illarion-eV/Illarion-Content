require("base.common")
require("base.lookat")

module("content.doors", package.seeall)


function initDoors()
    -- AddDoor({x, y, z}, lockId, lookAtEN, lookAtDE) -- description
	-- if you want no lookat, just use false: AddDoor({1, 1, 1}, 343, false, false)
	-- if you just want lookats, but no lock: AddDoor({1, 1, 1}, false, "Door without lock", "Tür ohne Schloss")
	
	-- Galmair 1xx
	AddDoor({341, 207, 0}, 100,"Golden Dreams, the private chamber of the Don","Goldträume, die Privatkammer des Dons"); -- Don's private room !create 2141 1 333 lockId=100
	AddDoor({352, 213, 0}, 101,"Schatzkammer","Treasury"); -- Don's treasury !create 3055 1 333 lockId=101
	AddDoor({352, 214, 0}, 101,"Schatzkammer","Treasury"); -- Don's treasury !create 3055 1 333 lockId=101
	AddDoor({352, 215, 0}, 101,"Schatzkammer","Treasury"); -- Don's treasury !create 3055 1 333 lockId=101

	AddDoor({373, 222, 0}, 110,"Malachite Haus","House of Malachite"); -- guild house I !create 2145 1 333 lockId=110
	AddDoor({301, 280, 0}, 111,"Villa Goldader","Villa Goldvein"); -- guild house II !create 2145 1 333 lockId=111
	AddDoor({304, 274, 0}, 111,"Villa Goldader","Villa Goldvein"); -- guild house II !create 2145 1 333 lockId=111

	AddDoor({416, 217,-6}, 120,"Wohnung Adron","Flat Adron"); -- flat room I - 2p !create 2161 1 333 lockId=120
	AddDoor({425, 222,-6}, 121,"Wohnung Elara","Flat Elara"); -- flat room II - 3p !create 2161 1 333 lockId=121
	AddDoor({424, 231,-6}, 122,"Wohnung Irmorom","Flat Irmorom"); -- flat room III - 1p !create 2161 1 333 lockId=122
	AddDoor({423, 241,-6}, 123,"Wohnung Malachin","Flat Malachin"); -- flat room IV - 2p !create 2161 1 333 lockId=123
	AddDoor({416, 239,-6}, 124,"Wohnung Oldra","Flat Oldra"); -- flat room V - 4p !create 2161 1 333 lockId=124
	AddDoor({425, 241,-5}, 125,"Wohnung Nargun","Flat Nargun"); -- flat room VI - 2p !create 2161 1 333 lockId=125
	AddDoor({426, 231,-5}, 126,"Wohnung Ronagan","Flat Ronagan"); -- flat room VII - 2p !create 2161 1 333 lockId=126
	AddDoor({427, 221,-5}, 127,"Wohnung Sirani","Flat Sirani"); -- flat room VIII - 3p !create 2161 1 333 lockId=127
	AddDoor({416, 216,-5}, 128,"Wohnung Zhambra","Flat Zhambra"); -- flat room IX - 3p !create 2161 1 333 lockId=128

	AddDoor({342, 238,-6}, false,"Schweinebaue","Hog Dens"); -- Scoria Mine
	AddDoor({342, 239,-6}, false,"Schweinebaue","Hog Dens"); -- Scoria Mine
	AddDoor({385, 193,-6}, false,"Schweinebaue","Hog Dens"); -- Scoria Mine
	AddDoor({386, 193,-6}, false,"Schweinebaue","Hog Dens"); -- Scoria Mine
	AddDoor({381, 208,-6}, false,"Schweinebaue","Hog Dens"); -- Scoria Mine
	AddDoor({381, 209,-6}, false,"Schweinebaue","Hog Dens"); -- Scoria Mine
	AddDoor({344, 244,-6}, false,"Gemmenschacht","Cameo Pit"); -- Scoria Mine
	AddDoor({344, 245,-6}, false,"Gemmenschacht","Cameo Pit"); -- Scoria Mine
	AddDoor({392, 220,-6}, false,"Gemmenschacht","Cameo Pit"); -- Scoria Mine
	AddDoor({393, 220,-6}, false,"Gemmenschacht","Cameo Pit"); -- Scoria Mine
	AddDoor({382, 241,-6}, false,"Gemmenschacht","Cameo Pit"); -- Scoria Mine
	AddDoor({383, 241,-6}, false,"Gemmenschacht","Cameo Pit"); -- Scoria Mine
	AddDoor({344, 250,-6}, false,"Tempel des Ronagan","Temple of Ronagan"); -- Scoria Mine
	AddDoor({344, 251,-6}, false,"Tempel des Ronagan","Temple of Ronagan"); -- Scoria Mine
	AddDoor({385, 279,-6}, false,"Tempel des Ronagan","Temple of Ronagan"); -- Scoria Mine
	AddDoor({386, 279,-6}, false,"Tempel des Ronagan","Temple of Ronagan"); -- Scoria Mine
	AddDoor({382, 260,-6}, false,"Tempel des Ronagan","Temple of Ronagan"); -- Scoria Mine
	AddDoor({383, 260,-6}, false,"Tempel des Ronagan","Temple of Ronagan"); -- Scoria Mine
	AddDoor({338, 254,-6}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({339, 254,-6}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({371, 292,-6}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({371, 293,-6}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({380, 352,-6}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({400, 327,-6}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({342, 252, 0}, false,"Taverne zur Geflügelten Sau","Winged Sow Taverne"); -- Scoria Mine
	AddDoor({332, 254,-6}, false,"Abwasserschächte","Sewers"); -- Scoria Mine
	AddDoor({333, 254,-6}, false,"Abwasserschächte","Sewers"); -- Scoria Mine
	AddDoor({327, 251,-6}, false,"Schimmersenke","Flicker Swale"); -- Scoria Mine
	AddDoor({327, 252,-6}, false,"Schimmersenke","Flicker Swale"); -- Scoria Mine
	AddDoor({248, 295,-6}, false,"Spielraum","Game room"); -- Scoria Mine
	AddDoor({249, 295,-6}, false,"Spielraum","Game room"); -- Scoria Mine
	AddDoor({249, 298,-5}, false,"Tempel des Nargun","Temple of Nargun"); -- Scoria Mine
	AddDoor({250, 298,-5}, false,"Tempel des Nargun","Temple of Nargun"); -- Scoria Mine


    -- Runewick 2xx
    --Tower of Fire 20x
    AddDoor({901, 763, 2}, 200,"Archmage Elvaine Morgan's rooms", "Die Räumlichkeiten von Erzmagier Elvaine Morgan"); -- Archmage's room
    AddDoor({901, 764, 2}, 200,"Archmage Elvaine Morgan's rooms", "Die Räumlichkeiten von Erzmagier Elvaine Morgan"); -- Archmage's room
 
	AddDoor({902, 770, 4}, 201,"Tower of Fire Apartment 1","Turm des Feuers Appartement 1") -- 2 Persons
    AddDoor({902, 771, 4}, 201,"Tower of Fire Apartment 1","Turm des Feuers Appartement 1") -- 2 Persons

    AddDoor({902, 777, 4}, 202,"Tower of Fire Apartment 1","Turm des Feuers Appartement 2") -- 3 Persons	+ Balcony	
    AddDoor({903, 777, 4}, 202,"Tower of Fire Apartment 1","Turm des Feuers Appartement 2") -- 3 Persons	+ Balcony	
            
    
    --Tower of Air 21x
    AddDoor({907, 833, 4}, 210,"Tower of Air Apartment 1","Turm der Luft Appartement 1") -- 2 Persons
    AddDoor({906, 833, 4}, 210,"Tower of Air Apartment 1","Turm der Luft Appartement 1") -- 2 Persons
    
    AddDoor({898, 834, 4}, 211,"Tower of Air Apartment 2","Turm der Luft Appartement 2") -- 3 Persons
    AddDoor({898, 835, 4}, 211,"Tower of Air Apartment 2","Turm der Luft Appartement 2") -- 3 Persons
    
    --Tower of Earth 22x
    AddDoor({946, 763, 4}, 220,"Tower of Earth Apartment 1","Turm der Erde Appartement 1") -- 3 Persons
    AddDoor({947, 763, 4}, 220,"Tower of Earth Apartment 1","Turm der Erde Appartement 1") -- 3 Persons
            
    AddDoor({946, 759, 4}, 221,"Tower of Earth Apartment 2","Turm der Erde Appartement 2") -- 1 Person
    AddDoor({947, 759, 4}, 221,"Tower of Earth Apartment 2","Turm der Erde Appartement 2") -- 1 Person
    
    AddDoor({944, 764, 2}, 222,"Tower of Earth Apartment 3","Turm der Erde Appartement 3") -- 2 Persons + Balcony
    AddDoor({944, 765, 2}, 222,"Tower of Earth Apartment 3","Turm der Erde Appartement 3") -- 2 Persons + Balcony
	
	--Homelands 25x
    AddDoor({749, 802, 0}, 250,"Quadruped Red Bird","Vierbeiniger Roter Vogel")
    AddDoor({748, 802, 0}, 250,"Quadruped Red Bird","Vierbeiniger Roter Vogel")
          
    AddDoor({790, 794, 0}, 251,"Cottage","Landhaus")
    AddDoor({789, 794, 0}, 251,"Cottage","Landhaus")

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
