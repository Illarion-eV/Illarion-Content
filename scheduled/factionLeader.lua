--Checks if the playable faction leaders is logged in and thus the NPC needs to be out of player sight

require("base.common")

module("scheduled.factionLeader", package.seeall)

function checkFactionLeader()

	players=world:getPlayersOnline()
	for index, playerName in pairs(players) do
		if playerName == "Rosaline Edwards" then
			npcPositions = {position(122, 521, 0), position(237, 104, 0)};
			updatePosition(npcPositions)
		elseif playerName == "Valerio Guilianni" then
			npcPositions = {position(337, 215, 0), position(238, 104, 0)};
			updatePosition(npcPositions)
		elseif playerName == "Elvaine Morgan" then
			npcPositions = {position(898, 775, 2), position(239, 104, 0)};
			updatePosition(npcPositions)
		end
	end
end

function updatePosition(npcPositions)
	if world:isCharacterOnField(npcPositions[1]) == true then
		npcCharObject = world:getCharacterOnField(npcPositions[1]);
		npcCharObject:forceWarp(npcPositions[2]);
	end
end
