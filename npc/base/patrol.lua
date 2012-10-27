-- base script for patrolling npcs or monsters
require("npc.base.waypoints");
require("base.doors")
module("npc.base.patrol", package.seeall)

-- functions for subscription:
-- AbortRoute(guard)
-- CharacterNear(guard,char)

-- ** defaults **
PatrolPointer = {};				--
WpPointer = {};					-- pointers for the PatrolList
RandomPatrolChooser = {};		-- define if the patrols are randomly chosen. Can be changed in other scripts.
WpDone = {};					-- count how many waypoints (as destination) have been visited
WpMax = {};						-- save how many waypoints have to be visited in this patrol
NextWp = {};					-- save the next waypoint (the guard is walking to)
CurWp = {};					    -- save the current waypoint (the guard is walking away from)
WpTry = {};						-- save how many times the route was aborted and choose a solution
PatrolInitDone = {};

--[[
PatrolList must contain lists with positions at first, then they are replaced with the respective waypoints
@ index base of every list must contain a list:
	[1] boolean  true if waypoints are randomly chosen
	[2] integer  number of waypoints to be chosen before patrol ends. 0=list.length
]]
PatrolList = {};


-- replace position data in PatrolList with waypoints and delete those which have no respective waypoint
function PatrolInit(guard)
	if PatrolInitDone[guard.id]~=nil then
		return;
	end
	PatrolInitDone[guard.id] = 1;
	PatrolPointer[guard.id] = 0;
	WpPointer[guard.id] = 0;
	RandomPatrolChooser[guard.id] = true;
	WpDone[guard.id] = 0;
	WpMax[guard.id] = 0;
	NextWp[guard.id] = nil;
	CurWp[guard.id] = nil;
	WpTry[guard.id] = 0;
	local nospace = true;
	for _,patrol in pairs(PatrolList) do
		nospace = true;
		for j,pos in ipairs(patrol) do
			local wp = GetWpFromPos(pos);
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
function StartPatrol(guard)
	if firstStartPatrol==nil then
		firstStartPatrol = 1;
		npc.base.waypoints.Init();
		PatrolInit();
	end
	PatrolPointer[guard.id] = 0;
	WpTry[guard.id] = 0;
	ChooseNewPatrol(guard);
	NextWp[guard.id] = GetWpFromPos(guard.pos);
	if not NextWp[guard.id] then
		NextWp[guard.id] = PatrolList[PatrolPointer[guard.id]][WpPointer[guard.id]];
		guard:forceWarp(NextWp[guard.id].pos);
	end
	if not NextWp[guard.id] then
		return false;
	end
	guard.waypoints:clear();
	SetNewWp(guard);
	guard:setOnRoute(true);
	return true;
end

--[[
choose a new patrol. Sequential and random (see RandomPatrolChooser) is supported.
If you want to define an own algorithm, define a function ChooseCustomPatrol(guard)
It should set WpPointer,WpDone,WpMax,PatrolPointer and return if something was done.
If not, the regular function will continue.
]]
function ChooseNewPatrol(guard)
	if ChooseCustomPatrol then
		if ChooseCustomPatrol(guard) then
			return;
		end
	end
	guard.waypoints:clear();
	WpPointer[guard.id] = 0;
	WpDone[guard.id] = 0;
	local l = table.getn(PatrolList);
	if RandomPatrolChooser[guard.id] then
		PatrolPointer[guard.id] = math.random(1,l);
	else
		PatrolPointer[guard.id] = PatrolPointer[guard.id] + 1;
		if PatrolPointer[guard.id]>l then
			PatrolPointer[guard.id] = 1;
		end
	end
	if PatrolList[PatrolPointer[guard.id]].base[2] ~= 0 then
		WpMax[guard.id] = PatrolList[PatrolPointer[guard.id]].base[2];
	else
		WpMax[guard.id] = table.getn(PatrolList[PatrolPointer[guard.id]]);
	end
	ChooseNewWp(guard);
end

-- choose a new waypoint as destination, sequentially or randomly
function ChooseNewWp(guard)
	--npcdebug("ChooseNewWp");
	local l = table.getn(PatrolList[PatrolPointer[guard.id]]);
	if PatrolList[PatrolPointer[guard.id]].base[1] then
		WpPointer[guard.id] = math.random(1,l);
	else
		WpPointer[guard.id] = WpPointer[guard.id] + 1;
		if WpPointer[guard.id]>l then
			WpPointer[guard.id] = 1;
		end
	end
end

-- get the respective waypoint or nil if noone exists
function GetWpFromPos(pos)
	local index = npc.base.waypoints.PosToIndex(pos);
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
function SetNewWp(guard)
	if (guard.pos == PatrolList[PatrolPointer[guard.id]][WpPointer[guard.id]].pos) then
		WpDone[guard.id] = WpDone[guard.id] + 1;
		if WpDone[guard.id]>=WpMax[guard.id] then
			ChooseNewPatrol(guard);
		else
			ChooseNewWp(guard);
		end
	end
	local last = CurWp[guard.id];
	CurWp[guard.id] = NextWp[guard.id];
	local w = false;
	NextWp[guard.id],w = CurWp[guard.id]:getNextWaypoint(PatrolList[PatrolPointer[guard.id]][WpPointer[guard.id]],last);
	OpenDoor(guard);
	guard.waypoints:addWaypoint(NextWp[guard.id].pos);
	if w then
		guard:warp(NextWp[guard.id].pos);
	end
end

--[[
continues patrol when route is aborted (set new wp, warp or restart patrol)
should be called in the respective function of the monster/npc OR in base_guard.lua
]]
function AbortRoute(guard)
	if (guard.pos == NextWp[guard.id].pos) then
		npcdebug("try OK");
		WpTry[guard.id] = 0;
		guard.waypoints:clear();
		CloseDoor(guard);
		SetNewWp(guard);
		guard:setOnRoute(true);
	elseif WpTry[guard.id]==0 then
		npcdebug("try 0");
		WpTry[guard.id] = 1;
		guard:setOnRoute(true);
	elseif WpTry[guard.id]==1 then
		npcdebug("try 1");
		guard:warp(NextWp[guard.id].pos);
		WpTry[guard.id] = 2;
		AbortRoute(guard);
	elseif WpTry[guard.id]==2 then
		npcdebug("try 2");
		guard:forceWarp(NextWp[guard.id].pos);
		WpTry[guard.id] = 3;
		AbortRoute(guard);
	else
		npcdebug("try 3");
		StartPatrol(guard);
	end
end

-- open the door of curWp
function OpenDoor(guard)
	local door = CurWp[guard.id].data.door;
	if door and (door.toPos == NextWp[guard.id].pos) then
		local item = GetDoorItem(door.pos);
		base.doors.OpenDoor(item);
	end
end

-- close the door of NextWp
function CloseDoor(guard)
	local door = NextWp[guard.id].data.door;
	if door and (door.toPos == CurWp[guard.id].pos) then
		local item = world:getItemOnField(door.pos);
		base.doors.CloseDoor(item);
	end
end

-- get the door item, works only if it is on top
function GetDoorItem(Posi)
    local item = world:getItemOnField(Posi);
	if (base.doors.CheckOpenDoor(item.id) or base.doors.CheckClosedDoor(item.id)) then
		return item;
	end;
    return nil;
end;

function CharacterNear(guard,char)
	--npcdebug("char near");
	if (NextWp[guard.id].pos == char.pos) then
		npcdebug("char on waypoint, abort route!");
		AbortRoute(guard);
	end
end

function npcdebug(text)
	thisNPC:talk(Character.say,"[DEBUG] ".. text);
end

function getPos(pos)
	return pos.x ..",".. pos.y;
end
