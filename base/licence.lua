require("base.common")
require("base.factions")

module("base.licence", package.seeall)

licenceGalmairPos={position(383,276,0),position(408,263,0),position(376,233,0)};
--licenceGalmairPos[1]="383,276,0"; --Galmair workshop
--licenceGalmairPos[2]=408,263,0;	--Galmair alchemy hous
--licenceGalmairPos[3]={position(376,233,0)}	--Galmair kitchen (Crest)

function licence(char)

	for i = 1,3 do	--set second number according to Galmairs sum of positions (current 3)
		char:inform("i: " ..i,"i: " ..i)
		local licenceGalmairPos = licenceGalmairPos[i]
		local licenceGalmairDistance = char:distanceMetricToPosition (licenceGalmairPos)
--		local licenceGalmairDistance = char:distanceMetricToPosition (position(383,276,0))
		if licenceGalmairDistance < 11 then
			char:inform("Range: Yes, in range","Range: Yes, in range")	
			if base.factions.getMembership(char) == 3 or char:getQuestProgress(812) > 0 then	
				base.common.InformNLS(char,"Du hast eine Lizenz.","You habe a licence.");
			else
				base.common.InformNLS(char,"Du solltest eine Lizenz erwerbern.","You should purchase a licence.");
			end
			char:inform("Faction: " ..base.factions.getMembership(char),"Faction: " ..base.factions.getMembership(char))
			char:inform("Quest812: " ..char:getQuestProgress(812),"Quest812: " ..char:getQuestProgress(812))
		else
			char:inform("Range: No, out of range","Range: No, out of range")
		end
	end
end
