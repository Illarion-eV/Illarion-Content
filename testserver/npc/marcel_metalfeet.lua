--------------------------------------------------------------------------------
-- NPC Name: Marcel Metalfeet                                         Galmair --
-- NPC Job:  craftsman                                                        --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  389, 269, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 389, 269, 0, 6, 'Marcel Metalfeet', 'npc.marcel_metalfeet', 0, 2, 0, 68, 62, 0, 245, 211, 179);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
require("npc.base.trade")
require("base.common")
require("base.money")
module("npc.marcel_metalfeet", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Marcel Metalfeet the craftsman. Keywords: Repair, Work, Greetings, Religion."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC istMarcel Metalfeet der Handwerker. Schlüsselwörter: Reparieren, Arbeiten, Grüße, Religion."));
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
talkEntry:addTrigger("Good night");
talkEntry:addResponse("Hello. You look happy today? Did you eat a nice meal?");
talkEntry:addResponse("Hello. You do not look too happy today. Are you hungry?");
talkEntry:addResponse("Hello. How are you today?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("Hallo. Du siehst glücklich aus. Hast du grade etwas leckers gegesen?");
talkEntry:addResponse("Hallo. Du siehst nicht so glücklich aus. Hast du hunger?");
talkEntry:addResponse("Hallo. Wie geht es dir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello. You look happy today? Did you eat a nice meal?");
talkEntry:addResponse("Hello. You do not look too happy today. Are you hungry?");
talkEntry:addResponse("Hello. How are you today?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo. Du siehst glücklich aus. Hast du grade etwas leckers gegesen?");
talkEntry:addResponse("Hallo. Du siehst nicht so glücklich aus. Hast du hunger?");
talkEntry:addResponse("Hallo. Wie geht es dir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Save journy. And don't forget to take enough food with you!");
talkEntry:addResponse("#me waves goodbye.");
talkEntry:addResponse("Please come again!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gute Reise. Und vergiss nicht genug proviant mit zu nehmen!");
talkEntry:addResponse("#me winkt zum Abschied");
talkEntry:addResponse("Komm wieder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Save journy. And don't forget to take enough food with you!");
talkEntry:addResponse("#me waves goodbye.");
talkEntry:addResponse("Please come again!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gute Reise. Und vergiss nicht genug proviant mit zu nehmen!");
talkEntry:addResponse("#me winkt zum Abschied");
talkEntry:addResponse("Komm wieder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am fine. I just ate my cake.");
talkEntry:addResponse("I am fine. I'll soon eat my cake.");
talkEntry:addResponse("I am sad. I ate all my cake.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut. Ich habe eben Kuchen gegessen.");
talkEntry:addResponse("Mir geht es gut. Ich werde gleich Kuchen essen.");
talkEntry:addResponse("Ich bin traurig. Ich habe meinen Kuchen aufgegessen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Marcel Metalfeet, at your service.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Marcel Metalfeet, stets zu Diensten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("I do not sell anything. But I can repair all kind of things for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addTrigger("veräußer");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("I verkaufe nichts, aber ich kann allesmögliche für Euch reparieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I don't have anything to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich habe nichts für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I don't have anything to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich habe nichts für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I can repair all kind of things for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich kann allesmögliche für Euch reparieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I can repair all kind of things for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich kann allesmögliche für Euch reparieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I like cake! Everyonelse also likes cake! Nice,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich mag Kuchen! Und alle andern mögen auch Kuchen. Nett, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("We were created by the gods to colltect and eat the fruits in Illarion.");
talkEntry:addResponse("The gods were created out of cherry seeds.");
talkEntry:addResponse("One of the gods, the Milkspiller is evil. He ate a bad cake.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Wir wurden von den Göttern geschaffen um die Früchte Illarions zu essen.");
talkEntry:addResponse("Die Götter entstanden aus Kirschkernen.");
talkEntry:addResponse("Einer der Götter, der Milchversaurer ist böse. Er hat von einem schlechten Kuchen gegessen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("religion");
talkEntry:addResponse("Halflings have their own myths about how Illarion was created.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("religion");
talkEntry:addResponse("Halblinge haben ihre eignen Mythern über die Entstehung Illarions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faith");
talkEntry:addResponse("Halflings have their own myths about how Illarion was created.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glaube");
talkEntry:addResponse("Halblinge haben ihre eignen Mythern über die Entstehung Illarions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("I pray to Ushara. Cake is made of grain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ich bete zu Oldra. Kuchen wird auch Korn gemacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Freut mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Marcel");
talkEntry:addTrigger("Metalfeet");
talkEntry:addResponse("You want me to repair something for you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Metalfeet");
talkEntry:addTrigger("Metalfeet");
talkEntry:addResponse("Ich soll etwas für Euch reparieren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Did you say cake?");
talkEntry:addResponse("Did I hear you say cookies?");
talkEntry:addResponse("Pardon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hast du Kuchen gesagt?.");
talkEntry:addResponse("Hast du eben Kekse gesagt?");
talkEntry:addResponse("Wie bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me summt eine Melodie.", "#me hums a melody.");
talkingNPC:addCycleText("#me grinst.", "#me grins.");
talkingNPC:addCycleText("#me isst ein Stück Kuchen, welcher er grade aus seiner Tasche hervorholte.", "#me eats a pice of cake, he just took out for his bag.");
talkingNPC:addCycleText("Marcel Metalfeet! Ich repariere alles und jeden!", "Marcel Metalfeet! I repair everything and everyone!");
talkingNPC:addCycleText("#me pfeift eine Melodie.", "#me whistles.");
talkingNPC:addCycleText("#me schaut sich um.", "#me lookes around.");
talkingNPC:addCycleText("#me leckt sich über die Lippen.", "#me licks his lips.");
talkingNPC:addCycleText("#me lekt seine Finger ab.", "#me licks his fingers.");
talkingNPC:addCycleText("#w Ich möchte Kuchen essen... Ich möchte nicht arbeiten.", "#w I want to eat Cake... I do not want to work.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"buySecondary"));
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Marcel Metalfeet der Handwerker.", "This NPC is Marcel Metalfeet the craftsman.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 311);
mainNPC:setEquipment(6, 9);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) 

--ADDITTION BY ESTRALIS
    message=string.lower(message); --lower case MESSAGE -> message
	
    if base.common.BasicNPCChecks(speaker,2,npcChar) and (string.find(message,"price") or string.find(message,"cost") or string.find(message,"preis") or string.find(message,"koste") or string.find(message,"repair") or string.find(message,"fix") or string.find(message,"reparier") or string.find(message,"instand")) then --initiate repairing with triggers

		--Full repair is the same as buying half a new one. Just worth it with special (e.g. gemmed) items. Price may change if the players overdo it.
		--Round prices to prevent prices like "1273 cp" and to prevent exact durability determination via repairing.

		if string.find(message,"price") or string.find(message,"cost") or string.find(message,"repair") or string.find(message,"fix") then --english triggers
            language = 1; --english
		else
		    language = 2; --german
		end
 
		theItem=base.common.GetFrontItem(npcChar); --What item shall be repaired?
		
		if theItem then
            theItemStats=world:getItemStats(theItem); --reading its stats
		end
		
		if not theItem then --nothing there!
			message1={"Please put the item I shall repair on the table.","Packt den Gegenstand, den ich instandsetzen soll, einfach auf den Tisch."}; --No item found
		    npcChar:talk(Character.say, message1[language]); --Message 1
		end
		
		if theItem then
			durability=theItem.quality-100*math.floor(theItem.quality/100); --calculate the durability
		    toRepair=99-durability; --the amount of durability points that has to repaired
		    price=math.ceil(0.5*theItemStats.Worth*toRepair/1000)*10; --Price rounded up in 10 cp steps
		
            if theItem.id == 0 or theItem.id == 320 or theItem.id == nil then --there is nothing on the table!
		
	            message1={"Please put the item I shall repair on the table.","Packt den Gegenstand, den ich instandsetzen soll, einfach auf den Tisch."}; --No item found
		        npcChar:talk(Character.say, message1[language]); --Message 1
			
		    elseif theItemStats.Worth == 0 or theItemStats.isStackable or durability==99 then --Cannot repair perfect, priceless or stackable items
		
	            message2={"I cannot repair this, sorry.","Entschuldigt, aber das kann ich nicht reparieren."}; --Priceless, perfect or stackable item
		        npcChar:talk(Character.say, message2[language]); --Message 2
			
		    else -- I can repair it!
			
			    gp,sp,cp=base.money.MoneyToCoins(price); --converting to gp, sp and cp
			
			    if price >= 10000 then -- at least one gold coin

	                estring=" "..gp.." gold coins, "..sp.." silver coins and "..cp.." copper coins";
		            gstring=" "..gp.." Goldstücke, "..sp.." Silberstücke und "..cp.." Kupferstücke"; --what a name for a variable...

                elseif price >= 100 then -- at least one silver coin

		            estring=" "..sp.." silver coins and "..cp.." copper coins";
		            gstring=" "..sp.." Silberstücke und "..cp.." Kupferstücke"; --what a name for a variable...

	            else -- just copper coins

		            estring=" "..cp.." copper coins";
		            gstring=" "..cp.." Kupferstücke"; --what a name for a variable...

	            end
	
	            if string.find(message,"price") or string.find(message,"cost") or  string.find(message,"preis") or string.find(message,"koste") then --player just wants to know the price
			    
				    message3={"For repairing this item, I demand"..estring..".","Die Reparatur dieses Gegenstandes würde"..gstring.." kosten."}; --Saying the price
		            npcChar:talk(Character.say, message3[language]); --Message 3
				
                elseif string.find(message,"repair") or string.find(message,"fix") or string.find(message,"reparier") or string.find(message,"instand") then --player wants to repair the item
			
			        if not base.money.CharHasMoney(speaker,price) then --player is broke
				
			            message4={"You don't have enough money I suppose. I demand"..estring.." for repairing this item.","Ihr habt anscheinend nicht genug Geld. Die Reparatur würde"..gstring.." kosten."}; --Player is broke
		                npcChar:talk(Character.say, message4 [language]); --Message 4
					
			        else --he has the money
				
			            message5={"#me repairs the item at a cost of"..estring..".","#me setzt den Gegenstand für"..gstring.." in Stand."};	--...
                        npcChar:talk(Character.say, message5 [language]); --Message 5
                        base.money.TakeMoneyFromChar(speaker,price); --pay!
                        theItem.quality=theItem.quality+toRepair; --repair!
                        world:changeItem(theItem);
					
				    end --broke/wealthy	
			    end --price/repair
		    end --there is an item
        end --item exists
	else
        mainNPC:receiveText(npcChar, speaker, message); 
	end
--ADDITION END
end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END