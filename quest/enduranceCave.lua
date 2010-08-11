require("base.common")

-- For Fal-Fal's endurance cave

module("quest.enduranceCave", package.seeall)

-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------
			   -- magic portal coordinates
local magPortal = {position (10,0,0), position (20,0,0), 
				   position (10,10,0), position (20,10,0)};
				   
local StepAmount = 8; -- the amount of steps the player has to go
					   --to reach the end boss
					   
local bosspos    = position(50,50,0); --warp position of the boss room
local anteroompos = position( 0,0, 0); --warp position of the anterroom

local CenterPositionOfPortalRoom = position (0,0,0); -- the center of the room
local searchRadius 		   = 25;			   -- 25 tiles search radius
					   
local DebuggingEnabled = false;				   

-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------

function InCave (User)
	local player = getCharForId(User.id);  --create a save copy of the char struct
	local portalindex = nil;
	
	if not AllMonstersDead() then -- there are still monsters alive, don't let him
		return;              	  -- warp till all monsters are dead!
	end

	for i=1, i< table.getn(magPortal) do -- lookup through which portal he goes
		if (player.pos == magPortal[i]) then
			portalindex = i;
		end
	end

	if (portalindex == nil) then -- player didn't walk through one of the portals,
		return;                  -- he isn't in the endurance cave
	end
	
	local nextstepindex, steppath = DecodePlayerPath(player); -- splits the path the player has to go
	                                                    -- and returns also how many steps the player has walked so far
	
	if (nextstepindex > StepAmount) then --9th step leads directly to the end boss
		return true, bosspos;
	end
	                                                    
	if (portalindex ~= steppath[nextstepindex]) then -- wrong path, reset solved status
													 -- and create Monsters
		CreateMonster(nextstepindex); -- creates some monsters dependant from level
		originator:setQuestProgress(204,1); -- reset step counter	
	end

    return true, anterroompos;
		
end



function AllMonstersDead()
	local myMonsters = world:getMonstersInRangeOf(CenterPositionOfPortalRoom, searchRadius);
	
	if (myMonsters[1]~=nil) then -- if there is at least one monster around send false
		return false;
	end
	
	return true; -- there was no monster found, so they must be all dead

end

function DecodePlayerPath(player)
	local pathquestid = player:getQuestProgress(203); -- get the path steps for this player
	local steppath = Split_number(pathquestid, StepAmount); -- splits questid into a list

	local solvedsteps = player:getQuestProgress(204); -- get steps he already did
	
	
	-- increase the counter of solved quests now, will get reseted in the InCave function
	-- if the player does a wrong step
	
	originator:setQuestProgress(204,solvedsteps+1); -- step counter increased
	
	return solvedsteps, steppath;
	
end