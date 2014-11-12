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

local common = require("base.common")

local M ={}

--[[
gets the top 5 of the ranklist. Each ranklist entry contains the
name of the character and the points. 
The scriptVar is converted to a table for better handling and then shown
in a messageDialog.

list format - "<name1>;<points1>;<name2>;<point2>..."
showMessage = true: displays a messagebox with the ranklist
showMessage = false: returns the ranklist table
]]

function M.getRanklist(User, listName, showMessage)
	local found = false;
	local listEntryString;
	local listEntryTable = {};
	local list = " ";

	found, listEntryString = ScriptVars:find(listName); -- get the top 5
	if found then
		listEntryTable = convertTo2dTable(common.split(listEntryString, ";"));
	elseif not found and showMessage then
		User:inform(common.GetNLS(User, "Die Liste ist leer.","The list is empty."));
		return {};
	end
	
	if (listEntryString == "" or listEntryString == nil) and showMessage then
		User:inform(common.GetNLS(User, "Die Liste ist leer.","The list is empty."));
		return {};
	end

	if showMessage then
		if #listEntryTable ~= 0 then
			showList(User, listEntryTable)
		end
	else
		return listEntryTable;
	end
end


function showList(User, ranklist)
	local list = ""

	local mdList = function(dialog)
		if (not dialog:getSuccess()) then
			return;
		end
	end
	if User:getPlayerLanguage() == 0 then
		for i=1, #ranklist do
			list = list.."Platz "..i.." : "..ranklist[i].name.." mit "..ranklist[i].points.." Punkten.\n";
		end
		mdList = MessageDialog("Top Fünf", list, nil);			
	else
		for i=1, #ranklist do
			list = list.."Place "..i.." : "..ranklist[i].name.." with "..ranklist[i].points.." points.\n";
		end
		mdList = MessageDialog("Top five", list, nil);
	end
	User:requestMessageDialog(mdList);
end

maxEntries = 5
--[[
Saves the points of the player and if he reached the 
top five, also saves the new top five.
]]
function M.setRanklist(User, listName, points) 
	local ranklist = M.getRanklist(User, listName, false)
	local joinedRanklist = {}
	
	--User:inform("ranklist nr: "..#ranklist)
	if User:isAdmin() then
		return;
	else
		if #ranklist ~= 0 then
			local userInList, position = isUserInList(User, ranklist);
			--debug("Number: "..#ranklist)
			--debug("check this out: "..ranklist[#ranklist].name)
			--debug("check this out - points: "..ranklist[#ranklist].points)
			if tonumber(ranklist[#ranklist].points) > points and #ranklist == maxEntries then
				return;
			else
				if not userInList then
					table.insert(ranklist, {["name"] = User.name; ["points"] = points});
				else
					table.remove(ranklist, position);
					table.insert(ranklist, {["name"] = User.name; ["points"] = points});
				end
				
				table.sort(ranklist, compare)
				joinedRanklist = convertToOneTable(ranklist)
				
				local stringList = table.concat(joinedRanklist, ";");
				--debug("String before deletion" ..stringList)
				
				while #ranklist > maxEntries do
					table.remove(ranklist);
				end
				
				joinedRanklist = convertToOneTable(ranklist)
				
				local stringList = table.concat(joinedRanklist, ";");
				--debug("String after join:" ..stringList)
				ScriptVars:set(listName, stringList)
			end
		else
			local stringList = User.name..";"..points
			ScriptVars:set(listName, stringList)
		end
	end
end

function compare(tableA, tableB)
	return tonumber(tableA.points) > tonumber(tableB.points);
end

function convertTo2dTable(list)
	local newTable = {}
	
	for i=1, #list, 2 do 
		table.insert(newTable, {["name"] = list[i]; ["points"] = list[i+1]}); 
	end;
	return newTable;
end

function convertToOneTable(list)
	local joinedTable = {}
	
	--debug("lenght of list: "..#list)

	for i=1, #list do 
		--debug("List: "..i.." "..list[i].name.." "..list[i].points)
		table.insert(joinedTable, list[i].name); 
		table.insert(joinedTable, list[i].points); 
	end;
	--debug("JoinedTable "..joinedTable[1])
	
	return joinedTable;
end

function isUserInList(User, ranklist)
	for i=1, #ranklist do
		if ranklist[i].name == User.name then
			--debug("found "..User.name.." on position"..i);
			return true, i;
		end
	end	
	--debug(User.name.." not found")
	return false, 0;
end

return M