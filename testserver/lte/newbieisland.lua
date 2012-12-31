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
	"[Tutorial] Wenn du das Tutorial überspringen möchtest, sage 'Tutorial überspringen' zu einem NPC.",
	"[Tutorial] Brauchst du Hilfe? Schreibe '!gm Deine Frage' und drücke Return. Sobald ein Gamemaster verfügbar ist wird er dir helfen.",
	"[Tutorial] Um laut zu rufen, schreibe #s vor deine Nachricht. Um zu flüstern, verwende #w. Für den 'Out-of-character'-Modus verwendest du #o.",
	"[Tutorial] Ein Tutorial kann niemals die Hilfe anderer Spieler oder des Illarion-Teams ersetzen. Trete bitte dem offiziellen Illarion-Chat, der auf der Homepage verlinkt ist, und stell dich einfach mal vor.",
	"[Tutorial] Klicke und halte die linke Maustaste auf ein weit entferntes Feld um zu laufen.",
	"[Tutorial] Um deinen Charakter anderen Charakteren vorzustellen, schreibe #i in die Chatbox und drücke Return. Spieler in der näheren Umgebung werden so den Namen deines Charakters erfahren.",
	"[Tutorial] Alle NPCs reagieren auf eine Reihe von Schlüsselwörtern. Eine List der wichtigsten Schlüsselwörter erhältst du als Antwort auf 'Hilfe'.",
	"[Tutorial] Indem du NPCs nach 'Aufgaben' und 'Quests' fragst, kannst du großen Reichtum erlangen.",
	"[Tutorial] Um die Fertigkeiten deines Charakters zu überprüfen, drücke bei deaktivierter Chatbox 'C'.",
	"[Tutorial] Der rote Balken repräsentiert die Gesundheit deines Charakters. Der gelbe Balken zeigt wie satt dein Charakter ist und der blaue Balken symbolisiert das Mana der Magier.",
	"[Tutorial] Um gestapelte Gegenstände zu trennen, halte die Shift-Taste beim Bewegen gedrückt.",
	"[Tutorial] Hast du dir schon Gedanken zum Hintergrund und zur Vergangenheit deines Charakters gemnacht? Die Illarion-Homepage enthält eine Menge nützliche Informationen über Rassen, Götter und die Geschichte Illarions.",
	"[Tutorial] Sollte dein Charakter Hunger bekommen, so pflücke ein paar Früchte indem du den Stamm eines Obstbaums benutzt. Früchte werden gegessen, indem man sie benutzt."}

	ListCycleMessageEnglish = {}
	ListCycleMessageEnglish = {
	"[Tutorial] If you wish to skip the tutorial, just say 'skip tutorial' to any NPC.",
	"[Tutorial] Do you need help? Type '!gm <your question>' and hit enter. As soon as a Gamemaster is available, they will assist you.",
	"[Tutorial] To shout, type #s in front of your message. To whisper, use #w. And use #o for the out of character mode.",
	"[Tutorial] A tutorial can never replace the help of other players or the Illarion staff. We invite you to join the official Illarion chat, linked on the homepage, and introduce yourself.",
	"[Tutorial] Click and hold the left mouse button while pointing at a distant field to make your character run.",
	"[Tutorial] If you want to introduce your character to other players, type #i in the chatbox and hit return. The players around you will then be able to see your character's name.",
	"[Tutorial] All NPCs react on a number of keywords. You can get a list of the most important keywords for a particular NPC with the command 'help'.",
	"[Tutorial] By asking NPCs for 'missions' and 'quests' you can become extremely wealthy.",
	"[Tutorial] You can review your skills by deactivating the chat box and hitting 'C'.",
	"[Tutorial] The red bar represents the health of your character. The yellow bar is an indicator of how hungry your character is, and the blue bar shows the mana level of mage characters.",
	"[Tutorial] To split a stack of items, hold shift while moving the stack.",
	"[Tutorial] Did you already think about the background and past of your character? The illarion.org homepage contains a lot of information on the races, the gods, and the lore of Illarion.",
	"[Tutorial] If your character ever gets hungry, just harvest some fruits by using the trunk of a fruit tree. You can then eat the fruits by using them."}
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
		        base.common.HighInformNLS(Character,"[Tutorial] Gehe zum Menschen am Ende des Piers um mit dem Tutorial zu beginnen. Klicke auf ein Feld neben dem Menschen und halte die linke Maustaste gedrückt. Alternativ kannst du deinen Charakter auch mit WASD, dem Ziffernblock oder den Pfeiltasten bewegen.","[Tutorial] To start the tutorial, please walk to the human at the end of the pier. To move, click and hold with the left mouse button on a spot close to the human. Alternatively, you can walk using the num pad, the arrow keys or WASD.");
	        end 

		else --General help
		
			foundMessageCount, messageCount = newbieEffect:findValue("messageCount");
			
			if not foundMessageCount then
				messageCount = 1;
			end	
			
			base.common.HighInformNLS(Character,""..ListCycleMessageGerman[messageCount],""..ListCycleMessageEnglish[messageCount]);   
			
			messageCount = messageCount + 1;
			
			if messageCount > #ListCycleMessageGerman then 
				messageCount = 1;
			end	
			
			newbieEffect:addValue("messageCount",messageCount);
		end
		
		roundCount = roundCount + 1;
		
		if roundCount == 30 then --Let us check for players that required more than fifteen minutes for Noobia.

            Character:pageGM("This player could use assistance on Noobia.");
				
		end
		
	else
	    roundCount = 1;
	end
	
	newbieEffect:addValue("roundCount",roundCount); --whatever this is. Merung, learn to use comments ;-)
	newbieEffect.nextCalled=300; --Thirty seconds
	return true; --bailing out in any case
	
end

function removeEffect(newbieEffect, Character)
end