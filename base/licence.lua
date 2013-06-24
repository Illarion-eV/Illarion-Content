require("base.common")
require("base.factions")

module("base.licence", package.seeall)


licencePosCad={position(150,550,0)}; --Cadomyr
licencePosRun={position(830,850,0),position(830,850,1),position(830,850,3)}; --Runewick
licencePosGal={position(400,300,0),position(391,329,-6)}; --Galmair 


function licence(char)
		local AmountCad = table.getn(licencePosCad)	--Cadomyr
		for i= 1,AmountCad do --loop for each tool-position (cadomyr)
			local licencePos = licencePosCad[i] --get coordinates from table
			local licenceDistance = char:distanceMetricToPosition (licencePos) --get distance from player
			if licenceDistance < 151 then --check if player is in range of tool
				licencerequired = 1 --set faction id for licenceCheck(char)
				licenceQuestID = 811 --set quest id for licenceCheck(char)
				return licenceCheck(char) --run licenceCheck(char) and return state to craft-id-script
			end
		end

		local AmountRun = table.getn(licencePosRun)	--Runewick
		for i= 1,AmountRun do
			local licencePos = licencePosRun[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			if licenceDistance < 151 then
				licencerequired = 2
				licenceQuestID = 812
				return licenceCheck(char)
			end
		end

		local AmountGal = table.getn(licencePosGal)	--Galmair
		for i= 1,AmountGal do
			local licencePos = licencePosGal[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			if licenceDistance < 151 then
				licencerequired = 3
				licenceQuestID = 813
				return licenceCheck(char)
			end
		end
end

function licenceCheck(char)
	if base.factions.getMembership(char) == 0 or base.factions.getRankpoints(char) >=100 then --check if player is outlaw or at least rank 2, anyone else will be ignored
		if base.factions.getMembership(char) == licencerequired or char:getQuestProgress(licenceQuestID) > 0 then --check if player is member of the right faction or has licence	
		else
			base.common.InformNLS(char,"Du besitzt keine Lizenz für die Verwendung der Geräte dieser Stadt. Gehe ins Zensurbüro, um dort eine zu erwerben und damit die Geräte verwenden zu können oder werde Bürger dieser Stadt.","You do not have a licence for the use of static tools in this town. Go to the census office and purchase one in order to be able to use their static tools or become a citizen."); --player gets info to buy licence

			return true --craft-script stops later; set to true as soon as NPCs are ready
		end
	end
end
