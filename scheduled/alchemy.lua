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
module("scheduled.alchemy", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.alchemy', 5, 5, 'startAlchemy');


-- This script is used for character independet events lasting over some time


WASPS = {}

WASPS["id"] = {271,272,273,274}
--'Wasp','Hornet','Wasp Queen','Wasp Drone'
WASPS["emotes"] = {}
WASPS["emotes"]["de"] = {"#me kommt vom süßen Geruch angelockt summend angeschworren.", "#me fliegt dem Duft folgend daher.", "#me kommt angerauscht und fliegt zu der Quelle des süßen Geruchs.","#me stürtzt mit ausgestreckten Fühlern zum Ursprung des Duftes."}
WASPS["emotes"]["en"] = {"#me comes closer humming, drawn in by the sweet smell.","#me flies along, following the sweet scent.","#me rushes to the source of the sweet smell.","#me moves with stretched out antennas to the source of the scent."}

-- conatining all center points
CENTERS = {} 

-- get active bomb information by center position
CENTER = {}


function startAlchemy()

	fruitBombInsectsSpawning()
	


end


-- potion 318
-- spawns insects over a certain period of time
function fruitBombInsectsSpawning()

	if CENTERS[1] == nil then
		return
	end
	
	local removeCounterCENTERS = 0
	for i=1,#CENTERS do
		
		local theCenter = CENTERS[i-removeCounterCENTERS]
		
		local removeCounterCENTER = 0
		for j=1,#CENTER[theCenter] do
		
			local quality = CENTER[theCenter][j-removeCounterCENTER][1]
			local counter = CENTER[theCenter][j-removeCounterCENTER][2]
			local targetArea = CENTER[theCenter][j-removeCounterCENTER][3]
			
			local removeAt = quality*2
			
			if counter >= 2 then
				
				if counter % 2 == 0 then -- even numbers
					
					local checkedCounter = 1
					local check = false
					while check == false do
						local thePos = targetArea[math.random(1,#targetArea)]
						local theField = world:getField(thePos)
						if theField:isPassable() then
							local wasp = world:createMonster(WASPS["id"][math.random(1,#WASPS["id"])],thePos,-20)
							world:gfx(7, thePos)
							if counter == 2 then
								local players = world:getPlayersInRangeOf(thePos,9)
								for i=1,#players do
									players[i]:inform("Ein Summen ist zu vernehmen. Wespen werden von dem Duft angelockt!", "A buzzing can be heard and gets closer. Wasps are allured by the sweet scent.")
								end
							end
							if math.random(1,2)==1 or counter == 2 then
								local rnd = math.random(1,#WASPS["emotes"]["de"])
								wasp:talk(Character.say,WASPS["emotes"]["de"][rnd],WASPS["emotes"]["en"][rnd])
							end
							check = true
						elseif checkedCounter == #targetArea then -- we have checked the whole area, no free position; abort
							check = true
						end
					end	
				end
			end
			CENTER[theCenter][j-removeCounterCENTER][2] = counter + 1
			if counter == removeAt then
				table.remove(CENTER[theCenter],j)
			end
		end
		
		if #CENTER[theCenter] == 0 then
			table.remove(CENTERS,i)
		end
	end
	
	
end
