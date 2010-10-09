--------------------------------------------------------------------------------
-- NPC Name: Rose                                                        None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  404, 292, 0            --
-- NPC Sex:  female                     NPC Direction: southwest              --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 25, 2010                         easyNPC Parser v1.01 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 404, 292, 0, 5, 'Rose', 'npc.rose', 1, 2, 0, 202, 93, 24, 234, 183, 156);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.quest")
require("npc.base.condition.race")
require("npc.base.condition.sex")
require("npc.base.condition.state")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.rose", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste einfache dolch");
talkEntry:addTrigger("preis einfache dolch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Für dich, jeweils 180 Kupferstücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost simple dagger");
talkEntry:addTrigger("price simple dagger");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w For you each 180 copperpieces each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) einfache dolch");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*180); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Ich mag es mit dir Geschäfte zu machen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*180); end));
talkEntry:addConsequence(npc.base.consequence.item.item(27, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf einfache dolch");
talkEntry:addCondition(npc.base.condition.money.money("=>", 180));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 180 Münzen."));
talkEntry:addResponse("Es ist mir ein vergnügen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 180));
talkEntry:addConsequence(npc.base.consequence.item.item(27, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf einfache dolch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Lieber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf einfache dolch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Liebes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) simple dagger");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*180); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Pleasure doing buisiness with you.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*180); end));
talkEntry:addConsequence(npc.base.consequence.item.item(27, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy simple dagger");
talkEntry:addCondition(npc.base.condition.money.money("=>", 180));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 180 coins."));
talkEntry:addResponse("It's my pleasure.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 180));
talkEntry:addConsequence(npc.base.consequence.item.item(27, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy simple dagger");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Sorry dearest, you havn't enough coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something simple dagger");
talkEntry:addTrigger("tell about simple dagger");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w It's just a simple dagger. Nothing special about it, altough it could be very usefull.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was einfache dolch");
talkEntry:addTrigger("erzähl etwas einfache dolch");
talkEntry:addTrigger("erzähl über einfache dolch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Es ist lediglich ein ordinärer Dolch. Er hat wirklich nichts besonders an sich, kann aber sehr nützlich sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste schwarze hemd");
talkEntry:addTrigger("preis schwarze hemd");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Für dich, jeweils 500 Kupferstücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost black shirt");
talkEntry:addTrigger("price black shirt");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w For you, 500 copperpieces each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) schwarze hemd");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*500); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Ich mag es mit dir Geschäfte zu machen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*500); end));
talkEntry:addConsequence(npc.base.consequence.item.item(182, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze hemd");
talkEntry:addCondition(npc.base.condition.money.money("=>", 500));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 500 Münzen."));
talkEntry:addResponse("Es ist mir ein vergnügen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(182, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze hemd");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Lieber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze hemd");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Liebes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) black shirt");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*500); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Pleasure doing buisiness with you");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*500); end));
talkEntry:addConsequence(npc.base.consequence.item.item(182, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy black shirt");
talkEntry:addCondition(npc.base.condition.money.money("=>", 500));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 500 coins."));
talkEntry:addResponse("My pleasure.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(182, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy black shirt");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Sorry darling, you havn't enough coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something black shirt");
talkEntry:addTrigger("tell about black shirt");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Warm and soft shirts in inconspicuous black. I crafted them myself... honestly!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was schwarze hemd");
talkEntry:addTrigger("erzähl etwas schwarze hemd");
talkEntry:addTrigger("erzähl über schwarze hemd");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Warme kuschelige Hemden in unaufälligem Schwarz. Ich habe sie selbst gennäht... ehrlich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste schwarze hose");
talkEntry:addTrigger("preis schwarze hose");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Für dich, jeweils 160 Kupferstücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost black trousers");
talkEntry:addTrigger("price black trousers");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w For you, 160 copperpieces each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) schwarze hose");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*160); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Ich mag es mit dir Geschäfte zu machen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*160); end));
talkEntry:addConsequence(npc.base.consequence.item.item(34, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze hose");
talkEntry:addCondition(npc.base.condition.money.money("=>", 160));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 160 Münzen."));
talkEntry:addResponse("Es ist mir ein vergnügen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 160));
talkEntry:addConsequence(npc.base.consequence.item.item(34, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze hose");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Lieber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze hose");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Liebes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) black trousers");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*160); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Pleasure doing buisiness with you");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*160); end));
talkEntry:addConsequence(npc.base.consequence.item.item(34, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy black trousers");
talkEntry:addCondition(npc.base.condition.money.money("=>", 160));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 160 coins."));
talkEntry:addResponse("It's my pleasure.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 160));
talkEntry:addConsequence(npc.base.consequence.item.item(34, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy black trousers");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Sorry darling, you havn't enough coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something black trousers");
talkEntry:addTrigger("tell about black trousers");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Warm and soft trousers in inconspicuous balck. All made by my own two hands... honestly!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was schwarze hose");
talkEntry:addTrigger("erzähl etwas schwarze hose");
talkEntry:addTrigger("erzähl über schwarze hose");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Warme kuschelige Hosen in unaufälligem Schwarz. Ich habe sie selbst gennäht... ehrlich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste schwarze stoff");
talkEntry:addTrigger("preis schwarze stoff");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Für dich, jeweils 40 Kupferstücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost black cloth");
talkEntry:addTrigger("price black cloth");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w For you, 40 copperpieces each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) schwarze stoff");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*40); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Ich mag es mit dir Geschäfte zu machen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*40); end));
talkEntry:addConsequence(npc.base.consequence.item.item(175, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze stoff");
talkEntry:addCondition(npc.base.condition.money.money("=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 40 Münzen."));
talkEntry:addResponse("Es ist mir ein vergnügen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 40));
talkEntry:addConsequence(npc.base.consequence.item.item(175, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze stoff");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Lieber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf schwarze stoff");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Liebes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) black cloth");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*40); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Pleasure doing buisiness with you.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*40); end));
talkEntry:addConsequence(npc.base.consequence.item.item(175, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy black cloth");
talkEntry:addCondition(npc.base.condition.money.money("=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 40 coins."));
talkEntry:addResponse("My pleasure.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 40));
talkEntry:addConsequence(npc.base.consequence.item.item(175, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy black cloth");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("My dear darling, you havn't enough coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something black cloth");
talkEntry:addTrigger("tell about black cloth");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Hm, let me see. Thats just cloth. Maybe you are able to hide your cute face with it? But that's just a suggestion");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was schwarze stoff");
talkEntry:addTrigger("erzähl etwas schwarze stoff");
talkEntry:addTrigger("erzähl über schwarze stoff");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Hm, mal sehen. Es ist einfach nur Stoff. Du könntest damit dein hübsches Gesicht verstecken, aber wem sollte daran gelgen sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste bolzen");
talkEntry:addTrigger("preis bolzen");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Für dich, jeweils 4 Kupferstücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost crossbow bolt");
talkEntry:addTrigger("price crossbow bolt");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w For you, 4 copperpieces each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) bolzen");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*4); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Ich mag es mit dir Geschäfte zu machen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*4); end));
talkEntry:addConsequence(npc.base.consequence.item.item(237, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf bolzen");
talkEntry:addCondition(npc.base.condition.money.money("=>", 4));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 4 Münzen."));
talkEntry:addResponse("Es ist mir ein vergnügen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 4));
talkEntry:addConsequence(npc.base.consequence.item.item(237, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf bolzen");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Lieber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf bolzen");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Liebes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) crossbow bolt");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*4); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Pleasure doing buisiness with you");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*4); end));
talkEntry:addConsequence(npc.base.consequence.item.item(237, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy crossbow bolt");
talkEntry:addCondition(npc.base.condition.money.money("=>", 4));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 4 coins."));
talkEntry:addResponse("My Pleasure.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 4));
talkEntry:addConsequence(npc.base.consequence.item.item(237, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy crossbow bolt");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Sorry sweetie, you havn't enough coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something crossbow bolt");
talkEntry:addTrigger("tell about crossbow bolt");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Yeah,they make really big holes! But it's difficult to acquire a good crossbow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was bolzen");
talkEntry:addTrigger("erzähl etwas bolzen");
talkEntry:addTrigger("erzähl über bolzen");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Oh, ja die machen wirklich große Löcher! Es ist nur nicht einfach eine gute Armbrust zu finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("armbrust");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Es tut mir schrecklich Leid, aber ich habe kein Ahnung wo du soetwas bekommen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("crossbow");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w I'm really sorry, but I have no idea where to find such a thing. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste wurfstern");
talkEntry:addTrigger("preis wurfstern");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Für dich, jeweils 5 Kupferstücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost throwing star");
talkEntry:addTrigger("price throwing star");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w For you, 5 copperpieces each.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) wurfstern");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*5); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Ich mag es mit dir Geschäfte zu machen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*5); end));
talkEntry:addConsequence(npc.base.consequence.item.item(294, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf wurfstern");
talkEntry:addCondition(npc.base.condition.money.money("=>", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 5 Münzen."));
talkEntry:addResponse("Es ist mir ein vergnügen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 5));
talkEntry:addConsequence(npc.base.consequence.item.item(294, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf wurfstern");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Lieber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf wurfstern");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Du hast nicht genug Münzen dafür, Liebes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) throwing star");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*5); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Pleasure doing buisiness with you.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*5); end));
talkEntry:addConsequence(npc.base.consequence.item.item(294, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy throwing star");
talkEntry:addCondition(npc.base.condition.money.money("=>", 5));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 5 coins."));
talkEntry:addResponse("My pleasure.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 5));
talkEntry:addConsequence(npc.base.consequence.item.item(294, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy throwing star");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Sorry darling, you havn't enough coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something throwing star");
talkEntry:addTrigger("tell about throwing star");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Very impressive little things! Assumed you know how to throw them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was wurfstern");
talkEntry:addTrigger("erzähl etwas wurfstern");
talkEntry:addTrigger("erzähl über wurfstern");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("#w Die machen ordentlich Eindruck, vorrausgesetzt man kann damit umgehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste s[äae]bel");
talkEntry:addTrigger("preis s[äae]bel");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Arr! 540 Kupferlinge, du drreckiger Seehund! Und kein Stück wenigerrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was koste saebel");
talkEntry:addTrigger("preis saebel");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Arr! 540 Kupferlinge, du drreckiger Seehund! Und kein Stück wenigerrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what cost sabre");
talkEntry:addTrigger("price sabre");
talkEntry:addTrigger("what cost saber");
talkEntry:addTrigger("price saber");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Arr! 540 coppers, you scummy seadog! And not one piece fewer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf (%d+) saebel");
talkEntry:addTrigger("kauf (%d+) s[äae]bel");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*540); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr einige Münzen."));
talkEntry:addResponse("Arr, das freuhet mich!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*540); end));
talkEntry:addConsequence(npc.base.consequence.item.item(25, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf saebel");
talkEntry:addTrigger("kauf s[äae]bel");
talkEntry:addCondition(npc.base.condition.money.money("=>", 540));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Als ihr euch daraufhin die Hand schüttelt übergibst du ihr 540 Münzen."));
talkEntry:addResponse("Hier du Landratte! Arr!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 540));
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf saebel");
talkEntry:addTrigger("kauf s[äae]bel");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Arr, soviel Münzen haste garr, nicht! Penner!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy (%d+) saber");
talkEntry:addTrigger("buy (%d+) sabre");
talkEntry:addCondition(npc.base.condition.money.money("=>", function(number) return (number*540); end));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering some coins."));
talkEntry:addResponse("Arr! Me Pleasure!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", function(number) return (number*540); end));
talkEntry:addConsequence(npc.base.consequence.item.item(25, "%NUMBER", 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy sabre");
talkEntry:addTrigger("buy saber");
talkEntry:addCondition(npc.base.condition.money.money("=>", 540));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Afterward you shake her offered hand, delivering 540 coins."));
talkEntry:addResponse("Here you go, lubber! Arr!");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 540));
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 599, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy sabre");
talkEntry:addTrigger("buy saber");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Where arrr the coppers to pay for that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something sabre");
talkEntry:addTrigger("tell about sabre");
talkEntry:addTrigger("tell something saber");
talkEntry:addTrigger("tell about saber");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("You arrr a pirate? Take that, lubber! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was einfache dolch");
talkEntry:addTrigger("erzähl etwas einfache dolch");
talkEntry:addTrigger("erzähl über einfache dolch");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Bist n' Pirat? Nimm das, Landrrratte! Arr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gesellschaft");
talkEntry:addResponse("Du möchtest das ich dir Gesellschaft leiste?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("compan");
talkEntry:addResponse("Do you want me to keep you company?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addTrigger("deine aufgabe");
talkEntry:addTrigger("eure aufgabe");
talkEntry:addTrigger("t[äae]+tigkeit");
talkEntry:addTrigger("was tust du");
talkEntry:addTrigger("was tut ihr");
talkEntry:addResponse("Ich bin Näherin. Hast du Löcher in deinen Socken die ich stopfen soll?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addTrigger("what you do");
talkEntry:addTrigger("occupation");
talkEntry:addResponse("I'm a seamstress. Do you have holes in your socks which I can help with?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("warenliste");
talkEntry:addResponse("Ich verkaufe meine Gesellschaft, Schätzchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("list wares");
talkEntry:addResponse("I sell my company, sweety!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("frühstück");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Klar, hab ich ein Frühstück für dich Süßer. Was solls denn sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("frühstück");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Klar, hab ich ein Frühstück für dich Schätzchen. Was solls denn sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("breakfast");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Sure, I'll prepare a good breakfast for you, my dear. What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("warenliste");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Ich verkaufe Frühstück und alles was du sonst noch brauchen könntest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("list wares");
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("I sell breakfast, and some other things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Fein, ich will aber 250 Kupfermünzen dafür haben. In Ordnung?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Great, But you have to give me 250 coppercoins?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Gut, komm wieder falls du doch noch möchtest.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("Allright, come again if you change your mind.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Nein? Was soll das heißen? Du kommst dir wohl zu fein für meine Gesellschaft vor!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("No? What are you trying to say? I'm not good enough for you?!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addCondition(npc.base.condition.money.money("=>", 250));
talkEntry:addResponse("Fantastisch, komm wir suchen uns ein ruhiges Plätzchen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 250));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addCondition(npc.base.condition.money.money("=>", 250));
talkEntry:addResponse("Awesome, come on, lets go somewhere more... quiet.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 250));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Schätzchen, du hast ja gar nicht geügend Münzen. Geh schnell welche hohlen, ich warte auf dich!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("Sorry sweetheart, you havn't enough coins. Go fetch them, I'll wait for you!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Fein und weil ich dich gern hab will ich nur 200 Kupfermünzen dafür haben. In Ordnung?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addResponse("Great, its just 200 coppercoins. A special price for my honey!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.money.money("=>", 200));
talkEntry:addResponse("Fantastisch, komm wir suchen uns ein ruhiges Plätzchen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addCondition(npc.base.condition.money.money("=>", 200));
talkEntry:addResponse("Awesome, lets go somewhere more quiet.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Schätzchen, du hast ja gar nicht geügend Münzen. Geh schnell welche hohlen, ich warte auf dich!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Sweetie, you havn't enough coins. Go get them, I'll wait for you!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("Nein? Was soll das heißen? Du kommst dir wohl zu fein für meine Gesellschaft vor!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("No? What are you trying to say? Do you think I'm not good enough for you?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("was kauft");
talkEntry:addTrigger("was kaufst");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addResponse("#w Für deine 'Wahre' musst du einen professionellen 'Händler' finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("what buy");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addResponse("#w you have to find a professional 'trader' to sell your 'goods'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("#w Do you think, you have the ability to 'find' an item which is already in someone else's possession?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("#w Denkst du, du kannst nach einem Gegenstand suchen der im Momment einer anderen Person gehört?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("Don't worry, I'll find someone else");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("In Ordnung, dann muss ich mir jemand anderen dafür suchen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("#w Allright, listen to me. I'm searching a special necklace. It's a heirloom of my family. My stupid brother sold it to a merchant. You should bring it back to me. Ask me for 'information' if you need me to repeat it for you.  Search the mearchant in Varshikar. His name is Gilbert. Do not listen to him, he will just lie to you. Well, good luck, I am waiting for you.");
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("#w In Ordnung, hör zu. Ich suche ein besonderes Kollier. Es ist ein Erbstück meiner Familie, aber mein Bruder hat es einem Händler verkauft. Kannst du es bitte zurückbringen? Frage mich wenn nach 'Informationen' wenn ich die Details wiederholen soll.   Suche den Händler in Varshikar, sein Name ist Gilbert. Am Besten hörst du ihm gar nicht zu was er sagt, er würde dich nur belügen. Viel Glück! Ich warte hier auf dich.");
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("I'll ask someone else");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addResponse("In Ordnung, dann muss ich mir jemand anderen dafür suchen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#w Allright, listen to me. I'm searching for a special necklace. It's a heirloom of my family. My stupid brother sold it to a merchant. You should bring it back to me. Search the mearchant in Varshikar. His name is Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addResponse("#w Allright, listen to me. I'm searching for a special necklace. It's a heirloom of my family. My stupid brother sold it to a merchant. You should bring it back to me. Search the mearchant in Varshikar. His name is Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addResponse("#w In Ordnung, hör zu. Ich suche ein besonderes Kollier. Es ist ein Erbstück meiner Familie, aber mein Bruder hat es einem Händler verkauft. Kannst du es bitte zurückbringen? Suche den Händler in Varshikar, sein Name ist Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#w In Ordnung, hör zu. Ich suche ein besonderes Kollier. Es ist ein Erbstück meiner Familie, aber mein Bruder hat es einem Händler verkauft. Kannst du es bitte zurückbringen? Suche den Händler in Varshikar, sein Name ist Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you 100 coppercoins. It feels good, doesn't it?"));
talkEntry:addResponse("Oh, that's amazing! You really found it! This to compensate you for your effort.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie bezahlt dir 100 Kupferlinge. Das fühlt sich gut an, oder?"));
talkEntry:addResponse("Oh wie fantastisch! Du hast es wirklich gefunden! Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes? You found it? Amazing... but hey where is it? You havn't the necklace with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja? Du hast es gefunden? Fantastisch... aber wo hast du's? Du hast das Kollier nicht bei dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you 100 coppercoins. It feels good, right?"));
talkEntry:addResponse("Oh, that's amazing! You really found it! This to compensate you for your effort.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie bezahlt dir 100 Kupferlinge. Das fühlt sich gut an, oder?"));
talkEntry:addResponse("Oh wie fantastisch! Du hast es wirklich gefunden! Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("Yes? You found it? Amazing... but hey where is it? Bring it with you next time");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addResponse("Ja? Du hast es gefunden? Fantastisch... aber wo hast du's? Du hast das Kollier nicht bei dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Put the necklet into your belt, when you are willing to give it Rose."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=>", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Lege das Amuelett in deinen Gürtel, um es Rose zu geben."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Put the necklet into your belt, when you are willing to give it Rose."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Lege das Amuelett in deinen Gürtel, um es Rose zu geben."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addResponse("#w Oh ja, jetzt müssen wir dafür sorgen, dass Gilbert nicht auf falsche Ideen kommt. Kannst du diese Fälschung in seine Tasche stecken, ohne dass er es bemerkt?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#w Oh ja, jetzt müssen wir dafür sorgen, dass Gilbert nicht auf falsche Ideen kommt. Kannst du diese Fälschung in seine Tasche stecken, ohne dass er es bemerkt?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addResponse("#w Hmm, now we have to take care, that Gilbert doesn't get false ideas. Could you place this fake into his bag without getting caught?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#w Hmm, now we have to care, taht Gilbert don't get false ideas. Could you place this fake into his bag without getting caught?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Darinn findest du ein Kollier."));
talkEntry:addResponse("#w Großartig, nimm dieses gefälschte Kollier und schiebe es umbermerkt in Gilberts Tasche. Er wird den Trick nicht bemerken. Frage mich wenn nach 'Infromationen' wenn ich die Details wiederholen soll.");
talkEntry:addConsequence(npc.base.consequence.item.item(222, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addResponse("In Ordnung, dann muss ich mir jemand anderen dafür suchen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Inside you are able to feel a necklace."));
talkEntry:addResponse("#w Awesome, take this fake necklace and put it unnoticed into Gilbert's bag. He shouldn't notice any difference. Ask me for 'information' if I should repeat the details.");
talkEntry:addConsequence(npc.base.consequence.item.item(222, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.state.state("=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addResponse("Allrigth, so I have to ask another one.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#w Allright, listen to me. Take the fake necklace and put it unnoticed into Gilbert's bag, who stays at Varshikar. He will not realise what happened");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addResponse("#w Allright, listen to me. Take the fake necklace and put it unnoticed into Gilbert's bag, who stays at Varshikar. He will not realise what happened.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addResponse("#w In Ordnung, hör zu. Nimm dieses gefälschte Kollier, gehe nach Varshikar und schiebe es umbermerkt in Gilberts Tasche. Er wird den Trick nicht bemerken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#w In Ordnung, hör zu. Nimm dieses gefälschte Kollier, gehe nach Varshikar und schiebe es umbermerkt in Gilberts Tasche. Er wird den Trick nicht bemerken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you again 100 coppercoins. It feels also feels good, right?"));
talkEntry:addResponse("Great work, Gilbert hasn't noticed. So he's never going to start searching for the necklace. This to compensate you for your effort!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you again 100 coppercoins. It feels also feels good, right?"));
talkEntry:addResponse("Great work, Gilbert hasn't noticed. So he's never going to start searching for the necklace. This to compensate you for your effort!!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you again 100 coppercoins. It feels again good, agree?"));
talkEntry:addResponse("Gut gemacht! Gilbert hat unseren Trick nicht bemerkt. Jetzt wird er erst gar nicht anfangen nach dem Kollie zu suchen. Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie bezahlt dir abermals 100 Kupferlinge. Das fühlt sich abermals gut an, oder?"));
talkEntry:addResponse("Gut gemacht! Gilbert hat unseren Trick nicht bemerkt. Jetzt wird er erst gar nicht anfangen nach dem Kollie zu suchen. Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, you should remember this name. Maybe you'll meet him someday."));
talkEntry:addResponse("I'm sorry my dear, I havn't any more tasks for you. A lot of thanks for helping with the necklace. But if you really need a job, why you don't ask the Gibberson for it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, you should remember this name. Maybe you'll meet him someday."));
talkEntry:addResponse("I'm sorry my dear, I havn't any more tasks for you. A lot of thanks for helping with the necklace. But if you really need a job, why you don't ask the Gibberson for it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, den Namen solltest du dir merken. Vielleicht triffst du diese Person eines Tages."));
talkEntry:addResponse("Es tut mir Leid mein Schatz, ich habe keine weiteren Aufgaben für dich. Danke für die Hilfe mit dem Kollier. Aber wenn du so unbedingt Geld brauchst, warum fragst du dann nicht den Gibberson?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, den Namen solltest du dir merken. Vielleicht triffst du diese Person eines Tages."));
talkEntry:addResponse("Es tut mir Leid mein Schatz, ich habe keine weiteren Aufgaben für dich. Danke für die Hilfe mit dem Kollier. Aber wenn du so unbedingt Geld brauchst, warum fragst du dann nicht den Gibberson?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("what buy");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should ask more 'Rose' more about the quest."));
talkEntry:addResponse("#w you have to find a professional 'trader' to sell your 'goods'. But I could offer you a quest if you are in need of money?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("was kauft");
talkEntry:addTrigger("was kaufst");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vielleicht solltest du 'Rose' über die Aufgabe befragen."));
talkEntry:addResponse("#w Für deine 'Wahre' musst du einen professionellen 'Händler' finden, aber ich hätte eine Aufgabe für dich wenn du dir etwas verdienen möchtest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#w Möchtest du etwas Geld verdienen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addResponse("#w Möchtest du etwas Geld verdienen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#w Do you want to earn some money?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addCondition(npc.base.condition.state.state("<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addResponse("#w Do you want to earn some money?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.queststatus(303, "=", 1));
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
talkEntry:addResponse("Grüß dich, ich bin die Näherin %NPCNAME.");
talkEntry:addResponse("#me zwinkert dich verführerisch an.");
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
talkEntry:addResponse("Be greeted, I'm seamstress %NPCNAME.");
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
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Greets.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted.");
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
talkEntry:addResponse("Hallo.");
talkEntry:addResponse("Grüße.");
talkEntry:addResponse("Guten Tag.");
talkEntry:addResponse("Gruß.");
talkEntry:addResponse("Seid gegrüßt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich bin die Näherin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("näherin");
talkEntry:addResponse("Ich leiste den Leuten Gesellschaft, wenn sie das wollen. Diskretion, ist bei mir natürlich oberstes Gebot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seamstress");
talkEntry:addResponse("If you like I can keep you company. Of course I'll be completly discreet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nähen");
talkEntry:addResponse("Das musst du wohl selbst herausfinden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sewing");
talkEntry:addResponse("You have to find this on your own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rose");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja, so heiß ich. Empfehle meine Gesellschaft weiter!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rose");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, thats my Name. Recommend my company to others!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("socke");
talkEntry:addResponse("Socken zieht man über den Fuß damit man keine kalten Zechen bekommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sock");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Socks, wear it to avoid cold feet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("loch");
talkEntry:addResponse("Was soll ich dazu sagen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hole");
talkEntry:addResponse(" What should I say now?");
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
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir");
talkEntry:addResponse("You're leaving? I'll miss you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir");
talkEntry:addResponse("Mach's gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir");
talkEntry:addResponse("You leave? I'll miss you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("auf bald");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir.");
talkEntry:addResponse("Mach's gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine.");
talkEntry:addResponse("Great, and you?");
talkEntry:addResponse("Pfff!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Pfff!");
talkEntry:addResponse("Danke, gut.");
talkEntry:addResponse("Ja, ja, und dir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm seamstress %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Nett dich kennen zu lernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elfe");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ach, ich weiß eigentlich wenig von Elfen. Warum erzählst du nicht einfach über dich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addCondition(npc.base.condition.race.race(3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, I know very little about elves. Could you tell me something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elfe");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me kichert 'Du würdest nicht glauben was ich über Elfen erzählen könnte.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elf");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me giggles. 'You wouln't belive what I could tell you about them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mensch");
talkEntry:addCondition(npc.base.condition.race.race(0));
talkEntry:addResponse("Menschen, so wie du und ich, verstehst du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addCondition(npc.base.condition.race.race(0));
talkEntry:addResponse("Humans, like you and me, allright?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mensch");
talkEntry:addResponse("Also ich bin abgesehen von meiner überragenden Klug-und Schönheit, ein ganz durchschnittlicher Mensch");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addResponse("I'm an average human, apart from my awesome cleverness and beauty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addCondition(npc.base.condition.race.race(1));
talkEntry:addResponse("Wenn du meine Gesellschaft möchtest musst du deine Kettenhosen aber ausziehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addCondition(npc.base.condition.race.race(1));
talkEntry:addResponse("If you want my company you have to pull down your chain trousers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("#me grinst. 'Du weißt ja was man über Zwerge sagt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addResponse("#me grinses. 'Sure, you know what they say about dwarfs.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addResponse("I your woman if coin! You not make me 'smack-smack'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addCondition(npc.base.condition.race.race(4));
talkEntry:addResponse("Ich dein Frau, wenn Münze! Du mich nicht machen 'happa-happa'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Weißt du was man über Zwerge sagt? Bei Orks stimmt es.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Do you know waht they say about dwarves? With orcs is it the truth!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fee");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Feen sind sehr mysteriös, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fairy");
talkEntry:addResponse("Fairies are very mysterious, do you agree?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pixie");
talkEntry:addResponse("Pixies are very mysterious, don't you agree?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gnom");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gnome zahlen mir meistens eine 'zusätzliche Gebühr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gnome");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gnomes pay mostly a 'supplemental fee' to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("goblin");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Goblins brauchen immer eine, äh... besondere Behandlung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("goblin");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Goblins allways need, uhm.. speacial treatment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("echse");
talkEntry:addResponse("Kennst du die Geschichten in denen der Held mit einer riesigen Schlange kämpfen muss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addResponse("Do you know the stories, where the hero has to fight a giant snake?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("half[l ]ing");
talkEntry:addCondition(npc.base.condition.race.race(2));
talkEntry:addResponse("We have to wash your feet before we begin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbling");
talkEntry:addCondition(npc.base.condition.race.race(2));
talkEntry:addResponse("Deine Füße werden wir aber waschen, bevor es losgeht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbling");
talkEntry:addResponse("Halblinge, manche überraschen andere weniger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halfi[l ]ng");
talkEntry:addResponse("Halfings, some suprise and other don't.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Ronagan is the god, who takes care of people like me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gott");
talkEntry:addResponse("Ronagan kümmert sich um Leute wie mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ushara ist die Göttin der Erde. Gibt nicht viele die sie verehren glaub ich. Nur ein paar Druiden und Elfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Br[áàa]gon");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Brágon ist der Gott des Feuers. Er hat Illarion vor langer Zeit schon verlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Eldan ist der Gott des Geistes. Die meisten seiner Anhänger sind Magier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tanora ist die Göttin des Wassers. Die Echsenmenschen verehren sie. Bei ihnen ist sie als Zelphia bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Zelphia ist der Name von Tanora, der bei den Echsenmenschen üblich ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Findari ist die Göttin der Luft. Barden sollen sie verehren hab ich gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Narg[úùu]n");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nargún ist der Gott des Chaos. Die die ihn verehren sind ausschlieslich irgendwelche Spinner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Elara ist die Göttin des Wissens und der Weisheit. Viele Gelehrte beten sie an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Adron ist der Gott des Weines und der Feste. Wenn man von einem Gott eine volle Taverne erbitten will, dann von Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oldra ist die Göttin der Fruchtbarkeit und des Lebens. Viele Bauern beten sie an, die Halblinge besonders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Cherga ist die Göttin der Geister. Sie sorgt dafür das die Seele in die Nächste Welt kommt, wenn man diese hier verlässt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Malachin ist der Gott der Jagd. Die Graue Rose die ihre Burg im Norden von Trollsbane hat, hat sich dem Glauben an ihm verschrieben. Dort erfahrt ihr sicher mehr über Malachin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Irmorom ist der Gott des Handwerks. Die Zwerge beten ihn an und können dir sicher alles über ihn erzählen, wenn wir du paar Krüge Bier ausgiebst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Sirani ist die Göttin der Liebe und der Freude. Wenn ihr mehr über sie wissen wollt, solltet ihr eine Sirani Priesterin suchen. Sie kann euch sicher sehr genau zeigen was es bedeutet Sirani anzubeten. Sehr genau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Sirani ist die Göttin der Liebe und der Freude. Wenn ihr mehr über sie wissen wollt, solltet ihr eine Sirani Priesterin suchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Zhambra ist der Gott der Freundschaft und Treue. Zhrambra Anhänger sind meistens die verlässligsten Freunde die man finden kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ronagan ist der Gott der Diebe und Schatten. Viele die im Schatten der Gesellschaft leben beten zu ihm, wie ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Moshran ist der Blut Gott. Der ist böse. Durch und durch. Genau wie seine Anhänger. Mit denen sollte man sich nicht einlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ushara is the goddess of earth. There are not many who pray to her. Only some druids and elves");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Br[áàa]gon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Brágon is the god of fire. He left Illarion a long time ago.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Eldan is the god of spirit. Most of his followers are mages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tanora is the goddess of water. The lizards pray to her. They call her Zelphia.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Zelphia is the Name of Tanora the lizards use.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Findari is the goddess of air. Her followers are bards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Narg[úùu]n");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nargún is the god of chaos. Those who follow him are mad. All of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elara is the goddess of knowledge and wisdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Adron is the god of wine and festivals. Owners of Taverns follow him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oldra is the goddess of life. Many halflings follow her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cherga is the goddess of death. She takes care that your soul travels safely into the next world. After your life ends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Malachin is the god of hunting. The Grey Rose who live in the castle north of Trollsbane follow him. There you get more information about Malachin for sure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Irmorom is the god of the crafts. The dwarfs follow him and can tell you everything about him if you give them some beer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Sirani is the godness of love and joy. If you want to know more about her you should search a Sirani Priestess. She can show you very exactly what is means to follow Sirani. Very exactly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Sirani is the godness of love and joy. If you want to know more about her you should search a Sirani Priestess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Zhambra is the god of friendship. Followers of Zhambras are the best friends you can find.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ronagan is the god of the thieves and shadows. Most people who like living in the shadows of life pray to him, like me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Moshran is the blood god. He is evil. Really evily evil. As his followers are. Do not trust any of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eagle");
talkEntry:addResponse("Do You think I'm a fool? Thats just a stupid bird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("adler");
talkEntry:addResponse("Hältst du mich für Blöd? Das ist nur so ein dummer Vogel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hawk");
talkEntry:addResponse("Do YOu think I'm a fool? Thats just a stupid bird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("falke");
talkEntry:addResponse("Hältst du mich für Blöd? Das ist nur so dummer ein Vogel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mouse");
talkEntry:addResponse("Here are mice like grass on a meadow. Or they are rats?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("m[aä]us");
talkEntry:addResponse("Mäuse gibt's hier genügend. Oder sind das Ratten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("maulw[üu]rf");
talkEntry:addResponse("Bin ich ein Bauer oder wie? Keine Ahnung!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mole");
talkEntry:addResponse("Am I a farmer or what? No Idea!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hase");
talkEntry:addResponse("Sie sin sooo süß! Hey, was isst du da?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rabbit");
talkEntry:addResponse("They are sooo cute! Ey, what are you eating there?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me chukles heavily.'Murgo? This point is a professional secret.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me kichert hefitg.'Murgo? Das fällt unter Berufsgeheimnis.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bruder");
talkEntry:addResponse("Ja, mein Bruder ist ja so einfältig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brother");
talkEntry:addResponse("Yes, my brother is a fool.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gilbert");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse(" Gilbert ist in Varshikar zu finden, denke ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gilbert");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gilbert lives at Varshikar, I think.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibb");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gibb Gibberson. Er besucht mich regelmäßig. Er lebt vermutlich irgendwo in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibberson");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Gibb Gibberson. Er besucht mich regelmäßig. Er lebt vermutlich irgendwo in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gibb Gibberson. He often looks for me. I guess he lives somwhere in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gibberson");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gibb Gibberson. He often looks for me. I guess he lives somwhere in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Otto");
talkEntry:addTrigger("Martin");
talkEntry:addTrigger("Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Huch! Ich dachte er wollte nicht das es jemand weiß?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Otto");
talkEntry:addTrigger("Martin");
talkEntry:addTrigger("Sauerteig");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Huu! I thought doesn't want anyone to know");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("npc");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich bin kein NPC. Du bist der NPC! Ha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("npc");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm not a NPC. You are the NPC! Ha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Frage bei mir nach 'Gesellaschft','Beruf' oder 'Abenteuer', antworte eventuell mir mit 'ja' oder 'nein'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Frage bei mir nach 'Gesellaschft','Beruf' oder 'Abenteuer', antworte eventuell mir mit 'ja' oder 'nein'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("Ask me about 'company','profession' or 'adventure', answering with 'yes' or 'no'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kichert hinter vorgehaltener Hand.", "#me giggles behind her hand.");
talkingNPC:addCycleText("#me kratzt sich kurz zwischen den Beinen.", "#me has a quick scratch between her legs.");
talkingNPC:addCycleText("Lust auf etwas Gesellschaft, Schätzchen?", "Would you like some company, my darling?");
talkingNPC:addCycleText("Hei! Süschen!", "Hey sweety!");
talkingNPC:addCycleText("#me schnalzt verführerisch mit der Zunge.", "#me clicks on her tounge in alluring way.");
talkingNPC:addCycleText("#me hebt ihre Augenbrauen und gurrt in deine Richtung", "#me raises her brows and purrs in your direction.");
talkingNPC:addCycleText("#me zwinkert dir zu und leckt sich langsam über ihre Lippen.", "#me winks at you and licks slowly over her lips.");
talkingNPC:addCycleText("#me streckt ein Bein nach vorne und hebt ganz langsam un dmit beadacht den saum ihres Rockes ein wenig an, so das man ihr Knie zu sehen ist.", "Hey sweety!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Eine leicht bekleidete hübsche Frau, die dich verführerisch anzwinkert als sie deinen Blick bemerkt.", "A sexy dressed and pretty woman. As she notices your gaze, she winks seductively at you.");
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