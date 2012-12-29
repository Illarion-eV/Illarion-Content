--  I_99 Dietrich - Items loeschen, teleportation fuer GMs, tueren initialisieren

-- UPDATE common SET com_script='gm.items.id_99_lockpicks' WHERE com_itemid=99;

require("gm.base.log")
require("base.common")
require("item.id_x_tinderbox")

module("gm.items.id_99_lockpicks", package.seeall)

itemPos = {"Head","Neck","Breast","Hands","Left Tool","Right Tool",
	"Left Finger","Right Finger","Legs","Feet","Coat","Belt 1",
	"Belt 2","Belt 3","Belt 4","Belt 5","Belt 6"}
itemPos[0] = "Backpack"

Location={};
Coordina={};
Location[1]="Cadomyr Market";
Coordina[1]={130,600,0};
Location[2]="Galmair Castle";
Coordina[2]={360,230,0};
Location[3]="Galmair Town";
Coordina[3]={400,250,0};
Location[4]="Galmair South";
Coordina[4]={400,355,0};
Location[5]="Runewick Bridge";
Coordina[5]={844,822,0};
Location[6] = "Cadomyr Throne";
Coordina[6] = {120,545,0};
Location[7] = "Cadomyr Mine";
Coordina[7] = {130,700,0};
Location[8] = "Arena";
Coordina[8] = {600,400,0};
Location[9]="Runewick Market";
Coordina[9]={900,800,1};

skillNames = {"alchemy","carpentry","concussionWeapons","cookingAndBaking","distanceWeapons","dodge","farming","firingBricks","fishing","flute",
			"gemcutting","glassBlowing","goldsmithing","harp","herblore","horn","lute","mining","parry","punctureWeapons","slashingWeapons",
			"smithing","tailoring","woodcutting","wrestling"}

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
	
	-- First check for mode change
	if (string.find(User.lastSpokenText, "setmode")~=nil) then
		local modes = {"Eraser", "Teleport", "Char Info", "Change skills", "Instant kill/ revive"}
		local cbSetMode = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			SourceItem:setData("mode", modes[dialog:getSelectedIndex()+1]);
			world:changeItem(SourceItem);
		end
		local sd = SelectionDialog("Set the mode of this lockpicks.", "To which mode do you want to change it?", cbSetMode);
		for _,m in ipairs(modes) do 
			sd:addOption(0,m);
		end
		User:requestSelectionDialog(sd);
		return;
	end
	
	if (string.find(User.lastSpokenText, "help")) then
		User:inform("To change the mode of these lockpicks, say \"setmode\" and use it.");
	end
	
	--if injured, heal!
	if User:increaseAttrib("hitpoints",0)<10000 or User:increaseAttrib("mana",0)<10000 then
		User:increaseAttrib("hitpoints", 10000)
		User:increaseAttrib("mana", 10000)
		User:increaseAttrib("foodlevel", 100000)
	end

	if (SourceItem:getData("mode")=="Eraser") then	
	
		--get all the items the char has on him, with the stuff in the backpack
		local itemsOnChar = {};
		for i=17,0,-1 do 
			table.insert(itemsOnChar, User:getItemAt(i));
		end
					
		local cbChooseItem = function (dialog)
			if (not dialog:getSuccess()) then
				return;
            end
            local index = dialog:getSelectedIndex();
			if (index == 0) then 
				local frontitem = base.common.GetFrontItem(User);
				if frontitem~=nil then
					world:erase(frontitem,frontitem.number);
				end
			else
				local chosenItem = itemsOnChar[dialog:getSelectedIndex()]
				world:erase(chosenItem,chosenItem.number);
			end
		end			
		local sdItems = SelectionDialog("Erase items.", "Choose the item you wish to erase:", cbChooseItem);
		sdItems:addOption(0,"Front of char");
        for _,item in ipairs(itemsOnChar) do 
			local itemName = world:getItemName(item.id,1) -- only english names folks
			sdItems:addOption(0,itemName .. " (" .. itemPos[item.itempos] .. ") Count: ".. item.number);
        end	
		User:requestSelectionDialog(sdItems);
		
	elseif (SourceItem:getData("mode")=="Teleport") then 	
		local cbChooseLocation = function (dialog)
			if (not dialog:getSuccess()) then
				return;
            end
            local index = dialog:getSelectedIndex()+1;
			User:warp(position(Coordina[index][1],Coordina[index][2],Coordina[index][3]))
		end
		local sdTeleport = SelectionDialog("Teleporter.", "Choose a destination:", cbChooseLocation);
        for i=1, #(Location) do 
			sdTeleport:addOption(0,Location[i] .. " (" .. Coordina[i][1]..", "..Coordina[i][2]..", "..Coordina[i][3] .. ")");
        end	
		User:requestSelectionDialog(sdTeleport);
		
	elseif (SourceItem:getData("mode")=="Char Info") then
		local playersTmp = world:getPlayersInRangeOf(User.pos, 4);
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
			local mDialog = MessageDialog("Character Info for "..chosenPlayer.name, "HP: "..chosenPlayer:increaseAttrib("hitpoints", 0).." MP: "..chosenPlayer:increaseAttrib("mana", 0)..
							"\nSTR: "..chosenPlayer:increaseAttrib("strength", 0).." CONST: "..chosenPlayer:increaseAttrib("constitution", 0).." DEX: "..chosenPlayer:increaseAttrib("dexterity", 0)..
							"\nAGI: "..chosenPlayer:increaseAttrib("agility", 0).." WIL: "..chosenPlayer:increaseAttrib("willpower", 0).." PERC: "..chosenPlayer:increaseAttrib("perception", 0).." ESS: "..User:increaseAttrib("essence", 0)..
							"\nMental Capacity: "..tostring(chosenPlayer:getMentalCapacity())..
							"\nIdle for [s]: "..tostring(chosenPlayer:idleTime()), cbChoosePlayer)
			User:requestMessageDialog(mDialog)
		end
			--Dialog to choose the player
		local sdPlayer = SelectionDialog("Get the stats of ...", "First choose a character:", cbChoosePlayer);
		local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
			local race = math.min(player:getRace()+1, table.getn(raceNames));
			sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end		
		User:requestSelectionDialog(sdPlayer);
		
	elseif (SourceItem:getData("mode")=="Change skills") then
		local playersTmp = world:getPlayersInRangeOf(User.pos, 4);
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
			local index = dialog:getSelectedIndex();
			chosenPlayer = players[dialog:getSelectedIndex()+1];
				local skillDialog = function (dialog)					
					chosenSkill = skillNames[dialog:getSelectedIndex()+1]
					local changeDialog = function (dialog)	
						local inputString = dialog:getInput()
						if (string.find(inputString,"(%d+)") ~= nil) then
							a, b, value = string.find(inputString,"(%d+)");
							chosenPlayer:setSkill(chosenSkill, value, chosenPlayer:getSkillValue().minor);
						end
					local sdChange = InputDialog("Change skill for "..chosenPlayer.name, "Type in the new value for "..selectedSkill, changeDialog)
					User:requestInputDialog(sdChange)	
				end
				local sdSkill = SelectionDialog("Select skill", "What skill do you wish to change for "..chosenPlayer.name.."?", skillDialog)
				for _,skill in ipairs(skillNames) do 
					sdSkill:addOption(0,User:getSkillName(skill)) --" .." value: "..chosenPlayer:getSkillValue().major);
				end		
				User:requestSelectionDialog(sdSkill)
			end
		end
		--Dialog to choose the player
		local sdPlayer = SelectionDialog("Kill or revive...", "First choose a character:", cbChoosePlayer);
		local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _,player in ipairs(players) do 
			local race = math.min(player:getRace()+1, table.getn(raceNames));
			sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end		
		User:requestSelectionDialog(sdPlayer);	
		
	elseif (SourceItem:getData("mode")=="Instant kill/ revive") then		
		local playersTmp = world:getPlayersInRangeOf(User.pos, 4);
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
			local index = dialog:getSelectedIndex();
			if index == 0 then
				local monsters = world:getMonstersInRangeOf(User.pos, 3);
				for _,monster in ipairs(monsters) do
					monster:increaseAttrib("hitpoints", -10000)
				end
			else
				chosenPlayer = players[dialog:getSelectedIndex()];
				local killDialog = function (dialog)
					if (not dialog:getSuccess()) then
						return;
					end			
					local index = dialog:getSelectedIndex()
					if index == 0 then --let's kill it
						chosenPlayer:increaseAttrib("hitpoints", -10000)
					elseif index == 1 then --let's revive it
						chosenPlayer:increaseAttrib("hitpoints", 10000)
					end
				end
				local sdKill = SelectionDialog("Play god", "What do you wish to do to "..chosenPlayer.name.."?", killDialog)
				sdKill:addOption(0, "Instant kill")
				sdKill:addOption(0, "Instant revive")
				User:requestSelectionDialog(sdKill)	
			end
		end
		--Dialog to choose the player
		local sdPlayer = SelectionDialog("Kill or revive...", "First choose a character:", cbChoosePlayer);
		local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
		sdPlayer:addOption(0, "Kill all Monster in a 3 tile radius")
        for _,player in ipairs(players) do 
			local race = math.min(player:getRace()+1, table.getn(raceNames));
			sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end		
		User:requestSelectionDialog(sdPlayer);
		
	end	-- end of modes
end

function LookAtItem(User,Item)
    if (Item:getData("mode")=="Eraser") then
		base.lookat.SetSpecialName(Item, "Dietriche (Eraser)","Lockpicks (Eraser)")
		base.lookat.SetSpecialDescription(Item, "Aufräumzeit!! Benutze die Dietriche. Um einen Modus zu setzen sage 'setmode' und benutzt die Dietriche.", "Clean up time!! Use the lockpicks. To set a mode type 'setmode' and use the lockpicks.");
    elseif (Item:getData("mode")=="Teleport") then
        base.lookat.SetSpecialName(Item, "Dietriche (Teleport)","Lockpicks (Teleport)");
		base.lookat.SetSpecialDescription(Item, "Ich  bin hier weg. Benutze die Dietriche. Um einen Modus zu setzen sage 'setmode' und benutzt die Dietriche. ", "I'm out of here. Use the lockpicks. To set a mode type 'setmode' and use the lockpicks.");
	elseif (Item:getData("mode")=="Char Info") then
        base.lookat.SetSpecialName(Item, "Dietriche (Char Info)","Lockpicks (Char Info)");
		base.lookat.SetSpecialDescription(Item, "Char Info. Benutze die Dietriche. Um einen Modus zu setzen sage 'setmode' und benutzt die Dietriche.", "Char Info. Use the lockpicks. To set a mode type 'setmode' and use the lockpicks.");
	elseif (Item:getData("mode")=="Instant kill/ revive") then
        base.lookat.SetSpecialName(Item, "Dietriche (Godmode)","Lockpicks (Godmode)");
		base.lookat.SetSpecialDescription(Item, "Instant kill/ revive. Benutze die Dietriche. Um einen Modus zu setzen sage 'setmode' und benutzt die Dietriche.", "Instant kill/ revive. Use the lockpicks. To set a mode type 'setmode' and use the lockpicks.");
	else
		base.lookat.SetSpecialDescription(Item, "Um einen Modus zu setzen sage 'setmode' und benutzt die Dietriche.", "To set a mode type 'setmode' and use the lockpicks.");
        base.lookat.SetSpecialName(Item, "Dietriche", "Lockpicks");
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