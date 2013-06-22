require("base.common")
require("base.factions")

module("base.licence", package.seeall)

licenceGalmairPos={};
licenceGalmairPos[1]="383,276,0"; --Galmair workshop
licenceGalmairPos[2]=408,263,0;	--Galmair alchemy hous
licenceGalmairPos[3]={position(376,233,0)}	--Galmair kitchen (Crest)

function licence(char)
	local i = 3
	base.common.InformNLS(char,"test","test");
	char:inform("i: " ..i,"i: " ..i)
	local licenceGalmairPos = licenceGalmairPos[i]
	char:inform("licenceGalmairPos: " ..licenceGalmairPos,"licenceGalmairPos: " ..licenceGalmairPos)
--	for i = 1,3 do	--set second number according to Galmairs sum of positions (current 3)
		local licenceGalmairDistance = char:distanceMetricToPosition (licenceGalmairPos)
--		local licenceGalmairDistance = char:distanceMetricToPosition (position(383,276,0))
		if licenceGalmairDistance < 11 then
			char:inform("Range: Yes, in range" ..licenceGalmairPos,"Range: Yes, in range" ..licenceGalmairPos)
	
			if base.factions.getMembership(char) == 3 or char:getQuestProgress(812) > 0 then	
				base.common.InformNLS(char,"Du hast eine Lizenz.","You habe a licence.");
			else
				base.common.InformNLS(char,"Du solltest eine Lizenz erwerbern.","You should purchase a licence.");
			end
			char:inform("Faction: "..getMembership(char),"Faction: "..getMembership(char))
			char:inform("Quest812: "..char:getQuestProgress(812),"Quest812: "..char:getQuestProgress(812))
		else
			char:inform("Range: No, out of range" ..licenceGalmairPos,"Range: No, out of range" ..licenceGalmairPos)
		end
--	end
end
