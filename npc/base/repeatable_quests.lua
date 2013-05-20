require("base.common")
require("base.time")

module("npc.base.repeatable_quests", package.seeall)

function checkIfTimesExpired(User, quest, monthToRepeat, dayToRepeat, hourToRepeat) 
	local questState, questLastChanged = User:getQuestProgress(quest);
	local month, day, hour;
	local y, mo, d, h, mi, sec = base.time.getRLDateFromUnixTimestamp(questLastChanged);
	
	debug(d.."."..mo.."."..y.." "..h..":"..mi..":"..sec);
	
	if base.time.daysPerMonth[mo] == 28 then
		month = monthToRepeat * 2419200;
	elseif base.time.daysPerMonth[mo] == 31 then
		month = monthToRepeat * 2678400;
	else 
		month = monthToRepeat * 2592000;
	end	
	
	day = dayToRepeat * 86400;
	hour = hourToRepeat * 3600;
	
	local newTimestamp = questLastChanged + month + day + hour;
	local currentTimestamp = world:getTime("unix");
	
	if newTimestamp >= currentTimestamp then
		return true; 
	else 
		return false; 
	end
end
