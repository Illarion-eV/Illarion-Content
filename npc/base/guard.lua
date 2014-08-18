--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--- Base script for guard NPCs
--
-- These NPCs guard a area and warp any monster coming too close and pushing
-- away players they do not like.
require("base.character")
require("base.class")
require("base.common")
require("base.factions")
require("base.messages")

module("npc.base.guard", package.seeall)

local _processMonsters;
local _processPlayers;
local _getCheckRadius;
local _warpHostile;
local _isPointInGuardArea;
local _getTextAndTalktype;

guardNPC = base.class.class(function(self, rootNPC)
    if (rootNPC == nil or not rootNPC:is_a(npc.base.basic.baseNPC)) then
        return;
    end;
    self["_parent"] = rootNPC;
    
    self["_guardRange"] = {};
    self["_guardRange"]["north"] = 0;
    self["_guardRange"]["south"] = 0;
    self["_guardRange"]["west"] = 0;
    self["_guardRange"]["east"] = 0;
	
	self["_warpLocation"] = nil;
	self["_warpedMonsterText"] = nil;
	self["_warpedPlayerText"] = nil;
	self["_hitPlayerText"] = nil;
	
    self["_nextCycleText"] = -1;
	
	self._parent:addCycle(self);
end);

function guardNPC:setGuardRange(n_range, s_range, w_range, e_range)
    self._guardRange.north = n_range;
    self._guardRange.south = s_range;
    self._guardRange.west = w_range;
    self._guardRange.east = e_range;
end

function guardNPC:setWarpLocation(x, y, z)
    self._warpLocation = position(x, y, z);
end

function guardNPC:addWarpedMonsterText(germanText, englishText)
	if (self._warpedMonsterText == nil) then
        self._warpedMonsterText = base.messages.Messages();
    end;
    
    self._warpedMonsterText:addMessage(germanText, englishText);
end

function guardNPC:addWarpedPlayerText(germanText, englishText)
	if (self._warpedPlayerText == nil) then
        self._warpedPlayerText = base.messages.Messages();
    end;
    
    self._warpedPlayerText:addMessage(germanText, englishText);
end

function guardNPC:addHitPlayerText(germanText, englishText)
	if (self._hitPlayerText == nil) then
        self._hitPlayerText = base.messages.Messages();
    end;
    
    self._hitPlayerText:addMessage(germanText, englishText);
end

function guardNPC:nextCycle(npcChar, counter)
    if (counter >= self._nextCycleText) then
	    self._nextCycleText = 5;
        
		local radius = _getCheckRadius(self);
		_processMonsters(self, npcChar, radius);
		_processPlayers(self, npcChar, radius);
    else
        self._nextCycleText = self._nextCycleText - counter;
    end;
    
    return self._nextCycleText;
end;

function _processMonsters(self, npcChar, radius)
	local monsterList = world:getMonstersInRangeOf(npcChar.pos, radius);
	local warpedMonster = false;
	for _, monster in pairs(monsterList) do
		if _isPointInGuardArea(self, npcChar, monster.pos) then
			if not base.common.IsMonsterDocile(monster:getMonsterType()) then
				warpedMonster = true;
				_warpHostile(self, npcChar, monster);
			end
		end
	end
	
	if warpedMonster and (self._warpedMonsterText ~= nil) then
        local german, english = self._warpedMonsterText:getRandomMessage();
        local textTypeDe, textDe = _getTextAndTalktype(german);
        local textTypeEn, textEn = _getTextAndTalktype(english);
		if (textTypeDe ~= textTypeEn) then
			debug("NPC "..npcChar.name.." has a warped monster text that yields different text types for German and English.\nGerman: "..textDe.."\nEnglish:"..textEn);
		end
        npcChar:talk(textTypeDe, textDe, textEn);
	end
end

function _processPlayers(self, npcChar, radius)
	if (self._parent._affiliation <= 0) then
		return;
	end
	
	local playerList = world:getPlayersInRangeOf(npcChar.pos, radius);
	local warpedPlayers = false;
	local hitPlayers = false;
	for _, player in pairs(playerList) do
		if _isPointInGuardArea(self, npcChar, player.pos) then
			local relation = base.factions.getPlayerRelation(player, self._parent._affiliation);
			if (relation == base.factions.RELATION_AGGRESSIVE) then
				player:increaseAttrib("hitpoints", -1000);
				hitPlayers = true;
				warpedPlayers = true;
				_warpHostile(self, npcChar, player);
			elseif (relation == base.factions.RELATION_HOSTILE) --[[or ((relation == base.factions.RELATION_NEUTRAL) and player.attackmode)]] then
				warpedPlayers = true;
				_warpHostile(self, npcChar, player);
			end
		end;
	end
	
	if hitPlayers then
		world:makeSound(3, npcChar.pos);
		if (self._hitPlayerText ~= nil) then
			local german, english = self._hitPlayerText:getRandomMessage();
			local textTypeDe, textDe = _getTextAndTalktype(german);
			local textTypeEn, textEn = _getTextAndTalktype(english);
			if (textTypeDe ~= textTypeEn) then
				debug("NPC "..npcChar.name.." has a hit player text that yields different text types for German and English.\nGerman: "..textDe.."\nEnglish:"..textEn);
			end
			npcChar:talk(textTypeDe, textDe, textEn);
			warpedPlayers = false;
		end
	end
	
	if warpedPlayers and (self._warpedPlayerText ~= nil) then
		local german, english = self._warpedPlayerText:getRandomMessage();
		local textTypeDe, textDe = _getTextAndTalktype(german);
		local textTypeEn, textEn = _getTextAndTalktype(english);
		if (textTypeDe ~= textTypeEn) then
			debug("NPC "..npcChar.name.." has a warped player text that yields different text types for German and English.\nGerman: "..textDe.."\nEnglish:"..textEn);
		end
		npcChar:talk(textTypeDe, textDe, textEn);
		warpedPlayers = false;
	end
end

function _warpHostile(self, npcChar, hostile)
	if (self._warpLocation == nil) then
		self._warpLocation = hostile.pos;
		debug("NPC "..npcChar.name.." is a guard with missing warp target location.");
	end;
	hostile:warp(self._warpLocation);
end

function _getCheckRadius(self)
	return math.max(self._guardRange.south, self._guardRange.north) + math.max(self._guardRange.west, self._guardRange.east);
end

function _isPointInGuardArea(self, npcChar, checkPoint)
	if (checkPoint.z ~= npcChar.pos.z) then
		return false;
	end
	
	local npcX = npcChar.pos.x;
	local npcY = npcChar.pos.y;
	
	local farNorth = npcY - self._guardRange.north; 
	local farSouth = npcY + self._guardRange.south; 
	local farWest = npcX - self._guardRange.west; 
	local farEast = npcX + self._guardRange.east;

	if (checkPoint.x < farWest) or (checkPoint.x > farEast) then
		return false;
	end
	if (checkPoint.y < farNorth) or (checkPoint.y > farSouth) then
		return false;
	end
	return true;
end

function _getTextAndTalktype(text)
	if (string.find(text, "[#/]w") == 1) then
		return Character.whisper, string.gsub(text, "[#/]w%s*", "", 1);
	elseif (string.find(text, "[#/]s") == 1) then 
		return Character.yell, string.gsub(text, "[#/]s%s*", "", 1);
	elseif (string.find(text, "[#/]o") == 1) then 
		return Character.whisper, text;
	else
		return Character.say, text;
	end;
end;
