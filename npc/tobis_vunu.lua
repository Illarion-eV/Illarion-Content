--------------------------------------------------------------------------------
-- NPC Name: Tobis Vunu                                                  None --
-- NPC Job:  pirate                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  42, 517, 0             --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: October 18, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 42, 517, 0, 4, 'Tobis Vunu', 'npc.tobis_vunu', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.tobis_vunu", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Tobis Vunu the pirate. Keywords: Adventure, Gods."));
talkEntry:addResponse("Help? I won't help you. Get rid, Jack!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Tobis Vunu der Pirat. Schlüsselwörter: Abenteuer, Götter."));
talkEntry:addResponse("Helfen? Ich werd dir nich helfen. Verschwinde, Leichtmatrose!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu reicht dir ein Bündel Gewand und einen Schlapphut. Du sollst alles anziehen und das Tabakfeld suchen um es mit einer Fackel unbemerkt zu zerstören."));
talkEntry:addResponse("Aye. Piero schickt dich? Also gut, du ziehst jetzt dieses Zeug an. Nimmst eine Fackel und brennst das Tabakfeld der Piraten ab. Lass dich aber nicht dabei beobachten!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu reicht dir ein Bündel Gewand und einen Schlapphut. Du sollst alles anziehen und das Tabakfeld suchen um es mit einer Fackel unbemerkt zu zerstören."));
talkEntry:addResponse("Aye. Piero schickt dich? Also gut, du ziehst jetzt dieses Zeug an. Nimmst eine Fackel und brennst das Tabakfeld der Piraten ab. Lass dich aber nicht dabei beobachten!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu hands you a bunch cloth and a slouch hat. Dress up and sneak at the tobaccofield to burn it."));
talkEntry:addResponse("Aye. Piero sends you? Allright, get dressed with this stuff. Take the toarch and burn the pirates tabacco field. And do't let you catched, by doing it!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 1));
talkEntry:addTrigger("Mesage");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Tobis Vunu hands you a bunch cloth and a slouch hat. Dress up and sneak at the tobaccofield to burn it."));
talkEntry:addResponse("Aye. Piero sends you? Allright, get dressed with this stuff. Take the toarch and burn the pirates tabacco field. And do't let you catched, by doing it!");
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(180, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(181, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 550, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast ein paar Münzen bekommen. Frage nun nach der geheimen Bootschaft die zu Corpotal Piero gebracht werden soll."));
talkEntry:addResponse("#me hebt seine Nase in die Luft und schnuppert, er grinst breit. 'Aye, das riecht nach Erfolg. U-und du bist immer noch lebendig. Gut gemacht! Hier hast du n'paar Münzen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast ein paar Münzen bekommen. Frage nun nach der geheimen Bootschaft die zu Corpotal Piero gebracht werden soll."));
talkEntry:addResponse("#me hebt seine Nase in die Luft und schnuppert, er grinst breit. 'Aye, das riecht nach Erfolg. U-und du bist immer noch lebendig. Gut gemacht! Hier hast du n'paar Münzen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You earned some coins. Ask him about the secret information you shall deliver to Corporal Piero."));
talkEntry:addResponse("#me rises his nose and sniffles, he gives a broad grin. 'Aye, that smells like success. A-and you are still alive. Well done. Here's a coin for you. ");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 3));
talkEntry:addTrigger("Mesage");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You earned some coins. Ask him about the secret information you shall deliver to Corporal Piero."));
talkEntry:addResponse("#me rises his nose and sniffles, he gives a broad grin. 'Aye, that smells like success. A-and you are still alive. Well done. Here's a coin for you. ");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 230));
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-Feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-Feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 4));
talkEntry:addTrigger("Mesage");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(305, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Oh ja, sicherlich. Bitte berichte Corporal Piero, die Piraten sind ziemlich sauer. Jemand hat ihr Tabak-feld zerstört. *Er lacht amüsiert auf.* Nun müssen wir mit einem Racheakt rechnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Coporal");
talkEntry:addTrigger("Piero");
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 5));
talkEntry:addTrigger("Mesage");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Oh, yes, for sure. Please tell Corporal Piero the pirates are really pissed. Cause their tobacco field got destroyed. *He gives an amused laughter.* We have to await revenge now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye. Jetzt siehste aus wie N' Pirat! Geh rüber zum Tabakfeld und brenn es mit ner Fackel ab. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, now you'r looking like a pirate! Make you way to the tobacco field and burn it down with the toarch. Aye?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du solltest am besten ein Hemd anziehen und einen Schlapphut aufsetzen."));
talkEntry:addResponse("Arr, wenn du das Zeug nich anziehst, wird dich die Wache nicht durchlassen. Wir Piratn tragn nunmal Hemden. Den Hut musst nur du tragen, damit sie nich sehn wie hässlich du bist. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du solltest am besten ein Hemd anziehen und einen Schlapphut aufsetzen."));
talkEntry:addResponse("Arr, wenn du das Zeug nich anziehst, wird dich die Wache nicht durchlassen. Wir Piratn tragn nunmal Hemden. Den Hut musst nur du tragen, damit sie nich sehn wie hässlich du bist. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You should dress yourself with a shirt and a slouch hat."));
talkEntry:addResponse("Arr, when not wearing the stuff, the guard won't let you pass. We pirates wearing shirts as usual. The hat you got is just they don't see how ugly you are. Har-har!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(305, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Nimm dir 'n Messer und entführ ne Jungfrau! Arr. Und dann steckst du sie dir an den Ort wo die Sonne nich scheint! Verschwinde du Landratte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Take a Knife and take a Virgins as hostage! Arr. And then you put her at the place where the sun never shines! Get rid, Lubber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Message");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Take a knife and take a virgin as hostage! Arr. And then you put her at the place where the sun never shines! Get rid, Lubber.");
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
talkEntry:addResponse("Hej Landratte!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Mast- und Schotbruch, Matrose!");
talkEntry:addResponse("Arr! Was gibt's?");
talkEntry:addResponse("Ahoi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
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
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hej Landratte!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Mast- und Schotbruch, Matrose!");
talkEntry:addResponse("Arr! Was gibt's?");
talkEntry:addResponse("Ahoi!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
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
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lass dich nich von Seehunden beissn!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Gut Wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Don't get biten by seedogs!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Good wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
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
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht's gut, Kumpel. Die Winde sind gut und die Flasche is voll. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Tobis Vunu. Siver me timbers!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Tobis Vunu. Bei meinen wankenden Masten!");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a scary Pirate! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin n' gefährlicher Pirat! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Pirat");
talkEntry:addResponse("Hey - pirates ho! Ho-h! We're mean guys, ho!");
talkEntry:addResponse("Arr! We're robbing an' invade an' slitting an' ... uh robbin'! Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Reginald");
talkEntry:addTrigger("king");
talkEntry:addResponse("Oh... good old King Reginald. I'm sad he's dead now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Reginald");
talkEntry:addTrigger("king");
talkEntry:addResponse("Oh... guter alter König Reginald. Schade, dass er jetzt tot ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Piero");
talkEntry:addResponse("Ich kenne keinen Piero.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Piero");
talkEntry:addResponse("I don't know any Pieros.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("ruggero");
talkEntry:addTrigger("bloom");
talkEntry:addResponse("Aye, Ruggero ist ein guter Kumpel von mir. Leg dich lieber nicht mit ihm an, er ist leicht reizbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ruggero");
talkEntry:addTrigger("bloom");
talkEntry:addResponse("Aye Ruggero is my matee! Don't annoy him, he's kind of bullsish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pirat");
talkEntry:addResponse("Hey - Pirat'n ho! Ho-h! Wir sin' üble Kerle, ho!");
talkEntry:addResponse("Arr! Wirr raub'n und entern und schlitzn und ... äh raubn! Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("murgo");
talkEntry:addResponse("Also under the flags of us pirates is the orc Murgo well known. They say he is able to rip a tree out of the ground with his bare hands!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("murgo");
talkEntry:addResponse("Auch unter den Falggen von uns Piraten ist der Ork Murgo bestens bekannt. Man sagt, er könne einen Baum mit seinen bloßen Händen entwurzeln!");
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
talkEntry:addResponse("Once, when we shipped over the sea I saw a... you never guess what... a mermaid! Honestly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Einmal... als wir über die See reisten sah ich... ihr werdets nich glauben... ne Meerjungfrau! Ehrlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("There matee's who don't care about the gods at all. Idiots I say - Tanora an' Ronagan may save my live when our ship get's in trouble. Aye.");
talkEntry:addResponse("There matee's who don't care about the gods at all. Idiots I say - Adron shall save all the rum and Nargun shall make me a rich man! Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("S' gibt Kumpel die kümmern sich nich um die Götter - Allesamt Idioten. Tanora und Ronagan soll'n mir helfn wenn's Ärger am Schiff gibt. Aye.");
talkEntry:addResponse("S' gibt Kumpel die kümmern sich nich um die Götter - Allesamt Idioten. Adron schütze unsre Fässer mit Rum und Nargun mög' für sorgen daß ich einmal n' reicher Mann werd! Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron may save all the rum. Arr. Hail Adron, praise to the rum - I say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron schütze die Rum-fässer. Arr. Heil Adron, ein Loblied dem Rum sag ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Nargun is Chaos. He makes a man rich one day - the other he's poor again. Chance of fifty-fifty. I take the risk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Nargun ist Chaos. Heute biste ein reicher Mann, morgen arm. Iss ne Chanche von fünfzig zu fünfzig - ich geh's Risiko ein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan respects our Pirate Code. Aye. Therefore it's good to offer his altair some coins now and again. Eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan respektiert unsren Codex. Den Piratn-Codex. Aye. Also hinterlass ich ihm immer wieder mal'n paar Münzen am Altar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("All Sailor's praise Tanora. Aye. She'S goddes of wather and sea. You don't want her angry when shipping with a nutshell over the migthy sea.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Alle Seeleute beten zu Tanora. Aye. Sie's die Göttin des Meeres - du will's sie nich verärgern wenn du mit ner Nußschale über'n Ozean schipperst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Elvaine Morgan isn't that the name of this renegade Mage comming from Lor Angur? He's kind of chief in Runewick now, it seems to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Elvaine Morgan ist das nicht dieser abtrünnige Magier aus Lor Angur? Der scheint jetzt der große Häuptling in Runewick zu sein, wenn du mich fragst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine Morgan isn't that the name of this renegade Mage comming from Lor Angur? He's kind of chief in Runewick now, it seems to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine Morgan ist das nicht dieser abtrünnige Magier aus Lor Angur? Der scheint jetzt der große Häuptling in Runewick zu sein, wenn du mich fragst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ye, ye! In Runewick are a lot of clever people. Or they think they are. A pirate have a hard stand there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Jaja! In Runewick gibts viele kluge Leute. Oder zumindest halten sie sich dafür. Als Pirat hat man's dort nicht leicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Do you know... there are people better not annoyed. Don Valerio Guilianni is one of those.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Weißt du.. es gibt Leute mit denen sollte man sich nicht anlegen. Don Valerio Guilianni ist wohl genauso jemand, wenn du mich fragst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair would be a nice place indeed, when ignored all the churlish dwarves there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair wäre ja ein nettes Plätzchen. Wäre es dort bloß nicht voller knausriger Zwerge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The guard of queen Rosaline makes it hard to live our pirate-life. But we'll Kkep our tails up!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die Wache von Königin Rosaline macht uns das Piratenleben schwer. Aber wir lassen uns nicht unterkriegen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("The guard of queen Rosaline makes it hard to live our pirate-life. But we'll Kkep our tails up!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Wache von Königin Rosaline macht uns das Piratenleben schwer. Aber wir lassen uns nicht unterkriegen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Her's not Cadomyr! Her's the pirate bay! Here we follow our own code! As long as the seadogs don't bite us!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Das hier ist nicht Cadomyr! Hier ist die Piratebay! Hier haben wir unseren eigenen Codex! Solang uns die Seehunde nich beissn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Once I knew a guy from Albar... dirty swine. He choped of the hand of a friend. Aye. Damn Albarian.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Arr. Ich kannte Mal nen Typn aus Albar... Dreckskerl. Hat'n Freund von mir die Hand abgehackt. Aye. Verdammter Albarer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I know many people comming from Gynk. You can't trust them. - Well that remainds me my mother was Gynkese as well... thie-hie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich kenn viele Leute aus Gynk. Denen kannste nich vertraun. - Da fällt mir ein 'ch bin selber einer... hähähä.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Weirdos... Salkamarians are weirdos. They are crazy, if you count on my opinion. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Die Salkamarer sin' allesamt Spinner, sag ich dir. Verückt sin se. Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Aye, I went there for a loot trip, once. But I don't think there's a ship sealing there, this days.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Aye, ich war dort mal auf Beutezug. Aber ich denke nicht das heutzutage da noch Schiffe hinsegeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Ace name, matee!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Spitzen Name, Kumpel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addResponse("Aye - that's me! What's up matee?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addResponse("Aye - 's bin ich. Was gibt's Kumpel?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Shiver me timbers, matee!");
talkEntry:addResponse("Well. - Eh you got a bottle of rum?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Bei meinen wankenden Masten, Kumpel!");
talkEntry:addResponse("Gut. - Eh, du hass nich ne Flasche Rum übrich oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Nevermind.");
talkEntry:addResponse("Of Course.");
talkEntry:addResponse("Arr-h!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Vergiss, dass ich was gesagt hab.");
talkEntry:addResponse("Selbstverständlich.");
talkEntry:addResponse("Arr-h!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("We're drinking rum all night long.- Ho! Ho! Ho! The waves are high, the wind is strong.- Ho! Ho! Ho!");
talkEntry:addResponse("We are the lords of the sea. - Ho! Ho! Ho! Drink rum and beer, but never tea.- Ho! Ho! Ho!");
talkEntry:addResponse("Thirteen men on a dead man´s chest! - Ho! Ho! Ho! Every man has got the pest! - Ho! Ho! Ho!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Dreizehn Mann saßen auf einem Sarg, Ho! Ho! Ho! -  Sie soffen drei Tage, der Schnaps war stark. - Ho! Ho! Ho!");
talkEntry:addResponse("Sie liebten das Meer und den Schnaps und das Gold. Ho! Ho! Ho! -  Bis einst alle dreizehn n' Dämon holt. - Ho! Ho! Ho!");
talkEntry:addResponse("Wir sind die Herrn der See. - Ho! Ho! Ho! Drinken Rum und Bier, aber niemals Tee! Ho! Ho! Ho!");
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
mainNPC:setLookat("Arr, das ist ein hässlicher wilder Pirat! Nimm dich in Acht!", "Arr, thiss seems like a ugly wild pirate! Take care.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(5, 2728);
mainNPC:setEquipment(6, 2445);
mainNPC:setEquipment(9, 2194);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END