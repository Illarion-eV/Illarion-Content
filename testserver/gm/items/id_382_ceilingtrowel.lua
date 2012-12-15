-- UPDATE common SET com_script='gm.items.id_382_ceilingtrowel' WHERE com_itemid IN (382);

require("gm.base.log")
require("base.factions")
require("base.common")

module("gm.items.id_382_ceilingtrowel", package.seeall, package.seeall(gm.base.log))

--[[function UseItemWithCharacter(User,SourceItem,TargetCharacter,Counter,Param)
	Init();
	User:setAttrib("strength",TargetCharacter:increaseAttrib("strength",0));
	User:setAttrib("constitution",TargetCharacter:increaseAttrib("constitution",0));
	User:setAttrib("perception",TargetCharacter:increaseAttrib("perception",0));
	User:setAttrib("intelligence",TargetCharacter:increaseAttrib("intelligence",0));
	User:setAttrib("agility",TargetCharacter:increaseAttrib("agility",0));
	User:setAttrib("dexterity",TargetCharacter:increaseAttrib("dexterity",0));
	skSlashGM=User:increaseSkill(5,"slashing weapons",0);
	skParryGM=User:increaseSkill(5,"parry",0);
	skConcuGM=User:increaseSkill(5,"concussion weapons",0);
	skPiercGM=User:increaseSkill(5,"puncture weapons",0);
	skDodgeGM=User:increaseSkill(5,"dodge",0);
	skTactiGM=User:increaseSkill(5,"tactics",0);
	skDistaGM=User:increaseSkill(5,"distance weapons",0);
	skWrestGM=User:increaseSkill(5,"wrestling",0);
	DSlashTC=TargetCharacter:increaseSkill(5,"slashing weapons",0)-skSlashGM;
	DParryTC=TargetCharacter:increaseSkill(5,"parry",0)-skParryGM;
	DConcuTC=TargetCharacter:increaseSkill(5,"concussion weapons",0)-skConcuGM;
	DPiercTC=TargetCharacter:increaseSkill(5,"puncture weapons",0)-skPiercGM;
	DDodgeTC=TargetCharacter:increaseSkill(5,"dodge",0)-skDodgeGM;
	DTactiTC=TargetCharacter:increaseSkill(5,"tactics",0)-skTactiGM;
	DDistaTC=TargetCharacter:increaseSkill(5,"distance weapons",0)-skDistaGM;
	DWrestTC=TargetCharacter:increaseSkill(5,"wrestling",0)-skWrestGM;
	User:increaseSkill(5,"slashing weapons",DSlashTC);
	User:increaseSkill(5,"parry",DParryTC);
	User:increaseSkill(5,"concussion weapons",DConcuTC);
	User:increaseSkill(5,"puncture weapons",DPiercTC);
	User:increaseSkill(5,"dodge",DDodgeTC);
	User:increaseSkill(5,"tactics",DTactiTC);
	User:increaseSkill(5,"distance weapons",DDistaTC);
	User:increaseSkill(5,"wrestling",DWrestTC);
	User:inform("...done with skills and stats");

	for i=1,11 do
	    Item = TargetCharacter:getItemAt(i);
	    if ((Item ~= nil) and (Item.id ~= 0)) then
	        BlockItem = User:getItemAt(i);
	        if ((BlockItem ~= nil) and (BlockItem.id ~= 0)) then
	            world:erase(BlockItem,BlockItem.number);
	        end
	        User:createAtPos(i,Item.id,Item.number);
	        NewItem = User:getItemAt(i);
	        NewItem.quality = Item.quality;
	        NewItem.data = Item.data;
	        world:changeItem(NewItem);
	    end
	end
	-- LogGMAction(User,User.name.."("..User.id..") copied "..TargetCharacter.name.."("..TargetCharacter.id..")");
end]]

function UseItem(User,SourceItem,TargetItem,Counter,Param)
    --    User:inform("data is ");--..SourceItem.data);
    --SourceItem.data = 1;

	Init();
	
	local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if not TargetItem then
		TargetItem = base.common.GetFrontItem(User);
	end
	
    --if (SourceItem.data==0) then
        if (TargetItem and TargetItem.id~=0) then
            User:inform("target item");
            --[[WFound,weapon = world:getWeaponStruct(TargetItem.id);
            AFound,armor = world:getArmorStruct(TargetItem.id);
            if (WFound) then
                User:inform("Quality: "..TargetItem.quality.. "; ID: "..TargetItem.id.."; number: "..TargetItem.number.."; data: "..TargetItem.data.."; wear: "..TargetItem.wear.. "; attack: "..weapon.Attack.."; defense: "..weapon.Defence.."; AP: "..weapon.ActionPoints.."; range: "..weapon.Range.."; type: "..weapon.WeaponType);
                --User:inform(" itempos: "..TargetItem.itempos);
                --User:inform(" pos: "..TargetItem.pos);
            elseif (AFound) then
                User:inform("Quality: "..TargetItem.quality.. " ID: "..TargetItem.id.." number: "..TargetItem.number.." data: "..TargetItem.data.." wear: "..TargetItem.wear.. " PuncA: "..armor.PunctureArmor.." StrokeA: "..armor.StrokeArmor.." ThrustA: "..armor.ThrustArmor.." stiffness: "..armor.Stiffness.." absorb: "..armor.Absorb.."HP");
            else
                User:inform("Quality: "..TargetItem.quality.. " ID: "..TargetItem.id.." number: "..TargetItem.number.." data: "..TargetItem.data.." wear: "..TargetItem.wear);
            end]]
            if (string.find(User.lastSpokenText,"setdata (%a+) (.+)")~=nil) then
                a,b,dataString,newdata=string.find(User.lastSpokenText,"setdata (%a+) (.+)");
                TargetItem:setData(dataString,newdata);
                world:changeItem(TargetItem);
                User:inform("Data of "..world:getItemName(TargetItem.id,0).." set to key: " ..dataString.." value: "..TargetItem:getData(dataString));
                -- LogGMAction(User,User.name.."("..User.id..") changed data of "..world:getItemName(TargetItem.id,1).."("..TargetItem.id..") to "..TargetItem.data);
            end
            if (string.find(User.lastSpokenText,"setqual (%d)(%d)(%d)")~=nil) then
                a,b,newqual=string.find(User.lastSpokenText,"setqual (%d+)");
                TargetItem.quality=newqual+1-1;
                world:changeItem(TargetItem);
                User:inform("Quality of "..world:getItemName(TargetItem.id,0).." set to "..TargetItem.quality);
                -- LogGMAction(User,User.name.."("..User.id..") changed quality of "..world:getItemName(TargetItem.id,1).."("..TargetItem.id..") to "..TargetItem.quality);
            end
            if (string.find(User.lastSpokenText,"setwear (%d+)")~=nil) then
                a,b,newwear=string.find(User.lastSpokenText,"setwear (%d+)");
                TargetItem.wear=newwear+1-1;
                world:changeItem(TargetItem);
                User:inform("Wear of "..world:getItemName(TargetItem.id,0).." set to "..TargetItem.wear);
                -- LogGMAction(User,User.name.."("..User.id..") changed wear of "..world:getItemName(TargetItem.id,1).."("..TargetItem.id..") to "..TargetItem.wear);
            end
            if (string.find(User.lastSpokenText,"setnumber (%d+)")~=nil) then
                a,b,newwear=string.find(User.lastSpokenText,"setnumber (%d+)");
                TargetItem.number=math.min(250,newwear+1-1);
                world:changeItem(TargetItem);
                User:inform("Amount of "..world:getItemName(TargetItem.id,0).." set to "..TargetItem.number);
                -- LogGMAction(User,User.name.."("..User.id..") changed number of "..world:getItemName(TargetItem.id,1).."("..TargetItem.id..") to "..TargetItem.wear);
            end
        end
		if (string.find(User.lastSpokenText,"field")~=nil) then
			UseItemWithField(User, SourceItem, User.pos, Counter, Param);
		end
		if (string.find(User.lastSpokenText,"count (%d+)")~=nil) then
			a,b,countID=string.find(User.lastSpokenText,"count (%d+)");
			countID = countID+1-1;
			User:inform("User:countItem("..countID..") = "..User:countItem(countID));
			User:inform("User:countItemAt(\"all\", "..countID..") = "..User:countItemAt("all",countID));
			User:inform("User:countItemAt(\"belt\", "..countID..") = "..User:countItemAt("belt",countID));
			User:inform("User:countItemAt(\"body\", "..countID..") = "..User:countItemAt("body",countID));
			User:inform("User:countItemAt(\"backpack\", "..countID..") = "..User:countItemAt("backpack",countID));
			User:inform("User:countItemAt(\"all\", "..countID..", 0) = "..User:countItemAt("all",countID, 0));
			User:inform("User:countItemAt(\"belt\", "..countID..", 0) = "..User:countItemAt("belt",countID, 0));
			User:inform("User:countItemAt(\"body\", "..countID..", 0) = "..User:countItemAt("body",countID, 0));
			User:inform("User:countItemAt(\"backpack\", "..countID..", 0) = "..User:countItemAt("backpack",countID, 0));
			local Bag = User:getBackPack();
			User:inform("Bag:countItem("..countID..") = "..Bag:countItem(countID));
			User:inform("Bag:countItem("..countID..", 0) = "..Bag:countItem(countID, 0));
		end
		if (string.find(User.lastSpokenText,"setdata (%d+)")==nil and string.find(User.lastSpokenText,"setqual (%d)(%d)(%d)")==nil) then
			a,b,spoken = string.find(User.lastSpokenText,"(.+)");
			if User:increaseAttrib(spoken,0)~=0 then
				User:setAttrib(spoken,Counter);
				User:inform(spoken.." set to "..User:increaseAttrib(spoken,0));
				-- LogGMAction(User,User.name.."("..User.id..") changed attribute "..spoken.." to "..User:increaseAttrib(spoken,0));
			--[[elseif (string.find(User.lastSpokenText,"cold")~=nil) then
				fndRes, resEffect = User.effects:find(3);
				if not fndRes then                                  -- if not...
					resEffect=User.effects:addEffect( LongTimeEffect(3,1) );     -- add effect (400) to resurrected player

					resEffect:addValue("coldStr",coldStr-1);
					User:inform("angesteckt");
				else            -- if he has the effect already...
					User:inform("Du bist schon angesteckt.");
					resEffect.nextCalled =20;
				end]]
			elseif ((string.find(User.lastSpokenText,"show map")~=nil)) then
				User:inform("Okay, now showing map");
				for i=1, 200 do
					newx=math.random(0,1024);
					newy=math.random(0,1024);
					User:warp(position(newx,newy,0));
				end
			end
		end
    if (SourceItem:getData("mode")=="weather") then
        if (string.find(User.lastSpokenText,"set weather")~=nil) then
            currWeather=world.weather;
            if (string.find(User.lastSpokenText,"help")~=nil) then
                User:inform("Set cloud density: \"clouds <value>\" - range: 0 - 100");
                User:inform("Set fog density: \"fog <value>\" - range: 0 - 100");
                User:inform("Set wind direction: \"wind dir <value>\" - range: -100 - +100");
                User:inform("Set gust strength: \"gust str <value>\" - range: 0 - 100");
                User:inform("Set percipitation strength: \"per <value>\" - range: 0 - 100");
                User:inform("Set thunderstorm strength: \"thunder <value>\" - range: 0 - 100");
                User:inform("Set temperature: \"temp <value>\" - range: -50 - +50");
            end
            if (string.find(User.lastSpokenText,"clouds (%d+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"clouds (%d+)");
                value=value+1-1;
                if (value<101 and value>-1) then
                    currWeather.cloud_density = value;
                    User:inform("cloud density changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed cloud densitiy to: "..value);
                else
                    User:inform("Failed changing cloud desity: out of range (0-100)");
                end
            end
            if (string.find(User.lastSpokenText,"fog (%d+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"fog (%d+)");
                value=value+1-1;
                if (value<101 and value>-1) then
                    currWeather.fog_density = value;
                    User:inform("fog density changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed fog densitiy to: "..value);
                else
                    User:inform("Failed changing fog desity: out of range (0-100)");
                end
            end
            if (string.find(User.lastSpokenText,"wind dir ([-,0-9]+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"wind dir ([-,0-9]+)");
                value=value+1-1;
                if (value<101 and value>-101) then
                    currWeather.wind_dir = value;
                    User:inform("wind direction changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed wind direction to: "..value);
                else
                    User:inform("Failed changing wind direction: out of range (-100 - +100)");
                end
            end
            if (string.find(User.lastSpokenText,"gust str (%d+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"gust str (%d+)");
                value=value+1-1;
                if (value<101 and value>-1) then
                    currWeather.gust_strength = value;
                    User:inform("gust strength changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed gust strength to: "..value);
                else
                    User:inform("Failed changing gust strength: out of range (0-100)");
                end
            end
            if (string.find(User.lastSpokenText,"per (%d+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"per (%d+)");
                value=value+1-1;
                if (value<101 and value>-1) then
                    currWeather.percipitation_strength = value;
                    User:inform("percipitation strength changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed percipitation strength to: "..value);
                else
                    User:inform("Failed changing percipitation strength: out of range (0-100)");
                end
            end
            if (string.find(User.lastSpokenText,"thunder (%d+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"thunder (%d+)");
                value=value+1-1;
                if (value<101 and value>-1) then
                    currWeather.thunderstorm = value;
                    User:inform("thunderstorm changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed thunderstorm to: "..value);
                else
                    User:inform("Failed changing thunderstorm: out of range (0-100)");
                end
            end
            if (string.find(User.lastSpokenText,"temp ([-,0-9]+)")~=nil) then
                a,b,value = string.find(User.lastSpokenText,"temp ([-,0-9]+)");
                value=value+1-1;
                if (value<51 and value>-51) then
                    currWeather.temperature = value;
                    User:inform("temperature changed to: "..value);
                    -- LogGMAction(User,User.name.."("..User.id..") changed temperature to: "..value);
                else
                    User:inform("Failed changing temperature: out of range (-50 - +50)");
                end
            end
            if (currWeather.temperature>-1) then
                currWeather.percipitation_type=1;
            else
                currWeather.percipitation_type=2;
            end
            world:setWeather(currWeather);
        end
    elseif (SourceItem:getData("mode")=="ranksystem") then  --ranksystem
		if (string.find(User.lastSpokenText,"help")~=nil) then
			local a,b, value = string.find(User.lastSpokenText,"help (%d+)");
						
			Page = {};
			Page[0] = "[Faction]: To look through the commands say 'help X' where X can a number from 1 to 2 and use this Item again."
			Page[2] = "[Faction]: Add or remove rankpoints for a Char in a town (1=cadomyr, 2=runewick, 3=galmair) within a certain radius (default 5) 'rankpoints <add|sub> <value> <1|2|3|nil> <radius|nil>'"
            
			if value then
				value = value *1;
				if value <= 2 then
					User:inform(Page[value]);
				else
					User:inform("[Faction]: This documentation has only 2 pages!");
				end
			else
				User:inform(Page[0]);
        	end
		-- rankpoints <add|sub> <value> <1|2|3|nil> <radius|nil>
		elseif (string.find(User.lastSpokenText,"rankpoints (%a+) (%d+) (%d+) (%d+)")~=nil) then --add rankpoints within a radius Counter
			a,b,modifier,value,faction,radius = string.find(User.lastSpokenText,"rankpoints (%a+) (%d+) (%a+) (%d+)");
			value=tonumber(value);
			radius=tonumber(radius);
			ChangeRankpoints(User,modifier,value,faction,radius);
		else
			local frontChar = base.common.GetFrontCharacter(User);
			if frontChar then
				UseItemWithCharacter(User, SourceItem, frontChar, Counter, Param);
			else
				UseItemWithCharacter(User, SourceItem, User, Counter, Param);
			end
		end
		
	end
end

function LookAtItem(User,Item)

    if (Item:getData("mode")=="items") then
		base.lookat.SetSpecialName(Item, "Kelle (Items)","Kelle (Items)")
		base.lookat.SetSpecialDescription(Item, "Mögliche Aktionen: setdata <key> <value>, setqual <value>, setwaer <value>, setnumber <value>, field, count <value>", "Possible actions:  setdata <key> <value>, setqual <value>, setwaer <value>, setnumber <value>, field, count <value>");
    elseif (Item:getData("mode")=="weather") then
        base.lookat.SetSpecialName(Item, "Kelle (Wetter)","Kelle (Weather)");
		base.lookat.SetSpecialDescription(Item, "Mögliche Aktionen: help, clouds <value>, fog <value>, wind <value>, gust <value>, per <value>, thunder <value>, temp <value>", "Possible actions: help, clouds <value>, fog <value>, wind <value>, gust <value>, per <value>, thunder <value>, temp <value> ");
	elseif (Item:getData("mode")=="ranksystem") then
        base.lookat.SetSpecialName(Item, "Kelle (Rangsystem)", "Kelle (Ranksystem)");
		base.lookat.SetSpecialDescription(Item, "Mögliche Aktionen: rankpoints <add|sub> <value> <1|2|3|nil> <radius|nil> ", "Possible actions: rankpoints <add|sub> <value> <1|2|3|nil> <radius|nil>");
	else
		base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setdata mode xyz' und benutzt die Kelle. Modi sind items, weather und ranksystem. Items ist default.", "To set a mode type 'setdata mode xyz' and use the trowel. Modes are standard, items, weather and ranksystem. Items is default.");
        base.lookat.SetSpecialName(Item, "Kelle", "Kelle");
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
	
    for intx=User.pos.x-5,User.pos.x+5 do
        for inty=User.pos.y-5,User.pos.y+5 do
            if (world:isCharacterOnField(position(intx,inty,User.pos.z))==true) then
                TargetChar=world:getCharacterOnField(position(intx,inty,User.pos.z));
                User:introduce(TargetChar);
            end
        end
    end
end

function UseItemWithField(User,SourceItem,TargetPos,Counter,param)
    local Field=world:getField(TargetPos)
    User:inform("This field has the ID: "..Field:tile());
end

function ChangeRankpoints(User,modifier,value,faction,radius)
	--check if the points shall be added or removed
	if modifier == "add" then
		text = "Added";
	elseif modifier == "sub" then
		text = "Removed";
		value = -value;
	else
		return;
	end
	
	if radius == nil then
		radius = 5;
	end
	
	player_list=world:getPlayersInRangeOf(User.pos, radius);
	if player_list[1]~=nil then
		for i, player in pairs(player_list) do
			Factionvalues = base.factions.getFaction(player_list[i]);
			if faction == nil then
				setRankpoints(player_list[i], Factionvalues.rankpoints+value);
				User:inform(text.." "..value.." rankpoints for ALL characters within "..radius.." tiles.");
			elseif Factionvalues.tid == faction then
				setRankpoints(player_list[i], Factionvalues.rankpoints+value);
				User:inform(text.." "..value.." rankpoints for characters who belong to "..base.factions.getTownNameByID(faction).." within "..radius.." tiles.");
			end	
		end

	end	
end

function Init()
	if InitDone then
		return;
	end
	InitDone = 1;
end
