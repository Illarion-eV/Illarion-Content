require("base.common")

module("base.ranklist", package.seeall)

--[[
gets the top 5 of the ranklist. Each ranklist entry contains the
name of the character and the points. 
The scriptVar is converted to a table for better handling and then shown
in a messageDialog.

ArenaList<town> format - "<name1>;<points1>;<name2>;<point2>..."
showMessage = true: displays a messagebox with the ranklist
showMessage = false: returns the ranklist table
]]

function getRanklist(User, listName, showMessage)
	local found = false;
	local listEntryString;
	local listEntryTable = {};
	local list = " ";
	local place = 2;

	found, listEntryString = ScriptVars:find(listName); -- get the top 5
	if found then
		listEntryTable = sortTable(base.common.split(listEntryString, ";"));
	elseif not found and showMessage then
		User:inform(base.common.GetNLS(User, "Die Liste ist leer.","The list is empty."));
		return {};
	end
	
	if (listEntryString == "" or listEntryString == nil) and showMessage then
		User:inform(base.common.GetNLS(User, "Die Liste ist leer.","The list is empty."));
		return {};
	end

	if showMessage then
		if table.getn(listEntryTable) ~= 0 then
			local mdList = function(dialog)
				if (not dialog:getSuccess()) then
					return;
				end
			end
			if User:getPlayerLanguage() == 0 then
				list = "Platz 1: "..listEntryTable[1].." mit "..listEntryTable[2].." Punkten.\n";
				for i=3,#(listEntryTable),2 do
					list = list.."Platz "..place.." : "..listEntryTable[i].." mit "..listEntryTable[i+1].." Punkten.\n";
					place = place +1;
				end
				mdList = MessageDialog("Top Fünf", list, nil);			
			else
				list = "Place 1: "..listEntryTable[1].." with "..listEntryTable[2].." points.\n";
				for i=3, #(listEntryTable),2 do
					list = list.."Place "..place.." : "..listEntryTable[i].." with "..listEntryTable[i+1].." points.\n";
					place = place +1;
				end
				mdList = MessageDialog("Top five", list, nil);
			end
			User:requestMessageDialog(mdList);
		else
			return;
		end
	else
		return listEntryTable;
	end
end


--[[
Saves the points of the player and if he reached the 
top five, also saves the new top five.
]]
function setRanklist(User, listName, points) 
	local ranklist = getRanklist(User, listName, false)
	local newRanklist = {};

	if tonumber(ranklist[table.getn(ranklist)]) ~= nil then
		local userInList, position = isUserInList(User, ranklist);
		if tonumber(ranklist[table.getn(ranklist)]) > points and table.getn(ranklist) == 5 then
			return;
		else
			for i=2, #(ranklist), 2 do
				if tonumber(ranklist[i]) < points then
					if not userInList then
						if table.getn(ranklist) <= 5 then 
							table.insert(ranklist, i-1, points);
							table.insert(ranklist, i-1, User.name);
							break;
						else
							table.insert(ranklist, i-1, points);
							table.insert(ranklist, i-1, User.name);
							table.remove(ranklist, table.getn(ranklist));
							table.remove(ranklist, table.getn(ranklist));
							break;
						end
					else
						table.remove(ranklist, position);
						table.remove(ranklist, position);
						table.insert(ranklist, i-1, points);
						table.insert(ranklist, i-1, User.name);
						break;
					end
				else
					if table.getn(ranklist) <= 5 then 
						table.insert(ranklist, i+1, points);
						table.insert(ranklist, i+1, User.name);
						break;
					end
				end
			end
			stringList = base.common.join(ranklist, ";");
			ScriptVars:set(listName, stringList)
		end
	else
		stringList = User.name..";"..points
		ScriptVars:set(listName, stringList)
	end
end

function isUserInList(User, ranklist)
	for i=1, #(ranklist), 2 do
		if ranklist[i] == User.name then
			return true, i;
		end
	end	
	return false, 0;
end

--Sorts a table deceanding by the value of every second entry
function sortTable(inputTable)
	local numberTable = {}
	local sortedTable = {}
	for i=2, #(inputTable), 2 do
		table.insert(numberTable, inputTable[i]);
	end	
	table.sort(numberTable);
	for i= 1, #(numberTable) do
		for j=2, #(inputTable), 2 do
			if inputTable[j] == numberTable[i] then
				table.insert(sortedTable, 1, inputTable[j]);
				table.insert(sortedTable, 1, inputTable[j-1]);
			end
		end
	end
	return sortedTable;
end