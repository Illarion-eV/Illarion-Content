--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local common = require("base.common")
local factions = require("base.factions")

local M = {}


licencePosCad={position(105,550,0),position(105,595,0)}; --Cadomyr
licencePosRun={position(932,801,0),position(790,800,0),position(870,890,0),position(932,801,1)}; --Runewick
licencePosGal={position(360,235,0),position(345,280,0),position(390,330,-6),position(400,220,-6)}; --Galmair 

M.PERMISSION_NONE = 0	-- Permission for static tools is restricted
M.PERMISSION_ACTIVE = 1	-- Permission for static tools is granted


function M.licence(char)
		local AmountCad = #licencePosCad	--Cadomyr
		for i= 1,AmountCad do --loop for each tool-position (cadomyr)
			local licencePos = licencePosCad[i] --get coordinates from table
			local licenceDistance = char:distanceMetricToPosition (licencePos) --get distance from player
			if licenceDistance < 56 then --check if player is in range of tool
				licencerequired = 1 --set faction id for licenceCheck(char)
				licenceQuestID = 811 --set quest id for licenceCheck(char)
				return licenceCheck(char) --run licenceCheck(char) and return state to craft-id-script
			end
		end

		local AmountRun = #licencePosRun	--Runewick
		for i= 1,AmountRun do
			local licencePos = licencePosRun[i]
			local licenceDistance = char:distanceMetricToPosition (licencePos)
			if licenceDistance < 100 then
				licencerequired = 2
				licenceQuestID = 812
				return licenceCheck(char)
			end
		end

		local AmountGal = #licencePosGal	--Galmair
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
	if factions.getMembership(char) == 0 or factions.getRankpoints(char) >=100 then --check if player is outlaw or at least rank 2, anyone else will be ignored
		if ((factions.getMembership(char) == licencerequired) or (char:getQuestProgress(licenceQuestID) > 0) or (M.GetLicenceByFaction(licencerequired, factions.getFaction(char).tid) == M.PERMISSION_ACTIVE)) then --check if player is member of the right faction or has licence or his/her faction has permission	
		else
--			if math.random(1,100)< 51 then --chance that the player can break the law
--				common.InformNLS(char,"Hast du gar kein schlechtes Gewissen, hier ohne Lizenz zu arbeiten? Gehe ins Zensurbüro, um dort eine zu erwerben und damit die Geräte verwenden zu können oder werde Bürger dieser Stadt.","Do you not feel bad about working without a licence here? Go to the census office and purchase one in order to be able to use their static tools or become a citizen."); --player gets info he breaks law
--			else
				common.InformNLS(char,"Du besitzt keine Lizenz für die Verwendung der Geräte dieser Stadt. Gehe ins Zensurbüro, um dort eine zu erwerben und damit die Geräte verwenden zu können oder werde Bürger dieser Stadt.","You do not have a licence for the use of static tools in this town. Go to the census office and purchase one in order to be able to use their static tools or become a citizen."); --player gets info to buy licence

				return true --craft-script stops later; set to true as soon as NPCs are ready
--			end
		end
	end
end



--- get the licence for this faction depending on the char's faction or his individual licence
-- @param char The character whose faction is to be checked
-- @param thisFaction The faction ID of the static tool
function GetLicence(char, thisFaction)

--	local individualLicence = GetIndividualLicence(char, thisFaction) 
	local f = factions.getFaction(char).tid;
	local factionLicence = M.GetLicenceByFaction(thisFaction, f);
	return math.max(individualLicence, factionLicence)
end


--- get the licence for this faction by the other (hostile) faction
-- @param thisFaction The faction ID of the static tool
-- @param otherFaction The faction ID that is to be checked
function M.GetLicenceByFaction(thisFaction, otherFaction)
	local found, licence = ScriptVars:find("Licence_".. thisFaction);
	if not found then
		InitLicence(thisFaction);
		return M.GetLicenceByFaction(thisFaction, otherFaction);
	end
	licence = licence % (10^(otherFaction+1));
	licence = math.floor(licence / 10^otherFaction);
--debug("licence: "..licence) --debug
	return licence;
end

--- set the licence for all guards of this faction
-- @param thisFaction The faction ID of the static tool
-- @param otherFaction The faction ID whose licence is to be changed
-- @param newLicence The new licence, e.g. PERMISSIOM_NONE
function M.SetLicence(thisFaction, otherFaction, newLicence)
	-- get licence for all factions
	local found, licenceAll = ScriptVars:find("Licence_".. thisFaction);
	local oldLicence = 0;
	if not found then
		InitLicence(thisFaction);
		M.SetLicence(thisFaction, otherFaction, newLicence);
		return;
	else
		-- calculate the old licence for the otherFaction
		oldLicence = licenceAll % (10^(otherFaction+1));
		oldLicence = math.floor(oldLicence / 10^otherFaction);
	end
	-- subtract old licence
	licenceAll = licenceAll - (oldLicence * 10^(otherFaction));
	-- add new licence
	if newLicence == nil then --check if newLicence has a value and set it to 1 in case it does not. this will enable crafting then.
		newLicence = 1
	end 
	licenceAll = licenceAll + (newLicence * 10^(otherFaction));
	-- set ScriptVar again
	licenceAll = math.max(0,math.min(9999, licenceAll)); -- must not be negative & exceed 9999 (3 towns + outcasts)
	ScriptVars:set("Licence_".. thisFaction, licenceAll);
end

--- initialize the licence for all factions, only the current faction gets access
-- @param thisFaction The faction ID of the current faction
function InitLicence(thisFaction)
	ScriptVars:set("Licence_".. thisFaction, 0);
	M.SetLicence(thisFaction, thisFaction, PERMISSIOM_ACTIVE);
	local factions = {0,1,2,3};
	for _,f in pairs(factions) do
		if (thisFaction ~= f) then
			M.SetLicence(thisFaction, f, PERMISSIOM_ACTIVE);
		end
	end
end

return M