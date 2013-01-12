require("base.common")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = 2697 ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, ltstate)
    local text = "Hans Dampf;123;Peter Bulle;456"
	local splitTable = {}
	if (User.lastSpokenText == "split") then
		splitTable = split(text, ";");
		for i=1, #(splitTable) do
			User:inform("SplitTable entrynumber: "..i.." = "..splitTable[i]);
		end
	end
end

function split(splitString,pattern)
	local splitTable = {};
	local tempTable = {};
	local index = 0;
	
	while true do
		index = string.find(splitString, patttern, index+1);
		if index == nil then
			break;
		end;
		table.insert(tempTable, index)
	end;
	
	for i=1, table.getn(tempTable)-1 do
		table.insert(splitTable, string.sub(splitString, tempTable[i], tempTable[i+1]));
	end
	
	return splitTable;
end

function LookAtItem(User, Item)
	base.lookat.SetSpecialDescription(Item, "Lillians rasp of doom", "Lillians rasp of doom");
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
    return true    
end