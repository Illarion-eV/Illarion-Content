require("base.common")

-- For Fal-Fal's endurance cave

module("quest.enduranceCave", package.seeall)

function AddStageInfo(stage, german, english)
    StatusInfo[stage][0] = german;
    StatusInfo[stage][1] = german;
end




-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------
if not GlobalsInitialized then
	GlobalsInitialized = true;
			   -- magic portal coordinates 
	magPortal   = {position (20,3,-5), position (30, 3, -5),
					   position (38,5,-15), position (38,10,-15), position(38,15,-15};

	StepAmount  = 8; 		   -- the amount of steps the player has to go
						   	   --to reach the end boss

	bosspos    	= {0,0,0}; 	   --warp position of the boss room
	anteroompos = {7,8,-15}; --warp position of the anterroom
	
	CenterPositionOfPortalRoom = position (25,11,-15); -- the center of the room
	
	searchRadius 		   = 100;			   		   -- 25 tiles search radius when
													   --looking if there are any monsters around
	
	InfoItemPosition       = position (1,33,7);        --the position of the Info Item
	
	StatusInfo    = {gText, eText};   -- create new List which shall hold the status informations
	for i=1, StepAmount do --every step gets an own list where index 0 represents german and 1 english
		StatusInfo[i] = {};
	end
	

	AddStageInfo(1, "1 deutsch", "1 englisch");
	AddStageInfo(2, "1 deutsch", "1 englisch");
	AddStageInfo(3, "1 deutsch", "1 englisch");
	AddStageInfo(4, "1 deutsch", "1 englisch");
	AddStageInfo(5, "1 deutsch", "1 englisch");
	AddStageInfo(6, "1 deutsch", "1 englisch");
	AddStageInfo(7, "1 deutsch", "1 englisch");
	AddStageInfo(8, "1 deutsch", "1 englisch");
	
	

end
-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------

-- this function is the main function of the quest and gets activated when a player
-- goes through one of the magic portals
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
		player:inform("Your next step would be the "..mystep.."th step.");
		player:inform("your sequence is: " ..myseq);
		
		for i=1, table.maxn(magPortal) do -- lookup through which portal he goes
			if ( equapos(player.pos, magPortal[i]) ) then
				portalindex = i;
			end
		end
		player:inform("This portal has the index: "..portalindex);
		return;
	end
	-------
	
	if not AllMonstersDead() then -- there are still monsters alive, don't let him
	    player:inform("There are still monsters alive");
		return;              	  -- warp till all monsters are dead!
	end

	for i=1, table.maxn(magPortal) do -- lookup through which portal he goes
		if ( equapos(player.pos, magPortal[i]) ) then
			portalindex = i;
		end
	end

	if (portalindex == nil) then -- player didn't walk through one of the portals,
		return;                  -- he isn't in the endurance cave
	end
	
	local nextstepindex, steppath = DecodePlayerPath(player); -- splits the path the player has to go
	                                                    -- and returns also how many steps the player has walked so far
	                                                    
	if (nextstepindex > StepAmount) then --9th step leads directly to the end boss
	    player:inform("The boss is all yours");
		return true, bosspos;
	end
	                                                    
	if (portalindex ~= steppath[nextstepindex]) then -- wrong path, reset solved status

		player:inform("bring the monsters!");	 -- and create Monsters
		CreateMonster(nextstepindex); -- creates some monsters dependant from level
		player:setQuestProgress(204,1); -- reset step counter
		player:inform("n00b, you lost the game, try it again!");	
	end

    return true, anteroompos;
		
end


--this function looks up whether all monsters around a position are dead or not
function AllMonstersDead()
	local myMonsters = world:getMonstersInRangeOf(CenterPositionOfPortalRoom, searchRadius);
	
	if (myMonsters[1]~=nil) then -- if there is at least one monster around send false
		return false;
	end
	
	return true; -- there was no monster found, so they must be all dead

end

--decodes the path and the next step the player has to do by reading the questid
--and putting it into a list
function DecodePlayerPath(player)
	local pathquestid = player:getQuestProgress(203); -- get the path steps for this player
	local steppath = base.common.Split_number(pathquestid, StepAmount); -- splits questid into a list

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


	if (stage > table.maxn(monsterlist)) then--unknown stage, don't cast any monsters
		return;
	end
	
	for i = 1, table.maxn(monsterlist[stage]) do
    	world:createMonster(monsterlist[stage][i] , CenterPositionOfPortalRoom ,20); --create monster
    end
end


--creates a new digit sequence for the player
function GivePlayerNewSequence(player)
	shufflesequence = math.random(1,4);
	
	for i = 1, (StepAmount-1) do
		shufflesequence = shufflesequence .. math.random(1,4);
	end	
	shufflesequence = tonumber(shufflesequence); --convert the string shufflesequnce
												 -- into a number
	player:setQuestProgress(203, shufflesequence);
	player:setQuestProgress(204,1);
end

--gives the player an inform about his progress of the current quest, returns the
--next stage the player reaches

function StatusInfoOnLookAt(player, Item)

	if not (equapos(Item.pos, InfoItemPosition))  then
	    return;
	end
	
	local stage = player:getQuestProgress(204);
	local lang = player:getPlayerLanguage(); --returns 0 for german, 1=english

	player:inform(StatusInfo[stage][lang]); -- send an crypted inform about current
										    --stage to the player
end
