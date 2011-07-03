--------------------------------------------------------------------------------
-- NPC Name: Marcus                                                      None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  -61, -134, 0           --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, -61, -134, 0, 2, 'Marcus', 'npc.marcus', 0, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.condition.state")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.marcus", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Der Hafen ist im Süden von Trollsbane");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]*r");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("The harbour is in the south of Trollsbane");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Im Augenblick habe ich nichts für euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Currently i have nothing to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auftrag");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Im Augenblick habe ich nichts für euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deine aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ihr habt mir schon genug geholfen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ihr habt mir schon genug geholfen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ihr habt mir schon genug geholfen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tust du");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler. Also handle ich. Aber im Augenblick kann ich euch nichts anbieten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tut ihr");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler. Also handle ich. Aber im Augenblick kann ich euch nichts anbieten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was macht ihr");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler. Also handle ich. Aber im Augenblick kann ich euch nichts anbieten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was machst du");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler. Also handle ich. Aber im Augenblick kann ich euch nichts anbieten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Im Augenblick habe ich nichts für euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Currently i have nothing to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("neu");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("So neu seit ihr nun auch wieder nicht. Immerhin habt ihr mir schon gut geholfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I[ a']+m new");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("You aren't that new. You helped me alot allready.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("newbie");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("You aren't that new. You helped me alot allready.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Im Augenblick habe ich nichts für euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Currently i have nothing to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("t[äae]+tigkeit");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("Ich bin Händler. Also handle ich. Aber im Augenblick kann ich euch nichts anbieten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 20));
talkEntry:addResponse("I'm a trader");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lieferung");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addResponse("Ah. Du hast den Schinken. Hat ganz schön lange gedauert. Hier hast du 3 Silberstücke.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lieferung");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addResponse("Das ist aber nicht der ganze Schinken. Wo ist der Rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lieferung");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Na wo ist denn der Schinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addResponse("Ah. Du hast den Schinken. Hat ganz schön lange gedauert. Hier hast du 3 Silberstücke.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addResponse("Das ist aber nicht der ganze Schinken. Wo ist der Rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Na wo ist denn der Schinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addResponse("Ah. Du hast den Schinken. Hat ganz schön lange gedauert. Hier hast du 3 Silberstücke.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addResponse("Das ist aber nicht der ganze Schinken. Wo ist der Rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Na wo ist denn der Schinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ah. Du hast den Schinken. Hat ganz schön lange gedauert. Hier hast du 3 Silberstücke.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ist aber nicht der ganze Schinken. Wo ist der Rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Na wo ist denn der Schinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ah. Du hast den Schinken. Hat ganz schön lange gedauert. Hier hast du 3 Silberstücke.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ist aber nicht der ganze Schinken. Wo ist der Rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Na wo ist denn der Schinken?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("delivery");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addResponse("Ah. You got the ham. Took a long time. Here, take that 3 silvercoins.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("delivery");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addResponse("That is not all the ham. Where is the rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("delivery");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Now where is my ham?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addResponse("Ah. You got the ham. Took a long time. Here, take that 3 silvercoins.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addResponse("That is not all the ham. Where is the rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Now where is my ham?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah. You got the ham. Took a long time. Here, take that 3 silvercoins.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That is not all the ham. Where is the rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Now where is my ham?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah. You got the ham. Took a long time. Here, take that 3 silvercoins.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 300));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(306, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.item.item(306, "all", "=>", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That is not all the ham. Where is the rest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Now where is my ham?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dieb");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Dieb? Ein Dieb hat meinen Schinken?!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Räuber");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Räuber? Ein Räuber hat meinen Schinken?!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Dann such den Dieb und hol den Schinken!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Wer hat den Schinken dann?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gestohlen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Ich brauch diesen Schinken unbedingt! Ihr müsst den Schinken finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schinken");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Ich habe den Schinken noch nicht bekommen. Und wenn Nicolas ihn nicht hat... wer hat ihn dann?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thief");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Thief? A thief has my ham?!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("Then search the thief and get the ham!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("So where is the ham then?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stolen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("I need that ham! You have to find it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ham");
talkEntry:addCondition(npc.base.condition.quest.quest(557, "=>", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(557, "<", 20));
talkEntry:addResponse("I didn't got the ham. And if Nicolas does not have it. Who has it then?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ja. Der Hafen. Geht einfach zum Westtor aus der Stadt hinaus und folgt der Straße nach Süden. Ihr kommt an der Farmers Union vorbei und dann zum Hafen wo meine Lieferung wartet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]*r");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Yes. The harbour. Leave Trollsbane thougth the west gate and follow the street south. Then you pass by the Farmers Union and then you come to the harbour where my delivery waits.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe euch doch schon gesagt was zu tun ist. Geht zum Hafen und holt die Lieferung Schinken für mich ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I told you already what you have to do. Go to the harbour and get the delivery of ham for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auftrag");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich habe euch doch schon gesagt was zu tun ist. Geht zum Hafen und holt die Lieferung Schinken für mich ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich bin Händler. Habt ihr den Auftrag den ich euch gegeben habe schon erledigt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deine aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich bin Händler. Das sollte meine Aufgabe genug beschreiben. Wann erledigt ihr die Aufgabe die ich euch gab?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich bin Händler. Das sollte meine Aufgabe genug beschreiben. Wann erledigt ihr die Aufgabe die ich euch gab?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Wenn ihr zum Hafen gehen würdet und die Lieferung holt wäre mit genug geholfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Wenn ihr zum Hafen gehen würdet und die Lieferung holt wäre mit genug geholfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("If you would go to the harbour and get my delivery everything would be good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tust du");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich warte auf eine Lieferung. Habt ihr sie schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tut ihr");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich warte auf eine Lieferung. Habt ihr sie schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was macht ihr");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich warte auf eine Lieferung. Habt ihr sie schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was machst du");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich warte auf eine Lieferung. Habt ihr sie schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe euch schon gesagt was ihr tun sollt. Habt ihr die Lieferung vom Hafen schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I told you already what to do. Did you got the delivery from the harbour already?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("neu");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Schön und gut. Ihr habt doch jetzt etwas zu tun. Holt bitte die Lieferung vom Hafen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I[ a']+m new");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("I see, I see. But you know what you have to do. Go to the harbour and get the delivery.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("newbie");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("I see, I see. But you know what you have to do. Go to the harbour and get the delivery.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe euch schon gesagt was ihr tun sollt. Habt ihr die Lieferung vom Hafen schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I told you already what to do. Did you got the delivery from the harbour already?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("t[äae]+tigkeit");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("Ich habe euch schon gesagt was ihr tun sollt. Habt ihr die Lieferung vom Hafen schon geholt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(557, ">", 0));
talkEntry:addResponse("I wait for a delivery. Did you got it allready?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hafen");
talkEntry:addResponse("Der Hafen ist südlich von Trollsbane. Am Wasser. Wo wir davon reden. Ich hätte etwas für euch zu tun. Interesse?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harbo[u]*r");
talkEntry:addResponse("The harbour is in the south of Trollsbane. At the sea. While we talk about it. I have a small job for you. Are you interested?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja. Ich hätte etwas für euch zu tun. Es geht darum eine kleine Lieferung Schinken vom Hafen zu holen. Habt ihr Interesse das zu erledigen. Ich werde euch dafür Entlohnen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yeah. I have something to do for you. You would have to get a small delivery of ham from the harbour. Are you interested? I will pay you.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auftrag");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ja. Ich hätte etwas für euch zu tun. Es geht darum eine kleine Lieferung Schinken vom Hafen zu holen. Habt ihr Interesse das zu erledigen. Ich werde euch dafür Entlohnen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ja. Ich hätte etwas für euch zu tun. Es geht darum eine kleine Lieferung Schinken vom Hafen zu holen. Habt ihr Interesse das zu erledigen. Ich werde euch dafür Entlohnen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich bin Händler. Leider kann ich im Moment nichts anbieten. Ich erwarte eine Lieferung. Vielleicht könnt ihr mir bei einer kleinen Sache helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deine aufgabe");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich bin Händler. Das sollte meine Aufgabe genug beschreiben. Allerdings hätte ich eine kleine Aufgabe für euch. Interesse?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich bin Händler. Das sollte meine Aufgabe genug beschreiben. Allerdings hätte ich eine kleine Aufgabe für euch. Interesse?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ihr könnt mir in der Tat helfen. Ich benötige eine Lieferung vom Hafen. Wollt ihr mir helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ihr könnt mir in der Tat helfen. Ich benötige eine Lieferung vom Hafen. Wollt ihr mir helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("I could need some help indeed. I need a delivery from the harbour. Would you like to help me?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich hätte in der Tat etwas für euch zu tun. Es geht um eine Lieferung Schinken die ihr vom Hafen abholten müsstet. Wollt ihr mir dabei helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I would have some work for you. Its about getting a delivery from the harbor and take it to me. Would you do this for me?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("neu");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ah. Ihr seit neu hier. Da habt ihr doch bestimmt Interesse mir bei einer kleinen Angelegenheit zu helfen, oder?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I[ a']+m new");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ah. You are new around here. Then you are intressted in helping for sure, aren't you?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("newbie");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ah. You are new around here. Then you are intressted in helping for sure, aren't you?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich hätte in der Tat etwas für euch zu tun. Es geht um eine Lieferung Schinken die ihr vom Hafen abholten müsstet. Wollt ihr mir dabei helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I would have some work for you. Its about getting a delivery from the harbor and take it to me. Would you do this for me?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("t[äae]+tigkeit");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich bin Händler. Leider kann ich im Moment nichts anbieten. Ich erwarte eine Lieferung. Vielleicht könnt ihr mir bei einer kleinen Sache helfen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tust du");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich warte auf eine Lieferung. Hättet ihr Interesse für mich eine Lieferung Schinken vom Hafen abzuholen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was tut ihr");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich warte auf eine Lieferung. Hättet ihr Interesse für mich eine Lieferung Schinken vom Hafen abzuholen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was machst du");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich warte auf eine Lieferung. Hättet ihr Interesse für mich eine Lieferung Schinken vom Hafen abzuholen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was macht ihr");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("Ich warte auf eine Lieferung. Hättet ihr Interesse für mich eine Lieferung Schinken vom Hafen abzuholen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what do you do");
talkEntry:addCondition(npc.base.condition.state.state("~=", 1));
talkEntry:addResponse("I wait for a delivery. Are you intressted in getting this delivery of ham from the harbour?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Ihr nehmt den Auftrag an ohne zu wissen worum es geht? Ihr müsstet eine Lieferung Schinken vom Hafen holen. Immernoch Interesse?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("You are interessted without knowing what the job is about? You would have to get a small delivery of ham from the harbour to me. Still interessted?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Ihr wisst doch gar nicht worum es geht! Ihr müsst nur eine kleine Lieferung Schinken vom Hafen hier her bringen. Wollt ihr das nicht doch machen?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("You don't even know what this job is about. You just have to get a small delivery from the harbour to me. Don't you want to do this?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es geht darum eine kleine Lieferung Schinken vom Hafen zu holen und zu mir zu bringen. Übernehmt ihr den Auftrag?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The job is about a delivery of ham you have to get at the harbour and carry it to me. Do you take that job?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auftrag");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Es geht darum eine kleine Lieferung Schinken vom Hafen zu holen und zu mir zu bringen. Übernehmt ihr den Auftrag?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("aufgabe");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("Es geht darum eine kleine Lieferung Schinken vom Hafen zu holen und zu mir zu bringen. Übernehmt ihr den Auftrag?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ja");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Sehr gut. Geht zu Nicolas am Hafen. Der soll euch die Lieferung geben. Und beeilt euch. Ich brauche das Fleisch.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Naja. Schade. Dann eben nicht.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Very well. Go to Nicolas at the harbour. He shall give you the delivery. And hurry. I need that meat.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(557, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("Sadly.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja. Gobaith das ist diese Insel hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yeah. Gobaith is this island.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greenbriar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Greenbriar war mal ein Halblingsdorf. Ist im Südwesten der Insel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greenbriar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greenbriar was the halfling settlement. Its in the south west of the island.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hellbriar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hellbriar ist eine Vulkanlandschaft südlich von Greenbriar. Gefährlicher Ort. Geht dort lieber nicht hin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hellbriar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hellbriar is a vulcan in the south of Greenbriar. Dangerous place. Better don't got there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addResponse("Nice to meet you. I'm %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I'm");
talkEntry:addResponse("Nice to meet you. I'm %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Freut mich euch kennen zu lernen. Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mag Academy");
talkEntry:addResponse("The academy of magic... i have no idea where it is. Better ask a mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("academy mag");
talkEntry:addResponse("The academy of magic... i have no idea where it is. Better ask a mage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magierakademie");
talkEntry:addResponse("Die Akademie der Magie. Ich habe keine Ahnung wo diese ist. Fragt besser einen Magier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magier Akademie");
talkEntry:addResponse("Die Akademie der Magie. Ich habe keine Ahnung wo diese ist. Fragt besser einen Magier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Akademie Magi");
talkEntry:addResponse("Die Akademie der Magie. Ich habe keine Ahnung wo diese ist. Fragt besser einen Magier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordmark");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Nordmark ist der Sitz der Barbaren auf Gobaith. Die leben irgendwo weit im Nordwesten der Insel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordmark");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Northmark is the home of the barbarians on Gobaith. They life somewhere in the north west of the island.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Northmark");
talkEntry:addResponse("The Northmark is the home of the barbarians on Gobaith. They life somewhere in the north west of the island.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silberbrand");
talkEntry:addResponse("Silberbrand ist die Heimat der Zwerge. Wenn ihr Schmiedewaren braucht, dort bekommt ihr sie sicher. Aber die Preise dort sind... zwergisch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silverbrand");
talkEntry:addResponse("Silverbrand is the home of the dwarfs. If you need smithed goods you get them there for sure. But the prices are... dwarf-like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tol Vanima");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tol Vanima ist die Heimat der Elfen. Man erreicht sie über den Hafen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tol Vanima");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tol Vanima is the home of the elves. You can reach it from the harbour by a ferry");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll[s ]+Bane");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Trollsbane ist diese Stadt hier. Die Stadt liegt ziemlich zentral auf der Insel und ist Heimat vieler Händler, Handwerker, Krieger und leider auch Verbrecher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll[s ]+Bane");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Trollsbane is the town you are in currently. The town is more or less central on the island and is the home of many traders, craftsmans, warriors and sadly criminal as well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Varshikar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Varshikar liegt weit im Nordosten von Gobaith. Hinter der Wüste. Ist ein langer Weg dort hin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Varshikar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Varshikar is far in the northeast of Gobaith. Behind the Desert. Is a long way to this place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("auf bald");
talkEntry:addResponse("Bis bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Händler");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("buy");
talkEntry:addResponse("I don't sell anything at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bye");
talkEntry:addResponse("Farewell");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("euer name");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deine aufgabe");
talkEntry:addResponse("Ich bin Händler. Das sollte meine Aufgabe genug beschreiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eure aufgabe");
talkEntry:addResponse("Ich bin Händler. Das sollte meine Aufgabe genug beschreiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("farewell");
talkEntry:addResponse("Be well");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("If you want to know something about the gods, better ask a priest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addResponse("Greetings");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addResponse("Ich grüße euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greetings");
talkEntry:addResponse("Good day");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("greets");
talkEntry:addResponse("Good day");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guten tag");
talkEntry:addResponse("Grüße");
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
talkEntry:addResponse("Oldra ist die Göttin der Fruchtbarkeit und des Lebens. Viele Bauern beten sie an.");
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
talkEntry:addResponse("Irmorom ist der Gott des Handwerks. Die Zwerge beten ihn an und können euch sicher alles über ihn erzählen, wenn wir ein paar Krüge Bier ausgebt.");
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
talkEntry:addResponse("Ronagan ist der Gott der Diebe. Daher kann man sich wohl denken das die meisten Diebe ihn anbeten.");
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
talkEntry:addResponse("Ushare is the godness of earth. There are not many who pray to her. Only some druids and elves");
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
talkEntry:addResponse("Eldan is the god of spirit. The most of his followers hare mages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tanora is the godness of water. The lizards pray to her. They call her Zelphia.");
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
talkEntry:addResponse("Findari is the godness of air. Her followers are bards.");
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
talkEntry:addResponse("Elara is the godness of knowledge and wissdome.");
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
talkEntry:addResponse("Oldra is the godness of life. Many halflings follow her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cherga is the godness of the ghosts. She takes care that your soul travels savely into the next world. After your life ends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Malachin is the god of hunting. The grey rose who is in the castle north of Trollsbane follows him. There you get more Informations about Malachin for sure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Irmorom is the god of the crafts. The dwarfs follow him and can tell you everything about him if you give them some beers.");
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
talkEntry:addResponse("Ronagan is the god of the thiefs. So the most thiefs follow him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Moshran is the blood god. He is evil. As his followers are. Do not trust any of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hail");
talkEntry:addResponse("Grüße");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addResponse("Grüße euch");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hello");
talkEntry:addResponse("Greetings");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addResponse("I'm pretty fine");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kaufen");
talkEntry:addResponse("Ich verkaufe im Augenblick leider nichts");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name");
talkEntry:addResponse("Freut mich euch kennen zu lernen. Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("A pleasure. My name is %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addResponse("I do not sell anything at the moment");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkaufen");
talkEntry:addResponse("Ich verkaufe im Augenblick nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was kaufst");
talkEntry:addResponse("Ich kaufe im Augenblick nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkaufst");
talkEntry:addResponse("Ich verkaufe im Augenblick nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer seid");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wer");
talkEntry:addResponse("Ich bin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what buy");
talkEntry:addResponse("I do not buy anything currently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addResponse("I do not sell anything currently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where am I");
talkEntry:addResponse("You are in Trollsbane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("who");
talkEntry:addResponse("I am %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie geht es");
talkEntry:addResponse("Ich kann nicht klagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addResponse("Ich werde %NPCNAME genannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addResponse("Ich werde %NPCNAME genannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo bin ich");
talkEntry:addResponse("Ihr seid in Trollsbane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("you name");
talkEntry:addResponse("I am %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
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
