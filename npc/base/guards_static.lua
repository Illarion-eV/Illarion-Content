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
	guard:talk(CCharacter.say,"BEGIN guards_static.Init");
	WarpPos[guard.id] = warpPos;
	FactionId[guard.id] = factionId;
	Radius[guard.id] = radius;
	guard:talk(CCharacter.say,"END guards_static.Init");
end

--- Checks for chars in range and handles them (warp)
-- @param guard The character struct of the guard NPC
function CheckForCharacters(guard)
	local charList = world:getPlayersInRangeOf(guard.pos, Radius[guard.id]);
	
	for i,char in pairs(charList) do
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
end

--- get the mode for this faction depending on the char's faction
-- @param char The character whose faction is to be checked
-- @param thisFaction The faction ID of the guard
function GetMode(char, thisFaction)
	if char:isAdmin() then
		return ACTION_NONE;
	end

	local f = base.factions.BF_get_Faction(char).tid;
	return GetModeByFaction(thisFaction, f);
end

--- get the mode for this faction by the other (hostile) faction
-- @param thisFaction The faction ID of the guard
-- @param otherFaction The faction ID that is to be checked
function GetModeByFaction(thisFaction, otherFaction)
	local found, mode = ScriptVars:find("Mode_".. thisFaction);
	if not found then
		SetMode(thisFaction, otherFaction, ACTION_NONE);
		return ACTION_NONE;
	end
	mode = mode % (10^(otherFaction+1));
	mode = math.floor(mode / 10^otherFaction);
	return mode;
end

--- set the mode for all guards of this faction
-- @param thisFaction The faction ID of the guard
-- @param otherFaction The faction ID whose mode is to be changed
-- @param newMode The new mode, e.g. ACTION_NONE
function SetMode(thisFaction, otherFaction, newMode)
	-- get mode for all factions
	local found, modeAll = ScriptVars:find("Mode_".. thisFaction);
	local oldMode = 0;
	if not found then
		modeAll = 0;
		oldMode = 0;
	else
		-- calculate the old mode for the otherFaction
		oldMode = modeAll % (10^(otherFaction+1));
		oldMode = math.floor(oldMode / 10^otherFaction);
	end
	-- subtract old mode
	modeAll = modeAll - (oldMode * 10^(otherFaction));
	-- add new mode
	modeAll = modeAll + (newMode * 10^(otherFaction));
	-- set ScriptVar again
	modeAll = math.max(0,math.min(9999, modeAll)); -- must not be negative & exceed 9999 (3 towns + outcasts)
	ScriptVars:set("Mode_".. thisFaction, modeAll);
end

--- warp the char to the defined warp position
-- @param guard The guard that warps the char
-- @param char The char that will be warped
function Warp(guard, char)
	char:warp(WarpPos[guard.id]);
	base.common.TempInformNLS(char,
		"Du wurdest soeben von einer Wache der Stadt verwiesen.",
		"You've just been expelled from the town by a guard.");
end

--- checks if an admin wants to change the guard mode. Should be called in receiveText.
-- @param guard The guard character struct
-- @param speaker The speaker character struct
-- @param message The message that the guard received
function CheckAdminCommand(guard, speaker, message)
	if guard.id == speaker.id then
		return;
	end
	if not speaker:isAdmin() then
		return;
	end
	if speaker:distanceMetric(guard) > 2 then
		return;
	end
	local msg = string.lower(message);
	if string.find(msg, "set .*mode") or string.find(msg, "check .*mode") then
		local a = nil;
		b = a.test;
		local faction = -1;
		local factionString = {};
		factionString[0] = "outcast";
		factionString[1] = "cadomyr";
		factionString[2] = "runewick";
		factionString[3] = "galmair";
		for i,s in pairs(factionString) do
			if string.find(msg, s) then
				faction = i;
			end
		end
		if faction == -1 then
			speaker:inform("#w [Guard Help] no proper faction found. Try cadomyr, galmair, runewick or outcast.");
			return;
		end
		
		local mode = -1;
		local modeString = {};
		modeString[ACTION_NONE] = "passive";
		modeString[ACTION_WARP] = "hostile";
		modeString[ACTION_KILL] = "aggressive";
		
		-- just print the mode if the admin wants to check a mode
		if string.find(msg, "check .*mode") then
			local mode = GetModeByFaction(FactionId[guard.id],faction);
			speaker:inform("#w [Guard Help] Current mode for ".. factionString[faction] ..": ".. modeString[mode]);
			return;
		end
		
		for i,s in pairs(modeString) do
			if string.find(msg, s) then
				mode = i;
			end
		end
		if mode == -1 then
			speaker:inform("#w [Guard Help] no proper mode found. Try passive, hostile or aggressive.");
			return;
		else
			speaker:inform("mode ~= -1");
		end
		if FactionId then
			speaker:inform("FactionId exists");
			if FactionId[guard.id] then
				speaker:inform("FactionId[guard.id] exists");
			end
		end
		speaker:inform("call SetMode: ".. FactionId[guard.id] ..";".. faction ..";".. mode);
		SetMode(FactionId[guard.id], faction, mode);
		speaker:inform("#w [Guard Help] Mode for ".. factionString[faction] .." set to ".. modeString[mode]);
	elseif string.find(msg, "help") then
		speaker:inform("#w [Guard Help] You can set the mode for the guards by: set mode <faction> <mode>");
	elseif string.find(msg, "init") then
		speaker:inform("init!");
		npc.base.guards_static.Init(guard, 1, position(118,624,0), 5);
		speaker:inform("init done");
	end
end