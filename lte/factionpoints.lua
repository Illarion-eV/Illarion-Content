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

	theMembership=base.factions.getMembership(Char)
			Char:inform("theMembership: "..theMembership,"theMembership:"..theMembership)
	theRankpoints=base.factions.getRankpoints(Char)
			Char:inform("theRankpoints: "..theRankpoints,"theRankpoints:"..theRankpoints)
	theSpecialRank=base.factions.getSpecialRank(Char)
			Char:inform("theSpecialRank: "..theSpecialRank,"theSpecialRank:"..theSpecialRank)
	theRankAsNumber=base.factions.getRankAsNumber(Char)
			Char:inform("theRankAsNumber: "..theRankAsNumber,"theRankAsNumber:"..theRankAsNumber)
	theRankName=base.factions.getRankName(Char,theRankAsNumber)
			Char:inform("theRankName: "..theRankName,"theRankName:"..theRankName)
	theRank=base.factions.getRank(Char)
			Char:inform("theRank: "..theRank,"theRank:"..theRank)
--[[	findTheFactionPoints, theFactionPoints = Effect:findValue("getRankpoints")
--	theFactionPoints=Char:getFaction(Char)
			Char:inform("theFactionPoints: "..theFactionPoints,"theFactionPoints:"..theFactionPoints)
	findTheSpecialFactionPoints, theSpecialFactionPoints = Effect:findValue("getSpecialRank")
			Char:inform("theSpecialFactionPoints: "..theSpecialFactionPoints,"theSpecialFactionPoints:"..theSpecialFactionPoints)
	findTheFaction, theFaction = Effect:findValue("getFaction")
			Char:inform("theFaction: "..theFaction,"theFaction:"..theFaction)
	findTheMembership, theMembership = Effect:findValue("getMembership")
			Char:inform("theMembership: "..theMembership,"theMembership:"..theMembership)
]]--

	if theQuestStatus > 0 then
		Char:setQuestProgress(2000,theQuestStatus-1)
		theQuestStatus=Char:getQuestProgress(2000)
			Char:inform("theQuestStatus: "..theQuestStatus,"theQuestStatus:"..theQuestStatus)
		theNewRankpoints=theRankpoints+5
			Char:inform("theNewRankpoints: "..theNewRankpoints,"theNewRankpoints:"..theNewRankpoints)
		base.factions.setRankpoints(Char,theNewRankpoints)
		theRankpoints=base.factions.getRankpoints(Char)
			Char:inform("theRankpoints: "..theRankpoints,"theRankpoints:"..theRankpoints)
	end
	Effect.nextCalled = 600 --Effect gets called each minute
--	return true;
	return false;
end

function removeEffect(Effect,Character)

end

function loadEffect(Effect,Character)                  			

end
