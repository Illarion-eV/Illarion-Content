--------------------------------------------------------------------------------
-- NPC Name: Flori                                                       None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  883, 632, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Nanuk                                                            --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 883, 632, 0, 4, 'Flori', 'npc.flori', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.talk")
module("npc.flori", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
talkingNPC:addCycleText("Iiihhhh-aahhhh!", "Iiihhhh-aahhhh!");
talkingNPC:addCycleText("#me stampft störrisch auf.", "#me stubbornly stamps one foot.");
talkingNPC:addCycleText("#me zerrt am Halfter.", "#me tears at the headcollar.");
talkingNPC:addCycleText("#me versucht den Halbling zu beißen.", "#me tries to bite the halfling.");
talkingNPC:addCycleText("#me schüttelt seinen Kopf.", "#me tosses his head.");
talkingNPC:addCycleText("#me tritt mit den Hinterläufen aus.", "#me kicks with his hind legs.");
talkingNPC:addCycleText("#me bäumt sich auf.", "#me rears up.");
talkingNPC:addCycleText("#me lässt ein paar Eselsäpfel fallen.", "#me drops some mule droppings.");
talkingNPC:addCycleText("#me schlägt mit dem Schwanz nach ein paar Fliegen.", "#me wags his tail to get rid of some flies.");
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
