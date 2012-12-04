--------------------------------------------------------------------------------
-- NPC Name: Ruggero Bloom                                               None --
-- NPC Job:  pirate                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  6, 558, 0              --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 6, 558, 0, 0, 'Ruggero Bloom', 'npc.ruggero_bloom', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.state")
require("npc.base.consequence.attribute")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.ruggero_bloom", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me swings his fist into your stomach.'Do you have cheese beetween your ears? I don't want to see you again here!'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 5000));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me schlägt dir seine Faust in den Magen. 'Hast du Käse zwischen den Ohren? Ich will dich hier nicht mehr sehn!'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 5000));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me's face becomes red like a tomato and he gives you a proper beating.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "=", 1));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me läuft Rot an wie eine Tomate und verprügelt dich, wie's im Lehrbuch steht.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "=", 1));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addTrigger("zutritt");
talkEntry:addTrigger("pasire");
talkEntry:addTrigger("weg");
talkEntry:addTrigger("[oeö]fne");
talkEntry:addTrigger("Tabak");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(182, "body", "=>", 1, nil));
talkEntry:addTrigger("open");
talkEntry:addTrigger("way");
talkEntry:addTrigger("entrance");
talkEntry:addTrigger("pass");
talkEntry:addTrigger("tobacco");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addTrigger("zutritt");
talkEntry:addTrigger("pasire");
talkEntry:addTrigger("weg");
talkEntry:addTrigger("[oeö]fne");
talkEntry:addTrigger("Tabak");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(181, "body", "=>", 1, nil));
talkEntry:addTrigger("open");
talkEntry:addTrigger("way");
talkEntry:addTrigger("entrance");
talkEntry:addTrigger("pass");
talkEntry:addTrigger("tobacco");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addTrigger("zutritt");
talkEntry:addTrigger("pasire");
talkEntry:addTrigger("weg");
talkEntry:addTrigger("[oeö]fne");
talkEntry:addTrigger("Tabak");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(457, "body", "=>", 1, nil));
talkEntry:addTrigger("open");
talkEntry:addTrigger("way");
talkEntry:addTrigger("entrance");
talkEntry:addTrigger("pass");
talkEntry:addTrigger("tobacco");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addTrigger("zutritt");
talkEntry:addTrigger("pasire");
talkEntry:addTrigger("weg");
talkEntry:addTrigger("[oeö]fne");
talkEntry:addTrigger("Tabak");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(180, "body", "=>", 1, nil));
talkEntry:addTrigger("open");
talkEntry:addTrigger("way");
talkEntry:addTrigger("entrance");
talkEntry:addTrigger("pass");
talkEntry:addTrigger("tobacco");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addTrigger("zutritt");
talkEntry:addTrigger("pasire");
talkEntry:addTrigger("weg");
talkEntry:addTrigger("[oeö]fne");
talkEntry:addTrigger("Tabak");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, du darfst vorbei, Kumpel!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(356, "body", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(195, "body", "=>", 1, nil));
talkEntry:addTrigger("open");
talkEntry:addTrigger("way");
talkEntry:addTrigger("entrance");
talkEntry:addTrigger("pass");
talkEntry:addTrigger("tobacco");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("Aye, You may pass matee!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.warp.warp(6, 560, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zutritt");
talkEntry:addTrigger("pasire");
talkEntry:addTrigger("weg");
talkEntry:addTrigger("[oeö]fne");
talkEntry:addTrigger("Tabak");
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Welch ein ungemütlicher Geselle. Besser du nimmt dich in Acht."));
talkEntry:addResponse("Kein Zutritt, für Leute wie dich. Verschwinde oder ich spiel Trommel auf deinem Gesicht.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Welch ein ungemütlicher Geselle. Besser du nimmt dich in Acht."));
talkEntry:addResponse("Kein Zutritt, für Leute wie dich. Verschwinde oder ich spiel Trommel auf deinem Gesicht.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("problem");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Such a rude person. Be careful!"));
talkEntry:addResponse("No entrance for people like you. Get out or I will use your face as a drum.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("open");
talkEntry:addTrigger("way");
talkEntry:addTrigger("entrance");
talkEntry:addTrigger("pas");
talkEntry:addTrigger("tobacco");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Such a rude person. Be careful!"));
talkEntry:addResponse("No entrance for people like you. Get out or I will use your face as a drum.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
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
talkEntry:addResponse("Hey land lubber !");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Always fair winds and following seas, Jack.");
talkEntry:addResponse("Arr! Whats new?");
talkEntry:addResponse("Oi me matee! Ya wouldn' happen to 'ave a bottle o' rum on ya would yee?");
talkEntry:addResponse("Ahoy, me Hearties!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addResponse("Hey land lubber!");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Always fair winds and following seas, Jack.");
talkEntry:addResponse("Arr! Whats new?");
talkEntry:addResponse("Oi me matee! Ya wouldn' happen to 'ave a bottle o' rum on ya would yee?");
talkEntry:addResponse("Ahoy, me Hearties!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
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
talkEntry:addResponse("Ich bin Ruggero Bloom. Bei meinen wankenden Masten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Ruggero Bloom. Shiver me timbers!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
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
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Gut Wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Good wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Aye.");
talkEntry:addResponse("Gut Wind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("No strangers passing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Kein Fremder kommt an mir vorbei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addResponse("Aye Tobis Vunu ist'n guter Kumpel von mir! Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tobis");
talkEntry:addTrigger("Vunu");
talkEntry:addResponse("Aye Tobis Vunu is my matee! Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Piero");
talkEntry:addResponse("So ne Landratte! Wie ich se noch nie zuvor gesehn hab. Er ist Corporal von Cadomyr und versucht die Piratebay zu zerschlagen... seit Jahren. har-har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Piero");
talkEntry:addResponse("I never saw such a land lubber.. He's Corporal of Cadomyr and has been trying to bash the pirate bay for years. Har-har.");
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
talkEntry:addResponse("Help? I won't help you. Get out, Jack!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("murgo");
talkEntry:addResponse("Not even Murgo's here to save you land lubber! Get out!");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("murgo");
talkEntry:addResponse("Nich mal Murgo könnt dir hier helfen. Verschwinde!");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Are you bull headed or what? I told you to leave!");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Biste ein Esel oder wie? Ich hab gesagt du sollt verschwinden!");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("My fist... and your face will be friends soon, fool.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addResponse("Meine Faust und dein Gesicht, werden bald dicke Freunde, du Scherzbold.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I bash people who want to enter our tobacco fields. Are you willing to enter?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich verprügel Leute die zu unseren Tabakfeldern wollen. Willst du zu unseren Tabakfeldern?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich verprügel Leute die zu unseren Tabakfeldern wollen. Willst du zu unseren Tabakfeldern?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I bash people who want to enter our tobacco fields. Are you willing to enter?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Better not annoy me...seadog.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Besser ist's du gehst mir nich auf die Nerven.");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Listen... I won't talk to you. Get out of here, or I will shove my boot up your butt. Got it?");
talkEntry:addResponse("I won't tell you again. GET OUT!");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Hör zu... ich will nicht mit dir sprechen. Verschwinde hier, oder ich bohr dir meine Stiefel ins Hinterteil.");
talkEntry:addResponse("Ich sags nicht nochmal. VERSCHWINDE!");
talkEntry:addConsequence(npc.base.consequence.state.state("+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Aye. Wassimma.", "Aye. Whatevva.");
talkingNPC:addCycleText("#me lässt die seine Figner knacken.", "#me cracks his knuckles.");
talkingNPC:addCycleText("#me glotzt stur gerade aus, wie ein Stier.", "#me stares stubbornly straight ahead.");
talkingNPC:addCycleText("#me knirscht mit den Zähnen.", "#me gnashes his teeth");
talkingNPC:addCycleText("#me spuckt auf den Boden neben sich.", "#me spits on the ground next to him.");
talkingNPC:addCycleText("#me puhlt sich mit einem Dolch Essensreste aus den Zahnlücken.", "#me picks food from his teeth with a dagger.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Arr, das ist ein hässlicher wilder Pirat! Nimm dich in Acht!", "Arr, this seems like a ugly wild pirate! Be careful!");
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
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(9, 824);
mainNPC:setEquipment(10, 53);
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