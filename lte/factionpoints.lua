-- CreateAfterTime, id 81
-- LTE FactionPoints
-- regulates factionpoint-reward


require("base.common")
require("base.factions")
module("lte.factionpoints", package.seeall)

TextDE={};
TextEN={};
TextDE[1]="Es sieht nicht danach aus als würde eine Fee heute ein Element verlieren.";
TextEN[1]="It does not look like as any fairy would drop an element today.";


PosItemDE={};
PosItemEN={};
PosItemDE[1]=" nordwestlich von dir.";
PosItemEN[1]=" northwest of you.";


function addEffect(Effect, Character)               				
    	Effect:addValue("10",0)
end

function callEffect(Effect, Char)
	theQuestStatus=Char:getQuestProgress(2000)
			Char:inform("theQuestStatus: "..theQuestStatus,"theQuestStatus:"..theQuestStatus)
	findTheFactionPoints, theFactionPoints = Effect:findValue("getRankpoints")

--	theFactionPoints=Char:getFaction(Char)
			Char:inform("theFactionPoints: "..theFactionPoints,"theFactionPoints:"..theFactionPoints)
	if theQuestStatus > 0 then
		Char:setQuestProgress(2000,theQuestStatus-1)
			theQuestStatus=Char:getQuestProgress(2000)
			Char:inform("theQuestStatus: "..theQuestStatus,"theQuestStatus:"..theQuestStatus)

	end
	Effect.nextCalled = 600 --Effect gets called each minute
	return true;
end

function removeEffect(Effect,Character)

end

function loadEffect(Effect,Character)                  			

end
