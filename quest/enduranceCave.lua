require("base.common")

-- For Fal-Fal's endurance cave

module("quest.enduranceCave", package.seeall)

function AddStageInfo(stage, german, english)
    StatusInfo[stage][0] = german;
    StatusInfo[stage][1] = english;
end




-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------
if not GlobalsInitialized then
	GlobalsInitialized = true;
			   -- magic portal coordinates 
	magPortal   = {position (20,3,-15), position (30, 3, -15),
					   position (38,5,-15), position (38,10,-15), position(38,15,-15)};

	StepAmount  = 8; 		   -- the amount of steps the player has to go
						   	   --to reach the end boss

	bosspos    	= {542,681,2}; 	   --warp position of the boss room
	anteroompos = {7,8,-15}; --warp position of the anterroom
	
	CenterPositionOfPortalRoom = position (25,11,-15); -- the center of the room
	
	searchRadius 		   = 100;			   		   -- 25 tiles search radius when
													   --looking if there are any monsters around
	
	InfoItemPosition       = position (7,11,-15);        --the position of the Info Item
	
	
	
	StatusInfo    = {gText, eText};   -- create new List which shall hold the status informations
	for i=1, StepAmount do --every step gets an own list where index 0 represents german and 1 english
		StatusInfo[i] = {};
	end
	

	AddStageInfo(1, "In der Kugel lässt sich außer dicken Nebelschwaden nichts erkennen.", "Thick fog clouds the ball. You can not see anything in the mist.");
	AddStageInfo(2, "Der Nebel hat sich leicht gelichtet, grobe schemenhafte Umrisse zeichnen sich ab.", "The mist has receded a little, rough outlines can be spotted..");
	AddStageInfo(3, "Der Nebel hat sich weiter aufgeklärt, eine annähernd menschliche Gestalt wird sichtbar.", "The mist has cleared more, an almost humanlike form becomes visible.");
	AddStageInfo(4, "Der Nebel weicht zurück, umspielt nurmehr die Beine der Gestalt. Diese trägt eine alles verhüllende Robe.", "The fog has withdrawn, lingering around the legs of the figure. It wears a robe hiding its features.");
	AddStageInfo(5, "Der Nebel ist gewichen, klar lässt sich eine vermummte Person erkennen, sie trägt eine braune Robe.", "The fog is gone. A hooded figure can be seen. It carries a brown robe.");
	AddStageInfo(6, "Die Kaputze die die Person getragen hat, hat sie nun zurückgeschlagen. Ihr Gesicht ist unscharf.", "The figure has lifted the hood of its robe. Its face is blurred however.");
	AddStageInfo(7, "Die Person lächelt dir nun zu. Es handelt sich um eine wunderschöne Menschenfrau mit wallendem blonden Haar und strahlend blauen Augen.", "The person is now smiling at you. A beautiful human female with long flowing blonde hair and sparkling blue eyes.");
	AddStageInfo(8, "Die Frau wirkt jetzt blasser. Ihre Haut unnatürlich fahl und ihr Lächeln zu einem Grinsen verzerrt.","The woman looks pale this time. Her skin an unhealthy ashen colour, her smile changed to a wicked grin.");
	AddStageInfo(9, "Die Frau sieht dich diesmal mit stechendem irren Blick an, ihre Augen blutunterlaufen. Ihr Haar zu roten Flammen gewandelt.", "This time the woman leers at you with madness in her bloodshot eyes. Her hair has turned to crimson flames.");
	
	

end
-------------------GLOBAL VARIABLES USED IN THIS MODULE------------------------

-- this function is the main function of the quest and gets activated when a player
-- goes through one of the magic portals
function InCave (User)
	local player = getCharForId(User.id);  --create a save copy of the char struct
	local portalindex = nil;
	local language = User:getPlayerLanguage();
	-- just for debugging
	
	if string.find(player.lastSpokenText, "reset") then
		player:setQuestProgress(204,1);
		GivePlayerNewSequence(player);
		player:inform("Resetting Quest!");
		player:inform("Your next step would be the "..mystep.."th step.");
		player:inform("your sequence is: " ..myseq);
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
	    if language == 1 then
		player:inform("The Portal does not work with those monsters still around.");
		else
		player:inform("Das Portal funktioniert nicht. Wohl wegen den Monstern die noch im Raum sind.");
		end
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
	    if language == 1 then
		player:inform("You feel a stinging pain in your head. As you look around you notice you're in a different room now...");
		else
		player:inform("Du spürst einen stechenden Schmerz im Kopf. Als du dich umsiehst befindest du dich in einem anderen Raum...");
		end
		
		if nextstepindex == 9 or => 11 then -- In case the Bossmonster was not killed yet, make sure Questprogress remains at 9
		player:setQuestProgress(204,9); 
		end
		
		return true, bosspos;
	end
	
	if (portalindex == steppath[nextstepindex]) then -- Tell the player he did something right, maybe?
		if language == 1 then
		player:inform("The picture in the floating ball has changed. The big room remains silent and empty.");
		else
		player:inform("Das Bild in der Flammenkugel hat sich verändert. Der große Raum bleibt ruhig und leer.");
		end
	end
	                                                    
	if (portalindex ~= steppath[nextstepindex]) then -- wrong path, reset solved status
			if language == 1 then
			player:inform("The picture in the floating ball has changed. And you hear noises coming from the big room...");
			else
			player:inform("Das Bild in der Flammenkugel hat sich verändert. Und du hörst Geräusche aus dem großen Raum...");
			end	 -- and create Monsters
		CreateMonster(nextstepindex); -- creates some monsters dependant from level
		player:setQuestProgress(204,1); -- reset step counter	
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
		monsterlist[3] = {6,6,6} -- stage 3: 1 Skeleton
		monsterlist[4] = {16,16,16,16} -- stage 4: 1 Friendly Forest Troll
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

function LookAtItem(User,Item)

	if Item.pos == InfoItemPosition  then
	
	local stage = User:getQuestProgress(204);
	local lang = User:getPlayerLanguage(); --returns 0 for german, 1=english

	User:inform(StatusInfo[stage][lang]); -- send an crypted inform about current
										    --stage to the player
	end
end
