--------------------------------------------------------------------------------
-- NPC Name: Nimbur Goldhand                                             None --
-- NPC Job:  Blacksmith                                                       --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  42, 83, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: June 26, 2012                           easyNPC Parser v1.02 --
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] In order to mine, stand in front of a rock and use (double click) the pick-axe which you have to hold in your hands. Note that not every rock yields coal."));
talkEntry:addResponse("Arr, the name is Nargon, Nargon Hammerfist. Only by hard labour you can become wealthy and I can show you hard labour! Here, have this pick-axe. Head for the mine and gather five lumps of coal for me. It won't be in vain!");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 599, 0));
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
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] You are awarded a ruby."));
talkEntry:addResponse("Oi! You did it, thanks for the coal. As a fair dwarven tradesman, I give you this ruby in exchange. My kinsmate Nimbur down at the brick house can teach you another lesson about dwarven craft.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 5));
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Du erhältst einen Rubin."));
talkEntry:addResponse("ÜBERSETZEN.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 5));
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(313, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 2));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What! You lost your pick-axe? How do you want to become rich if you keep losing your belongings? Have this replacement; now off to the mines!");
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
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What! You lost your pick-axe? How do you want to become rich if you keep losing your belongings? Have this replacement; now off to the mines!");
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
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] In order to mine, stand in front of a rock and use (double click) the pick-axe which you have to hold in your hands. Note that not every rock yields coal."));
talkEntry:addResponse("Well, well, well. Hard labour means that you have to work hard. Please bring me at least five lumps of coal. If you cannot find coal in one corner of the mine, try the other!");
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
talkEntry:addResponse("Arr, now you can mine for gems and gold. What else is there to learn!? You might become rich, aye. My kinsmate Nimbur down at the brick house can teach you another lesson about dwarven craft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(313, "=", 3));
talkEntry:addResponse("ÜBERSETZEN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht sich durch seinen langen Bart: 'Arr, ich zeige dir wie du Rohstoffe schürfst.'", "#me scratches his beard: 'Arr...! I will show you how to gather resources.'");
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