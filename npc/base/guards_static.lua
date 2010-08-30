require("base.factions")
require("base.common")
module("npc.base.guards_static", package.seeall)

ACTION_NONE = 0;
ACTION_WARP = 1;
ACTION_KILL = 2;

WarpPos = {};
FactionId = {};
Radius = {};

function Init(guard, factionId, warpPos, radius)
	WarpPos[guard.id] = warpPos;
	FactionId[guard.id] = factionId;
	Radius[guard.id] = radius;
end

function HandleCharacterNear(guard, char)
	-- check if char is within radius at all
	local dist = guard:distanceMetric(char);
	if (dist > Radius[guard.id]) then
		return;
	end
	local mode = GetMode(char, FactionId[guard.id]);
	if (mode == ACTION_WARP) then
		-- warp
		Warp(guard, char);
	elseif (mode == ACTION_KILL) then
		-- spawn monster guards
		-- for now: just warp
		Warp(guard, char);
	end
end

-- get the mode for this faction depending on the char's faction
function GetMode(char, factionId)
	--for testing: aggressive
	return ACTION_KILL;
	--[[
	local found, mode = ScriptVars:find("Mode_".. factionId);
	local f = base.factions.BF_get_Faction(char).tid;
	if not found then
		SetMode(factionId, f, ACTION_NONE);
		return ACTION_NONE;
	end
	mode = mode % (10^(f+1));
	mode = math.floor(mode / 10^f);
	return mode;]]
end

function SetMode(thisFaction, otherFaction, newMode)
	-- get mode for all factions
	local found, modeAll = ScriptVars:find("Mode_".. thisFaction);
	if not found then
		modeAll = 0;
		oldMode = 0;
	else
		-- calculate the old mode for the otherFaction
		oldMode = oldMode % (10^(otherFaction+1));
		oldMode = math.floor(oldMode / 10^f);
	end
	-- subtract old mode
	modeAll = modeAll - (oldMode * 10^(otherFaction+1));
	-- add new mode
	modeAll = modeAll + (newMode * 10^(otherFaction+1));
	-- set ScriptVar again
	ScriptVars:set("Mode_".. thisFaction, modeAll);
end

function Warp(guard, char)
	char:warp(WarpPos[guard.id]);
	base.common.TempInformNLS(Char,
		"Du wurdest soeben von einer Wache der Stadt verwiesen.",
		"You've just been expelled from the town by a guard.");
end