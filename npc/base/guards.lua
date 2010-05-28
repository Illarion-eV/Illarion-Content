-- base script for patrolling faction guards

require("npc.base.patrol");
require("base.common")
require("base.factions");
module("npc.base.guards")

BG_Faction = 0;						-- faction of the guard
BG_WarpPos = position(0,0,0);	-- position where intruders can be warped to
BG_Enemy = 0;						-- id of the current intruder
BG_EnemyWp = nil;					-- waypoint of last enemy

-- definitions
BG_ACTION_NONE = 0;
BG_ACTION_WARP = 1;
BG_ACTION_KILL = 2;


function BG_StartGuard(guard)
	math.randomseed(base.common.GetCurrentTimestamp());
	BP_StartPatrol(guard);
end

-- called when character is in range of 3 tiles. Attack/warp the char if necessary.
function BG_CharacterNear3(guard,char)
	local _, action = BG_CheckCharacter(char);
	if ( action == BG_ACTION_WARP ) then
		BG_Warp(guard,char);
	elseif ( action == BG_ACTION_KILL ) then
		BG_Attack(guard,char);
	end
end

-- should be called in the respective monster/npc script
-- check if char is an enemy and if something has to be done.
function BG_CharacterOnSight(guard, char)
	if BG_IsEnemyInRange(guard.pos, char.id, 3) then
		BG_CharacterNear3(guard,char);
	end
	if not BG_IsBusy(guard) then
		BG_Enemy = 0;
	end
	if BG_CheckCharacter(char) then
		if BG_Enemy==0 then
			BG_Enemy = char.id;
		elseif BG_Enemy~=char.id then
			if BG_IsBusy(guard) then
				return;
			else
				BG_Enemy = char.id;
			end
		end
		if BG_Enemy == char.id then
			BG_Approach(guard,char);
		end
	end
end

-- check if the guard has an enemy near
function BG_IsBusy(guard)
	return BG_IsEnemyInRange(guard.pos,BG_Enemy);
end

-- check if and what has to be done with this char, depending on the faction and the mode
-- for testing: check if char has flour (ID 2) in hand slots
function BG_CheckCharacter(char)
	if char:get_type()==1 then
		return true,BG_ACTION_ATTACK;
	end
	
	-- for testing
	local item = char:getItemAt(5);
	if item.id~=2 then
		item = char:getItemAt(6);
	end
	return (item.id==2), BG_ACTION_KILL;
	
	--[[
	local mode = BG_GetMode();
	local action = BG_ACTION_NONE;
	if mode==1 then
		if char.attackmode then
			action = BG_ACTION_WARP;
		end
	elseif mode==2 then
		if char.attackmode then
			action = BG_ACTION_KILL;
		else
			action = BG_ACTION_WARP;
		end
	elseif mode==3 then
		action = BG_ACTION_KILL;
	end
	return (action~=BG_ACTION_NONE), action;
	]]
end

-- get the mode for this faction depending on the char's faction
function BG_GetMode(char)
	--for testing: aggressive
	return 3;
	--[[
	local found, mode = ScriptVars:find("BG_Mode_".. BG_Faction);
	if not found then
		return 0;
	end
	local f = BF_get_Faction(char).tid;
	mode = mode % (10^(f+1));
	mode = math.floor(mode / 10^f);
	return mode;]]
end

-- teleports the char to BG_WarpPos
function BG_Warp(guard, char)
	char:warp(BG_WarpPos);
	base.common.TempInformNLS(Char,
		"Du wurdest von einer Wache des Landes verwiesen.",
		"You've just been expelled from the territory by a guard.");
end

-- attacks the enemy
function BG_Attack(guard, enemy)
	--npcdebug("try attack");
	if math.random(1,5)==1 then
		world:makeSound(3,enemy.pos);
		enemy:inform("The guard just hit you.");
	end
end

-- check if a (hostile) char is in range (default: 15)
function BG_IsEnemyInRange(pos, enemyId, range)
	if not range then
		range = 15;
	end
	local charList = world:getCharactersInRangeOf(pos,range);
	for _,c in pairs(charList) do
		if c.id == enemyId then
			return BG_CheckCharacter(c);
		end
	end
	return false;
end

-- should be called in the respective function of the monster/npc
function BG_AbortRoute(guard)
	npcdebug("abort route");
	BP_AbortRoute(guard);
end

-- set the waypoints properly and approach the enemy
function BG_Approach(guard,char)
	BG_EnemyWp = Waypoint:new(char.pos);
	if BG_EnemyWp:getDistance(NextWp,true) < BG_EnemyWp:getDistance(CurWp,true) then
		CurWp = NextWp;
	end
	local curMin = MAX_DISTANCE;
	local d;
	for _,n in pairs(CurWp.neighbours) do
		d = BG_EnemyWp:getDistance(n,true);
		if d < curMin then
			curMin = d;
			NextWp = n;
		end
	end
	local b = CurWp.data.bridge;
	if b then
		d = BG_EnemyWp:getDistance(b.toWaypoint,true);
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
	if BG_EnemyWp:getDistance(CurWp,true)>15 and BG_EnemyWp:getDistance(NextWp,true)>15 then
		BG_Enemy = 0;
		BP_AbortRoute(guard);
		npcdebug("too far away");
	else
		guard.waypoints:addWaypoint(BG_EnemyWp.pos);
	end
	guard.waypoints:addWaypoint(NextWp.pos);
	guard:setOnRoute(true);
end

function BG_CharacterNear(guard,enemy)
	if not BG_IsBusy(guard) and BG_EnemyWp and equapos(enemy.pos,BG_EnemyWp.pos) then
		BG_Enemy = 0;
		BP_AbortRoute(guard);
	else
		BP_CharacterNear(guard,enemy);
	end
end