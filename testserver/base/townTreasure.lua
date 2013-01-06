-- This scripts contains functions to work with the town treasury

require("base.common")

module("base.townTreasure", package.seeall)

-- get the treasure of a town
-- @town Town which treasure we want to get as a string: "Cadomyr"|"Runewick"|"Galmair"
function GetTownTreasure(town)
    
    local foundTreasure, currentTreasure = ScriptVars:find("Treasure"..town)
	if not foundTreasure then
		currentTreasure = 0
	end
	return currentTreasure
	
end

-- get the amount of taxes collected to determine the amount of gems to pay out
-- @town Town which treasure we want to get as a string: "Cadomyr"|"Runewick"|"Galmair"
function GetPaymentAmount(town)
    local foundTreasure, currentTreasure = ScriptVars:find("OldTreasure"..town)
	if not foundTreasure then
		currentTreasure = 0
	end
	return currentTreasure
end

-- get the amount of taxespayers last month to determine the amount of gems to pay out
-- @town Town which treasure we want to get as a string: "Cadomyr"|"Runewick"|"Galmair"
function GetTaxpayerNumber(town)
debug("in gtpn");
	--local foundPayers, currentNoPayer = ScriptVars:find("OldPayers"..town)
	--if not foundPayers then
	--debug("TAXPAYERS RETURN 0")
--		currentNoPayer = 0
--	end
--	debug("TAXPAERS RETURN "..currentNoPayer);
--	return currentNoPayer
return 1
end

-- change treasure of a town
-- @town Town which treasure we want to change
-- @amount Amount of money. Positive number = increase treasure; negative number = decrease treasure
function ChangeTownTreasure(town,amount)
   local currentTreasure = GetTownTreasure(town)
   local newTreasure = currentTreasure + amount
   ScriptVars:set("Treasure"..town, newTreasure)
   ScriptVars:save()
end

-- increases the number of taxpayers for this month by 1.
-- @town Town
function IncreaseTaxpayerNumber(town)
	local foundPayers, currentNoPayer = ScriptVars:find("Payers"..town)
	if foundPayers then
		debug("found payers: "..currentNoPayer)
		ScriptVars:set("Payers"..town, currentNoPayer+1)
	else
		ScriptVars:set("Payers"..town, 1)
		debug("found payers: 1")
	end
end

-- get the number of taxpayers this month.
-- @town Town
function GetTaxpayerNumber(town)
	local foundPayers, currentNoPayer = ScriptVars:find("Payers"..town)
	if foundPayers then
		return currentNoPayer;
	else
		return 0;
	end
end

-- New month starts:
--	* Collected taxes are now stored as "old" taxes (overwrite!)
-- 	* Actual taxes are reset to 0
--	* Total number of taxpayers are stored as "old" Payers (overwrite!)
--	* Actual number of taxpayers is set to 0
--@town Town
--@timeStmp Timestamp of the new month
function NewMonthSwitch(town,timeStmp)
debug("NewMonthSwitch with "..town.." and "..timeStmp);
	local foundTreasure, currentTreasure = ScriptVars:find("Treasure"..town)
	if foundTreasure then
		debug("found treasure"..currentTreasure);
		ScriptVars:set("OldTreasure"..town, currentTreasure)
		ScriptVars:set("SwitchedToPayment"..town, timeStmp)
		ScriptVars:set("Treasure"..town, 0)
	else
		ScriptVars:set("OldTreasure"..town, 0)
		ScriptVars:set("SwitchedToPayment"..town, timeStmp)
		ScriptVars:set("Treasure"..town, 0)
	end
	
	local foundPayers, currentPayers = ScriptVars:find("Payers"..town)
	if foundPayers then
		debug("found treasure"..currentTreasure);
		ScriptVars:set("OldPayers"..town, currentPayers)
		ScriptVars:set("Payers"..town, 0)
	else
		ScriptVars:set("OldPayers"..town, 0)
		ScriptVars:set("Payers"..town, 0)
	end
end