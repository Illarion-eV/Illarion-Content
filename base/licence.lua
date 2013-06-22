require("base.common")
require("base.factions")

module("base.licence", package.seeall)

--licencePos={}
licencePosCad={position(150,700,0)}; --Cadomyr
licencePosRun={position(900,900,0)}; --Runewick
licencePosGal={position(383,276,0),position(408,263,0),position(376,233,0)}; --Galmair workshop, alchemy hous, 


--licenceGalmairPos={position(383,276,0),position(408,263,0),position(376,233,0)}; --Galmair workshop, alchemy hous, kitchen (Crest)
--licenceGalmairPos[1]="383,276,0"; --Galmair workshop
--licenceGalmairPos[2]=408,263,0;	--Galmair alchemy hous
--licenceGalmairPos[3]={position(376,233,0)}	--Galmair kitchen (Crest)

function licence(char)
--	for x= 1,3 do
		for i= 1,1 do --Cadomyr, set second number according to sum of positions (current 1)
			local licencePos = licencePosCad[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			char:inform("Distance: " ..licenceDistance,"Distance: " ..licenceDistance)
			if licenceDistance < 11 then
				licencerequired = 1
				licenceQuestID = 811
				char:inform("Required: " ..licencerequired,"Required: " ..licencerequired)
				licenceCheck(char)
			end
		end
		for i= 1,1 do --Runewick, set second number according to sum of positions (current 1)
			local licencePos = licencePosRun[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			char:inform("Distance: " ..licenceDistance,"Distance: " ..licenceDistance)
			if licenceDistance < 11 then
				licencerequired = 2
				licenceQuestID = 812
				char:inform("Required: " ..licencerequired,"Required: " ..licencerequired)
				licenceCheck(char)
			end
		end
		for i= 1,3 do --Galmair, set second number according to sum of positions (current 3)
			local licencePos = licencePosGal[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			char:inform("Distance: " ..licenceDistance,"Distance: " ..licenceDistance)
			if licenceDistance < 11 then
				licencerequired = 3
				licenceQuestID = 813
				char:inform("Required: " ..licencerequired,"Required: " ..licencerequired)
				licenceCheck(char)
			end
		end
--	end
end

function licenceCheck(char)
	char:inform("licencerequired: " ..licencerequired,"licencerequired: " ..licencerequired)
	char:inform("licenceQuestID: " ..licenceQuestID,"licenceQuestID: " ..licenceQuestID)
	if base.factions.getMembership(char) == 0 or base.factions.getRankpoints(char) >=100 then
		if base.factions.getMembership(char) == licencerequired or char:getQuestProgress(81 licencerequired) > 0 then	
			base.common.InformNLS(char,"Du hast eine Lizenz.","You habe a licence.");
		else
			base.common.InformNLS(char,"Du solltest eine Lizenz erwerbern.","You should purchase a licence.");
		end
		char:inform("Faction: " ..base.factions.getMembership(char),"Faction: " ..base.factions.getMembership(char))
		char:inform("Quest Status: " ..char:getQuestProgress(licenceQuestID),"Quest Status: " ..char:getQuestProgress(licenceQuestID))
	end
end
