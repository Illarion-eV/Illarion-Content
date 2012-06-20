--------------------------------------------------------------------------------
-- NPC Name: Groknar                                                     None --
-- NPC Job:  herder                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  39, 43, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: June 20, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 39, 43, 100, 6, 'Groknar', 'npc.groknar', 0, 3, 0, 119, 28, 0, 84, 113, 46);
---]]

require("npc.base.basic")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.groknar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lektion wiederhohlen");
talkEntry:addResponse("Hurr, Fremder. Ich bin Maurince der Schweinehirte. Wenn du dich anderen Spielern vorstellen möchtest schreibe '#i' in die Sprachkonsole, Personen in deiner Nähe werden dann den Namen deines Helden über seinem Kopf lesen können.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 0));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Hurr, Fremder. Ich bin Maurince der Schweinehirte. Wenn du dich anderen Spielern vorstellen möchtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner Nähe werden dann den Namen deines Helden über seinem Kopf lesen können.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 0));
talkEntry:addResponse("Hurr, Fremder. Ich bin Maurince der Schweinehirte. Wenn du dich anderen Spielern vorstellen möchtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner Nähe werden dann den Namen deiner Heldin über ihrem Kopf lesen können.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#i.*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 1));
talkEntry:addResponse("Nun, du hast sicher eine Menge Abenteuer vor dir, %CHARNAME. Darum werde ich dir jetzt erklären wie du kämpfen kannst. Attackiere eines der Schweine indem du dies und das machst, keine Sorge Schweine währen sich in der Regel nicht.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 1));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Wenn du dich anderen Spielern vorstellen möchtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner Nähe werden dann den Namen deines Helden über seinem Kopf lesen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 1));
talkEntry:addResponse("Wenn du dich anderen Spielern vorstellen möchtest schreibe '#i und deinen Namen' in die Sprachkonsole, Personen in deiner Nähe werden dann den Namen deiner Heldin über ihrem Kopf lesen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 6));
talkEntry:addResponse("Folge nun weiter der Straße und sprich mit den Leuten auf deinem Weg. Gute weiterreise %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(314, "=", 1));
talkEntry:addResponse(" Folge nun weiter der Straße und sprich mit den Leuten auf deinem Weg. Gute weiterreise %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du erhältst eine schwere Holzkeule zur Belohnung."));
talkEntry:addResponse("Hurr, es ist gefährlich da draußen. Hier, nimm zur Sicherheit diese Keule mit. Folge nun weiter der Straße und sprich mit den Leuten auf deinem Weg. Gute weiterreise %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 555, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(314, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 4));
talkEntry:addResponse("Sehr schön. In zukünftigen Kämpfen wird die Zusammenstellung deiner Ausrüstung für dein Überleben entscheidend sein. So wie deine Erfahrung - Beispielsweise wirst du automatisch geschickter im Kampf mit Hiebwaffen wenn du ein Schwert schwingst.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=<", 3));
talkEntry:addResponse("Töte mindestens 2 Schweine. Greife Monster an indem du dies und das machst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me grunzt freundlich: 'Ich zeige dir wie du kämpfst.'", "#me grunts while speaking: 'I will teach you how to fight.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("This is your tutorial guide Groknar the pig herder.", "Das ist dein Tutor Groknar, der Schweinehirte.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Du musst schon in einer Sprache sprechen die ich verstehe. Entweder die gemeinsame oder die rassenspezifische Sprache.", "You have to talk to me in a language which I understand. Either the common or the racespecific language.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 0);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2664);
mainNPC:setEquipment(6, 392);
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