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
		listEntryTable = base.common.split(listEntryString, ";");
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

maxEntries = 5
--[[
Saves the points of the player and if he reached the 
top five, also saves the new top five.
]]
function setRanklist(User, listName, points) 
	local ranklist = getRanklist(User, listName, false)
	local newRanklist = {}
	local joinedRanklist = {}
	
	User:inform("ranklist nr: "..#ranklist)
	for i=1, #ranklist, 2 do 
		table.insert(newRanklist, {["name"] = ranklist[i]; ["points"] = ranklist[i+1]}); 
		User:inform("inserting "..ranklist[i])
	end;

	if #newRanklist ~= 0 then
		local userInList, position = isUserInList(User, newRanklist);
		debug("Number: "..#newRanklist)
		debug("check this out: "..newRanklist[#newRanklist].name)
		debug("check this out - points: "..newRanklist[#newRanklist].points)
		if tonumber(newRanklist[#newRanklist].points) > points and #newRanklist == maxEntries then
			return;
		else
			for i=1, #newRanklist do
				if tonumber(newRanklist[i].points) < points then
					if not userInList then
						if #newRanklist < maxEntries then 
							table.insert(newRanklist, i-1, {["name"] = User.name; ["points"] = points});
							break;
						else
							table.insert(newRanklist, i-1, {["name"] = User.name; ["points"] = points});
							table.remove(newRanklist, #newRanklist);
							break;
						end
					else
						table.insert(newRanklist, i-1, {["name"] = User.name; ["points"] = points});
						table.remove(newRanklist, position);
						break;
					end
				else
					if #newRanklist < maxEntries then 
						table.insert(newRanklist, i+1, {["name"] = User.name; ["points"] = points});
						break;
					end
				end
			end
			
			for i=1, #newRanklist do 
				table.insert(joinedRanklist, newRanklist[i].points); 
				table.insert(joinedRanklist, newRanklist[i].name); 
			end;
			

			local stringList = base.common.join(joinedRanklist, ";");
			debug("String after join:" ..stringList
			ScriptVars:set(listName, stringList)
		end
	else
		local stringList = User.name..";"..points
		ScriptVars:set(listName, stringList)
	end
end

function isUserInList(User, ranklist)
	for i=1, #ranklist do
		if ranklist[i].name == User.name then
			debug("found "..User.name.." on position"..i);
			return true, i;
		end
	end	
	debug(User.name.." not found")
	return false, 0;
end