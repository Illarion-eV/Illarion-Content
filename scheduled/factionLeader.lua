--Checks if the playable faction leaders is logged in and thus the NPC needs to be out of player sight

require("base.common")

module("scheduled.factionLeader", package.seeall)

informationTable = {
	{npcName="Rosaline Edwards", usualPosition=position(122, 521, 0), newPosition=position(237, 104, 0)},
	{npcName="Valerio Guilianni", usualPosition=position(337, 215, 0), newPosition=position(238, 104, 0)},
	{npcName="Elvaine Morgan", usualPosition=position(898, 775, 2), newPosition=position(239, 104, 0)}}

function checkFactionLeader()
	for i=1, #(informationTable) do
		charObject = base.common.CheckIfOnline(informationTable[i].npcName)
		if charObject ~= nil then
			updatePosition(informationTable[i].usualPosition, informationTable[i].newPosition)
		else
			updatePosition(informationTable[i].newPosition, informationTable[i].usualPosition)
		end
	end
end

function updatePosition(usualPosition, newPosition)
	if world:isCharacterOnField(usualPosition) == true then
		npcCharObject = world:getCharacterOnField(usualPosition);
		if npcCharObject:getType() == Character.npc then
			npcCharObject:forceWarp(newPosition);
		end
	end
end
