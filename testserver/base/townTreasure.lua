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