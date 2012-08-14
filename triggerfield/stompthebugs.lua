-- Used by quest 'stomp the bugs'
--  pos -19, -5, 0
require("base.common")
require("base.keys")

module("triggerfield.stompthebugs", package.seeall)

function MoveToField(User)
	local QuestID = 27;
	local MonsterID = 131; -- CHANGE
	local MonsterPosition = position(-16, -8, 0); -- CHANGE
	local DoorPosition = position(10, 10, 1); -- CHANGE
	if (User:getQuestProgress(QuestID) == 2) then
		local m = world:getMonstersInRangeOf(MonsterPosition, 10);
		if(table.getn(m) < 1) then
			world:createMonster(MonsterID, MonsterPosition, 20);
		end
	--elseif (User:getQuestProgress(QuestID) == 3) then
	--	local door = world:getItemOnField(DoorPosition);
	--	base.keys.LockDoor(door);
	--	door = world:getItemOnField(DoorPosition);
	--	if(base.doors.CheckOpenDoor(door)) then
	--		base.doors.CloseDoor(door);
	--	end
	end
end
