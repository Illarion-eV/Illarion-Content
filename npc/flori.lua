--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--------------------------------------------------------------------------------
-- NPC Name: Flori                                                   Runewick --
-- NPC Job:  Beast of burden                                                  --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  883, 633, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Nanuk                                                            --
--           Estralis Seborian                                                --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 883, 633, 0, 4, 'Flori', 'npc.flori', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.talk")
module("npc.flori", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
talkingNPC:addCycleText("Muh!", "Moo!");
talkingNPC:addCycleText("Muh.", "Moo.");
talkingNPC:addCycleText("Muh?", "Moo?");
talkingNPC:addCycleText("#me stampft störrisch auf.", "#me stubbornly stamps one foot.");
talkingNPC:addCycleText("#me zerrt am Halfter.", "#me tears at the headcollar.");
talkingNPC:addCycleText("#me versucht den Halbling zu beißen.", "#me tries to bite the halfling.");
talkingNPC:addCycleText("#me schüttelt seinen Kopf.", "#me tosses his head.");
talkingNPC:addCycleText("#me tritt mit den Hinterläufen aus.", "#me kicks out with his hind legs.");
talkingNPC:addCycleText("#me hebt den Schwanz.", "#me deposits some droppings.");
talkingNPC:addCycleText("#me schlägt mit dem Schwanz nach ein paar Fliegen.", "#me wags his tail to get rid of some flies.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(6);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dies ist Flori, der eigensinnige Ochse.", "This is Flori, the stubborn ox.");
mainNPC:setUseMessage("Muh!", "Moo!");
mainNPC:setConfusedMessage("Muh?", "Moo?");
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