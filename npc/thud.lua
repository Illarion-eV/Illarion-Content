--------------------------------------------------------------------------------
-- NPC Name: Thud                                                     Galmair --
-- NPC Job:  circle quest - trophydeeler                                      --
--                                                                            --
-- NPC Race: orc                        NPC Position:  394, 188, -6           --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 394, 188, -6, 6, 'Thud', 'npc.thud', 0, 1, 3, 108, 62, 46, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.race")
require("npc.base.condition.skill")
require("npc.base.condition.state")
require("npc.base.consequence.attribute")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.thud", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Thud the trophy collector. Keyphrases: trophy - answer with 'yes' or 'no'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Thud der Trophäensammler. Schlüsselwörter: Trophäe - Antworte mit 'Ja' oder 'Nein'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(1319, 5, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(1319, 5, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(62, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(62, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2445, 1, 999, 1073741826));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2445, 1, 999, 1073741826));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(364, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(364, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(322, 50, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(322, 50, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2780, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "distance weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2780, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(517, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(517, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(559, 5, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(559, 5, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(97, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(97, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 999, 1073741826));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2448, 1, 999, 1073741826));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2286, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2286, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2627, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.skill.skill(5, "slashing weapons", "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2627, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 13));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2664, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(559, 5, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 25));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 29));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(559, 5, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 50));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 54));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(333, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 75));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 79));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(67, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 120));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 124));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(95, 1, 999, 1073741826));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 165));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 169));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(95, 1, 999, 1073741826));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Thud like you. Take this stuff here!");
talkEntry:addConsequence(npc.base.consequence.item.item(2742, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(301, "=<", 254));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Thud mögen dich! Nimmst du diese Zeug!");
talkEntry:addConsequence(npc.base.consequence.item.item(2742, 1, 999, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks at your belt: 'Wanna give Thud your horn?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben Horn, das?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1, 0));
talkEntry:addResponse("Dancke für Horn, das!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(333, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.item.item(333, "belt", "=>", 1, 0));
talkEntry:addResponse("Thanks for tha horn!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(333, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Me no fool. You don't have one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks at your belt: 'Wanna give Thud your fur?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben die Felle?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1, 0));
talkEntry:addResponse("Dancke für die Felle!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addCondition(npc.base.condition.item.item(2586, "belt", "=>", 1, 0));
talkEntry:addResponse("Thanks for tha fur!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2586, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Me no fool. You don't have one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks at your belt: 'Wanna give Thud your salkish paladin helmet?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein salkamarischer Paladinhelm?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1, 0));
talkEntry:addResponse("Dancke für den Helm!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2291, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2291, "belt", "=>", 1, 0));
talkEntry:addResponse("Thanks for tha helmet!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2291, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Me no fool. You don't have one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks at your belt: 'Wanna give Thud your ornate dagger?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein verzierhrte Dolch?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1, 0));
talkEntry:addResponse("Dancke für den Dolch!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(190, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addCondition(npc.base.condition.item.item(190, "belt", "=>", 1, 0));
talkEntry:addResponse("Thanks for tha dagger!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(190, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Me no fool. You don't have one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks at your belt: 'Wanna give Thud your dwarven axe?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein Zwergenaxt?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1, 0));
talkEntry:addResponse("Dancke für d'Axt!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2660, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2660, "belt", "=>", 1, 0));
talkEntry:addResponse("Thanks for tha axe!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2660, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Me no fool. You don't have one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me peeks at your belt: 'Wanna give Thud your elven composite longbow?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1, 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me blickt vertohlen auf deinen Gürtel. 'Wilsste Thud geben dein Elben-Kompositlangbogen?'");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1, 0));
talkEntry:addResponse("Dancke für d'Bogen!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2718, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addResponse("So'n Mist!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addResponse("Ich nix dumm! Du nix hast.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2718, "belt", "=>", 1, 0));
talkEntry:addResponse("Thanks for tha bow!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2718, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(301, "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addResponse("What a bummer!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addResponse("Me no fool. You don't have one!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thud collect trophy! Collect fur! Horn! Salkish... paladin helmet! Ornate dagger! Dwarven axe! Elven composite longbow!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("troph");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Thud sammeln Trophäe! Sammelt Fell! Horn! Salkamarischer Paladinhelm! Dolch, verziert! Zwergenaxt! Elben-Kompositlangbogen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebba!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Farebba!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebba!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farebba!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I Thud! I collect! Trophy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("I Thud! I collect! Trophy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I Thud. Who youb?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich Thud. Wer du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Quest: The Trophy Collector. Thud collects fur, horns, salkamarian pladin helmets, ornated daggers, dwarven axes and elven composite longbows. - If you bring him enough trophies, he will reward you."));
talkEntry:addResponse("You bring all trophy to Thud. Tagtha? Mes collect it. Hurr-hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Quest: Der Trophäensammler. Thud sammelt Felle, Hörner, Salkamarische Paladinhelme, verzierte Dolche, Zwergenäxte und Elben-Kompositlangbögen. - Wenn du ihm genügend Trophäen gebrachst hast wird er dich belohnen."));
talkEntry:addResponse("Du bringst Thud alle Trophäe du hast! Yubba?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Quest: The Trophy Collector. Thud collects fur, horns, salkamarian pladin helmets, ornated daggers, dwarven axes and elven composite longbows. - If you bring him enough trophies, he will reward you."));
talkEntry:addResponse("You bring all trophy to Thud. Tagtha? Mes collect it. Hurr-hurr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Quest: Der Trophäensammler. Thud sammelt Felle, Hörner, Salkamarische Paladinhelme, verzierte Dolche, Zwergenäxte und Elben-Kompositlangbögen. - Wenn du ihm genügend Trophäen gebrachst hast wird er dich belohnen."));
talkEntry:addResponse("Du bringst Thud alle Trophäe du hast! Yubba?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I thud things. - With my club.");
talkEntry:addResponse("I collect trophy. Bring all of them here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Thud haut mit Keule fest zu!");
talkEntry:addResponse("Ich sameln Trophäe. Bring alle davon hier her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I thud things. - With my club.");
talkEntry:addResponse("I collect trophy. Bring all of them here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Thud haut mit Keule fest zu!");
talkEntry:addResponse("Ich sameln Trophäe. Bring alle davon hier her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me thuds your head with his big club. 'Shut up!'");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 2000));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("#me haut dir mit seiner Keule auf den Kopf. 'Halts Maul!'");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 2000));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("#me makes a stupid grin: 'And I Thud...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("#me grinst blöde: 'Und ich Thud...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addTrigger("murgo");
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("grimlug");
talkEntry:addTrigger("olokwa");
talkEntry:addTrigger("Er'hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("mo'rurt");
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You good orc! Orc be Thud's friends. Orc be strong. Make biggest thuds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addTrigger("murgo");
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("grimlug");
talkEntry:addTrigger("olokwa");
talkEntry:addTrigger("Er'hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("mo'rurt");
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm orc. You orc? Noo! You stupid!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alice");
talkEntry:addTrigger("alize");
talkEntry:addTrigger("thom");
talkEntry:addTrigger("thomas");
talkEntry:addTrigger("berryard");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("stout");
talkEntry:addTrigger("jack");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thud be proud orc! Honor! Mes not talk with Snaga! Dirty scheschnak-monkeys!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addTrigger("orc");
talkEntry:addTrigger("murgo");
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("grimlug");
talkEntry:addTrigger("olokwa");
talkEntry:addTrigger("Er'hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("mo'rurt");
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addResponse("Du guter Ork. Orks sind Thud's Freunde. Orks sind stark. Machen größte Kabums.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addTrigger("orc");
talkEntry:addTrigger("murgo");
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("grimlug");
talkEntry:addTrigger("olokwa");
talkEntry:addTrigger("Er'hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("mo'rurt");
talkEntry:addTrigger("morurt");
talkEntry:addResponse("Ich bin Ork. Bist du Ork? Nöö! Du dumm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alice");
talkEntry:addTrigger("alize");
talkEntry:addTrigger("thom");
talkEntry:addTrigger("thomas");
talkEntry:addTrigger("berryard");
talkEntry:addTrigger("berry");
talkEntry:addTrigger("stout");
talkEntry:addTrigger("jack");
talkEntry:addResponse("Thud stolzer Ork. Ehre! Ich nix sprech mit Snaga! Dreckige Scheschnak-Affen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Silly elves. Silly-silly-silly-silly-silly...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Elfen dumm. Dummi-dummi-dummi-dummi-dummi...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Silly elves. Silly-silly-silly-silly-silly...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elfen dumm. Dummi-dummi-dummi-dummi-dummi...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Wicked Runetown. Gâsh! I no go there. Never.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Böse Stadt, ist. Gâsh! Ich nix geh hin. Nie, nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dwarves! Nothing but lawn gnomes. *laughs* They should lick my boots!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Alle Zwerge könne Thud's Staub fressen. Yubba. Weil sie sind niedrig. Sie Staubfresser sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr! Big big town! Much trouble here. Good place for big orcs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Hurr! Groß groß Stadt! Viel los hier. Gute Platz für große Orks!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("This is the queen? Thud's craps are more noble! He-he.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Das Königin sein? Thud's Kacke mehr königlich. He-he!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This is the queen? Thud's craps are more noble! He-he.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Das Königin sein? Thud's Kacke mehr königlich. He-he!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr have big Orcs. But Galmair have biggest Axes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr hat große Orks. Aber Galmair hat größte Äxte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thud dont't know. Not know town of human. Is human's town. You ask human about, uh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Thud nix kennt Stadt von Menschen. Du fragst Menschen. Menschen wissen davon. Uh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thud dont't know. Not know town of human. Is human's town. You ask human about, uh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Thud nix kennt Stadt von Menschen. Du fragst Menschen. Menschen wissen davon. Uh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thud dont't know. Not know town of human. Is human's town. You ask human about, uh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Thud nix kennt Stadt von Menschen. Du fragst Menschen. Menschen wissen davon. Uh!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Bonelord, be mes god! He father ob all orcs! Hurr. Ib Thud like know about god, he ask Grimlug. Grimlug is shaman! Shaman be wise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Schädelgott, sein mein Gott. Er Vater von alle Ork. Hurr! Wenn Thud spricht über Götter, er fragt Grimlug. Grimlug Schamane ist. Sehr weise. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addTrigger("bonelord");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bonelord, be mes god! He father ob all orcs! Hurr. Ib Thud like know about god, he ask Grimlug. Grimlug is shaman! Shaman be wise.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addTrigger("bonelord");
talkEntry:addTrigger("schädelgott");
talkEntry:addResponse("Schädelgott, sein mein Gott. Er Vater von alle Ork. Hurr! Wenn Thud spricht über Götter, er fragt Grimlug. Grimlug Schamane ist. Sehr weise. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Thud no trade. Thud collect. Trophy! Uh. You got Trophy?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Thud nicht handelt. Thud sammelt. Trophäe! Uh. Du hast Trophäe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Thud like to thud things! With big club.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich bin Thud. Ich mögen wenn, große Kabums mit Keule.");
talkEntry:addResponse("Thud ist neue Sprache. Heißt 'der große Kabums.' Das mein Name. Thud mag große Kabums!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me grunts. 'I thud! That me be. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addResponse("#me grunzt. 'Ich Thud! Das ich bin. Yubba.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Uh? What you mean?");
talkEntry:addResponse("Huh? What you talking about?");
talkEntry:addResponse("Yubba. There we go.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Uh? Was wollen du?");
talkEntry:addResponse("Hä? Du sprechen worüber?");
talkEntry:addResponse("Yubba. So wir machn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What that mean?");
talkEntry:addResponse("`No? Uh sure?");
talkEntry:addResponse("Whatever... Thud don't care!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Was das zu bedeuten hat?");
talkEntry:addResponse("Nein? Du sicher?");
talkEntry:addResponse("Was immer auch... Thud es nix interessiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("#me thuds your head with his big club. 'Shut up!'");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 2000));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("#me haut dir mit seiner Keule auf den Kopf. 'Halts Maul!'");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 2000));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(40.0));
talkEntry:addResponse("Oh! Mes never thought about in that way!");
talkEntry:addResponse("Is that so? Sound's silly.");
talkEntry:addResponse("You mouth be filled with garbage and it falls out every time you open it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(40.0));
talkEntry:addResponse("Oh! So hat Thud das noch nie betrachtet.");
talkEntry:addResponse("Das ist so? Klingt bekloppt. In meine Ohren.");
talkEntry:addResponse("Dein Maul, voll mit Müll. Und er fällt heraus, jedesmal du machst auf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streckt seine Zunge heraus und versucht seine Nase anzustupsen.", "#me tries to touch his nose with his tongue.");
talkingNPC:addCycleText("#me bohrt in der Nase", "#me digs around in his nose.");
talkingNPC:addCycleText("#me kratzt sich kurz zwischen den Beinen.", "#me has a quick scratch between his legs.");
talkingNPC:addCycleText("#me wischt seine Nase am Hemdärmel ab.", "#me sneezes into his shirtsleeve.");
talkingNPC:addCycleText("#me grinst dümmlich. 'Ich Thud ist!'", "#me makes a silly grin. 'I be Thud!'");
talkingNPC:addCycleText("#me gluckst ein wenig.", "#me chuckles a little.");
talkingNPC:addCycleText("Mirr mag grosse Kabumms.", "I like to thud!");
talkingNPC:addCycleText("#me blickt mit leeren Blick an eine nichtssagende Stelle.", "#me stares blankly at nothing.");
talkingNPC:addCycleText("#me klappt den Mund auf und ein Speichelfaden rinnt am Kinn herunter. Mit einem schmatzenden Laut wischt er ihn mit dem Handrücken weg.", "#me's mouth hangs open and a thread of drool trickles out. With a smacking noise, he wipes it away with his hand.");
talkingNPC:addCycleText("#me krazt sich knurrend am Kopf.", "#me scratches his head and makes an annoyed snarl.");
talkingNPC:addCycleText("#me rülpst, Duft von schalem Bier und gebratenen Fleisch entschwebt in die Nasen der Umgebung.", "#me burps, the scent of stale beer and roasted meat floats into the noses of anyone in the surrounding area.");
talkingNPC:addCycleText("#me klappert in einem einfachen ansteckenden Rythmus auf einem Holzstück.", "#me drums a simple, catchy rhythm on a piece of wood.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein dümmlicher aber kräftiger Ork, der etwas abwesend umher glotzt.", "A stupid but strong orc. He stares absently at the cave walls.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 7);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(5, 2664);
mainNPC:setEquipment(6, 17);
mainNPC:setEquipment(9, 2112);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END