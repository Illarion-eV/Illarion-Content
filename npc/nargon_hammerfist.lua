--------------------------------------------------------------------------------
-- NPC Name: Nargon Hammerfist                                           None --
-- NPC Job:  Miner                                                            --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  42, 55, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: June 21, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 42, 55, 100, 6, 'Nargon Hammerfist', 'npc.nargon_hammerfist', 0, 1, 3, 100, 53, 0, 248, 198, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.nargon_hammerfist", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reset");
talkEntry:addResponse("Noobia reset!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(310, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the Tutor Nargon Hammerfist. Keywords: Hello, help, skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Nargon Hammerfist. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("skip");
talkEntry:addTrigger("cancel");
talkEntry:addTrigger("abort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You decided to skip the tutorial. Please chose a faction now by DOING THIS AND THAT."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(37, 97, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("überspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(37, 97, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lektion wiederhohlen");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Ist die Sprachkonsole leer, kannst du sie mit erneutem drücken der Entertaste schließen."));
talkEntry:addResponse(" Öffne dein Inventar indem du bei geschlossener Sprachkonsole 'i' drückst. Halte die linke Maustaste gedrückt um die Spitzhacke in deine Hand zu ziehen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lektion wiederhohlen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Ist die Sprachkonsole leer, kannst du sie mit erneutem drücken der Entertaste schließen."));
talkEntry:addResponse("Ich hab dir eine Spitzhacke in den Gürtel gesteckt. Öffne dein Inventar indem du bei geschlossener Sprachkonsole 'i' drückst. Halte die linke Maustaste gedrückt um die Spitzhacke in deine Hand zu ziehen.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(312, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Ist die Sprachkonsole leer, kannst du sie mit erneutem drücken der Entertaste schließen."));
talkEntry:addResponse("Ich hab dir eine Spitzhacke in den Gürtel gesteckt. Öffne dein Inventar indem du bei geschlossener Sprachkonsole 'i' drückst. Halte die linke Maustaste gedrückt um die Spitzhacke in deine Hand zu ziehen.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(312, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2763, "body", "=>", 1));
talkEntry:addResponse("Auf selbe Weiße kannst du deine gesamte Ausrüstung verwalten. Geh jetzt in die Miene und benütze die Spitzhacke mit einem Steinbrocken um nach Kohle zu graben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(312, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Ist die Sprachkonsole leer, kannst du sie mit erneutem drücken der Entertaste schließen."));
talkEntry:addResponse("Öffne dein Inventar indem du bei geschlossener Sprachkonsole 'i' drückst. Halte die linke Maustaste gedrückt um die Spitzhacke in deine Hand zu ziehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(312, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 2));
talkEntry:addResponse("Großartig. Rohstoffe wie Kohle werden in Illarion benötigt um Waffen oder andere Gegenstände herzustellen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(312, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(312, "=", 2));
talkEntry:addResponse("Benütze die Spitzhacke mit einem Steinbrocken um nach Kohle und Erz zu graben. Bringe mir zwei Stück Kohle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(312, "=", 3));
talkEntry:addResponse("Folge nun weiter der Straße und sprich mit den Leuten auf deinem Weg. Gehabt Euch wohl Fremder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht sich durch seinen langen Bart. 'Arr, ich zeige dir wie du deine Ausrüstung verwaltest und Rohstoffe schürfst.'", "#me scratches his beard. 'Arr...! I will show you how to administrate your equipment and teach you how to gather ressources.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("This is your tutorial guide Agi Hammerklau the mason.", "Das ist dein Tutor Agi Hammerklau, der Steinmetz.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Du musst schon in einer Sprache sprechen die ich verstehe. Entweder die gemeinsame oder die rassenspezifische Sprache.", "You have to talk to me in a language which I understand. Either the common or the racespecific language.");
mainNPC:setEquipment(1, 7);
mainNPC:setEquipment(3, 2390);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 2763);
mainNPC:setEquipment(6, 392);
mainNPC:setEquipment(4, 529);
mainNPC:setEquipment(9, 2113);
mainNPC:setEquipment(10, 697);
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