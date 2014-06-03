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
require("base.common")
module("scheduled.spawnpoint", package.seeall)
-- INSERT INTO scheduledscripts VALUES('scheduled.spawnpoint', 5, 5, 'startSpawnpoint');



-- This script is used for character independet events lasting over some time


-- conatining all center points
SPAWNDATAS = {}
gmSpawnpointSettings = {}
gmMonsters = {}
-- get active bomb information by center position
SPAWNDATA = {}



function startSpawnpoint()
	spawnGM()
end


function spawnGM()
	local mon;
	if gmSpawnpointSettings[1] == nil then
		return
	end
	for i=1, #gmSpawnpointSettings do
		local monsterIds = gmSpawnpointSettings[i][1];
		local position = gmSpawnpointSettings[i][2];
		local amount = gmSpawnpointSettings[i][3];
		local intervals = gmSpawnpointSettings[i][4];
		local endurance = gmSpawnpointSettings[i][5];
		local gfxId = gmSpawnpointSettings[i][6];
		local sfxId = gmSpawnpointSettings[i][7];
		local pause = gmSpawnpointSettings[i][9];
		--sets/checks 8 array pos as counter
		if checkValue(pause) == false then
		if gmSpawnpointSettings[i][8] == nil then
			gmSpawnpointSettings[i][8] = 0;
		else
			gmSpawnpointSettings[i][8] = gmSpawnpointSettings[i][8]+1;
		end
		if checkValue(intervals) == false then
			intervals = 1
		end
		if gmSpawnpointSettings[i][8] % intervals == 0 then
			--keeps counter from overflow
			if checkValue(endurance) == false then
				gmSpawnpointSettings[i][8] = 0
			end
			if #gmMonsters[i]-1 < amount then
				updateMonsters(gmMonsters,i);
				mon = world:createMonster(monsterIds[Random.uniform(1,#monsterIds)], position,10);
				if isValidChar(mon) then
					table.insert(gmMonsters[i],mon);
					--does GFX with spawn
					if checkValue(gfxId) == true then
						world:gfx(gfxId,position)
					end
					--Does SFX with spawn
					if  checkValue(sfxId) == true then
						world:makeSound(sfxId,position)
					end
				end
			else
				updateMonsters(gmMonsters,i);
			end
		end
		--Removes spawnpoint if he reaches the maximum number of cycles
		if checkValue(endurance) == true then
			if gmSpawnpointSettings[i][8] >= endurance then
				table.remove(gmSpawnpointSettings, i)
				table.remove(gmMonsters, i)
			end
		end
		end
	end
end

function checkValue(input)
	if input == 0 then
		return false
	else
		return true
	end
end

function updateMonsters(array,number)
	if #array[number] > 1 then
		for i = #array[number], 2, -1 do
			local mon = array[number][i];
			if not isValidChar(mon) then
				table.remove(array[number], i)
			end
		end
	end
end
