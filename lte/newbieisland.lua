-- Long Time Effect Script: Newbie Island
-- Effect ID: 13
-- Values: newbiePosX, newbiePosY, newbiePosZ, itemid_1, itemnumber_1, itemdata_1, itemquality_1 (1-18)
-- reworked by Merung for Rincewinds new-noobia

require("base.common")
module("lte.newbieisland", package.seeall)

ListCycleMessageGerman = {}
ListCycleMessageGerman = {
"@Rince: zyklusnachricht 1 deutsch",
"@Rince: zyklusnachricht 2 deutsch",
"@Rince: zyklusnachricht 3 deutsch",
"@Rince: zyklusnachricht 4 deutsch",
"@Rince: zyklusnachricht 5 deutsch",
"@Rince: zyklusnachricht 6 deutsch",
"@Rince: zyklusnachricht 7 deutsch",
"@Rince: zyklusnachricht 8 deutsch",
"@Rince: zyklusnachricht 9 deutsch"}

ListCycleMessageEnglish = {}
ListCycleMessageEnglish = {
"@Rince: zyklusnachricht 1 englisch",
"@Rince: zyklusnachricht 2 englisch",
"@Rince: zyklusnachricht 3 englisch",
"@Rince: zyklusnachricht 4 englisch",
"@Rince: zyklusnachricht 5 englisch",
"@Rince: zyklusnachricht 6 englisch",
"@Rince: zyklusnachricht 7 englisch",
"@Rince: zyklusnachricht 8 englisch",
"@Rince: zyklusnachricht 9 englisch"}


function addEffect(newbieEffect, Character)
    -- newbie LTE has been added; we greet our new player
	base.common.InformNLS(Character,
	  "@Rince: text 1 DE",
	  "@Rince: text 1 EN");
	newbieEffect.nextCalled=20; -- time til the second hello-message (in 1/10) seconds
end

function callEffect(newbieEffect,Character)
    if (not Character.pos.z == 100) and (not Character.pos.z == 101) then -- not on the noobia map
	    return false
	end	
	
	foundSecMes,secMesValue = newbieEffect:findValue("secMes")
	if not foundSecMes then -- there was no second message yet; therefore: second message!
	    base.common.InformNLS(Character,
	    "@Rince: text 2 DE",
	    "@Rince: text 2 EN");
	    newbieEffect:addValue("secMes",1) -- that we remember nex time that we already gave the message out (the value 1 as such is unimportant; just that it is there)
	    newbieEffect.nextCalled=150
    else
	    foundNoobiaLight,noobiaLightValue = newbieEffect:findValue("noobiaLight")
		if not foundNoobiaLight then -- the char should walk to a specific postion (see: triggerfield/noobia_light)
		    base.common.InformNLS(Character,
	        "@Rince: text 3 DE",
	        "@Rince: text 4 EN");
	    end 
		
		if (Character:getQuestProgess(13) == 2) or (Charcater:getQuestProgess(13) == 3) then
		    base.common.InformNLS(Character,
	        "@Rince: text Schweine töten DE",
	        "@Rince: text Schweine töten EN");
	    end
		
		if (Character:getQuestProgess(12) == 2) then
		    base.common.InformNLS(Character,
	        "@Rince: text Kohle Erz DE",
	        "@Rince: text Kohle Erz EN");
	    end
	
	    foundRoundCount, roundCount = newbieEffect:findValue("roundCount")
	    if foundRoundCount then
		    if (roundCount/2) == math.floor(roundCount/2) then -- every second call the cycle message is given out
		        foundMessageCount, messageCount = newbieEffect:findValue("messageCount")
				if not foundMessageCount then
				    messageCount = 1
				end	
				base.common.InformNLS(Character,
	            ""..ListCycleMessageGerman[messageCount],
	            ""..ListCycleMessageEnglish[messageCount]);   
		        if foundMessageCount then
				    messageCount = messageCount + 1
				end
			    newbieEffect:addValue("messageCount",messageCount)
			end
		    
			roundCount = roundCount + 1
		else
		   roundCount = 1
		end
	    
		newbieEffect:addValue("roundCount",roundCount) 
	end
	
	return true
end

function removeEffect(newbieEffect, Character)
end