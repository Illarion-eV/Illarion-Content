--------------------------------------------------------------------------------
-- NPC Name: Nimbur Goldhand                                             None --
-- NPC Job:  Blacksmith                                                       --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  42, 83, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: July 02, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 42, 83, 100, 6, 'Nimbur Goldhand', 'npc.nimbur_goldhand', 0, 3, 1, 105, 105, 105, 205, 130, 70);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.nimbur_goldhand", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the Tutor Nimbur Goldhand. Keywords: Hello, help, skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Nimbur Goldhand. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
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
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Blacksmithing requires you to stand in front of an anvil and use the hammer which you have to hold in your hands. Chose the desired product from the appearing menu to start working."));
talkEntry:addResponse("Arr... right. Listen to me, I tell you all about blacksmithing you need to know. Here, have this hammer and these ingots. Move inside and don't dare to come back without three sets of pins!");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 10, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "<", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN.");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 10, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You are awarded an iron goblet."));
talkEntry:addResponse("Great! Ye' did it! I give you this cup as example of my work, show it everyone on the main land so I get some more customers. Viola Baywillow will help you to find a proper home for you on Illarion.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 3));
talkEntry:addConsequence(npc.base.consequence.item.item(223, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du erhältst einen Eisenkelch."));
talkEntry:addResponse("ÜBERSETZEN.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 3));
talkEntry:addConsequence(npc.base.consequence.item.item(223, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Without a hammer, you are not able to forge. Losing your hammer is the first step towards ending up on the rocks. Luckily for you, I have another one.");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "=", 0));
talkEntry:addResponse("ÜBERSETZEN.");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I see you used up all the iron ingots I gave you - quite a bad haul. I give you one more ingot but you have to promise me that you'll forge those three sets of pins right now.");
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "=", 0));
talkEntry:addResponse("ÜBERSETZEN.");
talkEntry:addConsequence(npc.base.consequence.item.item(2535, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Blacksmithing requires you to stand in front of an anvil and use the hammere which you have to hold in your hands. Chose the desired product from the appearing menu to start working."));
talkEntry:addResponse("Any problems with forging? Just slam the hammer on the hot metal until it gets the desired shape. I need three sets of pins from you, shouldn't be too difficult.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Very well, now I educated a competitor for my business - again. But true dwarven craft knows no competition! I can say you learned all that matters now; Viola Baywillow will help you to find a proper home for you on Illarion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 3));
talkEntry:addResponse("ÜBERSETZEN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("ÜBERSETZEN.", "Over here! I am Nimbur, the best blacksmith of them all and I can teach you some tricks.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("This is your tutorial guide Nimbur Goldhand the blacksmith.", "Das ist dein Tutor Nimbur Goldhand der Schmied.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache, indem du DAS UND DAS TUST.", "Please switch the language of your character to the common tongue by DOING THIS AND THAT.");
mainNPC:setEquipment(1, 356);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 23);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
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