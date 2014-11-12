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
-- This scripts contains functions to work with the town treasury


local M = {}

-- get the treasure of a town
-- @town Town which treasure we want to get as a string: "Cadomyr"|"Runewick"|"Galmair"
function M.GetTownTreasure(town)
    local foundTreasure, currentTreasure = ScriptVars:find("Treasure"..town)
	if not foundTreasure then
		return 0;
	end
	local treasureNumber = tonumber(currentTreasure);
	if (treasureNumber == nil) then
		debug(string.format("Script variable was found and resolved to %s, but failed to convert to a number!", (currentTreasure == nil) and "nil" or currentTreasure));
		return 0;
	end

	return treasureNumber;
end

-- get the amount of taxes collected to determine the amount of gems to pay out
-- @town Town which treasure we want to get as a string: "Cadomyr"|"Runewick"|"Galmair"
function M.GetPaymentAmount(town)
    local foundTreasure, currentTreasure = ScriptVars:find("OldTreasure"..town)
	if not foundTreasure then
		currentTreasure = 0
	end
	return tonumber(currentTreasure)
end

-- get the amount of taxespayers last month to determine the amount of gems to pay out
-- @town Town which treasure we want to get as a string: "Cadomyr"|"Runewick"|"Galmair"
function M.GetTaxpayerNumber(town)
	local foundPayers, currentNoPayer = ScriptVars:find("OldPayers"..town)
	if not foundPayers then
		return 0;
	end
	return tonumber(currentNoPayer);
end

-- change treasure of a town
-- @town Town which treasure we want to change
-- @amount Amount of money. Positive number = increase treasure; negative number = decrease treasure
function M.ChangeTownTreasure(town,amount)
   local currentTreasure = M.GetTownTreasure(town)
   local newTreasure = currentTreasure + amount
   ScriptVars:set("Treasure"..town, newTreasure)
   ScriptVars:save()
end

-- increases the number of taxpayers for this month by 1.
-- @town Town
function M.IncreaseTaxpayerNumber(town)
	local foundPayers, currentNoPayer = ScriptVars:find("Payers"..town)
	if foundPayers then
		--debug("found payers: "..currentNoPayer)
		ScriptVars:set("Payers"..town, currentNoPayer+1)
	else
		ScriptVars:set("Payers"..town, 1)
		--debug("found payers: 1")
	end
	ScriptVars:save()
end


-- New month starts:
--	* Collected taxes are now stored as "old" taxes (overwrite!)
-- 	* Actual taxes are reset to 0
--	* Total number of taxpayers are stored as "old" Payers (overwrite!)
--	* Actual number of taxpayers is set to 0
--@town Town
--@timeStmp Timestamp of the new month
function M.NewMonthSwitch(town,timeStmp)
	--debug("NewMonthSwitch with "..town.." and "..timeStmp);
	local currentTreasure = M.GetTownTreasure(town);
	log(string.format("[tax switch] %s's treasure was reset. Old treasure was %d copper coins",
				town, currentTreasure))
	--debug("found treasure"..currentTreasure);
	ScriptVars:set("OldTreasure"..town, currentTreasure)
	ScriptVars:set("SwitchedToPayment"..town, timeStmp)
	ScriptVars:set("Treasure"..town, 0)

	local foundPayers, currentPayers = ScriptVars:find("Payers"..town)
	if foundPayers then
		--debug("found treasure"..currentTreasure);
		ScriptVars:set("OldPayers"..town, currentPayers)
		ScriptVars:set("Payers"..town, 0)
	else
		ScriptVars:set("OldPayers"..town, 0)
		ScriptVars:set("Payers"..town, 0)
	end
	ScriptVars:save()
end

return M