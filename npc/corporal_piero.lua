--------------------------------------------------------------------------------
-- NPC Name: Corporal Piero                                              None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  39, 649, 0             --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                          --
--                                                                            --
-- Last parsing: October 01, 2010                         easyNPC Parser v1.01 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 39, 649, 0, 4, 'Corporal Piero', 'npc.corporal_piero', 0, 1, 0, 15, 22,15, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.corporal_piero", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addResponse("Nochmals... Habt Dank. Ihr habt Cadomyr sehr geholfen. Zhambra soll Euch schützen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nochmals... Habt Dank. Ihr habt Cadomyr sehr geholfen. Zhambra soll Euch schützen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thanks, again. You helped Cadomyr very much. Zhambra shall bless you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mesage");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addResponse("Thanks, again. You helped Cadomyr very much. Zhambra shall bless you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addResponse("Gut gut! Ihr bringt gute Nachricht. Im Namen Cadomyrs will ich Euch danken und diese Karte überreichen. Sie stammt aus der Piraten Hand... oh und Tobis meinte ich soll Euch diesen Hut geben.");
talkEntry:addConsequence(npc.base.consequence.item.item(505, 1, 733, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "-", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gut gut! Ihr bringt gute Nachricht. Im Namen Cadomyrs will ich Euch danken und diese Karte überreichen. Sie stammt aus der Piraten Hand... oh und Tobis meinte ich soll Euch diesen Hut geben.");
talkEntry:addConsequence(npc.base.consequence.item.item(505, 1, 733, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "-", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well well! You deliver good news. In name of the great Cadomyr I like to thank you and present you this map I was able to capture from the pirates hands...oh and Tobis told me to hand you this hat.");
talkEntry:addConsequence(npc.base.consequence.item.item(505, 1, 733, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "-", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mesage");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addResponse("Well well! You deliver good news. In name of the great Cadomyr I like to thank you and present you this map I was able to capture from the pirates hands...oh and Tobis told me to hand you this hat.");
talkEntry:addConsequence(npc.base.consequence.item.item(505, 1, 733, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "-", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Großartig. Also auf in die Piratenbucht! Arrr, Landratte!'"));
talkEntry:addResponse("Irgendwo im Piratebay treibt sich mein Freund Tobis Vunu herum. Sage ihm das ich Euch sende und er wird Euch sich Euch anvertrauen. Seine Informationen sind ausgesprochen wichtig für die Wache Cadomyrs. Viel Glück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Großartig. Also auf in die Piratenbucht! Arrr, Landratte!'"));
talkEntry:addResponse("Irgendwo im Piratebay treibt sich mein Freund Tobis Vunu herum. Sage ihm das ich Euch sende und er wird Euch sich Euch anvertrauen. Seine Informationen sind ausgesprochen wichtig für die Wache Cadomyrs. Viel Glück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Awesome! Let's find a way to Pirate Bay! Arr, lubber!'"));
talkEntry:addResponse("My friend Tobis Vunu roams the caves of Pirate Bay. Tell him, I send you and he will talk to you. His information is very important for the guard of Cadomyr. Good luck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Awesome! Let's find a way to Pirate Bay! Arr, lubber!'"));
talkEntry:addResponse("My friend Tobis Vunu roams the caves of Pirate Bay. Tell him, I send you and he will talk to you. His information is very important for the guard of Cadomyr. Good luck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Soll das ein Auftrag sein? Besser, ich frage nach mehr Informationen...'"));
talkEntry:addResponse("In der Tat. Ja, ja. Im Namen der Wächter Cadomyrs bin ich ermächtigt Euch einen Auftrag zu erteilen. Sucht Euren Weg in die Bucht der Piraten. Tobis Vunu hat Informationen für mich die ausgesprochen wichtig sind. Übergebt mir diese Botschaft.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Soll das ein Auftrag sein? Besser, ich frage nach mehr Informationen...'"));
talkEntry:addResponse("In der Tat. Ja, ja. Im Namen der Wächter Cadomyrs bin ich ermächtigt Euch einen Auftrag zu erteilen. Sucht Euren Weg in die Bucht der Piraten. Tobis Vunu hat Informationen für mich die ausgesprochen wichtig sind. Übergebt mir diese Botschaft.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Is that a task or not? I should ask for more information..."));
talkEntry:addResponse("Indeed. Yes,yes. In name of the guard Cadomyr, I am used to order you a task. Find a way into the Pirate Bay. Tobis Vunu holds information wich is very important for me. deliver this message to me.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addConsequence(npc.base.consequence.inform.inform("'Is that a task or not? I should ask for more information..."));
talkEntry:addResponse("Indeed. Yes,yes. In name of the guard Cadomyr, I am used to order you a task. Find a way into the Pirate Bay. Tobis Vunu holds information wich is very important for me. deliver this message to me.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Zhambra zum Gruße.");
talkEntry:addResponse("Lang lebe Königin Rosaline Edwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Zhambras greets.");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Zhambra may bless the queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Zhambras greets.");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Zhambra may bless the queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Zhambra zum Gruße.");
talkEntry:addResponse("Lang lebe Königin Rosaline Edwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin Corporal Piero. Diener der Königin von Cadomyr");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Corporal Piero. Servant of the queen in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewel");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Have a good day.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Zhambra shall be with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Einen Schönen Tag noch.");
talkEntry:addResponse("Zhambra sei mit Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Have a good day.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Zhambra shall be with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gehabt Euch wohl.");
talkEntry:addResponse("Einen Schönen Tag noch.");
talkEntry:addResponse("Zhambra sei mit Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm mostly fine. The pirates be quiet. Shall I take this for good or bad? I don't know.");
talkEntry:addResponse("As long as queen Rosaline rules our land, everything is going well.");
talkEntry:addResponse("Hail Zhambra, hail queen Rosaline! I'm good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Größtenteils gut. Die Piraten verhalten sich ruhig. Ist das ein gutes Zeichen oder ein Schlechtes? Ich weiß es nicht.");
talkEntry:addResponse("So lange Königin Rosaline unser Land regiert, geht alles seinen rechten Weges.");
talkEntry:addResponse("Heil Zhambra, Heil Königin Rosaline! Mir geht's gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("I feel honored to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Ich fühle mich geehrt Euch zu treffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Helfen? Ich weiß nicht wie ich Euch helfen soll. Aber Ihr könntet mir helfen, insofern ihr nach einem 'Abenteuer' sucht.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Helfen? Ich weiß nicht wie ich Euch helfen soll. Aber Ihr könntet mir helfen, insofern ihr nach einem 'Abenteuer' sucht.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Help? I don't know how to help you. But you shoul dbe able to help me, as long as you are looking for an little 'adventure'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addResponse("Ich bin Wache. Ich be-Wache Leute. Lang lebe die Königin. Danke für deine Hilfe mit den Piraten, Zhambra soll dich schützen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addResponse("Ich bin Wache. Ich be-Wache Leute. Lang lebe die Königin. Danke für deine Hilfe mit den Piraten, Zhambra soll dich schützen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 6));
talkEntry:addResponse("I'm a guard. I guard people. Long live the queen. Thanks for your help with the pirates. Zhambra shall guard you.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Murgo. Sure I heared about him. He's quite fameous on this lands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Murgo. Sicher hab ich von ihm gehört. Er is richtig berühmt in diesen Landen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I'm a guard. Not a merchant. For sure you are able to trade inside of the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin Wächter. Kein Händler. Sicherlich könnt Ihr hinter den Toren der Stadt handeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Nowhere the codes of honour are followed like here in Cadomyr. For the colours of our town! Zhambra may bless it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Nirgendwo hat man so viel Gespür für wahre Ehre wie wir, in Cadomyr. Bei den Farben unserer Stadt! Zhambra möge sie bewaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a guard. I guard people. Long live the queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Wache. Ich be-Wache Leute. Lang lebe die Königin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich bin Wache. Ich be-Wache Leute. Lang lebe die Königin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm a guard. I guard people. Long live the queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Never heard of that. Is it far away?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Davon hab ich nie gehört. Ist das weit weg?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Archmage Elvaine Morgan is the ruler of Runewick. They say nobody dares to disagree with him, not because one is afraid of him, but nobody knows it better than him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Erzmagier Elvaine Morgan ist der Herrscher über Runewick. Es heißt niemand wagt es ihm zu widersprechen. Aber nicht aus Angst, sondern weil es niemanden gibt der es besser wüßte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Urgh. Runewick. Sounds to me like a place I never want to go. It's filled with arrogant bookworms who claim to know it all.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Urgh. Runewick. Klingt für mich nach einem Ort wo ich nie hin gehen werde. Es ist voll mit arroganten Bücherwürmern, die glauben sie wüßten alles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don Valerio Guilianni is the richest man in whole Galmair. So I will say... he holds the politic in hands there like no other one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Don Valerio Guilianni ist der reichste Mann in ganz Galmair. Also würde ich sagen, er hält die Politik der Stadt in Händen wie kein anderer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A chaotic moloch. Filled with scum. There's wealth the only thing to count. Most people there havn't a sense for honour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ein chaotisches Moloch. Überfüllt mit Abschaum. Reichtum ist dort alles was zählt. Dort kennt man keine Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("God bless queen Rosaline Edwards. She is the absolute ruler of our awesome land. The kings blood is strong and clean in her veins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gott schütze Königin Rosaline Edwards. Sie ist die absolute Herrscherin unseres großartigen Landes. Das Blut der Könige fließt stark und rein in ihren Adern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald");
talkEntry:addTrigger("king");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The king is dead. Long live the queen. When King Reginald Edwards died, queen Rosaline was able to inherit the crown. Aginst the plans of some nobles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald");
talkEntry:addTrigger("king");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Der König ist tot. Lang lebe die Königin. Als König Reginald Edwards verstarb, war es Königin Rosaline möglich den Tron zu besteigen. Wider den Plänen von so manchen Adeligen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Heil our crest. Heil our flags! Long live Cadomyr and the code of honour. I'm proud to call myself a servant of queen Rosaline.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Heil unserem Wappen. Heil unserer Fahne! Lang lebe Cadomyr und der Codex der Ehre. Ich bin stolz mich einen Diener, Königin Rosalines zu nennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Lang lebe Königin Rosaline Edwards.", "Long live queen Rosaline Edwards.");
talkingNPC:addCycleText("#me kratzt sich am Nasenrücken.", "#me has a scratch at the back of his nose.");
talkingNPC:addCycleText("#me holt ein Stück Brot aus der Tasche und steckt es sich in den Mund.", "#me takes a pice bread out of his bag and eat it.");
talkingNPC:addCycleText("#me nimmt einen kräftigen Schluck aus seinen Trinkschlauch.", "#me takes a nip out of his water bottle.");
talkingNPC:addCycleText("#me blickt zur Seite. 'Halt! Wer da?...Hm. War wohl doch nur der Wind.'", "#me turns to side. 'Stop! Someone there?...Hm. Seems the wind tricked me again.'");
talkingNPC:addCycleText("#me kratzt sich unauffällig am Hinterteil.", "#me has a inconspicuous short scratch at his butt.");
talkingNPC:addCycleText("#me blickt leicht verträumt in den Himmel.", "#me glances the sky in a moony way.");
talkingNPC:addCycleText("#me kaut nachdenklich an den Fingernägeln.", "#me noshes his fingernails, a thoughtful gaze in his face.");
talkingNPC:addCycleText("#me fasst sich mit der hand an die Seite: 'Ghn! Meine alte Verletzung schmerzt...'", "#me grabs his side and moans: 'Ghn! My old lesion hurts again...'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein Wächter Cadomyrs. Er ist gut rasiert und blickt stolz in die Ferne.", "A guard of Cadomyr. He's well shaved and glances proud into the area.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 2287);
mainNPC:setEquipment(3, 2369);
mainNPC:setEquipment(5, 2731);
mainNPC:setEquipment(9, 2114);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END