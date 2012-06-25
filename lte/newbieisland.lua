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
	"Zyklusnachricht deutsch",
	"[Tutorial] Brauchst du Hilfe? Mache DIES UND DAS oder schreibe '!gm Deine Frage' und drücke Return. Sobald ein Gamemaster verfügbar ist wird er dir helfen.",
	"Zyklusnachricht deutsch",
	"Zyklusnachricht deutsch",
	"Zyklusnachricht deutsch",
	"[Tutorial] Alle NPCs reagieren auf eine Reihe von Schlüsselwörtern. Eine List der wichtigsten Schlüsselwörter erhältst du als Antwort auf 'Hilfe'.",
	"[Tutorial] Indem du NPCs nach 'Aufgaben' und 'Quests' fragst, kannst du großen Reichtum erlangen.",
	"Zyklusnachricht deutsch",
	"[Tutorial] Der rote Balken repräsentiert die Gesundheit deines Charakters. Der gelbe Balken zeigt wie satt dein Charakter ist und der blaue Balken symbolisiert das Mana der Magier.",
	"Zyklusnachricht deutsch",
	"Zyklusnachricht deutsch"}

	ListCycleMessageEnglish = {}
	ListCycleMessageEnglish = {
	"[Tutorial] If you want to skip the tutorial, just say 'skip tutorial' to any NPC.",
	"[Tutorial] Do you need help? DO THIS AND THAT or type '!gm your question' and hit enter. As soon as a Gamemaster is available, he'll assist you.",
	"[Tutorial] To shout, place #s in front of your message. To whisper, use #w and use #o for the out of character mode.",
	"[Tutorial] A tutorial can never replace the help of other players or the Illarion staff. We invite you to join the official Illarion chat that is linked on the homepage.",
	"[Tutorial] If you want to introduce your character to other players, DO THIS AND THAT or type #i in the chatbox and hit return.",
	"[Tutorial] All NPCs react on a number of keywords. You can get a list of the most important keywords as answer to 'help'. ",
	"[Tutorial] By asking NPCs for 'missions' and 'quests' you can become extremely wealthy.",
	"[Tutorial] You can review your skills by DOING THIS AND THAT.",
	"[Tutorial] The red bar represents the health of your character. The yellow bar is an indicator how much your character is sated and the blue bar shows the mana of mages.",
	"[Tutorial] Did you already think about the background and past of your character? The illarion.org homepage contains a lot of information on lore.",
	"[Tutorial] If your character gets hungry, just harvest some fruits by using the trunk of a fruit tree. You can eat the fruits by using them."}
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
	        if Character:getQuestProgress(309) < 2 and Character:isInRangeToPosition(position(37, 21, 100),7) then -- the char should walk to a specific postion (see: triggerfield/noobia_henry)
		        base.common.InformNLS(Character,"ÜBERSETZEN.","[Tutorial] To start the tutorial, please walk to the human at the end of the pier. Click and hold with the right mouse button on a spot close to the human. You can also walk using the num pad, the arrow keys or WASD.");
	        end 

	        --Station 2: Aldania Elthewan, no special cycletext		
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