-- base script for patrolling npcs or monsters
require("npc.base.waypoints");
require("base.doors")
module("npc.base.patrol", package.seeall)

-- ** defaults **
PatrolPointer = 0;				--
WpPointer = 0;					-- pointers for the PatrolList
RandomPatrolChooser = true;		-- define if the patrols are randomly chosen. Can be changed in other scripts.
WpDone = 0;						-- count how many waypoints (as destination) have been visited
WpMax = 0;						-- save how many waypoints have to be visited in this patrol
NextWp = nil;					-- save the next waypoint (the guard is walking to)
CurWp = nil;					-- save the current waypoint (the guard is walking away from)
WpTry = 0;						-- save how many times the route was aborted and choose a solution

--[[
PatrolList must contain lists with positions at first, then they are replaced with the respective waypoints
@ index base of every list must contain a list:
	[1] boolean  true if waypoints are randomly chosen
	[2] integer  number of waypoints to be chosen before patrol ends. 0=list.length
]]
PatrolList = {};


-- replace position data in PatrolList with waypoints and delete those which have no respective waypoint
function BP_PatrolInit(guard)
	if patrolInit~=nil then
		return;
	end
	patrolInit = 1;
	local nospace = true;
	for _,patrol in pairs(PatrolList) do
		nospace = true;
		for j,pos in ipairs(patrol) do
			local wp = BP_GetWpFromPos(pos);
			if wp==nil then
				nospace = false;
				patrol[j] = -1;
			else
				patrol[j] = wp;
			end
		end
		-- fill in the spaces, if not all positions could be assigned to a wp
		if not nospace then
			local free = nil;
			for j,pos in ipairs(patrol) do
				if pos==-1 then
					if not free then
						free = j;
					end	
				elseif free then
					patrol[free] = pos;
					free = free + 1;
					patrol[j] = nil;
				end
			end
		end
	end
end

--[[
starts the patrol and initializes the PatrolList and WaypointList
  @return boolean  if the patrol has been started
]]
function BP_StartPatrol(guard)
	if firstStartPatrol==nil then
		firstStartPatrol = 1;
		BWP_Init();
		BP_PatrolInit();
	end
	PatrolPointer = 0;
	WpTry = 0;
	BP_ChooseNewPatrol(guard);
	NextWp = BP_GetWpFromPos(guard.pos);
	if not NextWp then
		NextWp = PatrolList[PatrolPointer][WpPointer];
		guard:forceWarp(NextWp.pos);
	end
	if not NextWp then
		return false;
	end
	guard.waypoints:clear();
	BP_SetNewWp(guard);
	guard:setOnRoute(true);
	return true;
end

--[[
choose a new patrol. Sequential and random (see RandomPatrolChooser) is supported.
If you want to define an own algorithm, define a function BP_ChooseCustomPatrol(guard)
It should set WpPointer,WpDone,WpMax,PatrolPointer and return if something was done.
If not, the regular function will continue.
]]
function BP_ChooseNewPatrol(guard)
	if BP_ChooseCustomPatrol then
		if BP_ChooseCustomPatrol(guard) then
			return;
		end
	end
	guard.waypoints:clear();
	WpPointer = 0;
	WpDone = 0;
	local l = table.getn(PatrolList);
	if RandomPatrolChooser then
		PatrolPointer = math.random(1,l);
	else
		PatrolPointer = PatrolPointer + 1;
		if PatrolPointer>l then
			PatrolPointer = 1;
		end
	end
	if PatrolList[PatrolPointer].base[2] ~= 0 then
		WpMax = PatrolList[PatrolPointer].base[2];
	else
		WpMax = table.getn(PatrolList[PatrolPointer]);
	end
	BP_ChooseNewWp();
end

-- choose a new waypoint as destination, sequentially or randomly
function BP_ChooseNewWp()
	--npcdebug("ChooseNewWp");
	local l = table.getn(PatrolList[PatrolPointer]);
	if PatrolList[PatrolPointer].base[1] then
		WpPointer = math.random(1,l);
	else
		WpPointer = WpPointer + 1;
		if WpPointer>l then
			WpPointer = 1;
		end
	end
end

-- get the respective waypoint or nil if noone exists
function BP_GetWpFromPos(pos)
	local index = BWP_PosToIndex(pos);
	for _,area in pairs(WaypointList) do
		if area[index] then
			return area[index];
		end
	end
	return nil;
end

--[[
choose and set a new (temporary) waypoint.
NextWp has to be set (which is actually the current waypoint)
]]
function BP_SetNewWp(guard)
	if equapos(guard.pos,PatrolList[PatrolPointer][WpPointer].pos) then
		WpDone = WpDone + 1;
		if WpDone>=WpMax then
			BP_ChooseNewPatrol(guard);
		else
			BP_ChooseNewWp();
		end
	end
	local last = CurWp;
	CurWp = NextWp;
	local w = false;
	NextWp,w = CurWp:getNextWaypoint(PatrolList[PatrolPointer][WpPointer],last);
	BP_OpenDoor();
	guard.waypoints:addWaypoint(NextWp.pos);
	if w then
		guard:warp(NextWp.pos);
	end
end

--[[
continues patrol when route is aborted (set new wp, warp or restart patrol)
should be called in the respective function of the monster/npc OR in base_guard.lua
]]
function BP_AbortRoute(guard)
	if equapos(guard.pos,NextWp.pos) then
		npcdebug("try OK");
		WpTry = 0;
		guard.waypoints:clear();
		BP_CloseDoor();
		BP_SetNewWp(guard);
		guard:setOnRoute(true);
	elseif WpTry==0 then
		npcdebug("try 0");
		WpTry = 1;
		guard:setOnRoute(true);
	elseif WpTry==1 then
		npcdebug("try 1");
		guard:warp(NextWp.pos);
		WpTry = 2;
		BP_AbortRoute(guard);
	elseif WpTry==2 then
		npcdebug("try 2");
		guard:forceWarp(NextWp.pos);
		WpTry = 3;
		BP_AbortRoute(guard);
	else
		npcdebug("try 3");
		BP_StartPatrol(guard);
	end
end

-- open the door of curWp
function BP_OpenDoor()
	local door = CurWp.data.door;
	if door and equapos(door.toPos,NextWp.pos) then
		local item = BP_GetDoorItem(door.pos);
		base.doors.OpenDoor(item);
	end
end

-- close the door of NextWp
function BP_CloseDoor()
	local door = NextWp.data.door;
	if door and equapos(door.toPos,CurWp.pos) then
		local item = world:getItemOnField(door.pos);
		base.doors.CloseDoor(item);
	end
end

-- get the door item, works only if it is on top
function BP_GetDoorItem(Posi)
    local item = world:getItemOnField(Posi);
	if (base.doors.CheckOpenDoor(item.id) or base.doors.CheckClosedDoor(item.id)) then
		return item;
	end;
    return nil;
end;

function BP_CharacterNear(guard,char)
	--npcdebug("char near");
	if equapos(NextWp.pos,char.pos) then
		npcdebug("char on waypoint, abort route!");
		BP_AbortRoute(guard);
	end
end

function npcdebug(text)
	thisNPC:talk(CCharacter.say,"[DEBUG] ".. text);
end

function getPos(pos)
	return pos.x ..",".. pos.y;
end