-- base script for patrolling faction guards

-- functions for subscription:
-- CharacterOnSight(guard, char)
-- AbortRoute(guard)
-- CharacterNear(guard,enemy)

require("npc.base.patrol");
require("base.common")
require("base.factions");
module("npc.base.guards", package.seeall)

-- definitions
ACTION_NONE = 0;
ACTION_WARP = 1;
ACTION_KILL = 2;

Faction = {};					-- faction of the guard
WarpPos = {};					-- position where intruders can be warped to
Enemy = {};						-- id of the current intruder
EnemyWp = {};					-- waypoint of last enemy
LastEnemy = {};					-- id of last enemy

function Init(guard)
	Faction[guard.id] = 0;
	WarpPos[guard.id] = position(0,0,0);
	Enemy[guard.id] = 0;
	EnemyWp[guard.id] = nil;
	LastEnemy[guard.id] = 0;
end

function StartGuard(guard)
	math.randomseed(base.common.GetCurrentTimestamp());
	npc.base.patrol.StartPatrol(guard);
end

-- called when character is in range of 3 tiles. Attack/warp the char if necessary.
function CharacterNear3(guard,char)
	local _, action = CheckCharacter(guard, char);
	if ( action == ACTION_WARP ) then
		Warp(guard,char);
	elseif ( action == ACTION_KILL ) then
		Attack(guard,char);
	end
end

-- should be called in the respective monster/npc script
-- check if char is an enemy and if something has to be done.
function CharacterOnSight(guard, char)
	if IsEnemyInRange(guard, char.id, 3) then
		CharacterNear3(guard,char);
	end
	if not IsBusy(guard) then
		Enemy[guard.id] = 0;
	end
	if CheckCharacter(guard, char) then
		if Enemy[guard.id]==0 then
			Enemy[guard.id] = char.id;
		elseif Enemy[guard.id]~=char.id then
			if IsBusy(guard) then
				return;
			else
				Enemy[guard.id] = char.id;
			end
		end
		if Enemy[guard.id] == char.id then
			Approach(guard,char);
		end
	end
end

-- check if the guard has an enemy near
function IsBusy(guard)
	return IsEnemyInRange(guard,Enemy[guard.id]);
end

-- check if and what has to be done with this char, depending on the faction and the mode
-- for testing: check if char has flour (ID 2) in hand slots
function CheckCharacter(guard, char)
	if char:getType()==1 then
		return true,ACTION_KILL;
	end
	
	-- for testing
	local item = char:getItemAt(5);
	if item.id~=2 then
		item = char:getItemAt(6);
	end
	return (item.id==2), ACTION_KILL;
	
	--[[
	local mode = GetMode(guard, char);
	local action = ACTION_NONE;
	if mode==1 then
		if char.attackmode then
			action = ACTION_WARP;
		end
	elseif mode==2 then
		if char.attackmode then
			action = ACTION_KILL;
		else
			action = ACTION_WARP;
		end
	elseif mode==3 then
		action = ACTION_KILL;
	end
	return (action~=ACTION_NONE), action;
	]]
end

-- get the mode for this faction depending on the char's faction
function GetMode(guard, char)
	--for testing: aggressive
	return ACTION_KILL;
	--[[
	local found, mode = ScriptVars:find("Mode_".. Faction[guard.id]);
	if not found then
		return 0;
	end
	local f = base.factions.getFaction(char).tid;
	mode = mode % (10^(f+1));
	mode = math.floor(mode / 10^f);
	return mode;]]
end

-- teleports the char to WarpPos
function Warp(guard, char)
	char:warp(WarpPos[guard.id]);
	base.common.InformNLS(Char,
		"Du wurdest von einer Wache des Landes verwiesen.",
		"You've just been expelled from the territory by a guard.");
end

-- attacks the enemy
function Attack(guard, enemy)
	--npcdebug("try attack");
	if math.random(1,5)==1 then
		world:makeSound(3,enemy.pos);
		enemy:inform("The guard just hit you.");
	end
end

-- check if a (hostile) char is in range (default: 15)
function IsEnemyInRange(guard, enemyId, range)
	if not range then
		range = 15;
	end
	local charList = world:getCharactersInRangeOf(guard.pos,range);
	for _,c in pairs(charList) do
		if c.id == enemyId then
			return CheckCharacter(guard, c);
		end
	end
	return false;
end

-- should be called in the respective function of the monster/npc
function AbortRoute(guard)
	npcdebug("abort route");
	npc.base.patrol.AbortRoute(guard);
end

-- set the waypoints properly and approach the enemy
function Approach(guard,char)
	EnemyWp[guard.id] = Waypoint:new(char.pos);
	if EnemyWp[guard.id]:getDistance(NextWp,true) < EnemyWp[guard.id]:getDistance(CurWp,true) then
		CurWp = NextWp;
	end
	local curMin = MAX_DISTANCE;
	local d;
	for _,n in pairs(CurWp.neighbours) do
		d = EnemyWp[guard.id]:getDistance(n,true);
		if d < curMin then
			curMin = d;
			NextWp = n;
		end
	end
	local b = CurWp.data.bridge;
	if b then
		d = EnemyWp[guard.id]:getDistance(b.toWaypoint,true);
		if d < curMin then
			NextWp = b.toWaypoint;
			d = curMin;
			if b.warp then
				guard:warp(NextWp.pos);
			end
		else
			b = nil;
		end
	end
	guard.waypoints:clear();
	if EnemyWp[guard.id]:getDistance(CurWp,true)>15 and EnemyWp[guard.id]:getDistance(NextWp,true)>15 then
		Enemy[guard.id] = 0;
		npc.base.patrol.AbortRoute(guard);
		npcdebug("too far away");
	else
		guard.waypoints:addWaypoint(EnemyWp[guard.id].pos);
	end
	guard.waypoints:addWaypoint(NextWp.pos);
	guard:setOnRoute(true);
end

function CharacterNear(guard,enemy)
	if not IsBusy(guard) and EnemyWp[guard.id] and (enemy.pos == EnemyWp[guard.id].pos) then
		Enemy[guard.id] = 0;
		npc.base.patrol.AbortRoute(guard);
	else
		npc.base.patrol.CharacterNear(guard,enemy);
	end
end
