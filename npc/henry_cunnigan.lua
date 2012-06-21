--------------------------------------------------------------------------------
-- NPC Name: Henry Cunnigan                                              None --
-- NPC Job:  Tutor                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  37, 21, 100            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Estralis Seborian                                                --
--                                                                            --
-- Last parsing: June 21, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 37, 21, 100, 6, 'Henry Cunnigan', 'npc.henry_cunnigan', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.henry_cunnigan", package.seeall)

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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] This NPC is the Tutor Henry Cunnigan. Keywords: Hello, help, skip tutorial."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Dieser NPC ist der Tutor Henry Cunnigan. Schlüsselwörter: Hallo, Hilfe, Tutorial überspringen."));
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
talkEntry:addCondition(npc.base.condition.quest.quest(309, "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] To shout, please hit return to activate the chatbox. Do THIS AND THAT, type some words and hit return again to make your character shout the words."));
talkEntry:addResponse("Welcome to the Tutorial, %CHARNAME, my name is Henry Cunnigan, I am the harbourmaster. I will teach you how to communicate with NPCs and other characters. Now that you already know how to talk, I will show you how to shout. Please shout out for example your name!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "<", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#s");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Whispering works alike shouting, open your chatbox again and DO THIS AND THAT."));
talkEntry:addResponse("You have a strong voice! Shouting can be heard over quite some distance; sometimes, you don't want eardroppers to hear what you say. Please whisper some words for my ears only.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#s");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] To shout, please hit return to activate the chatbox. Do THIS AND THAT, type some words and hit return again to make your character shout the words."));
talkEntry:addResponse("You already know how to talk - shouting can help you to find your friends in lonely woods or dark dungeons. Please shout some words at will. Make your voice heard!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#w");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Emoting is done by doing THIS AND THAT."));
talkEntry:addResponse("Sometimes, silence is golden, I see you learned how to whisper. To show others the actions of your character you can do emotes. Emotes cannot affect the game world or other characters but are a good way to add some flavour to your roleplaying. Please emote an action!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#w");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Whispering works alike shouting, open your chatbox again and DO THIS AND THAT."));
talkEntry:addResponse("Not every townguard should hear about your dark plans - or the thugs should not hear you talking about your bank account. Please try to whisper once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Very good! You learned all the things I could teach you. Have fun with the Tutorial, %CHARNAME. Now follow the road to the next lesson on items.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("#me");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addResponse("ÜBERSETZEN");
talkEntry:addConsequence(npc.base.consequence.quest.quest(309, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] Emoting is done by doing THIS AND THAT."));
talkEntry:addResponse("Emoting is very important - it is the only way to show others actions that cannot be represented graphically. Please try to emote once more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Tutorial] ÜBERSETZEN."));
talkEntry:addResponse("ÜBERSETZEN");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You learned all the things I could teach you. Have fun with the Tutorial, %CHARNAME. Now follow the road to the next lesson on items.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(309, "=", 5));
talkEntry:addResponse("ÜBERSETZEN");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Kommt näher und sagt doch 'Hallo'.", "Come a little closer and say 'hello'.");
talkingNPC:addCycleText("ÜBERSETZEN", "Forgot how to move? Use the right mouse button, the arrow keys, the num pad or WASD.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("This is your tutorial guide Henry Cunnigan.", "Das ist dein Tutor Henry Cunnigan.");
mainNPC:setUseMessage("Finger weg!", "Do not touch me!");
mainNPC:setConfusedMessage("Bitte wechsle die Sprache deines Charakters zur Gemeinsprache, indem du DAS UND DAS TUST.", "Please switch the language of your character to the common tongue by DOING THIS AND THAT.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 366);
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