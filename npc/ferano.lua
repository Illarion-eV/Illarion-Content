--------------------------------------------------------------------------------
-- NPC Name: Ferano                                                      None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: elf                        NPC Position:  -10, -12, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.item")
require("npc.base.consequence.queststatus")
require("npc.base.talk")
module("npc.ferano", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 0));
talkEntry:addResponse("Seid gegrüßt Reisender");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(558, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kann ich euch helfen");
talkEntry:addTrigger("Was macht ihr hier");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 1));
talkEntry:addResponse("Ich such jemanden der mir einen Molotov-Cocktail bringt,ich brauch ihn für meine Forschungen,wollt ihr mirhelfen?");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(558, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("Wirklich, vielen Dank ich werde euch dafür auch Entlohnen.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 2));
talkEntry:addResponse("Schade, dennoch Danke");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(558, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Molotov-Cocktail");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2502, "all", "=>", 1));
talkEntry:addResponse("Oh, Vielen Dank hier ist eure Belohnung");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2502, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(3077, 3, 333, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(558, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eisenbarren");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2502, "all", "<", 1));
talkEntry:addResponse("Ihr habt doch garkein Molotov-Cocktail dabei,kommt wieder wenn ihr einen habt!");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(558, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addCondition(npc.base.condition.quest.quest(558, "=", 4));
talkEntry:addResponse("Hallo, schön euch wiederzusehen %CHARNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me sieht sich um", "#me looks around");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
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