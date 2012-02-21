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
    AddPlant(133,{0},1,{10,10,10,10},0);  -- Sonnenkraut
    AddPlant(134,{0},1,{10,10,10,10},0);          -- Vierblättrige Einbeere
    AddPlant(135,{0},1,{10,10,10,10},0);          -- Gelbkraut
    AddPlant(136,{0},1,{10,10,10,10},0);          -- Wutbeere
    AddPlant(137,{0},1,{10,10,10,10},0);          -- Flammkelchblüte
    AddPlant(138,{0},1,{10,10,10,10},0);         -- Nachtengelsblüte
    AddPlant(140,{0},1,{10,10,10,10},0);          -- Donfblatt
    AddPlant(141,{0},1,{10,10,10,10},0);          -- Schwarze Distel
    AddPlant(142,{0},1,{10,10,10,10},0);          -- Sandbeere
    AddPlant(143,{0},1,{10,10,10,10},0);          -- Roter Holunder
    AddPlant(144,{0},1,{10,10,10,10},0);          -- Jungfernkraut
    AddPlant(145,{0},1,{10,10,10,10},0);          -- Heideblüte
    AddPlant(146,{0},1,{10,10,10,10},0);          -- Wüstenhimmelkapsel
    AddPlant(148,{0},1,{10,10,10,10},0);          -- Firnisblüte
    AddPlant(152,{0},1,{10,10,10,10},0);     -- Lebenswurz
    AddPlant(153,{0},1,{10,10,10,10},0);          -- Fussblatt
    AddPlant(155,{0},1,{10,10,10,10},0);          -- Sibanac Blatt
    AddPlant(156,{0},1,{10,10,10,10},0);          -- Steppenfarn
	AddPlant(2696,{0},1,{10,10,10,10},80);	   -- Federn
	
	-- Pflanzen des DS-Systems mit SonderID in data
    AddPlant(133,{0},1,{10,10,10,10},9001); -- "Einblättrige Vierbeere" / "oneleaved fourberry" 
	AddPlant(134,{0},1,{10,10,10,10},9002); -- "Blaue Vogelbeere" / "blue birdsberry"
    AddPlant(135,{0},1,{10,10,10,10},9003); -- "Schwefelkraut" / "sulfur weed"
    AddPlant(136,{0},1,{10,10,10,10},9004); -- "Frommbeere" / "pious berry"
    AddPlant(137,{0},1,{10,10,10,10},9005); -- "Wasserblüte" / "water blossom"
    AddPlant(138,{0},1,{10,10,10,10},9006); -- "Tagteufel" / "daydevil"
    AddPlant(140,{0},1,{10,10,10,10},9007); -- "Rauchblatt" / "reek leave"
    AddPlant(141,{0},1,{10,10,10,10},9008); -- "Graue Distel" / "grey thistle"
    AddPlant(142,{0},1,{10,10,10,10},9009); -- "Wüstenbeere" / "desert berry"
    AddPlant(152,{0},1,{10,10,10,10},9013); -- "Feuerwurz" / "fire root"
    AddPlant(144,{0},1,{10,10,10,10},9010); -- "Altweiberkraut" / "gossamer weed"
    AddPlant(145,{0},1,{10,10,10,10},9011); -- "Regenkraut" / "rain weed"
    AddPlant(146,{0},1,{10,10,10,10},9012); -- "Gottesblume" / "godsflower"
    AddPlant(148,{0},1,{10,10,10,10},9014); -- "Trugblüte" / "con blossom" 
    AddPlant(156,{0},1,{10,10,10,10},9015); -- "Wolfsfarn" / "wolverine fern"
    AddPlant(153,{0},1,{10,10,10,10},9016); -- "Wiesen-Rhabarber" / "meadow rhabarb"
       	
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
		if (world:isCharacterOnField(position(648,486,0))) then
					user = world:getCharacterOnField( position(648,486,0) );
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
				user:inform("Setze Pflanze " ..plnt[auswahl]);
				user:inform("Setze Pflanze " ..bodenart);
            end
        end
    end
end
