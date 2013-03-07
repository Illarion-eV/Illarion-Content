--------------------------------------------------------------------------------
-- NPC Name: Thorgrem Silverbeard                                     Galmair --
-- NPC Job:  Smith and Miner                                                  --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  387, 273, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Zot                                                              --
--                                                       easyNPC Parser v1.23 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 387, 273, 0, 6, 'Thorgrem Silverbeard', 'npc.thorgrem_silverbeard', 0, 1, 4, 216, 216, 216, 155, 105, 68);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.thorgrem_silverbeard", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Thorgrem Silverbeard the smith. Keywords: quest, smithing, craft, letter"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Thorgrem Silverbeard der Schmied. Schlüsselwörter: Quest, Schmieden, Handwerk, Brief"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good Evening");
talkEntry:addResponse("Hello, can I help you?");
talkEntry:addResponse("Irmorom be with you, do you need anything?");
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
talkEntry:addResponse("Hallo, kann ich dir helfen?");
talkEntry:addResponse("Irmorom zum Gruße, brauchst du was?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, can I help you?");
talkEntry:addResponse("Irmorom be with you, do you need anything?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, kann ich dir helfen?");
talkEntry:addResponse("Irmorom zum Gruße, brauchst du was?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell, Irmorom be with you!");
talkEntry:addResponse("Until next time! Bye");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addResponse("Auf bald, Irmorom mit dir!");
talkEntry:addResponse("Man sieht sich. Auf bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell, Irmorom be with you!");
talkEntry:addResponse("Until next time! Bye");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf bald, Irmorom mit dir!");
talkEntry:addResponse("Man sieht sich. Auf bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel fine, I wouldn't mind a beer though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, ein Bier währe wohl nicht verkehrt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Thorgrem Silverbeard, who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Thorgrem Silverbeard, wer bist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a smith of course, maybe I'll have a little task for you later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin natürlich ein Schmied, vielleicht habe ich später eine kleine Aufgabe für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a smith of course, maybe I'll have a little task for you later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin natürlich ein Schmied, vielleicht habe ich später eine kleine Aufgabe für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("smith");
talkEntry:addResponse("If you want to smith you need ingots and a hammer of course. Blacksmiths need a normal hammer, finesmith's need a finesmithing hammer though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmied");
talkEntry:addResponse("Wenn du schmieden willt dann brauchst du Barren und natürlich einen Hammer. Schmiede benutzen einen gewöhnlichen Hammer, Goldschmiede dagegen brauchen einen Feinschmiedehammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("craft");
talkEntry:addResponse("If you need help with smithing, ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("hand");
talkEntry:addResponse("Wenn du Hilfe beim Schmieden brauchst frag mich nach einer Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("letter");
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 3));
talkEntry:addResponse("Ah, thank you. If you need help with smithing, ask me for a task. If you prefer gem grinding or brick making, talk with Seleseth at the grinder next me. You can ask Tony Spirotelli at the workbench over there if you want to know more about carpentry though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("brief");
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 3));
talkEntry:addResponse("Ah, vielen Dank. Wenn Ihr Hilfe beim Schmieden braucht, fragt mich nach einer Aufgabe. Wollt Ihr lieber etwas über das Edelsteinschleifen oder Ziegelmachen lernen, dann fragt Seleseth die Echse neben mir. Liegt euch das Schreinerhandwerk eher, dann fragt Tony Spirotelli bei der Werkbank dort drüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 1));
talkEntry:addResponse("Could you bring me twenty pieces of iron ore from the Malachite Mine and also twenty lumps of coal from the Dark Hole Mine? If you leave the workshop to the south, and follow the street south, you will get to the Malachite Mine. The Dark Hole Mine is outside the city, you can find it if you go north west from the main gate. I'll give you my old pick-axe to mine the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 1));
talkEntry:addResponse("Kannst du mir 20 Brocken Eisenerz von der Malachitmine und außerdem noch 20 Klumpen Kohle von der Dunkellochmine bringen? Verlass die Werkstatt und folg der Straße die nach Süden führt um zur Malachitmine zu gelangen. Die Dunkellochmine ist außerhalb der Stadt im Nordwesten. Hier ich gebe dir meine alte Spitzhacke um das Erz abzubauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 1));
talkEntry:addResponse("Could you bring me twenty pieces of iron ore from the Malachite Mine and also twenty lumps of coal from the Dark Hole Mine? If you leave the workshop to the south, and follow the street south, you will get to the Malachite Mine. The Dark Hole Mine is outside the city, you can find it if you go north west from the main gate. I'll give you my old pick-axe to mine the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 1));
talkEntry:addResponse("Kannst du mir 20 Brocken Eisenerz von der Malachitmine und außerdem noch 20 Klumpen Kohle von der Dunkellochmine bringen? Verlass die Werkstatt und folg der Straße die nach Süden führt um zur Malachitmine zu gelangen. Die Dunkellochmine ist außerhalb der Stadt im Nordwesten. Hier ich gebe dir meine alte Spitzhacke um das Erz abzubauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 2));
talkEntry:addResponse("Well done, thank you. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 2));
talkEntry:addResponse("Gut gemacht, danke. Willst du eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 2));
talkEntry:addResponse("Well done, thank you. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 2));
talkEntry:addResponse("Gut gemacht, danke. Wollst du eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That's not everything I was looking for. Did you forget that I told you to bring me twenty pieces of iron ore and twenty lumps of coal?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Da fehlt aber noch etwas. Ich wollte 20 Eisenerze sowie 20 Kohleklumpen von dir, hast du das vergessen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That's not everything I was looking for. Did you forget that I told you to bring me twenty pieces of iron ore and twenty lumps of coal?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Da fehlt aber noch etwas. Ich wollte 20 Eisenerze sowie 20 Kohleklumpen von dir, hast du das vergessen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 3));
talkEntry:addResponse("I have another task for you, aye. Could you smelt me ten iron ingots at the furnace over there? Here I'll even give you the crucible-pincers for smelting the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 3));
talkEntry:addResponse("Ich hätte einen weitere Aufgabe für dich, aye. Kannst du zehn Eisenbarren bei der Esse neben mir schmelzen? Hier, ich gebe dir sogar eine Tiegelzange zum schmelzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 3));
talkEntry:addResponse("I have another task for you, aye. Could you smelt me ten iron ingots at the furnace over there? Here I'll even give you the crucible-pincers for smelting the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2751, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 3));
talkEntry:addResponse("Ich hätte einen weitere Aufgabe für dich, aye. Kannst du zehn Eisenbarren bei der Esse neben mir schmelzen? Hier, ich gebe dir sogar eine Tiegelzange zum schmelzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 4));
talkEntry:addResponse("Well done. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 4));
talkEntry:addResponse("Gut gemacht. Willst du eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 4));
talkEntry:addResponse("Well done. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 4));
talkEntry:addResponse("Gut gemacht. Willst du eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("There are not ten iron ingots yet. Please come back later when you've finished the task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Das sind noch keine zehn Eisenbarren, die ich von dir wollte. Komm wieder wenn du die Aufgabe erledigt hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 5));
talkEntry:addResponse("You want another task? Well alright. Could you smith me five pins and five goblets please? The hammer with the yellow handle is for blacksmithing and the hammer with the red handle is for finesmithing. Here I'll give you one of each kind so you can practise a little bit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 5));
talkEntry:addResponse("Du willst noch eine Aufgabe? Na gut, meinetwegen. Bitte stell mir fünf Nägel sowie fünf Kelche her. Der Hammer mit dem gelben Griff ist für das Schmieden gedacht, der mit dem roten Griff für das Feinschmieden. Hier ich gebe dir jeweils einen zum üben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 5));
talkEntry:addResponse("You want another task? Well alright. Could you smith me five pins and five goblets please? The hammer with the yellow handle is for blacksmithing and the hammer with the red handle is for finesmithing. Here I'll give you one of each kind so you can practise a little bit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(23, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(122, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 5));
talkEntry:addResponse("Du willst noch eine Aufgabe? Na gut, meinetwegen. Bitte stell mir fünf Nägel sowie fünf Kelche her. Der Hammer mit dem gelben Griff ist für das Schmieden gedacht, der mit dem roten Griff für das Feinschmieden. Hier ich gebe dir jeweils einen zum üben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 6));
talkEntry:addResponse("Well done, thank you very much. I don't think you need my help any longer, good luck!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich denke du kommst nun auch ohne meine Hilfe zurecht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 6));
talkEntry:addResponse("Well done, thank you very much. I don't think you need my help any longer, good luck!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2738, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(708, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich denke du kommst nun auch ohne meine Hilfe zurecht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Please come back again if you have five pins and five goblets for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2738, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du hast die Aufgabe noch nicht erfüllt wie ich sehe. Bitte bring mir fünf Nägel und fünf Kelche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Please come back again if you have five pins and fünf goblets for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(1858, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du hast die Aufgabe noch nicht erfüllt wie ich sehe. Bitte bring mir fünf Nägel und fünf Kelche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I don't have anything more for you to do. Thank you for the help though!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(708, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich habe nichts weiter für dich zu tun. Aber danke nochmals für deine Hilfe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizen of Galmair. I don't have anything for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Du scheinst kein Bürger Galmair zu sein. Ich habe nichts für dich zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("#me streicht sich über seinen Bart.", "#me runs a hand over his beard.");
talkingNPC:addCycleText("Wenn du Hilfe beim schmieden brauchst dann frag nur mich!", "If you need any help smithing, just ask me!");
talkingNPC:addCycleText("#me gähnt verhalten.", "#me yawns restrained.");
talkingNPC:addCycleText("Ein Bier! Bringt mir ein Bier!", "A beer, bring me a beer!");
talkingNPC:addCycleText("#me grummelt.", "#me grumbles.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 358);
mainNPC:setEquipment(3, 2360);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 825);
mainNPC:setEquipment(10, 698);
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