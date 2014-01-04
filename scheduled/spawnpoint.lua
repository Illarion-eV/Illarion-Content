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

-- get active bomb information by center position
SPAWNDATA = {}


function startSpawnpoint()

	spawnpointScheduled()
	


end



-- spawns monsters over a certain period of time
function spawnpointScheduled()

	if SPAWNDATAS[1] == nil then
		return
	end
	
	for i=1, #SPAWNDATAS do
	
		local position = SPAWNDATAS[i][1]
		local monsterIds = SPAWNDATAS[i][2]
		local intervals = tonumber(SPAWNDATAS[i][3])
		local endurance = tonumber(SPAWNDATAS[i][4])
		local onOff = tonumber(SPAWNDATAS[i][5])
		local gfxId = tonumber(SPAWNDATAS[i][7])
		local sfxId = tonumber(SPAWNDATAS[i][8])
	
	
		if onOff == 1 then
			if SPAWNDATAS[i][6] < endurance then
				if SPAWNDATAS[i][6] % intervals == 0 then
					
					if gfxId > 0 then
						world:gfx(gfxId,SPAWNDATAS[i][1])
					end
					
					if sfxId > 0 then
						world:makeSound(sfxId,SPAWNDATAS[i][1])
					end
					
					world:createMonster(SPAWNDATAS[i][2][Random.uniform(1,#SPAWNDATAS[i][2])],SPAWNDATAS[i][1],20)
				
				end	
				SPAWNDATAS[i][6] = SPAWNDATAS[i][6] + 1
				
			elseif SPAWNDATAS[i][6] == endurance then
		
				
				while world:isItemOnField(SPAWNDATAS[i][1]) == true do
						
					local item = world:getItemOnField(SPAWNDATAS[i][1]);
					world:erase(item, item.number)
				
				end
				
				table.remove(SPAWNDATAS,i)
			
			end
			
		end
	end	
	
end