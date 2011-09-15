-- This is the test LUA NPC. This located at 15, 15, 33 and does nothing by
-- default. The script is fetched from /home/nitram/testnpc/npc_test.lua
-- This NPC is required to work correctly with the realtime NPC Update System

--dofile("../../../../../home/nitram/testnpc/npc_test.lua");

require("npc.base.basic")
require("npc.base.consequence.inform")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.test", package.seeall)

function initNpc()
debug("            *******INIT NPC START")
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cd");
talkEntry:addConsequence(npc.base.consequence.inform.inform("testing"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ab");
talkEntry:addResponse("yes, sire");

debug("            *******INIT NPC BEFORE WARP")
talkEntry:addConsequence(npc.base.consequence.warp.warp(10, 10, 0));
debug("            *******INIT NPC AFTER WARP")

talkingNPC:addTalkingEntry(talkEntry);
end;
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setAutoIntroduceMode(true);
debug("            *******INIT NPC END")
mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) 
debug("            *******RECEIVETEXT START")
mainNPC:receiveText(speaker, message); 
debug("            *******RECEIVETEXT END")
end;
function nextCycle() 
mainNPC:nextCycle(); 
end;

function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;