--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--Checks if the playable faction leaders is logged in and thus the NPC needs to be out of player sight

local common = require("base.common")

local M = {}

M.informationTable = {
	{npcName="Rosaline Edwards", usualPosition=position(122, 521, 0), newPosition=position(237, 104, 0)},
	{npcName="Valerio Guilianni", usualPosition=position(337, 215, 0), newPosition=position(238, 104, 0)},
	{npcName="Elvaine Morgan", usualPosition=position(898, 775, 2), newPosition=position(239, 104, 0)}}

function M.checkFactionLeader()
	for i=1, #(M.informationTable) do
		charObject = common.CheckIfOnline(M.informationTable[i].npcName)
		if charObject ~= nil then
			M.updatePosition(M.informationTable[i].usualPosition, M.informationTable[i].newPosition)
		else
			M.updatePosition(M.informationTable[i].newPosition, M.informationTable[i].usualPosition)
		end
	end
end

function M.updatePosition(usualPosition, newPosition)
	if world:isCharacterOnField(usualPosition) == true then
		npcCharObject = world:getCharacterOnField(usualPosition);
		if npcCharObject:getType() == Character.npc then
			npcCharObject:forceWarp(newPosition);
		end
	end
end

return M
