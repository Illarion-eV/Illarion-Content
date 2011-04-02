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
    AddWeg({174,609,0},"Freiheits Steinbruch","Liberty Quarry",0,0); --<copper/gold/iron mine>
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
    AddWeg({400,739,0},"Moshran's Brut - Bleibt fern!","Moshran's Brood - Stay away!",0,0); -- <Name hier> Oase/Ruine -- <name here> oasis/ruin
    AddWeg({208,774,0},"Berg Letma","Mount Letma",2,0); -- <Name hier> Küstengebirge/Gebirgskette -- <name here> mountain range
    AddWeg({112,817,0},"Verlorener Hafen","Lost Harbour",4,0); -- <Name hier> Ruinen -- <name here> ruins
    AddWeg({294,700,0},"Wüstenloch","Desert Hole",2,0); -- <Name hier> ehemaliges Bergwerk -- <name here> former pit
    AddWeg({347,692,0},"Sternenoase","Oasis of Stars",2,0); -- <Name hier> Sandcamp -- <name here> sandcamp
    AddWeg({166,758,0},"Siranitempel","Temple of Sirani",2,0);

    --NW/Galmair-map
    AddWeg({365,247,0},"Guilianni Residenz","Guilianni Residence",0,0); -- Don's palace
    AddWeg({392,249,0},"","",0,0);-- <Name hier> Gildengebäude -- <name here> guild hall
    AddWeg({376,259,0},"Werkstatt","Workshop",2,0);-- <Name hier> Werkstatt -- <name here> workshop
    AddWeg({401,293,0},"Gasthof zum schläfrigen Bujhaar","Sleepy Bujhaar Inn",2,0);-- <Name hier> Gasthaus -- <name here> Inn
    AddWeg({418,357,0},"Malachitmine","Malachite Mine",2,0);
    AddWeg({421,251,0},"Galmair","Galmair",6,0);
    AddWeg({421,247,0},"Galmair","Galmair",6,0);
    AddWeg({343,259,0},"Taverne zur Geflügelten Sau","The Winged Sow Tavern",0,0);-- <Name hier> Taverne -- <name here> tavern
    AddWeg({311,282,0},"Villa 'Goldader'","Goldvein'",6,0);-- <Name hier> Villa -- <name here> villa
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
    AddWeg({330,249,-6},"Schimmersenke","Flicker Swale ",6,0);-- <Name hier> Schwarzmarkt -- <name here> black market

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




    ---------------- BILDER ----------------

    --AddPicture({X,Y,Z},german text,english text, type, needed value of perception);
    --typs:
    -- 1 = east wall yellow picture
    -- 2 = east wall violett picture




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



    ---------------- Sï¿½ulen/Statuen  ----------------
    --AddPillar({X,Y,Z},german text,english text, type, needed value of perception);
    -- typs:
    -- 1 = dark column
    -- 2 = statue (woman) south



	
	---------------- Chimneys ~ Kamine -------------
	-- AddChimney({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west
	



	---------------- Mirrors ~ Spiegel -------------
	-- AddMirror({X,Y,Z}, german text, english text, type, needed value of perception);
	-- types:
	-- 1 = facing south
	-- 2 = facing west


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
        return 520
    elseif (Value==12) then
        return 521
    elseif (Value==14) then
        return 337
    elseif (Value==21) then
        return 1914
    elseif (Value==22) then
        return 1915
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
