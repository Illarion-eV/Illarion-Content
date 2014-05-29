--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- GM tool to delete items, to teleport and to conduct character changes

-- UPDATE common SET com_script='gm.items.id_99_lockpicks' WHERE com_itemid=99;

require("base.common")
require("base.factions")

module("gm.items.id_99_lockpicks", package.seeall)

itemPos = {"Head","Neck","Breast","Hands","Left Tool","Right Tool",
	"Left Finger","Right Finger","Legs","Feet","Coat","Belt 1",
	"Belt 2","Belt 3","Belt 4","Belt 5","Belt 6"}
itemPos[0] = "Backpack"

Location={};
Coordina={};
Location[1]="Player";
Coordina[1]={"X","Y","Z"};
Location[2]="GM Castle";
Coordina[2]={250,100,0};
Location[3]="Hemp Necktie Inn";
Coordina[3]={690,320,0};
Location[4]="Cadomyr Palace of Her Majesty";
Coordina[4]={122,521,0};
Location[5]="Cadomyr Market";
Coordina[5]={130,600,0};
Location[6]="Galmair Crest";
Coordina[6]={337,215,0};
Location[7]="Galmair Town";
Coordina[7]={400,250,0};
Location[8]="Runewick Hall of Elara";
Coordina[8]={898,775,2};
Location[9]="Runewick Market";
Coordina[9]={900,800,1};
Location[10]="Cadomyr Cornerstone of Candour";
Coordina[10]={130,700,0};
Location[11]="Cadomyr Liberty Quarry";
Coordina[11]={170,620,0};
Location[12]="Cadomyr Blood Circle Arena";
Coordina[12]={258,668,0};
Location[13]="Galmair Balckhole Mine";
Coordina[13]={338,157,-3};
Location[14]="Galmair Malachite Mine";
Coordina[14]={400,355,0};
Location[15]="Galmair Game Room";
Coordina[15]={250,290,-5};
Location[16]="Runewick Yewdale";
Coordina[16]={750,810,0};
Location[17]="Runewick Lurnord Bridge";
Coordina[17]={844,822,0};

skillNames = {
	Character.alchemy,
	Character.carpentry,
	Character.concussionWeapons,
	Character.cookingAndBaking,
	Character.distanceWeapons,
	Character.farming,
	Character.firingBricks,
	Character.fishing,
	Character.flute,
	Character.gemcutting,
	Character.glassBlowing,
	Character.goldsmithing,
	Character.harp,
	Character.heavyArmour,
	Character.herblore,
	Character.horn,
	Character.lightArmour,
	Character.lute,
	Character.mediumArmour,
	Character.mining,
	Character.parry,
	Character.punctureWeapons,
	Character.slashingWeapons,
	Character.smithing,
	Character.tailoring,
	Character.woodcutting,
	Character.wrestling
}

function UseItem(User, SourceItem, ltstate)

	--if injured, heal!
	if User:increaseAttrib("hitpoints",0) < 10000 or User:increaseAttrib("mana",0) < 10000 then
		User:increaseAttrib("hitpoints", 10000);
		User:increaseAttrib("mana", 10000);
		User:increaseAttrib("foodlevel", 100000);
	end

	-- First check for mode change
	local modes = {"Eraser", "Teleport", "Faction info of chars in radius", "Char Info", "Change skills", "Get/ Set Queststatus", "Instant kill/ revive"};
	local cbSetMode = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local index = dialog:getSelectedIndex() + 1;
		if index == 1 then
			eraser(User, SourceItem, ltstate);
		elseif index == 2 then
			teleporter(User, SourceItem, ltstate);
		elseif index == 3 then
			factionInfoOfCharsInRadius(User, SourceItem, ltstate);
		elseif index == 4 then
			charInfo(User, SourceItem,ltstate);
		elseif index == 5 then
			changeSkills(User, SourceItem, ltstate);
		elseif index == 6 then
			getSetQueststatus(User, SourceItem, ltstate);
		elseif index == 7 then
			godMode(User, SourceItem, ltstate);
		end
	end
	local sd = SelectionDialog("Pick a function of the lockpicks.", "Which do you want to use?", cbSetMode);
	for _, m in ipairs(modes) do
		sd:addOption(0, m);
	end
	User:requestSelectionDialog(sd);
end

function eraser(User, SourceItem, ltstate)

	--get all the items the char has on him, with the stuff in the backpack
	local itemsOnChar = {};
	for i = 17, 0, -1 do
		local item = User:getItemAt(i);
		if (item.id > 0) then
			table.insert(itemsOnChar, item);
		end
	end

	local cbChooseItem = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end

		local chosenItem;
		local index = dialog:getSelectedIndex();
		if (index == 0) then
			chosenItem = base.common.GetFrontItem(User);
			if chosenItem ~= nil then
				world:erase(chosenItem, chosenItem.number);
				User:logAdmin("erases " .. chosenItem.number .. " items from map: " .. world:getItemName(chosenItem.id, Player.english) .. "(" .. chosenItem.id .. ") at " .. tostring(base.common.GetFrontPosition(User)));
			end
		else
			chosenItem = itemsOnChar[index];
			world:erase(chosenItem, chosenItem.number);
			User:logAdmin("erases " ..chosenItem.number.. " items from inventory: " .. world:getItemName(chosenItem.id, Player.english) .. "(" .. chosenItem.id .. ")");
		end
	end
	local sdItems = SelectionDialog("Erase items.", "Choose the item you wish to erase:", cbChooseItem);
	sdItems:addOption(0, "Front of char");
	for _, item in ipairs(itemsOnChar) do
		local itemName = world:getItemName(item.id, Player.english);
		sdItems:addOption(item.id, itemName .. " (" .. itemPos[item.itempos] .. ") Count: ".. item.number);
	end
	User:requestSelectionDialog(sdItems);
end

function teleporter(User, SourceItem, ltstate)

	local cbChooseLocation = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local index = dialog:getSelectedIndex() + 1;
		if index == 1 then
			local onlineChars = world:getPlayersOnline();
			local cbChoosePlayerLocation = function (dialog)
				if (not dialog:getSuccess()) then
					return;
				end
				local warpToPlayer = onlineChars[dialog:getSelectedIndex() + 1];
				if isValidChar(warpToPlayer) then
					User:warp(position(warpToPlayer.pos.x, warpToPlayer.pos.y, warpToPlayer.pos.z));
				else
					User:inform("This character is not online anymore.");
				end
			end
			local sdTeleportPlayer = SelectionDialog("Teleporter.", "Choose a destination:", cbChoosePlayerLocation);
			for i = 1, #onlineChars do
				local checkChar = onlineChars[i];
				local onlineCharsName = checkChar.name;
				sdTeleportPlayer:addOption(0, onlineCharsName .. " (" .. checkChar.pos.x..", "..checkChar.pos.y..", "..checkChar.pos.z .. ")");
			end
			User:requestSelectionDialog(sdTeleportPlayer);
		else
			User:warp(position(Coordina[index][1], Coordina[index][2], Coordina[index][3]));
		end
	end
	local sdTeleport = SelectionDialog("Teleporter.", "Choose a destination:", cbChooseLocation);
	for i = 1, #(Location) do
		sdTeleport:addOption(0, Location[i] .. " (" .. Coordina[i][1]..", "..Coordina[i][2]..", "..Coordina[i][3] .. ")");
	end
	User:requestSelectionDialog(sdTeleport);
end

function factionInfoOfCharsInRadius(User, SourceItem, ltstate)

	local players = world:getPlayersInRangeOf(User.pos, 40);
	local infos = "";
	local germanRank, englishRank;

	for _, player in ipairs(players) do
		germanRank, englishRank = base.factions.getRank(player, true);
		if germanRank == nil or englishRank == nil then
			germanRank = "Vogelfrei";
			englishRank = "Outlaw";
		end
		infos = infos..player.name.." - "..englishRank.."/"..germanRank.." - "..base.factions.getRankpoints(player).."\n";
	end
	local mDialog = MessageDialog("Factioninformation", infos, nil);
	User:requestMessageDialog(mDialog);
end

function charInfo(User, SourceItem, ltstate)

	local playersTmp = world:getPlayersInRangeOf(User.pos, 25);
	local players = {User};
	for _, player in pairs(playersTmp) do
		if (player.id ~= User.id) then
			table.insert(players, player);
		end
	end

	local cbChoosePlayer = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local chosenPlayer = players[dialog:getSelectedIndex() + 1];
		local faction = base.factions.getFaction(chosenPlayer);
		local factionInfo = "Town: " .. base.factions.getMembershipByName(chosenPlayer);
		factionInfo = factionInfo .. "\nChanged towns already (town count): " .. faction.towncnt;
		if (base.factions.townRanks[faction.tid] ~= nil and base.factions.townRanks[faction.tid][faction.rankTown] ~= nil) then
			local germanRank, englishRank = base.factions.getRank(chosenPlayer, true);
			factionInfo = factionInfo .. "\nRank: " .. englishRank .. "/" .. germanRank;
		else
			factionInfo = factionInfo .. "\nRank: no rank " .. faction.rankTown;
		end
		factionInfo = factionInfo .. "\nExact rankpoints: " .. faction.rankpoints;
		local mDialog = MessageDialog("Character Info for "..chosenPlayer.name, "HP: "..chosenPlayer:increaseAttrib("hitpoints", 0).." MP: "..chosenPlayer:increaseAttrib("mana", 0)..
						"\nSTR: "..chosenPlayer:increaseAttrib("strength", 0).." CON: "..chosenPlayer:increaseAttrib("constitution", 0).." DEX: "..chosenPlayer:increaseAttrib("dexterity", 0).." AGI: "..chosenPlayer:increaseAttrib("agility", 0)..
						"\nINT: "..chosenPlayer:increaseAttrib("intelligence", 0).." WIL: "..chosenPlayer:increaseAttrib("willpower", 0).." PERC: "..chosenPlayer:increaseAttrib("perception", 0).." ESS: "..chosenPlayer:increaseAttrib("essence", 0)..
						"\nMental Capacity: "..tostring(chosenPlayer:getMentalCapacity())..
						"\nIdle for [s]: "..tostring(chosenPlayer:idleTime()) ..
						"\n" .. factionInfo, cbChoosePlayer);
		User:requestMessageDialog(mDialog);
	end
	--Dialog to choose the player
	local sdPlayer = SelectionDialog("Get the stats of ...", "First choose a character:", cbChoosePlayer);
	local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"};
        for _, player in ipairs(players) do
		local race = math.min(player:getRace() + 1, table.getn(raceNames));
		sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
	User:requestSelectionDialog(sdPlayer);
end

function changeSkills(User, SourceItem, ltstate)

	local playersTmp = world:getPlayersInRangeOf(User.pos, 25);
	local players = {User};
	for _, player in pairs(playersTmp) do
		if (player.id ~= User.id) then
			table.insert(players, player);
		end
	end

	local cbChoosePlayer = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local chosenPlayer = players[dialog:getSelectedIndex() + 1];
		local skillDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local chosenSkill = skillNames[dialog:getSelectedIndex() + 1];
			local changeDialog = function (dialog)
				if (not dialog:getSuccess()) then
					return;
				end
				local skillValue, okay = String2Number(dialog:getInput());
				if (not okay) then
					User:inform("no number");
					return;
				end
				if (skillValue < 0 or skillValue > 100) then
					User:inform("Value has to be between 0 and 100.");
					return;
				end
				local delta = skillValue - chosenPlayer:getSkill(chosenSkill);
				chosenPlayer:increaseSkill(chosenSkill, delta);
				User:logAdmin("changes skill of character " .. chosenPlayer.name .. ". " .. chosenPlayer:getSkillName(chosenSkill) .. ": " .. chosenPlayer:getSkill(chosenSkill) - delta .. " to " .. chosenPlayer:getSkill(chosenSkill));
			end
			local sdChange = InputDialog("Change skill for "..chosenPlayer.name, "Type in the new value for "..User:getSkillName(chosenSkill).."\nCurrent value: " .. chosenPlayer:getSkill(chosenSkill), false, 255, changeDialog);
			User:requestInputDialog(sdChange);
		end
		local sdSkill = SelectionDialog("Select skill", "What skill do you wish to change for "..chosenPlayer.name.."?", skillDialog);
		for _, skill in ipairs(skillNames) do
			sdSkill:addOption(0,User:getSkillName(skill).." value: "..chosenPlayer:getSkill(skill));
		end
		User:requestSelectionDialog(sdSkill);
	end
	--Dialog to choose the player
	local sdPlayer = SelectionDialog("Change a skill.", "First choose a character:", cbChoosePlayer);
	local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"}
        for _, player in ipairs(players) do
		local race = math.min(player:getRace() + 1, table.getn(raceNames));
		sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
	User:requestSelectionDialog(sdPlayer);
end

function getSetQueststatus(User, SourceItem, ltstate)

	local playersTmp = world:getPlayersInRangeOf(User.pos, 25);
	local players = {User};
	for _, player in pairs(playersTmp) do
		if (player.id ~= User.id) then
			table.insert(players, player);
		end
	end

	local cbChoosePlayer = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local chosenPlayer = players[dialog:getSelectedIndex() + 1];
		local changeDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local inputString = dialog:getInput();
			if (string.find(inputString, "(%d+) (%d+)") ~= nil) then
				local a, b, quest, status = string.find(inputString, "(%d+) (%d+)");
				quest = tonumber(quest);
				status = tonumber(status);
				chosenPlayer:setQuestProgress(quest, status);
				User:inform("Quest " .. quest .. " has been set to " .. status .. "!");
				User:logAdmin("changes queststatus of character " .. chosenPlayer.name .. ". Quest ID " .. quest .. " set to value " .. status);
			elseif (string.find(inputString, "(%d+)") ~= nil) then
				local a, b, quest = string.find(inputString, "(%d+)");
				quest = tonumber(quest);
				User:inform("Quest " .. quest .. " has the status " .. chosenPlayer:getQuestProgress(quest) .. ".");
			else
				User:inform("Sorry, I didn't understand you.");
				User:requestInputDialog(InputDialog("Get/ Set Queststatus for "..chosenPlayer.name, "Usage: To get the value type in the questnumber.\n To set the value type in questnumber and the new status.", false, 255, changeDialog));
			end
		end
		local sdChange = InputDialog("Get/ Set Queststatus for "..chosenPlayer.name, "Usage: To get the value type in the questnumber.\n To set the value type in questnumber and the new status.", false, 255, changeDialog);
		User:requestInputDialog(sdChange);
	end
	--Dialog to choose the player
	local sdPlayer = SelectionDialog("Get/ Set Queststatus", "First choose a character:", cbChoosePlayer);
	local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"};
        for _, player in ipairs(players) do
		local race = math.min(player:getRace() + 1, table.getn(raceNames));
		sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
	User:requestSelectionDialog(sdPlayer);
end

function godMode(User, SourceItem, ltstate)

	local playersTmp = world:getPlayersInRangeOf(User.pos, 25);
	local players = {User};
	for _, player in pairs(playersTmp) do
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
			for _, monster in ipairs(monsters) do
				monster:increaseAttrib("hitpoints", -10000);
			end
			User:logAdmin("instant kills " .. #monsters .. " monsters at " .. tostring(User.pos));
		else
			local chosenPlayer = players[index];
			local killDialog = function (dialog)
				if (not dialog:getSuccess()) then
					return;
				end
				local index = dialog:getSelectedIndex();
				if index == 0 then --let's kill it
					chosenPlayer:increaseAttrib("hitpoints", -10000);
					User:logAdmin("instant kills character " .. chosenPlayer.name);
				elseif index == 1 then --let's revive it
					chosenPlayer:increaseAttrib("hitpoints", 10000);
					User:logAdmin("instant revives character " .. chosenPlayer.name);
				end
			end
			local sdKill = SelectionDialog("Play god", "What do you wish to do to "..chosenPlayer.name.."?", killDialog);
			sdKill:addOption(0, "Instant kill");
			sdKill:addOption(0, "Instant revive");
			User:requestSelectionDialog(sdKill);
		end
	end
	--Dialog to choose the player
	local sdPlayer = SelectionDialog("Kill or revive...", "First choose a character:", cbChoosePlayer);
	local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"};
	sdPlayer:addOption(0, "Kill all Monster in a 3 tile radius");
        for _, player in ipairs(players) do
		local race = math.min(player:getRace() + 1, table.getn(raceNames));
		sdPlayer:addOption(0, player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
	User:requestSelectionDialog(sdPlayer);
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Verwende die Dietriche zum aufrufen der Funktionen.", "Use the lockpicks to pick a function.");
	base.lookat.SetSpecialName(Item, "Dietriche", "Lockpicks");
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
end

function String2Number(str)
	if (string.find(str, "(%d+)") ~= nil) then
		local _, _, num = string.find(str, "(%d+)");
		if (num ~= "") then
			num = tonumber(num);
			return num, true;
		end
	end
	return 0, false;
end
