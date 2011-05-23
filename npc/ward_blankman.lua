--------------------------------------------------------------------------------
-- NPC Name: Ward Blankman                                               None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  68, 62, 100            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 68, 62, 100, 4, 'Ward Blankman', 'npc.ward_blankman', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.talk")
module("npc.ward_blankman", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greet");
talkEntry:addTrigger("hello");
talkEntry:addResponse("Greetings to you. My name is %NPCNAME. I'm guarding the undead right there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üu][sß]");
talkEntry:addTrigger("grue[sß]");
talkEntry:addTrigger("hallo");
talkEntry:addResponse("Grüß' dich. Mein Name ist %NPCNAME. Ich bewache die Untoten dort drüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addTrigger("farewell");
talkEntry:addTrigger("be well");
talkEntry:addResponse("Be well.");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addTrigger("bis bald");
talkEntry:addTrigger("leb.+wohl");
talkEntry:addTrigger("tsch[üu][ßs]");
talkEntry:addTrigger("mach.+gut");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Leb wohl.");
talkEntry:addResponse("Mach's gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who you");
talkEntry:addTrigger("what you");
talkEntry:addResponse("I'm %NPCNAME, the guard of the undead on this isle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer du");
talkEntry:addTrigger("was du");
talkEntry:addTrigger("wer ihr");
talkEntry:addTrigger("was ihr");
talkEntry:addResponse("Ich bin %NPCNAME, der Wächter der Untoten auf dieser Insel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guardian");
talkEntry:addResponse("I don't know any guardian of the undead. Perhaps you'll meet one on Gobaith. But now hurry up, you've talked long enough. Move on, climb up the ladder and enter Findecano's castle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("h[uü]ter");
talkEntry:addTrigger("hueter");
talkEntry:addResponse("Ich kenne keinen Hüter der Untoten. Aber vielleicht triffst du einen auf Gobaith. Aber jetzt spute dich, du hast schon lange genug geredet. Geh weiter, kletter die Leiter hoch und betrete das Schloss von Findecano.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guard");
talkEntry:addResponse("I am a guard of the undead. It is my duty to ensure that both the living and the undead do not endanger the other group.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("w[äa]chter");
talkEntry:addTrigger("waechter");
talkEntry:addResponse("Ich bin ein Wächter der Untoten. Es ist meine Pflicht sicherzustellen, dass sowohl die Lebenden als auch die Untoten nicht die andere Gruppe gefährden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("creature");
talkEntry:addResponse("Those creatures are undead.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kreatur");
talkEntry:addResponse("Diese Kreaturen sind Untote.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("undead");
talkEntry:addResponse("I've trapped the undead in this cave. Mummies and skeletons. May Cherga release their souls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("untot");
talkEntry:addResponse("Ich habe die Untoten in diese Höhle gesperrt. Mumien und Skelette. Möge Cherga ihre Seelen freigeben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("living");
talkEntry:addResponse("The living should not disturb the undead. They are at a difficult stage on the way to Cherga's realm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lebend");
talkEntry:addResponse("Die Lebenden sollten die Untoten nicht stören. Sie sind in einem schwierigen Abschnitt auf dem Weg zu Chergas Reich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("realm");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cherga is the Goddess of Spirits and the Underworld. Those undead probably still have to fulfill a certain task. Only then their souls will find peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cherga");
talkEntry:addTrigger("reich");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Cherga ist die Göttin der Geister und der Unterwelt. Diese Untoten haben wahrscheinlich noch ein bestimmte Aufgabe zu erfüllen. Erst dann werden ihre Seelen Frieden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("soul");
talkEntry:addTrigger("peace");
talkEntry:addResponse("These souls can only find peace when they have fulfilled their task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seele");
talkEntry:addTrigger("friede");
talkEntry:addResponse("Jene Seelen können nur Frieden finden, wenn sie ihre Aufgabe erledigt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addResponse("I don't know what task they have to do. Usually only the Gods know this. However some chosen ones - the guardians of the undead - are told to help them. They might know more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addResponse("Ich weiß nicht, was für eine Aufgabe sie erledigen müssen. Normalerweise wissen das nur die Götter. Jedoch sind einige Auserwählte - die Hüter der Untoten - damit beauftragt, ihnen zu helfen. Diese wissen möglicherweise mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ladder");
talkEntry:addResponse("Yes, climb up that ladder. Just step on it and you'll be on the other side of the ladder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("leiter");
talkEntry:addResponse("Ja, kletter diese Leiter hoch. Tret einfach darauf und du wirst am anderen Ende der leiter sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("findecano");
talkEntry:addTrigger("castle");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go to Findecano. He's waiting for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("findecano");
talkEntry:addTrigger("schlo[sß]");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Geh zu Findecano. Er wartet auf dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me reibt sich die Hände.", "#me rubs his hands.");
talkingNPC:addCycleText("#me schüttelt den Kopf 'Arme Kreaturen.'", "#me shakes his head 'Poor creatures.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
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