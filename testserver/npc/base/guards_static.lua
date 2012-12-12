require("base.factions")
require("base.common")
require("content.guards")
require("content.areas")
module("npc.base.guards_static", package.seeall)

-- modes to define how players are handled. Monsters are always attacked (TO DO, for now: warp only)
ACTION_NONE = 0;		-- do nothing at all
ACTION_PASSIVE = 1;		-- if in attackmode, warp away
ACTION_HOSTILE = 2;		-- warp away
ACTION_AGGRESSIVE = 3;	-- attack (TO DO)

--- Checks for chars in range and handles them (warp)
-- @param guard The character struct of the guard NPC
function CheckForEnemies(guard)

	-- check for hostile monsters
	local monsterList = world:getMonstersInRangeOf(CheckCenter[guard.id], content.guardsGuards[guard.id].radius);
	for i,mon in pairs(monsterList) do
    if (content.areas.PointInArea(mon.pos,content.guardsGuards[guard.id].areaName))
      if ( not base.common.IsMonsterDocile(mon:getMonsterType()) ) then
        -- kill them and get help
        -- but warp for now
        Warp(guard, mon);
      end
    end
	end

	-- check for player characters
	local charList = world:getPlayersInRangeOf(CheckCenter[guard.id], content.guardsGuards[guard.id].radius);
	for i,char in pairs(charList) do
    if (content.areas.PointInArea(char.pos,content.guardsGuards[guard.id].areaName)) then
      local mode = GetMode(char, content.guardsGuards[guard.id].faction);
      if (mode == ACTION_AGGRESSIVE) then
        -- spawn monster guards
        -- for now: just warp
        Warp(guard, char);
      elseif (mode == ACTION_HOSTILE or (mode == ACTION_PASSIVE and char.attackmode)) then
        -- warp
        Warp(guard, char);
      end
    end
	end
end

--- get the mode for this faction depending on the char's faction
-- @param char The character whose faction is to be checked
-- @param thisFaction The faction ID of the guard
function GetMode(char, thisFaction)
	
	-- if char:isAdmin() then
		-- return ACTION_NONE;
	-- end

	local f = base.factions.getFaction(char).tid;
	return GetModeByFaction(thisFaction, f);
end

--- get the mode for this faction by the other (hostile) faction
-- @param thisFaction The faction ID of the guard
-- @param otherFaction The faction ID that is to be checked
function GetModeByFaction(thisFaction, otherFaction)
	local found, mode = ScriptVars:find("Mode_".. thisFaction);
	if not found then
		InitMode(thisFaction);
		return GetModeByFaction(thisFaction, otherFaction);
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
		InitMode(thisFaction);
		SetMode(thisFaction, otherFaction, newMode);
		return;
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

--- initialize the mode for all factions, only the current faction gets access
-- @param thisFaction The faction ID of the current faction
function InitMode(thisFaction)
	ScriptVars:set("Mode_".. thisFaction, 0);
	SetMode(thisFaction, thisFaction, ACTION_NONE);
	local factions = {0,1,2,3};
	for _,f in pairs(factions) do
		if (thisFaction ~= f) then
			SetMode(thisFaction, f, ACTION_HOSTILE);
		end
	end
end

--- warp the char to the defined warp position
-- @param guard The guard that warps the char
-- @param char The char that will be warped
function Warp(guard, char)
	char:warp(content.guardsGuards[guard.id].warpPos);
	base.common.InformNLS(char,
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
	--if not speaker:isAdmin() then
		--return;
	--end
	if speaker:distanceMetric(guard) > 2 then
		return;
	end
	local msg = string.lower(message);
	if string.find(msg, "set .*mode") or string.find(msg, "check .*mode") then
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
			speaker:inform("[Guard Help] no proper faction found. Try cadomyr, galmair, runewick or outcast.",Player.mediumPriority);
			return;
		end
		
		local mode = -1;
		local modeString = {};
		modeString[ACTION_NONE] = "none";
		modeString[ACTION_PASSIVE] = "passive";
		modeString[ACTION_HOSTILE] = "hostile";
		modeString[ACTION_AGGRESSIVE] = "aggressive";
		-- just print the mode if the admin wants to check a mode
		if string.find(msg, "check .*mode") then
			local mode = GetModeByFaction(content.guardsGuards[guard.id].faction,faction);
			speaker:inform("[Guard Help] Current mode for ".. factionString[faction] ..": ".. modeString[mode],Player.mediumPriority);
			return;
		end
		
		for i,s in pairs(modeString) do
			if string.find(msg, s) then
				mode = i;
			end
		end
		if mode == -1 then
			speaker:inform("[Guard Help] No proper mode found. Try none, passive, hostile or aggressive.",Player.mediumPriority);
			return;
		else
		end
		SetMode(content.guardsGuards[guard.id].faction, faction, mode);
		speaker:inform("[Guard Help] Mode for ".. factionString[faction] .." set to ".. modeString[mode],Player.mediumPriority);
	elseif string.find(msg, "help") then
		speaker:inform("[Guard Help] You can set the mode for the guards by: set mode <faction> <mode>",Player.mediumPriority);
	end
end

function ReceiveText(NpcChar, Texttype, Message, Speaker)
  CheckAdminCommand(NpcChar,Speaker,Message);
end

function NextCycle(NpcChar)
  content.guards.InitGuards();
  if (CheckCount == nil) then
    CheckCount = {};
  elseif (CheckCount[NpcChar.id] == nil) then
    CheckCount[NpcChar.id] = 0;
  elseif (CheckCount[NpcChar.id] == 5) then
    CheckForEnemies(NpcChar);
    CheckCount[NpcChar.id] = 0;
  else
    CheckCount[NpcChar.id] = CheckCount[NpcChar.id] + 1;
  end
end

--[[
-- ## REPLACE THESE FUNCTIONS IN THE LUA CODE OF EACH GUARD ##

function receiveText(npcChar, texttype, message, speaker)
  mainNPC:receiveText(npcChar, speaker, message);
  npc.base.guards_static.ReceiveText(npcChar, speaker, message);
end;
function nextCycle(npcChar)
  mainNPC:nextCycle(npcChar);
  npc.base.guards_static.ReceiveText(npcChar);
end;

]]
