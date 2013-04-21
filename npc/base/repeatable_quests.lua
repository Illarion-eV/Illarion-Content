require("base.common")

module("npc.base.repeatable_quests", package.seeall)

function checkIfTimesExpired(User, quest, monthToRepeat, dayToRepeat, hourToRepeat) 
	local questState, questLastChanged = User:getQuestProgress(quest);
	debug("lastChanged: "..questLastChanged)
	local year, month, day, hour, minute, second = base.common.TimestampToDate(questLastChanged*3600);

	debug("year: "..year.." month: "..month.." day: "..day.." hour: "..hour);
	hour = hour + hourToRepeat;
	if hour > 24 then
		day = day + 1;
		hour = hour - 24;
	end
	
	day = day + dayToRepeat;
	if day > 24 then
		month = month + 1;
		day = day - 24;
	end
	
	month = month + monthToRepeat;
	if month > 16 then
		year = year + 1
		month = month - 16;
	end
	
	--fix days for mas
	if month == 16 and day > 5 then
		month = month + 1;
		year = year + 1;
		day = day - 5;
	end
	
	debug("year: "..year.." month: "..month.." day: "..day.." hour: "..hour);
	local newTimestamp = (base.common.GetCurrentTimestampForDate(year, month, day, hour, minute, second)/ 3600)	
	debug("new: "..newTimestamp)
	local currentTimestamp = world:getTime("unix")
	debug("current: "..currentTimestamp)
	
	if newTimestamp >= currentTimestamp then
		return true; 
	else 
		return false; 
	end
end
