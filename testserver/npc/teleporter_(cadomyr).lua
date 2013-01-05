--------------------------------------------------------------------------------
-- NPC Name: Teleporter (Cadomyr)                                     Cadomyr --
-- NPC Job:  Teleporter                                                       --
--                                                                            --
-- NPC Race: human                      NPC Position:  127, 647, 0            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 127, 647, 0, 0, 'Teleporter (Cadomyr)', 'npc.teleporter_(cadomyr)', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.consequence.inform")
require("npc.base.consequence.money")
require("npc.base.consequence.warp")
require("npc.base.talk")
module("npc.teleporter_(cadomyr)", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This is the teleporter of Cadomyr. A journey costs ten silver coins. Destinations: Runewick, Galmair, Wilderland."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dies ist der Teleporter Cadomyrs. Die Reise kostet zehn Silberstücke. Ziele: Runewick, Galmair, Wilderland."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] You are already in Cadomyr."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Ihr seid bereits in Cadomyr."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 1000));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addTrigger("Galmair");
talkEntry:addTrigger("Wilderland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] You don't have enough money for this journey. The journey costs ten silver coins."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("<", 1000));
talkEntry:addTrigger("Runewick");
talkEntry:addTrigger("Galmair");
talkEntry:addTrigger("Wilderland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Ihr habt nicht genug Geld für diese Reise. Die Reise kostet zehn Silberstücke."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] You make the teleporter open a portal to Runewick at a cost of ten silver pieces."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000));
talkEntry:addConsequence(npc.base.consequence.warp.warp(788, 826, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Ihr lasst den Teleporter ein Tor nach Runewick zu einem Preis von zehn Silberstücken öffnen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000));
talkEntry:addConsequence(npc.base.consequence.warp.warp(788, 826, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] You make the teleporter open a portal to Galmair at a cost of ten silver pieces."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000));
talkEntry:addConsequence(npc.base.consequence.warp.warp(424, 246, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Ihr lasst den Teleporter ein Tor nach Galmair zu einem Preis von zehn Silberstücken öffnen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000));
talkEntry:addConsequence(npc.base.consequence.warp.warp(424, 246, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Wilderland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] You make the teleporter open a portal to Wilderland at a cost of ten silver pieces."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000));
talkEntry:addConsequence(npc.base.consequence.warp.warp(684, 307, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wilderland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Ihr lasst den Teleporter ein Tor nach Wilderland zu einem Preis zehn Silberstücken öffnen."));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 1000));
talkEntry:addConsequence(npc.base.consequence.warp.warp(684, 307, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Say the name of the realm you want to travel to: Runewick, Galmair, Wilderland."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Teleporter] Sagt den Namen der Gegend, in die ihr reisen möchtet: Runewick, Galmair, Wilderland."));
talkingNPC:addTalkingEntry(talkEntry);
end;
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:addLanguage(2);
mainNPC:addLanguage(3);
mainNPC:addLanguage(4);
mainNPC:addLanguage(5);
mainNPC:addLanguage(6);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("[Teleporter] Sagt den Namen der Gegend, in die ihr reisen möchtet: Runewick, Galmair, Wilderland.", "[Teleporter] Say the name of the realm you want to travel to: Runewick, Galmair, Wilderland.");
mainNPC:setUseMessage("[Teleporter] Sagt den Namen der Gegend, in die ihr reisen möchtet: Runewick, Galmair, Wilderland.", "[Teleporter] Say the name of the realm you want to travel to: Runewick, Galmair, Wilderland.");
mainNPC:setConfusedMessage("[Teleporter] Sagt den Namen der Gegend, in die ihr reisen möchtet: Runewick, Galmair, Wilderland.", "[Teleporter] Say the name of the realm you want to travel to: Runewick, Galmair, Wilderland.");
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