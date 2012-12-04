require("base.common")
module("npc.base.escortingquests", package.seeall)

function initEscorting()
	spawnlist    = {}; --holds a list with the MonsterAmount that shall be created with Monsterid as key for the list
	waypoints    = {}; --holds the waypoints till reaching target destination for every escorted npc
    SpawnAtWP    = {}; --holds which spawnID shall be spawned at WP position(=false if no monsters shall be spawned)
	percentSpawn = {}; --holds at which percent(table key) which spawnID shall be spawned
	player 		 = {}; --the player who escorts the npc
	lastdir      = {}; --the last direction the npc said
	dirTextger	 = {"Nordosten", "Osten", "Südosten", "Süden", "Südwesten", "Westen", "Nordwesten"}; --holds text dependant from direction(german)
	dirTexteng	 = {"northeast", "east" , "southeast","south", "southwest", "west"  , "northwest" }; --holds text dependant from direction(english)
	table.insert (dirTextger , 0, "Norden");
	table.insert (dirTexteng , 0, "North");
	
	MaxOffsetToPlayer = 10; --if player is 10 tiles away from the npc the Npc looks for a new escort
	
	---INIT SPAWNS HERE---
	AddToSpawn(1, 1, 3); --3 mummies
	AddToSpawn(1, 2, 5); --5 insects
	----------------------	
end

function AddToSpawn(SpawnID, MonsterID, MonsterAmount) --adds a monster to a spawn
	if spawnlist[SpawnID]==nil then
		table.insert(spawnlist,SpawnID,{});
	end
	spawnlist[SpawnID][MonsterID] = MonsterAmount;--adds the amount of monsters with key MonsterID to this Spawn
end

function Spawn(SpawnID,thisNPC) --Spawns all monsters from a Spawn
	if spawnlist[SpawnID] == nil then return; end --nil prevention
	for monID, monAmount in pairs(spawnlist[SpawnID]) do
	    ReleaseMonster(monID,monAmount,thisNPC);
	end
end

function ReleaseMonster(monID,monAmount,thisNPC) --creates the monsters for the spawn
	for i=1, monAmount do
	    world:createMonster(monID, position(thisNPC.pos.x+math.random(1,6), thisNPC.pos.y+math.random(1,6),thisNPC.pos.z), 10); --create monsters
	end
end

--[[
function AddWaypoint(thisNPC,posstruct, SpawnedMonAtWP) --Adds a waypoint, SpawnedMonAtWP is false or holds the SpawnID if monsters shall be created at this WP
	if waypoints[thisNPC.id]==nil then
		table.insert(waypoints,thisNPC.id,{});
	end
	table.insert(waypoints[thisNPC.id], posstruct);--add WP to the list

	if SpawnedMonAtWP== nil then SpawnedMonAtWP= false; end
	if SpawnAtWP[thisNPC.id]==nil then
		table.insert(SpawnAtWP,thisNPC.id,{});--spawnID or false if no monster shall be spawned
	end

	table.insert(SpawnAtWP[thisNPC.id],SpawnedMonAtWP); --spawnID or false if no monster shall be spawned
end
]]--
function AddWaypoint(thisNPC,posstruct, SpawnedMonAtWP) --Adds a waypoint, SpawnedMonAtWP is false or holds the SpawnID if monsters shall be created at this WP
	--if waypoints[thisNPC.id]==nil then
	--	table.insert(waypoints,thisNPC.id,{});
	--end
	waypoints[thisNPC.id][table.getn (waypoints[thisNPC.id])+1] = posstruct;  --add WP to the list
	if SpawnedMonAtWP== nil then SpawnedMonAtWP= false; end
	--if SpawnAtWP[thisNPC.id]==nil then
	--	table.insert(SpawnAtWP,thisNPC.id,{});--spawnID or false if no monster shall be spawned
	--end

    SpawnAtWP[thisNPC.id][table.getn (SpawnAtWP[thisNPC.id])+1] = SpawnedMonAtWP;
	--table.insert(SpawnAtWP[thisNPC.id],{SpawnedMonAtWP}); --spawnID or false if no monster shall be spawned
end

function SpawnAtRoutePercentage(thisNPC,percent,SpawnID) --spawns the monsters from a Spawn at percent Percentage of the Route
	percentSpawn[thisNPC.id][percent] = SpawnID;
end

function GetDirToNextWP(thisNPC) --returns the direction to the next waypoint
	local RangeToCheck = 100;
	if table.getn(waypoints[thisNPC.id])>0 then
        --thisNPC:talk(Character.say,"Calculating route to point: x="..waypoints[thisNPC.id][1].x ..", y="..waypoints[thisNPC.id][1].y);
		fnd,dir = player[thisNPC.id]:getNextStepDir(waypoints[thisNPC.id][1],RangeToCheck);
		while not fnd do
			RangeToCheck = RangeToCheck + 10;
			thisNPC:talk(Character.say,"RangeToCheck:"..RangeToCheck)
			fnd,dir = player[thisNPC.id]:getNextStepDir(waypoints[thisNPC.id][1],RangeToCheck);
			if RangeToCheck == 300 then
				break;
			end
		end 
		--if fnd == false then thisNPC:talk(Character.say,"fnd=false"); end
		--if dir == nil then thisNPC:talk(Character.say,"dir = nil"); end
		--if dir ~=   4 then thisNPC:talk(Character.say,"dir = "..dir); end
	end
	if (dir~= false and dir~=nil) then
    	return dirTextger[dir],dirTexteng[dir], dir;
    else
    	return false;
    end

end

function GetDirToPosition(thisNPC,desPos) --returns the direction to the desired position
	local RangeToCheck = 100;
        --thisNPC:talk(Character.say,"Calculating route to point: x="..waypoints[thisNPC.id][1].x ..", y="..waypoints[thisNPC.id][1].y);
		fnd,dir = thisNPC:getNextStepDir(desPos,RangeToCheck);
		while not fnd do
			RangeToCheck = RangeToCheck + 10;
			fnd,dir = thisNPC:getNextStepDir(desPos,RangeToCheck);
			if RangeToCheck == 300 then
				break;
			end
		end 
		--if fnd == false then thisNPC:talk(Character.say,"fnd=false"); end
		--if dir == nil then thisNPC:talk(Character.say,"dir = nil"); end
		--if dir ~=   4 then thisNPC:talk(Character.say,"dir = "..dir); end
	if (dir~= false and dir~=nil) then
    	return dirTextger[dir],dirTexteng[dir], dir;
    else
    	return false;
    end

end


function RemoveWaypoint(thisNPC, amountElements) --removes amountElements Waypoint from the waypoints list, because the NPC reached this position
	if amountElements == nil then amountElements = 1; end
	for i=1, amountElements do
		table.remove(waypoints[thisNPC.id], 1); --removes the first WP of the list and moves up the remaining indices
		table.remove(SpawnAtWP[thisNPC.id], 1); --removes the first WP spawn of the list and moves up the remaining indices
	end
end


function BE_nextCycle(thisNPC)
  	move[thisNPC.id].nextCycle();
    if wait(1,1) then
		local dirger,direng,dir = GetDirToNextWP(thisNPC);
	  	--base.common.TalkNLS(thisNPC, Character.say, "bla2"..lastdir[thisNPC.id].." dir:"..dir, "bla2"..lastdir[thisNPC.id].." dir:"..dir);
	  	if lastdir[thisNPC.id]~=dir and dir~=false and dir~= nil then
	  		base.common.TalkNLS(thisNPC, Character.say, "Nun müssen wir Richtung "..dirger, "Now we need to go "..direng);
	  		lastdir[thisNPC.id]=dir;
		end
		if dirger == false then base.common.TalkNLS(thisNPC, Character.say, "ERROR, Richtung nicht gefunden", "ERROR, no direction found."); end
	end
end


function IsEscortingPlayerOnline(thisNPC) --looks whether the Escorting Player is still online 
	local playerlist = world:getCharactersInRangeOf(thisNPC.pos, MaxOffsetToPlayer); 
	local PlayerOnline = false;
	
	for key, escort in pairs(playerlist) do
		if escort.id == player[thisNPC.id].id then
			PlayerOnline=true;
		end
	end
	return PlayerOnline;
end	


function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
    	myOrderNPC:receiveText(originator,message);
        TellSmallTalk(message,originator);
	end
end

function useNPC(user,counter,param)
    if ( myOrderNPC:checkOrder(user) == true ) then

    else
        thisNPC:talk(Character.say,"Lass mich in ruhe wenn du nichts für mich hast");
    end
end
