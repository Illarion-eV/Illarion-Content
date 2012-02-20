require("base.common")

module("scheduled.gaia", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.gaia', 10, 10, 'plantdrop');

function AddPlant(ItemID,Ground,Frequenz,Season,Datawert)
    table.insert(plnt,ItemID);
    table.insert(grnd,Ground);
    table.insert(freq,Frequenz);
    table.insert(seas,Season);
    table.insert(dataval,Datawert);
end

function Init()
    plnt = {};
    grnd = {};
    freq = {};
    seas = {};
    dataval= {};
    AddPlant(133,{1,1,1,1,4},1,{8,10,2,0},0);  -- Sonnenkraut
    AddPlant(134,{4},1,{6,1,5,10},0);          -- Vierblättrige Einbeere
    AddPlant(135,{1},1,{10,6,3,0},0);          -- Gelbkraut
    AddPlant(136,{5},1,{4,3,10,7},0);          -- Wutbeere
    AddPlant(137,{3},1,{3,1,4,10},0);          -- Flammkelchblüte
    AddPlant(138,{2,7},1,{2,2,9,5},0);         -- Nachtengelsblüte
    AddPlant(140,{2},1,{10,2,7,3},0);          -- Donfblatt
    AddPlant(141,{4},1,{3,10,5,0},0);          -- Schwarze Distel
    AddPlant(142,{3},1,{2,3,10,6},0);          -- Sandbeere
    AddPlant(143,{4},1,{0,5,10,5},0);          -- Roter Holunder
    AddPlant(144,{5},1,{5,0,2,10},0);          -- Jungfernkraut
    AddPlant(145,{4},1,{10,6,3,0},0);          -- Heideblüte
    AddPlant(146,{3},1,{6,5,10,5},0);          -- Wüstenhimmelkapsel
    AddPlant(148,{5},1,{2,10,3,0},0);          -- Firnisblüte
    AddPlant(152,{2,3,5,6},1,{4,4,4,4},0);     -- Lebenswurz
    AddPlant(153,{5},1,{10,4,1,0},0);          -- Fussblatt
    AddPlant(155,{7},1,{4,10,5,1},0);          -- Sibanac Blatt
    AddPlant(156,{3},1,{10,1,2,4},0);          -- Steppenfarn
	AddPlant(2696,{2,4,5},1,{6,4,8,1},80);	   -- Federn
	
	-- Pflanzen des DS-Systems mit SonderID in data
    AddPlant(133,{4},1,{8,10,6,0},9001); -- "Einblättrige Vierbeere" / "oneleaved fourberry" 
	AddPlant(134,{4},1,{6,0,6,10},9002); -- "Blaue Vogelbeere" / "blue birdsberry"
    AddPlant(135,{5},1,{10,6,0,8},9003); -- "Schwefelkraut" / "sulfur weed"
    AddPlant(136,{5},1,{0,6,10,7},9004); -- "Frommbeere" / "pious berry"
    AddPlant(137,{4},1,{6,0,6,10},9005); -- "Wasserblüte" / "water blossom"
    AddPlant(138,{2},1,{0,6,10,6},9006); -- "Tagteufel" / "daydevil"
    AddPlant(140,{2},1,{10,6,0,6},9007); -- "Rauchblatt" / "reek leave"
    AddPlant(141,{5},1,{6,10,6,0},9008); -- "Graue Distel" / "grey thistle"
    AddPlant(142,{3},1,{0,6,10,6},9009); -- "Wüstenbeere" / "desert berry"
    AddPlant(152,{4},1,{4,4, 4,4},9013); -- "Feuerwurz" / "fire root"
    AddPlant(144,{2},1,{6,0,6,10},9010); -- "Altweiberkraut" / "gossamer weed"
    AddPlant(145,{4},1,{10,6,0,6},9011); -- "Regenkraut" / "rain weed"
    AddPlant(146,{3},1,{6,10,6,0},9012); -- "Gottesblume" / "godsflower"
    AddPlant(148,{2},1,{6,10,6,0},9014); -- "Trugblüte" / "con blossom" 
    AddPlant(156,{2},1,{0,6,10,6},9015); -- "Wolfsfarn" / "wolverine fern"
    AddPlant(153,{4},1,{6,10,6,0},9016); -- "Wiesen-Rhabarber" / "meadow rhabarb"
       	
    -- 0 alle / 1 Acker / 2 Wald / 3 Sand / 4 Wiese / 5 Fels / 6 Wasser / 7 Dreck

    anz_pflanzen = table.getn(plnt);
    anz_voraussetzungen = table.getn(grnd);
end

function plantdrop()
    if ( plnt==nil ) then
        Init();
    end

    local season=math.ceil( world:getTime("month") / 4 );
    season = base.common.Limit( season, 1, 4 );
    local spawn_amm = 15;
    if (season == 1) then --Frühling
        spawn_amm = 40;
    elseif (season == 2) then --Sommer
        spawn_amm = 40;
    elseif (season == 3) then --Herbst
        spawn_amm = 40;
    elseif (season == 4) then --Winter
        spawn_amm = 40;
    end

    for i=1,spawn_amm do
        ---- Pflanze aussuchen
        auswahl = math.random( anz_pflanzen );

        if( seas[ auswahl ][ season ] >= math.random(10) ) then
            success = true;
        else
            success = false;
        end

        if success then
            check = grnd[auswahl][math.random(1,table.getn(grnd[auswahl]))];
            pflwert = dataval[auswahl];
            ---- Standortbestimmung
            newpos = position( math.random(0,1024), math.random(0,1024), 0 );
            ---- bodentile feststellen
			theTile=world:getField(newpos);
            local bodenart = base.common.GetGroundType( theTile.tile );
            if ((bodenart == check) or (check == 0)) then

                world:createItemFromId(plnt[auswahl],1,newpos,false,333,pflwert);
				user:inform("pflanze gesetzt");
            end
        end
    end
end
