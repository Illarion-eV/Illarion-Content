-- tinderbox
-- light a fire

require ("base.common")

module("item.id_x_tinderbox", package.seeall)

WoodIds = {544,543,2560,3};
BC = base.common;

function UseItem(User,SourceItem,TargetItem,Counter,Param)
	
	-- item in hand?
	if not BC.IsItemInHands(SourceItem) then
		BC.InformNLS(User,
			"Du musst die Zunderbüchse in die Hand nehmen.",
			"You have to hold the tinderbox in your hands.");
		return;
	end
	
	local frontPos = BC.GetFrontPosition(User);
	
	-- check front position for proper ground tile
	local groundType = BC.GetGroundType(world:getField(frontPos).tile);
	if groundType == BC.GroundType.water or groundType == BC.GroundType.unknown then
		BC.InformNLS(User,
			"Auf diesem Untergrund kannst du kein Feuer machen.",
			"You can't light a fire on this ground.");
		return;
	end
	
	-- check front position for wood, a kettle or if it's clear
	local foundWood = false;
	local frontItem = nil;
	local posOkay = true;
	if world:isItemOnField(frontPos) then
		frontItem = BC.GetFrontItem(User);
		if frontItem and frontItem.id == 2488 then -- a kettle
			posOkay = true;
		elseif IsWood(frontItem) then
			foundWood = true;
			posOkay = true;
		else
			frontItem = nil;
			posOkay = false;
		end
	end
	if not posOkay or world:isCharacterOnField(frontPos) then
		BC.InformNLS(User,
			"Du kannst nur unter einem Kessel oder an einer freien Stelle ein Feuer machen.",
			"You have to light a fire beneath a kettle or at a clear place.");
		return;
	end
	-- check for and remove wood
	if foundWood then
		-- already found wood in front
		world:erase(frontItem, 1);
		LightFire(User, frontPos);
		if frontItem.number > 0 then
			-- there was more than one wood item, so put the rest on top
			world:createItemFromId(frontItem.id,frontItem.number,frontPos,true,333,0);
			-- and erase the rest
			world:erase(frontItem,frontItem.number);
		end
		--wildfires disabled
		--tryWildfire(User, SourceItem);
		return;
	end
	
	-- first check the hand slot
	local woodItem = BC.GetTargetItem(User, SourceItem);
	if IsWood(woodItem) then
		world:erase(woodItem, 1);
		foundWood = true;
	else
		-- no wood in hand, so check the belt
		local woodIndex = 0;
		local woodNum = 0;
		while ( woodNum == 0 and woodIndex < table.getn(WoodIds) ) do
			woodIndex = woodIndex + 1;
			woodNum = User:countItemAt("all", WoodIds[woodIndex]);
		end
		if woodNum > 0 then
			User:eraseItem(WoodIds[woodIndex],1);
			foundWood = true;
		end
	end
	if foundWood then
		-- light fire
		LightFire(User, frontPos);
		-- wildfires disabled
		--tryWildfire(User, SourceItem);
	else
		BC.InformNLS(User,
			"Für ein Feuer brauchst du Holz.",
			"For a fire you need wood.");
	end
end

function IsWood(item)
	if not item then
		return false;
	end
	
	if item.id == 0 then
		return false;
	end
	
	for _,id in pairs(WoodIds) do
		if id == item.id then
			return true;
		end
	end
	
	return false;
end

function LightFire(User, FrontPos)
	world:createItemFromId(12,1,frontPos,true,333,0); -- the fire
	BC.InformNLS(User,
		"Du entzündest ein Feuer.",
		"You light a fire.");
end

function tryWildfire(User, SourceItem)
	local logStrg=os.date()..": "..User.name.." tried "..SourceItem.pos.x.."/"..SourceItem.pos.y.."/"..SourceItem.pos.z.."\n";
	logToFile(logStrg);
	
	if (math.random(1,100)==0) and (User.pos.z~=100 and User.pos.z~=101) then      -- Random wildfires deactivated. No fire on Noobia!
		local fld=world:getField(SourceItem.pos);
		local cnt=fld:countItems();
		local SaveFireplace=false;
		local i;
		for i=0, cnt-1 do
			TheItem=fld:getStackItem(i);
			if (TheItem.id==1008) or (TheItem.id==2488) then --Kessel oder Feuerstelle
				SaveFireplace=true;
			end
		end
		if not SaveFireplace then
			logStrg=os.date()..": "..User.name.." started fire at ("..SourceItem.pos.x.."/"..SourceItem.pos.y.."/"..SourceItem.pos.z.."\n";
			logToFile(logStrg);
			callFireMan(User,SourceItem);
			SaveFireplace=false;
		end
	end
end

function callFireMan(User, fireItem)

    --User:inform("checking NPC");
    Npcs=world:getNPCSInRangeOf(position(-105,-84,0),1);
    for i,fireMaster  in Npcs do
        --User:inform("Name: "..fireMaster.name);
        fndFir, firEffect = fireMaster.effects:find(8);
        if not fndFir then                                  -- if not...
            firEffect = LongTimeEffect(8,300);              -- add effect
            firEffect:addValue("fireX1",fireItem.pos.x+100000);
            firEffect:addValue("fireY1",fireItem.pos.y+100000);
            firEffect:addValue("fireZ1",fireItem.pos.z+100000);
            firEffect:addValue("fireN1",0);                 -- next flame index
            firEffect:addValue("lastNumber",1);             -- last flame number
            firEffect:addValue("firstNumber",1);            -- first flame
            fireMaster.effects:addEffect( firEffect );
            --User:inform("NPC angesteckt");
        else            -- if he has the effect already...
            a, lastNumber = firEffect:findValue("lastNumber");
            nextFree = lastNumber + 1;
            firEffect:addValue("fireX"..nextFree,fireItem.pos.x+100000);
            firEffect:addValue("fireY"..nextFree,fireItem.pos.y+100000);
            firEffect:addValue("fireZ"..nextFree,fireItem.pos.z+100000);
            firEffect:addValue("fireN"..lastNumber,nextFree);
            firEffect:addValue("fireN"..nextFree,0);                 -- next flame index
            firEffect:addValue("lastNumber",nextFree);             -- last flame number
            --User:inform("er hats schon.");
        end
    end
end

function logToFile(theString)
    retVal=false;
    coldLog,errMsg=io.open("/home/martin/brandstifter.txt","a");
    if (coldLog~=nil) then
        coldLog:write(theString);
        coldLog:close();
        retVal=retVal;
    else
        retVal=retVal;
    end
    return retVal;
end
