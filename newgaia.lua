

function initHerbs()
	-- id  		= Itemid
	-- ground	= Ground the herb is dropping on
	-- item		= item, the herb can found in
	-- region	= Array with the reagions
	herbs = {}
  	herbs[133] = {id = 133, ground = 11, item = {273}, region = {}} 			-- Sunflower
	herbs[142] = {id = 142, ground =  3, item = {273}, region = {}} 			-- Sandbeere
	herbs[146] = {id = 146, ground =  3, item = {301}, region = {}} 			-- Wuestenhimmelskaspel
	
	initRegions();
end


function initRegions()
	-- id
	-- x-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- y-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- z-Koord: {From, To} 2 Values! Use p.E. {0,0} if you want just area 0. smaller value must be named first. Take care by neg. values!
	-- Chance of Drop for this reagion in % {spring, summer, autum, winter}
	-- Sunflowers
	addRegion(133, {132,133},{648,649},{0,0},{30, 60, 40, 50});
	addRegion(142,{143,144},{648,649},{0,0}, {30, 60, 40, 50});
	addRegion(146,{143,144},{648,649},{0,0}, {30, 60, 40, 50});
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

