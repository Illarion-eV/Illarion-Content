-- UPDATE common SET com_script='gm.items.id_382_ceilingtrowel' WHERE com_itemid IN (382);

require("gm.base.log")
require("base.factions")
require("base.common")
require("npc.base.guards_static")
require("base.licence")
require("scheduled.alchemy")
module("gm.items.id_382_ceilingtrowel", package.seeall, package.seeall(gm.base.log))


function UseItem(User, SourceItem)

	Init();
  
  -- First check for mode change
  if (string.find(User.lastSpokenText, "setmode")~=nil) then
    local modes = {"items", "weather", "factions","Spawnpoint"}
	SourceItem:setData("monsters", "1")
	SourceItem:setData("intervals", "1")
	SourceItem:setData("endurance", "1")
	SourceItem:setData("gfxId", "0")
	SourceItem:setData("sfxId", "0")
	world:changeItem(SourceItem);
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
	
  --[[
  Change items
  ]]
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
    UseItemWithField(User, SourceItem, User.pos);
  end
  if (string.find(User.lastSpokenText,"count (%d+)")~=nil) then
    a,b,countID=string.find(User.lastSpokenText,"count (%d+)");
    countID = countID+1-1;
    User:inform("User:countItem("..countID..") = "..User:countItem(countID));
    User:inform("User:countItemAt(\"all\", "..countID..") = "..User:countItemAt("all",countID));
    User:inform("User:countItemAt(\"belt\", "..countID..") = "..User:countItemAt("belt",countID));
    User:inform("User:countItemAt(\"body\", "..countID..") = "..User:countItemAt("body",countID));
    User:inform("User:countItemAt(\"backpack\", "..countID..") = "..User:countItemAt("backpack",countID));
    User:inform("User:countItemAt(\"all\", "..countID..", 0) = "..User:countItemAt("all",countID));
    User:inform("User:countItemAt(\"belt\", "..countID..", 0) = "..User:countItemAt("belt",countID));
    User:inform("User:countItemAt(\"body\", "..countID..", 0) = "..User:countItemAt("body",countID));
    User:inform("User:countItemAt(\"backpack\", "..countID..", 0) = "..User:countItemAt("backpack",countID));
    local Bag = User:getBackPack();
    User:inform("Bag:countItem("..countID..") = "..Bag:countItem(countID));
    User:inform("Bag:countItem("..countID..", 0) = "..Bag:countItem(countID));
  end
  if ((string.find(User.lastSpokenText,"show map")~=nil)) then
    User:inform("Okay, now showing map");
    for i=1, 200 do
      newx=math.random(0,1024);
      newy=math.random(0,1024);
      User:warp(position(newx,newy,0));
    end
  end
  
  --[[
  Lets change some weather
  ]]  
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


  --[[
  All the faction stuff
  ]]
  elseif (SourceItem:getData("mode")=="factions") then  --faction system
    local cbFaction = function (dialog)
      if (not dialog:getSuccess()) then
        return;
      end
      local ind = dialog:getSelectedIndex();
      if (ind == 0) then -- get/set for specific player
        local playersTmp = world:getPlayersInRangeOf(User.pos, 10);
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
			
			--change town
            if (ind < 4) then
              faction.tid = ind;
			  faction.rankpoints = 0;
              base.factions.setFaction(chosenPlayer, faction);
			
			--change towncount
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
			  
			--change the rankpoints
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
				if base.factions.getMembership(chosenPlayer) > 0 and base.factions.getMembership(chosenPlayer) < 4 then
					base.factions.setRankpoints(chosenPlayer, rankpoints);
				else
					User:inform("Player does not belong to any faction. Rankpoints not changed.");
				end
              end
              User:requestInputDialog(InputDialog("Set rankpoints", "Every 100 points there is a new rank.\nE.g. 300-399 points is rank 4.\nThere are 7 normal and 3 special ranks plus the leader.", false, 255, cbSetRank));

			--change special rank
			elseif (ind == 6) then
				local cbSetSpecialRank = function (dialog)
					if (not dialog:getSuccess()) then
						return;
					end
					local success;
					local index = dialog:getSelectedIndex();
					if index == 0 then -- demoting
						success = base.factions.setSpecialRank(chosenPlayer, 0);
					else -- promoting
						success = base.factions.setSpecialRank(chosenPlayer, base.factions.highestRank+tonumber(index));						
					end
					
					if success == false and base.factions.getRankpoints(chosenPlayer) < (base.factions.highestRank-1)*100 then
						User:inform("Rangchange failed. Player has not enough rankpoints. Current rankpoints: "..base.factions.getRankpoints(chosenPlayer));
					elseif success == true then
						User:inform("Rankchange for "..chosenPlayer.name.." successful.");
					else
						User:inform("Rangchange failed for unknown reasons. Please inform a developer.");
					end
				end	

				local infoText = ""
				local sd = SelectionDialog("Special rank", infoText, cbSetSpecialRank);
				sd:addOption(0, "Demote");
				sd:addOption(0, "Promote to "..base.factions.getRankName(chosenPlayer, 8));
				sd:addOption(0, "Promote to "..base.factions.getRankName(chosenPlayer, 9));
				sd:addOption(0, "Promote to "..base.factions.getRankName(chosenPlayer, 10));
				User:requestSelectionDialog(sd);	
			end
          end
		  
		  --general faction part
          local infoText = "Town: " .. base.factions.getMembershipByName(chosenPlayer);
          infoText = infoText .. "\nChanged towns already (town count): " .. faction.towncnt;
          if (base.factions.townRanks[faction.tid] ~= nil and base.factions.townRanks[faction.tid][faction.rankTown] ~= nil) then
			local germanRank, englishRank = base.factions.getRank(chosenPlayer, true)
            infoText = infoText .. "\nRank: " .. englishRank .. "/" .. germanRank;
          else
            infoText = infoText .. "\nRank: no rank " .. faction.rankTown;
          end
          infoText = infoText .. "\nExact rankpoints: " .. faction.rankpoints;
		  infoText = infoText .. guardInfo(chosenPlayer)
		  local sd = SelectionDialog("Set faction value", infoText, cbSetFactionValue);
          sd:addOption(0, "Change town to None");
          sd:addOption(0, "Change town to Cadomyr");
          sd:addOption(0, "Change town to Runewick");
          sd:addOption(0, "Change town to Galmair");
          sd:addOption(0, "Change town count");
          sd:addOption(0, "Change rankpoints");
		  sd:addOption(0, "Change special rank");
          User:requestSelectionDialog(sd);
        end 
		
		--general playerchoosing part
        local sd = SelectionDialog("Get/Set faction values for ...", "First choose a player:", cbChoosePlayer);
        local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
          local race = math.min(player:getRace()+1, table.getn(raceNames));
          sd:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
        User:requestSelectionDialog(sd);
		
	  -- rankpoints in radius
      elseif (ind == 1) then 
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
debug("modifier"..modifier)
debug("value"..value)
debug("faction"..faction)
debug("radius"..radius)
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


	  -- guard modes
	  elseif (ind == 2) then 
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


	  -- licence
	elseif (ind == 3) then
        local factionIds = {0,1,2,3};
        local cbFirstLicence = function (dialog)
          if (not dialog:getSuccess()) then
            return;
          end
          local FirstLicence = factionIds[dialog:getSelectedIndex()+1];
          local licence = base.licence;
          local licenceStrings = {};
          licenceStrings[licence.PERMISSION_NONE] = "Permission for static tools is restricted";
          licenceStrings[licence.PERMISSION_ACTIVE] = "Permission for static tools is granted";
          local licenceValues = {licence.PERMISSION_NONE, licence.PERMISSION_ACTIVE};
          local cbSecondLicence = function (dialog)
            if (not dialog:getSuccess()) then
              return;
            end
            local SecondLicence = factionIds[dialog:getSelectedIndex()+1];
            local cbSetLicence = function (dialog)
              if (not dialog:getSuccess()) then
                return;
              end
              local newLicence = licenceValues[dialog:getSelectedIndex()+1];
              licence.SetLicence(FirstLicence, SecondLicence, newLicence); 
            end
            local sd = SelectionDialog("Set licence", "Set licence of " .. base.factions.getTownNameByID(FirstLicence) .. " with respect to " .. base.factions.getTownNameByID(SecondLicence) .. " to ...", cbSetLicence);
            for _,m in ipairs(licenceValues) do 
              sd:addOption(0,licenceStrings[m]);
            end
            User:requestSelectionDialog(sd);
          end
          local sd = SelectionDialog("Licence", "Set licence of " .. base.factions.getTownNameByID(FirstLicence) .. " with respect to ...", cbSecondLicence);
          for _,f in ipairs(factionIds) do 
            sd:addOption(0,base.factions.getTownNameByID(f) .. ": " .. licenceStrings[licence.GetLicenceByFaction(FirstLicence, f)]); 
          end
          User:requestSelectionDialog(sd);
        end
        local sd = SelectionDialog("Get/Set licence", "For which faction do you want to get/set values?", cbFirstLicence);
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
    sd:addOption(0,"Get/Set licence");
    User:requestSelectionDialog(sd);
  
  
  --Spawnpoint mode
  
  elseif (SourceItem:getData("mode")=="Spawnpoint") then
	
		if (string.find(User.lastSpokenText, "setspawn")~=nil) then
		local modes = {"Monster", "Intervals per spawn", "Time","Effects","Start/Stop"}
		local cbSetMode = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			SourceItem:setData("spawnmode", modes[dialog:getSelectedIndex()+1]);
			world:changeItem(SourceItem);
		end
		local sd = SelectionDialog("Set the mode of this Spawnpoint.", "To which mode do you want to change it?", cbSetMode);
		for _,m in ipairs(modes) do 
			sd:addOption(0,m);
		end
		User:requestSelectionDialog(sd);
		return;
	end
	
	local endurance;
	local intervals;
	local gfxId;
	local sfxId;
	local sp = scheduled.alchemy;
	
	-- If input contains numbers, sets input to Data "monsters"
	
	if (SourceItem:getData("spawnmode")=="Monster") then
	
		local cbInputDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
		local inputString = dialog:getInput();
	
			if (string.find(inputString,"(%d+)") ~= nil) then
				
				SourceItem:setData("monsters", inputString);
				world:changeItem(SourceItem);
				
			else
				User:inform("Enter MonsterID");
				
			end
		end
			
			
		User:requestInputDialog(InputDialog("Enter Monster IDs.", "Usage: Enter the IDs of the monsters." ,false, 255, cbInputDialog))
		
	elseif (SourceItem:getData("spawnmode")=="Intervals per spawn") then
		
		--Write down how many Mobs shall spawn per Minute
		-- If input contains number, sets input to Data "intervals"
		
		
				
		local cbInputDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local input = dialog:getInput();

			if (string.find(input,"(%d+)") ~= nil) then
				a, b, intervals = string.find(input,"(%d+)")
				intervals = intervals
				
				SourceItem:setData("intervals", intervals);
				world:changeItem(SourceItem);
			end
				
		end
		User:requestInputDialog(InputDialog("Set number of Intervals.", "Usage: Set numer of 10 second intervals per Spawn." ,false, 255, cbInputDialog))
		
	
	elseif (SourceItem:getData("spawnmode")=="Time") then
		
		-- If input contains number, sets input to Data "endurance"
		
		
		
		local cbInputDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local input = dialog:getInput();

			if (string.find(input,"(%d+)") ~= nil) then
				a, b, endurance = string.find(input,"(%d+)")
				endurance = endurance
				
				SourceItem:setData("endurance", input);
				world:changeItem(SourceItem);
			end
				
		end
		User:requestInputDialog(InputDialog("Set how long the spawn shall take place.", "Usage: Set the ammounts of total Intervals." ,false, 255, cbInputDialog))
		
	elseif (SourceItem:getData("spawnmode")=="Effects") then
		
		-- If input contains number, sets input to Data "endurance"
		
		
		
		local cbInputDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local input = dialog:getInput();

			if (string.find(input,"(%d+) (%d+)") ~= nil) then
				a, b, gfxId, sfxId = string.find(input,"(%d+) (%d+)")
				
				gfxId = tonumber(gfxId);
				sfxId = tonumber(sfxId);
				
				SourceItem:setData("sfxId", sfxId);
				SourceItem:setData("gfxId", gfxId);
				world:changeItem(SourceItem);			
	

			elseif (string.find(input,"(%d+)") ~= nil) then
				a, b, gfxId = string.find(input,"(%d+)")
				
				
				SourceItem:setData("gfxId", input);
				world:changeItem(SourceItem);
				

			
			
			end
				
		end
		User:requestInputDialog(InputDialog("Set the graphic and sound appearing at spawn", "Usage: Enter a gfxId [sfxId]" ,false, 255, cbInputDialog))	
	
	
	
	
	elseif (SourceItem:getData("spawnmode")=="Start/Stop") then
	
		
		--checks if item is on the ground
		
		
		
			--checks to see Datas are not nil and worst case set them 1
			
			if (SourceItem:getData("monsters") == "") then
				SourceItem:setData("monsters", "1")
				world:changeItem(SourceItem);
			end
		
			if SourceItem:getData("intervals") == "" then
				SourceItem:setData("intervals", "1")
				world:changeItem(SourceItem);
			end
		
			if SourceItem:getData("endurance") == "" then
				SourceItem:setData("endurance", "1")
				world:changeItem(SourceItem);
			end
			
			if SourceItem:getData("gfxId") == "" then
				SourceItem:setData("gfxId", "0")
				world:changeItem(SourceItem);
			end
			
			if SourceItem:getData("sfxId") == "" then
				SourceItem:setData("sfxId", "0")
				world:changeItem(SourceItem);
			end

			
			intervals = tostring(SourceItem:getData("intervals"))
			endurance = tostring(SourceItem:getData("endurance"))
			gfxId = tostring(SourceItem:getData("gfxId"))
			sfxId = tostring(SourceItem:getData("sfxId"))
			--convert monster string into an array of monsters
			
			local monsters = tostring(SourceItem:getData("monsters"))
			local counter = 0;
			local fin = 1;
			local monsterId;
			local monsterIds = {};
			
			
			while fin <= string.len(monsters) do
		
				if (string.find(monsters,"(%d+)",fin) ~= nil) then
				
					a, b, monsterId = string.find(monsters,"(%d+)",fin)
					fin = b + 1;
					counter = counter +1;
					monsterIds[counter]	= tonumber(monsterId)
					
				else
					User:inform("Enter MonsterID");
					fin = string.len(inputNumber);
			
				end
			end
			
				
			
			--set position			
			local spawnPos = base.common.GetFrontPosition(User);
			
			--create arrays of informations
			local spawnInfo = {spawnPos, monsterIds, intervals, endurance, 0, 0, gfxId, sfxId}
			local found = false
			
			--checks for position in SPAWNDATAS
			
						
			for i=1,#sp.SPAWNDATAS do
				if sp.SPAWNDATAS[i][1] == spawnPos then
					found = true
					
					if sp.SPAWNDATAS[i][5] == 0 then
						spawnInfo[5] = 1;
						world:changeItem(SourceItem);
						sp.SPAWNDATAS[i] = spawnInfo;
						User:inform("Turned Spawnpoint on");
					else
						sp.SPAWNDATAS[i][5] = 0;
						world:changeItem(SourceItem);
						User:inform("Turned Spawnpoint Off");
					end
					--testing from here
					if sp.SPAWNDATAS[i][4] == nil then
					
					User:inform("da steht nichts")
					
					end
					--testing end
				end
			end
			
			--writes a new entry in SPAWNDATAS if not found 
			
			if not found then
				table.insert(sp.SPAWNDATAS,spawnInfo)
				
				--testing from here
				User:inform("neuer Eintrag")
				--testing end
			end		
		
			

	
	end
	
	
	
  end
end


function guardInfo(chosenPlayer)
    local guardModes = {"None","Passive","Hostile","Aggressive","Let always pass"}
    local myInfoText = "\nIndividual guard mode:"
    
	local days, setTime = chosenPlayer:getQuestProgress(192)
	local daysInSec = (days/3)*24*60*60
	if days ~= 0 then
	    if  (world:getTime("unix") - setTime >= daysInSec) then
		    chosenPlayer:inform("before nil")
			days = nil
		else
            days = math.ceil(((((daysInSec - (world:getTime("unix") - setTime))/60)/60)*3)/24)
	    end
	end
	if days == 0 then
	    myInfoText = myInfoText.."\nCadomyr: "..guardModes[chosenPlayer:getQuestProgress(191)+1].." (permanent)"
	elseif days == nil then
	    myInfoText = myInfoText.."\nCadomyr: None (permanent)"
	else
        myInfoText = myInfoText.."\nCadomyr: "..guardModes[chosenPlayer:getQuestProgress(191)+1].." ("..days.." days left)"
	end	
	
	local days, setTime = chosenPlayer:getQuestProgress(194)
	local daysInSec = (days/3)*24*60*60
	if days ~= 0 then
	    if  (world:getTime("unix") - setTime >= daysInSec) then
		    days = nil
		else
            days = math.ceil(((((daysInSec - (world:getTime("unix") - setTime))/60)/60)*3)/24)
	    end
	end
	if days == 0 then
	    myInfoText = myInfoText.."\nRunewick: "..guardModes[chosenPlayer:getQuestProgress(193)+1].." (permanent)"
	elseif days == nil then
	    myInfoText = myInfoText.."\nRunewick: None (permanent)"
	else
        myInfoText = myInfoText.."\nRunewick: "..guardModes[chosenPlayer:getQuestProgress(193)+1].." ("..days.." days left)"
	end
	
	local days, setTime = chosenPlayer:getQuestProgress(196)
	local daysInSec = (days/3)*24*60*60
	if days ~= 0 then
	    if  (world:getTime("unix") - setTime >= daysInSec) then
		    chosenPlayer:inform("before nil")
			days = nil
		else
            days = math.ceil(((((daysInSec - (world:getTime("unix") - setTime))/60)/60)*3)/24)
	    end
	end
	if days == 0 then
	    myInfoText = myInfoText.."\nGalmair: "..guardModes[chosenPlayer:getQuestProgress(195)+1].." (permanent)"
	elseif days == nil then
	    myInfoText = myInfoText.."\nGalmair: None (permanent)"
	else
        myInfoText = myInfoText.."\nGalmair: "..guardModes[chosenPlayer:getQuestProgress(195)+1].." ("..days.." days left)"
	end
	
	return myInfoText
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
	elseif (Item:getData("mode")=="Spawnpoint")then
	
		if (Item:getData("spawnmode")=="Monster") then
			base.lookat.SetSpecialName(Item, "Kelle (Spawnpoint) (Monster)","Kelle (Spawnpoint) (Monster)")
			base.lookat.SetSpecialDescription(Item, "Lege die Monster fest.", "Set the Monsters.");
		elseif (Item:getData("spawnmode")=="Intervals per spawn") then
			base.lookat.SetSpecialName(Item, "Kelle (Spawnpoint) (Anzahl)","Kelle (Spawnpoint) (Number)");
			base.lookat.SetSpecialDescription(Item, "Lege die Anzahl der Monster fest.", "Set the ammount of Monsters.");
		elseif (Item:getData("spawnmode")=="Time") then
			base.lookat.SetSpecialName(Item, "Kelle (Spawnpoint) (Zeit)","Kelle (Spawnpoint) (Time)");
			base.lookat.SetSpecialDescription(Item, "Lege die Dauer fest.", "Set the time.");
		elseif (Item:getData("spawnmode")=="Effects") then
			base.lookat.SetSpecialName(Item, "Kelle (Spawnpoint) (Effekte)","Kelle (Spawnpoint) (Effects)");
			base.lookat.SetSpecialDescription(Item, "Lege die gfx und die sfx fest.", "Set the gfx and sfx.");	
		elseif (Item:getData("spawnmode")=="Start/Stop") then
			base.lookat.SetSpecialName(Item, "Kelle (Spawnpoint) (Start/Stop)","Kelle (Spawnpoint) (Start/Stop)");
			base.lookat.SetSpecialDescription(Item, "Startet oder Stoppt den Spawn.", "Starts or stops the spawn.");	
		else
			base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setspawn' und benutzt den Spawnpoint.", "To set a mode type 'setspawn' and use the Spawnpoint.");
			base.lookat.SetSpecialName(Item, "Spawnpoint", "Spawnpoint");
    end
  
	else
		base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setmode' und benutzt die Kelle.", "To set a mode type 'setmode' and use the trowel.");
        base.lookat.SetSpecialName(Item, "Kelle", "Kelle");
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
end

function UseItemWithField(User,SourceItem,TargetPos)
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
				User:inform("You just "..text.." "..value.." rankpoints to everyone in a radius of ".. radius..".");
			elseif tonumber(faction) == tonumber(Factionvalues.tid) then
				base.factions.setRankpoints(player_list[i], tonumber(Factionvalues.rankpoints)+value);
				User:inform("You just "..text.." "..value.." rankpoints to members of the faction "..base.factions.getTownNameByID(Factionvalues.tid).." in a radius of ".. radius..".");
			else
--				return;  --bad return, since it would break up as soon someone does not fulfill requirements even if there are more players to be checked.
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
