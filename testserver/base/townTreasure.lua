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

-- change treasure of a town
-- @town Town which treasure we want to change
-- @amount Amount of money. Positive number = increase treasure; negative number = decrease treasure
function ChangeTownTreasure(town,amount)

   local currentTreasure = GetTownTreasure(town)
   local newTreasure = currentTreasure + amount
   ScriptVars:set("Treasure"..town, newTreasure)
   ScriptVars:save()
    
end

-- New month starts:
--	* Collected taxes are now stored as "old" taxes (overwrite!)
-- 	* Actual taxes are reset to 0
function NewMonthSwitch(town,timeStmp)
debug("NewMonthSwitch with "..town.." and "..timeStmp);
	local foundTreasure, currentTreasure = ScriptVars:find("Treasure"..town)
	if foundTreasure then
	debug("found treasure"..currentTreasure);
		ScriptVars:set("OldTreasure"..town, currentTreasure)
		ScriptVars:set("SwitchedToPayment"..town, timeStmp)
		ScriptVars:set("Treasure"..town, 0)
	end
end