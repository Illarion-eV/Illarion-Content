module("content.signpost", package.seeall)

function InitWegweiser()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

    ---------------- WEGWEISER ----------------

    --AddWeg({X,Y,Z},german text,english text, direction, needed value of perception);
    --directions:
    -- 0 = north
    -- 2 = east
    -- 4 = south
    -- 6 = west


    --SW/Cadomyr map
    AddWeg({42,634,0},"Piratenbucht","Pirate Cove",0,0); -- <Name hier> Piratenbucht -- <name here> pirate cove
    AddWeg({50,640,0},"Faber's Wache","Faber's Guardhouse",6,0); -- <Name hier> Zerstörter Außenposten -- <name here> ruin of a outpost
    AddWeg({110,659,0},"Cape Farewell; Faber's Wache","Cape Farewell; Faber's Guardhouse",6,0);
	AddWeg({112,659,0},"Grundstein der Aufrichtigkeit; Malachíntempel; Rosaline-Kubus; Harbour","Candour Foundation; Malachín Temple; Rosaline Cube; Harbour",4,0);
	AddWeg({114,659,0},"Katanbi Desert; Freiheitsbruch; Arena; Gladiatoren; Sklavenmarkt; Galmair; Runewick","Katanbi Desert; Liberty Quarry; Arena; Gladiatoren; Slave Market; Galmair; Runewick",2,0);
	AddWeg({87,642,0},"Cadomyr","Cadomyr",0,0);
    AddWeg({137,633,0},"Cadomyr","Cadomyr",0,0);
    AddWeg({126,611,0},"Marktplatz","Marketplace",0,0);
    AddWeg({130,583,0},"Werkstatt","Workshop",0,0);
    AddWeg({116,589,0},"Taverne 'Einhörniger Löwe'","Tavern 'Unicorn Lion'",0,0);
    AddWeg({91,586,0},"Gasthaus 'Seeufer'","Inn 'Lakeshore'",0,0);
    AddWeg({123,568,0},"Palast Ihrer Majestät","Palace of Her Majesty",0,0);
    AddWeg({120,568,0},"Palast Ihrer Majestät","Palace of Her Majesty",0,0);
    AddWeg({129,563,0},"Zhambratempel","Zhambratemple",2,0);
    AddWeg({129,699,0},"Grundstein der Aufrichtigkeit","Candour Foundation",2,0);  --<coal mine>
    AddWeg({176,612,0},"Freiheitsbruch","Liberty Quarry",6,0); --<copper/gold/iron mine>
    AddWeg({174,635,0},"Freiheitsbruch","Liberty Quarry",0,0); --<copper/gold/iron mine>
	AddWeg({209,552,0},"Grugmutz's Höhle","Grugmutz's cave",6,0); -- <Name hier> Ogerversteck -- <name here> ogre hideout
    AddWeg({145,694,1},"Malachíntempel","Malachín Temple",0,0);
    AddWeg({90,690,0},"Rosaline-Kubus","Rosaline Cube",4,0); -- <Name hier> Pyramide der Königin -- <name here> pyramid of the queen
    AddWeg({76,689,0},"Cape Farewell","Cape Farewell",6,0);
    AddWeg({109,771,0},"Königlicher Hafen","Royal Harbour",4,0);
    AddWeg({219,646,0},"Katanbi Brücke; dahinter Cadomyr","Katanbi Bridge; behind Cadomyr",6,0);
    AddWeg({245,685,0},"Die Blutkreisarena","The Blood Circle Arena",0,0); -- <Name hier> Arena -- <name here> arena
    AddWeg({235,686,0},"Für Ehre kämpfen wir, in Blut sterben wir! Die Königliche Akademie der Gladiatoren","For honour we fight, in blood we die! The Royal Academy of Gladiators",4,0); -- <Name hier> Gladiatorschule -- <name here> gladiatorschool
    AddWeg({244,556,0},"Perle der Sirani","Pearl of Sirani",0,0); -- <Name hier> Oase -- <name here> oasis
    AddWeg({372,552,0},"Achtung! Verfluchter Ort","Attention! Cursed Place",2,0); -- <Name hier> Zerstörtes Gebäude -- <name here> destroyed building
    AddWeg({389,590,0},"Pellundria","Pellundria",2,0); -- <Name hier> Nekromantenhöhle -- <name here> necromancer cave
    AddWeg({399,619,0},"Schattenland! Gefahr!","Shadowland! Danger!",2,0); -- <Name hier> Moria/Vampirschloss -- <name here> moria/ vampirecastle
    AddWeg({427,676,0},"Schattenland! Gefahr!","Shadowland! Danger!",0,0); -- <Name hier> Moria/Vampirschloss -- <name here> moria/ vampirecastle
	AddWeg({439,638,0},"Cadomyr","Cadomyr",0,0);
	AddWeg({433,637,0},"Galmair","Galmair",6,0);
    AddWeg({400,739,0},"Moshrans Brut - Bleibt fern!","Moshran's Brood - Stay away!",0,0); -- <Name hier> Oase/Ruine -- <name here> oasis/ruin
    AddWeg({389,771,0},"Moshrans Brut - Bleibt fern!","Moshran's Brood - Stay away!",0,0); -- <Name hier> Oase/Ruine -- <name here> oasis/ruin
    AddWeg({203,724,0},"Berg Letma","Mount Letma",4,0); -- <Name hier> Küstengebirge/Gebirgskette -- <name here> mountain range
    AddWeg({208,774,0},"Berg Letma","Mount Letma",2,0); -- <Name hier> Küstengebirge/Gebirgskette -- <name here> mountain range
    AddWeg({112,817,0},"Verlorener Hafen","Lost Harbour",4,0); -- <Name hier> Ruinen -- <name here> ruins
    AddWeg({294,700,0},"Wüstenloch","Desert Hole",2,0); -- <Name hier> ehemaliges Bergwerk -- <name here> former pit
    AddWeg({294,680,0},"Wüstenloch","Desert Hole",6,0); -- <Name hier> ehemaliges Bergwerk -- <name here> former pit
    AddWeg({347,692,0},"Sternenoase","Oasis of Stars",2,0); -- <Name hier> Sandcamp -- <name here> sandcamp
    AddWeg({253,690,0},"Königlicher Sklavenmarkt; Wüstenloch; Sternenoase","Royal Slave Market; Desert Hole; Oasis of Stars",2,0); -- <Name hier> Sandcamp -- <name here> sandcamp
    AddWeg({166,758,0},"Siranitempel","Temple of Sirani",2,0);
    AddWeg({468,794,0},"Katanbi Wüste; dahinter Cadomyr","Katanbi Desert; behind Cadomyr",6,0);
    AddWeg({481,794,0},"Wachstützpunkt; Leuchtturm; Galmair; Runewick","Sentry Outpost; Lighthouse; Galmair; Runewick",2,0);
    AddWeg({290,673,0},"Königlicher Sklavenmarkt","Royal Slave Market",0,0);
    AddWeg({226,646,0},"Perle der Sirani","Pearl of Sirani",0,0); -- <Name hier> Oase -- <name here> oasis
    AddWeg({109,771,0},"Cadomyr Hafen","Cadomyr Harbour",4,0);

    --NW/Galmair-map
    AddWeg({365,247,0},"Guilianni-Residenz","Guilianni Residence",0,0); -- Don's palace
    AddWeg({392,249,0},"","",0,0);-- <Name hier> Gildengebäude -- <name here> guild hall
    AddWeg({376,259,0},"Werkstatt","Workshop",2,0);-- <Name hier> Werkstatt -- <name here> workshop
    AddWeg({401,293,0},"Gasthof zum schläfrigen Bujhaar","Sleepy Bujhaar Inn",2,0);-- <Name hier> Gasthaus -- <name here> Inn
    AddWeg({418,357,0},"Malachitmine","Malachite Mine",2,0);
    AddWeg({421,251,0},"Galmair","Galmair",6,0);
    AddWeg({421,247,0},"Galmair","Galmair",6,0);
    AddWeg({343,259,0},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",0,0);-- <Name hier> Taverne -- <name here> tavern
    AddWeg({311,282,0},"Villa 'Goldader'","Villa 'Goldvein'",6,0);-- <Name hier> Villa -- <name here> villa
    AddWeg({311,265,0},"Irmoroms Tempel","Tempel of Irmorom",0,0);
    AddWeg({332,254,0},"Schlackengrube","Scoria Mine",0,0);-- <Name hier> Galmair Underground -- <name here> Galmair underground
    AddWeg({474,251,0},"Galmair","Galmair",6,0);
    AddWeg({474,248,0},"Galmair","Galmair",6,0);
    AddWeg({499,208,0},"Hafen + Dunkellochmine","Harbour + Dark Hole Mine",0,0);
    AddWeg({444,123,0},"Hafen","Harbour",0,0);
    AddWeg({409,148,0},"Dunkellochmine","Dark Hole Mine",6,0);
    AddWeg({409,143,0},"Dunkellochmine","Dark Hole Mine",6,0);
    AddWeg({193,430,0},"Festung Hammerfall","Fortress Hammerfall",0,0);-- <Name hier> Zwergenfort -- <name here> dwarfen fortress
    AddWeg({417,385,0},"Cadomyr","Cadomyr",4,0);
    AddWeg({338,238,-6},"Schweinebaue","Hog Dens",2,0);-- <Name hier> Orkshöhle - <name here> orccave
    AddWeg({342,243,-6},"Gemmenschacht","Cameo Pit",2,0);-- <Name hier> Wohnviertel
    AddWeg({343,247,-6},"Ronagans Tempel - Achtung, überflutet!","Tempel of Ronagan - Attention, flooded!",4,0);-- <Name hier> überflutetes Viertels(ronagan schrein)
    AddWeg({337,248,-6},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",4,0);
    AddWeg({332,251,-6},"Abwasserschächte","Sewers",4,0);
    AddWeg({330,249,-6},"Schimmersenke","Flicker Swale",6,0);-- <Name hier> Schwarzmarkt -- <name here> black market

    --SE/Runewick-map
    AddWeg({525,782,0},"Cadomyr","Cadomyr",6,0);
	AddWeg({644,715,0},"Wachstützpunkt","Sentry Outpost",0,0);
	AddWeg({528,782,0},"Wachstützpunkt","Sentry Outpost",2,0);
	AddWeg({528,781,0},"Leuchtturm; Galmair; Runewick","Lighthouse; Galmair; Runewick",0,0);
    AddWeg({539,530,0},"Leuchttrum; Wachstützpunkt; Cadomyr","Lighthouse; Sentry Outpost; Cadomyr",4,0);
    AddWeg({517,583,0},"Leuchttrum; Wachstützpunkt; Cadomyr","Lighthouse; Sentry Outpost; Cadomyr",4,0);


    --NE/Neutral-map
    AddWeg({680,311,0},"Galmair","Galmair",6,0);
    AddWeg({685,317,0},"To the Cobweb","To the Cobweb",2,0);
    AddWeg({676,326,0},"Cadomyr","Cadomyr",6,0);
    AddWeg({682,328,0},"Runewick","Runewick",4,0);



	-- Noobia --

	
	
	---------------- GRABSTEINE ----------------

    --AddGrave({X,Y,Z},german text,english text, type,0);
    --typs:
    -- 1 = east-west direction 1
    -- 2 = east-west direction 2
    -- 3 = all directions (column)
    -- 4 = coffin

    --Cadomyr
    AddGrave({134,638,0},"","", 1,0);
    AddGrave({134,640,0},"","", 2,0);
	AddGrave({130,637,0},"","", 3,0);
	AddGrave({133,637,0},"","", 3,0);
	AddGrave({105,632,-4},"","", 4,0);
	AddGrave({106,632,-4},"","", 4,0);
	AddGrave({111,666,-4},"","", 3,0);
	AddGrave({106,663,-4},"","", 3,0);
	AddGrave({107,673,-4},"","", 3,0);
	AddGrave({113,670,-4},"","", 1,0);
	AddGrave({108,665,-4},"","", 1,0);
	AddGrave({157,668,-4},"","", 4,0);
	AddGrave({158,667,-4},"","", 3,0);
	--Craven cave
    AddGrave({672,386,2},"","", 4,0);
    AddGrave({671,386,2},"","", 4,0);
    AddGrave({670,386,2},"","", 4,0);
    AddGrave({669,386,2},"","", 4,0);
    AddGrave({668,386,2},"","", 4,0);
    AddGrave({667,386,2},"","", 4,0);
    AddGrave({666,386,2},"","", 4,0);
    AddGrave({665,386,2},"","", 4,0);
    AddGrave({664,386,2},"","", 4,0);
    AddGrave({663,386,2},"","", 4,0);
	--Creek Settlement
    AddGrave({187,509,0},"","", 1,0);
    AddGrave({194,505,0},"","", 3,0);
	--Cursed Place
    AddGrave({387,544,0},"","", 2,0);
    AddGrave({387,542,0},"","", 1,0);
    --Elven Ruins
    AddGrave({549,451,0},"","", 1,0);
    AddGrave({547,439,0},"","", 1,0);
    AddGrave({547,440,0},"","", 1,0);
    --Death Swath
    AddGrave({501,462,0},"","", 1,0);
    AddGrave({504,463,0},"","", 3,0);
    AddGrave({509,467,0},"","", 3,0);
    AddGrave({521,466,0},"","", 1,0);
    AddGrave({528,476,0},"","", 1,0);
    AddGrave({530,481,0},"","", 1,0);
    AddGrave({521,490,0},"","", 3,0);
    AddGrave({525,491,0},"","", 3,0);
    AddGrave({519,494,0},"","", 1,0);
    AddGrave({529,497,0},"","", 1,0);
    AddGrave({532,489,0},"","", 1,0);
    AddGrave({532,485,0},"","", 3,0);
    AddGrave({537,492,0},"","", 1,0);
    AddGrave({536,496,0},"","", 3,0);
    AddGrave({545,501,0},"","", 3,0);
    --Glowing Forest
    AddGrave({503,536,0},"","", 3,0);
    AddGrave({481,513,0},"","", 1,0);
    AddGrave({520,523,0},"","", 3,0);
    --Glowing Gate
    AddGrave({489,582,0},"","", 4,0);
    --Hammerfall Mine
    AddGrave({264,418},"","", 3,0);
	--Moshran's Brood
    AddGrave({410,726,0},"","", 1,0);
    AddGrave({409,734,0},"","", 3,0);
    --Mount Zotmore
    AddGrave({366,500,0},"Hier ruht Zot's Freizeit!","Zot's sparetime rests here!", 1,0);
    AddGrave({348,503,0},"Zu Ehren jenen die Zot's Opfer wurden.","To honour of Zot's victims-", 3,0);
	--Lighthouse
	AddGrave({536,608,0},"","", 1,0);
	AddGrave({538,615,0},"","", 1,0);
	AddGrave({532,609,0},"","", 3,0);
	AddGrave({536,659,0},"","", 1,0);
	AddGrave({539,660,0},"","", 3,0);
	AddGrave({530,668,0},"","", 1,0);
	AddGrave({528,666,0},"","", 3,0);
	AddGrave({528,660,0},"","", 3,0);
	AddGrave({528,658,0},"","", 1,0);
	AddGrave({530,660,0},"","", 1,0);
	--Lonly Island
	AddGrave({610,888,0},"","", 2,0);
    AddGrave({610,886,0},"","", 1,0);
	--Lost Building (1)
    AddGrave({252,722,0},"","", 1,0);
    AddGrave({247,728,0},"","", 3,0);
    AddGrave({256,725,0},"","", 3,0);
    --Pirate Cove
    AddGrave({12,516,0},"","", 3,0);
    AddGrave({30,525,0},"","", 1,0);
    AddGrave({60,548,1},"","", 1,0);
    AddGrave({57,555,1},"","", 3,0);
	--Snakehead Coast
    AddGrave({621,463,0},"","", 1,0);
    AddGrave({692,483,0},"","", 1,0); --Wilder Island
    AddGrave({714,442,0},"","", 3,0);
	--Spider's Mouth
    AddGrave({665,293,0},"","", 1,0);
    AddGrave({690,341,0},"","", 2,0);
    AddGrave({725,369,0},"","", 1,0);
    AddGrave({665,293,0},"","", 1,0);
	--Vrondus Farm
	AddGrave({312,574,0},"","", 1,0);
	AddGrave({308,559,0},"","", 3,0);
	--Zumbrass Tomb
	AddGrave({331,471,0},"","", 1,0);
	AddGrave({323,467,0},"","", 3,0);
	
	
    ---------------- BILDER ----------------

    --AddPicture({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = east wall yellow picture
    -- 2 = east wall violett picture
    -- 3 = north wall blue picture
    -- 4 = east wall blue picture
    -- 5 = north wall sea picture
    -- 6 = east wall sea picture
    -- 7 = north wall wood picture
    -- 8 = east wall wood picture

    --Cadomyr
    AddPicture({147,622,1},"","", 2,5); --flats
    AddPicture({147,616,1},"","", 4,5); --flats
    AddPicture({141,612,1},"","", 3,5); --flats
    AddPicture({145,608,1},"","", 1,5); --flats
    AddPicture({142,606,1},"","", 3,5); --flats
    AddPicture({144,604,0},"","", 4,5); --flats
    AddPicture({141,607,0},"","", 7,5); --flats
    AddPicture({139,613,0},"","", 4,5); --flats
    AddPicture({143,613,0},"","", 4,5); --flats
    AddPicture({129,524,0},"","", 7,5); --palace
    AddPicture({130,518,0},"","", 5,5); --queens room
    AddPicture({135,516,0},"","", 3,5); --queens room
    AddPicture({137,516,0},"","", 3,5); --queens room
    AddPicture({117,579,0},"","", 4,5); --taverne
    AddPicture({91,572,0},"","", 4,5); --inn
    AddPicture({91,574,0},"","", 4,5); --inn
    AddPicture({91,576,0},"","", 4,5); --inn
    AddPicture({86,574,0},"","", 4,5); --inn
    AddPicture({88,578,1},"","", 5,5); --inn
    AddPicture({85,578,1},"","", 5,5); --inn
    AddPicture({96,600,1},"","", 4,5); --building
    AddPicture({96,599,1},"","", 4,5); --building
    AddPicture({96,602,0},"","", 4,5); --building
    AddPicture({100,611,1},"","", 3,5); --building
    --Galmair Plateau
    AddPicture({318,357,1},"","", 1,5);
    AddPicture({318,359,1},"","", 2,5);
    --Spider's Mouth
    AddPicture({711,314,1},"","", 1,5); --Tavern 'To the Cobweb'
    AddPicture({708,316,1},"","", 7,5); --Tavern 'To the Cobweb'
    AddPicture({708,316,1},"","", 5,5); --Tavern 'To the Cobweb'
    AddPicture({700,307,1},"","", 5,5); --Tavern 'To the Cobweb'
    AddPicture({711,320,1},"","", 4,5); --Tavern 'To the Cobweb'
    AddPicture({705,326,1},"","", 5,5); --Tavern 'To the Cobweb'
    AddPicture({700,318,1},"","", 3,5); --Tavern 'To the Cobweb'
	AddPicture({698,307,0},"","", 5,5); --Tavern 'To the Cobweb'
	AddPicture({711,324,0},"","", 4,5); --Tavern 'To the Cobweb'

    ---------------- STANDARTEN ----------------

    --AddPennant({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = Simple Pennant - north-south direction
    -- 2 = Simple Pennant - east-west direction
    -- 3 = huge animated flag - north-south direction
    -- 4 = scull post - north
    -- 5 = scull post - east
    -- 6 = scull post - west
    -- 7 = scull post - south
    
    --Abtruse Dwelling
    AddPennant({44,607,0},"","", 6,5);
    AddPennant({44,602,0},"","", 6,5);
    AddPennant({46,634,0},"","", 7,5);
    AddPennant({41,634,0},"","", 7,5);
	--Buccaneers Lurk
    AddPennant({214,462,0},"","", 4,5);
    AddPennant({210,462,0},"","", 4,5);
    AddPennant({205,462,0},"","", 4,5);
    AddPennant({200,462,0},"","", 4,5);
    AddPennant({196,463,0},"","", 6,5);
    AddPennant({196,467,0},"","", 6,5);
    AddPennant({201,468,0},"","", 7,5);
    AddPennant({196,471,0},"","", 6,5);
    AddPennant({196,475,0},"","", 6,5);
    AddPennant({196,479,0},"","", 6,5);
    AddPennant({196,483,0},"","", 6,5);
    AddPennant({196,487,0},"","", 6,5);
    AddPennant({201,483,0},"","", 7,5);
    AddPennant({200,487,0},"","", 7,5);
    AddPennant({204,487,0},"","", 7,5);
    --Cadomyr
    AddPennant({121,519,0},"","", 1,5); --palace
	AddPennant({122,519,0},"","", 1,5); --palace
    AddPennant({123,519,0},"","", 1,5); --palace
    AddPennant({130,528,0},"","", 2,5); --palace
    AddPennant({130,530,0},"","", 2,5); --palace
    AddPennant({109,551,0},"","", 1,5); --registration
    AddPennant({104,552,0},"","", 1,5); --registration
    --Craven cave
    AddPennant({674,389,2},"","", 6,5);
	AddPennant({674,392,2},"","", 6,5);
	AddPennant({670,389,2},"","", 6,5);
	AddPennant({670,392,2},"","", 6,5);
	AddPennant({666,448,0},"","", 7,5);
	AddPennant({670,448,0},"","", 7,5);
	--Firelimes
    AddPennant({528,587,1},"","", 3,5);
    AddPennant({525,587,1},"","", 3,5);
	--Galmair Plateau
    AddPennant({358,378,1},"","", 4,5);
    AddPennant({356,378,1},"","", 4,5);
    --Glowing Forest
    AddPennant({483,561,0},"","", 5,5);
    AddPennant({483,563,0},"","", 5,5);
    AddPennant({487,520,0},"","", 7,5);
    AddPennant({487,520,0},"","", 7,5);
    AddPennant({526,523,0},"","", 6,5);
    AddPennant({526,525,0},"","", 6,5);
	--Glowing Gate
    AddPennant({487,582,0},"","", 1,5);
    AddPennant({485,582,0},"","", 1,5);
    --Hammerfall Mine
    AddPennant({257,419,0},"","", 1,5);
    AddPennant({258,419,0},"","", 3,5);
    AddPennant({260,419,0},"","", 3,5);
	AddPennant({261,419,0},"","", 1,5);
	--Moshran's Brood
    AddPennant({391,743,0},"","", 1,5);
    AddPennant({393,743,0},"","", 1,5);
    AddPennant({398,743,0},"","", 7,5);
    --Mount Zotmore
    AddPennant({365,497,0},"Sei vorsichtig, hier könnte ein Zot zufinden sein.","Be carful, there could be a Zot around.", 6,0);
    --Lost Building (2)
    AddPennant({277,605,0},"","", 5,5);
    AddPennant({277,596,0},"","", 5,5);
    AddPennant({269,599,0},"","", 6,5);
    AddPennant({265,605,0},"","", 6,5);
    --Lost Building (3)
    AddPennant({290,474,0},"","", 5,5);
    AddPennant({262,488,0},"","", 6,5);
	--Lumpskrums Band
	AddPennant({361,752,0},"","", 1,5);
    AddPennant({357,752,0},"","", 1,5);
    --Royal Slave Market
	AddPennant({325,627,0},"","", 5,5);
	AddPennant({325,629,0},"","", 5,5);
	AddPennant({325,632,0},"","", 5,5);
	AddPennant({325,624,0},"","", 5,5);
	AddPennant({323,627,0},"","", 6,5);
	AddPennant({323,629,0},"","", 6,5);
	AddPennant({323,632,0},"","", 6,5);
	AddPennant({323,634,0},"","", 6,5);
	--Sentry Outpost
	AddPennant({641,706,3},"","", 3,5);
	--Snakehead Coast
    AddPennant({609,462,2},"","", 7,5); --Mt. Snakehead
    --Spider's Mouth
    AddPennant({675,346,0},"","", 4,5);
    AddPennant({678,346,0},"","", 4,5);
	--The Royal Academy of Gladiators
	AddPennant({210,701,0},"","", 7,5);
    AddPennant({215,701,0},"","", 7,5);
    --The Blood Circle Arena
    AddPennant({248,668,1},"","", 3,5);
    AddPennant({250,690,0},"","", 2,5);
    AddPennant({250,685,0},"","", 2,5);
    --Zumbrass Tomb
	AddPennant({331,473,0},"","", 7,5);

    ---------------- Bï¿½UME ----------------

    --AddTree({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = fri tree
    -- 2 = cachdern tree
    -- 3 = naldor tree
    -- 4 = blooming ceridern
    -- 5 = ceridern tree
    -- 6 = eldan oak
    -- 7 = scandrel pine

	--Gnuremground
	AddTree({578,708,0},"","", 1,5);
	AddTree({576,712,0},"","", 1,5);
	AddTree({568,714,0},"","", 1,5);
	AddTree({565,712,0},"","", 1,5);
	AddTree({564,710,0},"","", 3,5);
	--Irundar
	AddTree({286,546,0},"","", 6,5); --tree check!!!
	--Oldra's Corner
	AddTree({653,681,0},"","", 6,5);
	--Snakehead Coast
	AddTree({653,465,0},"","", 6,5);
	AddTree({647,465,0},"","", 6,5);
	AddTree({653,479,0},"","", 6,5);
	AddTree({647,465,0},"","", 6,5);

-------------------- Sï¿½ulen/Statuen  ----------------
    --AddPillar({X,Y,Z},german text,english text, type, needed value of perception);
    -- typs:
    -- 1 = dark column
    -- 2 = statue (woman) south
    -- 3 = golden armor (north)
    -- 4 = golden armor (east)
    -- 5 = silver armor (north)
    -- 6 = silver armor (east)
    -- 7 = riderstatue (east)
    -- 8 = riderstatue (north)
    -- 9 = riderstatue (south)
    -- 10 = riderstatue (west)

	--Abtruse Dwelling
	AddPillar({54,608,0},"","", 1,5);
	AddPillar({54,602,0},"","", 1,5);
	--Cadomyr
	AddPillar({88,655,1},"","", 6,5); --outside
	AddPillar({88,659,1},"","", 6,5); --outside
    AddPillar({108,655,1},"","", 5,5); --outside
    AddPillar({117,655,1},"","", 5,5); --outside
    AddPillar({108,637,1},"","", 5,5); --outside
    AddPillar({117,637,1},"","", 5,5); --outside
    AddPillar({165,642,1},"","", 6,5); --outside
    AddPillar({165,638,1},"","", 6,5); --outside
    AddPillar({86,620,1},"","", 6,5); --guardtower
    AddPillar({86,623,1},"","", 6,5); --guardtower
    AddPillar({84,619,1},"","", 6,5); --guardtower
    AddPillar({84,619,0},"","", 9,5); --guardtower
    AddPillar({91,623,0},"","", 3,5); --guardtower
    AddPillar({90,623,0},"","", 3,5); --guardtower
    AddPillar({128,631,0},"","", 6,5); --townwall
    AddPillar({128,634,0},"","", 6,5); --townwall
    AddPillar({132,619,1},"","", 9,5); --
    AddPillar({136,619,1},"","", 9,5); --
    AddPillar({129,619,1},"","", 6,5); --
    AddPillar({129,628,1},"","", 6,5); --
    AddPillar({139,626,1},"","", 4,5); --
    AddPillar({139,629,1},"","", 4,5); --
    AddPillar({139,632,1},"","", 4,5); --
    AddPillar({139,636,1},"","", 5,5); --
    AddPillar({136,636,1},"","", 5,5); --
  	AddPillar({132,566,0},"","", 1,5); --temple
    AddPillar({132,562,0},"","", 1,5); --temple
    AddPillar({136,560,0},"","", 1,5); --temple
    AddPillar({136,568,0},"","", 1,5); --temple
    AddPillar({137,560,0},"","", 9,5); --temple
    AddPillar({138,560,0},"","", 9,5); --temple
    AddPillar({139,560,0},"","", 9,5); --temple
    AddPillar({140,560,0},"","", 9,5); --temple
	AddPillar({137,568,0},"","", 8,5); --temple
	AddPillar({138,568,0},"","", 8,5); --temple
	AddPillar({139,568,0},"","", 8,5); --temple
	AddPillar({140,568,0},"","", 8,5); --temple
    AddPillar({143,566,0},"","", 6,5); --temple
    AddPillar({143,562,0},"","", 6,5); --temple
    AddPillar({144,566,0},"","", 1,5); --temple
    AddPillar({144,562,0},"","", 1,5); --temple
    AddPillar({124,548,0},"","", 1,5); --palace
    AddPillar({120,548,0},"","", 1,5); --palace
    AddPillar({122,547,1},"","", 2,5); --palace
    AddPillar({119,528,0},"","", 5,5); --palace
    AddPillar({124,528,0},"","", 5,5); --palace
    AddPillar({130,529,0},"","", 2,5); --palace
    AddPillar({149,512,-3},"","", 5,5); --tresuray
    AddPillar({153,516,-3},"","", 9,5); --tresuray
    AddPillar({150,516,-3},"","", 9,5); --tresuray
    AddPillar({147,516,-3},"","", 9,5); --tresuray
    AddPillar({145,516,-3},"","", 9,5); --tresuray
    AddPillar({145,520,-3},"","", 7,5); --tresuray
    AddPillar({145,522,-3},"","", 7,5); --tresuray
    AddPillar({149,519,-3},"","", 10,5); --tresuray
    AddPillar({149,521,-3},"","", 10,5); --tresuray
    AddPillar({80,577,1},"","", 2,5); --inn
    AddPillar({89,601,0},"","", 2,5); --building
    AddPillar({106,667,-4},"","", 1,5); --dungeon
    AddPillar({106,670,-4},"","", 1,5); --dungeon
    AddPillar({133,670,-4},"","", 5,5); --dungeon
    AddPillar({135,670,-4},"","", 5,5); --dungeon
    AddPillar({144,668,-4},"","", 6,5); --dungeon
    AddPillar({144,668,-4},"","", 6,5); --dungeon
    AddPillar({145,660,-4},"","", 5,5); --dungeon
    AddPillar({143,660,-4},"","", 5,5); --dungeon
    AddPillar({155,665,-3},"","", 9,5); --dungeon
    AddPillar({159,665,-3},"","", 9,5); --dungeon
    AddPillar({155,670,-3},"","", 8,5); --dungeon
    AddPillar({159,670,-3},"","", 8,5); --dungeon
	--Chapel of the Five
	AddPillar({476,800,0},"","", 1,5);
    AddPillar({476,791,0},"","", 1,5);
	AddPillar({470,793,0},"","", 1,5);
    AddPillar({470,798,0},"","", 1,5);
    --Craven cave
	AddPillar({674,388,2},"","", 1, 5);
	AddPillar({674,393,2},"","", 1, 5);
    AddPillar({661,388,2},"","", 1, 5);
    AddPillar({661,393,2},"","", 1, 5);
    AddPillar({656,388,2},"","", 1, 5);
    AddPillar({656,393,2},"","", 1, 5);
	--Creek Settlement
	AddPillar({189,511,0},"","", 1,5);
	AddPillar({195,511,0},"","", 1,5);
	AddPillar({186,495,0},"","", 1,5);
	AddPillar({186,493,0},"","", 1,5);
	--Cursed Place
    AddPillar({388,551,0},"","", 2,5);
    AddPillar({376,553,0},"","", 1,5);
    AddPillar({376,551,0},"","", 1,5);
    --Death Swath
    AddPillar({507,465,0},"","", 1, 5);
	AddPillar({512,465,0},"","", 1, 5);
	AddPillar({512,468,0},"","", 1, 5);
    --Elven Ruins
	AddPillar({556,447,0},"","", 2, 5);
	AddPillar({547,431,0},"","", 2, 5);
	AddPillar({530,425,0},"","", 2, 5);
	AddPillar({531,425,0},"","", 1, 5);
	AddPillar({532,425,0},"","", 2, 5);
    AddPillar({583,452,0},"","", 1, 5);
    AddPillar({570,420,0},"","", 2, 5);
	--Firelimes
    AddPillar({538,589,0},"","", 1,5);
    AddPillar({538,590,0},"","", 1,5);
    AddPillar({535,589,0},"","", 1,5);
    AddPillar({535,590,0},"","", 1,5);
    AddPillar({532,589,0},"","", 1,5);
    AddPillar({532,590,0},"","", 1,5);
    AddPillar({529,589,0},"","", 1,5);
    AddPillar({529,590,0},"","", 1,5);
    AddPillar({523,589,0},"","", 1,5);
    AddPillar({523,590,0},"","", 1,5);
    AddPillar({520,589,0},"","", 1,5);
    AddPillar({520,590,0},"","", 1,5);
    AddPillar({517,589,0},"","", 1,5);
    AddPillar({517,590,0},"","", 1,5);
    AddPillar({514,589,0},"","", 1,5);
    AddPillar({514,590,0},"","", 1,5);
	--Galmair Plateau
	AddPillar({357,365,1},"","", 4,5);
	--Grugmutz's cave
    AddPillar({169,558,0},"","", 1,5);
    AddPillar({169,561,0},"","", 1,5);
	--Harrowd Mount
	AddPillar({541,681,2},"","", 1,5);
	AddPillar({541,681,2},"","", 1,5);
	AddPillar({547,685,2},"","", 7,5);
    AddPillar({548,685,2},"","", 10,5);
    AddPillar({547,687,2},"","", 10,5);
    AddPillar({548,687,2},"","", 7,5);
    AddPillar({547,689,2},"","", 7,5);
    AddPillar({548,689,2},"","", 10,5);
    AddPillar({524,692,2},"","", 1,5);
	AddPillar({524,696,2},"","", 1,5);
	--Kata Island
	AddPillar({169,834,0},"","", 2,5);
    --Lighthouse
    AddPillar({535,605,0},"","", 2,5);
    AddPillar({537,636,0},"","", 2,5);
	--Lost Building (1)
    AddPillar({256,726,0},"","", 2,5);
    --Lost Building (2)
	AddPillar({272,602,0},"","", 1,5);
    AddPillar({272,603,0},"","", 1,5);
    --Lost Building (3)
	AddPillar({284,476,0},"","", 2,5);
	AddPillar({285,477,0},"","", 2,5);
    --Lost Harbour
	AddPillar({106,831,0},"","", 2,5);
	AddPillar({104,831,0},"","", 2,5);
	--Moshran's Brood
	AddPillar({401,733,0},"","", 1,5);
	--Mount Zotmore
	AddPillar({361,495,0},"","", 1,5);
	AddPillar({357,495,0},"","", 1,5);
    --Oldra's Corner
	AddPillar({645,679,0},"","", 2, 5);
	AddPillar({645,683,0},"","", 2, 5);
	--Pyramide of Chaos
    AddPillar({227,581,0},"","", 1,5);
    AddPillar({237,590,0},"","", 1,5);
    AddPillar({233,590,0},"","", 1,5);
    AddPillar({237,593,0},"","", 1,5);
    AddPillar({233,593,0},"","", 1,5);
    AddPillar({237,599,0},"","", 1,5);
    AddPillar({233,599,0},"","", 1,5);
    AddPillar({237,602,0},"","", 1,5);
    AddPillar({233,602,0},"","", 1,5);
    AddPillar({237,605,0},"","", 1,5);
    AddPillar({233,605,0},"","", 1,5);
    AddPillar({230,598,0},"","", 1,5);
    AddPillar({230,594,0},"","", 1,5);
    AddPillar({227,598,0},"","", 1,5);
    AddPillar({227,594,0},"","", 1,5);
	--Queens Corner
	AddPillar({301,502,0},"","", 2,5);
	--Snakehead Coast
	AddPillar({598,496,0},"","", 2,5);
	AddPillar({650,486,0},"","", 1, 5);
	AddPillar({650,488,0},"","", 1, 5);
	AddPillar({649,483,0},"","", 9, 5);
	AddPillar({654,487,0},"","",10, 5);
	AddPillar({649,492,0},"","", 8, 5);
	AddPillar({644,487,0},"","", 7, 5);
	--Spider's Mouth
	AddPillar({733,310,0},"","", 2, 5);
	AddPillar({733,314,0},"","", 2, 5);
	AddPillar({696,316,0},"","", 2, 5); --Tavern 'To the Cobweb'
	AddPillar({696,320,0},"","", 2, 5); --Tavern 'To the Cobweb'
	AddPillar({698,315,1},"","", 2, 5); --Tavern 'To the Cobweb'
	AddPillar({698,319,1},"","", 2, 5); --Tavern 'To the Cobweb'
 	--Tempel of Sirani
    AddPillar({176,759,0},"","", 2,5);
    AddPillar({176,764,0},"","", 2,5);
    --Tempel of Tanora
    AddPillar({621,590,0},"","", 1,5);
    AddPillar({621,599,0},"","", 1,5);
    AddPillar({630,596,0},"","", 1,5);
    AddPillar({630,592,0},"","", 1,5);
    --The Blood Circle Arena
    AddPillar({256,665,0},"","", 7,5);
    AddPillar({261,665,0},"","", 9,5);
    AddPillar({261,670,0},"","", 10,5);
    AddPillar({256,670,0},"","", 8,5);
    AddPillar({250,683,0},"","", 5,5);
    AddPillar({266,683,0},"","", 5,5);
	--The Royal Academy of Gladiators
    AddPillar({228,714,0},"","", 1,5);
    AddPillar({228,712,0},"","", 1,5);
    AddPillar({233,711,1},"","", 6,5);
    AddPillar({233,713,1},"","", 6,5);
    AddPillar({210,696,0},"","", 7,5);
    AddPillar({216,696,0},"","", 7,5);
    AddPillar({210,696,0},"","", 7,5);
    AddPillar({216,696,0},"","", 10,5);
    AddPillar({210,684,0},"","", 10,5);
    AddPillar({216,684,0},"","", 10,5);
    --Vrondus Farm
	AddPillar({310,572,0},"","", 2,5);

    
    
    
    
	---------------- Chimneys ~ Kamine -------------
	-- AddChimney({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west
	
    --Cadomyr
    AddChimney({142,601,1},"","", 1, 5); --flats
	AddChimney({146,623,0},"","", 2, 5); --flats
    AddChimney({140,554,0},"","", 2, 5); --library
    AddChimney({136,516,0},"","", 1, 5); --queens room
    AddChimney({94,552,0},"","", 1, 5); --room
    AddChimney({93,597,0},"","", 1, 5); --building
    AddChimney({104,615,0},"","", 2, 5); --building
    --Galmair Plateau
    AddChimney({326,366,1},"","", 2, 5);
    AddChimney({311,351,1},"","", 1, 5);
    --Spider's Mouth
    AddChimney({705,311,1},"","", 2, 5); --Tavern 'To the Cobweb'
    AddChimney({705,323,1},"","", 2, 5); --Tavern 'To the Cobweb'
    AddChimney({711,320,0},"","", 2, 5); --Tavern 'To the Cobweb'
    
    
    

	---------------- Mirrors ~ Spiegel -------------
	-- AddMirror({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west

	--Cadomyr
	AddMirror({149,516,0},"","", 2,5); --queens room
    AddMirror({91,552,0},"","", 1,5); --room
    AddMirror({84,576,1},"","", 2,5); --inn
    AddMirror({92,597,1},"","", 1,5); --building
    AddMirror({97,611,1},"","", 1,5); --building
    --Spider's Mouth
	AddMirror({703,319,1},"","", 1,5); --Tavern 'To the Cobweb'
	AddMirror({708,319,1},"","", 1,5); --Tavern 'To the Cobweb'
	AddMirror({707,307,1},"","", 1,5); --Tavern 'To the Cobweb'
	AddMirror({705,309,1},"","", 2,5); --Tavern 'To the Cobweb'

end

function AddWeg(Posi,dText,eText,Dir,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Dir));
end

function AddGrave(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+10));
end

function AddPicture(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+20));
end

function AddPennant(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+30));
end

function AddTree(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+40));
end

function AddPillar(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+50));
end

function AddChimney(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+60));
end

function AddMirror(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+70));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,0);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,0);
    end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==0) then
        return 3081
    elseif (Value==2) then
        return 3084
    elseif (Value==4) then
        return 3082
    elseif (Value==6) then
        return 3083
    elseif (Value==11) then
        return 519
    elseif (Value==13) then
        return 521
    elseif (Value==14) then
        return 520
    elseif (Value==12) then
	    return 337
    elseif (Value==21) then
        return 1914
    elseif (Value==22) then
        return 1915
    elseif (Value==23) then
        return 264
    elseif (Value==24) then
        return 265
    elseif (Value==25) then
        return 748
    elseif (Value==26) then
        return 749
    elseif (Value==27) then
        return 750
    elseif (Value==28) then
        return 751
    elseif (Value==31) then
        return 2046
    elseif (Value==32) then
        return 2069
    elseif (Value==33) then
        return 512
    elseif (Value==34) then
        return 2924
    elseif (Value==35) then
        return 2925
    elseif (Value==36) then
        return 2926
    elseif (Value==37) then
        return 2927
    elseif (Value==41) then
        return 308
    elseif (Value==42) then
        return 586
    elseif (Value==43) then
        return 1804
    elseif (Value==44) then
        return 1807
    elseif (Value==45) then
        return 1808
    elseif (Value==46) then
        return 1809
    elseif (Value==47) then
        return 1817
    elseif (Value==51) then
        return 2805
    elseif (Value==52) then
        return 272
    elseif (Value==53) then
        return 692
    elseif (Value==54) then
        return 693
    elseif (Value==55) then
        return 694
    elseif (Value==56) then
        return 695
    elseif (Value==57) then
        return 440
    elseif (Value==58) then
        return 441
    elseif (Value==59) then
        return 442
    elseif (Value==60) then
        return 443
    elseif (Value==61) then
		return 268
	elseif (Value==62) then
		return 269
	elseif (Value==71) then
		return 2873
	elseif (Value==72) then
		return 2874
	end
end
