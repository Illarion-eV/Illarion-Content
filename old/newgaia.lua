module("scheduled.newgaia", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.newgaia', 10, 30, 'plantdrop');

function initHerbs()
	-- id  		= Itemid
	-- ground	= Ground(2=rock,3=sand,4=field,5=lava,6=water,7=street,8=dirt,9=forest,10=snow,11=meadow)
	-- item		= item, the herb can found in
	-- region	= Array with the reagions
	herbs = {}
  	herbs[133] = {id = 133, ground = 11, item = {273}, region = {}} 	-- Sonnenkraut / sun herb
	--herbs[134] = {id = 134, ground =  3, item = {273}, region = {}} 	-- Vierbl�ttrige Einbeere / fourleafed oneberry
	--herbs[135] = {id = 135, ground =  3, item = {301}, region = {}} 	-- Gelbkraut / yellow weed
	--herbs[136] = {id = 136, ground =  3, item = {301}, region = {}} 	-- Wutbeere / anger berry
	--herbs[137] = {id = 137, ground =  3, item = {301}, region = {}} 	-- Flammenkelchbl�te / flamegoblet blossom
	--herbs[138] = {id = 138, ground =  3, item = {301}, region = {}} 	-- Nachtengelsbl�te / night angels blossom
	--herbs[140] = {id = 140, ground =  3, item = {301}, region = {}} 	-- Donfblatt / donf blade
	--herbs[141] = {id = 141, ground =  3, item = {301}, region = {}} 	-- Schwarze Distel / black thistle
	herbs[142] = {id = 142, ground =  3, item = {301}, region = {}} 	-- Sandbeere / sandberry
	--herbs[143] = {id = 143, ground =  3, item = {301}, region = {}} 	-- Roter Holunder / red elder
	--herbs[144] = {id = 144, ground =  3, item = {301}, region = {}} 	-- Jungfernkraut / virgins weed
	--herbs[145] = {id = 145, ground =  3, item = {301}, region = {}} 	-- Heidebl�te / heath flower
	--herbs[146] = {id = 146, ground =  3, item = {301}, region = {}} 	-- W�stenhimmelskapsel / desert sky capsule
	--herbs[147] = {id = 147, ground =  3, item = {301}, region = {}} 	-- Brombeere / black berry
	--herbs[148] = {id = 148, ground =  3, item = {301}, region = {}} 	-- Firnisbl�te / firnis blossom
	--herbs[149] = {id = 149, ground =  3, item = {301}, region = {}} 	-- Tannen-Spro� / fir tree sprout
	--herbs[151] = {id = 151, ground =  3, item = {301}, region = {}} 	-- Erdbeere / strawberry
	--herbs[152] = {id = 152, ground =  3, item = {301}, region = {}} 	-- Lebenswurz / life root
	--herbs[153] = {id = 153, ground =  3, item = {301}, region = {}} 	-- Fussblatt / foot leaf
	--herbs[154] = {id = 154, ground =  3, item = {301}, region = {}} 	-- Hopfen / hop
    --herbs[155] = {id = 155, ground =  3, item = {301}, region = {}} 	-- Sibanac Blatt / sibanac leaf
	--herbs[156] = {id = 156, ground =  3, item = {301}, region = {}} 	-- Steppenfarn / steppe fern
	--herbs[157] = {id = 157, ground =  3, item = {301}, region = {}} 	-- Faulbaum Rinde / rotten tree bark	
	--herbs[158] = {id = 158, ground =  3, item = {301}, region = {}} 	-- Knollenschwammpilz / bulbsponge mushroom
    --herbs[159] = {id = 159, ground =  3, item = {301}, region = {}} 	-- Fliegenpilz / toadstool
    --herbs[160] = {id = 160, ground =  3, item = {301}, region = {}} 	-- Rotk�pfchen / red head
    --herbs[161] = {id = 161, ground =  3, item = {301}, region = {}} 	-- Hirtenpilz / herders mushroom
    --herbs[162] = {id = 162, ground =  3, item = {301}, region = {}} 	-- Geburtspilz / birth mushroom
    --herbs[163] = {id = 163, ground =  3, item = {301}, region = {}} 	-- Champignon / champignon

	--herbs[752] = {id = 752, ground =  3, item = {301}, region = {}} 	-- Alraune / mandrake
	--herbs[753] = {id = 753, ground =  3, item = {301}, region = {}} 	-- Blaue Vogelbeere / blue birdsberry
    --herbs[754] = {id = 754, ground =  3, item = {301}, region = {}} 	-- einbl�ttrige Vierbeere / oneleaved fourberry
    --herbs[755] = {id = 755, ground =  3, item = {301}, region = {}} 	-- Feuerwurz / fire root
    --herbs[756] = {id = 756, ground =  3, item = {301}, region = {}} 	-- Frommbeere / pious berry
    --herbs[757] = {id = 757, ground =  3, item = {301}, region = {}} 	-- Gottesblume / godsflower
    --herbs[758] = {id = 758, ground =  3, item = {301}, region = {}} 	-- Herzblut / lifeblood
    --herbs[760] = {id = 760, ground =  3, item = {301}, region = {}} 	-- Rauchblatt / reek leave
    --herbs[762] = {id = 762, ground =  3, item = {301}, region = {}} 	-- Schwefelkraut / sulfur weed
    --herbs[763] = {id = 763, ground =  3, item = {301}, region = {}} 	-- Sumpfblume / marsh flower
    --herbs[764] = {id = 764, ground =  3, item = {301}, region = {}} 	-- Tagteufel / daydevil
    --herbs[765] = {id = 765, ground =  3, item = {301}, region = {}} 	-- Tagtraum / daydream
    --herbs[766] = {id = 766, ground =  3, item = {301}, region = {}} 	-- Trugbl�te / con blossom
    --herbs[767] = {id = 767, ground =  3, item = {301}, region = {}} 	-- Wasserblume / water blossom
    --herbs[768] = {id = 768, ground =  3, item = {301}, region = {}} 	-- Wolfsfarn / wolverine fern
    --herbs[769] = {id = 769, ground =  3, item = {301}, region = {}} 	-- W�stenbeere / desert berry

	
	initRegions();
end


function initRegions()
	-- id
	-- x-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- y-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- z-Koord: {From, To} 2 Values! Use p.E. {0,0} if you want just area 0. smaller value must be named first. Take care by neg. values!
	-- Chance of Drop for this reagion in % {spring, summer, autum, winter}
	-- Sunflowers
	addRegion(133,{130,140},{640,660},{0,0}, {1, 1, 1, 1});
	addRegion(142,{130,140},{640,660},{0,0}, {1, 1, 1, 1});
	--addRegion(146,{120,150},{640,650},{0,0}, {30, 60, 40, 50});
end


    
function plantdrop()
	initHerbs();
	if (world:isCharacterOnField(position(136,648,0))) then
		user = world:getCharacterOnField( position(136,648,0) );
		table.foreach( herbs, setHerb )
	end
end


function setHerb(HerbID)
	user:inform("Herb: ".. herbs[HerbID].id);
	user:inform("Herb ground: " ..herbs[HerbID].ground);

	RegionID = 1;
	while RegionID  <= table.getn(herbs[HerbID].region) do
		user:inform("Anzahl der Tiles: "..getTileNumbersofRegion(herbs[HerbID].region[RegionID]));
		user:inform("Drop-Chance: "..getDropChance(herbs[HerbID].region[RegionID][4]));
		for zPos = herbs[HerbID].region[RegionID][3][1], herbs[HerbID].region[RegionID][3][2], 1 do
			user:inform("Z OK");
			for yPos = herbs[HerbID].region[RegionID][2][1], herbs[HerbID].region[RegionID][2][2], 1 do
				user:inform("y OK");
				for xPos = herbs[HerbID].region[RegionID][1][1], herbs[HerbID].region[RegionID][1][2], 1 do
					TilePos = position(xPos,yPos,zPos);
					user:inform("Position: "..TilePos.x.." / " ..TilePos.y.." / "..TilePos.z);
					
					if (checkGround(herbs[HerbID],TilePos)==true) then
						user:inform("TileCheck OK");
						if (math.random(100)<=getDropChance(herbs[HerbID].region[RegionID][4])) then
							user:inform("Getroffen, setze Pflanze");
							world:createItemFromId(HerbID,1,TilePos,false,333,333);
						else
							user:inform("Nicht getroffen");
						end
						
					else
						user:inform("TileCheck FALSE");
					end
				end
			end
		end		 
		RegionID = RegionID + 1;
	end
end

function addRegion(HerbID, xPos, yPos, zPos, season)
	table.insert (herbs[HerbID].region , {xPos,yPos,zPos,season});
end

function getTileNumbersofRegion(Region)
	count = (((Region[1][2])-(Region[1][1]))+1) * (((Region[2][2])-(Region[2][1]))+1) * (((Region[3][2])-(Region[3][1])+1));
	return count;
end

function getDropChance(Season)
	currentSeason = math.ceil( world:getTime("month") / 4 );
	chance = Season[currentSeason];
	return chance;
end

function checkGround(herbs,TilePos)
	-- Check Ground
	TileID = world:getField(TilePos):tile();
	if not (TileID==herbs.ground) then
		return false;
	end
	return true;
end

