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
-- NPC Name: Melanie Meadowlark                                          None --
-- NPC Job:  Ranger                                                           --
--                                                                            --
-- NPC Race: elf                        NPC Position:  816, 440, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Evie                                                             --
--                                                Illarion easyNPC Editor 2.1.13-18-gb4c8d69 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 816, 440, 0, 4, 'Melanie Meadowlark', 'npc.melanie_meadowlark', 1, 3, 0, 0, 0, 0, 249, 206, 181);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.melanie_meadowlark", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
mainNPC:setAffiliation(0);
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the ranger Melanie Meadowlark. Keywords: Hello, quest, ranger."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Waldläufer Melanie Meadowlark. Schlüsselwörter: Hallo, Quest, Waldläufer."));
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
talkEntry:addResponse("Be greeted!");
talkEntry:addResponse("Welcome to Elstree Forest.");
talkEntry:addResponse("Greetings, Please mind the fairies and stay away from their cakes!");
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
talkEntry:addResponse("Gruß!");
talkEntry:addResponse("Willkommen in Elstree Wald");
talkEntry:addResponse("Grüße, Bitte gebt auf die Feen acht und bleiben weg von ihrem Kuchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted!");
talkEntry:addResponse("Welcome to Elstree Forest.");
talkEntry:addResponse("Greetings, Please mind the fairies and stay away from their cakes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Tach mein Freund!");
talkEntry:addResponse("Willkommen in Elstree Wald!");
talkEntry:addResponse("Grüße, Bitte gabt auf die Feen acht und bleiben weg von ihrem Kuchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Look at the wonderful world the gods have made for us, honor them in your travels.");
talkEntry:addResponse("Please visit again.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Schaut euch die wunderbare Welt an, welche die Götter für uns gemacht haben und ehrt sie auf eueren Reisen.");
talkEntry:addResponse("Bitte besucht uns erneut.");
talkEntry:addResponse("Gehabt euch wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Look at the wonderful world the gods have made for us, honor them in your travels.");
talkEntry:addResponse("Please visit again.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Schaut euch die wunderbare Welt an, welche die Götter für uns gemacht haben und ehrt sie auf eueren Reisen.");
talkEntry:addResponse("Bitte besucht uns erneut.");
talkEntry:addResponse("Gehabt euch wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel grand.");
talkEntry:addResponse("I am blessed by the Five");
talkEntry:addResponse("I feel like playing music.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich fühle mich großartig.");
talkEntry:addResponse("Ich bin von den Fünfen gesegnet.");
talkEntry:addResponse("Mir ist danach zu musizieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Melanie Meadowlark.");
talkEntry:addResponse("I'm the Ranger Melanie.");
talkEntry:addResponse("You can call me Mel, protector of the fairies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Melanie Meadowlark.");
talkEntry:addResponse("Ich bin ein Waldläufer namens Melanie.");
talkEntry:addResponse("Ihr könnt mich Mel nennen, Beschützerin der Feen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 1));
talkEntry:addResponse("Help!! We need assistance in the fairy bakery.  We are short on honey, please bring me ten honeycombs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 1));
talkEntry:addResponse("Helft uns! Wir brauchen Unterstützung in der Feenbäckerei. Honig ist knapp, so bringt mir bitte zehn Honigwaben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 1));
talkEntry:addResponse("Help!! We need assistance in the fairy bakery.  We are short on honey, please bring me ten honeycombs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 1));
talkEntry:addResponse("Helft uns! Wir brauchen Unterstützung in der Feenbäckerei. Honig ist knapp, so bringt mir bitte zehn Honigwaben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Do you have the honeycombs yet? Without it the baking stalls, which would be horrible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habt ihr die Honigwaben schon? Ohne diese ist das Kuchenbacken unmöglich, das wäre schrecklich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Do you have the honeycombs yet? Without it the baking stalls, which would be horrible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Habt ihr die Honigwaben schon? Ohne diese ist das Kuchenbacken unmöglich, das wäre schrecklich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2529, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 2));
talkEntry:addResponse("Great! Now the cake baking can go on as scheduled.  You are rewarded five silver.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2529, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 2));
talkEntry:addResponse("Großartig! Das Kuchenbacken kann jetzt weitergehen wie geplant. Du erhälst fünf Silber als Belohnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 3));
talkEntry:addResponse("The forest pigs are destroying the flowers!  Please be a good ranger and reduce the population by 25 Elstree forest pigs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 3));
talkEntry:addResponse("Die Wildschweine machen die Blumen kaputt! Seid ein guter Wildhüter und reduziert den Bestand von Elstree Wildschweinen um 25.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 3));
talkEntry:addResponse("The forest pigs are destroying the flowers!  Please be a good ranger and reduce the population by 25 Elstree forest pigs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 3));
talkEntry:addResponse("Die Wildschweine machen die Blumen kaputt! Seid ein guter Wildhüter und reduziert den Bestand von Elstree Wildschweinen um 25.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(500, "<", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Did you reduce the forest pig population yet? We cant let them destroy all flowers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(500, "<", 28));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habt ihr den Wildschweinbestand schon reduziert? Wir können sie nicht alle Blumen zerstören lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(500, "<", 28));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Did you reduce the forest pig population yet? We cant let them destroy all flowers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, ">", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(500, "<", 28));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Habt ihr den Wildschweinbestand schon reduziert? Wir können sie nicht alle Blumen zerstören lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 28));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 29));
talkEntry:addResponse("The flowers are safe now. You are rewarded ten silver.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 28));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 29));
talkEntry:addResponse("Die Blumen sind gerettet. Du erhälst zehn Silber als Belohnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 29));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 30));
talkEntry:addResponse("There is a disturbance at the altar of Nargun, please check it out.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 29));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 30));
talkEntry:addResponse("Etwas ist ungewöhnlich an Narguns Altar. Könnt ihr euch das ansehen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 29));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 30));
talkEntry:addResponse("There is a disturbance at the altar of Nargun, please check it out.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 29));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 30));
talkEntry:addResponse("Etwas ist ungewöhnlich an Narguns Altar. Könnt ihr euch das ansehen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 30));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Did you look after the altar yet? Something is wrong there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 30));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habt ihr den Altar schon kontrolliert? Etwas seltsames geht dort vor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 30));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Did you look after the altar yet? Something is wrong there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 30));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Habt ihr den Altar schon kontrolliert? Etwas seltsames geht dort vor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 31));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a pie."));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 32));
talkEntry:addResponse("#me giggles lightly  'Oh it seems Nargun was just playing some jokes. Thank you for checking it out.' You receive one apple pie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 31));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Kuchen."));
talkEntry:addConsequence(npc.base.consequence.item.item(353, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 32));
talkEntry:addResponse("#me kichert leise 'Oh es scheint als ob Nargun nur einen Streich im Sinne hatte. Danke dafür, dass ihr es euch angesehen habt.'  Du erhälst einen Apfelkuchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 32));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 33));
talkEntry:addResponse("Oh great your here.  We need some flowers for the arrangements.  Please bring me 20 flamegoblet blossoms.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 32));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 33));
talkEntry:addResponse("Oh gut dass ihr da seid! Wir brauchen Blumen für den Tischschmuck. Bitte bringt mir 20 Flammenkelchblüten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 32));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Elstree Ranger IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 33));
talkEntry:addResponse("Oh great your here.  We need some flowers for the arrangements.  Please bring me 20 flamegoblet blossoms.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 32));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neue Quest] Elstree Waldläufer IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 33));
talkEntry:addResponse("Oh gut dass ihr da seid! Wir brauchen Blumen für den Tischschmuck. Bitte bringt mir 20 Flammenkelchblüten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 33));
talkEntry:addCondition(npc.base.condition.item.item(137, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Did you find enough flowers yet? We need them urgently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 33));
talkEntry:addCondition(npc.base.condition.item.item(137, "all", "<", 20, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habt Ihr schon genung Blumen gefunden? Wir brauchen sie dringend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 33));
talkEntry:addCondition(npc.base.condition.item.item(137, "all", "<", 20, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Did you find enough flowers yet? We need them urgently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 33));
talkEntry:addCondition(npc.base.condition.item.item(137, "all", "<", 20, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Habt Ihr schon genung Blumen gefunden? Wir brauchen sie dringend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 33));
talkEntry:addCondition(npc.base.condition.item.item(137, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded twenty silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(137, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 34));
talkEntry:addResponse("Thank you for the flowers. Here a little reward for your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 33));
talkEntry:addCondition(npc.base.condition.item.item(137, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zwanzig Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(137, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(500, "=", 34));
talkEntry:addResponse("Danke für die Blumen. Hier eine kleine Belohnung für euere Mühen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 34));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("There is no more work for you, thank you for the assistance!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 34));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Es gibt nichts mehr zu tun. Danke für euere Unterstützung!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 34));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("There is no more work for you, thank you for the assistance!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(500, "=", 34));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Es gibt nichts mehr zu tun. Danke für euere Unterstützung!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Oh, I am a ranger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Oh, ich bin ein Waldläufer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Oh, I am a ranger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Oh, ich bin ein Waldläufer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith needed more Rangers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith brauchte mehr Waldläufer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Listen to the Fairies sing!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hört die Feen singen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ranger");
talkEntry:addResponse("My job is to protect the forest and its inhabitants.");
talkEntry:addResponse("All of Ushara's creatures are under my protection.");
talkEntry:addResponse("My job is important to the life of the forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waldläufer");
talkEntry:addResponse("Meine Aufgabe ist es, den Wald und seine Bewohner zu schützen.");
talkEntry:addResponse("Alle Geschöpfe Usharas sind unter meinem Schutz.");
talkEntry:addResponse("Meine Aufgabe ist es wichtig für das Leben des Waldes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elstree");
talkEntry:addResponse("Elstree Forest is the home of the fairies.");
talkEntry:addResponse("Many plants and animals are at home here.");
talkEntry:addResponse("I find peace in the Elstree Forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elstree");
talkEntry:addResponse("Elstree Wald ist die Heimat der Feen.");
talkEntry:addResponse("Viele Pflanzen und Tiere sind hier zu Hause.");
talkEntry:addResponse("Ich finde Frieden im Elstree Wald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fairies");
talkEntry:addResponse("Fairies are delightfully fun creatures.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fee");
talkEntry:addResponse("Feen sind herrlich lustige Kreaturen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Flower");
talkEntry:addResponse("The forest is filled with flowers that are not only pretty but useful.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blume");
talkEntry:addResponse("Der Wald ist gefüllt mit Blumen, die nicht nur schön, sondern auch nützlich sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("spider");
talkEntry:addResponse("Eek!! Don't tell but spiders scare me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("spinne");
talkEntry:addResponse("Eek! Nicht weitersagen, aber Spinnen machen mir Angst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addResponse("Being an elf makes one closer to nature and Ushara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addResponse("Ein Elf zu sein bedeutet, dass man näher an der Natur und Ushara ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The Archmage of Runewick is an elf and understands the balance of nature.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier Runewick ist ein Elf und versteht das Gleichgewicht der Natur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("The Archmage of Runewick is an elf and understands the balance of nature.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier Runewick ist ein Elf und versteht das Gleichgewicht der Natur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("The scholars of Runewick rarely venture to the forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die Gelehrten Runewicks wagen sich selten in den Wald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The Don is more concerned with profit than the forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Don ist mehr an Gewinn interessiert als an Wäldern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is the land of riches, to me the real riches are here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist das Land der Reichtümer, für mich liegen die wahren Reichtümer aber hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The Queen has a lovely flower garden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die Königin hat einen schönen Blumengarten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("The Queen has a lovely flower garden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Königin hat einen schönen Blumengarten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I think honor is serving the forest, however they say Cadomyr is the land of honor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich denke, Ehre bedeutet dem Wald zu dienen, aber sie sagen Cadomyr ist das Land der Ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("In the Elstree forest, the gifts of the gods are everywhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Im Elstree Wald sind überall die Gaben der Götter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("May Oldra continue to bless the forest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Möge Oldra weiterhin den Wald segnen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara blessed us with this rich and fertile land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara segnete uns mit diesem reichen und fruchtbaren Land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I do not sell or buy anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich kaufe und verkaufe nichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("The forest is the most peaceful place.");
talkEntry:addResponse("Save a fairy and bring extra cakes.");
talkEntry:addResponse("I love my work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Der Wald ist der friedlichste Ort.");
talkEntry:addResponse("Rettet eine Fee und bringt mehr Kuchen.");
talkEntry:addResponse("Ich liebe meine Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Mel");
talkEntry:addTrigger("Melanie");
talkEntry:addResponse("Mel is my name!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mel");
talkEntry:addTrigger("Melanie");
talkEntry:addResponse("Mel ist mein Name!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Good for you.");
talkEntry:addResponse("Aye, I see.");
talkEntry:addResponse("Are you sure?");
talkEntry:addResponse("If you say so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Gut für dich.");
talkEntry:addResponse("Aye, in Ordnung.");
talkEntry:addResponse("Bist du dir sicher?");
talkEntry:addResponse("Wenn du das sagst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What a shame.");
talkEntry:addResponse("Maybe you'll change your mind.");
talkEntry:addResponse("Well...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Schade.");
talkEntry:addResponse("Vielleicht änderst du deine Meinung noch.");
talkEntry:addResponse("Nun...");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Seht euch nur die Blumen an!", "Enjoy the flowers!");
talkingNPC:addCycleText("Rettet ein Leben...schenkt einer Fee einen Kuchen!", "Save a life... feed a fairy a cake today!");
talkingNPC:addCycleText("Haltet ein, atmet durch, geniesst die Schönheit.", "Stop, take a breathe, and enjoy the splendor.");
talkingNPC:addCycleText("#me lächelt und spielt entspannt eine Melodie auf der Harfe.", "#me smiles and relaxes, playing some tunes on a harp.");
talkingNPC:addCycleText("#me lacht während sie eine kleine Fee beim beobachtet, die mit Blumengiessen beschäftigt ist und dabei neckisch andere vorbeifliegende Feen mit Wasser bespritzt.", "#me laughs as she watches a fairy flit around, watering flowers and playfully spraying water over other fairies as they pass nearby.");
talkingNPC:addCycleText("Beschädigt nicht die Blumen der Feen, sie sorgen sich um jedes einzelne Blütenblatt.", "Don't touch the fairy's flowers, they care for each and every petal.");
talkingNPC:addCycleText("#me scherzt mit vorbeifliegenden Feen, indem sie Mehlstaub in deren Richtung bläst.", "#me joins in the play by blowing some flour out of her hand and at a couple of passing fairies.!");
talkingNPC:addCycleText("#me erzählt einer Gruppe Feen leise einen Witz deren Lachen daraufhin wie das Klingeln von Glöckchen durch den wald schallt. ", "#me quietly tells a joke to a group of fairies, who's laughter rings like bells throughout the forest.");
talkingNPC:addCycleText("#me stellt einen klebrigen Kuchen ab, der mit Hollunder- und Blaubeeren gefüllt ist. Sie giesst Honig darüber und wartet auf die Ankunft einiger Feen.", "#me sets out a gooey cake filled with elder berries and black berries, pours honey over the top, and sits back, waiting for the fairies to arrive.");
talkingNPC:addCycleText("#me beobachtet ein paar Feen die vor dem Spiegel posieren um sich selbst zu bewundern.", "#me watches the fairies preen and admire themselves at a mirror as they twist to and fro to get a better look.");
talkingNPC:addCycleText("#me kleidet die Feenkönigin mit einem neuen Gewand ein das aus feinster grüner Seide gefertigt und mit goldenen Stickereien verziert ist. Glitzernde Edelsteine sind in Kragen und Ärmel eingearbeitet die im Sonnenlicht funkeln.", "#me gives the fairy queen a new dress made of the finest green silk and adorned with gold thread work. Glittering gemstones have been worked around the collar and sleeves, flashing in the bright sunshine.");
talkingNPC:addCycleText("#me beobachtet wie die Feen mit den Schmetterlingen tanzen, ein beeindruckendes Spiel von Farben.", "#me watches the fairies dance amongst the butterflies, making it look like an explosion of wings and colors.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Waldläufer Melanie Meadowlark.", "This NPC is the Ranger Melanie Meadowlark.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 832);
mainNPC:setEquipment(3, 846);
mainNPC:setEquipment(11, 2418);
mainNPC:setEquipment(5, 2780);
mainNPC:setEquipment(6, 64);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2114);
mainNPC:setEquipment(10, 369);
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