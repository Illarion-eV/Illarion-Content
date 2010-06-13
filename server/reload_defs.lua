-- called after every !rd command and !fr command
-- note that !rd is a !fr without npc and spawn reloading
-- note further that reload_tables will be called after this if and only if the !rd was successful and the !rd was issued by a !fr

require("base.common")
require("base.doors")
require("content.signpost")
require("content.gods")

module("server.reload_defs", package.seeall, package.seeall(content.gods))

function onReload()
    -- logToFile("start onReload");
    initDoors();
    initDepots();
    --initExplorerStones();
    initAltars();
    InitWegweiser();
	initNoobia();
	initTreasureChests();
    -- logToFile("end onReload");
    return true;
end

function initDoors()
    --Zipcode for different regions and settlements

    -- Irundar 1xx
    AddDoor( -42, 193, -9,  100,false); -- Irundar Gate
    AddDoor( -49, 174, -9,  101,false); -- Irundar Smith
    AddDoor( -49, 175, -9,  101,false); -- Irundar Smith
    AddDoor( -35, 195, -9,  102,false); -- Irundar Mage Tower
    AddDoor( -35, 196, -9,  102,false); -- Irundar Mage Tower
    AddDoor( -30, 194, -7,  103,false); -- Irundar Mage Tower
    AddDoor( -53, 159, -9,  104,false); -- Irundar General Store
    AddDoor( -50, 166, -9,  104,false); -- Irundar General Store
    AddDoor( -51, 166, -9,  104,false); -- Irundar General Store
    AddDoor( -47, 147, -9,  105,false); -- Irundar Castle - Advisor
    AddDoor( -45, 149, -9,  105,false); -- Irundar Castle - Advisor
    AddDoor( -44, 150, -8,  106,false); -- Irundar Castle - Bedroom
    AddDoor( -44, 151, -8,  106,false); -- Irundar Castle - Bedroom
    AddDoor( -44, 143, -8,  107,false); -- Irundar Castle - Storage Room
    AddDoor( -49, 142, -8,  108,false); -- Irundar Castle - Tower

    --North (Varshikar/Orc Cave): 10xx
    AddDoor( 163,-449, -3, 1012,false); -- Orc Cell
    AddDoor( 164,-449, -3, 1012,false); -- Orc Cell
    AddDoor( 169,-456, 1, 1011,false); -- Orc Cave
    AddDoor( 177,-453, 1, 1011,false); -- Orc Cave private room
    AddDoor( 188,-444, 1, 1011,true); -- Orc Cave Entrace
    AddDoor( 188,-443, 1, 1011,true); -- Orc Cave Entrace
    AddDoor( 239,-319, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 240,-319, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 245,-350, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 245,-351, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 248,-334, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 248,-335, -6, 1050,false); -- Notherot Dungeon
    AddDoor( 251,-331, -3, 1050,false); -- Notherot Dungeon
    AddDoor( 252,-331, -3, 1050,false); -- Notherot Dungeon
    AddDoor( 258,-331, -3, 1051,false); -- Notherot Dungeon
    AddDoor( 259,-331, -3, 1051,false); -- Notherot Dungeon
    AddDoor( 267,-331, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 274,-331, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 276,-327, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 277,-316, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 277,-327, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 280,-331, -3, 1052,false); -- Notherot Dungeon
    AddDoor( 243,-339, -0, 1060,false); -- flat maggie kemoc
    AddDoor( 238,-327, -0, 1061,true); -- Apartement flat 1
    AddDoor( 235,-336, -0, 1062,false); -- Apartement flat 2
    AddDoor( 235,-341, -0, 1063,false); -- Apartement flat 3
    AddDoor( 256,-308, -0, 1064,false); -- flat Athian
    AddDoor( 264,-310, -0, 1065,false); -- flat Taylor
    AddDoor( 268,-302, -0, 1066,true); -- Libary

    -- Tol Vanima: 20xx
    AddDoor( 408,258,  0, 2001, false); -- Vanima House 1, Lord Acria
    AddDoor( 315,240,  0, 2002, false); -- Vanima House 2, Magnus Magnol
    AddDoor( 316,240,  0, 2002, false); -- Vanima House 2, Magnus Magnol
    AddDoor( 387,151,  0, 2010, false); -- Vanima Workshop
    AddDoor( 388,151,  0, 2010, false); -- Vanima Workshop

    -- Silverbrand 30xx
    AddDoor( 75, -211,  0, 3001, true); -- SB West Gate
    AddDoor( 74, -211,  0, 3001, true); -- SB West Gate
    AddDoor( 81, -215,  0, 3001,false); -- SB West Gate Storage
    AddDoor( 81, -214,  0, 3001,false); -- SB West Gate Storage
	AddDoor( 102,-181, -3, 3001,false); -- SB Clan of Axe
    AddDoor( 102,-180, -3, 3001,false); -- SB Clan of Axe
    AddDoor( 111,-200, -3, 3001,false); -- SB Clan of Hammer
    AddDoor( 110,-200, -3, 3001,false); -- SB Clan of Hammer
    AddDoor( 120,-199, -3, 3001,false); -- SB Shooting Area
    AddDoor( 120,-198, -3, 3001,false); -- SB Shooting Area
    AddDoor( 120,-194, -3, 3001,false); -- SB Great Hall
    AddDoor( 120,-193, -3, 3001,false); -- SB Great Hall
    AddDoor( 138,-174, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 139,-174, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 138,-163, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 137,-163, -9, 3001,false); -- SB Entrance to the Mine
    AddDoor( 107,-181, -6, 3002,false); -- SB Prisons
    AddDoor( 110,-186, -6, 3002,false); -- SB Prisons
    AddDoor( 105,-186, -6, 3002,false); -- SB Prisons
    AddDoor( 106,-151, -3, 3004,false); -- SB Mine
    AddDoor( 105,-226,  1, 3001,false); -- SB Storage
    AddDoor( 106,-151, -3, 3004,false); -- SB Mine
    AddDoor( 105,-226,  1, 3001,false); -- SB Storage
    AddDoor( 169,-148, -9, 3050,false); -- Goldburg Gate to Mine
    AddDoor( 169,-147, -9, 3050,false); -- Goldburg Gate to Mine
    AddDoor( 161,-168, -3, 3050,false); -- Goldburg Entrance
    AddDoor( 162,-168, -3, 3050,false); -- Goldburg Entrance

    -- Trolls Bane: 40xx
    AddDoor(-129,-102, 0, 4050, true); -- Seahorse Main Entrace
    AddDoor(-130,-102, 0, 4050, true); -- Seahorse Main Entrace
    AddDoor(-136,-105, 0, 4050, true); -- Seahorse Garden Entrace
    AddDoor(-136,-106, 0, 4050, true); -- Seahorse Garden Entrace
    AddDoor(-132,-110, 0, 4050,false); -- Seahorse Kitchen
    AddDoor(-129,-103, 1, 4050, true); -- Seahorse Balcony
    AddDoor(-127,-110, 0, 4051,false); -- Seahorse Laboratory
    AddDoor(-130,-110, 1, 4051,false); -- Seahorse Room 1
    AddDoor(-127,-110, 1, 4052,false); -- Seahorse Room 2
    AddDoor(-130,-106, 1, 4053, true); -- Seahorse Room 3
    AddDoor(-127,-106, 1, 4054,false); -- Seahorse Room 4
    AddDoor(-111,-106, 0, 4020, true); -- Hospital
    AddDoor( -99,-140, 0, 4035,false); -- Prison Entrance
    AddDoor( -97,-139,-3, 4035,false); -- Prison Cell 1
    AddDoor(-101,-143, 0, 4034,false); -- Prison Office
    AddDoor(-104,-139,-3, 4034,false); -- Prison Cell 2
    AddDoor(-103,-143, 1, 4034,false); -- Prison Cell 3
    AddDoor(-100,-143, 1, 4034,false); -- Prison Cell 4
    AddDoor( -60, -88, 0, 4000, true); -- Towngate
    AddDoor( -61, -88, 0, 4000, true); -- Towngate
    AddDoor(-151, -83, 0, 4000, true); -- Towngate
    AddDoor( -80,-149, 0, 4000, true); -- Towngate
    AddDoor( -80,-150, 0, 4000, true); -- Towngate
    AddDoor(-139, -90, 0, 4041,false); -- Trolls Bane Flathouse 1
    AddDoor(-135, -82, 0, 4041,false); -- Trolls Bane Flathouse 1
    AddDoor(-136, -82, 0, 4041,false); -- Trolls Bane Flathouse 1
    AddDoor( -29, -94, 0, 4031,false); -- Arena
    AddDoor( -95, -94, 0, 4062, true); -- Taverne Entrance 1
    AddDoor( -89, -90, 0, 4062, true); -- Taverne Entrance 2
    AddDoor( -89, -90, 0, 4062, true); -- Taverne Entrance to cellar
    AddDoor( -90,-106,-3, 4061,false); -- Tavern Cellar 1
    AddDoor( -90,-100,-3, 4062,false); -- Tavern Cellar 2
    AddDoor( -87,-110,-3, 4063,false); -- Tavern Cellar 3
    AddDoor( -88, -96,-3, 4064,false); -- Tavern Cellar 4
    AddDoor(  28,-150, 0, 4070,false); -- Miner Guild
    AddDoor(  27,-159, 1, 4070,false); -- Miner Guild
    AddDoor(  23,-143, 0, 4070, true); -- Miner Guild
    AddDoor( -27,-127, 1, 4080,false); -- Garons goldsmith workshop
    AddDoor( -28,-127, 1, 4080,false); -- Garons goldsmith workshop
    AddDoor( -27,-121, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -26,-121, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -29,-127, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -28,-127, 0, 4080,false); -- Garons goldsmith workshop
    AddDoor( -22,-129,-3, 4080,false); -- Garons goldsmith workshop
    AddDoor( -22,-130,-3, 4080,false); -- Garons goldsmith workshop
    AddDoor(-66,-88, 0, 4021, true); -- Trolls Bane Apartment 1
    AddDoor(-67,-83, 0, 4022, true); -- Trolls Bane Apartment 2

    --Northern Woods (Grey Refuge, Lighthouse): 50xx
    AddDoor( -55,-219, 0, 5014, true); -- GR castle Gate
    AddDoor( -56,-219, 0, 5014, true); -- GR castle Gate
    AddDoor( -57,-227, 0, 5014, true); -- GR Market Hall
    AddDoor( -57,-226, 0, 5014, true); -- GR Market Hall
    AddDoor( -51,-229, 0, 5014,false); -- GR Wehrgang
    AddDoor( -48,-223, 1, 5014,false); -- GR Storage
    AddDoor( -57,-230, 1, 5014,true); -- GR Terrace
    AddDoor( -50,-225, 1, 5014,true); -- GR Terrace
    AddDoor( -58,-238, 0, 5014,false); -- GR Private Rooms
    AddDoor( -61,-235, 0, 5014, true); -- GR Workshop
    AddDoor( -56,-235, 2, 5014, true); -- GR Tower
    AddDoor( -63,-240, 3, 5014, true); -- GR Tower
    AddDoor( -50,-239, 4, 5014, true); -- GR Tower
    AddDoor( -73,-220, 0, 5014, true); -- GR prison Main door
    AddDoor( -71,-217, 0, 5015,false); -- GR prison
    AddDoor( -72,-216, 1, 5015,false); -- GR prison
    AddDoor( -59,-244, 0, 5015,false); -- GR secret door
    AddDoor(-241,-340, 0, 5020,false); -- Witch House in the forest
    AddDoor(-360,-460, 0, 5030,true); -- Nordmark Drachenklan Gate
    AddDoor(-360,-459, 0, 5030,true); -- Nordmark Drachenklan Gate
    AddDoor(-359,-458, 0, 5030,true); -- Nordmark Drachenklan Garden
    AddDoor(-352,-459, 0, 5030,true); -- Nordmark Drachenklan House
    AddDoor(-357,-465, 0, 5030,true); -- Nordmark Door Tailor Shop
    AddDoor(-360,-466, 0, 5032,true); -- Nordmark Gate Tailor workshop
    AddDoor(-360,-467, 0, 5032,true); -- Nordmark Gate Tailor workshop
    AddDoor(-352,-439, 0, 5031,true); -- Nordmark Tavern
    AddDoor(-352,-438, 0, 5031,true); -- Nordmark Tavern
    AddDoor(-347,-437, 0, 5031,true); -- Nordmark Tavern
    AddDoor(-342,-441, 0, 5031,false); -- Nordmark Tavern second room
    AddDoor(-340,-437, 0, 5031,false); -- Nordmark Tavern second room
    AddDoor(-344,-430, 0, 5031,true); -- Nordmark Storage
    AddDoor(-361,-447, 0, 5032,false); -- Nordmark Gate House
    AddDoor(-358,-446, 0, 5032,false); -- Nordmark Gate House

    --Western Woods (Farmer Union, Harbour, Eldan Monastery, Druidenhouse): 60xx
    AddDoor(-416,-136,  0, 6010, true); -- Eldan Monastery Entrace
    AddDoor(-381,-143,  0, 6020, true); -- Druidhouse
    AddDoor(-174,  69,  0, 6031,false); -- Farmer Union
    AddDoor(-170,  67,  0, 6031,false); -- Farmer Union

    -- Greenbriar: 70xx
    AddDoor(-377, 76, 0, 7100,false); -- Greenbriar Taverne
    AddDoor(-374, 83, 0, 7100, true); -- Greenbriar Taverne
    AddDoor(-402, 76, 0, 7121, true); -- Greenbriar House 1
    AddDoor(-417, 77, 0, 7102, true); -- Greenbriar House 2 - Hospital
    AddDoor(-415, 81, 0, 7102, true); -- Greenbriar House 2 - Hospital
    AddDoor(-414, 63, 0, 7105,false); -- Greenbriar House 4
    AddDoor(-417, 62, 0, 7106, true); -- Greenbriar House 4 Bedroom
    AddDoor(-418, 97, 0, 7120, false); -- Greenbriar Jail Entrance
    AddDoor(-417, 95, 0, 7120, false); -- Greenbriar Jail Cell
    AddDoor(-262, 24,-25, 7010, true); -- Hell Briar, Temple Entrace
    AddDoor(-262, 25,-25, 7010, true); -- Hell Briar, Temple Entrace
    AddDoor(-250, 31,-22, 7011,false); -- Hell Briar, Temple Prison
    AddDoor(-250, 27,-22, 7011,false); -- Hell Briar, Temple Prison
	-- Data in use: 7300 -- Hell Briar, hidden wall entrance
    AddDoor(-469, -69, 0, 7200,false); -- Caelum Gate
    AddDoor(-469, -68, 0, 7200,false); -- Caelum Gate

    -- Eastern Woods (Kallahorn, Graveyard, Zzyathis): 80xx

    -- Magic Academy: 90xx
    AddDoor(37, 60,50, 9010, false); -- Magic academy, Main Entrace
    AddDoor(38, 60,50, 9010, false); -- Magic academy, Main Entrace
    AddDoor(31, 31,50, 9010, false); -- Magic academy, Garden Door
    AddDoor(32, 31,50, 9010, false); -- Magic academy, Garden Door
    AddDoor(6, 23,-57, 9020, false); -- Magic academy, Secret Meeting Room
    AddDoor(31, 26,51, 9051, false); -- Magic academy, Sleeping Room 1
    AddDoor(35, 26,51, 9052, false); -- Magic academy, Sleeping Room 2
    AddDoor(41, 26,51, 9053, false); -- Magic academy, Sleeping Room 3
    AddDoor(42, 40,51, 9054, false); -- Magic academy, Sleeping Room 4
    AddDoor(36, 40,51, 9055, false); -- Magic academy, Sleeping Room 5


    -- GM Things: 100xx
    AddDoor(-471,-485,0,10000,false); -- GM Prison
    
    
	AddMagicalDoor(1,	-495, -484, -40); -- leads to hometown of char(from Prison)

end

function initDepots()
    AddDepot( 263,-308,  0, 1); -- Varshikar
    AddDepot( -44,-220,  1, 2); -- Graue Rose
    AddDepot( -59,-234,  0, 2); -- Graue Rose
    AddDepot(-403,  74,  0, 3); -- Greenbriar
    AddDepot(-370,  75,  0, 3); -- Greenbriar
    AddDepot(-416,  60,  0, 3); -- Greenbriar
    AddDepot(-415,  75,  0, 3); -- Greenbriar
    AddDepot( 375, 214,  0, 4); -- Tol Vanima
    AddDepot( 307, 224,  0, 4); -- Tol Vanima
    AddDepot( 374, 218, -3, 4); -- Tol Vanima
    AddDepot(-175,  70,  0, 5); -- Farmers Union
    AddDepot(-170,  68, -3, 5); -- Farmers Union
    AddDepot( 176,-450,  1, 6); -- Orc Cave
    AddDepot( 181,-412, -6, 6); -- Orc Cave
    AddDepot( 119,-185, -3, 7); -- Silverbrand
    AddDepot(  92,-212, -3, 7); -- Silverbrand
    AddDepot( 159,-188, -3, 7); -- Silverbrand
    AddDepot( 127,-199, -9, 7); -- Silverbrand
    AddDepot( 116,-203, -3, 7); -- Silverbrand
    AddDepot( 140,-169, -9, 7); -- Silverbrand
    AddDepot( 108,-228,  1, 7); -- Silverbrand
    AddDepot( 139,-202, -3, 7); -- Silverbrand
    AddDepot( 140, -193, 0, 7); -- Silverbrand
    AddDepot(  65,  60, 50, 8); -- Magic Academy
    AddDepot(  40,  62, 50, 8); -- Magic Academy
    AddDepot(  54,  27, 51, 8); -- Magic Academy
    AddDepot( -12,  -4,-57, 8); -- Magic Academy
    AddDepot(-402,-157,  0, 9); -- Eldan & Druids House
    AddDepot(-379,-144,  1, 9); -- Eldan & Druids House
    AddDepot(-263,  22,-25,10); -- Temple of Bjolmur
    AddDepot(-263,  27,-25,10); -- Temple of Bjolmur
    AddDepot(-253,  53,-25,10); -- Temple of Bjolmur
    AddDepot(-253,  55,-25,10); -- Temple of Bjolmur
    AddDepot(-253,  57,-25,10); -- Temple of Bjolmur
    AddDepot(-236,  58,-25,10); -- Temple of Bjolmur
    AddDepot(-251,  37,-22,10); -- Temple of Bjolmur
    AddDepot( -98,-144,  0,11); -- Town Guard
    AddDepot(  31,-157,  0,12); -- Miners Guild
    AddDepot(-348,-463,  0,13); -- Nordmark
    AddDepot(-353,-460,  0,13); -- Nordmark
    AddDepot(-353,-440,  0,13); -- Nordmark
    AddDepot(-361,-461,  0,13); -- Nordmark
    AddDepot(-461, -71,  0,14); -- Caelum
    AddDepot(-470, -72,  0,14); -- Caelum
    AddDepot(-199,   7, -3,15); -- Thief Hideout
    AddDepot(-109,  -97, 0,16); -- Trolls Bane Hospital
    AddDepot(-132, -106, 0,17); -- Trolls Bane Seahorse
    AddDepot(-134,  -85, 0,18); -- Trolls Bane - Flat 1
    AddDepot( -85,  -95, 0,19); -- Trolls Bane Taverne
    AddDepot( -95, -104,-3,19); -- Trolls Bane Taverne
    AddDepot( -95,  -98,-3,19); -- Trolls Bane Taverne
    AddDepot( -22, -127, 0,20); -- Trolls Bane Garon
    AddDepot( 343, -151, 0,21); -- Zzyathis
    AddDepot(-416,   60, 0,22); -- Greenbriar - Creek house
    AddDepot(-416,   74, 8,23); -- Greenbriar - Hospital
    AddDepot(-274,   34, 0,24); -- Hafen
    AddDepot(-235, -343,-3,25); -- Hexenhaus
    AddDepot( 472,  240,-3,26); -- Hellbriar
    AddDepot( 174, -152,-9,27); -- Goldburg
    AddDepot( 160, -180, 0,27); -- Goldburg
    AddDepot(-419,   96, 0,28); -- Greenbriar - Prison
    AddDepot( 385,  149, 0,29); -- Tol Vanima - Workshop
    AddDepot( -73, -68, -3,30); -- Klohaus
    AddDepot( -71, -65,  0,30); -- Klohaus
    AddDepot( 236, -338, 0,31); -- Varshikar - Apartment 3
    AddDepot (269, -327, 0,32); -- Northerot
    AddDepot(115,-184, -3, 33); -- Silverbrand Waffendepot
end

function initExplorerStones()
    AddExplorerStone(10, 0, 0, 0, 1);
    AddExplorerStone(12, 0, 0, 1, 1);
    AddExplorerStone(11, 3, 0, 2, 1);
end

function initAltars()
    AddAltar( -477, -488,    0, content.gods.GOD_THEDEVS);
    AddAltar( -434, -482,    0, content.gods.GOD_THEDEVS);
    AddAltar( -200, -271,    0, content.gods.GOD_USHARA);
    AddAltar( -414, -149,    0, content.gods.GOD_ELDAN);
    AddAltar(  429, -120,    0, content.gods.GOD_TANORA);
    AddAltar(  -84, -116,    0, content.gods.GOD_ELARA);
    AddAltar(  363,  217,    0, content.gods.GOD_THEFIVE);
    AddAltar(  -54,  185,   -9, content.gods.GOD_TANORA);
    AddAltar(  -25, -213,   -3, content.gods.GOD_MALACHIN);
    AddAltar(   76,   16,   -6, content.gods.GOD_CHERGA);
    AddAltar(  369,  217,    1, content.gods.GOD_THEFIVE);
end

function AddDoor(DoorX,DoorY,DoorZ,DoorData,Open)
    DoorPos=position(DoorX,DoorY,DoorZ);
    if world:isItemOnField(DoorPos) then
        thisDoor = world:getItemOnField(DoorPos);
        doorOOK = base.doors.CheckOpenDoor(thisDoor.id);
        doorCOK = base.doors.CheckClosedDoor(thisDoor.id);
        if (doorOOK or doorCOK) then
            thisDoor.data=DoorData;
            if Open then
                if (doorCOK) then
                    thisDoor.quality = 233;
                end
            else
                if (doorOOK) then
                    world:changeItem(thisDoor);
                    base.doors.CloseDoor(thisDoor);
                    thisDoor.quality = 333;
                end
            end
            world:changeItem(thisDoor);
        end
    end
end

function AddDepot(DepotX,DepotY,DepotZ,DepotData)
    DepotPos=position(DepotX,DepotY,DepotZ);
    if world:isItemOnField(DepotPos) then
        thisDepot=world:getItemOnField(DepotPos);
        if (thisDepot.id == 321) then
            thisDepot.data=DepotData;
            world:changeItem(thisDepot);
        else
            world:createItemFromId(321,1,DepotPos,true,333,DepotData);
        end
    else
        world:createItemFromId(321,1,DepotPos,true,333,DepotData);
    end
end

function AddExplorerStone(StoneX,StoneY,StoneZ,StoneNumber,StoneValue)
    StonePos=position(StoneX,StoneY,StoneZ);
    if world:isItemOnField(StonePos) then
        thisStone=world:getItemOnField(StonePos);
        if (thisStone.id == 1272) then
            thisStone.data=StoneNumber;
            thisStone.quality=StoneValue;
            world:changeItem(thisStone);
        else
            world:createItemFromId(1272,1,StonePos,true,StoneValue,StoneNumber);
        end
    else
        world:createItemFromId(1272,1,StonePos,true,StoneValue,StoneNumber);
    end
end

function AddAltar(AltarX,AltarY,AltarZ,God,Altar)
    AltarPos=position(AltarX,AltarY,AltarZ);
    if world:isItemOnField(AltarPos) then
        thisAltar=world:getItemOnField(AltarPos);
        thisAltar.data=God;
        world:changeItem(thisAltar);
    else
        if Altar then
            world:createItemFromId(Altar,1,AltarPos,false,333,God);
        end;
    end
end

function initNoobia()

	-- in the castle
	---- to towns
	AddNoobiaPortal(1,	69,	35,	101	); -- TB
	AddNoobiaPortal(7,	73,	35,	101	); -- V
	AddNoobiaPortal(5,	73,	33,	101	); -- GB
	AddNoobiaPortal(6,	71,	31,	101	); -- TV
	AddNoobiaPortal(8,	69,	31,	101	); -- SB
	---- to craftmasters
	AddNoobiaPortal(76,	72,	40,	101	); -- cooking and baking
	--AddNoobiaPortal(77,	72,	42,	101	); -- carpentry
	AddNoobiaPortal(78,	72,	44,	101	); -- glassblowing
	--AddNoobiaPortal(79,	72,	46,	101	); -- farming
	AddNoobiaPortal(80,	69,	40,	101	); -- gold-/smithing
	AddNoobiaPortal(81,	69,	42,	101	); -- tailoring
	AddNoobiaPortal(82,	69,	44,	101	); -- mining
	AddNoobiaPortal(83,	69,	46,	101	); -- gem cutting
	--AddNoobiaPortal(84,	69,	48,	101	); -- fishing
	-- at the craftmasters, back to the castle
	AddNoobiaPortal(85,	163,21,	100	);
	AddNoobiaPortal(85,	162,60,	100	);
	AddNoobiaPortal(85,	162,104,100	);
	AddNoobiaPortal(85,	168,156,100	);
	AddNoobiaPortal(85,	108,163,100	);
	AddNoobiaPortal(85,	114,109,100	);
	AddNoobiaPortal(85,	105,30,	100	);
	AddNoobiaPortal(85,	106,66,	100	);
	AddNoobiaPortal(85,	64,	154,100	);
end

function AddNoobiaPortal( Portal, PortalX, PortalY, PortalZ )

	local PortalPos = position(PortalX,PortalY,PortalZ);
	local itemList = base.common.GetItemsOnField(PortalPos);
	for i,item in pairs(itemList) do
		if item.id == 10 and item.data == Portal then
			return;
		end
	end
	thePortal = world:createItemFromId(10,1,position(PortalX,PortalY,PortalZ),true,333,Portal);
	thePortal.wear = 255;
	world:changeItem(thePortal);
end

function AddMagicalDoor( Portal, PortalX, PortalY, PortalZ )

	local PortalPos = position(PortalX,PortalY,PortalZ);
	local itemList = base.common.GetItemsOnField(PortalPos);
	for i,item in pairs(itemList) do
		if item.id == 10 and item.data == Portal then
			return;
		end
	end
	thePortal = world:createItemFromId(10,1,position(PortalX,PortalY,PortalZ),true,333,Portal);
	thePortal.wear = 255;
	world:changeItem(thePortal);
end



function initTreasureChests()
	AddTreasureChest(8,1,-73,-100,0);
end

--[[
ChestId:
	open chests: 1361 (South), 1362 (West)
	closed chests: 1360 (South), 8 (West)
]]

function AddTreasureChest(ChestId, ChestData, ChestX, ChestY, ChestZ)
	local pos = position(ChestX,ChestY,ChestZ);
	local item = world:getItemOnField(pos);
	if item.id==ChestId then
		item.data = ChestData;
		world:changeItem(item);
	else
		world:createItemFromId(ChestId,1,pos,false,333,ChestData);
	end
end

