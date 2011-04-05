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
    AddWeg({481,794,0},"Galmair; Runewick","Galmair; Runewick",2,0);
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
	-- AddWeg({X,Y,Z},"German.","English.",1,0);

    --NE/Neutral-map


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
	--Creek Settlement
    AddGrave({187,509,0},"","", 1,0);
    AddGrave({194,505,0},"","", 3,0);
	--Cursed Place
    AddGrave({387,544,0},"","", 2,0);
    AddGrave({387,542,0},"","", 1,0);
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
    AddPicture({147,622,1},"","", 2,0); --flats
    AddPicture({147,616,1},"","", 4,0); --flats
    AddPicture({141,612,1},"","", 3,0); --flats
    AddPicture({145,608,1},"","", 1,0); --flats
    AddPicture({142,606,1},"","", 3,0); --flats
    AddPicture({144,604,0},"","", 4,0); --flats
    AddPicture({141,607,0},"","", 7,0); --flats
    AddPicture({139,613,0},"","", 4,0); --flats
    AddPicture({143,613,0},"","", 4,0); --flats
    AddPicture({129,524,0},"","", 7,0); --palace
    AddPicture({130,518,0},"","", 5,0); --queens room
    AddPicture({135,516,0},"","", 3,0); --queens room
    AddPicture({137,516,0},"","", 3,0); --queens room
    AddPicture({117,579,0},"","", 4,0); --taverne
    AddPicture({91,572,0},"","", 4,0); --inn
    AddPicture({91,574,0},"","", 4,0); --inn
    AddPicture({91,576,0},"","", 4,0); --inn
    AddPicture({86,574,0},"","", 4,0); --inn
    AddPicture({88,578,1},"","", 5,0); --inn
    AddPicture({85,578,1},"","", 5,0); --inn
    AddPicture({96,600,1},"","", 4,0); --building
    AddPicture({96,599,1},"","", 4,0); --building
    AddPicture({96,602,0},"","", 4,0); --building
    AddPicture({100,611,1},"","", 3,0); --building
    --Galmair Plateau
    AddPicture({318,357,1},"","", 1,0);
    AddPicture({318,359,1},"","", 2,0);

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
    AddPennant({44,607,0},"","", 6,0);
    AddPennant({44,602,0},"","", 6,0);
    AddPennant({46,634,0},"","", 7,0);
    AddPennant({41,634,0},"","", 7,0);
	--Buccaneers Lurk
    AddPennant({214,462,0},"","", 4,0);
    AddPennant({210,462,0},"","", 4,0);
    AddPennant({205,462,0},"","", 4,0);
    AddPennant({200,462,0},"","", 4,0);
    AddPennant({196,463,0},"","", 6,0);
    AddPennant({196,467,0},"","", 6,0);
    AddPennant({201,468,0},"","", 7,0);
    AddPennant({196,471,0},"","", 6,0);
    AddPennant({196,475,0},"","", 6,0);
    AddPennant({196,479,0},"","", 6,0);
    AddPennant({196,483,0},"","", 6,0);
    AddPennant({196,487,0},"","", 6,0);
    AddPennant({201,483,0},"","", 7,0);
    AddPennant({200,487,0},"","", 7,0);
    AddPennant({204,487,0},"","", 7,0);
    --Cadomyr
    AddPennant({121,519,0},"","", 1,0); --palace
	AddPennant({122,519,0},"","", 1,0); --palace
    AddPennant({123,519,0},"","", 1,0); --palace
    AddPennant({130,528,0},"","", 2,0); --palace
    AddPennant({130,530,0},"","", 2,0); --palace
    AddPennant({109,551,0},"","", 1,0); --registration
    AddPennant({104,552,0},"","", 1,0); --registration
	--Galmair Plateau
    AddPennant({358,378,1},"","", 4,0);
    AddPennant({356,378,1},"","", 4,0);
	--Glowing Gate
    AddPennant({487,582,0},"","", 1,0);
    AddPennant({485,582,0},"","", 1,0);
    --Hammerfall Mine
    AddPennant({257,419,0},"","", 1,0);
    AddPennant({258,419,0},"","", 3,0);
    AddPennant({260,419,0},"","", 3,0);
	AddPennant({261,419,0},"","", 1,0);
	--Moshran's Brood
    AddPennant({391,743,0},"","", 1,0);
    AddPennant({393,743,0},"","", 1,0);
    AddPennant({398,743,0},"","", 7,0);
    --Mount Zotmore
    AddPennant({365,497,0},"Sei vorsichtig, hier könnte ein Zot zufinden sein.","Be carful, there could be a Zot around.", 6,0);
    --Lost Building (2)
    AddPennant({277,605,0},"","", 5,0);
    AddPennant({277,596,0},"","", 5,0);
    AddPennant({269,599,0},"","", 6,0);
    AddPennant({265,605,0},"","", 6,0);
    --Lost Building (3)
    AddPennant({290,474,0},"","", 5,0);
    AddPennant({262,488,0},"","", 6,0);
	--Lumpskrums Band
	AddPennant({361,752,0},"","", 1,0);
    AddPennant({357,752,0},"","", 1,0);
    --Royal Slave Market
	AddPennant({325,627,5},"","", 1,0);
	AddPennant({325,629,5},"","", 1,0);
	AddPennant({325,632,5},"","", 1,0);
	AddPennant({325,624,5},"","", 1,0);
	AddPennant({323,627,6},"","", 1,0);
	AddPennant({323,629,6},"","", 1,0);
	AddPennant({323,632,6},"","", 1,0);
	AddPennant({323,634,6},"","", 1,0);
	--The Royal Academy of Gladiators
	AddPennant({210,701,0},"","", 7,0);
    AddPennant({215,701,0},"","", 7,0);
    --The Blood Circle Arena
    AddPennant({248,668,1},"","", 3, 10);
    AddPennant({250,690,0},"","", 2, 10);
    AddPennant({250,685,0},"","", 2, 10);
    --Zumbrass Tomb
	AddPennant({331,473,0},"","", 7,0);

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

	--Irundar
	AddTree({286,546,0},"","", 1,12); --tree check!!!

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
	AddPillar({54,608,0},"","", 1, 10);
	AddPillar({54,602,0},"","", 1, 10);
	--Cadomyr
	AddPillar({88,655,1},"","", 6, 10); --outside
	AddPillar({88,659,1},"","", 6, 10); --outside
    AddPillar({108,655,1},"","", 5, 10); --outside
    AddPillar({117,655,1},"","", 5, 10); --outside
    AddPillar({108,637,1},"","", 5, 10); --outside
    AddPillar({117,637,1},"","", 5, 10); --outside
    AddPillar({165,642,1},"","", 6, 10); --outside
    AddPillar({165,638,1},"","", 6, 10); --outside
    AddPillar({86,620,1},"","", 6, 10); --guardtower
    AddPillar({86,623,1},"","", 6, 10); --guardtower
    AddPillar({84,619,1},"","", 6, 10); --guardtower
    AddPillar({84,619,0},"","", 9, 10); --guardtower
    AddPillar({91,623,0},"","", 3, 10); --guardtower
    AddPillar({90,623,0},"","", 3, 10); --guardtower
    AddPillar({128,631,0},"","", 6, 10); --townwall
    AddPillar({128,634,0},"","", 6, 10); --townwall
    AddPillar({132,619,1},"","", 9, 10); --
    AddPillar({136,619,1},"","", 9, 10); --
    AddPillar({129,619,1},"","", 6, 10); --
    AddPillar({129,628,1},"","", 6, 10); --
    AddPillar({139,626,1},"","", 4, 10); --
    AddPillar({139,629,1},"","", 4, 10); --
    AddPillar({139,632,1},"","", 4, 10); --
    AddPillar({139,636,1},"","", 5, 10); --
    AddPillar({136,636,1},"","", 5, 10); --
  	AddPillar({132,566,0},"","", 1, 10); --temple
    AddPillar({132,562,0},"","", 1, 10); --temple
    AddPillar({136,560,0},"","", 1, 10); --temple
    AddPillar({136,568,0},"","", 1, 10); --temple
    AddPillar({137,560,0},"","", 9, 10); --temple
    AddPillar({138,560,0},"","", 9, 10); --temple
    AddPillar({139,560,0},"","", 9, 10); --temple
    AddPillar({140,560,0},"","", 9, 10); --temple
	AddPillar({137,568,0},"","", 8, 10); --temple
	AddPillar({138,568,0},"","", 8, 10); --temple
	AddPillar({139,568,0},"","", 8, 10); --temple
	AddPillar({140,568,0},"","", 8, 10); --temple
    AddPillar({143,566,0},"","", 6, 10); --temple
    AddPillar({143,562,0},"","", 6, 10); --temple
    AddPillar({144,566,0},"","", 1, 10); --temple
    AddPillar({144,562,0},"","", 1, 10); --temple
    AddPillar({124,548,0},"","", 1, 10); --palace
    AddPillar({120,548,0},"","", 1, 10); --palace
    AddPillar({122,547,1},"","", 2, 10); --palace
    AddPillar({119,528,0},"","", 5, 10); --palace
    AddPillar({124,528,0},"","", 5, 10); --palace
    AddPillar({130,529,0},"","", 2, 10); --palace
    AddPillar({149,512,-3},"","", 5, 10); --tresuray
    AddPillar({153,516,-3},"","", 9, 10); --tresuray
    AddPillar({150,516,-3},"","", 9, 10); --tresuray
    AddPillar({147,516,-3},"","", 9, 10); --tresuray
    AddPillar({145,516,-3},"","", 9, 10); --tresuray
    AddPillar({145,520,-3},"","", 7, 10); --tresuray
    AddPillar({145,522,-3},"","", 7, 10); --tresuray
    AddPillar({149,519,-3},"","", 10, 10); --tresuray
    AddPillar({149,521,-3},"","", 10, 10); --tresuray
    AddPillar({80,577,1},"","", 2, 10); --inn
    AddPillar({89,601,0},"","", 2, 10); --building
    AddPillar({106,667,-4},"","", 1, 10); --dungeon
    AddPillar({106,670,-4},"","", 1, 10); --dungeon
    AddPillar({133,670,-4},"","", 5, 10); --dungeon
    AddPillar({135,670,-4},"","", 5, 10); --dungeon
    AddPillar({144,668,-4},"","", 6, 10); --dungeon
    AddPillar({144,668,-4},"","", 6, 10); --dungeon
    AddPillar({145,660,-4},"","", 5, 10); --dungeon
    AddPillar({143,660,-4},"","", 5, 10); --dungeon
    AddPillar({155,665,-3},"","", 9, 10); --dungeon
    AddPillar({159,665,-3},"","", 9, 10); --dungeon
    AddPillar({155,670,-3},"","", 8, 10); --dungeon
    AddPillar({159,670,-3},"","", 8, 10); --dungeon
	--Chapel of the Five
	AddPillar({476,800,0},"","", 1, 10);
    AddPillar({476,791,0},"","", 1, 10);
	AddPillar({470,793,0},"","", 1, 10);
    AddPillar({470,798,0},"","", 1, 10);
    --Creek Settlement
	AddPillar({189,511,0},"","", 1, 10);
	AddPillar({195,511,0},"","", 1, 10);
	AddPillar({186,495,0},"","", 1, 10);
	AddPillar({186,493,0},"","", 1, 10);
	--Cursed Place
    AddPillar({388,551,0},"","", 2, 10);
    AddPillar({376,553,0},"","", 1, 10);
    AddPillar({376,551,0},"","", 1, 10);
	--Galmair Plateau
	AddPillar({357,365,1},"","", 4, 10);
	--Grugmutz's cave
    AddPillar({169,558,0},"","", 1, 10);
    AddPillar({169,561,0},"","", 1, 10);
	--Kata Island
	AddPillar({169,834,0},"","", 2, 10);
	--Lost Building (1)
    AddPillar({256,726,0},"","", 2, 10);
    --Lost Building (2)
	AddPillar({272,602,0},"","", 1, 10);
    AddPillar({272,603,0},"","", 1, 10);
    --Lost Building (3)
	AddPillar({284,476,0},"","", 2, 10);
	AddPillar({285,477,0},"","", 2, 10);
    --Lost Harbour
	AddPillar({106,831,0},"","", 2, 10);
	AddPillar({104,831,0},"","", 2, 10);
	--Moshran's Brood
	AddPillar({401,733,0},"","", 1, 10);
	--Mount Zotmore
	AddPillar({361,495,0},"","", 1, 10);
	AddPillar({357,495,0},"","", 1, 10);
	--Pyramide of Chaos
    AddPillar({227,581,0},"","", 1, 10);
    AddPillar({237,590,0},"","", 1, 10);
    AddPillar({233,590,0},"","", 1, 10);
    AddPillar({237,593,0},"","", 1, 10);
    AddPillar({233,593,0},"","", 1, 10);
    AddPillar({237,599,0},"","", 1, 10);
    AddPillar({233,599,0},"","", 1, 10);
    AddPillar({237,602,0},"","", 1, 10);
    AddPillar({233,602,0},"","", 1, 10);
    AddPillar({237,605,0},"","", 1, 10);
    AddPillar({233,605,0},"","", 1, 10);
    AddPillar({230,598,0},"","", 1, 10);
    AddPillar({230,594,0},"","", 1, 10);
    AddPillar({227,598,0},"","", 1, 10);
    AddPillar({227,594,0},"","", 1, 10);
	--Queens Corner
	AddPillar({301,502,0},"","", 2, 10);
 	--Tempel of Sirani
    AddPillar({176,759,0},"","", 2, 10);
    AddPillar({176,764,0},"","", 2, 10);
    --The Blood Circle Arena
    AddPillar({256,665,0},"","", 7, 10);
    AddPillar({261,665,0},"","", 9, 10);
    AddPillar({261,670,0},"","", 10, 10);
    AddPillar({256,670,0},"","", 8, 10);
    AddPillar({250,683,0},"","", 5, 10);
    AddPillar({266,683,0},"","", 5, 10);
	--The Royal Academy of Gladiators
    AddPillar({228,714,0},"","", 1, 10);
    AddPillar({228,712,0},"","", 1, 10);
    AddPillar({233,711,1},"","", 6, 10);
    AddPillar({233,713,1},"","", 6, 10);
    AddPillar({210,696,0},"","", 7, 10);
    AddPillar({216,696,0},"","", 7, 10);
    AddPillar({210,696,0},"","", 7, 10);
    AddPillar({216,696,0},"","", 10, 10);
    AddPillar({210,684,0},"","", 10, 10);
    AddPillar({216,684,0},"","", 10, 10);
    --Vrondus Farm
	AddPillar({310,572,0},"","", 2, 10);

    
    
    
    
	---------------- Chimneys ~ Kamine -------------
	-- AddChimney({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west
	
    --Cadomyr
    AddChimney({142,601,1},"","", 1, 0); --flats
	AddChimney({146,623,0},"","", 2, 0); --flats
    AddChimney({140,554,0},"","", 2, 0); --library
    AddChimney({136,516,0},"","", 1, 0); --queens room
    AddChimney({94,552,0},"","", 1, 0); --room
    AddChimney({93,597,0},"","", 1, 0); --building
    AddChimney({104,615,0},"","", 2, 0); --building
    --Galmair Plateau
    AddChimney({326,366,1},"","", 2, 0);
    AddChimney({311,351,1},"","", 1, 0);
    
    
    

	---------------- Mirrors ~ Spiegel -------------
	-- AddMirror({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west

	--Cadomyr
	AddMirror({149,516,0},"","", 2,0); --queens room
    AddMirror({91,552,0},"","", 1,0); --room
    AddMirror({84,576,1},"","", 2,0); --inn
    AddMirror({92,597,1},"","", 1,0); --building
    AddMirror({97,611,1},"","", 1,0); --building

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
