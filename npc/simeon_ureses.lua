--------------------------------------------------------------------------------
-- NPC Name: Simeon Ureses                                            Cadomyr --
-- NPC Job:  Armourer                                                         --
--                                                                            --
-- NPC Race: human                      NPC Position:  133, 581, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: June 12, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 133, 581, 0, 4, 'Simeon Ureses', 'npc.simeon_ureses', 0, 1, 3, 180, 35, 35, 160, 80, 45);
---]]

require("base.common")
require("npc.base.autonpcfunctions")
require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.simeon_ureses", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Simeon Ureses the royal armourer. Keyphrases: Hello, armourer, dwarves, Irmorom, repair, cost."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Simeon Ureses der königliche Waffenmeister. Schlüsselwörter: Hallo, Waffenmeister, Zwerge, Irmorom, reparieren, Kosten."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Good day. Shall I repair your equipment?");
talkEntry:addResponse("Hello. Come with broken things and you will go with fixed ones.");
talkEntry:addResponse("Pardon me, could you come back in a minute or two? I have to fix this first.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Guten Tag. Soll ich eure Ausrüstung reparieren?");
talkEntry:addResponse("Hallo. Kommt zu mir mit Zerbrochenem und geht mit Repariertem.");
talkEntry:addResponse("Entschuldigt, könnt ihr in ein bis zwei Minuten nochmal wiederkommen? Ich muss dies hier erst reparieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Good day. Shall I repair your equipment?");
talkEntry:addResponse("Hello. Come with broken things and you will go with fixed ones.");
talkEntry:addResponse("Pardon me, could you come back in a minute or two? I have to fix this first.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Guten Tag. Soll ich eure Ausrüstung reparieren?");
talkEntry:addResponse("Hallo. Kommt zu mir mit Zerbrochenem und geht mit Repariertem.");
talkEntry:addResponse("Entschuldigt, könnt ihr in ein bis zwei Minuten nochmal wiederkommen? Ich muss dies hier erst reparieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Good bye. And do some adventures for me.");
talkEntry:addResponse("Farewell and come back soon.");
talkEntry:addResponse("I bid you farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf Wiedersehen. Und erlebt ein paar Abenteuer für mich mit.");
talkEntry:addResponse("Gehabt euch wohl und kommt bald wieder.");
talkEntry:addResponse("Ich wünsche euch was.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Auf Wiedersehen. Und erlebt ein paar Abenteuer für mich mit.");
talkEntry:addResponse("Gehabt euch wohl und kommt bald wieder.");
talkEntry:addResponse("Ich wünsche euch was.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf Wiedersehen. Und erlebt ein paar Abenteuer für mich mit.");
talkEntry:addResponse("Gehabt euch wohl und kommt bald wieder.");
talkEntry:addResponse("Ich wünsche euch was.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Good. I just got a new rasp.");
talkEntry:addResponse("Did you know why a raspberry is called raspberry? Take a rasp and a raspberry and feel the surface...");
talkEntry:addResponse("I need to work, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Gut. Ich habe gerade eine neue Feile bekommen.");
talkEntry:addResponse("Wußtet ihr, dass eine Erdbeere gar keine Beere sondern eine Nussart ist?");
talkEntry:addResponse("Ich muss arbeiten, entschuldigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Simeon Ureses, the royal armourer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Simeon Ureses, der königliche Waffenmeister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do I look like I'd issue quests?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Sehe ich aus wie einer, der Befehle verteilt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Do I look like I'd issue quests?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Sehe ich aus wie einer, der Befehle verteilt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the royal armourer. So, whenever your sword turns blunt, come to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der königliche Waffenmeister. Wenn also euer Schwert stumpf wird, kommt zu mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am the royal armourer. So, whenever your sword turns blunt, come to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der königliche Waffenmeister. Wenn also euer Schwert stumpf wird, kommt zu mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarv");
talkEntry:addResponse("Yes, indeed, I am the royal armourer and I am not a dwarf. Do you think only dwarves can forge and smith?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("armourer");
talkEntry:addTrigger("armorer");
talkEntry:addResponse("As royal armourer, it is my responsibility that the equipment of the knights of Cadomyr is in a perfect condition.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hush! Not in public.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Fürwahr, ich bin der königliche Waffenmeister und kein Zwerg. Denkt ihr etwa, nur Zwerge können schmieden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waffenmeister");
talkEntry:addResponse("Als königlicher Waffenmeister ist es meine Pflicht, dafür zu sorgen, dass die Ausrüstung der Ritter Cadomyrs in bester Verfassung ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addResponse("Still! Doch nicht in der Öffentlichkeit!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addResponse("I am not a trader but I can repair your items.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addResponse("Ich bin kein Händler aber ich kann eure Gegenstände reparieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Irmorom, the god of crafting, is the only god I really pray to. I respect them all, though. Even Oldra!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Irmorom, der Gott des Handwerkes, ist der einzige Gott, zu dem ich bete. Ich respektiere sie aber alle, sogar Oldra!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Brágon grants me the fire for forging but he does not grant the hammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Brágon gibt mir das Schmiedefeuer, doch gibt er mir nicht den Schmiedehammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Irmorom, the god of crafting, is the only god I really pray to. I respect them all, though. Even Oldra!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Irmorom, der Gott des Handwerkes, ist der einzige Gott, zu dem ich bete. Ich respektiere sie aber alle, sogar Oldra!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So, I am with Cadomyr so I have to pray to Malachín? You need to learn a lot...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("So, ich bin also aus Cadomyr, also muss ich zu Malachín beten? Ihr müßt noch eine Menge lernen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I serve the queen because she is the queen. Did I make myself clear?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich diene der Königin, weil sie die Königin ist. Habe ich mich klar ausgedrückt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I serve the queen because she is the queen. Did I make myself clear?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich diene der Königin, weil sie die Königin ist. Habe ich mich klar ausgedrückt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The wellbeing of Cadomyr is my only concern. I will not do anything against Cadomyr, regardless of my personal opinion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Das Wohlergehen Cadomyrs ist mein einziger Lebensinhalt. Ich werde nichts zum Schaden Cadomyrs tun, unabhängig davon, was meine eigentliche Meinung ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Ja, ich schaff das.", "Yes, I can!");
talkingNPC:addCycleText("Ihr da! Sehe ich da eine Schramme in eurer Rüstung?", "Lo! Is that a scratch in your armour?");
talkingNPC:addCycleText("Die Ritter Cadomyrs sollten nur in strahlenden Rüstungen in die Schlacht ziehen.", "The knights of Cadomyr should go to battle only in shiny armour.");
talkingNPC:addCycleText("Ein gebrochenes Herz? Das kann ein Bier von Severus helfen. Ein zerbrochenes Schwert? Da kann ich helfen!", "A broken heart? A beer from Severus might help. A broken sword? I can help!");
talkingNPC:addCycleText("Dies ist... Cadomyr!", "This is... Cadomyr!");
talkingNPC:addCycleText("#me poliert eine Panzerplatte.", "#me polishes a plate armour.");
talkingNPC:addCycleText("Ein zerbrochener Bogen tötet genau noch ein Opfer: Den Idioten mit der Sehne in der Hand.", "A broken bow kills just one victim: The idiot holding the string.");
talkingNPC:addCycleText("Ich kenne einen Ort mit Bäumen in der Wüste... Nicht einfach nur ein paar verschrumpelte Palmen sondern richtig Bäume mit Blättern!", "I know a place with trees in the desert... not just some ordinary palm trees but real trees with leaves!");
talkingNPC:addCycleText("Guten Tag.", "Good day.");
talkingNPC:addCycleText("Ich hoffe, alles läuft zu eurer Zufriedenheit?", "I hope all is well?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Simeon Ureses der königliche Waffenmeister.", "This NPC is Simeon Ureses the royal armourer.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 363);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 459);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) 

--ADDITTION BY ESTRALIS
    if string.find(message,"price") or string.find(message,"cost") or string.find(message,"Preis") or string.find(message,"koste") or string.find(message,"repair") or string.find(message,"fix") or string.find(message,"reparier") or string.find(message,"instand") then --initiate repairing with triggers

		--Full repair is the same as buying a new one. Just worth it with special (e.g. gemmed) items.
		--Round prices to prevent prices like "1273 cp" and to prevent exact durability determination via repairing.

		if string.find(message,"price") or string.find(message,"cost") or string.find(message,"repair") or string.find(message,"fix") then --english triggers
            language = 1; --english
		else
		    language = 2; --german
		end
 
		theItem=base.common.GetFrontItem(thisNPC); --What item shall be repaired?

		thisNPC:talk(Character.say, "Worth: "..theItem.Worth.."!"); --Message 3
		
		if theItem and theItem.Worth then
			durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
		    toRepair=99-durability; --the amount of durability points that has to repaired
		    price=math.ceil(theItem.Worth*toRepair/1000)*10; --Price rounded up in 10 cp steps
		end
		
		if theItem.id == 0 or theItem.id == 320 or theItem.id == nil then --there is nothing on the table!
		
	        message1={"Please put the item I shall repair on the table.","Packt den Gegenstand, den ich instandsetzen soll, einfach auf den Tisch."}; --No item found
		    thisNPC:talk(Character.say, message1[language]); --Message 1
			
		elseif theItem.Worth == 0 or theItem.isStackable or durability==99 then --Cannot repair perfect, priceless or stackable items
		
	        message2={"I cannot repair this, sorry.","Entschuldigt, aber das kann ich nicht reparieren."}; --Priceless, perfect or stackable item
		    thisNPC:talk(Character.say, message2[language]); --Message 2
			
		else -- I can repair it!
	
	        if string.find(message,"price") or string.find(message,"cost") or  string.find(message,"Preis") or string.find(message,"koste") then --player just wants to know the price
			    
				message3={"For repairing this item, I demand "..price.." copper coins.","Die Reparatur dieses Gegenstandes würde "..price.." Kupferstücke kosten."}; --Saying the price
		        thisNPC:talk(Character.say, message3[language]); --Message 3
				
            elseif string.find(message,"repair") or string.find(message,"fix") or string.find(message,"reparier") or string.find(message,"instand") then --player wants to repair the item
			
			    if not npc.base.autonpcfunctions.CheckMoney(speaker,price) then --player is broke
				
			        message4={"You don't have enough money I suppose. I demand "..price.." copper coins for repairing this item.","Ihr habt anscheinend nicht genug Geld. Die Reparatur würde "..price.." Kupferstücke kosten."}; --Player is broke
		            thisNPC:talk(Character.say, message4 [language]); --Message 4
					
			    else --he has the money
				
			        message5={"#me repairs the item at a cost of "..price.." copper coins.","#me setzt den Gegenstand für "..price.." Kupferstücke in Stand."};	--...
                    thisNPC:talk(Character.say, message5 [language]); --Message 5
                    npc.base.autonpcfunctions.PayTheNPC(speaker,price); --pay!
                    theItem.quality=theItem.quality+toRepair; --repair!
                    world:changeItem(theItem);
					
				end --broke/wealthy	
			end --price/repair
		end --there is an item
	else
        mainNPC:receiveText(speaker, message); 
	end
end;

function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END