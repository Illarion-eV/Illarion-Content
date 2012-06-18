-- Long Time Effect Script: Newbie Island
-- Effect ID: 13
-- Values: newbiePosX, newbiePosY, newbiePosZ, itemid_1, itemnumber_1, itemdata_1, itemquality_1 (1-18)
-- Reworked by Merung for NewNoobia
-- Pimped by Estralis

require("base.common")
module("lte.newbieisland", package.seeall)

-- cycle messages 
	ListCycleMessageGerman = {}
	ListCycleMessageGerman = {
	"Zyklusnachricht 1 deutsch",
	"Zyklusnachricht 2 deutsch",
	"Zyklusnachricht 3 deutsch",
	"Zyklusnachricht 4 deutsch",
	"Zyklusnachricht 5 deutsch",
	"Zyklusnachricht 6 deutsch",
	"Zyklusnachricht 7 deutsch",
	"Zyklusnachricht 8 deutsch",
	"Zyklusnachricht 9 deutsch"}

	ListCycleMessageEnglish = {}
	ListCycleMessageEnglish = {
	"Zyklusnachricht 1 englisch",
	"Zyklusnachricht 2 englisch",
	"Zyklusnachricht 3 englisch",
	"Zyklusnachricht 4 englisch",
	"Zyklusnachricht 5 englisch",
	"Zyklusnachricht 6 englisch",
	"Zyklusnachricht 7 englisch",
	"Zyklusnachricht 8 englisch",
	"Zyklusnachricht 9 englisch"}
	-- cycle messages end

function addEffect(newbieEffect, Character)
end

function callEffect(newbieEffect,Character)
    
	if (Character.pos.z ~= 100) and (Character.pos.z ~= 101) then
	    return false; --removing the effect
	end	
	
	foundRoundCount, roundCount = newbieEffect:findValue("roundCount"); --each 2nd call yields a hint on tutorial, the other a general hint

	if foundRoundCount then --Help	
	    if (roundCount/2) ~= math.floor(roundCount/2) then --Tutorial help

	        --Station 1: Henry Cunnigan teaches how to talk to NPCs		
	        if Character:getQuestProgress(309) < 1 and Character:isInRangeToPosition(position(38, 21, 100),15) then -- the char should walk to a specific postion (see: triggerfield/noobia_henry)
		        base.common.InformNLS(Character,"ÜBERSETZEN.","[Tutorial] To start the tutorial, please walk to the human at the end of the pier. Click and hold with the right mouse button on a spot close to the human. You can also walk using the num pad, the arrow keys or WASD.");
	        end 

	        --Station 2: XXX		
	        if XXX then
		    end
			
		else --General help
		
			foundMessageCount, messageCount = newbieEffect:findValue("messageCount");
			
			if not foundMessageCount then
				messageCount = 1;
			end	
			
			base.common.InformNLS(Character,""..ListCycleMessageGerman[messageCount],""..ListCycleMessageEnglish[messageCount]);   
			
			messageCount = messageCount + 1;
			
			if messageCount > #ListCycleMessageGerman then 
				messageCount = 1;
			end	
			
			newbieEffect:addValue("messageCount",messageCount);
		end
		
		roundCount = roundCount + 1;
	else
	    roundCount = 1;
	end
	
	newbieEffect:addValue("roundCount",roundCount); --whatever this is. Merung, learn to use comments ;-)
	newbieEffect.nextCalled=100; --Ten seconds
	return true; --bailing out in any case
	
end

function removeEffect(newbieEffect, Character)
end