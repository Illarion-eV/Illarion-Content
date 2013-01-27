require("base.common")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)
	ScriptVars:set("ArenaListCadomyr", "Hans Zwei;543;Peter Drei;321;Wolfgang Eins;987;Klaus Fünf;111;Holger Vier;222")
	local testTable = {"Hans Zwei", 543, "Peter Drei", 321, "Wolfgang Eins", 987, "Klaus Fünf", 111, "Holger Vier", 222}
	if (User.lastSpokenText == "list") then
		getRanklist(User, User, true)
	end
	
	if (User.lastSpokenText == "set") then
		 local list = setRanklist(User, User, 666);
		 User.inform("List: "..list);
	end
	
	if (User.lastSpokenText == "sound") then
		world:makeSound( 13, User.pos )
	end
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end

arenaInformations = {{playerPos=position(10,10,0), monsterPos=position(10,0,0), npcName="Alsaya", town="Cadomyr"}, 
					{playerPos=position(10,10,0), monsterPos=position(10,0,0), npcName="Alsaya", town="Runewick"}, 
					{playerPos=position(10,10,0), monsterPos=position(10,0,0), npcName="Alsaya", town="Galmair"}}

function getRanklist(User, NPC, message)
	local arena = getArena(User, NPC);
	local town = arenaInformations[arena].town;
	local found = false;
	local arenaEntry;
	local arenaList = {};
	local list = " ";
	local place = 2;
	
	for i=1, 5 do  -- get the top 5
		found, arenaEntry = ScriptVars:find("ArenaListCadomyr");
		if found then
			arenaList = sortTable(base.common.split(arenaEntry, ";"));
		elseif found == false or table.getn(arenaList) ~= 10 then
			User:inform("[ERROR] An error occured please contact a developer.")
		end
	end
	
	if message then
		local mdList = function(dialog)
			if (not dialog:getSuccess()) then
				return;
			end
		end
		if User:getPlayerLanguage() == 0 then
			list = "Platz 1: "..arenaList[1].." mit "..arenaList[2].." Punkten.\n";
			for i=3,#(arenaList),2 do
				list = list.."Platz "..place.." : "..arenaList[i].." mit "..arenaList[i+1].." Punkten.\n";
				place = place +1;
			end
			mdList = MessageDialog("Top fünf Kämpfer des Reiches", list, nil);			
		else
			list = "Place 1: "..arenaList[1].." with "..arenaList[2].." points.\n";
			for i=3, #(arenaList),2 do
				list = list.."Place "..place.." : "..arenaList[i].." with "..arenaList[i+1].." points.\n";
				place = place +1;
			end
			mdList = MessageDialog("Top five fighters of the realm", list, nil);
		end
		User:requestMessageDialog(mdList);
	else
		return arenaList;
	end
end

function getArena(User, NPC)
	for i=1, #(arenaInformations) do
		if arenaInformations[i].npcName == NPC.name then
			return i;
		else
			return "";
		end
	end
end

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

--[[
Saves the points of the player and if he reached the 
top five, also saves the new top five.
]]
function setRanklist(User, NPC, points) 
	local ranklist = getRanklist(User, NPC, false)
	local arena = getArena(User, NPC);
	local town = arenaInformations[arena].town;
	local quest = arenaInformations[arena].quest;
	local newRanklist = {};
	local arenaListName = "ArenaList"..town;
	
	User:setQuestProgress(quest, points);
	
	if ranklist[table.getn(ranklist)] > points then
		return;
	else
		for i=2, #(ranklist), 2 do
			if ranklist[i] < points then
				table.insert(ranklist, i, points);
				table.insert(ranklist, i, User.name);
				table.remove(ranklist, 1);
				table.remove(ranklist, 1);
				break;
			end
		end
		stringList = base.common.base.common.join(ranklist);
		ScriptVars:set(arenaListName, stringList)
		return stringList;
	end
end