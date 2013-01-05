--------------------------------------------------------------------------------
-- NPC Name: Groknar                                                     None --
-- NPC Job:  hunter                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  41, 44, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
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
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the tutor Groknar. Keywords: Hello, Help, Skip tutorial."));
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You have decided to skip the tutorial. Please choose a realm to be the home for your character by stepping through the corresponding portal on one of the three islands to the south."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(36, 94, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("überspring");
talkEntry:addTrigger("abbrech");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du hast entschieden, das Tutorial zu überspringen. Bitte wähle ein Reich als Heimat deines Charakters aus, indem du durch das entsprechende Portal auf einer der drei Inseln im Süden trittst."));
talkEntry:addConsequence(npc.base.consequence.warp.warp(36, 94, 100));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You can attack other creatures by clicking them once with the right mouse button."));
talkEntry:addResponse("Hurr! Fresh meat! I be Groknar, mightiest hunter of my clan. I will teach you how to smash puny creatures. Choose a weapon and crush three of those pigs over there.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 2));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du kannst andere Kreaturen angreifen, indem du sie mit der rechten Maustaste einmal anklickst."));
talkEntry:addResponse("Hurr! Frischfleisch! Ich bin Groknar, der mächtigste Jäger meines Clans. Ich bring dir bei, erbärmliche Kreaturen zu erschlagen. Nimm eine Waffe deiner Wahl in die Hand und erschlage drei dieser Schweine dort drüben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You can attack other creatures by clicking them once with the right mouse button."));
talkEntry:addResponse("Hurr, you afraid of those puny pigs? Off! Kill at least three of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "<", 5));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du kannst andere Kreaturen angreifen, indem du sie mit der rechten Maustaste einmal anklickst."));
talkEntry:addResponse("Hurr, hast du Angst vor diesen erbärmlichen Schweinen? Geh! Töte mindestens drei von ihnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You are awarded a club."));
talkEntry:addResponse("Good. You might just survive out there. Here, take this club. It will crush good. Follow the road, Hammerfist is expecting you. Good travels, %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 5));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du erhältst eine Keule."));
talkEntry:addResponse("Gut. Vielleicht wirst du da draußen nun überleben. Hier, nimm diese Keule, sie wird dir gute Dienste leisten. Folge nun der Straße, Nargon Hammerfist erwartet dich. Gute Reise, %CHARNAME!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(311, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hurr, you are prepared to face the threats of this world. Follow the road, Nargon Hammerfist is expecting you. Good travels, %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(311, "=", 6));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hurr, du bist nun auf die Gefahren der Welt vorbereitet. Folge nun der Straße, Nargon Hammerfist erwartet dich. Gute Reise, %CHARNAME!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me grunzt während er sagt: 'Ich zeige dir, wie man wie ein richtiger Krieger kämpft.'", "#me grunts while speaking: 'I will teach you how to fight like a true warrior.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist dein Tutor Groknar der Jäger.", "This is your tutorial guide Groknar the hunter.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache mit dem Befehl '!l common'.", "Please switch the language of your character to the common tongue with the command '!l common'.");
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

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END