require("base.common")
module("scheduled.alchemy", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.alchemy', 5, 5, 'startAlchemy');


-- This script is used for character independet events lasting over some time


WASPS = {}

WASPS["id"] = {271,272,273,274,278}
--'Wasp','Hornet','Wasp Queen','Wasp Drone','Fire Wasp'
WASPS["emotes"] = {}
WASPS["emotes"]["de"] = {"#me kommt vom süßen Geruch angelockt summend angeschworren.", "#me fliegt dem Duft folgend daher.", "#me kommt angerauscht und fliegt zu der Quelle des süßen Geruchs.","#me stürtzt mit ausgestreckten Fühlern zum Ursprung des Duftes."}
WASPS["emotes"]["en"] = {"#me comes closer humming, drawn in by the sweet smell.","#me flies along, following the sweet scent.","#me rushes to the source of the sweet smell.","#me descents with stretched out antennas to the source of the scent."}

-- conatining all center points
CENTERS = {} 

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
	
	for i=1,#CENTERS do
		
		local theCenter = CENTERS[i]
		
		for j=1,#CENTER[theCenter] do
		
			local quality = CENTER[theCenter][j][1]
			local counter = CENTER[theCenter][j][2]
			local targetArea = CENTER[theCenter][j][3]
			
			local removeAt = quality*2
		
			if counter >= 2 then
				
				if math.floor(counter/2) == counter/2 then -- even numbers
					
					local checkedCounter = 1
					local check
					while check == false do
						local thePos == targetArea[checkedCounter]
						local theField = world:getField(thePos)
						if theField:isPassable() then
							local wasp = world:createMonster(WASPS["id"][math.random(1,#WASPS["id"])],posi,-20)
							if math.random(1,2)==1 or counter == 2 then
								local rnd = math.random(1,#WASPS["emotes"]["de"])
								wasp:talk(Character.say,WASPS["emotes"]["de"][rnd],WASPS["emotes"]["en"][rnd])
							end
							check = true
						elseif checkedCounter == #targetArea -- we have checked the whole area, no free position; abort
							check = true
						end
					end	
				end
			end
			counter = counter + 1
			if counter == removeAt then
				table.remove(
			end
		end
		
		
	  

end