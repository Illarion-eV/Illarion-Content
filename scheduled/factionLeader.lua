--Checks if the playable faction leaders is logged in and thus the NPC needs to be out of player sight

require("base.common")

module("scheduled.factionLeader", package.seeall)


function checkFactionLeader()
	informationTable = {["Rosaline Edwards"] = {usualPosition=position(122, 521, 0), newPosition=position(237, 104, 0)}, ["Valerio Guilianni"] = {usualPosition=position(337, 215, 0), newPosition=position(238, 104, 0)}, ["Elvaine Morgan"] = {usualPosition=position(898, 775, 2), newPosition=position(239, 104, 0)}}
	alsaya = base.common.CheckIfOnline("Alsaya")
	for i=1, #(informationTable) do
		charObject = base.common.CheckIfOnline(informationTable[i])
		base.common.InformNLS(alsaya,"name: "..informationTable[i].." ende",".."); --sending the message
		if charObject.name ~= nil then
			updatePosition(npcPositions)
		end
	end
end

function updatePosition(npcPositions)
	if world:isCharacterOnField(npcPositions.usualPosition) == true then
		npcCharObject = world:getCharacterOnField(npcPositions.usualPosition);
		npcCharObject:forceWarp(npcPositions.newPosition);
	end
end
