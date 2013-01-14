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
    AddWeg({42,634,0},"Piratenbucht","Pirate Cove",0,0); -- <Name hier> Piratenbucht -- <name here> pirate cove
    AddWeg({50,640,0},"Fabers Wache","Faber's Guardhouse",6,0); -- <Name hier> Zerstörter Außenposten -- <name here> ruin of a outpost
    AddWeg({110,659,0},"Kap des Abschieds; Fabers Wache","Cape Farewell; Faber's Guardhouse",6,0);
	AddWeg({112,659,0},"Grundstein der Aufrichtigkeit; Malachíntempel; Rosaline-Kubus; Hafen","Cornerstone of Candour; Temple of Malachín; Rosaline Cube; Harbour",4,0);
	AddWeg({114,659,0},"Katanbi Desert; Freiheitsbruch; Arena; Gladiatoren; Sklavenmarkt; Galmair; Runewick","Katanbi Desert; Liberty Quarry; Arena; Gladiatorium; Slave Market; Galmair; Runewick",2,0);
	AddWeg({87,642,0},"Cadomyr","Cadomyr",0,0);
    AddWeg({137,633,0},"Cadomyr","Cadomyr",0,0);
    AddWeg({126,611,0},"Marktplatz","Marketplace",0,0);
    AddWeg({130,583,0},"Werkstatt","Workshop",0,0);
    AddWeg({116,589,0},"Taverne 'Einhörniger Löwe'","Tavern 'Unicorn Lion'",0,0);
    AddWeg({91,586,0},"Gasthaus 'Seeufer'","Inn 'Lakeshore'",0,0);
    AddWeg({123,568,0},"Palast Ihrer Majestät","Palace of Her Majesty",0,0);
    AddWeg({120,568,0},"Palast Ihrer Majestät","Palace of Her Majesty",0,0);
    AddWeg({129,563,0},"Zhambratempel","Temple of Zhambra",2,0);
    AddWeg({129,699,0},"Grundstein der Aufrichtigkeit; darüber Malachintempel","Cornerstone of Candour; Temple of Malachin is above",2,0);  --<coal mine>
    AddWeg({176,612,0},"Freiheitsbruch","Liberty Quarry",6,0); --<copper/gold/iron mine>
    AddWeg({174,635,0},"Freiheitsbruch","Liberty Quarry",0,0); --<copper/gold/iron mine>
	AddWeg({209,552,0},"Grugmutzs Höhle","Grugmutz's cave",6,0); -- <Name hier> Ogerversteck -- <name here> ogre hideout
    AddWeg({145,694,1},"Malachíntempel","Temple of Malachín",0,0);
    AddWeg({90,690,0},"Rosaline-Kubus","Rosaline Cube",4,0); -- <Name hier> Pyramide der Königin -- <name here> pyramid of the queen
    AddWeg({76,689,0},"Kap des Abschieds","Cape Farewell",6,0);
    AddWeg({109,771,0},"Königlicher Hafen","Royal Harbour",4,0);
    AddWeg({219,646,0},"Katanbi Brücke; dahinter Cadomyr","Katanbi Bridge; behind Cadomyr",6,0);
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
    AddWeg({468,794,0},"Katanbiwüste; dahinter Cadomyr","Katanbi Desert; behind Cadomyr",6,0);
    AddWeg({481,794,0},"Wachstützpunkt; Leuchtturm; Galmair; Runewick","Sentry Outpost; Lighthouse; Galmair; Runewick",2,0);
    AddWeg({290,673,0},"Königlicher Sklavenmarkt","Royal Slave Market",0,0);
    AddWeg({226,646,0},"Perle der Sirani","Pearl of Sirani",0,0); -- <Name hier> Oase -- <name here> oasis
    AddWeg({109,771,0},"Cadomyr Hafen","Cadomyr Harbour",4,0);
    AddWeg({117,642,0},"Sir Reginalds Gruft","Sir Reginald's Tomb",2,0);
    AddWeg({134,631,0},"Sir Reginalds Gruft","Sir Reginald's Tomb",6,0);
    AddWeg({193,430,0},"Festung Hammerfall","Fortress Hammerfall",0,0);-- <Name hier> Zwergenfort -- <name here> dwarfen fortress

    --NW/Galmair-map
    AddWeg({414,247,0},"Eselstall","Donkey stable",0,0);
    AddWeg({398,249,0},"Dunkle Gasse","Dark Alley",0,0);
    AddWeg({392,249,0},"Wachstube","Guardroom",0,0);
    AddWeg({398,248,0},"Schuldeneintreiber","Debt-collector",0,0);
    AddWeg({369,259,0},"Galmairs Krone (Guilianni-Residenz, Konzil Kammer, Goldträume, Schatzkammer und  Bibliothek)","Galmair's Crest (Guilianni-Residence, Council Chamber, Golden Dreams, Treasury, Library",0,0);
    AddWeg({343,259,0},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",0,0);
    AddWeg({398,248,0},"Markt","Market",2,0);
    AddWeg({372,279,0},"Markt","Market",6,0);
    AddWeg({330,264,0},"Schlackengrube","Scoria Mine",0,0);
    AddWeg({311,262,0},"Tempel des Irmorom","Temple of Irmorom",0,0);
    AddWeg({323,282,0},"Villa 'Goldader'","Villa 'Goldvein'",0,0);
    AddWeg({296,282,0},"Quelle der Träume","Well of Dreams",6,0);
    AddWeg({376,274,0},"Werkstatt","Workshop",2,0);
    AddWeg({398,292,0},"Werkstatt","Workshop",6,0);
    AddWeg({397,253,0},"Galmairs Krone, Guilianni-Residenz, Markt, Werkstatt, Schlackengrube, Tempel des Irmorom, Villa 'Goldader', Quelle der Träume","Galmair's Crest, Guilianni-Residence, Market, Workshop, Scoria Mine, Temple of Irmorom, Villa 'Goldvein', Well of Dreams",6,0);
    AddWeg({398,254,0},"Zensusbüro, Gasthof zum schläfrigen Bujhaar, Werkstatt, Tollloch, Schürfer Club, Malachitmine, Galmair Hochebene, Cadomyr, Katanbi Wüste, Schattenland","Census office, Sleepy Bujhaar Inn, Workshop, Sporthole, Miners Club, Malachite Mine, Galmair Plateau, Cadomyr, Katanbi Desert, Shadowland",4,0);
    AddWeg({394,273,0},"Zensusbüro","Census office",2,0);
    AddWeg({401,293,0},"Gasthof zum schläfrigen Bujhaar","Sleepy Bujhaar Inn",2,0);
    AddWeg({398,305,0},"Tollloch","Sporthole",2,0);
    AddWeg({387,346,0},"Galmair","Galmair",0,0);
    AddWeg({387,347,0},"Schürferclub, Schürfer Quelle, Malachitmine, Cadomyr, Katanbi Wüste, Schattenland","Miners' Club, Miner's Spring, Malachite Mine, Cadomyr, Katanbi Desert, Shadowland",2,0);
    AddWeg({386,346,0},"Galmair Hochebene mit Fort Schnellbeil und Goldener Rumil","Galmair Plateau with Fort Schnellbeil and Golden Rumil",6,0);
    AddWeg({417,357,0},"Schürferclub","Miners' Club",0,0);
    AddWeg({418,357,0},"Malachitmine, Cadomyr, Katanbi Wüste, Schattenland","Malachite Mine, Cadomyr, Katanbi Desert, Shadowland",2,0);
    AddWeg({418,371,0},"Cadomyr, Katanbi Wüste, Schattenland - Gefahr!","Cadomyr, Katanbi Desert, Shadowland - Danger!",4,0);
    AddWeg({417,385,0},"Galmair","Galmair",0,0);

    AddWeg({337,248,-6},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",4,0);-- Scoria Mine
    AddWeg({338,238,-6},"Schweinebaue","Hog Dens",2,0);-- Scoria Mine
    AddWeg({338,243,-6},"Gemmenschacht","Cameo Pit",2,0);-- Scoria Mine
    AddWeg({339,248,-6},"Ronagans Tempel - Achtung, überflutet!","Temple of Ronagan - Attention, flooded!",2,0);-- Scoria Mine
    AddWeg({333,248,-6},"Abwasserschächte","Sewers",4,0);-- Scoria Mine
    AddWeg({331,248,-6},"Schimmersenke mit dem Spielraum und dem Tempel des Nagrun.","Flicker Swale with Game Room and the Temple of Nagrun",6,0);-- Scoria Mine

    AddWeg({423,248,0},"Galmair","Galmair",6,0);
    AddWeg({427,248,0},"Nargun Ebene, Hafen, Dunkellochmine, Spinnen Maul, Gasthof zur Hanfschlinge, Cadomyr, Runewick","Nargun's Plain, Harbour, Dark Hole Mine, Spider's Mouth, Hemp Necktie Inn, Cadomyr, Runewick",2,0);
    AddWeg({427,252,0},"Ackerland + Stinkende Fischer beim Malachit Bach","Farmland + Stinky Fisherman at the Malachite Creek",4,0);
    AddWeg({441,253,0},"Waldeck","Woodcorner",0,0);
    AddWeg({464,253,0},"Die Plattform","The Platform",0,0);
    AddWeg({473,248,0},"Nargun Ebene, Hafen, Dunkellochmine, Spinnen Maul, Gasthof zur Hanfschlinge, Cadomyr, Runewick","Nargun's Plain, Harbour, Dark Hole Mine, Spider's Mouth, Hemp Necktie Inn, Cadomyr, Runewick",2,0);
    AddWeg({485,248,0},"Galmair","Galmair",6,0);
    AddWeg({501,218,0},"Galmair","Galmair",4,0);
    AddWeg({500,210,0},"Hafen, Dunkellochmine, Nördliche Inseln, Der Sumpf, Tempel der Fünf, Ebene der Stille, Nördliche Wälder, Unüberwindbarer Limes","Harbour, Dark Hole Mine, Northern Islands, The Swamp, Temple of the Five, Plains of Silence, Northern Woods, Insurmountable Limes",0,0);
    AddWeg({499,189,0},"Tempel der Fünf, Ebene der Stille, Nördliche Wälder, Unüberwindbarer Limes","Temple of the Five, Plains of Silence, Northern Woods, The Insurmountable Limes",2,0);
    AddWeg({496,191,0},"Hafen, Dunkellochmine, Nördliche Inseln","Harbour, Dark Hole Mine, Northern Islands",6,0);
    AddWeg({446,138,0},"Hafen, Nördliche Inseln","Harbour, Northern Islands",0,0);
    AddWeg({452,109,0},"Nördliche Inseln","Northern Islands",0,0);
    AddWeg({440,139,0},"Dunkellochmine","Dark Hole Mine",6,0);
    AddWeg({409,148,0},"Dunkellochmine","Dark Hole Mine",6,0);
    AddWeg({503,213,0},"Spinnen Maul, Gasthof zur Hanfschlinge, Cadomyr, Runewick","Spider's Mouth, Hemp Necktie Inn, Cadomyr, Runewick",2,0);


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
    AddWeg({758,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",0,0);
    AddWeg({755,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",0,0);
    AddWeg({749,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",0,0);
    AddWeg({746,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",0,0);
    AddWeg({743,669,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",0,0);
    AddWeg({760,632,0},"Drachenbau! Achtung heiß!","Dragon Lair! Caution hot!",2,0);
    AddWeg({790,687,0},"Runewick - Viel Glück!","Runewick - Good luck!",4,0);
    AddWeg({789,681,0},"Schlechte Wahl!","Bad choice!",6,0);
    AddWeg({790,681,0},"Sehr schlechte Wahl!","Very bad choice!",2,0);
    AddWeg({759,735,0},"Bärenhöhle; Drachenbau; Norden","Bear Cave; Dragon Lair; North",0,0);
    AddWeg({847,728,0},"Fröhliche Lichtung","Merryglade",0,0);
    AddWeg({847,730,0},"Osthafen","Eastport",2,0);
    AddWeg({786,777,0},"Anthilbach","Anthil Brook",6,0);
    AddWeg({786,777,0},"Fröhliche Lichtung; Osthafen","Merryglade; Eastport",2,0);
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
    AddWeg({783,797,0},"Anthilbach; Fröhliche Lichtung; Osthafen","Anthil Brook; Merryglade; Eastport",0,0);
    AddWeg({761,813,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({791,819,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({840,824,0},"Erzmagier Elvaine Morgan","Archmage Elvaine Morgan",2,0);
    AddWeg({853,821,0},"Hölzfällersiedlung; Zwillingsaugeninseln","Woodcutter's Hut; Twin Eyes Islands",4,0);
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
