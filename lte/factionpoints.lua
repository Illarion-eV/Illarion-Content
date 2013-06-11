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
			char:inform("theQuestStatus: "..theQuestStatus,"theQuestStatus:"..theQuestStatus)
	theFactionPoints=Char:getFaction(Char)
	if theQuestStatus > 0 then
		Char:setQuestProgress(2000,theQuestStatus-1)
			char:inform("theQuestStatus: "..theQuestStatus,"theQuestStatus:"..theQuestStatus)

	end
	Effect.nextCalled = 600 --Effect gets called each 5 minutes
	return true;
end

function removeEffect(Effect,Character)

end

function loadEffect(Effect,Character)                  			

end
