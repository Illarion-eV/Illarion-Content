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
    AddWeg({365,247,0},"Guilianni-Residenz oder Galmair's Crest","Guilianni Residence or Galmair's Crest",0,0); -- Don's palace
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
    AddWeg({501,212,0},"Hafen + Dunkellochmine","Harbour + Dark Hole Mine",0,0);
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
    AddWeg({503,213,0},"Gasthof zur Hanfschlinge; Cadomyr; Runewick","The Hemp Necktie Inn; Cadomyr; Runewick",2,0);
    AddWeg({501,218,0},"Galmair","Galmair",4,0);
    AddWeg({427,247,0},"Hafen; Dunkellochmine; Gasthof zur Hanfschlinge; Cadomyr; Runewick","Harbour; Dark Hole Mine; The Hemp Necktie Inn; Cadomyr; Runewick",2,0);
    AddWeg({485,248,0},"Hafen; Dunkellochmine; Gasthof zur Hanfschlinge; Cadomyr; Runewick","Harbour; Dark Hole Mine; The Hemp Necktie Inn; Cadomyr; Runewick",2,0);
    AddWeg({397,253,0},"Malachitmine","Malachite Mine",4,0);

    --SE/Runewick-map
    AddWeg({525,782,0},"Cadomyr","Cadomyr",6,0);
	AddWeg({644,715,0},"Wachstützpunkt","Sentry Outpost",0,0);
	AddWeg({528,782,0},"Wachstützpunkt","Sentry Outpost",2,0);
	AddWeg({528,781,0},"Leuchtturm; Galmair; Runewick","Lighthouse; Galmair; Runewick",0,0);
    AddWeg({539,530,0},"Leuchttrum; Wachstützpunkt; Cadomyr","Lighthouse; Sentry Outpost; Cadomyr",4,0);
    AddWeg({517,583,0},"Leuchttrum; Wachstützpunkt; Cadomyr","Lighthouse; Sentry Outpost; Cadomyr",4,0);
    AddWeg({887,638,0},"Eastport","Eastport",0,0);
    AddWeg({887,639,0},"Runewick","Runewick",4,0);
    AddWeg({725,559,0},"Gasthof zur Hanfschlinge; Cadomyr; Galmair","The Hemp Necktie Inn; Cadomyr; Galmair",0,0);
    AddWeg({725,559,0},"Gasthof zur Hanfschlinge; Cadomyr; Galmair - Achtung! Diebe!","The Hemp Necktie Inn; Cadomyr; Galmair - Attention! Thieves!",2,0);
    AddWeg({758,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Dangerous heat!",0,0);
    AddWeg({755,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Dangerous heat!",0,0);
    AddWeg({749,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Dangerous heat!",0,0);
    AddWeg({746,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Dangerous heat!",0,0);
    AddWeg({743,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Dangerous heat!",0,0);
    AddWeg({760,632,0},"Drachenbau! Achtung heiß!","Dragon Lair! Dangerous heat!",2,0);
    AddWeg({790,687,0},"Runewick - Viel Glück!","Runewick - Good luck!",4,0);
    AddWeg({789,681,0},"Schlechte Wahl!","Bad choice!",6,0);
    AddWeg({790,681,0},"Sehr schlechte Wahl!","Very bad choice!",2,0);
    AddWeg({759,735,0},"Bärenhöhle; Drachenbau; Norden","Bear Cave; Dragon Lair; North",0,0);
    AddWeg({847,728,0},"Heitere Lichtung","Merryglade",0,0);
    AddWeg({847,730,0},"Osthafen","Eastport",2,0);
    AddWeg({786,777,0},"Anthilbach","Anthil Brook",6,0);
    AddWeg({786,777,0},"Heitere Lichtung; Osthafen","Merryglade; Eastport",2,0);
    AddWeg({739,803,0},"Hafen","Harbour",6,0);
    AddWeg({739,806,0},"Hafen","Harbour",6,0);
    AddWeg({739,807,0},"Hafen","Harbour",6,0);
    AddWeg({739,810,0},"Hafen","Harbour",6,0);
    AddWeg({739,811,0},"Hafen","Harbour",6,0);
    AddWeg({739,814,0},"Hafen","Harbour",6,0);
    AddWeg({757,813,0},"Vierbeiniger Roter Vogel; Hafen","Quadruped Red Bird; Harbour",6,0);
    AddWeg({762,801,0},"Bauernhöfe","Farmland",2,0);
    AddWeg({761,800,0},"Bärenhöhle; Drachenbau; Cadomyr; Galmair; Gasthof zur Hanfschlinge","Bear Cave; Dragon Lair; Cadomyr; Galmair; The Hemp Necktie Inn",0,0);
    AddWeg({783,798,0},"Erzmagier Elvaine Morgan; Vierbeiniger Roter Vogel; Hafen","Archmage Elvaine Morgan; Quadruped Red Bird; Harbour",6,0);
    AddWeg({783,797,0},"Anthilbach; Heitere Lichtung; Osthafen","Anthil Brook; Merryglade; Eastport",0,0);
    AddWeg({761,813,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({791,821,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({840,821,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({840,824,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({853,821,0},"Hölzfällersiedlung; Zwillingsaugen Inseln","Woodcutter's Hut; Twin Eyes Islands",4,0);
    AddWeg({855,814,0},"Heilige Eiche; Triumphfeuer","Holy Oak; Fire of Triumph",0,0);
    AddWeg({851,816,0},"Vierbeiniger Roter Vogel; Hafen; Bauernhöfe; Cadomyr; Galmair; ...","Quadruped Red Bird; Harbour; Farmland; Cadomyr; Galmair; ...",6,0);
    AddWeg({856,819,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    

    --NE/Neutral-map
    AddWeg({680,311,0},"Galmair","Galmair",6,0);
    AddWeg({685,317,0},"Gasthof zur Hanfschlinge","The Hemp Necktie Inn",2,0);
    AddWeg({676,326,0},"Cadomyr","Cadomyr",6,0);
    AddWeg({682,328,0},"Runewick","Runewick",4,0);
    AddWeg({723,385,0},"Gasthof zur Hanfschlinge; Galmair","The Hemp Necktie Inn; Galmair",6,0);
    AddWeg({730,391,0},"Runewick","Runewick",4,0);
	AddWeg({714,488,0},"Cadomyr","Cadomyr",6,0);
    AddWeg({718,488,0},"Gasthof zur Hanfschlinge; Galmair","The Hemp Necktie Inn; Galmair",0,0);
    AddWeg({717,455,0},"Cadomyr","Cadomyr",6,0);
    AddWeg({729,459,0},"Runewick","Runewick",4,0);
    AddWeg({729,448,0},"Gasthof zur Hanfschlinge; Galmair","The Hemp Necktie Inn; Galmair",0,0);
    AddWeg({564,394,0},"Funkelhöhle","Glittering Cave",0,0);

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
	--Cherass‘ Citadel
	AddGrave({572,314,0},"","", 2,0);
	AddGrave({576,314,0},"","", 3,0);
	AddGrave({569,316,0},"","", 4,0);
	AddGrave({570,316,0},"","", 4,0);
	AddGrave({571,316,0},"","", 4,0);
	AddGrave({572,316,0},"","", 4,0);
	AddGrave({573,316,0},"","", 4,0);
	AddGrave({569,318,0},"","", 4,0);
	AddGrave({570,318,0},"","", 4,0);
	AddGrave({571,318,0},"","", 4,0);
	AddGrave({572,318,0},"","", 4,0);
	AddGrave({573,318,0},"","", 4,0);
	AddGrave({581,315,0},"","", 1,0);
	AddGrave({605,327,0},"","", 1,0);
	AddGrave({605,344,0},"","", 1,0);
	AddGrave({592,355,0},"","", 3,0);
	AddGrave({585,323,0},"","", 2,0);
	AddGrave({588,326,0},"","", 3,0);
	AddGrave({630,355,0},"","", 1,0); --outside
	AddGrave({650,347,0},"","", 1,0); --outside
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
    --Death Marsh
    AddGrave({667,366,0},"","", 3,0);
    AddGrave({686,356,0},"","", 3,0);
    AddGrave({717,354,0},"","", 3,0);
    AddGrave({725,369,0},"","", 1,0);
    AddGrave({745,369,0},"","", 3,0);
    AddGrave({773,369,0},"","", 2,0);
    AddGrave({791,353,0},"","", 2,0);--Witch's Cottage
    AddGrave({712,371,0},"","", 1,0);
    --Death's Stench
    AddGrave({805,586,0},"","", 3,0);
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
	--Elstree Plain
    AddGrave({751,378,0},"","", 1,0);
    AddGrave({720,426,0},"","", 1,0);
    --Elven Ruins
    AddGrave({549,451,0},"","", 1,0);
    AddGrave({547,439,0},"","", 1,0);
    AddGrave({547,440,0},"","", 1,0);
    --Galmair
    AddGrave({393,178,-6},"","", 1,0);--Hog Dens
    AddGrave({393,180,-6},"","", 3,0);--Hog Dens
    AddGrave({392,257,-6},"","", 3,0);--Ronagans Altar
    AddGrave({361,303,-6},"","", 3,0);--The Winged Sow Tavern        
    AddGrave({333,265,-6},"","", 1,0);--Sewers
    AddGrave({331,271,-6},"","", 1,0);--Sewers
    AddGrave({331,270,-6},"","", 1,0);--Sewers
    AddGrave({333,273,-6},"","", 3,0);--Sewers
    AddGrave({338,282,-6},"","", 1,0);--Sewers
    AddGrave({327,295,-6},"","", 3,0);--Sewers
    AddGrave({298,331,-6},"","", 3,0);--Sewers
    --Galmair hinterlands
    AddGrave({545,501,0},"","", 3,0);--Sport Hole
    --Glittering Cave
    AddGrave({564,382,0},"Hier hat es sich ausgefunkelt!","Glittering is over now!", 3,0);
    --Glowing Forest
    AddGrave({503,536,0},"","", 3,0);
    AddGrave({481,513,0},"","", 1,0);
    AddGrave({520,523,0},"","", 3,0);
    --Glowing Gate
    AddGrave({489,582,0},"","", 4,0);
    --Hammerfall Mine
    AddGrave({264,418,0},"","", 3,0);
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
   	--Moshran's Brood
    AddGrave({410,726,0},"","", 1,0);
    AddGrave({409,734,0},"","", 3,0);
    --Mount Zotmore
    AddGrave({366,500,0},"Hier ruht Zot's Freizeit!","Zot's sparetime rests here!", 1,0);
    --AddGrave({348,503,0},"Zu Ehren jenen die Zot's Opfer wurden.","To honour of Zot's victims.", 4,0);
	--Nagrun's Plain
    AddGrave({519,207,0},"","", 1,0);
    AddGrave({538,250,0},"","", 1,0);
    AddGrave({555,262,0},"","", 4,0);
    AddGrave({614,259,0},"","", 2,0);
    --Pirate Cove
    AddGrave({12,516,0},"","", 3,0);
    AddGrave({30,525,0},"","", 1,0);
    AddGrave({60,548,1},"","", 1,0);
    AddGrave({57,555,1},"","", 3,0);
	--Runewick
	AddGrave({896,799,0},"","", 3,5); --slums graveyard
	AddGrave({895,803,0},"","", 3,5); --slums graveyard
	AddGrave({891,800,0},"","", 3,5); --slums graveyard
	AddGrave({889,803,0},"","", 3,5); --slums graveyard
	AddGrave({891,803,0},"","", 1,5); --slums graveyard
	AddGrave({894,801,0},"","", 1,5); --slums graveyard
	AddGrave({892,799,0},"","", 1,5); --slums graveyard
	AddGrave({908,803,-3},"","", 4,5); --tomb
	AddGrave({908,805,-3},"","", 4,5); --tomb
	AddGrave({907,803,-3},"","", 4,5); --tomb
	AddGrave({907,805,-3},"","", 4,5); --tomb
	--Runewick Hinterland
	AddGrave({925,940,0},"","", 1,5); --Twin Eyes Islands
	AddGrave({865,846,0},"","", 2,5); --Woodcutter's Hut
	AddGrave({862,847,0},"","", 3,5); --Woodcutter's Hut
	AddGrave({879,759,0},"","", 1,5); --Fire of Triumph
	--Snakehead Coast
    AddGrave({621,463,0},"","", 1,0);
    AddGrave({692,483,0},"","", 1,0); --Wilder Island
    AddGrave({714,442,0},"","", 3,0);
	--Spider's Mouth
    AddGrave({665,293,0},"","", 1,0);
    AddGrave({690,341,0},"","", 2,0);
    AddGrave({725,369,0},"","", 1,0);
    AddGrave({665,293,0},"","", 1,0);
    --The Swamp
    AddGrave({485,146,0},"","", 1,0);
    AddGrave({494,105,0},"","", 3,0);
    AddGrave({508,102,0},"","", 3,0);
    AddGrave({498,113,0},"","", 3,0);
	AddGrave({503,99,0},"","", 1,0);
    AddGrave({506,108,0},"","", 1,0);
    AddGrave({502,114,0},"","", 1,0);
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
    --Eastland
    AddPicture({894,540,0},"","", 2,5); --Paddock Farm
    --Galmair
    AddPicture({309,270,0},"","", 4,5); --Villa 'Goldvein'
    AddPicture({309,277,0},"","", 4,5); --Villa 'Goldvein'
    AddPicture({372,214,0},"","", 7,5); --Council Chamber
    AddPicture({370,214,0},"","", 7,5); --Council Chamber
    AddPicture({375,217,0},"","", 6,5); --Council Chamber
    AddPicture({363,217,0},"","", 5,5); --Council Chamber
    AddPicture({365,224,0},"","", 2,5); --Council Chamber
    AddPicture({419,210,-6},"","",1,5); --Cameo Pit
    AddPicture({419,215,-6},"","",2,5); --Cameo Pit
    AddPicture({434,220,-6},"","",3,5); --Cameo Pit
    AddPicture({429,227,-6},"","",5,5); --Cameo Pit
    AddPicture({433,232,-6},"","",2,5); --Cameo Pit
    AddPicture({435,237,-6},"","",1,5); --Cameo Pit
    AddPicture({428,236,-5},"","",5,5); --Cameo Pit
    AddPicture({433,236,-5},"","",5,5); --Cameo Pit
    AddPicture({436,238,-5},"","",4,5); --Cameo Pit
    AddPicture({436,239,-5},"","",4,5); --Cameo Pit
    AddPicture({433,227,-5},"","",3,5); --Cameo Pit
    AddPicture({433,228,-5},"","",8,5); --Cameo Pit
    AddPicture({428,227,-5},"","",7,5); --Cameo Pit
    AddPicture({437,222,-5},"","",4,5); --Cameo Pit
    AddPicture({437,221,-5},"","",4,5); --Cameo Pit
    AddPicture({422,210,-5},"","",4,5); --Cameo Pit
    AddPicture({411,227,-6},"","",5,5); --Cameo Pit
    AddPicture({416,227,-6},"","",7,5); --Cameo Pit
    AddPicture({417,235,-5},"","",4,5); --Cameo Pit
    AddPicture({417,229,-5},"","",4,5); --Cameo Pit
    AddPicture({394,337,-5},"","",1,5); --The Winged Sow Tavern
    AddPicture({394,333,-5},"","",6,5); --The Winged Sow Tavern
    --Galmair Hinterlands
    AddPicture({419,346,0},"","", 2,5); --Miners club
    AddPicture({416,296,0},"","", 7,5); --Sleepy Bujhaar Inn
    AddPicture({419,296,0},"","", 3,5); --Sleepy Bujhaar Inn
	AddPicture({421,293,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({426,293,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({426,291,1},"","", 4,5); --Sleepy Bujhaar Inn
	AddPicture({423,289,1},"","", 3,5); --Sleepy Bujhaar Inn
	--Galmair Plateau
    AddPicture({318,357,1},"","", 1,5);
    AddPicture({318,359,1},"","", 2,5);
    --Runewick Harbour/Farm
	AddPicture({756,797,0},"","", 4,5); --Taverne "Quadruped Red Bird"
    --Runewick - Tower of Air
    AddPicture({910,833,4},"","", 2,5)
    AddPicture({910,835,4},"","", 1,5)
    AddPicture({898,834,4},"","", 2,5)
    AddPicture({898,836,4},"","", 1,5)
    AddPicture({897,830,4},"","", 4,5)
    AddPicture({906,837,3},"","", 2,5) --house of gods
    AddPicture({906,828,3},"","", 1,5) --house of gods
    AddPicture({910,832,3},"","", 4,5)
    AddPicture({897,830,2},"","", 4,5) --student dorm
    AddPicture({892,828,2},"","", 7,5) --student dorm
    AddPicture({903,833,2},"","", 5,5)
    AddPicture({907,830,2},"","", 5,5)
    AddPicture({904,818,1},"","", 4,5)
    AddPicture({904,822,1},"","", 4,5)
    AddPicture({912,831,1},"","", 3,5)
    AddPicture({917,831,1},"","", 3,5)
    AddPicture({897,831,1},"","", 4,5)
    --Runewick - Tower of Earth
    AddPicture({956,832,0},"","", 4,5) --Adron's barrel
    AddPicture({956,837,0},"","", 4,5) --Adron's barrel
    AddPicture({949,819,1},"","", 3,5)
    AddPicture({950,829,2},"","", 4,5)
    AddPicture({947,824,2},"","", 3,5)
    AddPicture({943,824,2},"","", 3,5)
    AddPicture({950,830,3},"","", 5,5)
    AddPicture({954,830,3},"","", 5,5)
    AddPicture({956,834,3},"","", 4,5)
    AddPicture({956,838,3},"","", 4,5)
    AddPicture({956,831,4},"","", 2,5)
    AddPicture({956,833,4},"","", 2,5)
    AddPicture({956,836,4},"","", 1,5)
    AddPicture({954,835,4},"","", 3,5)
    --Runewick - Tower of Fire
    AddPicture({904,778,1},"","", 4,5) --library
    AddPicture({909,761,1},"","", 3,5)
    AddPicture({911,761,1},"","", 3,5)
    AddPicture({915,761,1},"","", 3,5)
    AddPicture({917,761,1},"","", 3,5)
    AddPicture({921,761,1},"","", 3,5)
    AddPicture({923,761,1},"","", 3,5)
    AddPicture({896,756,2},"","", 3,5) --archmage's room
    AddPicture({901,762,2},"","", 4,5) --archmage's room
    AddPicture({910,770,2},"","", 4,5) --hall of elara
    AddPicture({910,774,2},"","", 1,5) --hall of elara
    AddPicture({911,782,2},"","", 1,5) --hall of elara
    AddPicture({898,766,4},"","", 3,5)
    AddPicture({901,766,4},"","", 3,5)
    AddPicture({900,777,4},"","", 3,5)
    AddPicture({899,777,4},"","", 3,5)
    --Runewick - Tower of Water
    AddPicture({949,754,4},"","", 4,5)
    AddPicture({949,755,4},"","", 4,5)
    AddPicture({953,765,4},"","", 1,5)
    AddPicture({953,766,4},"","", 2,5)
    AddPicture({944,763,4},"","", 3,5)
    AddPicture({948,753,3},"","", 1,5)
    AddPicture({948,755,3},"","", 8,5)
    AddPicture({948,757,3},"","", 2,5)
    AddPicture({952,764,3},"","", 5,5)
    --Spider's Mouth
    AddPicture({711,314,1},"","", 1,5); --The Hemp Necktie Inn
    AddPicture({708,316,1},"","", 7,5); --The Hemp Necktie Inn
    AddPicture({708,316,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({700,307,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({711,320,1},"","", 4,5); --The Hemp Necktie Inn
    AddPicture({705,326,1},"","", 5,5); --The Hemp Necktie Inn
    AddPicture({700,318,1},"","", 3,5); --The Hemp Necktie Inn
	AddPicture({698,307,0},"","", 5,5); --The Hemp Necktie Inn
	AddPicture({711,324,0},"","", 4,5); --The Hemp Necktie Inn

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
    --Antil Brook
    AddPennant({773,770,0},"","", 7,5);
    AddPennant({775,770,0},"","", 7,5);
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
    --Cherass‘ Citadel
    AddPennant({596,383,2},"","", 7,5); --outpost
    AddPennant({601,383,2},"","", 7,5); --outpost
    --Craven cave
    AddPennant({674,389,2},"","", 6,5);
	AddPennant({674,392,2},"","", 6,5);
	AddPennant({670,389,2},"","", 6,5);
	AddPennant({670,392,2},"","", 6,5);
	AddPennant({666,448,0},"","", 7,5);
	AddPennant({670,448,0},"","", 7,5);
	--Death Marsh
	AddPennant({795,361,0},"","", 7,5);--Witch's Cottage
    AddPennant({797,361,0},"","", 7,5);--Witch's Cottage
	AddPennant({795,356,0},"","", 7,5);--Witch's Cottage
    AddPennant({797,356,0},"","", 7,5);--Witch's Cottage
    --Dragon lair
	AddPennant({837,677,1},"","", 7, 5);
	AddPennant({837,677,1},"","", 7, 5);
	AddPennant({742,667,0},"","", 7, 5);
	AddPennant({745,667,0},"","", 7, 5);
	AddPennant({748,667,0},"","", 7, 5);
	AddPennant({751,667,0},"","", 7, 5);
	AddPennant({754,667,0},"","", 7, 5);
	AddPennant({757,667,0},"","", 7, 5);
	AddPennant({760,667,0},"","", 7, 5);
    --Eastland
    AddPennant({885,479,0},"","", 3,5); --Eastport
    AddPennant({885,491,0},"","", 2,5); --Eastport
    AddPennant({885,494,0},"","", 2,5); --Eastport
    AddPennant({902,622,1},"","", 6,5); --Ronagan Temple
    --Elstree Plain
    AddPennant({721,426,0},"","", 6,5); --Lost buidling(4)
	--Firelimes
    AddPennant({528,587,1},"","", 3,5);
    AddPennant({525,587,1},"","", 3,5);
    --Galmair
    AddPennant({383,194,-6},"","", 7,5);--Hog Dens
    AddPennant({386,194,-6},"","", 7,5);--Hog Dens
    --Galmair Hinterland
    AddPennant({410,350,0},"","", 3,5); --Miners club
    AddPennant({401,270,1},"","", 1,5); --Miners club
    AddPennant({446,118,0},"","", 3,5); --Harbour
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
    --The Swamp
    AddPennant({494,155,0},"","", 7,5);
    AddPennant({486,155,0},"","", 7,5);
    AddPennant({502,121,0},"","", 7,5);
    AddPennant({500,121,0},"","", 7,5);
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

    --Adron's Covert
    AddTree({734,764,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({734,770,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({754,764,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({754,770,0},"Zur Mitte, zum Saft, zack, zack!","To the middle, to the juice, zack, zack!", 6,5);
	AddTree({734,764,0},"~Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.~","~You recognise something, but you cannot read it, because you are too blind.~", 6,0);
	AddTree({734,770,0},"~Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.~","~You recognise something, but you cannot read it, because you are too blind.~", 6,0);
	AddTree({754,764,0},"~Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.~","~You recognise something, but you cannot read it, because you are too blind.~", 6,0);
	AddTree({754,770,0},"~Du erkennst, dass hier etwas ist, kannst es aber nicht entziffern, da du zu blind bist.~","~You recognise something, but you cannot read it, because you are too blind.~", 6,0);
	--Bramus REst
	AddTree({752,378,0},"","", 1,5);
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
	--Runewick Hinterland
	AddTree({853,778,0},"","", 6,5); --Holy Oak
	--Snakehead Coast
	AddTree({653,465,0},"","", 6,5);
	AddTree({647,465,0},"","", 6,5);
	AddTree({653,479,0},"","", 6,5);
	AddTree({647,465,0},"","", 6,5);
	--The Swamp
	AddTree({501,107,0},"","", 6,5);

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
	--Adron's Covert
	AddPillar({725,769,0},"","", 2,5);
	AddPillar({727,769,0},"","", 2,5);
	AddPillar({725,772,0},"","", 2,5);
	AddPillar({727,772,0},"","", 2,5);
	--Anthil Brook
	AddPillar({773,763,0},"","", 1,5);
	AddPillar({774,763,0},"","", 5,5);
	AddPillar({775,763,0},"","", 2,5);
	AddPillar({776,763,0},"","", 1,5);
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
    --Cherass‘ Citadel
    AddPillar({568,314,0},"","", 1,5);
    AddPillar({568,319,0},"","", 1,5);
    AddPillar({574,314,0},"","", 1,5);
    AddPillar({574,319,0},"","", 1,5);
    AddPillar({587,314,0},"","", 5,5);
    AddPillar({590,314,0},"","", 5,5);
    AddPillar({593,314,0},"","", 5,5);
    AddPillar({596,314,0},"","", 5,5);
    AddPillar({596,316,0},"","", 1,5);
    AddPillar({585,318,0},"","", 1,5);
    AddPillar({568,329,1},"","", 1,5);
    AddPillar({568,333,1},"","", 1,5);
    AddPillar({572,329,1},"","", 1,5);
    AddPillar({572,333,1},"","", 1,5);
    AddPillar({576,330,1},"","", 1,5);
    AddPillar({576,332,1},"","", 1,5);
    AddPillar({579,330,1},"","", 1,5);
    AddPillar({579,332,1},"","", 1,5);
    AddPillar({567,325,2},"","", 1,5);
    AddPillar({567,325,3},"","", 1,5);
    AddPillar({567,336,2},"","", 1,5);
    AddPillar({567,336,3},"","", 1,5);
    AddPillar({580,325,2},"","", 1,5);
    AddPillar({580,325,3},"","", 1,5);
    AddPillar({580,336,2},"","", 1,5);
    AddPillar({580,336,3},"","", 1,5);
    AddPillar({571,328,2},"","", 7,5);
    AddPillar({571,333,2},"","", 8,5);
    AddPillar({576,328,2},"","", 9,5);
    AddPillar({576,333,2},"","",10,5);
    AddPillar({589,338,0},"","", 7,5);
    AddPillar({589,342,0},"","", 8,5);
    AddPillar({593,342,0},"","",10,5);
    AddPillar({631,355,0},"","", 1,0); --outside
    AddPillar({651,347,0},"","", 1,0); --outside
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
    --Death Marsh
    AddPillar({748,337,0},"","", 1,5);
    AddPillar({709,378,0},"","", 1,5);
    AddPillar({732,379,0},"","", 2,5);
    --Death's Stench
    AddPillar({804,549,0},"","", 5, 5);
    AddPillar({784,581,0},"","", 2, 5);
    --Death Swath
    AddPillar({507,465,0},"","", 1, 5);
	AddPillar({512,465,0},"","", 1, 5);
	AddPillar({512,468,0},"","", 1, 5);
	--Eastland
	AddPillar({899,595,0},"","", 2, 5);
	AddPillar({886,589,0},"","", 2, 5);
	AddPillar({888,566,0},"","", 2, 5);
	AddPillar({898,580,0},"","", 2, 5);
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
    --Galmair
	AddPillar({311,229,1},"","", 4,5); --Irmoroms Temple
	AddPillar({311,235,1},"","", 4,5); --Irmoroms Temple
    AddPillar({340,283,1},"","", 1,5); --Nagrun Temple
    AddPillar({340,281,1},"","", 1,5); --Nagrun Temple
    AddPillar({334,277,0},"","", 1, 5); --Nagrun Temple
	AddPillar({334,280,0},"","", 1, 5); --Nagrun Temple
	AddPillar({396,237,0},"","", 6,5); --Guard House
	AddPillar({376,240,0},"","", 6,5); --Kiln
	AddPillar({375,216,0},"","", 4, 5); --Council Chamber
	AddPillar({375,216,0},"","", 4, 5); --Council Chamber
	AddPillar({373,214,0},"","", 3, 5); --Council Chamber
	AddPillar({371,214,0},"","", 3, 5); --Council Chamber
	AddPillar({369,214,0},"","", 3, 5); --Council Chamber
	AddPillar({360,217,0},"","", 2, 5); --Council Chamber
	AddPillar({355,226,0},"","", 6, 5); --Council Chamber
	AddPillar({363,234,0},"","", 6, 5); --Don's Council Chamber
	AddPillar({334,218,0},"","", 7, 5); --Galmair's Crest
	AddPillar({340,218,0},"","", 10, 5); --Galmair's Crest
    AddPillar({339,228,0},"","", 3, 5); --Galmair's Crest
    AddPillar({335,228,0},"","", 3, 5); --Galmair's Crest
    AddPillar({331,233,0},"","", 8, 5); --Galmair's Crest
    AddPillar({335,215,0},"","", 2, 5); --Galmair's Crest
    AddPillar({339,215,0},"","", 2, 5); --Galmair's Crest
    AddPillar({338,214,0},"","", 5, 5); --Galmair's Crest
    AddPillar({359,213,0},"","", 4, 5); --Don's Room
    AddPillar({359,210,0},"","", 4, 5); --Don's Room
    AddPillar({359,207,0},"","", 4, 5); --Don's Room
    AddPillar({359,204,0},"","", 4, 5); --Don's Room
    AddPillar({359,201,0},"","", 4, 5); --Don's Room
    AddPillar({359,198,0},"","", 4, 5); --Don's Room
    AddPillar({359,195,0},"","", 4, 5); --Don's Room
    AddPillar({359,192,0},"","", 4, 5); --Don's Room
    AddPillar({359,189,0},"","", 4, 5); --Don's Room
    AddPillar({359,186,0},"","", 4, 5); --Don's Room
    AddPillar({358,184,0},"","", 3, 5); --Don's Room
    AddPillar({360,190,-3},"","", 3, 5); --Treasury
    AddPillar({364,190,-3},"","", 3, 5); --Treasury
    AddPillar({384,207,-6},"1. Der Don beschützt dich wenn du die Gebühr bezahlst.","1. The Don protects you if you pay the fee.", 1, 5); --Hog Dens
	AddPillar({385,207,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 3, 5); --Hog Dens
    AddPillar({386,207,-6},"1. Der Don beschützt dich wenn du die Gebühr bezahlst.","1. The Don protects you if you pay the fee.", 1, 5); --Hog Dens
    AddPillar({389,208,-6},"2. Zahl die Abgaben und die Zinsen, und kein Leid soll dir widerfahren.","2. Pay the toll and the interest and no harm will be done.", 1, 5); --Hog Dens
	AddPillar({390,208,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 3, 5); --Hog Dens
    AddPillar({391,208,-6},"2. Zahl die Abgaben und die Zinsen, und kein Leid soll dir widerfahren.","2. Pay the toll and the interest and no harm will be done.", 1, 5); --Hog Dens
    AddPillar({394,211,-6},"3. Handle frei, bleibe und gehe wie es dir beliebt.","3. Trade freely, stay and depart as you wish.", 1, 5); --Hog Dens
	AddPillar({394,212,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 4, 5); --Hog Dens
    AddPillar({394,213,-6},"3. Handle frei, bleibe und gehe wie es dir beliebt.","3. Trade freely, stay and depart as you wish.", 1, 5); --Hog Dens
    AddPillar({387,246,-6},"4. Komm zum Don wenn du Hilfe benötigst. Er ist dein Pate.","4. Come to the Don if you need help. He is your godfather.", 1, 5); --Ronagans Altar
	AddPillar({387,247,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 4, 5); --Ronagans Altar
    AddPillar({387,248,-6},"4. Komm zum Don wenn du Hilfe benötigst. Er ist dein Pate.","4. Come to the Don if you need help. He is your godfather.", 1, 5); --Ronagans Altar
    AddPillar({385,246,-6},"5. Eine Abmachung mit dem Don, ist eine mit deinem Schicksal.","5. A deal with the Don is a deal with your fate.", 1, 5); --Ronagans Altar
	AddPillar({386,247,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 4, 5); --Ronagans Altar
    AddPillar({387,248,-6},"5. Eine Abmachung mit dem Don, ist eine mit deinem Schicksal.","5. A deal with the Don is a deal with your fate.", 1, 5); --Ronagans Altar
    AddPillar({387,284,-6},"6. Hast du Schaden angerichtet, so kompensiere ihn großzügig mit der zweifachen Menge des Schadens.","6. If you did harm, compensate generously, twice the damage.", 1, 5); --Ronagans Altar
	AddPillar({387,285,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 4, 5); --Ronagans Altar
    AddPillar({387,286,-6},"6. Hast du Schaden angerichtet, so kompensiere ihn großzügig mit der zweifachen Menge des Schadens.","6. If you did harm, compensate generously, twice the damage.", 1, 5); --Ronagans Altar
    AddPillar({378,292,-6},"Folge diesen sechs einfachen Regeln des Don, und du kannst tun und lassen was immer du möchtest.","Follow the simple rules of the Don and you can do whatever you like.", 1, 5); --Ronagans Altar
	AddPillar({377,292,-6},"Du siehst eine Statue die das Abild des Don trägt und auf die beiden dunklen Säulen neben ihr zeigt.","You see a representation of the Don as a statue which points the two dark columns next to it.", 3, 5); --Ronagans Altar
    AddPillar({376,292,-6},"Folge diesen sechs einfachen Regeln des Don, und du kannst tun und lassen was immer du möchtest.","Follow the simple rules of the Don and you can do whatever you like.", 1, 5); --Ronagans Altar
    AddPillar({384,337,-6},"","", 4, 5); --The Winged Sow Tavern
    AddPillar({384,339,-6},"","", 4, 5); --The Winged Sow Tavern
    AddPillar({384,341,-6},"","", 3, 5); --The Winged Sow Tavern
    AddPillar({386,341,-6},"","", 3, 5); --The Winged Sow Tavern
    AddPillar({337,241,-6},"","", 4, 5); --Scoria Mine
    AddPillar({338,242,-6},"","", 3, 5); --Scoria Mine
    AddPillar({337,247,-6},"","", 4, 5); --Scoria Mine
    AddPillar({338,248,-6},"","", 3, 5); --Scoria Mine
    AddPillar({331,247,-6},"","", 4, 5); --Scoria Mine
    AddPillar({332,248,-6},"","", 3, 5); --Scoria Mine
    AddPillar({331,241,-6},"","", 4, 5); --Scoria Mine
    AddPillar({332,242,-6},"","", 3, 5); --Scoria Mine
    AddPillar({255,292,-5},"","", 1, 5); --Flicker Swale
    AddPillar({255,294,-5},"","", 1, 5); --Flicker Swale
    AddPillar({255,292,-6},"","", 4, 5); --Flicker Swale
    AddPillar({255,294,-6},"","", 4, 5); --Flicker Swale
    AddPillar({248,298,-5},"","", 3, 5); --Flicker Swale
    AddPillar({251,298,-5},"","", 3, 5); --Flicker Swale
    AddPillar({336,293,-6},"","", 1, 5); --Sewers
    AddPillar({331,293,-6},"","", 1, 5); --Sewers
    AddPillar({293,334,-6},"","", 1, 5); --Sewers
    AddPillar({296,334,-6},"","", 1, 5); --Sewers
	--Galmair Hinterland
    AddPillar({418,289,0},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({420,291,0},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({423,296,1},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({423,298,1},"","", 2,5); --Sleepy Bujhaar Inn
    AddPillar({417,289,1},"","", 3,5); --Sleepy Bujhaar Inn
    AddPillar({415,298,1},"","", 3,5); --Sleepy Bujhaar Inn
    AddPillar({483,248,0},"","", 6,5); --Copperbridge
    AddPillar({483,251,0},"","", 6,5); --Copperbridge
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
	--Merryglade
	AddPillar({848,704,0},"","", 2,5);
	AddPillar({841,741,0},"","", 6,5);
	--Moshran's Brood
	AddPillar({401,733,0},"","", 1,5);
	--Mount Zotmore
	AddPillar({361,495,0},"","", 1,5);
	AddPillar({357,495,0},"","", 1,5);
	--Nagrun's Plain
	AddPillar({522,240,0},"","", 2,5);
	AddPillar({534,259,0},"","", 6,5);
	AddPillar({554,262,0},"","", 1,5);
	AddPillar({556,262,0},"","", 1,5);
	AddPillar({557,219,0},"","", 2,5);
	AddPillar({557,226,0},"","", 2,5);
	AddPillar({604,259,0},"","", 1,5);
	AddPillar({604,262,0},"","", 1,5);
	AddPillar({636,270,0},"","", 1,5);
	AddPillar({636,271,0},"","", 2,5);
	AddPillar({636,274,0},"","", 2,5);
	AddPillar({636,275,0},"","", 1,5);
	AddPillar({483,248,0},"","", 6,5);
	AddPillar({483,251,0},"","", 6,5);
    --Oldra's Corner
	AddPillar({645,679,0},"","", 2,5);
	AddPillar({645,683,0},"","", 2,5);
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
	--Runewick
	AddPillar({910,793,1},"","", 1,5); --entrance
	AddPillar({913,796,1},"","", 1,5); --entrance
	AddPillar({958,788,0},"","", 1,5); --garden
	AddPillar({759,789,0},"","", 1,5); --garden
	AddPillar({759,791,0},"","", 1,5); --garden
	AddPillar({758,792,0},"","", 1,5); --garden
	--Runewick Harbour/Farm
	AddPillar({748,795,0},"","", 2,5); --Taverne "Quadruped Red Bird"
	AddPillar({755,800,0},"","", 2,5); --Taverne "Quadruped Red Bird"
	AddPillar({744,796,2},"","", 9,5); --Lighttower
	AddPillar({744,798,2},"","",10,5); --Lighttower
	AddPillar({742,796,2},"","", 7,5); --Lighttower
	AddPillar({742,798,2},"","", 8,5); --Lighttower
	--Runewick Hinterland
	AddPillar({920,929,0},"","", 2,5); --Twin Eyes Islands
	AddPillar({860,931,0},"","", 1,5); --Twin Eyes Islands
	AddPillar({833,864,0},"","", 2,5); --Mermaid
	AddPillar({839,845,0},"","", 1,5); --Oldra's Column
	AddPillar({866,847,0},"","", 2,5); --Woodcutter's Hut
	AddPillar({866,848,0},"","", 2,5); --Woodcutter's Hut
	AddPillar({864,813,0},"","", 1,5); --Entrance
	AddPillar({864,821,0},"","", 1,5); --Entrance
    --Runewick - Tower of Air
	AddPillar({898,832,4},"","", 2, 5);
	AddPillar({901,824,4},"","", 2, 5);
	AddPillar({910,827,4},"","", 2, 5);
    AddPillar({909,826,3},"","", 2, 5);
    AddPillar({905,824,2},"","", 2, 5); --elara shrine
    AddPillar({910,828,2},"","", 1, 5); --elara shrine
    AddPillar({910,830,2},"","", 1, 5); --elara shrine
    AddPillar({910,827,1},"","", 2, 5);
    AddPillar({907,824,1},"","", 2, 5);
    --Runewick - Tower of Earth
    AddPillar({954,828,1},"","", 2, 5);
    AddPillar({951,820,1},"","", 2, 5);
	--Runewick - Tower of Fire
	AddPillar({902,759,1},"","", 2, 5);
    AddPillar({900,757,1},"","", 2, 5);
	AddPillar({911,775,2},"","", 2, 5) --hall of elara
    --Runewick - Tower of Water
    AddPillar({750,763,4},"","", 2, 5);
    AddPillar({954,764,3},"","", 2, 5);
    AddPillar({949,758,2},"","", 2, 5);
    AddPillar({953,758,2},"","", 2, 5);
    AddPillar({945,758,1},"","", 2, 5);
    AddPillar({943,758,1},"","", 2, 5);
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
	AddPillar({696,316,0},"","", 2, 5); --The Hemp Necktie Inn
	AddPillar({696,320,0},"","", 2, 5); --The Hemp Necktie Inn
	AddPillar({698,315,1},"","", 2, 5); --The Hemp Necktie Inn
	AddPillar({698,319,1},"","", 2, 5); --The Hemp Necktie Inn
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
    --The Swamp
    AddPillar({488,143,0},"","", 2,5);
    AddPillar({491,143,0},"","", 2,5);
	--Three Fingertips
	AddPillar({724,576,0},"","", 2,5);
	AddPillar({724,580,0},"","", 2,5);
    --Vrondus Farm
	AddPillar({310,572,0},"","", 2,5);
	--
	AddPillar({524,397,0},"","", 3,5);

    
    
    
    
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
    --Death Marsh
    AddChimney({795,347,0},"","", 1, 5);
	--Galmair
	AddChimney({309,227,1},"","", 1,5); --Irmoroms Temple
    AddChimney({301,269,0},"","", 1,5); --Villa 'Goldvein'
    AddChimney({359,233,0},"","", 1, 5); --Don's Council Chamber
    AddChimney({392,326,-6},"","", 2, 5); --The Winged Sow Tavern
	--Galmair Hinterlands
    AddChimney({419,348,0},"","", 2,5); --Miners club
    AddChimney({420,298,0},"","", 2,5); --Sleepy Bujhaar Inn
    AddChimney({427,292,-3},"","", 1,5); --Sleepy Bujhaar Inn
    AddChimney({419,289,1},"","", 1,5); --Sleepy Bujhaar Inn
    AddChimney({410,289,1},"","", 1,5); --Sleepy Bujhaar Inn
    AddChimney({416,296,1},"","", 1,5); --Sleepy Bujhaar Inn
    --Galmair Plateau
    AddChimney({326,366,1},"","", 2, 5);
    AddChimney({311,351,1},"","", 1, 5);
	--Runewick Harbour/Farm
	AddChimney({789,789,0},"","", 1, 5);
    --Runewick - Tower of Air
    AddChimney({894,828,4},"","", 1, 5);
    --Runewick - Tower of Earth
    AddChimney({956,835,0},"","", 2, 5) --Adron's barrel
    --Runewick - Tower of Fire
    AddChimney({902,764,1},"","", 2, 5);
    AddChimney({899,766,4},"","", 1, 5);
 	--Spider's Mouth
    AddChimney({705,311,1},"","", 2, 5); --The Hemp Necktie Inn
    AddChimney({705,323,1},"","", 2, 5); --The Hemp Necktie Inn
    AddChimney({711,320,0},"","", 2, 5); --The Hemp Necktie Inn
    
    
    

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
    --Eastland
    AddMirror({914,625,0},"","", 2,5); --Ronagan Temple
    --Galmair
    AddMirror({306,269,0},"","", 1,5); --Villa 'Goldvein'
    AddMirror({374,227,0},"","", 1,5); --Kiln
    AddMirror({428,219,-6},"","",1,5); --Cameo Pit
    AddMirror({426,236,-6},"","",1,5); --Cameo Pit
    AddMirror({424,212,-5},"","",2,5); --Cameo Pit
    AddMirror({413,227,-6},"","",1,5); --Cameo Pit
    AddMirror({417,230,-5},"","",2,5); --Cameo Pit
	--Galmair Hinterlands
    AddMirror({412,294,1},"","", 2,5); --Sleepy Bujhaar Inn
	AddMirror({421,296,1},"","", 2,5); --Sleepy Bujhaar Inn
	--Runewick - Tower of Air
    AddMirror({905,833,4},"","", 1,5);
	--Runewick - Tower of Earth
    AddMirror({954,828,4},"","", 1,5);
	--Runewick - Tower of Fire
	AddMirror({901,761,2},"","", 2,5) --archmage's room
	AddMirror({900,768,3},"","", 2,5)
	AddMirror({902,769,4},"","", 2,5)
    --Runewick - Tower of Water
    AddMirror({945,752,4},"","", 1,5);
    --Spider's Mouth
	AddMirror({703,319,1},"","", 1,5); --The Hemp Necktie Inn
	AddMirror({708,319,1},"","", 1,5); --The Hemp Necktie Inn
	AddMirror({707,307,1},"","", 1,5); --The Hemp Necktie Inn
	AddMirror({705,309,1},"","", 2,5); --The Hemp Necktie Inn

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
    elseif (Value==12) then
        return 521
    elseif (Value==13) then
        return 520
    elseif (Value==14) then
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
