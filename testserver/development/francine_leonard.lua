--------------------------------------------------------------------------------
-- NPC Name: Francine Leonard                                        Runewick --
-- NPC Job:  Cook and farmer                                                  --
--                                                                            --
-- NPC Race: human                      NPC Position:  897, 836, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Zot                                                              --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 897, 836, 0, 4, 'Francine Leonard', 'npc.francine_leonard', 1, 7, 0, 224, 175, 27, 245, 200, 145);
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
module("development.francine_leonard", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Francine Leonard the cook and farmer. Keywords: quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Francine Leonard die Köchin und Bäuerin. Schlüsselwörter: Quest"));
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
talkEntry:addResponse("Nice to meet you, I'm Francine Leonard.");
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
talkEntry:addResponse("Hallo, kann ich Euch helfen?");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Francine Leonard.");
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
talkEntry:addResponse("Nice to meet you, I'm Francine Leonard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, kann ich Euch helfen?");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Francine Leonard");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("I wish you a nice day.");
talkEntry:addResponse("I hope we meet again, goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addResponse("Ich wünsche Euch noch einen schönen Tag.");
talkEntry:addResponse("Ich hoffe, wir sehen uns wieder, auf bald!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("I wish you a nice day.");
talkEntry:addResponse("I hope we meet again, goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ich wünsche Euch noch einen schönen Tag.");
talkEntry:addResponse("Ich hoffe, wir sehen uns wieder, auf bald!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I feel fine, thank you for asking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, danke für die Nachfrage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Francine Leonard, who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Francine Leonard, wer bist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a cook and farmer. Do you want to know more about these jobs? Then just ask me for a task!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Köchin und Bäuerin. Wollt ihr mehr darüber wissen? Dann fragt mich einfach nach einer Aufgabe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a cook and farmer. Do you want to know more about these jobs? Then just ask me for a task!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Köchin und Bäuerin. Wollt ihr mehr darüber wissen? Dann fragt mich einfach nach einer Aufgabe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(259, 10, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 1));
talkEntry:addResponse("Oh, you want a task? Very well, let's start with something simple. Sow some of this grain I give you on the fields over there. Once the crop is ready, harvest the ripened grain with this scythe I give you, and show me ten bundles of grain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(259, 10, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 1));
talkEntry:addResponse("Oh, Ihr wollt eine Aufgabe? Nun gut, fangen wir mit etwas einfachem an. Baut etwas Getreide für mich an. Dafür braucht Ihr nur etwas Getreide, dass Ihr von mir kriegt. Sobald Ihr es auf den Feldern gesäet habt und es reif ist, sammelt die Getreidebündel mit der Sense die ich Euch gebe und zeigt mir zehn Bündel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(259, 10, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 1));
talkEntry:addResponse("Oh, you want a task? Very well, let's start with something simple. Sow some of this grain I give you on the fields over there. Once the crop is ready, harvest the ripened grain with this scythe I give you, and show me ten bundles of grain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(259, 10, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(271, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 1));
talkEntry:addResponse("Oh, Ihr wollt eine Aufgabe? Nun gut, fangen wir mit etwas einfachem. Baut etwas Getreide für mich an. Dafür braucht Ihr nur etwas Getreide, dass Ihr von mir kriegt. Sobald Ihr es auf den Feldern gesäet habt und es reif ist, sammelt die Getreidebündel mit der Sense die ich Euch gebe und zeigt mir zehn Bündel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("grain");
talkEntry:addTrigger("bundle");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 2));
talkEntry:addResponse("Well done, thank you. Please keep the remaining bundles of grain for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("getreide");
talkEntry:addTrigger("bündel");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 2));
talkEntry:addResponse("Gut gemacht, danke. Bitte behaltet die übrigen Getreidebündel für Eure nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 2));
talkEntry:addResponse("Well done, thank you. Please keep the remaining bundles of grain grain for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(249, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 2));
talkEntry:addResponse("Gut gemacht, danke. Bitte behaltet die übrigen Getreidebündel für Eure nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That isn't ten bundles of grain yet, please come back once you've finished this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(249, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Das sind noch keine zehn Getreidemündel die ich haben wollte. Kommt wieder wenn Ihr die Aufgabe erledigt habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(258, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 3));
talkEntry:addResponse("You want another task? Alright, thresh the bundles of grain using this flail I give you, to produce grain. Once you have done that, make five sacks of flour using the wooden shovel I give you at the millstone over there left of me. Then return and show me the result.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(258, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 3));
talkEntry:addResponse("Ihr wollt noch eine Aufgabe? Nun macht Ihr mit einem Dreschflegel aus den übrigen Getreidebündeln Getreide. Sobald Ihr damit fertig seid, geht zum Mühlstein da vorne links und macht mit der Holzkelle von mir fünf Säcke Mehl. Kommt anschließend zurück zu mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(258, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 3));
talkEntry:addResponse("You want another task? Alright, thresh the bundles of grain using this flail I give you, to produce grain. Once you have done that, make five sacks of flour using the wooden shovel I give you at the millstone over there left of me. Then return and show me the result.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(258, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 3));
talkEntry:addResponse("Ihr wollt noch eine Aufgabe? Nun macht Ihr mit einem Dreschflegel aus den übrigen Getreidebündeln Getreide. Sobald Ihr damit fertig seid, geht zum Mühlstein da vorne links und macht mit der Holzkelle von mir fünf Säcke Mehl. Kommt anschließend zurück zu mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("flour");
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 4));
talkEntry:addResponse("Well done. Please keep the flour for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("mehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 4));
talkEntry:addResponse("Gut gemacht. Bitte behaltet den Mehl für Eure nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 4));
talkEntry:addResponse("Well done. Please keep the flour for your next task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 4));
talkEntry:addResponse("Gut gemacht. Bitte behaltet den Mehl für Eure nächste Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("I wanted five sacks of flour, come back once you have fulfilled this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ich wollte fünf Säcke Mehl von Euch, kommt wieder wenn Ihr die Aufgabe erfüllt habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(121, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 5));
talkEntry:addResponse("Alright, now we will make some bread rolls. You will need a peel, the flour and of course some buckets of water to make the bread rolls. I'll give you my old peel and five buckets of water so you can practise a little bit. Now go to the other room to find the baking oven and bake five bread rolls. Show me the result once you are done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(121, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 5));
talkEntry:addResponse("Gut, nun machen wir einige Brötchen. Dafür braucht Ihr einen Brotschieber, den Mehl den Ihr bereits habt und natürlich Eimer mit Wasser. Ich gebe Euch meinen alten Backofenschieber und fünf Eimer damit Ihr etwas üben könnt. Nun geht zum Backofen in dem anderen Raum und backt mir fünf Brötchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(121, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 5));
talkEntry:addResponse("Alright, now we will make some bread rolls. You will need a peel, the flour and of course some buckets of water to make the bread rolls. I'll give you my old peel and five buckets of water so you can practise a little bit. Now go to the other room to find the baking oven and bake five bread rolls. Show me the result once you are done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(121, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 5));
talkEntry:addResponse("Gut, nun machen wir einige Brötchen. Dafür braucht Ihr einen Brotschieber, den Mehl den Ihr bereits habt und natürlich Eimer mit Wasser. Ich gebe Euch meinen alten Backofenschieber und fünf Eimer damit Ihr etwas üben könnt. Nun geht zum Backofen in dem anderen Raum und backt mir fünf Brötchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(191, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("bread");
talkEntry:addTrigger("roll");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(191, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 6));
talkEntry:addResponse("Well done, thank you very much. If you have more time I can give you another task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(191, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("bröt");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(191, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Wenn Ihr noch etwas Zeit erübrigen könnt, hätte ich eine weitere Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(191, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(191, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 6));
talkEntry:addResponse("Well done, thank you very much. If you have more time I can give you another task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(191, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(191, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Wenn Ihr noch etwas Zeit erübrigen könnt, hätte ich eine weitere Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(191, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Come back once you've got the five bread rolls I'm looking for.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(191, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt wie ich sehe. Bitte bringt mir fünf Brötchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(307, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(63, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(227, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 7));
talkEntry:addResponse("Enough with baking, now we will cook something nice! Let's start with sausages, you will need pork and entrails to produce sausages. You can get the pork and entrails if you kill pigs. Once you have that you will need a cooking spoon and a kettle like this one over there to cook at. I'll give you five pieces of pork, five lengths of entrails and one cooking spoon to practise a little bit. Bring me five sausages once you are done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(307, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(63, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(227, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 7));
talkEntry:addResponse("Genug vom Backen, jetzt kochen wir etwas schönes! Ein guter Anfang sind wohl Würstchen, dazu braucht Ihr etwas Schweinefleisch und Eingeweide. Beides findet Ihr, wenn Ihr Schweine erlegt. Um das ganze dann zu kochen braucht Ihr einen Kochlöffel und so einen Kessel der dort drüben steht. Ich gebe Euch fünf Stück Fleisch, fünf Stück Eingeweide und einen Kochlöffel, damit Ihr etwas üben könnt. Bringt mir fünf Würstchen sobald Ihr fertig seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(307, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(63, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(227, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 7));
talkEntry:addResponse("Enough with baking, now we will cook something nice! Let's start with sausages, you will need pork and entrails to produce sausages. You can get the pork and entrails if you kill pigs. Once you have that you will need a cooking spoon and a kettle like this one over there to cook at. I'll give you five pieces of pork, five lengths of entrails and one cooking spoon to practise a little bit. Bring me five sausages once you are done.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(307, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(63, 5, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(227, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 7));
talkEntry:addResponse("Genug vom Backen, jetzt kochen wir etwas schönes! Ein guter Anfang sind wohl Würstchen, dazu braucht Ihr etwas Schweinefleisch und Eingeweide. Beides findet Ihr, wenn Ihr Schweine erlegt. Um das ganze dann zu kochen braucht Ihr einen Kochlöffel und so einen Kessel der dort drüben steht. Ich gebe Euch fünf Stück Fleisch, fünf Stück Eingeweide und einen Kochlöffel, damit Ihr etwas üben könnt. Bringt mir fünf Würstchen sobald Ihr fertig seid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("sausage");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 8));
talkEntry:addResponse("Well done, thank you very much. I hope I was able to teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("wurst");
talkEntry:addTrigger("würstchen");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 8));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich hoffe, ich konnte euch etwas beibringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 8));
talkEntry:addResponse("Well done, thank you very much. I hope I was able to teach you something.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3051, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(714, "=", 8));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich hoffe, ich konnte euch etwas beibringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Come back once you have five sausages for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(3051, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt, wie ich sehe. Bitte bringt mir fünf Würstchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I don't have anything more for you to do. Thank you for the help though!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich habe nichts weiter für Euch zu tun. Aber danke nochmals für Eure Hilfe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "<", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could use some help, just ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(714, "<", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich könnte etwas Hilfe gebrauchen, fragt mich ruhig nach einer Aufgabe. Ich habe sicher etwas für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizen of Runewick. I don't have anything for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ihr scheint kein Bürger Runewick zu sein. Ich habe nichts für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("Wenn Ihr Hilfe beim Kochen und Backen braucht, dann fragt nur mich!", "If you need any help with baking and cooking, just ask me!");
talkingNPC:addCycleText("#me gähnt verhalten.", "#me yawns restrained.");
talkingNPC:addCycleText("#me pfeift eine Melodie.", "#me whistles a melody.");
talkingNPC:addCycleText("#me liest einen Brief.", "#me reads a letter.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 843);
mainNPC:setEquipment(10, 53);
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