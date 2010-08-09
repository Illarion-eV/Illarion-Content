--------------------------------------------------------------------------------
-- NPC Name: Barney Haycrop                                              None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  -417, 44, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.quest")
require("npc.base.consequence.item")
require("npc.base.consequence.queststatus")
require("npc.base.talk")
module("npc.barney_haycrop", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addResponse("Ah, good day, and welcome to Greenbriar! Fine day for a nice smoke");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greetings");
talkEntry:addResponse("Ah, good day, and welcome to Greenbriar! Fine day for a nice smoke");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Who");
talkEntry:addResponse("Me name's Barney Haycrop, and its a pleasure to meet you");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("What");
talkEntry:addResponse("Well, I'm not doing anything really, just lazing about");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buy");
talkEntry:addResponse("Buying and selling sounds like too much hard work for me");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sell");
talkEntry:addResponse("Buying and selling sounds like too much hard work for me");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wares");
talkEntry:addResponse(" 'ave nothign to sell, my friend");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bye");
talkEntry:addResponse("Ahh, goodbye");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Locket");
talkEntry:addCondition(npc.base.condition.quest.quest(22, "=", 1));
talkEntry:addResponse("A locket you say... what a coincidence; I found one a few days ago... here, I trust you'll give it to the right owner");
talkEntry:addConsequence(npc.base.consequence.item.item(222, 1, 199, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(22, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me [german]", "#me inhales deeply from his pipe");
talkingNPC:addCycleText("#me [german]", "#me lazes about");
talkingNPC:addCycleText("#me [german]", "#me yawns lazily");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
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