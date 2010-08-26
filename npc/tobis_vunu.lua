--------------------------------------------------------------------------------
-- NPC Name: Tobis Vunu                                                  None --
-- NPC Job:  pirate                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  42, 517, 0             --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                          --
--                                                                            --
-- Last parsing: August 26, 2010                         easyNPC Parser v1.01 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 42, 517, 0, 4, 'Tobis Vunu', 'npc.tobis_vunu', 0, 1, 1, 155, 25, 6, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.queststatus")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.tobis_vunu", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu reicht dir ein Bündel Gewand und einen Schlapphut. Du sollst alles anziehen und das Tabakfeld suchen um es mit einer Fackel unbemerkt zu zerstören."));
talkEntry:addResponse("Aye. Piero schickt dich? Also gut, du ziehst jetzt dieses Zeug an. Nimmst eine Fackel und brennst das Tabakfeld der Piraten ab. Lass dich aber nicht dabei beobachten!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu reicht dir ein Bündel Gewand und einen Schlapphut. Du sollst alles anziehen und das Tabakfeld suchen um es mit einer Fackel unbemerkt zu zerstören."));
talkEntry:addResponse("Aye. Piero schickt dich? Also gut, du ziehst jetzt dieses Zeug an. Nimmst eine Fackel und brennst das Tabakfeld der Piraten ab. Lass dich aber nicht dabei beobachten!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu hands you a bunch cloth and a slouch hat. Dress up and sneak at the tobaccofield to burn it."));
talkEntry:addResponse("Aye. Piero sends you? Allright, get dressed with this stuff. Take the toarch and burn the pirates tabacco field. And do't let you catched, by doing it!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 2));
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
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu hands you a bunch cloth and a slouch hat. Dress up and sneak at the tobaccofield to burn it."));
talkEntry:addResponse("Aye. Piero sends you? Allright, get dressed with this stuff. Take the toarch and burn the pirates tabacco field. And do't let you catched, by doing it!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast ein paar Münzen bekommen. Frage nun nach der geheimen Bootschaft die zu Corpotal Piero gebracht werden soll."));
talkEntry:addResponse("#me hebt seinen Nase in die luft und schnupert, er grinst breit. 'Aye, das riecht nach Erfolg. U-und du bist immer noch lebendig. Gut gemacht! Hier hast du n'paar Münzen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast ein paar Münzen bekommen. Frage nun nach der geheimen Bootschaft die zu Corpotal Piero gebracht werden soll."));
talkEntry:addResponse("#me hebt seinen Nase in die luft und schnupert, er grinst breit. 'Aye, das riecht nach Erfolg. U-und du bist immer noch lebendig. Gut gemacht! Hier hast du n'paar Münzen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You earned some coins. Ask him about the secret information you shall deliver to Corporal Piero."));
talkEntry:addResponse("#me rises his nose and sniffles, he gives a broad grin. 'Aye, that smells like success. A-and you are still alive. Well done. Here's a coin for you. ");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 4));
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
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You earned some coins. Ask him about the secret information you shall deliver to Corporal Piero."));
talkEntry:addResponse("#me rises his nose and sniffles, he gives a broad grin. 'Aye, that smells like success. A-and you are still alive. Well done. Here's a coin for you. ");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 5));
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
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
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
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld un brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1));
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down qith the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du solltest am Besten ein Hemd anziehen und einen Schlapphut aufsetzen."));
talkEntry:addResponse("Arr, wenn du das Zeug nich anziehst, wird dich die Wache nicht durchlassen. Wir Piratn tragn nunmal Hemden. Den Hut musst nur du tragen, damit sie nich sehn wie hässlich du bist. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du solltest am Besten ein Hemd anziehen und einen Schlapphut aufsetzen."));
talkEntry:addResponse("Arr, wenn du das Zeug nich anziehst, wird dich die Wache nicht durchlassen. Wir Piratn tragn nunmal Hemden. Den Hut musst nur du tragen, damit sie nich sehn wie hässlich du bist. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You should dress yourself with a shirt and a slouch hat."));
talkEntry:addResponse("Arr, when not wearing the stuff, the guard won't let you pass. We pirates wearing shirts as usual. The hat you got is just they don't see how ugly you are. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You should dress yourself with a shirt and a slouch hat."));
talkEntry:addResponse("Arr, when not wearing the stuff, the guard won't let you pass. We pirates wearing shirts as usual. The hat you got is just they don't see how ugly you are. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Nimm dir 'n Messer und entführ ne Jungfrau! Arr. Und dann steckst du sie dir an den Ort wo die Sonne nich scheint! Verschwinde du Landratte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nimm dir 'n Messer und entführ ne Jungfrau! Arr. Und dann steckst du sie dir an den Ort wo die Sonne nich scheint! Verschwinde du Landratte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Take a Knife and take a Virgins as hostage! Arr. And then you put her at the place where the sun never shines! Get rid, Lubber.");
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
talkEntry:addResponse("Take a Knife and take a Virgins as hostage! Arr. And then you put her at the place where the sun never shines! Get rid, Lubber.");
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
talkEntry:addResponse("Hej Landratte!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Mast- und Schotbruch, Matrose!");
talkEntry:addResponse("Arr! Was gibt's?");
talkEntry:addResponse("Ahoi!");
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
talkEntry:addResponse("Hej lubber!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Always fair winds and following seas, Jack.");
talkEntry:addResponse("Arr! Whats new?");
talkEntry:addResponse("Oi me matee! Ya wouldn' happen to 'ave a bottle o' rum on ya would yee?");
talkEntry:addResponse("Ahoy, me Hearties!");
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
talkEntry:addResponse("Hej lubber!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Always fair winds and following seas, Jack.");
talkEntry:addResponse("Arr! Whats new?");
talkEntry:addResponse("Oi me matee! Ya wouldn' happen to 'ave a bottle o' rum on ya would yee?");
talkEntry:addResponse("Ahoy, me Hearties!");
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
talkEntry:addResponse("Hej Landratte!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Mast- und Schotbruch, Matrose!");
talkEntry:addResponse("Arr! Was gibt's?");
talkEntry:addResponse("Ahoi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin %NPCNAME. Bei meinen wankenden Masten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am %NPCNAME. Siver me timbers!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewel");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Don't get biten by seedogs!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Good wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Lass dich nich von Seehunden beissn!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Gut Wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don't get biten by seedogs!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Good wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Lass dich nich von Seehunden beissn!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Gut Wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm good matee! The winds fair and my bottle is filled. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir geht's gut, Kumpel. Die Winde sind gut und die Flasche is voll. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Ace name, matee!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Spitzen Name, Kumpel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Helfen? Ich werd dir nich helfen. Verschwinde Leichtmatrose!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Helfen? ich werd dir nich helfen. Verschwinde Leichtmatrose!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Help? I won't help you.  Get rid, Jack!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Also under the flags of us pirates is the orc Murgo well known. They say he is able to rip a tree out of the ground with his bare hands!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Auch unter den Falggen von uns Piraten ist der Ork Murgo bestens bekannt. Man sagt, er könne einen Baum mit sienen bloßen Händen entwurzeln!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Har, Har! I'm a pirate! I don't BUY stuff! I take it! Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Har, Har! Ich bin n' Piart! Ich KAUFE kein Zeug! Ich nehms mir einfach, klar?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Once, when we shipped over the sea I saw a ...you never guess what... a mermaid! Honestly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Einmal..als wir über die See reisten sah ich... ihr werdets nich glauben... ne Meerjungfrau! Ehrlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a scary Pirate! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin n' gefährlicher Pirat! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich bin n' gefährlicher Pirat! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm a scary Pirate! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, I went there for a loot trip, once. But I don't think there's a ship sealing there, this days.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye, ich war dort mal auf Beutezug. Aber ich denke nicht das heutzutage da noch Schiffe hinsegeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elvaine Morgan isn't that the name of this renegade Mage comming from Lor Angur? He's kind of chief in Runewick now, it seems to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Elvaine Morgan ist das nicht dieser abtrünnige Magier aus Lor Angur? Der scheint jetzt der große Häuptling in Runewick zu sein, wenn du mich fragst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ye, ye! In Runewick are a lot of clever people. Or they think they are. A pirate have a hard stand there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Jaja! In Runewick gibts viele kluge Leute. Oder zumindest halten sie sich dafür. Als Pirat hat man's dort nicht leicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Do you know... there are people better not annoyed. Don Valerio Guilianni is one of those.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wiesst du.. es gibt Leute mit denen sollte man sich nicht anlegen. Don Valerio Guilianni ist wohl genau so jemand wenn du mich fragst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair would be a nice place indeed, when ignored all the churlish dwarves there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Galmair wäre ja ein nettes Plätzchen. Wäre es dort bloß nicht voller knausriger Zwerge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The guard of queen Rosaline makes it hard to live our pirate-life. But we'll Kkep our tails up!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Wache von Königin Rosaline macht uns das Piratenleben schwer. Aber wir lassen uns nicht unterkriegen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald");
talkEntry:addTrigger("king");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh... good old King Reginald. I'm sad he's dead now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald");
talkEntry:addTrigger("king");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh... guter alter König Reginald. Schade das er jetzt tot ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Her's not Cadomyr! Her's the pirate bay! Here we follow our own code! As long as the seadogs don't bite us!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das hier ist nicht Cadomyr! Hier ist die Piratebay! Hier haben wir unseren eigenen Codex! Solang uns die Seehunde nich beissn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me säuselt leise ein Lied. '...und ne Buddel voll Rum!'", "#me sings a quit song. '... and a bottle with rum!'");
talkingNPC:addCycleText("#me zieht sein Säbel und hält es prüfend gegen das Licht.", "#me takes his sabre and examines it with narrowed eyes.");
talkingNPC:addCycleText("Aye. Wassimma.", "Aye. Whatevva.");
talkingNPC:addCycleText("Wassa in die Stiefl und ne Kette um den Hals. Arr.", "Whater in the boots and chained nack. Arr.");
talkingNPC:addCycleText("#me reibt seine rauen Hände an einander.", "#me rubs his rude hands together.");
talkingNPC:addCycleText("#me kaut auf einem schwarzen Kraut herum.", "#me chews a black haulm.");
talkingNPC:addCycleText("Alles klar zum kentern? Aye!", "Ready to capsizal? Aye!");
talkingNPC:addCycleText("Auf der See... da steht man sein' Mann. Oder ersäuft!", "At the sea you have to stand your man, or got drown.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Arr, das ist ein gestandener wilder Pirat! Nimm dich in Acht!", "Arr, thiss seems like a ugly wild pirate! Take care.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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