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