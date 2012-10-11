--Checks if the playable faction leaders is logged in and thus the NPC needs to be out of player sight

require("base.common")

module("scheduled.factionLeader", package.seeall)

function checkFactionLeader()
	if base.common.CheckIfOnline("Rosaline Edwards")[1] == true then
		npcPositions = {usualPosition=position(122, 521, 0), newPosition=position(237, 104, 0)};
		updatePosition(npcPositions)
	elseif base.common.CheckIfOnline("Valerio Guilianni")[1] == true then
		npcPositions = {usualPosition=position(337, 215, 0), newPosition=position(238, 104, 0)};
		updatePosition(npcPositions)
	elseif base.common.CheckIfOnline("Elvaine Morgan")[1] == true then
		npcPositions = {usualPosition=position(898, 775, 2), newPosition=position(239, 104, 0)};
		updatePosition(npcPositions)
	end
end

function updatePosition(npcPositions)
	if world:isCharacterOnField(npcPositions.usualPosition) == true then
		npcCharObject = world:getCharacterOnField(npcPositions.usualPosition);
		npcCharObject:forceWarp(npcPositions.newPosition);
	end
end
