-- UPDATE common SET com_script='gm.items.id_382_ceilingtrowel' WHERE com_itemid IN (382);

require("gm.base.log")
require("base.factions")
require("base.common")

module("gm.items.id_382_ceilingtrowel", package.seeall, package.seeall(gm.base.log))

function UseItemWithCharacter(User,SourceItem,TargetCharacter,Counter,Param)
	Init();
	if SourceItem.data==2 then --faction system trowel  
		if (string.find(User.lastSpokenText,"addpoints")~=nil or string.find(User.lastSpokenText,"removepoints")~=nil) then --add rankpoints to TargetChar
            a,b,value = string.find(User.lastSpokenText,"(%d+)");
            value=value+1-1;
			if (value<101 and value>-1) then	    	
				--changes the rankpoints
				local CheckTown = CheckTownTrigger(User);
				if CheckTown > 0 then
					
					if (string.find(User.lastSpokenText,"removepoints")~=nil) then value = -value; end
					
					Factionvalues = base.factions.get(TargetCharacter); --get rankpoints
						
					Factionvalues[ base.factions.rp_index(CheckTown)]=
					     		Factionvalues[ base.factions.rp_index(CheckTown) ] +value; --add or remove rankpoints
							
					base.factions.put(TargetCharacter,Factionvalues); --save rankpoints
				--	LogGMAction(User,User.name.."("..User.id..") added "..value.." Rankpoints for "..TownNameGList[CheckTown][1].." to the Player"..TargetCharacter.name.."("..TargetCharacter.id..")");
			    	User:inform("[Faction]: Added "..value.." rankpoints to "..TownNameGList[CheckTown][1].." to the Player "..TargetCharacter.name);
				end
            else
                User:inform("[Faction]: Failed adding rankpoints: rankpoint range can be 0-100")
			end
			
    	elseif (string.find(User.lastSpokenText,"settown")~=nil) then --set hometown of TargetChar
				
				local CheckTown = CheckTownTrigger(User);
				if CheckTown > 0 then
					Factionvalues = base.factions.get(TargetCharacter); --get Factionvalues
				    Factionvalues.tid = CheckTown;
				    base.factions.put(TargetCharacter,Factionvalues); --save changes
				
				--	LogGMAction(User,User.name.."("..User.id..") made "..TargetCharacter.name.."("..TargetCharacter.id..") member of the Town "..TownNameGList[CheckTown][1]);
					User:inform("[Faction]: "..TargetCharacter.name.." is now member of "..TownNameGList[CheckTown][1]);
				end
    	elseif (string.find(User.lastSpokenText,"setrank")~=nil) then --set rank of TargetChar
            a,b,value = string.find(User.lastSpokenText,"(%d+)");
            value=value+1-1;
			if (value<10 and value>-1) then
				local CheckTown = CheckTownTrigger(User);
				if CheckTown > 0 then
					Factionvalues = base.factions.get(TargetCharacter); --get Rank
					Factionvalues[base.factions.r_index(CheckTown)] = value; --set rank to value
					Factionvalues = base.factions.put(TargetCharacter,Factionvalues); --write faction values
					User:inform("[Faction]: "..TargetCharacter.name.." has now the rank "..value.." in "..TownNameGList[CheckTown][1]);
				
				--	LogGMAction(User,User.name.."("..User.id..") set the rank of "..TargetCharacter.name.."("..TargetCharacter.id..") to "..value.." in "..TownNameGList[CheckTown][1]);		
				end
			else
                User:inform("[Faction]: Failed changing rank: town rank can be 0-9")
			end	
    	elseif (string.find(User.lastSpokenText,"setguild")~=nil) then --set rank of TargetChar in Guild
			a,b,guildid,value=string.find(User.lastSpokenText,"(%d+) (%d+)");
			guildid = guildid+1-1; value = value+1-1;
			if (guildid<11 or guildid>99) then User:inform("[Faction]: Failed changing guild rank: guildid out of range, 11-99 only"); return; end
			
			if (value<3 and value >-1) then
				Factionvalues = base.factions.get(TargetCharacter);
				Factionvalues.gid = guildid;
				Factionvalues.rankGuild = value;
				Factionvalues = base.factions.put(TargetCharacter,Factionvalues); --write faction values
				
				User:inform("[Faction]: "..TargetCharacter.name.." has now the rank "..value.." in the Guild "..GuildNameGList[guildid][1].."(ID: "..guildid..")");
					
			--	LogGMAction(User,User.name.."("..User.id..") made "..TargetCharacter.name.."("..TargetCharacter.id..") member of the Guild with the ID"..guildid.." and Rank"..value);		
			else
                User:inform("[Faction]: Failed changing Guild rank: town rank can be 0-2")
			end			
		else
			-- print some infos
			local info = base.factions.getFaction(TargetCharacter);
			local townName = "None";
			if info.tid == 1 then
				townName = "Cadomyr";
			elseif info.tid == 2 then
				townName = "Runewick";
			elseif info.tid == 3 then
				townName = "Galmair";
			end
			local txt = "[Faction]: "..TargetCharacter.name.." is member of ".. townName .." (".. info.tid .."); He changed his hometown ".. info.towncnt .." times; Rank C/R/G: ".. info.rankC .."/".. info.rankR .."/".. info.rankG;
			User:inform(txt);

		end
	else
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
	end
end

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
			Page[0] = "[Faction]: To look through the commands say 'help X' where X can a number from 1 to 8 and use this Item again."
			Page[1] = "[Faction]: Set rank in faction: \"setrank <townname> <townrank>\" - range of townrank: 0(outcast) - 9(sovereign) ";
			Page[2] = "[Faction]: Set hometown: \"settown <townname>\"";
			Page[3] = "[Faction]: Add rankpoints for a Char in a town: \"addpoints <townname> <value>\" - range of value: 0 - 100";
			Page[4] = "[Faction]: Remove rankpoints for the Char in a town: \"removepoints <townname> <value>\" - range of value: 0 - 100";
			
			Page[5] = "[Faction]: Set the radius of influence of this trowel when adding or removing rankpoints: \"setradius <value>\" - range of value: 0 - 100, default: 5";
			Page[6] = "[Faction]: If you \"use\" the item without targeting a character with the command addpoints or removepoints...";
			Page[7] = "[Faction]: ...for ALL characters within a radius of the choosen radius the rankpoints get added or removed!";
			Page[8] = "[Faction]: Set the guild: \"setguild <guildid> <guildrank>\" - range of guildrank: 0 - 2"
            
			if value then
				value = value *1;
				if value <= 8 then
					User:inform(Page[value]);
				else
					User:inform("[Faction]: This documentation has only 8 pages!");
				end
			else
				User:inform(Page[0]);
        	end
			
		elseif (string.find(User.lastSpokenText,"setradius (%d+)")~=nil) then
			local a,b, radius = string.find(User.lastSpokenText,"setradius (%d+)");
			if (radius~=nil and radius>-1 and radius <101) then
				radius=radius+1-1;
				User:inform("[Faction]: Radius set on value"..radius)
			else
				User:inform("[Faction]: Invalid radius value, only numbers from 0 to 100 allowed!")
			end
				
		elseif (string.find(User.lastSpokenText,"addpoints (%d+)")~=nil) then --add rankpoints within a radius Counter
				a,b,value = string.find(User.lastSpokenText,"addpoints (%d+)");
				value=value+1-1;
				if (value<101 and value>-1) then
				   	if radius == nil then
				   		radius=5;
				    	ChangeRankpoints(User,radius,true, value);
					end
				else
					User:inform("[Faction]: Failed adding rankpoints: max. 100 rankpoints")
				end
				
		elseif (string.find(User.lastSpokenText,"removepoints (%d+)")~=nil) then --remove rankpoints within a radius Counter
			a,b,value = string.find(User.lastSpokenText,"removepoints (%d+)");
			value=value+1-1;
			if (value<101 and value>-1) then
				if radius == nil then
			   		radius=5;
			   		ChangeRankpoints(User,radius,false, value);
			   	end
			else
				User:inform("[Faction]: Failed removing rankpoints: You can only remove 1-100 rankpoints")
			end
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
		base.lookat.SetSpecialDescription(Item, "Mögliche Aktionen: ", "Possible actions: ");
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

function ChangeRankpoints(User, Counter, Increase,value)
	--check if the points shall be added or removed
	if Increase then
		text = "added";
	else
		text = "removed";
		value = -value;
	end
	
	--changes the rankpoints
	local CheckTown = CheckTownTrigger(User);
	
	if CheckTown > 0 then
		player_list=world:getPlayersInRangeOf(User.pos, Counter);
		if player_list[1]~=nil then
			 for i, player in pairs(player_list) do
			    Factionvalues = base.factions.get(player_list[i]); --get rankpoints
				
				Factionvalues[ base.factions.rp_index(CheckTown) ]=
		     		Factionvalues[ base.factions.rp_index(CheckTown) ] +value; --add or remove rankpoints
				
				base.factions.put(player_list[i],Factionvalues); --save rankpoints
		--		LogGMAction(User,User.name.."("..User.id..")"..text.." "..value.." Rankpoints for "..TownNameGList[CheckTown][1].." to the Player"..player_list[i].name.."("..player_list[i].id..")");
			 end
        	User:inform("Added "..value.." rankpoints to "..TownNameGList[CheckTown][1].." for the characters within "..Counter.." radius.");
	    end
	end
	
end


function CheckTownTrigger(User)
	if (string.find(string.lower(User.lastSpokenText), string.lower(TownNameGList[1][1]))~=nil) then  --cadomyr?
		return 1;
	elseif (string.find(string.lower(User.lastSpokenText),string.lower(TownNameGList[2][1]) )~=nil) then --runewick?
	    return 2;
	elseif (string.find(string.lower(User.lastSpokenText),string.lower(TownNameGList[3][1]) )~=nil) then --galmair?
	    return 3;
	end
	return 0; --no townname
end

function Init()
	if InitDone then
		return;
	end
	InitDone = 1;
	-- init faction variables
	TownNameGList = base.factions.TownNameGList;
end
