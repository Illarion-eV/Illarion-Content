
module("scheduled.alchemy", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.alchemy', 5, 5, 'startAlchemy');


-- This script is used for character independet events lasting over some time


INSECTS = {}

INSECTS["wasps"] = {}
INSECTS["wasps"]["id"] = {271,272,273,274,278}
--'Wasp','Hornet','Wasp Queen','Wasp Drone','Fire Wasp'
INSECTS["wasps"]["emotes"] = {}
INSECTS["wasps"]["emotes"]["de"] = {}
INSECTS["wasps"]["emotes"]["en"] = {}

INSECTS["beetles"] = {}
INSECTS["beetles"]["id"] = {591,592,593,594}
--'Peaceful Beetle','Hunter Beetle','Scarab','Coffin Crawler'
INSECTS["beetles"]["emotes"] = {}
INSECTS["beetles"]["emotes"]["de"] = {}
INSECTS["beetles"]["emotes"]["en"] = {}


function startAlchemy()


end

function startAlchemyTest()

    if areaList == nil then
	    return
	end

	for i=1,#areaList do
	
	    if areaList[i].counter > 1 then
		    
			if math.floor(areaList[i].counter/2) == areaList[i].counter/2 then
			    
			end	
			 
			local rnd = math.random(#areaList[i].targetArea)
			thePos = areaList[i].targetArea[rnd]
			theField = world:getField(thePos)
			if theField:isPassable() then
				local insects 
				if math.random(2)==2 then
				    insects = "wasps"
				else
				    insects = "beetles"
				end
				local monster = world:createMonster(INSECTS[insects]["id"][math.random(#INSECTS[insects]["id"])],thePos,-10);
			else
				table.remove(areaList[i].targetArea,rnd)
			end	
			
			if counter == (areaList[i].quality*2)+2 then
			    areaList[i] = nil 
			end	
			
	    end
	
	end
	

end

function bombExploded(theTargetArea, theQuality)

    local listPos
    if areaList == nil then
	    areaList = {}
		listPos = 1
	else
        listPos=#areaList+1
    end
	areaList[listPos] = {targetArea=theTargetArea,counter=0,quality=theQuality}
end