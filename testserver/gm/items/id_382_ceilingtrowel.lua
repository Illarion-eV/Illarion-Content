-- UPDATE common SET com_script='gm.items.id_382_ceilingtrowel' WHERE com_itemid IN (382);

require("gm.base.log")
require("base.factions")
require("base.common")
require("npc.base.guards_static");

module("gm.items.id_382_ceilingtrowel", package.seeall, package.seeall(gm.base.log))


function UseItem(User,SourceItem,TargetItem,Counter,Param)

	Init();
  
  -- First check for mode change
  if (string.find(User.lastSpokenText, "setmode")~=nil) then
    local modes = {"items", "weather", "factions"}
    local cbSetMode = function (dialog)
      if (not dialog:getSuccess()) then
        return;
      end
      SourceItem:setData("mode", modes[dialog:getSelectedIndex()+1]);
      world:changeItem(SourceItem);
    end
    local sd = SelectionDialog("Set mode of this ceiling trowel", "To which mode you want to change?", cbSetMode);
    for _,m in ipairs(modes) do 
      sd:addOption(0,m);
    end
    User:requestSelectionDialog(sd);
    return;
  end
  
  if (string.find(User.lastSpokenText, "help")) then
    User:inform("To change the mode of this trowel, say \"setmode\" and use it.");
  end
	
	local TargetItem = base.common.GetTargetItem(User, SourceItem);
	if not TargetItem then
		TargetItem = base.common.GetFrontItem(User);
	end
	
  if (TargetItem and TargetItem.id~=0) then

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
    end
  end
  if ((string.find(User.lastSpokenText,"show map")~=nil)) then
    User:inform("Okay, now showing map");
    for i=1, 200 do
      newx=math.random(0,1024);
      newy=math.random(0,1024);
      User:warp(position(newx,newy,0));
    end
  end
  if (SourceItem:getData("mode")=="weather") then
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
  elseif (SourceItem:getData("mode")=="factions") then  --faction system
    local cbFaction = function (dialog)
      if (not dialog:getSuccess()) then
        return;
      end
      local ind = dialog:getSelectedIndex();
      if (ind == 0) then -- get/set for specific player
        local playersTmp = world:getPlayersInRangeOf(User.pos, 2);
        local players = {User};
        for _,player in pairs(playersTmp) do 
          if (player.id ~= User.id) then 
            table.insert(players, player);
          end
        end
        local cbChoosePlayer = function (dialog)
          if (not dialog:getSuccess()) then
            return;
          end
          local chosenPlayer = players[dialog:getSelectedIndex()+1];
          local faction = base.factions.getFaction(chosenPlayer);
          local cbSetFactionValue = function (dialog)
            if (not dialog:getSuccess()) then
              return;
            end
            local ind = dialog:getSelectedIndex();
            if (ind < 4) then
              faction.tid = ind;
			  faction.rankpoints = 0;
              base.factions.setFaction(chosenPlayer, faction);
            elseif (ind == 4) then
              local cbSetCount = function (dialog)
                if (not dialog:getSuccess()) then
                  return;
                end
                local countValue, okay = String2Number(dialog:getInput());
                if (not okay) then
                  User:inform("no number");
                  return;
                end
                faction.towncnt = countValue;
                base.factions.setFaction(chosenPlayer, faction);
              end
              User:requestInputDialog(InputDialog("Set town count", "", false, 255, cbSetCount));
            elseif (ind == 5) then
              local cbSetRank = function (dialog)
                if (not dialog:getSuccess()) then
                  return;
                end
                local rankpoints, okay = String2Number(dialog:getInput());
                if (not okay) then
                  User:inform("no number");
                  return;
                end
				if rankpoints < base.factions.getRankpoints(chosenPlayer) then
					playerText = {"sinkt.","decline"};
				else
					playerText = {"steigt.","advance"};
				end
				if base.factions.getMembership(chosenPlayer) > 0 and base.factions.getMembership(chosenPlayer) < 4 then
					base.factions.setRankpoints(chosenPlayer, rankpoints);
					informPlayerAboutRankpointchange(chosenPlayer, playerText);
				else
					return;
				end
              end
              User:requestInputDialog(InputDialog("Set rank points", "Every 100 points there is a new rank.\nE.g. 300-399 points is rank 4.\nThere are 10 ranks plus the leader.", false, 255, cbSetRank));
            end
          end
          local infoText = "Town: " .. base.factions.getMembershipByName(chosenPlayer);
          infoText = infoText .. "\nChanged towns already (town count): " .. faction.towncnt;
          if (base.factions.townRanks[faction.tid] ~= nil and base.factions.townRanks[faction.tid][faction.rankTown] ~= nil) then
            infoText = infoText .. "\nRank: " .. base.factions.townRanks[faction.tid][faction.rankTown].eRank .. "/" .. base.factions.townRanks[faction.tid][faction.rankTown].gRank;
          else
            infoText = infoText .. "\nRank: no rank " .. faction.rankTown;
          end
          infoText = infoText .. "\nExact rank points: " .. faction.rankpoints;
          local sd = SelectionDialog("Set faction value", infoText, cbSetFactionValue);
          sd:addOption(0, "Change town to None");
          sd:addOption(0, "Change town to Cadomyr");
          sd:addOption(0, "Change town to Runewick");
          sd:addOption(0, "Change town to Galmair");
          sd:addOption(0, "Change town count");
          sd:addOption(0, "Change rank points");
          User:requestSelectionDialog(sd);
        end 
        local sd = SelectionDialog("Get/Set faction values for ...", "First choose a player:", cbChoosePlayer);
        local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
          local race = math.min(player:getRace()+1, table.getn(raceNames));
          sd:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
        User:requestSelectionDialog(sd);
      elseif (ind == 1) then -- rankpoints in radius
        local cbRadius = function (dialog)
          if (not dialog:getSuccess()) then
            return;
          end
          local inputString = dialog:getInput();
		  if (string.find(inputString,"(%a+) (%d+) (%d+) (%d+)") ~= nil) then
            a, b, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+) (%d+) (%d+)");
            value=tonumber(value);
			faction=tonumber(faction)
			radius=tonumber(radius);
            ChangeRankpoints(User,modifier,value,faction,radius);
		  elseif (string.find(inputString,"(%a+) (%d+) (%d+)") ~= nil) then
            a, b, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+) (%d+)");
			faction=tonumber(faction)
            value=tonumber(value);
            ChangeRankpoints(User,modifier,value,faction,radius);
		  elseif (string.find(inputString,"(%a+) (%d+)") ~= nil) then
            a, b, modifier,value,faction,radius = string.find(inputString,"(%a+) (%d+)");
            value=tonumber(value);
            ChangeRankpoints(User,modifier,value,faction,radius);
          else
            User:inform("Sorry, I didn't understand you.");
            User:requestInputDialog(InputDialog("Add/Subtract rankpoints in radius", "Usage: <modifier> <value> <faction> <radius>\nPossible values:\nmodifier: <add|sub> \nfaction: <1|2|3|99|nil> (= cadomyr|runewick|galmair|all|all)\nradius: <1|2|...|nil> (nil means default: 5)", false, 255, cbRadius));
          end
        end
        User:requestInputDialog(InputDialog("Add/Subtract rankpoints in radius", "Usage: <modifier> <value> <faction> <radius>\nPossible values:\nmodifier: <add|sub> \nfaction: <1|2|3|99|nil> (= cadomyr|runewick|galmair|all|all)\nradius: <1|2|...|nil> (nil means default: 5)", false, 255, cbRadius));
      elseif (ind == 2) then -- guard modes
        local factionIds = {0,1,2,3};
        local cbFirstFaction = function (dialog)
          if (not dialog:getSuccess()) then
            return;
          end
          local firstFaction = factionIds[dialog:getSelectedIndex()+1];
          local guards = npc.base.guards_static;
          local modeStrings = {};
          modeStrings[guards.ACTION_NONE] = "none";
          modeStrings[guards.ACTION_PASSIVE] = "passive";
          modeStrings[guards.ACTION_HOSTILE] = "hostile";
          modeStrings[guards.ACTION_AGGRESSIVE] = "aggressive";
          local modeValues = {guards.ACTION_NONE, guards.ACTION_PASSIVE, guards.ACTION_HOSTILE, guards.ACTION_AGGRESSIVE};
          local cbSecondFaction = function (dialog)
            if (not dialog:getSuccess()) then
              return;
            end
            local secondFaction = factionIds[dialog:getSelectedIndex()+1];
            local cbSetMode = function (dialog)
              if (not dialog:getSuccess()) then
                return;
              end
              local mode = modeValues[dialog:getSelectedIndex()+1];
              guards.SetMode(firstFaction, secondFaction, mode);
            end
            local sd = SelectionDialog("Set guard modes", "Set guard modes of " .. base.factions.getTownNameByID(firstFaction) .. " with respect to " .. base.factions.getTownNameByID(secondFaction) .. " to ...", cbSetMode);
            for _,m in ipairs(modeValues) do 
              sd:addOption(0,modeStrings[m]);
            end
            User:requestSelectionDialog(sd);
          end
          local sd = SelectionDialog("Guard modes", "Set guard modes of " .. base.factions.getTownNameByID(firstFaction) .. " with respect to ...", cbSecondFaction);
          for _,f in ipairs(factionIds) do 
            sd:addOption(0,base.factions.getTownNameByID(f) .. ": " .. modeStrings[guards.GetModeByFaction(firstFaction, f)]);
          end
          User:requestSelectionDialog(sd);
        end
        local sd = SelectionDialog("Get/Set guard modes", "For which faction do you want to get/set values?", cbFirstFaction);
        for _,f in ipairs(factionIds) do 
          sd:addOption(0,base.factions.getTownNameByID(f));
        end
        User:requestSelectionDialog(sd);
      end
    end
    local sd = SelectionDialog("What do you want to do about factions?", "", cbFaction);
    sd:addOption(0,"Get/Set faction values for ...");
    sd:addOption(0,"Add/Subtract rankpoints in radius");
    sd:addOption(0,"Get/Set guard modes");
    User:requestSelectionDialog(sd);
  end
end


function LookAtItem(User,Item)

    if (Item:getData("mode")=="items") then
		base.lookat.SetSpecialName(Item, "Kelle (Items)","Kelle (Items)")
		base.lookat.SetSpecialDescription(Item, "Mögliche Aktionen: setdata <key> <value>, setqual <value>, setwaer <value>, setnumber <value>, field, count <value>", "Possible actions:  setdata <key> <value>, setqual <value>, setwaer <value>, setnumber <value>, field, count <value>");
    elseif (Item:getData("mode")=="weather") then
        base.lookat.SetSpecialName(Item, "Kelle (Wetter)","Kelle (Weather)");
		base.lookat.SetSpecialDescription(Item, "Mögliche Aktionen: help, clouds <value>, fog <value>, wind <value>, gust <value>, per <value>, thunder <value>, temp <value>", "Possible actions: help, clouds <value>, fog <value>, wind <value>, gust <value>, per <value>, thunder <value>, temp <value> ");
	elseif (Item:getData("mode")=="factions") then
        base.lookat.SetSpecialName(Item, "Kelle (Fraktionen)", "Kelle (Factions)");
		base.lookat.SetSpecialDescription(Item, "Ändert Werte des Fraktionssystems. Benutze die Kelle.", "Changes values of the faction system. Use the trowel.");
	else
		base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setmode' und benutzt die Kelle.", "To set a mode type 'setmode' and use the trowel.");
        base.lookat.SetSpecialName(Item, "Kelle", "Kelle");
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
end

function UseItemWithField(User,SourceItem,TargetPos,Counter,param)
    local Field=world:getField(TargetPos)
    User:inform("This field has the ID: "..Field:tile());
end

function ChangeRankpoints(User,modifier,value,faction,radius)
	--check if the points shall be added or removed
	if modifier == "add" then
		text = "added";
		playerText = {"steigt.","advance"};
	elseif modifier == "sub" then
		text = "removed";
		playerText = {"sinkt.","decline"};
		value = -value;
	else
		return;
	end
	
	if radius == nil then
		radius = 5;
	end
	
	player_list=world:getPlayersInRangeOf(User.pos, radius);
	if player_list[1]~=nil then
		for i=1, #(player_list) do
			Factionvalues = base.factions.getFaction(player_list[i]);
			if faction == nil or faction == 99 then
				base.factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value);
				informPlayerAboutRankpointchange(player_list[i], playerText);
			elseif tonumber(faction) == tonumber(Factionvalues.tid) then
				base.factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value);
				informPlayerAboutRankpointchange(player_list[i], playerText);
			else
				return;
			end	

		end
	end	
	User:inform("You just "..text.." "..value.." rankpoints.");
end

function informPlayerAboutRankpointchange(User, modifierTextarray)
	local faction = base.factions.getMembership(User);
	local factionLeadersDE = {"Königin Rosaline Edwards", "Erzmagier Elvaine Morgan", "Don Valerio Guilianni"};
	local factionLeadersEN = {"Queen Rosaline Edwards", "Archmage Elvaine Morgan", "Don Valerio Guilianni"};

	base.common.InformNLS(User, "Dein Ansehen bei "..factionLeadersDE[faction].." "..modifierTextarray[1], "You "..modifierTextarray[2].." in "..factionLeadersEN[faction].."'s favour.");
end

function Init()
	if InitDone then
		return;
	end
	InitDone = 1;
end

function String2Number(str)
	if (string.find(str, "(%d+)") ~= nil) then
    local _,_,num = string.find(str, "(%d+)");
    if (num~="") then
      num = tonumber(num);
      return num, true;
    end
  end
	return 0, false;
end