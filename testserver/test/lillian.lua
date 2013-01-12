require("base.common")

-- UPDATE common SET com_script = 'test.lillian' WHERE com_itemid = ;

module("test.lillian", package.seeall)

function UseItem(User, SourceItem, TargetItem, counter, Param, ltstate)
    local text = "Hans Dampf;123;Peter Bulle;456"
	local splitTable = {}
	if (User.lastSpokenText == "split") then
		splitTable = split (text, "\;");
		for i=1, #(splitTable) do
			debug("SplitTable entrynumber: "..i.." = "..splitTable[i]);
		end
	end
end

function split(splitString,pattern)
	local splitTable = {};
	local tempTable = {};
	
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