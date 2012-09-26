--------------------------------------------------------------------------------
-- NPC Name: Thomas Berryard                                          Galmair --
-- NPC Job:  slave                                                            --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  381, 177, -6           --
-- NPC Sex:  male                       NPC Direction: southeast              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 381, 177, -6, 3, 'Thomas Berryard', 'npc.thomas_berryard', 0, 2, 0, 253, 254, 197, 217, 154, 123);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.talk")
module("npc.thomas_berryard", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Thomas Berryard the mason and dye mixer-slave. Fee: 1 silver coin each task. Keywords: make 15 buckets black/green/blue/red/yellow/white dye, make 10 pebbles, make 3 stone block."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Thomas Berryard der Steinmetz und Farbmischer-Sklave. Gebühr: 1 Silberstück á Auftrag. Schlüsselwörter: mische 15 Eimer schwarze/grüne/blaue/rote/gelbe/weiße Farbe, mache 10 Kiesel, mache 3 Steinquader."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) Steinquader");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(733, "%NUMBER", 333, nil));
talkEntry:addResponse("#me seufzt tief und steckt die erhaltene Silbermünze in seine Hosentasche, nach einer weile Arbeit hat er die Steine in schöne Quader gehauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) Kiesel");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, function(number) return (number/5); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, nil));
talkEntry:addResponse("#me seufzt tief und steckt die erhaltene Silbermünze in seine Hosentasche, nach einer weile Arbeit hat er die Steine in handliche Kiesel Zerschlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) Kiesel");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, function(number) return (number/5); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, nil));
talkEntry:addResponse("#me seufzt tief und steckt die erhaltene Silbermünze in seine Hosentasche, nach einer weile Arbeit hat er die Steine in handliche Kiesel Zerschlagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addTrigger("Steinquader");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(733, 1, 333, nil));
talkEntry:addResponse("#me seufzt tief und steckt die erhaltene Silbermünze in seine Hosentasche, nach einer weile Arbeit hat er die Steine in schöne Quader gehauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) Steinquader");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) Kiesel");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) Kiesel");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addTrigger("Steinquader");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kiesel");
talkEntry:addResponse("Kiesel mach ich nur für die, die mir ausreichend entweder Steinquader oder rohe Steine bringen. Fünf Kiesel je Stein. Außerdem musst du mir eine Silbermünze geben... pro Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Steinquader");
talkEntry:addResponse("Steinquader kann ich nur machen wenn mir jemand ausreichend rohe Steine bringt. Außerdem musst du mir eine Silbermünze geben... pro Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stein");
talkEntry:addTrigger("steine");
talkEntry:addTrigger("felsen");
talkEntry:addResponse("Wieviele 'Steinquader' oder 'Kiesel' brauchst du? Und vergiß nicht, jeder Auftrag kostet eine Silbermünze...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) stone block");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(733, "%NUMBER", 333, nil));
talkEntry:addResponse("#me sighs deeply as he puts the silver coin into his trouser pocket then slowly cuts the raw stones to smooth blocks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addTrigger("stone block");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(733, 1, 333, nil));
talkEntry:addResponse("#me sighs deeply as he puts the silver coin into his trouser pocket then slowly cuts the raw stones into smooth blocks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) pebble");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, function(number) return (number/5); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, nil));
talkEntry:addResponse("#me sighs deeply as he puts the silver coin into his trouser pocket then slowly cuts the stones into pebbles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) pebble");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(735, function(number) return (number/5); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1266, "%NUMBER", 333, nil));
talkEntry:addResponse("#me sighs deeply as he puts the silver coin into his trouser pocket then slowly cuts the stones into pebbles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) stone block");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addTrigger("stone block");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(735, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) pebble");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(733, "all", "=>", function(number) return (number/5); end, nil));
talkEntry:addTrigger("(%d+) pebble");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pebble");
talkEntry:addResponse("I can only make pebbles if you bring me enough stone blocks or raw stones. I also have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stone block");
talkEntry:addResponse("Bring enough raw stones and I will cut them into stone blocks for you. I also have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stone");
talkEntry:addTrigger("rock");
talkEntry:addResponse("How many 'stone blocks' or 'pebbles' do you need? Bear in mind that I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*schwarze Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*schwarze Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("schwarze Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("schwarze Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*schwarze Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*schwarze Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("schwarze Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("schwarze Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schwarze Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für schwarze Farbe brauch ich Kohle und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier. Jeder Auftrag kostet eine Silbermünze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*black dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*black dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("black dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("black dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2678, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*black dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*black dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("black dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("black dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("black dye");
talkEntry:addResponse("Without the required material I can't mix dye. For black dye I'll need coal and a bucket, which I can sell to you if you want... water is free. I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gr[üu]ne Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gr[üu]ne Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("gr[üu]ne Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("gr[üu]ne Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gr[üu]ne Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gr[üu]ne Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("gr[üu]ne Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("gr[üu]ne Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üu]ne Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für grüne Farbe brauch ich Kohl und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier. Jeder Auftrag kostet eine Silbermünze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*green dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*green dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("green dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("green dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2679, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*green dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*green dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("green dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("green dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("green dye");
talkEntry:addResponse("Without the required material I can't mix dye. For green dye I'll need cabbage and a bucket, which I can sell to you if you want... water is free. I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blaue Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blaue Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("blaue Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("blaue Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blaue Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blaue Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("blaue Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("blaue Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blau Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für blaue Farbe brauch ich mindestens 3 Brombeeren und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier. Jeder Auftrag kostet eine Silbermünze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blue dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, function(number) return (number*3); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blue dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, function(number) return (number*3); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("blue dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 3, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("blue dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(147, 3, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2680, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blue dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", function(number) return (number*3); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*blue dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("blue dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(147, "all", "=>", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("blue dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("blue dye");
talkEntry:addResponse("Without the required material I can't mix dye. For blue dye I'll need at least 3 blackberries and a bucket, which I can sell to you if you want... water is free. I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*rote Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*rote Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("rote Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 2, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("rote Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 2, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("(%d+).*rote Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("(%d+).*rote Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("rote Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("rote Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rote Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für blaue Farbe brauch ich mindestens 2 Zwiebeln, 2 Kirschen und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier. Jeder Auftrag kostet eine Silbermünze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*red dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*red dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("red dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 2, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("red dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 2, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(302, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2681, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*red dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*red dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("red dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(302, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("red dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("red dye");
talkEntry:addResponse("Without the required material I can't mix dye. For red dye I'll need at least 2 Onions, 2 Cherries and a bucket, which I can sell to you if you want... water is free. I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gelbe Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gelbe Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("gelbe Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("gelbe Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gelbe Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*gelbe Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("gelbe Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("gelbe Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gelbe Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für gelbe Farbe brauch ich mindestens 2 Faulbaumrinden und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier. Jeder Auftrag kostet eine Silbermünze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*yellow dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*yellow dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("yellow dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("yellow dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(157, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2682, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*yellow dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+).*yellow dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("yellow dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(157, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("yellow dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yellow dye");
talkEntry:addResponse("Without the required material I can't mix dye. For yellow dye I'll need at least 2 rotten tree barks and a bucket, which I can sell to you if you want... water is free. I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) wei[ßs]e Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) wei[ßs]e Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("wei[ßs]e Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("wei[ßs]e Farbe");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, nil));
talkEntry:addResponse("Da hast du deine Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) wei[ßs]e Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) wei[ßs]e Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("wei[ßs]e Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("wei[ßs]e Farbe");
talkEntry:addResponse("Du musst mir aber eine Silbermünze geben. Sonst tu ich gar nicht's für dich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wei[ßs]e Farbe");
talkEntry:addResponse("Ohne Material kann ich keine Fraben machen. Für weiße Farbe brauch ich mindestens 2 Hirtnepilze und einen Eimer, den du mir abkaufen musst fallst du keinen hast... Wasser hab ich hier. Jeder Auftrag kostet eine Silbermünze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) white dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) white dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, function(number) return (number*2); end, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, "%NUMBER", 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("white dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("white dye");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(161, 2, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2683, 1, 333, nil));
talkEntry:addResponse("Here's your dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) white dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", function(number) return (number*2); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) white dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=>", 1, nil));
talkEntry:addTrigger("white dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(161, "all", "=>", 2, nil));
talkEntry:addCondition(npc.base.condition.item.item(52, "all", "=>", 1, nil));
talkEntry:addTrigger("white dye");
talkEntry:addResponse("You have to give me a silver coin. Otherwise I won't do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("white dye");
talkEntry:addResponse("Without the required material I can't mix Dye. For white dye I'll need at least 2 herders mushroom and a bucket, which I can sell to you if you want... water is free. I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dye");
talkEntry:addResponse("I mix 'white dye', 'yellow dye', 'red dye', 'blue dye', 'green dye'and 'black dye'... *sighs* Do not forget that I have to charge one silver coin for each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farbe");
talkEntry:addResponse("Ich rühre 'weiße Farbe', 'gelbe Farbe', 'rote Farbe', 'blaue Farbe', 'grüne Farbe' und 'schwarze Farbe' an... *seufzt* Und vergiß nicht, jeder Auftrag kostet eine Silbermünze.");
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
talkEntry:addTrigger("Good night");
talkEntry:addResponse("#me gives an opressed and sarcastic 'Hihoo...'.");
talkEntry:addResponse("#me gives a spiritless nod.");
talkEntry:addResponse("Yes... Hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Morgen");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Gute Nacht");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Mohltied");
talkEntry:addResponse("#me gibt ein bedrückt, sarkastisches 'Hihoo...' von sich.");
talkEntry:addResponse("#me nickt dir lustlos zu.");
talkEntry:addResponse("Jah-h... Hallo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me gives an opressed and sarcastic 'Hihoo...'.");
talkEntry:addResponse("#me gives a spiritless nod.");
talkEntry:addResponse("Yes... Hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me gibt ein bedrückt, sarkastisches 'Hihoo...' von sich.");
talkEntry:addResponse("#me nickt dir lustlos zu.");
talkEntry:addResponse("Jah-h... Hallo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
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
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Adieu!");
talkEntry:addResponse("Baba...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao...");
talkEntry:addResponse("Adieu!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
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
talkEntry:addResponse("What do you think? - Exactly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Na wie solls mir schon gehen? - Eben.");
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
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Thomas Berryard und man hält mich hier gegen meinen Willen fest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me smirks sarcastical. 'Find five dragon eggs. And than I broil them over the fire, all right?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#me lächelt sarkastisch. 'Bringe mir fünf Dracheneier. Und dann braten wir sie gemeinsam raus, ja?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("#me smirks sarcastical. 'Find five dragon eggs. And than I broil them over the fire, all right?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("#me lächelt sarkastisch. 'Bringe mir fünf Dracheneier. Und dann braten wir sie gemeinsam raus, ja?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Do you see this chain? It's mine. My personal one. It's to stop me from sneaking away at night ... again. So my profession... yeah. I'm slave. Isn't it great? *sighs*");
talkEntry:addResponse("I'm a mason. And I mix dye. Bring materials and one silver coin and I'll work for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Siehst du die Kette dort? Sie gehört mir. Mir ganz allein. Damit ich mich nicht davon machen kann. - Wieder einmal. Mein Beruf... Ja. Ich bin ein Sklave. Toll nicht? *seufzt*");
talkEntry:addResponse("Ich bin Steinmetz. Und Farben mische ich auch. Bring das Material und ne Silbermünze. Dann arbeite ich für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Do you see this chain? It's mine. My personal one. It's to stop me from sneaking away at night ... again. So my profession... yeah. I'm slave. Isn't it great? *sighs*");
talkEntry:addResponse("I'm a mason. And I mix dye. Bring materials and one silver coin and I'll work for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Siehst du die Kette dort? Sie gehört mir. Mir ganz allein. Damit ich mich nicht davon machen kann. - Wieder einmal. Mein Beruf... Ja. Ich bin ein Sklave. Toll nicht? *seufzt*");
talkEntry:addResponse("Ich bin Steinmetz. Und Farben mische ich auch. Bring das Material und ne Silbermünze. Dann arbeite ich für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Never heard of that");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Nie davon gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Have we met?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hab ich dich nich schon mal geshen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Eh... they are taller than me and they stink. They're smart enough about the things that interest them, but I'm the one that does all the work.");
talkEntry:addResponse("Once, I was sick and thought it was finally all over... Then the shaman over there cured me. Tja...");
talkEntry:addResponse("Honestly, no one would believe what I have seen in this cave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("book");
talkEntry:addResponse("Well, yes. I wrote books. Hopefully they will help others avoid the problems I have.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("food");
talkEntry:addResponse("Once I was a healthy halfling but there's no good food here.");
talkEntry:addResponse("Tja, Thomas Berryard hungry?! How could that be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("escape");
talkEntry:addTrigger("chain");
talkEntry:addTrigger("fly");
talkEntry:addTrigger("break");
talkEntry:addResponse("Do you think this stupid chain will hold me for ever? Tja, Thomas Berryard has a plan! He-he-he...");
talkEntry:addResponse("#me rattles his chain. 'Hm, without a key it won't open.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("money");
talkEntry:addTrigger("chopper");
talkEntry:addTrigger("coin");
talkEntry:addTrigger("silver");
talkEntry:addTrigger("gold");
talkEntry:addResponse("I borrowed coins from Don Guilianni. When I wasn't able to pay him back, he sold me to the orcs. ME! Like I was merchandise or something!");
talkEntry:addResponse("If only I had never been indebted to the Don. *sighs*");
talkEntry:addResponse("Within just a few years I will be discharged. - Or maybe my escape will be successful tomorrow? Who knows... Tja-hie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("Er'hja");
talkEntry:addTrigger("Erhja");
talkEntry:addTrigger("Krudash");
talkEntry:addResponse("H-hm? That's my owner. In general all those orcs order me around all the time. But Damn! They all look alike!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork");
talkEntry:addResponse("Eh... ja. Sie sind größer als ich und stinken. Wenn sie sich Mühe geben sind sie ganz geschickt. Aber die Arbeit lassen sie ja dann doch nur mich machen.");
talkEntry:addResponse("Ich bin einmal krank geworden, dann dachte ich... jetzt ists vorbei. Aber der Schamane dort drüben hat sich tatsächlich um mich gekümmert. Tja...");
talkEntry:addResponse("Glaub mir, keiner will wissen was ich hier in dieser Höhle schon alles mit ansehen musste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("Er'hja");
talkEntry:addTrigger("Erhja");
talkEntry:addTrigger("Krudash");
talkEntry:addResponse("H-hm? S' ist mein Besitzer. Im Grunde kommandieren mich alle diese Orks herum, wie's ihnen passt. Verdammt nochmal, die sehen doch alle gleich aus!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Flucht");
talkEntry:addTrigger("ausbrechen");
talkEntry:addTrigger("fliehen");
talkEntry:addTrigger("kette");
talkEntry:addResponse("Du glaubst diese olle Kette hält mich für ewig hier fest? Tja, Thomas Berryard hat einen Plan! Hä-hä-hä...");
talkEntry:addResponse("#me rüttelt an seiner Kette. 'Tja, die kriegt man ohne Schlüssel bestimmt nicht auf.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geld");
talkEntry:addTrigger("kupfer");
talkEntry:addTrigger("m[uü]nz.*");
talkEntry:addTrigger("silber");
talkEntry:addTrigger("gold");
talkEntry:addResponse("Ich hab mir Münzen von Don Guilianni geborgt. Als ich sie nicht zurückzahlen konnte hat er mich an die Orks verkauft. MICH! Ich bin doch keine Wahre!");
talkEntry:addResponse("Wenn ich doch bloß niemals beim Don in der Kreide gestanden währe! *seufzt*");
talkEntry:addResponse("Nur noch ein paar, Jahre arbeiten dann darf ich gehen wohin ich will. - Oder vielleicht gelingt mir morgen schon die Flucht? Tja-hie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Essen");
talkEntry:addResponse("Damals war ich ein gesunder Halbling. Aber hier bekommt man nicht richtig zu essen.");
talkEntry:addResponse("Tja, Thomas Berryard muss hungern. Wie konnte es nur so weit kommen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buch");
talkEntry:addResponse("Gut, ja. Ich hab Bücher geschrieben. Hoffentlich helfen die jemanden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I heard he is an elfess. *snickers*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich hab gehört er ist eine Elfe. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I heard he is an elfess. *snickers*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich hab gehört er ist eine Elfe. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Once I lived near Runewick, but I didn't like it that much. Those towers are too scary. They seem like they could collapse at any moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ich habe früher neben Runewick gelebt. Aber es hat mir dort nie richtig gefallen, diese Türme waren schon reichlich unheimlich. Für mich hat das immer so ausgesehen als würden sie jeden Moment herunterfallen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I borrowed coins from Don Guilianni. When I wasn't able to pay him back, he sold me to the orcs. ME! Like I was merchandise or something!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich hab mir Münzen von Don Guilianni geborgt. Als ich sie nicht zurückzahlen konnte hat er mich an die Orks verkauft. MICH! Ich bin doch keine Wahre!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Uh, well... I came here to earn some money... basically. That's why everybody comes here, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Hm, tja... Ich bin her gekommen um Geld zu verdienen... im Grunde. Das wollen ja alle hier, oder etwa nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("This kings 'nd queens thing I never understood. They have blue blood or something. *shrugs his shoulders*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Diese Königs-Sache der Menschen hab ich nie wirklich verstanden. Außerdem ist deren Blut blau oder so. *zuckt mit der Schulter*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("This kings 'nd queens thing I never understood. They have blue blood or something. *shrugs his shoulders*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Diese Königs-Sache der Menschen hab ich nie wirklich verstanden. Außerdem ist deren Blut blau oder so. *zuckt mit der Schulter*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? There's only sand and heat there. Not a good place for a halfling, if you ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr? Dort gibt's nur Sand und Hitze. Kein Ort für einen Halbling wenn du mich fragst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Why you don't talk with some Longears about that, hm? I'm really busy with uhm... slave things - right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("He, warum sprichst du nicht mit irgendwelchen Langen über das, hm? Ich bin gerade wirklich beschäftigt mit uhm... Sklavensachen. Genau! Wirklich viel zu tun hier...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Why you don't talk with some Longears about that, hm? I'm really busy with uhm... slave things - right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("He, warum sprichst du nicht mit irgendwelchen Langen über das, hm? Ich bin gerade wirklich beschäftigt mit uhm... Sklavensachen. Genau! Wirklich viel zu tun hier...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Why you don't talk with some Longears about that, hm? I'm really busy with uhm... slave things - right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("He, warum sprichst du nicht mit irgendwelchen Langen über das, hm? Ich bin gerade wirklich beschäftigt mit uhm... Sklavensachen. Genau! Wirklich viel zu tun hier...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Seems to me the gods are punishing me for something, but I'm not sure what.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Sieht so aus als würden mich die Götter für irgendetwas bestrafen. Ich bin mir aber nicht sicher wofür.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Well, before I was enslaved I worshiped Adron every day in Hagar's Tavern - The Winged Sow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ja, bevor ich versklavt wurde, habe ich zu Ehren Adrons täglich in Hagar's Taverne - Zur geflügelten Sau, geopfert und gehuldigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("He-he! Nargún is quite fun, isn't he? I like to talk his followers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Hi-hi! Nargún ist wirklich lustig. Oder? Ich spreche gern mit seinen Anhängern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Gn-ah? What? No-no-no. I never worshipped Ronagan. *snickers*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Gn-ah? Was? Nein-nein-nein. Ronagans lehren bin ich nie gefolgt. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell nothing. I'm a slave. But I work stones and mix dye, which will cost one silver coin each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin ein Sklave. Also darf ich nichts verkaufen. Aber ich behaue Steine und mische Farbe, was dann trotzdem eine Silbermünze pro Auftrag kostet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("A long time ago, I was a fat and happy halfling. Then I borrowed money from deceptive people. The next thing I knew - I worked for these pigs here.");
talkEntry:addResponse("At first it was bearable, but then I snuck away at night ... The suffering that followed, I will never forget. I've been shackled to this chain ever since.");
talkEntry:addResponse("These orcs don't give me enough to eat! They think it's funny when my stomach growls. I've become really scrawny!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Tja. Einst war ich ein fetter glücklicher Halbling. Aber dann hab ich mir von den falschen Leuten Geld geliehen und ehe ich mich umsehen konnte, arbeite ich hier für die Schweinenasen.");
talkEntry:addResponse("Zu Anfang war es ja noch einigermaßen erträglich. Doch ich hab mich in der Nacht davon geschlichen... das gab einen Trubel, will ich mich gar nicht dran erinnern. Danach haben sie mich hier angekettet.");
talkEntry:addResponse("Diese Orks geben mir nie genug zu Essen! Die finden das lustig, wenn mir der Magen knurrt. Ich bin jetzt ja schon ganz dürr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Thomas");
talkEntry:addTrigger("Berryard");
talkEntry:addTrigger("Berry");
talkEntry:addTrigger("Tom");
talkEntry:addTrigger("Thom");
talkEntry:addTrigger("snaga");
talkEntry:addResponse("Hm-h? Do you need any stones or dye?");
talkEntry:addResponse("Yeh-hs. What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Thomas");
talkEntry:addTrigger("Berryard");
talkEntry:addTrigger("Berry");
talkEntry:addTrigger("Tom");
talkEntry:addTrigger("Thom");
talkEntry:addTrigger("snaga");
talkEntry:addResponse("Was ist? Brauchst du Steine, oder Farben?");
talkEntry:addResponse("Jah-ah. Was willst du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("slave");
talkEntry:addTrigger("halfer");
talkEntry:addTrigger("halfling");
talkEntry:addResponse("Hm-h? Do you need any stones or dye?");
talkEntry:addResponse("Yeh-hs. What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sklave");
talkEntry:addTrigger("halbe");
talkEntry:addTrigger("halbling");
talkEntry:addTrigger("halber");
talkEntry:addResponse("Was ist? Brauchst du Steine, oder Farben?");
talkEntry:addResponse("Jah-ah. Was willst du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Well-well.");
talkEntry:addResponse("Hm-hm.");
talkEntry:addResponse("All right.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ist gut.");
talkEntry:addResponse("Hm-hm.");
talkEntry:addResponse("Alles klar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Whatever...");
talkEntry:addResponse("A-ha?");
talkEntry:addResponse("I do not care. Honestly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Was auch immer.");
talkEntry:addResponse("A-ha?");
talkEntry:addResponse("Meinetwegen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I tried to found a labour union, but Murgo forbade it.");
talkEntry:addResponse("Yeah? ... what a bummer!.");
talkEntry:addResponse("Heh-heh. You are quite funny.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich wollte eine Gewerkschaft gründen. Aber Murgo war dagegen.");
talkEntry:addResponse("Yeah? ... so ein Mist!");
talkEntry:addResponse("Hä-hä. Du bist richtig drollig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me klopft lustlos auf ein paar Steinen herum.", "#me pounds some stones in a spiritless way.");
talkingNPC:addCycleText("#me seufzt. 'Schon wieder...'", "#me sighs. 'Again...'");
talkingNPC:addCycleText("#me's Magen knurrt leise.", "#me's stomach is growling a little bit.");
talkingNPC:addCycleText("#me schürt das Feuer und rührt in einem stinkendem Topf etwas Farbe an.", "#me pokes the fire and mixes some dye into a stinking pot.");
talkingNPC:addCycleText("#me reibt sich müde die Augen.", "#me rubs his sleepy eyes.");
talkingNPC:addCycleText("Seit dem ich versucht habe Wegzulaufen muss ich pausenlos schuften!", "Since I tried to run away, I get more work and no more breaks.!");
talkingNPC:addCycleText("Wenn er mich zwingt das nochmal zu essen, hau ich ihm ins Gemächt!", "If he forces me to eat this stuff again, I will bash his family jewels!");
talkingNPC:addCycleText("... und dann wird mir alles egal sein.. ja genau! Hihi.", "... and then I won't care anymore.. oh yes! Hehe.");
talkingNPC:addCycleText("#me bohrt in der Nase", "#me digs his finger around in his nose.");
talkingNPC:addCycleText("#me klimpert mit seinen Handschellen.", "#me rattles his shackles.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein pummeliger Halbling in zerschlissener Kleidung. An seinen Füßen befinden sich Schellen die ihn an eine Kette fesseln", "A chubby halfling in tattered clothing. His feet are shackled to a heavy chain.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(9, 183);
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