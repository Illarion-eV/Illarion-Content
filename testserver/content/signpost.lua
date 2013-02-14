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
    
	--Noobia
	--ToDo
	AddWeg({35,23,100},"[Tutorial] Willkommen in Illarion!","[Tutorial] Welcome to Illarion!",2,0);
	AddWeg({41,49,100},"[Tutorial] Die Mine - Sammeln","[Tutorial] The mine - gathering",2,0);
    AddWeg({38,49,100},"[Tutorial] Der Sumpf - Kampf","[Tutorial] The swamp - fighting",6,0);
    AddWeg({40,57,100},"[Tutorial] Die Schmiede - Handwerk","[Tutorial] The forge - crafting",4,0);
    AddWeg({42,98,100},"[Tutorial] Dies ist der Weg nach Cadomyr, dem Reich von Ruhm und Ehre.","[Tutorial] This is the way to Cadomyr, realm of honour and glory.",2,0);	
    AddWeg({35,105,100},"[Tutorial] Dies ist der Weg nach Galmair, dem Reich des aufstrebenden Wohlstands.","[Tutorial] This is the way to Galmair, realm of prosperity and wealth.",4,0);	
    AddWeg({30,102,100},"[Tutorial] Dies ist der Weg nach Runewick, dem Reich der Weisheit und Magie.","[Tutorial] This is the way to Runewick, realm of wisdom and magic.",6,0);	
	
	--SW/Cadomyr map
	AddWeg({87,642,0},"Cadomyr","Cadomyr",0,0);
    AddWeg({137,633,0},"Cadomyr","Cadomyr",0,0);
    AddWeg({123,566,0},"Palast Ihrer Majestät","Palace of Her Majesty",0,0);
    AddWeg({120,566,0},"Palast Ihrer Majestät","Palace of Her Majesty",0,0);
    AddWeg({117,639,0},"Sir Reginalds Gruft","Sir Reginald's Tomb",2,0);

    AddWeg({110,659,0},"Kap des Abschieds, Fabers Wache, Entfernte Wohnstätte, Piratenbucht","Cape Farewell, Faber's Guardhouse, Remote Dwelling, Pirate cove",6,0);
    AddWeg({42,634,0},"Entfernte Wohnstätte, Piratenbucht","Remote Dwelling, Pirate Cove",0,0); 
    AddWeg({47,645,0},"Fabers Wache","Faber's Guardhouse",6,0);
    AddWeg({81,660,0},"Kap des Abschieds","Cape Farewell",4,0);
    AddWeg({68,684,0},"Kap des Abschieds","Cape Farewell",6,0);

    AddWeg({112,659,0},"Grundstein der Aufrichtigkeit, Malachíntempel, Rosaline-Kubus, Cadomyr Hafen, Katanbi Delta","Cornerstone of Candour, Temple of Malachín, Rosaline Cube, Cadomyr Harbour, Katanbi Delta",4,0);
    AddWeg({129,699,0},"Grundstein der Aufrichtigkeit; darüber Malachintempel","Cornerstone of Candour; Temple of Malachin is above",2,0);  --<coal mine>
    AddWeg({145,694,1},"Malachíntempel","Temple of Malachín",0,0);
    AddWeg({115,715,0},"Rosaline-Kubus, Königliche Gruft","Rosaline Cube, Royal Tomb",6,0); -- <Name hier> Pyramide der Königin -- <name here> pyramid of the queen
    AddWeg({119,733,0},"Händlers Unsinn","Merchants' Folly",2,0);
    AddWeg({121,750,0},"Königlicher Hafen, Westliches Ufer des Katanbi Delta","Royal Harbour, Western shore of Katanbi Delta",4,0);

	AddWeg({114,659,0},"Katanbi Desert, Freiheitsbruch, Arena, Gladiatoren, Sklavenmarkt, Kapelle der Fünf, Galmair, Norden, Runewick, Südosten","Katanbi Desert, Liberty Quarry, Arena, Gladiatorium, Slave Market, Chapel of the Five, Galmair, North, Runewick, Southeast",2,0);

    AddWeg({174,639,0},"Freiheitsbruch, Grugmutzs Höhle, Bach Siedlung, Festung Hammerfall","Liberty Quarry, Grugmutz's cave, Creek Settlement, Fortress Hammerfall",0,0); --<copper/gold/iron mine>
    AddWeg({167,622,0},"Freiheitsbruch","Liberty Quarry",0,0); --<copper/gold/iron mine>
    AddWeg({207,561,0},"Grugmutzs Höhle","Grugmutz's cave",6,0); 
    AddWeg({193,430,0},"Festung Hammerfall","Fortress Hammerfall",0,0);
    AddWeg({235,425,0},"Festung Hammerfall","Fortress Hammerfall",6,0);
    AddWeg({241,428,0},"Hammerfall Mine","Mine of Hammerfall",2,0);

    AddWeg({174,641,0},"Katanbi Desert, Freiheitsbruch, Arena, Gladiatoren, Sklavenmarkt, Kapelle der Fünf, Galmair, Norden, Runewick, Südosten","Katanbi Desert, Liberty Quarry, Arena, Gladiatorium, Slave Market, Chapel of the Five, Galmair, North, Runewick, Southeast",2,0);
    AddWeg({219,646,0},"Cadomyr","Cadomyr",6,0);



    AddWeg({245,685,0},"Die Blutkreisarena","The Blood Circle Arena",0,0); -- <Name hier> Arena -- <name here> arena
    AddWeg({235,686,0},"Für Ehre kämpfen wir, in Blut sterben wir! Die Königliche Akademie der Gladiatoren","For honour we fight, in blood we die! The Royal Academy of Gladiators",4,0); -- <Name hier> Gladiatorschule -- <name here> gladiatorschool
    AddWeg({244,556,0},"Perle der Sirani","Pearl of Sirani",0,0); -- <Name hier> Oase -- <name here> oasis
    AddWeg({372,552,0},"Achtung! Verfluchter Ort","Attention! Cursed Place",2,0); -- <Name hier> Zerstörtes Gebäude -- <name here> destroyed building
    AddWeg({389,590,0},"Khesra","Khesra",2,0); -- <Name hier> Nekromantenhöhle -- <name here> necromancer cave
    AddWeg({399,619,0},"Schattenland! Gefahr!","Shadowland! Danger!",2,0); -- <Name hier> Moria/Vampirschloss -- <name here> moria/ vampirecastle
    AddWeg({427,676,0},"Schattenland! Gefahr!","Shadowland! Danger!",0,0); -- <Name hier> Moria/Vampirschloss -- <name here> moria/ vampirecastle
	AddWeg({439,638,0},"Cadomyr","Cadomyr",0,0);
	AddWeg({433,637,0},"Galmair","Galmair",6,0);
    AddWeg({400,739,0},"Moshrans Brut - Bleibt fern!","Moshran's Brood - Stay away!",0,0); -- <Name hier> Oase/Ruine -- <name here> oasis/ruin
    AddWeg({389,771,0},"Moshrans Brut - Bleibt fern!","Moshran's Brood - Stay away!",0,0); -- <Name hier> Oase/Ruine -- <name here> oasis/ruin
    AddWeg({203,724,0},"Siranitempel, Berg Letma","Mount Letma, Tear of Sirani",4,0); -- <Name hier> Küstengebirge/Gebirgskette -- <name here> mountain range
    AddWeg({208,774,0},"Berg Letma","Mount Letma",2,0); -- <Name hier> Küstengebirge/Gebirgskette -- <name here> mountain range
    AddWeg({112,817,0},"Verlorener Hafen","Lost Harbour",4,0); -- <Name hier> Ruinen -- <name here> ruins
    AddWeg({294,700,0},"Wüstenloch","Desert Hole",2,0); -- <Name hier> ehemaliges Bergwerk -- <name here> former pit
    AddWeg({294,680,0},"Wüstenloch","Desert Hole",6,0); -- <Name hier> ehemaliges Bergwerk -- <name here> former pit
    AddWeg({347,692,0},"Sternenoase","Oasis of Stars",2,0); -- <Name hier> Sandcamp -- <name here> sandcamp
    AddWeg({253,690,0},"Königlicher Sklavenmarkt; Wüstenloch; Sternenoase","Royal Slave Market; Desert Hole; Oasis of Stars",2,0); -- <Name hier> Sandcamp -- <name here> sandcamp
    AddWeg({200,757,0},"Träne der Sirani","Tear of Sirani",6,0);
	AddWeg({166,758,0},"Siranitempel","Temple of Sirani",2,0);


    AddWeg({461,796,0},"Katanbi Wüste, Westliche Katanbi Wüste, Cadomyr","Katanbi Desert, Western Katanbi Desert, Cadomyr",6,0);
    AddWeg({463,796,0},"Wachwald, Leuchttrum, Feuerlimes, Wichtkanal, Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Sentry Forest, Lighthouse, Firelimes, Wight Canal, Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Three Fingertips, Runewick, Southeast",2,0);


    AddWeg({481,794,0},"Wachstützpunkt; Leuchtturm; Galmair; Runewick","Sentry Outpost; Lighthouse; Galmair; Runewick",2,0);
    AddWeg({290,673,0},"Königlicher Sklavenmarkt","Royal Slave Market",0,0);
    AddWeg({226,646,0},"Perle der Sirani","Pearl of Sirani",0,0); -- <Name hier> Oase -- <name here> oasis
    AddWeg({109,771,0},"Cadomyr Hafen","Cadomyr Harbour",4,0);






    --NW/Galmair-map
    AddWeg({414,247,0},"Eselstall","Donkey stable",0,0);
    AddWeg({398,249,0},"Dunkle Gasse","Dark Alley",0,0);
    AddWeg({392,249,0},"Wachstube","Guardroom",0,0);
    AddWeg({389,248,0},"Schuldeneintreiber","Debt-collector",0,0);
    AddWeg({369,259,0},"Galmairs Krone (Guilianni-Residenz, Konzil Kammer, Goldträume, Schatzkammer und  Bibliothek)","Galmair's Crest (Guilianni-Residence, Council Chamber, Golden Dreams, Treasury, Library",0,0);
    AddWeg({343,259,0},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",0,0);
    AddWeg({351,268,0},"Markt","Market",2,0);
    AddWeg({372,279,0},"Markt","Market",6,0);
    AddWeg({330,264,0},"Schlackengrube","Scoria Mine",0,0);
    AddWeg({311,262,0},"Tempel des Irmorom","Temple of Irmorom",0,0);
    AddWeg({303,282,0},"Villa 'Goldader'","Villa 'Goldvein'",0,0);
    AddWeg({296,282,0},"Quelle der Träume","Well of Dreams",6,0);
    AddWeg({376,274,0},"Werkstatt","Workshop",2,0);
    AddWeg({398,292,0},"Werkstatt","Workshop",6,0);
    AddWeg({397,253,0},"Galmairs Krone, Guilianni-Residenz, Markt, Werkstatt, Schlackengrube, Tempel des Irmorom, Villa 'Goldader', Quelle der Träume","Galmair's Crest, Guilianni-Residence, Market, Workshop, Scoria Mine, Temple of Irmorom, Villa 'Goldvein', Well of Dreams",6,0);
    AddWeg({398,254,0},"Zensusbüro, Gasthof zum schläfrigen Bujhaar, Werkstatt, Tollloch, Schürfers Club, Malachitmine, Galmair Hochebene, Cadomyr, Katanbi Wüste, Schattenland","Census office, Sleepy Bujhaar Inn, Workshop, Sporthole, Miners Club, Malachite Mine, Galmair Plateau, Cadomyr, Katanbi Desert, Shadowland",4,0);
    AddWeg({394,273,0},"Zensusbüro","Census office",2,0);
    AddWeg({401,293,0},"Gasthof zum schläfrigen Bujhaar","Sleepy Bujhaar Inn",2,0);
    AddWeg({398,305,0},"Tollloch","Sporthole",2,0);
    AddWeg({387,346,0},"Galmair","Galmair",0,0);
    AddWeg({387,347,0},"Schürfers Club, Schürfers Quelle, Malachitmine, Cadomyr, Katanbi Wüste, Schattenland","Miners' Club, Miner's Spring, Malachite Mine, Cadomyr, Katanbi Desert, Shadowland",2,0);
    AddWeg({386,346,0},"Galmair Hochebene mit Fort Schnellbeil und Goldener Rumil","Galmair Plateau with Fort Schnellbeil and Golden Rumil",6,0);
    AddWeg({417,357,0},"Schürfers Club","Miners' Club",0,0);
    AddWeg({418,357,0},"Malachitmine, Cadomyr, Katanbi Wüste, Schattenland","Malachite Mine, Cadomyr, Katanbi Desert, Shadowland",2,0);
    AddWeg({418,371,0},"Cadomyr, Katanbi Wüste, Schattenland - Gefahr!","Cadomyr, Katanbi Desert, Shadowland - Danger!",4,0);
    AddWeg({417,385,0},"Galmair","Galmair",0,0);

    AddWeg({337,248,-6},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",4,0);-- Scoria Mine
    AddWeg({338,238,-6},"Schweinebaue","Hog Dens",2,0);-- Scoria Mine
    AddWeg({338,243,-6},"Gemmenschacht","Cameo Pit",2,0);-- Scoria Mine
    AddWeg({339,248,-6},"Ronagans Tempel - Achtung, überflutet!","Temple of Ronagan - Attention, flooded!",2,0);-- Scoria Mine
    AddWeg({333,248,-6},"Abwasserschächte","Sewers",4,0);-- Scoria Mine
    AddWeg({331,248,-6},"Schimmersenke mit dem Spielraum und dem Tempel des Nargun.","Flicker Swale with Game Room and the Temple of Nargun",6,0);-- Scoria Mine

    AddWeg({423,248,0},"Galmair","Galmair",6,0);
    AddWeg({427,248,0},"Narguns Ebene, Hafen, Dunkellochmine, Spinnen Maul, Gasthof zur Hanfschlinge, Cadomyr, Runewick","Nargun's Plain, Harbour, Dark Hole Mine, Spider's Mouth, Hemp Necktie Inn, Cadomyr, Runewick",2,0);
    AddWeg({427,252,0},"Ackerland + Stinkende Fischer beim Malachit Bach","Farmland + Stinky Fisherman at the Malachite Creek",4,0);
    AddWeg({441,253,0},"Waldeck","Woodcorner",0,0);
    AddWeg({464,253,0},"Die Plattform","The Platform",0,0);
    AddWeg({473,248,0},"Narguns Ebene, Hafen, Dunkellochmine, Spinnen Maul, Gasthof zur Hanfschlinge, Cadomyr, Runewick","Nargun's Plain, Harbour, Dark Hole Mine, Spider's Mouth, Hemp Necktie Inn, Cadomyr, Runewick",2,0);
    AddWeg({485,248,0},"Galmair","Galmair",6,0);
    AddWeg({501,218,0},"Galmair","Galmair",4,0);
    AddWeg({500,210,0},"Hafen, Dunkellochmine, Nördliche Inseln, Der Sumpf, Tempel der Fünf, Ebene der Stille, Nördliche Wälder, Unüberwindbarer Limes, Schulterplatte Insel","Harbour, Dark Hole Mine, Northern Islands, The Swamp, Temple of the Five, Plains of Silence, Northern Woods, Insurmountable Limes, Pauldron Isle",0,0);
    AddWeg({499,189,0},"Tempel der Fünf, Ebene der Stille, Nördliche Wälder, Unüberwindbarer Limes, Schulterplatte Insel","Temple of the Five, Plains of Silence, Northern Woods, The Insurmountable Limes, Pauldron Isle",2,0);
    AddWeg({496,191,0},"Hafen, Dunkellochmine, Nördliche Inseln","Harbour, Dark Hole Mine, Northern Islands",6,0);
    AddWeg({446,138,0},"Hafen, Nördliche Inseln","Harbour, Northern Islands",0,0);
    AddWeg({452,109,0},"Nördliche Inseln","Northern Islands",0,0);
    AddWeg({440,139,0},"Dunkellochmine","Dark Hole Mine",6,0);
    AddWeg({409,148,0},"Dunkellochmine","Dark Hole Mine",6,0);
    AddWeg({503,213,0},"Spinnen Maul, Gasthof zur Hanfschlinge, Cadomyr, Runewick","Spider's Mouth, Hemp Necktie Inn, Cadomyr, Runewick",2,0);


    --SE/Runewick-map
    AddWeg({528,739,0},"Kapelle der Fünf, Katanbi Wüste, Westliche Katanbi Wüste, Cadomyr","Chapel of the Five, Katanbi Desert, Western Katanbi Desert, Cadomyr",4,0);
	AddWeg({528,737,0},"Leuchttrum, Feuerlimes, Wichtkanal, Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Lighthouse, Firelimes, Wight Canal, Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Runewick, Southeast",0,0);
	AddWeg({528,738,0},"Wachwald mit Ushara Schrein, Wachaußenposten, Oldras Ecke und Gnuremgrund","Sentry Forest with Ushara's Spire, Sentry Outpost, Oldra's Corner and Gnuremground",2,0);
    AddWeg({525,782,0},"Kapelle der Fünf, Katanbi Wüste, Westliche Katanbi Wüste, Cadomyr","Chapel of the Five, Katanbi Desert, Western Katanbi Desert, Cadomyr",6,0);
	AddWeg({528,781,0},"Leuchttrum, Feuerlimes, Wichtkanal, Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Lighthouse, Firelimes, Wight Canal, Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Runewick, Southeast",0,0);
	AddWeg({528,782,0},"Wachwald mit Ushara Schrein, Wachaußenposten, Oldras Ecke und Gnuremgrund","Sentry Forest with Ushara's Spire, Sentry Outpost, Oldra's Corner and Gnuremground",2,0);
	AddWeg({644,715,0},"Wachstützpunkt","Sentry Outpost",0,0);

    AddWeg({539,530,0},"Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Runewick, Southeast",2,0);
    AddWeg({546,521,0},"Wichtkanal, Feuerlimes, Leuchttrum, Wachwald, Katanbi Wüste, Cadomyr","Wight Canal, Firelimes, Lighthouse, Sentry Forest, Katanbi Desert, Cadomyr",4,0);
    AddWeg({547,517,0},"Todes Schneise, Elfenruinen","Death Swath, Elven Ruins",0,0);
    AddWeg({537,525,0},"Glühende Wälder, Glühendes Tor","Glowing Forest, Glowing Gate",6,0);
    AddWeg({517,583,0},"Wichtkanal, Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Wight Canal, Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Runewick, Southeast",2,0);
    AddWeg({517,584,0},"Leuchttrum, Wachwald, Katanbi Wüste, Cadomyr","Lighthouse, Sentry Forest, Katanbi Desert, Cadomyr",4,0);
    AddWeg({538,691,0},"Leuchttrum, Feuerlimes, Wichtkanal, Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Lighthouse, Firelimes, Wight Canal, Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Runewick, Southeast",2,0);
    AddWeg({537,687,0},"Wachwald, Katanbi Wüste, Cadomyr","Sentry Forest, Katanbi Desert, Cadomyr",4,0);
    AddWeg({520,715,0},"Leuchttrum, Feuerlimes, Wichtkanal, Schlangenkopfberg, Elstree Ebene, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Runewick, Südosten","Lighthouse, Firelimes, Wight Canal, Mount Snakehead, Elstree PLain, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Runewick, Southeast",2,0);
    AddWeg({519,708,0},"Wachwald, Katanbi Wüste, Cadomyr","Sentry Forest, Katanbi Desert, Cadomyr",4,0);



    AddWeg({887,655,0},"Wunderland, Paddock Hof, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Wonderland, Paddock Farm, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({887,639,0},"Frische Sümpfe, Nördlicher Außenposten, Eibental, Runewick","Dewy Swamps, Northern Outpost, Yewdale, Runewick",4,0);
    AddWeg({885,686,0},"Schattentor","Shadow Gate",2,0);
    AddWeg({884,686,0},"Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({884,677,0},"Nördlicher Außenposten, Eibental, Runewick","Northern Outpost, Yewdale, Runewick",4,0);
    AddWeg({867,710,0},"Nördlicher Außenposten, Eibental, Runewick","Northern Outpost, Yewdale, Runewick",4,0);
    AddWeg({868,711,0},"Oldras Turm","Oldra's Tower",2,0);
    AddWeg({867,718,0},"Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);

    AddWeg({753,586,0},"Drachenhöhle, Ameisenhügelbach, Eibental, Runewick, Wunderland, Ostland","Dragon's Lair, Anthill Brook, Yewdale, Runewick, Wonderland, Eastland",2,0);
    AddWeg({752,586,0},"Dreifingerspitzen","Three Fingertips",4,0);
    AddWeg({751,586,0},"Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",6,0);
    AddWeg({745,600,0},"Drachenhöhle, Ameisenhügelbach, Eibental, Runewick, Wunderland, Ostland","Dragon's Lair, Anthill Brook, Yewdale, Runewick, Wonderland, Eastland",2,0);
    AddWeg({741,599,0},"Dreifingerspitzen, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Three Fingertips, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",6,0);
    AddWeg({728,587,0},"Drachenhöhle, Ameisenhügelbach, Eibental, Runewick, Wunderland, Ostland","Dragon's Lair, Anthill Brook, Yewdale, Runewick, Wonderland, Eastland",4,0);
    AddWeg({728,586,0},"Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({725,559,0},"Drachenhöhle, Ameisenhügelbach, Eibental, Runewick, Wunderland, Ostland","Dragon's Lair, Anthill Brook, Yewdale, Runewick, Wonderland, Eastland",4,0);
    AddWeg({725,558,0},"Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({725,530,0},"Dreifingerspitzen, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick, Wunderland, Ostland","Three Fingertips, Dragon's Lair, Anthill Brook, Yewdale, Runewick, Wonderland, Eastland",4,0);
    AddWeg({726,530,0},"Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",2,0);
    AddWeg({742,530,0},"Dreifingerspitzen","Three Fingertips",6,0);
    AddWeg({742,531,0},"Todes Gestank, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick, Wunderland, Ostland","Death's Strench, Dragon's Lair, Anthill Brook, Yewdale, Runewick, Wonderland, Eastland",4,0);
    AddWeg({742,526,0},"Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);

    AddWeg({757,670,0},"Drachenbau!","Dragon Lair!",0,0);
    AddWeg({760,632,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",2,0);
    AddWeg({789,680,0},"Drachenhöhle - Sehr schlechte Wahl!","Dragon's Lair - Very bad choice!",6,0);
    AddWeg({790,680,0},"Eibental, Runewick - Viel Glück!","Eibental, Runewick - Good luck!",4,0);
    AddWeg({791,680,0},"Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden - Schlechte Wahl!","Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North - Bad choice!",2,0);
    AddWeg({793,690,0},"Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",6,0);
    AddWeg({795,693,0},"Eibental, Runewick","Yewdale, Runewick",4,0);
    AddWeg({794,716,0},"Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({794,717,0},"Eibental, Runewick","Yewdale, Runewick",6,0);
    AddWeg({762,732,0},"Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",2,0);
    AddWeg({761,733,0},"Eibental, Runewick","Yewdale, Runewick",4,0);
    AddWeg({759,735,0},"Bärenhöhle","Bear Cave",0,0);
    AddWeg({754,753,0},"Bärenhöhle, Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Bear Cave, Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({754,749,0},"Eibental, Runewick","Yewdale, Runewick",4,0);
    AddWeg({755,781,0},"Bärenhöhle, Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Bear Cave, Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({755,782,0},"Eibental, Runewick","Yewdale, Runewick",4,0);
    AddWeg({847,728,0},"Fröhliche Lichtung","Merryglade",0,0);
    AddWeg({847,730,0},"Nördlicher Außenposten, Eibental, Runewick","Northern Outpost, Yewdale, Runewick",6,0);
    AddWeg({842,730,0},"Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",2,0);
    AddWeg({840,734,0},"Feiglings letztes Gefecht","Coward's last stand",4,0);
    AddWeg({818,736,0},"Eibental, Runewick","Yewdale, Runewick",4,0);
    AddWeg({818,751,0},"Feiglings letztes Gefecht, Fröhliche Lichtung, Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Coward's last stand, Merryglade, Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({796,771,0},"Eibental, Runewick","Yewdale, Runewick",4,0);
    AddWeg({790,774,0},"Nördlicher Außenposten, Feiglings letztes Gefecht, Fröhliche Lichtung, Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Northern Outpost, Coward's last stand, Merryglade, Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",2,0);
    AddWeg({789,774,0},"Anthilbach","Anthil Brook",6,0);
    AddWeg({783,797,0},"Anthilbach, Nördlicher Außenposten, Feiglings letztes Gefecht, Fröhliche Lichtung, Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Anthil Brook, Northern Outpost, Coward's last stand, Merryglade, Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({783,798,0},"Vierbeiniger Roter Vogel, Hafen, Runewick","Quadruped Red Bird, Harbour, Runewick",6,0);
    AddWeg({761,808,0},"Vierbeiniger Roter Vogel, Hafen","Quadruped Red Bird, Harbour",6,0);
    AddWeg({762,801,0},"Bauernhöfe, Anthilbach, Nördlicher Außenposten, Feiglings letztes Gefecht, Fröhliche Lichtung, Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Farmland, Anthil Brook, Northern Outpost, Coward's last stand, Merryglade, Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",2,0);
    AddWeg({739,803,0},"Hafen","Harbour",6,0);
    AddWeg({739,806,0},"Hafen","Harbour",6,0);
    AddWeg({739,807,0},"Hafen","Harbour",6,0);
    AddWeg({739,810,0},"Hafen","Harbour",6,0);
    AddWeg({739,811,0},"Hafen","Harbour",6,0);
    AddWeg({739,814,0},"Hafen","Harbour",6,0);
    AddWeg({761,800,0},"Bärenhöhle, Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Bear Cave, Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({758,813,0},"Runewick","Runewick",2,0);
    AddWeg({787,819,0},"Vierbeiniger Roter Vogel, Hafen, Bauernhöfe, Anthilbach, Nördlicher Außenposten, Feiglings letztes Gefecht, Fröhliche Lichtung, Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Bärenhöhle, Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr","Quadruped Red Bird, Harbour, Farmland, Anthil Brook, Northern Outpost, Coward's last stand, Merryglade, Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Bear Cave, Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr",6,0);
    AddWeg({791,819,0},"Runewick, Erzmagier Elvaine Morgan","Runewick, Archmage Elvaine Morgan",2,0);

    AddWeg({855,815,0},"Runewick, Erzmagier Elvaine Morgan","Runewick, Archmage Elvaine Morgan",2,0);
    AddWeg({853,821,0},"Hölzfällersiedlung, Zwillingsaugeninseln","Woodcutter's Hut, Twin Eyes Islands",4,0);
    AddWeg({855,813,0},"Heilige Eiche, Triumphfeuer","Holy Oak, Fire of Triumph",0,0);
    AddWeg({851,816,0},"Eibental, Anthilbach, Nördlicher Außenposten, Feiglings letztes Gefecht, Fröhliche Lichtung, Oldras Turm, Schattentor, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Bärenhöhle, Drachenhöhle, Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr","Yewdale, Anthil Brook, Northern Outpost, Coward's last stand, Merryglade, Oldra's Tower, Shadow Gate, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Bear Cave, Dragon's Lair, Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr",6,0);
    AddWeg({873,902,0},"Zwillingsaugeninseln","Twin Eyes Islands",4,0);
    
    --NE/Neutral-map
    AddWeg({680,311,0},"Narguns Ebene, Galmair, Tempel der Fünf, Ebene der Stille, Nördliche Wälder, Unüberwindbarer Limes, Schulterplatte Insel","Nargun's Plain, Galmair, Temple of the Five, Plains of Silence, Northern Woods, The Insurmountable Limes, Pauldron Isle",6,0);
    AddWeg({685,317,0},"Gasthof zur Hanfschlinge","The Hemp Necktie Inn",2,0);
    AddWeg({676,326,0},"Funkelhöhle, Cherass Zitadelle, Schlangenkopfküste, Wichtkanal, Wachwald, Katanbi Wüste, Cadomyr","Glittering Cave, Cherass' Citadel, Snakehead Coast, Wichtkanal, Sentry Forest, Katanbi Desert, Cadomyr",6,0);
    AddWeg({682,330,0},"Der Todes Sumpf, Igruks Höhle, Elstree Ebene, Elstree Wald, Ostland, Wunderland, Todes Gestank, Frische Sümpfe, Drachenhöhle, Runewick","The Death Marsh, Igruk's Cave, Elstree Plain, Elstree Forest, Eastland, Wonderland, Death's Stench, Dewy Swamps, Dragon's Lair, Runewick",4,0);
    AddWeg({723,385,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Westen","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, West",6,0);
    AddWeg({731,391,0},"Elstree Wald, Ostland, Wunderland, Frische Sümpfe, Runewick","Elstree Forest, Eastland, Wonderland, Dewy Swamps, Runewick",2,0);
    AddWeg({730,391,0},"Elstree Ebene, Igruks Höhle, Todes Gestank, Drachenhöhle, Runewick","Elstree Plain, Igruk's Cave, Death's Stench, Dragon's Lair, Runewick",4,0);
    AddWeg({840,383,0},"Ostland, Osthafen, Wunderland, Frische Sümpfe, Runewick","Eastland, Eastport, Wonderland, Dewy Swamps, Runewick",4,0);
    AddWeg({839,383,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Westen","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, West",6,0);
    AddWeg({881,550,0},"Paddock Hof","Paddock Farm",2,0);
    AddWeg({881,551,0},"Wunderland, Frische Sümpfe, Runewick","Wonderland, Dewy Swamps, Runewick",4,0);
    AddWeg({881,549,0},"Osthafen, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Westen","Eastport, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, West",0,0);

    AddWeg({866,588,0},"Paddock Hof, Osthafen, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Westen","Paddock Farm, Eastport, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, West",0,0);
    AddWeg({867,589,0},"Frische Sümpfe, Nördlicher Außenposten, Eibental, Runewick","Dewy Swamps, Northern Outpost, Yewdale, Runewick",4,0);
    AddWeg({867,588,0},"Wunderland","Wonderland",2,0);
    AddWeg({866,589,0},"Todes Gestank, Westen, Drachenhöhle, Bärenhöhle, Ameisenhügelbach, Eibental, Runewick","Death's Stench, West, Dragon's Lair, Bear Cave, Anthill Brook, Yewdale, Runewick",6,0);

    AddWeg({859,611,0},"Wunderland, Paddock Hof, Osthafen, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Westen","Wonderland, Paddock Farm, Eastport, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, West",0,0);
    AddWeg({859,612,0},"Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);

    AddWeg({791,679,0},"Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Westen, Cadomyr","Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, West, Cadomyr",0,0);
    AddWeg({791,680,0},"Dreifingerspitzen, Todes Gestank, Elstree Ebene, Elstree Wald, Schlangenkopfbucht, Westen, Cadomyr, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Three Fingertips, Death's Strench, Elstree PLain, Elstree Forest, Snakehead Coast, West, Cadomyr, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",6,0);
    AddWeg({791,681,0},"Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);

    AddWeg({714,488,0},"Igruks Höhle, Schlangenkopfküste, Wichtkanal, Wachwald, Katanbi Wüste, Cadomyr","Igruk's Cave, Snakehead Coast, Wight Canal, Sentry Forest, Katanbi Desert, Cadomyr",6,0);
    AddWeg({718,488,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({717,455,0},"Igruks Höhle, Schlangenkopfküste, Wichtkanal, Wachwald, Katanbi Wüste, Cadomyr","Igruk's Cave, Snakehead Coast, Wichtkanal, Sentry Forest, Katanbi Desert, Cadomyr",6,0);
    AddWeg({729,459,0},"Dreifingerspitzen, Todes Gestank, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Three Fingertips, Death's Strench, Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);
    AddWeg({729,448,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({732,456,0},"Elstree Wald, Wunderland, Ostland","Elstree Forest, Wonderland, Eastland",2,0);
    AddWeg({565,394,0},"Funkelhöhle","Glittering Cave",0,0);
    AddWeg({871,321,0},"Schulterplatte Insel mit Tanora Ruinen, Epphurds Häuser, Friedhof, Spießstollen und ehemalige Schulterplattesiedlung","Pauldron Isle with Tanora Ruins, Epphurd's Houses, Graveyard, Skewer Drift and former Pauldron Settlement",4,0);

    AddWeg({735,503,0},"Elstree Wald, Wunderland, Ostland","Elstree Forest, Wonderland, Eastland",2,0);
    AddWeg({735,504,0},"Dreifingerspitzen, Todes Gestank, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Three Fingertips, Death's Strench, Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);
    AddWeg({734,503,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({734,504,0},"Schlangenkopfbucht, Westen, Cadomyr","Snakehead Coast, West, Cadomyr",6,0);

    AddWeg({753,482,0},"Dreifingerspitzen, Todes Gestank, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Three Fingertips, Death's Strench, Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);
    AddWeg({753,479,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
	
    AddWeg({721,502,0},"Elstree Wald, Wunderland, Ostland","Elstree Forest, Wonderland, Eastland",2,0);
    AddWeg({721,503,0},"Dreifingerspitzen, Todes Gestank, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Three Fingertips, Death's Strench, Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);
    AddWeg({721,497,0},"Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({721,498,0},"Schlangenkopfküste, Igruks Höhle, Wichtkanal, Wachwald, Katanbi Wüste, Cadomyr","Snakehead Coast, Igruk's Cave, Wight Canal, Sentry Forest, Katanbi Desert, Cadomyr",6,0);

    AddWeg({678,457,0},"Elstree Ebene, Elstree Wald, Wunderland, Ostland, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Elstree PLain, Elstree Forest, Wonderland, Eastland, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",2,0);
    AddWeg({678,458,0},"Dreifingerspitzen, Todes Gestank, Drachenhöhle, Ameisenhügelbach, Eibental, Runewick","Three Fingertips, Death's Strench, Dragon's Lair, Anthill Brook, Yewdale, Runewick",4,0);
    AddWeg({620,462,0},"Igruks Höhle, Elstree Ebene, Elstree Wald, Der Todes Sumpf, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden, Dreifingerspitzen, Runewick, Südosten","Igruk's Cave, Elstree PLain, Elstree Forest, The Death Marsh, Spider's Mouth, The Hemp Necktie Inn, Galmair, North, Three Fingertips, Runewick, Southeast",2,0);
    AddWeg({630,462,0},"Funkelhöhle, Elfenruinen, Todes Schneise, Glühende Wälder, Wichtkanal, Wachwald, Katanbi Wüste, Cadomyr","Glittering Cave, Elven Ruins, Death Swath, Glowing Forest, Wight Canal, Sentry Forest, Katanbi Desert, Cadomyr",6,0);
    AddWeg({623,455,0},"Funkelhöhle, Elfenruinen, Cherass Zitadelle","Glittering Cave, Elven Ruins, Cherass' Citadel",0,0);
    AddWeg({610,385,0},"Cherass Zitadelle, Spinnen Mund, Gasthof zur Hanfschlinge, Galmair, Norden","Cherass' Citadel, Spider's Mouth, The Hemp Necktie Inn, Galmair, North",0,0);
    AddWeg({610,386,0},"Elfenruinen, Schlangenkopfberg, Todes Schneise, Glühende Wälder, Wichtkanal, Wachwald, Katanbi Wüste, Cadomyr","Elven Ruins, Mount Snakehead, Death Swath, Glowing Forest, Wight Canal, Sentry Forest, Katanbi Desert, Cadomyr",6,0);
    AddWeg({610,387,0},"Funkelhöhle, ","Glittering Cave, ",4,0);

end

function AddWeg(Posi,dText,eText,Dir,Percept)
    local tablePos = tostring(Posi[1]).." "..tostring(Posi[2]).." "..tostring(Posi[3]);
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Dir));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,nil);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,nil);
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
    end
end

InitWegweiser();
