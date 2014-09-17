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
local common = require("base.common")
local time = require("base.time")

module("npc.base.repeatable_quests", package.seeall)

function checkIfTimesExpired(User, quest, monthToRepeat, dayToRepeat, hourToRepeat) 
	local questState, questLastChanged = User:getQuestProgress(quest);
	local month, day, hour;
	local y, mo, d, h, mi, sec = time.getRLDateFromUnixTimestamp(questLastChanged);
	
	debug("LastChanged: "..questLastChanged)
	
	if time.daysPerMonth[mo] == 28 then
		month = monthToRepeat * 2419200;
	elseif time.daysPerMonth[mo] == 31 then
		month = monthToRepeat * 2678400;
	else 
		month = monthToRepeat * 2592000;
	end	
	
	day = dayToRepeat * 86400;
	hour = hourToRepeat * 3600;
	
	local newTimestamp = questLastChanged + month + day + hour;
	local currentTimestamp = world:getTime("unix");
	
	debug("Newtime: "..newTimestamp);
	debug("Current: "..currentTimestamp);
	
	if newTimestamp >= currentTimestamp then
		return true; 
	else 
		return false; 
	end
end
