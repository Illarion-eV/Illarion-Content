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
-- UPDATE common SET com_script='gm.items.id_93_medal' WHERE com_itemid=93;

require("base.common")
module("gm.items.id_93_medal", package.seeall)

function UseItemWithField(User, SourceItem, TargetPos)

	-- First check for mode change
	local modes = {"Monster", "GFX", "SFX", "Animation", "Avatar changes"};
	local cbSetMode = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end

		local index = dialog:getSelectedIndex() + 1;
		if index == 1 then
			monster(User,SourceItem,TargetPos);
		elseif index == 2 then
			gfx(User,SourceItem,TargetPos);
		elseif index == 3 then
			sfx(User,SourceItem,TargetPos);
		elseif index == 4 then
			animation(User,SourceItem,TargetPos);
		elseif index == 5 then
			changeAvatar(User,SourceItem,TargetPos);
		else
			User:inform("no valid function");
		end
	end
	local sd = SelectionDialog("Pick a function of the medal.", "Wich do you want to use?", cbSetMode);
	for _, m in ipairs(modes) do
		sd:addOption(0, m);
	end
	User:requestSelectionDialog(sd);
end

function monster(User, SourceItem, TargetPos)

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end

		local a, b, number, ammount, radius, gfxId, sfxId
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+) (%d+) (%d+) (%d+) (%d+)") ~= nil) then
			a, b, number, ammount, radius, gfxId, sfxId = string.find(inputNumber,"(%d+) (%d+) (%d+) (%d+) (%d+)");
			number = tonumber(number);
			ammount = tonumber(ammount);
			radius = tonumber(radius);
			gfxId = tonumber(gfxId);
			sfxId = tonumber(sfxId);
		elseif (string.find(inputNumber,"(%d+) (%d+) (%d+) (%d+)") ~= nil) then
			a, b, number, ammount, radius, gfxId = string.find(inputNumber,"(%d+) (%d+) (%d+) (%d+)");
			number = tonumber(number);
			ammount = tonumber(ammount);
			radius = tonumber(radius);
			gfxId = tonumber(gfxId);
			sfxId = 0;
		elseif (string.find(inputNumber,"(%d+) (%d+) (%d+)") ~= nil) then
			a, b, number, ammount, radius = string.find(inputNumber,"(%d+) (%d+) (%d+)");
			number = tonumber(number);
			ammount = tonumber(ammount);
			radius = tonumber(radius);
			gfxId = 0;
			sfxId = 0;
		elseif (string.find(inputNumber,"(%d+) (%d+)") ~= nil) then
			a, b, number, ammount = string.find(inputNumber,"(%d+) (%d+)");
			number = tonumber(number);
			ammount = tonumber(ammount);
			radius = 0;
			gfxId = 0;
			sfxId = 0;
		elseif (string.find(inputNumber,"(%d+)") ~= nil) then
			a, b, number = string.find(inputNumber,"(%d+)");
			number = tonumber(number);
			ammount = 1;
			radius = 0;
			gfxId = 0;
			sfxId = 0;
		else
			User:inform("No number");
		end

		if ammount > 100 then
			ammount = 100;
		end

		for i = 1, ammount do
			monPos = getFreePos( TargetPos, radius );
			local monster = world:createMonster(number, monPos, 20);
			if gfxId ~= 0 then
				world:gfx(gfxId, monPos);
			end
		end

		User:inform("Creating "..ammount.. " monsters with ID "..number.." (radius = "..radius..")");
		User:logAdmin("creates "..ammount.. " monsters with ID "..number.." (radius = "..radius..")");

		if sfxId ~= 0 then
			world:makeSound(sfxId,TargetPos);
		end
	end
	User:requestInputDialog(InputDialog("Spawn a monster.", "Usage enter: MonsterID [ammount] [radius] [GFX] [SFX]" ,false, 255, cbInputDialog));
end

function gfx(User, SourceItem, TargetPos)

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+)") ~= nil) then
			local a, b, number = string.find(inputNumber,"(%d+)");
			number = tonumber(number);
			world:gfx(number,TargetPos);
		else
			User:inform("No number");
		end
	end
	User:requestInputDialog(InputDialog("Play a graphics effect.", "Usage: Type in graphic effects id. Will be played in front of character." ,false, 255, cbInputDialog));
end

function sfx(User, SourceItem, TargetPos)

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+)") ~= nil) then
			local a, b, number = string.find(inputNumber,"(%d+)");
			number = tonumber(number);
			world:makeSound(number,TargetPos);
		else
			User:inform("No number");
		end
	end
	User:requestInputDialog(InputDialog("Play a sound effect.", "Usage: Type in sound effects id." ,false, 255, cbInputDialog));
end

function animation(User, SourceItem, TargetPos)

	local cbInputDialog = function (dialog)
		if (not dialog:getSuccess()) then
			return;
		end
		local inputNumber = dialog:getInput();
		if (string.find(inputNumber,"(%d+)") ~= nil) then
			local a, b, number = string.find(inputNumber,"(%d+)");
			number = tonumber(number);
			User:performAnimation(number);
		else
			User:inform("No number");
		end
	end
	User:requestInputDialog(InputDialog("Play a animation effect.", "Usage: Type in animation effects id." ,false, 255, cbInputDialog));
end

function changeAvatar(User, SourceItem, TargetPos)

	local playersTmp = world:getPlayersInRangeOf(User.pos, 4);
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
		local chosenPlayer = players[dialog:getSelectedIndex()+1];
		local cbInputDialog = function (dialog)
			if (not dialog:getSuccess()) then
				return;
			end
			local inputString = dialog:getInput();
			if (string.find(inputString,"(%a+) (%d+) (%d+) (%d+)") ~= nil) then
				local a, b, modifier, red, green, blue = string.find(inputString,"(%a+) (%d+) (%d+) (%d+)");
				red = tonumber(red);
				green = tonumber(green);
				blue = tonumber(blue);
				if modifier == "haircolor" then
					chosenPlayer:setHairColor(red, green, blue);
				elseif modifier == "skincolor" then
					chosenPlayer:setSkinColor(red, green, blue);
				else
					User:inform("Sorry, I didn't understand you.");
					return;
				end
				User:logAdmin("changes avatar of "..chosenPlayer.name..": Set " ..modifier.." to RGB ("..red..", "..green..", "..blue..")");
			elseif (string.find(inputString,"(%a+) (%d+)") ~= nil) then
				local a, b, modifier, id = string.find(inputString,"(%a+) (%d+)");
				id = tonumber(id);
				if modifier == "race" then
					chosenPlayer:setRace(id);
				elseif modifier == "beard" then
					chosenPlayer:setBeard(id);
				elseif modifier == "hair" then
					chosenPlayer:setHair(id);
				else
					User:inform("Sorry, I didn't understand you.");
					return;
				end
				User:logAdmin("changes avatar of "..chosenPlayer.name..": Set " ..modifier.." to ID "..id);
			else
				User:inform("Sorry, I didn't understand you.");
				User:requestInputDialog(InputDialog("Change the appearance for the selected character.", "Usage: race <id>, beard <id>, hair <id>, haircolor <red> <green> <blue>, skincolor <red> <green> <blue>" ,false, 255, cbInputDialog))
			end
		end
		User:requestInputDialog(InputDialog("Change the appearance for the selected character.", "Usage: race <id>, beard <id>, hair <id>, haircolor <red> <green> <blue>, skincolor <red> <green> <blue>" ,false, 255, cbInputDialog))
	end
	--Dialog to choose the player
	local sdPlayer = SelectionDialog("Change the avatar of ...", "First choose a victim:", cbChoosePlayer);
	local raceNames = {"Human", "Dwarf", "Halfling", "Elf", "Orc", "Lizardman", "Other"};
        for _, player in ipairs(players) do
		local race = math.min(player:getRace()+1, table.getn(raceNames));
		sdPlayer:addOption(0,player.name .. " (" .. raceNames[race] .. ") " .. player.id);
        end
	User:requestSelectionDialog(sdPlayer);
end

function UseItem(User, SourceItem)
	UseItemWithField(User,SourceItem,base.common.GetFrontPosition(User));
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Verwende die Medallie zum aufrufen der Funktionen.", "Use the medal to pick a function.");
	base.lookat.SetSpecialName(Item, "Medaille", "Medal");
	world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, base.lookat.METAL));
end

function getFreePos(CenterPos, Rad)
	local tarPos;
	local countPos = 0;
	while true do
		tarPos = position(CenterPos.x+math.random(-Rad,Rad),CenterPos.y+math.random(-Rad,Rad),CenterPos.z);
		if not world:isItemOnField( tarPos ) and not world:isCharacterOnField( tarPos ) then
			tileID = world:getField( tarPos ):tile();
			if tileID ~= 0 and tileID ~= 5 and tileID ~= 6 and tileID~=42 and tileID ~= 43 and tileID~= 34 then --no inpassable tiles
				countPos = 0;
				return tarPos;
			else
				countPos = countPos +1;
				if countPos > 50 then
					countPos = 0;
					return CenterPos;
				end
			end
		else
			countPos = countPos +1;
			if countPos > 50 then
				countPos = 0;
				return CenterPos;
			end
		end
	end
end
