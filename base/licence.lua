require("base.common")
require("base.factions")

module("base.licence", package.seeall)


licencePosCad={position(105,550,0),position(105,595,0)}; --Cadomyr
licencePosRun={position(910,800,0),position(790,800,0),position(870,890,0),position(910,800,1),position(910,800,3)}; --Runewick
licencePosGal={position(360,235,0),position(345,280,0),position(390,330,-6),position(400,220,-6)}; --Galmair 

PERMISSION_NONE = 0	-- Permission for static tools is restricted
PERMISSION_ACTIVE = 1	-- Permission for static tools is granted


function licence(char)
		local AmountCad = table.getn(licencePosCad)	--Cadomyr
		for i= 1,AmountCad do --loop for each tool-position (cadomyr)
			local licencePos = licencePosCad[i] --get coordinates from table
			local licenceDistance = char:distanceMetricToPosition (licencePos) --get distance from player
			if licenceDistance < 56 then --check if player is in range of tool
				licencerequired = 1 --set faction id for licenceCheck(char)
				licenceQuestID = 811 --set quest id for licenceCheck(char)
				return licenceCheck(char) --run licenceCheck(char) and return state to craft-id-script
			end
		end

		local AmountRun = table.getn(licencePosRun)	--Runewick
		for i= 1,AmountRun do
			local licencePos = licencePosRun[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			if licenceDistance < 66 then
				licencerequired = 2
				licenceQuestID = 812
				return licenceCheck(char)
			end
		end

		local AmountGal = table.getn(licencePosGal)	--Galmair
		for i= 1,AmountGal do
			local licencePos = licencePosGal[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			if licenceDistance < 81 then
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


---test----



--- get the licence for this faction depending on the char's faction or his individual licence
-- @param char The character whose faction is to be checked
-- @param thisFaction The faction ID of the static tool
function GetLicence(char, thisFaction)
	if char:isAdmin() and not char.name=="Jupiter" then
		return PERMISSION_NONE;
	end
	
--	local individualLicence = GetIndividualLicence(char, thisFaction) 
	local f = base.factions.getFaction(char).tid;
	local factionLicence = GetLicenceByFaction(thisFaction, f);
	return math.max(individualLicence, factionLicence)
end


--- get the licence for this faction by the other (hostile) faction
-- @param thisFaction The faction ID of the guard
-- @param otherFaction The faction ID that is to be checked
function GetLicenceByFaction(thisFaction, otherFaction)
	local found, licence = ScriptVars:find("Licence_".. thisFaction);
	if not found then
		InitLicence(thisFaction);
		return GetLicenceByFaction(thisFaction, otherFaction);
	end
	licence = licence % (10^(otherFaction+1));
	licence = math.floor(licence / 10^otherFaction);
	return licence;
end

--- set the licence for all guards of this faction
-- @param thisFaction The faction ID of the guard
-- @param otherFaction The faction ID whose licence is to be changed
-- @param newLicence The new licence, e.g. PERMISSIOM_NONE
function SetLicence(thisFaction, otherFaction, newLicence)
	-- get licence for all factions
debug("newLicence: "..newLicence) --debug
debug("newLicence: "..newLicence,"newLicence:"..newLicence) --debug
	local found, licenceAll = ScriptVars:find("Licence_".. thisFaction);
	local oldLicence = 0;
	if not found then
		InitLicence(thisFaction);
		SetLicence(thisFaction, otherFaction, newLicence);
		return;
	else
		-- calculate the old licence for the otherFaction
		oldLicence = licenceAll % (10^(otherFaction+1));
debug("oldLicence: "..oldLicence,"oldLicence:"..oldLicence) --debug
		oldLicence = math.floor(oldLicence / 10^otherFaction);
debug("oldLicence: "..oldLicence,"oldLicence:"..oldLicence) --debug
	end
	-- subtract old licence
	licenceAll = licenceAll - (oldLicence * 10^(otherFaction));
debug("modeAll: "..modeAll,"modeAll:"..modeAll) --debug
	-- add new licence
	licenceAll = licenceAll + (newLicence * 10^(otherFaction));
debug("modeAll: "..modeAll,"modeAll:"..modeAll) --debug
	-- set ScriptVar again
	licenceAll = math.max(0,math.min(9999, licenceAll)); -- must not be negative & exceed 9999 (3 towns + outcasts)
debug("modeAll: "..modeAll,"modeAll:"..modeAll) --debug
	ScriptVars:set("Licence_".. thisFaction, licenceAll);
debug("licence: ".."Licence_".. thisFaction,"licence:".."Licence_".. thisFaction) --debug
end

--- initialize the licence for all factions, only the current faction gets access
-- @param thisFaction The faction ID of the current faction
function InitLicence(thisFaction)
	ScriptVars:set("Licence_".. thisFaction, 0);
	SetLicence(thisFaction, thisFaction, PERMISSIOM_NONE);
	local factions = {0,1,2,3};
	for _,f in pairs(factions) do
		if (thisFaction ~= f) then
			SetLicence(thisFaction, f, PERMISSIOM_ACTIVE);
		end
	end
end
