--------------------------------------------------------------------------------
-- NPC Name: Jakob Lindorn                                            Cadomyr --
-- NPC Job:  Helper                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  124, 649, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Zot                                                              --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 124, 649, 0, 6, 'Jakob Lindorn', 'npc.jakob_lindorn', 0, 2, 0, 168, 123, 30, 238, 216, 174);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.talkstate")
require("npc.base.talk")
module("development.jakob_lindorn", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Jakob Lindorn the helper. Keywords: quest, craft, market, workshop, Frizza, food, fighting, Cadomyr"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Jakob Lindorn der Helfer. Schlüsselwörter: Quest, Handwerke, Markt, Werkstatt, Frizza, Essen, Kämpfen, Cadomyr"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 1));
talkEntry:addResponse("Welcome to Cadomyr. Please find my friend Berri Firegold, I'm sure he has a task for you. You won't miss him if you enter the city, he wears a golden armour and can usually be found in the workshop. Once the task is finished, come back to me as I'm sure to have more tasks for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 1));
talkEntry:addResponse("Willkommen in Cadomyr. Sucht doch bitte Berri Firegold, er hat bestimmt eine Aufgabe für Euch. Ihr könnt ihn nicht übersehen, er trägt eine goldene Rüstung und treibt sich meist in der Werkstatt herum. Wenn Ihr diese Aufgabe erfüllt habt, kommt zurück ich hab sicher noch etwas für Euch zu tun.");
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
talkEntry:addResponse("Hello, I can tell you who in Cadomyr has tasks for you to do.");
talkEntry:addResponse("Nice to meet you, I'm Jakob Lindorn, I can tell you who in Cadomyr has tasks for you to do.");
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
talkEntry:addResponse("Hallo, ich kann Euch sagen, wer in Cadomyr Aufgaben für Euch hat.");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Jakob Lindorn. Ich kann Euch sagen, wer in Cadomyr Aufgaben für Euch hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, I can tell you who in Cadomyr has tasks for you to do.");
talkEntry:addResponse("Nice to meet you, I'm Jakob Lindorn, I can tell you who in Cadomyr has tasks for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, ich kann Euch sagen, wer in Cadomyr Aufgaben für Euch hat.");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Jakob Lindorn. Ich kann Euch sagen, wer in Cadomyr Aufgaben für Euch hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Thank you so, so much for talking to me. If you need help finding something to do, just come back.");
talkEntry:addResponse("Please have a good day. If you need help finding something to do, just come back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addResponse("Vielen Dank, dass Ihr mit mir gesprochen habt. Wenn Ihr Hilfe braucht, etwas zu tun zu finden, kommt einfach zurück.");
talkEntry:addResponse("Ich wünsche Euch einen schönen Tag. Wenn Ihr Hilfe braucht, etwas zu tun zu finden, kommt einfach zurück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Thank you so, so much for talking to me. If you need help finding something to do, just come back.");
talkEntry:addResponse("Please have a good day. If you need help finding something to do, just come back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Vielen Dank, dass Ihr mit mir gesprochen habt. Wenn Ihr Hilfe braucht, etwas zu tun zu finden, kommt einfach zurück.");
talkEntry:addResponse("Ich wünsche Euch einen schönen Tag. Wenn Ihr Hilfe braucht, etwas zu tun zu finden, kommt einfach zurück.");
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
talkEntry:addResponse("I'm Jakob Lindorn. I'm here to help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Jakob Lindorn. Ich bin hier zum Helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("My mission is to help, so if you need something to do, just ask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Meine Berufung ist zu helfen. Also wenn Ihr etwas zu tun sucht, fragt einfach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("My mission is to help, so if you need something to do, just ask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Meine Berufung ist zu helfen. Also wenn Ihr etwas zu tun sucht, fragt einfach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("market");
talkEntry:addResponse("Just follow the street to your right and go through the gate, you won't miss the marketplace. Ask Frizza over there if you want to know more about the places around Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("markt");
talkEntry:addResponse("Folgt einfach der Straße zur eurer Rechten und geht durch das Tor, ihr werdet den Marktplatz kaum übersehen können. Fragt Frizza dort drüben, wenn Ihr mehr über die Orte um Cadomyr herum wissen wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Frizza");
talkEntry:addResponse("She is right over there, just go over and talk to her. She knows a lot about Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frizza");
talkEntry:addResponse("Sie ist gleich dort drüben, geht einfach zu ihr rüber und sprecht sie an. Sie weiß eine Menge über Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("food");
talkEntry:addTrigger("eat");
talkEntry:addResponse("You can find food all around you. There are fruits on the trees and bushes or you ask other people for something to eat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("essen");
talkEntry:addTrigger("nahrung");
talkEntry:addResponse("Ihr könnt überall etwas zu essen finden. Früchte wachsen an Bäumen und Büschen oder Ihr fragt andere Leute nach etwas zu essen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("fighting");
talkEntry:addTrigger("monster");
talkEntry:addResponse("There are a few wild animals in the wilderness so be careful. If you want to train, ask around for a sparring partner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kämpfen");
talkEntry:addTrigger("monster");
talkEntry:addResponse("Es gibt einige wilde Tiere in der Wildness, also seid vorsichtig. Wenn Ihr trainieren wollt, fragt herum nach einem Trainingspartner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("This is Cadomyr, my home. We are a realm of honourable and kind people, I'm sure you will enjoy it here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Dies is Cadomyr, mein Zuhause. Wir sind ein Reich von ehrenvollen und aufrichtigen Leuten, ich bin mir sicher, dass Ihr es hier mögen werdet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("work");
talkEntry:addResponse("You can find the workshop really easily. Go through the main gate north from here, then turn right and follow the street, go through the gate, turn left and go through the next gate. From here you go north until you reach a building to your right with a little garden and some tools outside.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Werk");
talkEntry:addResponse("Die Werkstatt könnt Ihr ganz leicht finden. Geht durch das Haupttor im Norden, dann biegt nach rechts ab, geht durch das Tor, nun erneut nach Norden, dann öffnet Ihr das Tor zu eurer linken und geht nach Norden. Die Werkstatt ist kurz vor dem Palast auf der rechten Seite.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("craft");
talkEntry:addResponse("You want to know more about the crafts of Cadomyr? Well then go and visit Berri Firegold, Gerry Deloid, Lilli Gallfing or Zlatxhol, they can tell you more about the crafts than me. You can find them in the workshop in the north of the city.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("hand");
talkEntry:addResponse("Ihr wollt mehr über die Handwerke in Cadomyr wissen? Dann besucht Berri Firegold, Gerry Deloid, Lilli Gallfing oder Zlatxhol, sie können Euch sicher mehr darüber erzählen als ich. Ihr könnt sie alle in der Werkstatt im Norden der Stadt finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Could you give my friend Berri Firegold this letter for me please? You won't miss him if you enter the city, he wears a golden armour and can usually be found in the workshop. Once the task is finished, come back to me as I'm sure to have more tasks for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Könnt ihr meinem Freund Berri Firegold bitte diesen Brief hier für mich übergeben? Ihr könnt ihn nicht übersehen, er trägt eine goldene Rüstung und treibt sich meist in der Werkstatt herum. Wenn Ihr diese Aufgabe erfüllt habt, kommt zurück ich hab sicher noch etwas für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Could you give my friend Berri Firegold this letter for me please? You won't miss him if you enter the city, he wears a golden armour and can usually be found in the workshop. Once the task is finished, come back to me as I'm sure to have more tasks for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Könnt ihr meinem Freund Berri Firegold bitte diesen Brief hier für mich übergeben? Ihr könnt ihn nicht übersehen, er trägt eine goldene Rüstung und treibt sich meist in der Werkstatt herum. Wenn Ihr diese Aufgabe erfüllt habt, kommt zurück ich hab sicher noch etwas für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 3));
talkEntry:addResponse("You're back. Good. I heard Grakamesh could need your help. You can find him right there at Sir Reginald's Tomb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 3));
talkEntry:addResponse("Ihr seid zurück. Schön. Ich habe gehört, dass Grakamesh eure Hilfe gebrauchen könnte. Ihr könnt ihn gleich da vorne bei Sir Reginalds Gruft finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 3));
talkEntry:addResponse("You're back. Good. I heard Grakamesh could need your help. You can find him right there at Sir Reginald's Tomb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 3));
talkEntry:addResponse("Ihr seid zurück. Schön. Ich habe gehört, dass Grakamesh eure Hilfe gebrauchen könnte. Ihr könnt ihn gleich da vorne bei Sir Reginalds Gruft finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You're back. Good. I heard Grakamesh could need your help. You can find him right there at Sir Reginald's Tomb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr seid zurück. Schön. Ich habe gehört, dass Grakamesh eure Hilfe gebrauchen könnte. Ihr könnt ihn gleich da vorne bei Sir Reginalds Gruft finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You're back. Good. I heard Grakamesh could need your help. You can find him right there at Sir Reginald's Tomb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ihr seid zurück. Schön. Ich habe gehört, dass Grakamesh eure Hilfe gebrauchen könnte. Ihr könnt ihn gleich da vorne bei Sir Reginalds Gruft finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 5));
talkEntry:addResponse("A friend of mine, Mirarie Bragolin, always needs some help. You can find her if you follow the street into the city, she is at the inner gate which leads to the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 5));
talkEntry:addResponse("Eine Freundin Mirarie Bragolin kann auch immer etwas Hilfe benötigen. Ihr könnt sie finden wenn Ihr in die Stadt hinein geht, sie steht beim Tor Richtung Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 5));
talkEntry:addResponse("A friend of mine, Mirarie Bragolin, always needs some help. You can find her if you follow the street into the city, she is at the inner gate which leads to the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 5));
talkEntry:addResponse("Eine Freundin Mirarie Bragolin kann auch immer etwas Hilfe benötigen. Ihr könnt sie finden wenn Ihr in die Stadt hinein geht, sie steht beim Tor Richtung Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("A friend of mine, Mirarie Bragolin, always needs some help. You can find her if you follow the street into the city, she is at the inner gate which leads to the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Eine Freundin Mirarie Bragolin kann auch immer etwas Hilfe benötigen. Ihr könnt sie finden wenn Ihr in die Stadt hinein geht, sie steht beim Tor Richtung Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("A friend of mine, Mirarie Bragolin, always needs some help. You can find her if you follow the street into the city, she is at the inner gate which leads to the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Eine Freundin Mirarie Bragolin kann auch immer etwas Hilfe benötigen. Ihr könnt sie finden wenn Ihr in die Stadt hinein geht, sie steht beim Tor Richtung Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 7));
talkEntry:addResponse("Hassan, the royal fan-waver, is sure to have a little task for you. You can find him in the 'Unicorn Lion' tavern, if he isn't at the palace. The tavern is north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 7));
talkEntry:addResponse("Hassan, der königliche Fächelwedler hat bestimmte eine kleine Aufgabe für Euch. Ihr könnt ihn in der Taverne 'Einhörniger Löwe' finden, wenn er grad nicht im Palast ist. Die Taverne befindet sich nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 7));
talkEntry:addResponse("Hassan, the royal fan-waver, is sure to have a little task for you. You can find him in the 'Unicorn Lion' tavern, if he isn't at the palace. The tavern is north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 7));
talkEntry:addResponse("Hassan, der königliche Fächelwedler hat bestimmte eine kleine Aufgabe für Euch. Ihr könnt ihn in der Taverne 'Einhörniger Löwe' finden, wenn er grad nicht im Palast ist. Die Taverne befindet sich nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hassan, the royal fan-waver, is sure to have a little task for you. You can find him in the 'Unicorn Lion' tavern, if he isn't at the palace. The tavern is north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hassan, der königliche Fächelwedler hat bestimmte eine kleine Aufgabe für Euch. Ihr könnt ihn in der Taverne 'Einhörniger Löwe' finden, wenn er grad nicht im Palast ist. Die Taverne befindet sich nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Hassan, the royal fan-waver, is sure to have a little task for you. You can find him in the 'Unicorn Lion' tavern, if he isn't at the palace. The tavern is north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Hassan, der königliche Fächelwedler hat bestimmte eine kleine Aufgabe für Euch. Ihr könnt ihn in der Taverne 'Einhörniger Löwe' finden, wenn er grad nicht im Palast ist. Die Taverne befindet sich nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 9));
talkEntry:addResponse("Ah..there you are again. Linda Rabon, an excellent cook, asked me to send you to her. She told me that she has probably a little task for you. You've probbaly met her in the tavern already.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 9));
talkEntry:addResponse("Ah..da seid Ihr ja wieder. Linda Rabon, eine sehr gute Köchin, hat mich gebeten Euch zu ihr zu senden. Sie sagte sie hätte eine Aufgabe für Euch. Ihr habt sie sicher bereits in der Taverne gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 9));
talkEntry:addResponse("Ah..there you are again. Linda Rabon, an excellent cook, asked me to send you to her. She told me that she has probably a little task for you. You've probbaly met her in the tavern already.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 9));
talkEntry:addResponse("Ah..da seid Ihr ja wieder. Linda Rabon, eine sehr gute Köchin, hat mich gebeten Euch zu ihr zu senden. Sie sagte sie hätte eine Aufgabe für Euch. Ihr habt sie sicher bereits in der Taverne gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ah..there you are again. Linda Rabon, an excellent cook, asked me to send you to her. She told me that she has probably a little task for you. You've probbaly met her in the tavern already.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ah..da seid Ihr ja wieder. Linda Rabon, eine sehr gute Köchin, hat mich gebeten Euch zu ihr zu senden. Sie sagte sie hätte eine Aufgabe für Euch. Ihr habt sie sicher bereits in der Taverne gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Ah..there you are again. Linda Rabon, an excellent cook, asked me to send you to her. She told me that she has probably a little task for you. You've probbaly met her in the tavern already.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ah..da seid Ihr ja wieder. Linda Rabon, eine sehr gute Köchin, hat mich gebeten Euch zu ihr zu senden. Sie sagte sie hätte eine Aufgabe für Euch. Ihr habt sie sicher bereits in der Taverne gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 11));
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Ah you are back. Great. Zerarisa, a good frilives at the Cape Farewell. Could you look for her, I haven't see her around here for quite a while. You can find the Cape if you follow the street to the west, the signposts should lead you in the right direction.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 11));
talkEntry:addResponse("Ah, Ihr seid zurück. Großartig. Zerarisa, eine gute Freundin lebt beim Kap des Abschiedes. Könntet Ihr bitte nach ihr sehen, ich hab sie schon länger nicht mehr hier gesehen. Das Kap findet Ihr, wenn Ihr der Straße nach Westen folgt, die Wegweiser sollten Euch direkt zum Kap führen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 11));
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Ah you are back. Great. Zerarisa, a good frilives at the Cape Farewell. Could you look for her, I haven't see her around here for quite a while. You can find the Cape if you follow the street to the west, the signposts should lead you in the right direction.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 11));
talkEntry:addResponse("Ah, Ihr seid zurück. Großartig. Zerarisa, eine gute Freundin lebt beim Kap des Abschiedes. Könntet Ihr bitte nach ihr sehen, ich hab sie schon länger nicht mehr hier gesehen. Das Kap findet Ihr, wenn Ihr der Straße nach Westen folgt, die Wegweiser sollten Euch direkt zum Kap führen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Ah you are back. Great. Zerarisa, a good frilives at the Cape Farewell. Could you look for her, I haven't see her around here for quite a while. You can find the Cape if you follow the street to the west, the signposts should lead you in the right direction.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ah, Ihr seid zurück. Großartig. Zerarisa, eine gute Freundin lebt beim Kap des Abschiedes. Könntet Ihr bitte nach ihr sehen, ich hab sie schon länger nicht mehr hier gesehen. Das Kap findet Ihr, wenn Ihr der Straße nach Westen folgt, die Wegweiser sollten Euch direkt zum Kap führen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Ah you are back. Great. Zerarisa, a good frilives at the Cape Farewell. Could you look for her, I haven't see her around here for quite a while. You can find the Cape if you follow the street to the west, the signposts should lead you in the right direction.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ah, Ihr seid zurück. Großartig. Zerarisa, eine gute Freundin lebt beim Kap des Abschiedes. Könntet Ihr bitte nach ihr sehen, ich hab sie schon länger nicht mehr hier gesehen. Das Kap findet Ihr, wenn Ihr der Straße nach Westen folgt, die Wegweiser sollten Euch direkt zum Kap führen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 13));
talkEntry:addResponse("Reret Odohir, our notary, told me that she is looking for you. Please go to her, you can find her in the building northwest of the tavern. It's the house with the colourful pillar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 13));
talkEntry:addResponse("Reret Odohir unser Notar sagte mir, dass sie Euch sehen will. Bitte geht doch zu ihr, Ihr könnt sie in dem Haus nordwestlich von der Taverne finden. Es ist das Haus mit der bunten Säule davor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 13));
talkEntry:addResponse("Reret Odohir, our notary, told me that she is looking for you. Please go to her, you can find her in the building northwest of the tavern. It's the house with the colourful pillar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(703, "=", 13));
talkEntry:addResponse("Reret Odohir unser Notar sagte mir, dass sie Euch sehen will. Bitte geht doch zu ihr, Ihr könnt sie in dem Haus nordwestlich von der Taverne finden. Es ist das Haus mit der bunten Säule davor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Reret Odohir, our notary, told me that she is looking for you. Please go to her, you can find her in the building northwest of the tavern. It's the house with the colourful pillar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Reret Odohir unser Notar sagte mir, dass sie Euch sehen will. Bitte geht doch zu ihr, Ihr könnt sie in dem Haus nordwestlich von der Taverne finden. Es ist das Haus mit der bunten Säule davor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Reret Odohir, our notary, told me that she is looking for you. Please go to her, you can find her in the building northwest of the tavern. It's the house with the colourful pillar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Reret Odohir unser Notar sagte mir, dass sie Euch sehen will. Bitte geht doch zu ihr, Ihr könnt sie in dem Haus nordwestlich von der Taverne finden. Es ist das Haus mit der bunten Säule davor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I'm sure you can find your way around here without my help now. Just ask the people you meet if they have tasks for you and you will be fine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich bin sicher, Ihr kommt nun auch ohne meine Hilfe zurecht. Fragt einfach die Leute, die Ihr trefft, ob sie Aufgaben für Euch haben und Ihr werdet zurechtkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I'm sure you can find your way around here without my help now. Just ask the people you meet if they have tasks for you and you will be fine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich bin sicher, Ihr kommt nun auch ohne meine Hilfe zurecht. Fragt einfach die Leute, die Ihr trefft, ob sie Aufgaben für Euch haben und Ihr werdet zurechtkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "<", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could need some help, just ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(703, "<", 14));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich könnte etwas Hilfe gebrauchen, fragt mich ruhig nach einer Aufgabe. Ich habe sicher etwas für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizen of Cadomyr. I don't have anything to do for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ihr scheint kein Bürger Cadomyr zu sein. Ich habe nichts für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in Cadomyr!", "Welcome to Cadomyr!");
talkingNPC:addCycleText("Wenn Ihr Hilfe benötigt, sprecht mich einfach an.", "If you need help, just speak to me.");
talkingNPC:addCycleText("Ich kann Euch sagen, wer in diesem Reich eure Hilfe benötigt.", "I can tell you who in this realm needs your help.");
talkingNPC:addCycleText("Wenn Ihr neu hier seid, bin ich Euer Mann.", "If you're new to this realm, I'm your man.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 362);
mainNPC:setEquipment(11, 2384);
mainNPC:setEquipment(5, 207);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 826);
mainNPC:setEquipment(10, 679);
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