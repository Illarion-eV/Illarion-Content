-- I_2786_ast.lua
-- TESTSCRIPT FOR PHARSE!!!!!!!111
--

-- UPDATE common SET com_script = 'test.pharse' WHERE com_itemid = 2786;

require("base.common")
require("npc.base.patrol");
require("base.doors")
require("gm.items.id_382_ceilingtrowel");
require("base.polygons");
require("base.factions");
require("npc.base.guards_static");

module("test.pharse", package.seeall)

wDoor = nil;
wBridge = nil;
wBridgeArea = 0;
wBridgeWarp = false;
wMirror = false;

testPos = position(0,0,0)

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

function UseItem(User, SourceItem, ltstate)
	local possibilities = {
    "Remove all items by ID (in inventory)",
    "Get/Set skill",
    "Heal yourself",
    "Get/Set faction values for ...",
    "Get/Set guard modes"
  };
  local cbWhatYouWant = function (dialog)
    if (not dialog:getSuccess()) then
      return;
    end
    local ind = dialog:getSelectedIndex();
    if (ind == 0) then -- remove items
      local cbRemoveAll = function (dialog)
        if (dialog:getSuccess()) then
          local num, okay = String2Number(dialog:getInput());
          if (okay) then
            User:eraseItem(num, User:countItem(num));
          else
            User:inform("You have not entered a number that could be used as item ID.");
          end
        end
      end
      User:requestInputDialog(InputDialog(possibilities[ind+1], "Enter an ID of the items you want to remove from your character.", false, 255, cbRemoveAll));
    elseif (ind == 1) then -- skill
      local skillList = {
        Character.carpentry,Character.tailoring,Character.smithing,Character.cookingAndBaking,Character.goldsmithing,Character.glassBlowing,
        Character.farming,Character.mining,Character.woodcutting,Character.firingBricks,Character.fishing,Character.gemcutting,
        Character.herblore,Character.alchemy,Character.poisoning,Character.dodge,Character.parry,Character.slashingWeapons,Character.concussionWeapons,Character.punctureWeapons,Character.distanceWeapons,Character.wrestling,
        Character.harp,Character.horn,Character.flute,Character.lute
      };
      local cbGetSetSkill = function(dialog)
        if (not dialog:getSuccess()) then
          return;
        end
        local skill = skillList[dialog:getSelectedIndex()+1];
        local cbSetSkill = function (dialog)
          if (not dialog:getSuccess()) then
            return;
          end
          local skillValue, okay = String2Number(dialog:getInput());
          if (not okay) then
            User:inform("no number");
            return;
          end
          if (skillValue < 0 or skillValue > 100) then
            User:inform("value has to be between 0 and 100 (incl.)");
            return;
          end
          User:increaseSkill(skill, skillValue - User:getSkill(skill));
        end
        User:requestInputDialog(InputDialog("Set skill","Chosen skill: " .. User:getSkillName(skill) .."\nCurrent value: " .. User:getSkill(skill) .. "\nYou can set a new value.",false,255,cbSetSkill));
      end
      local selectionDialog = SelectionDialog(possibilities[ind+1], "Select a skill.", cbGetSetSkill);
      for _,s in ipairs(skillList) do 
        selectionDialog:addOption(0, User:getSkillName(s));
      end
      User:requestSelectionDialog(selectionDialog);
    elseif (ind == 2) then -- heal
      User:increaseAttrib("hitpoints", 10000);
      User:increaseAttrib("foodlevel", 10000);
      User:increaseAttrib("mana", 10000);
      User:increaseAttrib("poisonvalue", -10000);
    elseif (ind == 3) then -- faction
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
              base.factions.setRankpoints(chosenPlayer, rankpoints);
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
      local sd = SelectionDialog(possibilities[ind+1], "First choose a player:", cbChoosePlayer);
      local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
      for _,player in ipairs(players) do 
        local race = math.min(player:getRace()+1, table.getn(raceNames));
        sd:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
      end
      User:requestSelectionDialog(sd);
    elseif (ind == 4) then -- guard mode
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
      local sd = SelectionDialog(possibilities[ind+1], "For which faction do you want to get/set values?", cbFirstFaction);
      for _,f in ipairs(factionIds) do 
        sd:addOption(0,base.factions.getTownNameByID(f));
      end
      User:requestSelectionDialog(sd);
    end -- choice indices
  end -- what you want
  local sd = SelectionDialog("Pharse's test item", "What do you want to do?", cbWhatYouWant);
  for _,poss in ipairs(possibilities) do 
    sd:addOption(0, poss);
  end
  User:requestSelectionDialog(sd);
end

function UseItem_deprecated(User,SourceItem,TargetItem,ltstate)
	if dowp then
		if User.lastSpokenText == "nowp" then
			dowp = false;
			User:inform("no wp, back to normal.");
			return;
		end
		local wpFileName = "waypoints";
		local posFileName = "positions";
		local wpFile,errmsg = io.open("/home/pharse/waypoints/"..wpFileName,"a");
		local posFile,errmsg = io.open("/home/pharse/waypoints/"..posFileName,"a");
		if wpFile and posFile then
			if wMenu==nil then
				wMenu = MenuStruct();
				wMenu:addItem(505); -- treasure map => new waypoint
				wMenu:addItem(709); -- door => set door coords
				wMenu:addItem(602); -- bridge => set bridge coords, counter sets the area! if door is set, toPos is set.
				wMenu:addItem(10); -- portal => toggle warp boolean. default: false
				wMenu:addItem(336); -- mirror => add another inverted waypoint if bridge is set
				wMenu:addItem(228); -- occupied => reset all
			end
			if param==505 then				
				writeWaypoint(wpFile,posFile,User.pos,counter,wBridge,wBridgeArea,wBridgeWarp,wDoor);
				if wMirror then
					writeWaypoint(wpFile,posFile,wBridge,wBridgeArea,User.pos,counter,wBridgeWarp,wDoor);
				end
				wpFile:close();
				posFile:close();
				User:inform("waypoint added" .. (wMirror and " and mirror waypoint" or ""));
				wDoor = nil;
				wBridge = nil;
				wBridgeArea = 0;
				wBridgeWarp = false;
				wMirror = false;
			elseif param==709 then
				wDoor = base.common.CopyPosition(User.pos);
			elseif param==602 then
				wBridge = base.common.CopyPosition(User.pos);
				wBridgeArea = counter;
			elseif param==10 then
				wBridgeWarp = not wBridgeWarp;
			elseif param==336 then
				wMirror = not wMirror;
			elseif param==228 then
				wDoor = nil;
				wBridge = nil;
				wBridgeArea = 0;
				wBridgeWarp = false;
				wMirror = false;
			end
			local out = (wDoor~=nil and "Door, " or "--, ") .. (wBridge~=nil and "Bridge, Area=".. wBridgeArea or "--") .. ", Warp=".. (wBridgeWarp and "true" or "false") ..", Mirror=".. (wMirror and "true" or "false") ..";";
			User:inform(out);
			User:sendMenu(wMenu);
		else
			User:inform("files not found");
		end
		return;
	end
	
	if string.find(User.lastSpokenText, "polygon") then
		p = base.polygons.Polygon({position(0,0,0), position(2,1,0), position(2,2,0), position(1,2,0)},{0});
		debug("p1: " .. printBool(p:pip(position(0,0,0))));
		debug("p2: " .. printBool(p:pip(position(2,1,0))));
		debug("p3: " .. printBool(p:pip(position(2,2,0))));
		debug("p4: " .. printBool(p:pip(position(1,2,0))));
		debug("p5: " .. printBool(p:pip(position(0,1,0))));
		debug("p6: " .. printBool(p:pip(position(1,1,0))));
		-- l = base.polygons.Line(position(0,0,0), position(2,4,0));
		-- debug("l1: " .. printBool(l:pointOnLine(position(0,0,0))));
		-- debug("l2: " .. printBool(l:pointOnLine(position(1,2,0))));
		-- debug("l3: " .. printBool(l:pointOnLine(position(0,1,0))));
		-- debug("l4: " .. printBool(l:pointOnLine(position(2,4,0))));
		-- debug("l5: " .. printBool(l:pointOnLine(position(1,1,0))));
	else
		debug("no text found");
	end
end

function writeWaypoint(wpFile,posFile,wpPos,wpArea,bridgePos,bridgeArea,bridgeWarp,door)
	local text = "Waypoint:new(position("..wpPos.x ..","..wpPos.y ..","..wpPos.z .."),".. wpArea;
	if bridgePos then
		text = text ..",nil,{bridge={toArea=".. bridgeArea ..",toWaypoint=position("..bridgePos.x ..","..bridgePos.y ..","..bridgePos.z .."),warp=";
		text = text .. (bridgeWarp and "true" or "false") .."}";
		if door then
			text = text .. ",\n                                            door={pos=position("..door.x ..","..door.y ..","..door.z .."),";
			text = text .. "toPos=position("..bridgePos.x ..","..bridgePos.y ..","..bridgePos.z ..")}";
		end
		text = text .. "}";
	end
	text = text .. ");\n"
	wpFile:write(text);
	posFile:write("position("..wpPos.x ..","..wpPos.y ..","..wpPos.z .."),\n");
end

function printPosition(pos)
	return "x=" .. pos.x .. "|y=" .. pos.y .. "|z=" .. pos.z;
end

function printBool(val)
	if val==true then
		return "true";
	elseif val==nil then
		return "nil";
	elseif val==false then
		return "false";
	else
		return "n.d.";
	end
end
