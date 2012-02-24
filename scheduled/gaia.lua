require("base.common")

module("scheduled.gaia", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.gaia', 10, 10, 'plantdrop');

function AddPlant(ItemID,Ground,Region,Season,Datawert)
    table.insert(plnt,ItemID);
    table.insert(grnd,Ground);
    table.insert(reg,Region);
    table.insert(seas,Season);
    table.insert(dataval,Datawert);
end

function Init()
    plnt = {};
    grnd = {};
    reg = {}; -- 0 = global, 1,2,... = region
    seas = {};
    dataval= {};
    AddPlant(132,{4},0,{10,10,10,10},0);  -- Kirschsetzling
    AddPlant(139,{4},1,{10,10,10,10},0);  -- Apfelsetzling
	AddPlant(150,{2},2,{10,10,10,10},0);  -- Tannensetzling
	--AddPlant(152,{4},1,{10,10,10,10},0);  -- Lebenswurzel
	--AddPlant(588,{4},1,{10,10,10,10},0);  -- Cachdernsetzling
	--AddPlant(589,{2,4},1,{10,10,10,10},0);  -- Eldan-Eichensetzling
	--AddPlant(590,{2},1,{10,10,10,10},0);  -- Scandrel-Setzling
	--AddPlant(591,{2,4},1,{10,10,10,10},0);  -- Naldorbaumsetzling
	--AddPlant(752,{3},1,{10,10,10,10},0);  -- Alraune
	--AddPlant(756,{2},1,{10,10,10,10},0);  -- Frommbeere
	--AddPlant(757,{2},1,{10,10,10,10},0);  -- Gottesblume
	--AddPlant(758,{2},1,{10,10,10,10},0);  -- Herzblut
	--AddPlant(764,{3},1,{10,10,10,10},0);  -- Tagteufel
	--AddPlant(765,{2},1,{10,10,10,10},0);  -- Tagtraum
	--AddPlant(766,{4,7},1,{10,10,10,10},0);  -- Trugblüte
	--AddPlant(769,{3},1,{10,10,10,10},0);  -- Wüstenbeere
    
       	
    -- 0 alle / 1 Acker / 2 Wald / 3 Sand / 4 Wiese / 5 Fels / 6 Wasser / 7 Dreck

    anz_pflanzen = table.getn(plnt);
    anz_voraussetzungen = table.getn(grnd);
	anz_region =table.getn(reg);
end

function initRegions()
	-- id
	-- x-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- y-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- z-Koord: {From, To} 2 Values! Use p.E. {0,0} if you want just area 0. smaller value must be named first. Take care by neg. values!
	addRegion(1,{0,500},{0,1024},{0,0});
	addRegion(2,{501,1024},{0,1024},{0,0});
	--addRegion(146,{120,150},{640,650},{0,0}, {30, 60, 40, 50});
end

function plantdrop()
    if ( plnt==nil ) then
        Init();
    end
	if (world:isCharacterOnField(position(0,15,0))) then
			user = world:getCharacterOnField( position(0,15,0) );
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
			checkreg = reg[auswahl];
            pflwert = dataval[auswahl];
            ---- Standortbestimmung
            newpos = position( math.random(0,1024), math.random(0,1024), 0 );
			---- region feststellen
			if (checkreg == 0) then
				---- bodentile feststellen
				theTile=world:getField(newpos);
				local bodenart = base.common.GetGroundType( theTile:tile() );
				if ((bodenart == check) or (check == 0)) then

					world:createItemFromId(plnt[auswahl],1,newpos,false,333,pflwert);
					user:inform("Setze Pflanze " ..plnt[auswahl].. " Auf Boden " ..bodenart.. " Position: "..newpos.x.." / " ..newpos.y.." / "..newpos.z);
				end
			else
			user:inform("Pflanze ist Regional!");	
        end
    end
end
