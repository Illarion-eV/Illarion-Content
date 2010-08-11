require("base.common")

-- For Fal-Fal's endurance cave

module("quest.enduranceCave", package.seeall)

-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------
			   -- magic portal coordinates
	magPortal = {position (240,732,0), position (240,722,0), 
					   position (250,732,0), position (250,722,0)};
					   
	StepAmount = 8; -- the amount of steps the player has to go
						   --to reach the end boss
						   
	bosspos    = position(0,0,0); --warp position of the boss room
	anteroompos = position(250,737, 0); --warp position of the anterroom
	
	CenterPositionOfPortalRoom = position (245,727,0); -- the center of the room
	searchRadius 		   = 80;			   -- 25 tiles search radius
						   
	DebuggingEnabled = false;
-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------

function InCave (User)
	local player = getCharForId(User.id);  --create a save copy of the char struct
	local portalindex = nil;
	
	-- just for debugging
	
	if string.find(player.lastSpokenText, "reset") then
		GivePlayerNewSequence(player);
		return;
	elseif string.find(player.lastSpokenText, "status") then
		mystep = player:getQuestProgress(204);
		myseq  = player:getQuestProgress(203); 
		player:inform("Your next step would be number "..mystep);
		player:inform("your sequence is: " ..myseq);
		
		for i=1, i< table.getn(magPortal) do -- lookup through which portal he goes
			if (player.pos == magPortal[i]) then
				portalindex = i;
			end
		end
		player:inform("This portal has the index: "..portalindex);
		return;
	end
	-------
	
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
		player:setQuestProgress(204,1); -- reset step counter
		player:inform("n00b, you lost the game, try it again!");	
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
	
	player:setQuestProgress(204,solvedsteps+1); -- step counter increased
	
	return solvedsteps, steppath;
	
end

function CreateMonster(stage)
	if not MonsterListInitialized then
		MonsterListInitialized = true;
		
		monsterlist = {};
		                 --ids of all monsters
		                 
		monsterlist[1] = {6}; --stage 1 : 1 Friendly Human
		monsterlist[2] = {16,16} -- stage 2: 1 Friendly Dwarf
		monsterlist[3] = {116,116,116} -- stage 3: 1 Skeleton
		monsterlist[4] = {226,226,226,226} -- stage 4: 1 Friendly Forest Troll
		monsterlist[5] = {292,292,292,292,292} -- stage 5: 1 Pig
		monsterlist[6] = {293,293,293,293,293,293} -- stage 6: 1 Cow
		monsterlist[7] = {294,294,294,294,294,294,294} -- stage 7: 1 Deer
		monsterlist[8] = {295,295,295,295,295,295,295,295} -- stage 8: 1 Rabbit
	end	


	if (stage > table.getn(monsterlist)) then--unknown stage, don't cast any monsters
		return;
	end
	
	for i = 1, table.getn(monsterlist) do
    	world:createMonster(monsterlist[stage][i] , CenterPositionOfPortalRoom ,20); --create monster
    end
end



function GivePlayerNewSequence(player)
	shufflesequence = math.random(1,4);
	
	for i = 1, (StepAmount-1) do
		shufflesequence = shufflesequence .. math.random(1,4);
	end	
	
	player:inform("Your sequence is: "..tonumber(shufflesequence));
	player:setQuestProgress(203, shufflesequence);
	player:setQuestProgress(204,1);
end