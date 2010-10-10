--------------------------------------------------------------------------------
-- NPC Name: Thomas Berryard                                             None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  381, 177, -6           --
-- NPC Sex:  male                       NPC Direction: southeast              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: October 10, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 381, 177, -6, 3, 'Thomas Berryard', 'npc.thomas_berryard', 0, 3, 0, 253, 254, 197, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.consequence.item")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.thomas_berryard", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Steinquader");
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me seufzt tief, nach einer weile Arbeit hat er die Steine in schöne Quader gehauen.");
talkEntry:addConsequence(npc.base.consequence.item.item(733, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Kiesel");
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number/5); end));
talkEntry:addResponse("#me seufzt tief, nach einer weile Arbeit hat er die Steine in handliche Kiesel Zerschlagen.");
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) Kiesel");
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "=>", function(number) return (number/5); end));
talkEntry:addResponse("#me seufzt tief, nach einer weile Arbeit hat er die Steine in handliche Kiesel Zerschlagen.");
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Steinquader");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1));
talkEntry:addResponse("#me seufzt tief, nach einer weile Arbeit hat er die Steine in schöne Quader gehauen.");
talkEntry:addConsequence(npc.base.consequence.item.item(733, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kiesel");
talkEntry:addResponse("Kiesel mach ich nur für die, die mir ausreichend entweder Steinquader oder rohe Steine bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Steinquader");
talkEntry:addResponse("Steinquader kann ich nur machen wenn mir jemand ausreichend rohe Steine bringt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stein");
talkEntry:addResponse("Wieviele 'Steinquader' oder 'Kiesel' brauchst du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) stone block");
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me sighs deeply and after a while he worked the raw stones to fair blocks.");
talkEntry:addConsequence(npc.base.consequence.item.item(733, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stone block");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1));
talkEntry:addResponse("#me sighs deeply and after a while he worked the raw stones to fair blocks.");
talkEntry:addConsequence(npc.base.consequence.item.item(733, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) pebble");
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number/5); end));
talkEntry:addResponse("#me sighs deeply and after a while he worked the stones to handy pebbles.");
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) pebble");
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "=>", function(number) return (number/5); end));
talkEntry:addResponse("#me sighs deeply and after a while he worked the stones to handy pebbles.");
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pebble");
talkEntry:addResponse("Pebbles are only possible if you bring me enough stone blocks or raw stones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stone block");
talkEntry:addResponse("Bring enough raw stones and I will work stone blocks for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stone");
talkEntry:addResponse("How many 'stone blocks' or 'pebbles' do you need?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) schwarz Farbe");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) schwarz Farbe");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwarz Farbe");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwarz Farbe");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwarz Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für schwarze Farbe brauch ich Kohle und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) black dye");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) black dye");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("black dye");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("black dye");
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("black dye");
talkEntry:addResponse("Without material I can't mix Dye. Black dye needs coal and a bucket, witch you have to buy from me if you havn't one allready... water is here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gr[üu]n Farbe");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gr[üu]n Farbe");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üu]n Farbe");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üu]n Farbe");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üu]n Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für grüne Farbe brauch ich Kohl und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) green dye");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) green dye");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("green dye");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("green dye");
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("green dye");
talkEntry:addResponse("Without material I can't mix Dye. Green dye needs cabbage and a bucket, witch you have to buy from me if you havn't one allready... water is here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) blau Farbe");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) blau Farbe");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blau Farbe");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blau Farbe");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blau Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für blaue Farbe brauch ich mindestens 3 Brombeeren und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) blue dye");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) blue dye");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blue dye");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blue dye");
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blue dye");
talkEntry:addResponse("Without material I can't mix Dye. Blue dye needs at least 3 blackberries and a bucket, witch you have to buy from me if you havn't one allready... water is here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) rot Farbe");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) rot Farbe");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rot Farbe");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rot Farbe");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rot Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für blaue Farbe brauch ich mindestens 2 Zwiebeln, 2 Kirschen und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) red dye");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) red dye");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("red dye");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("red dye");
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("red dye");
talkEntry:addResponse("Without material I can't mix Dye. Red dye needs at least 2 Onions, 2 Cherries and a bucket, witch you have to buy from me if you havn't one allready... water is here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gelb Farbe");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gelb Farbe");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gelb Farbe");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gelb Farbe");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gelb Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für gelbe Farbe brauch ich mindestens 2 Faulbaumrinden und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) yellow dye");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) yellow dye");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yellow dye");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yellow dye");
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yellow dye");
talkEntry:addResponse("Without material I can't mix Dye. Yellow dye needs at least 2 rotten tree barks and a bucket, witch you have to buy from me if you havn't one allready... water is here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) wei[ßs] Farbe");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) wei[ßs] Farbe");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wei[ßs] Farbe");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wei[ßs] Farbe");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Da hast du deine Farbe.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wei[ßs] Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für weiße Farbe brauch ich mindestens 2 Hirtnepilze und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) white dye");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) white dye");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("white dye");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("white dye");
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1));
talkEntry:addResponse("Here's your dye.");
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("white dye");
talkEntry:addResponse("Without material I can't mix Dye. White dye needs at least 2 herders mushroom and a bucket, witch you have to buy from me if you havn't one allready... water is here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dye");
talkEntry:addResponse("I mix 'white dye', 'yellow dye', 'red dye', 'blue dye', 'green dye'and 'black dye'... *sighs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farbe");
talkEntry:addResponse("Ich rühre 'weiße Farbe', 'gelbe Farbe', 'rote Farbe', 'blaue Farbe', 'grüne Farbe' und 'schwarze Farbe' an... *seufzt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("#me gibt ein bedrückt, sarkastisches 'Hihoo...' von sich.");
talkEntry:addResponse("#me nickt dir lustlos zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("#me gives you an aggrieved and sarkastic 'Hihoo...'.");
talkEntry:addResponse("#me gives you a spiritless nod.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me gives you an aggrieved and sarkastic 'Hihoo...'.");
talkEntry:addResponse("#me gives you a spiritless nod.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me gibt ein bedrückt, sarkastisches 'Hihoo...' von sich.");
talkEntry:addResponse("#me nickt dir lustlos zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin Thomas Berryard und man hält mich hier gegen meinen Willen fest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao...");
talkEntry:addResponse("Adieu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Adieu!");
talkEntry:addResponse("Baba...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao...");
talkEntry:addResponse("Adieu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Adieu!");
talkEntry:addResponse("Baba...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Na wie solls mir schon gehen?...eben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("What do you think?...exactly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Thomas Berryard. And I don't wan't to be here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("We havn't met allready, did we?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Hab ich dich nich schon mal geshen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Ja, genau. Ich muss die ganzen 'Steine' zu Kieseln hauen und 'Farben' mischen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Ja, genau. Ich muss die ganzen 'Steine' zu Kieseln hauen und 'Farben' mischen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Actually, I have to batter all 'stones' into pebbles and mix 'dye'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Murgo? He is my owner. And Krudash is his wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Murgo? Er ist mein Besitzer. Und Krudash seine Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me klopft lustlos auf ein paar Steinen herum.", "#me knocks some stones in a spiritless way.");
talkingNPC:addCycleText("#me seufzt. 'Schon wieder...'", "#me sighs. 'Again...'");
talkingNPC:addCycleText("#me's Magen knurrt leise.", "#me's stomach is growling a little bit.");
talkingNPC:addCycleText("#me schürt das Feuer und rührt in einem stinkendem Topf etwas Farbe an.", "#me pokes the fire and mixes some dye into a stinky pot.");
talkingNPC:addCycleText("#me reibt sich müde die Augen.", "#me rubs his sleepy eyes.");
talkingNPC:addCycleText("Seit dem ich versucht habe Wegzulaufen muss ich pausenlos schuften!", "Until I tried to run away, I have to  peg away!");
talkingNPC:addCycleText("Wenn er mich zwingt das nochmal zu essen, hau ich ihm ins Gemächt!", "If he force me to eat this stuff again, I will bash his family jewels!");
talkingNPC:addCycleText("... und dann wird mir alles egal sein.. ja genau! Hihi.", "... and then I won't care annymore.. oh yes! Hihi.");
talkingNPC:addCycleText("#me bohrt in der Nase", "#me drills with a finger into his nose.");
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