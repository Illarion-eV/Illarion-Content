-- Quest: The Missing Son
require("base.common")

module("triggerfield.missingson_caveentrance", package.seeall)

function MoveToField(User)
	local QuestID = 999;
	local MonsterPositions = { };
	MonsterPositions[0] = position(0,0,0);
	local ChildPosition = position(0,0,0);
	if (User:getQuestProgress(QuestID) == 2) then
		base.common.InformNLS(User,
			"Als du durch den Eingangsspalt blickst, fällt dir auf, dass in der Höhle Licht brennt.",
			"As you look trough the entrance, you notice that there's light in the cave.");
		local m = world:getMonstersInRange(MonsterPositions[0], 10);
		for i = table.getn(m), table.getn(MonsterPositions), 1  do
			world:createMonster(55, MonsterPositions[i], 20);
		end
		world:createDynamicNPC("Fred",0,ChildPosition,0,"npc_missingson_fred.lua");
	end
end
