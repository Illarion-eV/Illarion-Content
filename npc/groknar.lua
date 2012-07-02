--------------------------------------------------------------------------------
-- NPC Name: Groknar                                                     None --
-- NPC Job:  hunter                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  41, 44, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: July 02, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 41, 44, 100, 6, 'Groknar', 'npc.groknar', 0, 3, 0, 119, 28, 0, 84, 113, 46);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.groknar", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.quest.quest(314, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the Tutor Groknar. Keywords: Hello, help, skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Groknar. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
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
talkEntry:addConsequence(npc.base.consequence.warp.warp(0, 0, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You can attack other creatures by opening the character list with the hotkey XXX and initiating the attack with a double click on your enemy."));
talkEntry:addResponse("Hurr! I be Groknar, mightiest hunter of my clan. I will teach you how to smash puny creatures. Take a weapon of your choice in your hands and slay three of those pigs over there.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("Hurr! Ich bin Groknar der mächtigste Jäger meines Clans. Ich bring dir bei, erbärmliche Kreaturen zu erschlagen. Nimm eine Waffe deiner Wahl in die Hand und erschlage drei dieser Schweine dort drüben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You can attack other creatures by opening the character list with the hotkey XXX and initiating the attack with a double click on your enemy."));
talkEntry:addResponse("If there is one things I don't like to see then it is someone who refuses to smash puny pigs! Off, kill at least three of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You are awarded a club."));
talkEntry:addResponse("Very good. Your survival depends on your experience and your equipment. Here, have this club, it will fulfill its purpose. Now follow the road, Nargon Hammerfist expects you. Good travels, %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du erhältst eine Keule."));
talkEntry:addResponse("Sehr schön. Im Kampf wird deine Erfahrung und deine Ausrüstung für dein Überleben entscheidend sein. Hier, nimm diese Keule, sie wird dir gute Dienste leisten. Folge nun der Straße, Nargon Hammerfist erwartet dich. Gute Reise, %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, you are prepared to face the threats of the world. Now follow the road, Nargon Hammerfist expects you. Good travels, %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 6));
talkEntry:addResponse("Hurr, du bist nun auf die Gefahren der Welt vorbereitet. Folge nun der Straße, Nargon Hammerfist erwartet dich. Gute Reise, %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me grunzt freundlich: 'Ich zeige dir wie du kämpfst.'", "#me grunts while speaking: 'I will teach you how to fight.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("This is your tutorial guide Groknar the hunter.", "Das ist dein Tutor Groknar der Jäger.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache, indem du DAS UND DAS TUST.", "Please switch the language of your character to the common tongue by DOING THIS AND THAT.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 363);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 17);
mainNPC:setEquipment(6, 2642);
mainNPC:setEquipment(4, 0);
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