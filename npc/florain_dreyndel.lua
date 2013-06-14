--------------------------------------------------------------------------------
-- NPC Name: Florain Dreyndel                                        Runewick --
-- NPC Job:  Helper                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  833, 815, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Lillian                                                          --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 833, 815, 0, 4, 'Florain Dreyndel', 'npc.florain_dreyndel', 0, 2, 5, 139, 105, 20, 238, 216, 174);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.florain_dreyndel", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Florain Dreyndel the helper. Keywords: quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Florain Dreyndel der Helfer. Schlüsselwörter: Quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 1));
talkEntry:addResponse("Welcome to Runewick. Daniel Brock, a really good carpenter, is always willing to teach people in his craft. You can find him in the Tower of Air. Go over the bridge and through the blue portal at the end to reach the marketplace, from there go to the south into the Tower of Air and down into the basement.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 0));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 1));
talkEntry:addResponse("Willkommen in Runewick. Daniel Brock, ein wirklich guter Schreiner, ist immer gewillt anderen sein Handwerk zu zeigen. Ihr könnt ihn im Turm der Luft finden. Geht über die Brücke und durch das blaue Portal an ihrem Ende, um zum Marktplatz zu gelangen. Von dort geht nach Süden in den Turm der Luft und in das Untergeschoss.");
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
talkEntry:addResponse("Hello, I can tell you who in Runewick has tasks for you to do.");
talkEntry:addResponse("Nice to meet you, I'm Florain Dreyndel, I can tell you who in Runewick has tasks for you to do.");
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
talkEntry:addResponse("Hallo, ich kann Euch sagen, wer in Runewick Aufgaben für Euch hat.");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Florain Dreyndel. Ich kann Euch sagen, wer in Runewick Aufgaben für Euch hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, I can tell you who in Runewick has tasks for you to do.");
talkEntry:addResponse("Nice to meet you, I'm Florain Dreyndel, I can tell you who in Runewick has tasks for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, ich kann Euch sagen, wer in Runewick Aufgaben für Euch hat.");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Florain Dreyndel. Ich kann Euch sagen, wer in Runewick Aufgaben für Euch hat.");
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
talkEntry:addResponse("I'm Florain Dreyndel. I'm here to help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Florain Dreyndel. Ich bin hier zum Helfen.");
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
talkEntry:addTrigger("market");
talkEntry:addResponse("Just follow the bridge and go through the blue portal at the end. Ask Elesil Dealwon over there if you want to know more about the places around Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("markt");
talkEntry:addResponse("Folgt einfach der Brücke bis zum Ende und geht durch das blaue Portal. Fragt Elesil Dealwon dort drüben, wenn Ihr mehr über die Orte um Runewick herum wissen wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elesil");
talkEntry:addTrigger("Dealwon");
talkEntry:addResponse("She is right over there, just go over and talk to her. She knows a lot about Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elesil");
talkEntry:addTrigger("Dealwon");
talkEntry:addResponse("Sie ist gleich dort drüben, geht einfach zu ihr rüber und sprecht sie an. Sie weiß eine Menge über Runewick.");
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
talkEntry:addResponse("There are a few wild animals in the wilderness so be careful. If you want to train ask around for a sparring partner.");
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
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("This is Runewick, my home. We are a realm of just and kind people, I'm sure you will enjoy it here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dies is Runewick, mein Zuhause. Wir sind ein Reich von gutmütigen und aufrichtigen Leuten, ich bin mir sicher, dass Ihr es hier mögen werdet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Daniel Brock, a really good carpenter, is always willing to teach people in his craft. You can find him in the Tower of Air. Go over the bridge and through the blue portal at the end to reach the marketplace, from there go to the south into the Tower of Air and down into the basement.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Daniel Brock, ein wirklich guter Schreiner, ist immer gewillt anderen sein Handwerk zu zeigen. Ihr könnt ihn im Turm der Luft finden. Geht über die Brücke und durch das blaue Portal an ihrem Ende, um zum Marktplatz zu gelangen. Von dort geht nach Süden in den Turm der Luft und in das Untergeschoss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Daniel Brock, a really good carpenter, is always willing to teach people in his craft. You can find him in the Tower of Air. Go over the bridge and through the blue portal at the end to reach the marketplace, from there go to the south into the Tower of Air and down into the basement.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Daniel Brock, ein wirklich guter Schreiner, ist immer gewillt anderen sein Handwerk zu zeigen. Ihr könnt ihn im Turm der Luft finden. Geht über die Brücke und durch das blaue Portal an ihrem Ende, um zum Marktplatz zu gelangen. Von dort geht nach Süden in den Turm der Luft und in das Untergeschoss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 3));
talkEntry:addResponse("You're back. Good. Judith Tanner could teach you something about tailoring. Go to her in the Tower of Fire, it is to the north of the marketplace. There go into the basement and through the door to the south of the tavern. You will recognize her by the unusual colour of her hair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 3));
talkEntry:addResponse("Ihr seid zurück. Schön. Judith Tanner kann euch etwas über das Schneiderhandwerk beibringen. Geht zu ihr im Turm des Feuers, das ist der Turm im Norden vom Marktplatz. Geht dort in das Untergeschoss und durch die Tür im Süden der Taverne. Ihr werdet sie an ihrer ungewöhnlichen Haarfarbe erkennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 3));
talkEntry:addResponse("You're back. Good. Judith Tanner could teach you something about tailoring. Go to her in the Tower of Fire, it is to the north of the marketplace. There go into the basement and through the door to the south of the tavern. You will recognize her by the unusual colour of her hair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 3));
talkEntry:addResponse("Ihr seid zurück. Schön. Judith Tanner kann euch etwas über das Schneiderhandwerk beibringen. Geht zu ihr im Turm des Feuers, das ist der Turm im Norden vom Marktplatz. Geht dort in das Untergeschoss und durch die Tür im Süden der Taverne. Ihr werdet sie an ihrer ungewöhnlichen Haarfarbe erkennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You're back. Good. Judith Tanner could teach you something about tailoring. Go to her in the Tower of Fire, it is to the north of the marketplace. There go into the basement and through the door to the south of the tavern. You will recognize her by the unusual colour of her hair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr seid zurück. Schön. Judith Tanner kann euch etwas über das Schneiderhandwerk beibringen. Geht zu ihr im Turm des Feuers, das ist der Turm im Norden vom Marktplatz. Geht dort in das Untergeschoss und durch die Tür im Süden der Taverne. Ihr werdet sie an ihrer ungewöhnlichen Haarfarbe erkennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You're back. Good. Judith Tanner could teach you something about tailoring. Go to her in the Tower of Fire, it is to the north of the marketplace. There go into the basement and through the door to the south of the tavern. You will recognize her by the unusual colour of her hair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ihr seid zurück. Schön. Judith Tanner kann euch etwas über das Schneiderhandwerk beibringen. Geht zu ihr im Turm des Feuers, das ist der Turm im Norden vom Marktplatz. Geht dort in das Untergeschoss und durch die Tür im Süden der Taverne. Ihr werdet sie an ihrer ungewöhnlichen Haarfarbe erkennen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 5));
talkEntry:addResponse("I heard that my friend Zassaria Riverbank needs help. You can find her at the marketplace, just go over the bridge and through the blue portal at the end to reach it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 5));
talkEntry:addResponse("Ich habe gehört, dass meine Freundin Zassaria Riverbank Hilfe benötigt. Ihr könnt sie auf dem Marktplatz finden, geht einfach über die Brücke und durch das blaue Portal an ihrem Ende, um dorthin zu gelangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 5));
talkEntry:addResponse("I heard that my friend Zassaria Riverbank needs help. You can find her at the marketplace, just go over the bridge and through the blue portal at the end to reach it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 5));
talkEntry:addResponse("Ich habe gehört, dass meine Freundin Zassaria Riverbank Hilfe benötigt. Ihr könnt sie auf dem Marktplatz finden, geht einfach über die Brücke und durch das blaue Portal an ihrem Ende, um dorthin zu gelangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I heard that my friend Zassaria Riverbank needs help. You can find her at the marketplace, just go over the bridge and through the blue portal at the end to reach it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 5));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich habe gehört, dass meine Freundin Zassaria Riverbank Hilfe benötigt. Ihr könnt sie auf dem Marktplatz finden, geht einfach über die Brücke und durch das blaue Portal an ihrem Ende, um dorthin zu gelangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I heard that my friend Zassaria Riverbank needs help. You can find her at the marketplace, just go over the bridge and through the blue portal at the end to reach it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 5));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich habe gehört, dass meine Freundin Zassaria Riverbank Hilfe benötigt. Ihr könnt sie auf dem Marktplatz finden, geht einfach über die Brücke und durch das blaue Portal an ihrem Ende, um dorthin zu gelangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 7));
talkEntry:addResponse("So I suppose you have already visited my friend Zassaria Riverbank and helped her? I heard Neiran El Nayale can teach you something. He can be found in the Tower of Fire on the upper floor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 7));
talkEntry:addResponse("Ich nehme an, Ihr habt meine Freundin Zassaria Riverbank bereits besucht und ihr geholfen. Ich habe gehört, dass Neiran El Nayale Euch etwas beibringen kann. Ihr könnt ihn im Turm des Feuers im Obergeschoss finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 7));
talkEntry:addResponse("So I suppose you have already visited my friend Zassaria Riverbank and helped her? I heard Neiran El Nayale can teach you something. He can be found in the Tower of Fire on the upper floor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 7));
talkEntry:addResponse("Ich nehme an, Ihr habt meine Freundin Zassaria Riverbank bereits besucht und ihr geholfen. Ich habe gehört, dasss Neiran El Nayale euch etwas beibringen kann. Ihr könnt ihn im Turm des Feuers im Obergeschoss finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("So I suppose you have already visited my friend Zassaria Riverbank and helped her? I heard Neiran El Nayale can teach you something. He can be found in the Tower of Fire on the upper floor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich nehme an, Ihr habt meine Freundin Zassaria Riverbank bereits besucht und ihr geholfen. Ich habe gehört, dass Neiran El Nayale Euch etwas beibringen kann. Ihr könnt ihn im Turm des Feuers im Obergeschoss finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("So I suppose you have already visited my friend Zassaria Riverbank and helped her? I heard Neiran El Nayale can teach you something. He can be found in the Tower of Fire on the upper floor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich nehme an, Ihr habt meine Freundin Zassaria Riverbank bereits besucht und ihr geholfen. Ich habe gehört, dass Neiran El Nayale Euch etwas beibringen kann. Ihr könnt ihn im Turm des Feuers im Obergeschoss finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 9));
talkEntry:addResponse("My friend Baldo Proudtoe always needs some help. You can find him in the gardens. Just go back to the marketplace and then through the red portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 9));
talkEntry:addResponse("Mein Freund Baldo Proudtoe kann auch immer etwas Hilfe benötigen. Ihr könnt ihn im Garten finden. Geht einfach zurück zum Marktplatz und geht durch das rote Portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 9));
talkEntry:addResponse("My friend Baldo Proudtoe always needs some help. You can find him in the gardens. Just go back to the marketplace and then through the red portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 9));
talkEntry:addResponse("Mein Freund Baldo Proudtoe kann auch immer etwas Hilfe benötigen. Ihr könnt ihn im Garten finden. Geht einfach zurück zum Marktplatz und geht durch das rote Portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("My friend Baldo Proudtoe always needs some help. You can find him in the gardens. Just go back to the marketplace and then through the red portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 9));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Mein Freund Baldo Proudtoe kann auch immer etwas Hilfe benötigen. Ihr könnt ihn im Garten finden. Geht einfach zurück zum Marktplatz und geht durch das rote Portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 9));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("My friend Baldo Proudtoe always needs some help. You can find him in the gardens. Just go back to the marketplace and then through the red portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 9));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Mein Freund Baldo Proudtoe kann auch immer etwas Hilfe benötigen. Ihr könnt ihn im Garten finden. Geht einfach zurück zum Marktplatz und geht durch das rote Portal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 11));
talkEntry:addResponse("Nana Winterbutter, a great cook if I might add, is also always looking for someone to help. You can find her just north of here on the other side of the hedge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 10));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 11));
talkEntry:addResponse("Nana Winterbutter, eine größartige Köchin, wenn ich das so sagen darf, sucht auch immer nach fleißigen Helfern. Ihr könnt sie gleich nördlich von hier finden, auf der anderen Seite der Hecke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 10));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 11));
talkEntry:addResponse("Nana Winterbutter, a great cook if I might add, is also always looking for someone to help. You can find her just north of here on the other side of the hedge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 10));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 11));
talkEntry:addResponse("Nana Winterbutter, eine größartige Köchin, wenn ich das so sagen darf, sucht auch immer nach fleißigen Helfern. Ihr könnt sie gleich nördlich von hier finden, auf der anderen Seite der Hecke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nana Winterbutter, a great cook if I might add, is also always looking for someone to help. You can find her just north of here on the other side of the hedge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 11));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nana Winterbutter, eine größartige Köchin, wenn ich das so sagen darf, sucht auch immer nach fleißigen Helfern. Ihr könnt sie gleich nördlich von hier finden, auf der anderen Seite der Hecke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 11));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Nana Winterbutter, a great cook if I might add, is also always looking for someone to help. You can find her just north of here on the other side of the hedge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 11));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nana Winterbutter, eine größartige Köchin, wenn ich das so sagen darf, sucht auch immer nach fleißigen Helfern. Ihr könnt sie gleich nördlich von hier finden, auf der anderen Seite der Hecke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 13));
talkEntry:addResponse("A little bird told me that the apprentice Madeline Clarbelis could use some help. You can find her easily. Just go back to the marketplace, through the Tower of Fire to the north and leave it over the bridge to the east into the Tower of Earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 12));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 13));
talkEntry:addResponse("Ein Vogel hat mir erzählt, dass die Anwärterin Madeline Clarbelis hilfe benötigt. Es ist einfach, sie zu finden. Geht einfach zurück zum Marktplatz, durch den Turm des Feuers im Westen und verlasst es über die Brücke im Osten in den Turm der Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 12));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 13));
talkEntry:addResponse("A little bird told me that the apprentice Madeline Clarbelis could use some help. You can find her easily. Just go back to the marketplace through the Tower of Fire to the north and leave it over the bridge to the east into the Tower of Earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 12));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 13));
talkEntry:addResponse("Ein Vogel hat mir erzählt, dass die Anwärterin Madeline Clarbelis hilfe benötigt. Es ist einfach, sie zu finden. Geht einfach zurück zum Marktplatz, durch den Turm des Feuers im Westen und verlasst es über die Brücke im Osten in den Turm der Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("A little bird told me that the apprentice Madeline Clarbelis could use some help. You can find her easily. Just go back to the marketplace, through the Tower of Fire to the north and leave it over the bridge to the east into the Tower of Earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 13));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ein Vogel hat mir erzählt, dass die Anwärterin Madeline Clarbelis hilfe benötigt. Es ist einfach, sie zu finden. Geht einfach zurück zum Marktplatz, durch den Turm des Feuers im Westen und verlasst es über die Brücke im Osten in den Turm der Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 13));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("A little bird told me that the apprentice Madeline Clarbelis could use some help. You can find her easily. Just go back to the marketplace, through the Tower of Fire to the north and leave it over the bridge to the east into the Tower of Earth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 13));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ein Vogel hat mir erzählt, dass die Anwärterin Madeline Clarbelis hilfe benötigt. Es ist einfach, sie zu finden. Geht einfach zurück zum Marktplatz, durch den Turm des Feuers im Westen und verlasst es über die Brücke im Osten in den Turm der Erde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 15));
talkEntry:addResponse("Uriel Urch, a retired soldier needs someone to keep him company and listen to his story. I'm sure he will reward you for your time. You can find him when you go into the northern Tower of Fire from the marketplace and down the flight of stairs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 14));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 15));
talkEntry:addResponse("Uriel Urch könnte jemanden gebrauchen, der Zeit mit ihm verbringt und seiner Geschichte lauscht. Er wird Euch sicher für Eure Zeit belohnen. Ihr könnt ihn finden, wenn Ihr in dem Turm des Feuers nördlich vom Marktplatz die Treppe nach unten geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 14));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 15));
talkEntry:addResponse("Uriel Urch, a retired soldier needs someone to keep him company and listen to his story. I'm sure he will reward you for your time. You can find him when you go into the northern Tower of Fire from the marketplace and down the flight of stairs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 14));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 15));
talkEntry:addResponse("Uriel Urch könnte jemanden gebrauchen, der Zeit mit ihm verbringt und seiner Geschichte lauscht. Er wird Euch sicher für Eure Zeit belohnen. Ihr könnt ihn finden, wenn Ihr in dem Turm des Feuers nördlich vom Marktplatz die Treppe nach unten geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 15));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Uriel Urch, a retired soldier needs someone to keep him company and listen to his story. I'm sure he will reward you for your time. You can find him when you go into the northern Tower of Fire from the marketplace and down the flight of stairs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 15));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Uriel Urch könnte jemanden gebrauchen, der Zeit mit ihm verbringt und seiner Geschichte lauscht. Er wird Euch sicher für Eure Zeit belohnen. Ihr könnt ihn finden, wenn Ihr in dem Turm des Feuers nördlich vom Marktplatz die Treppe nach unten geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 15));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Uriel Urch, a retired soldier needs someone to keep him company and listen to his story. I'm sure he will reward you for your time. You can find him when you go into the northern Tower of Fire from the marketplace and down the flight of stairs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 15));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Uriel Urch könnte jemanden gebrauchen, der Zeit mit ihm verbringt und seiner Geschichte lauscht. Er wird Euch sicher für Eure Zeit belohnen. Ihr könnt ihn finden, wenn Ihr in dem Turm des Feuers nördlich vom Marktplatz die Treppe nach unten geht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 16));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 17));
talkEntry:addResponse("Lilith Needlehand the tailor is looking for someone to lend a hand. She can be found just around the corner from Uriel, downstairs in the Tower of Fire north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 16));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 17));
talkEntry:addResponse("Lilith Needlehand sucht jemanden, der ihr behilflich ist. Ihr könnt sie in der Nähe von Uriel finden. Die Treppe runter in dem Turm des Feuers nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 16));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 17));
talkEntry:addResponse("Lilith Needlehand the tailor is looking for someone to lend a hand. She can be found just around the corner from Uriel, downstairs in the Tower of Fire north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 16));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(820, "=", 17));
talkEntry:addResponse("Lilith Needlehand sucht jemanden, der ihr behilflich ist. Ihr könnt sie in der Nähe von Uriel finden. Die Treppe runter in dem Turm des Feuers nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 17));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Lilith Needlehand the tailor is looking for someone to lend a hand. She can be found just around the corner from Uriel, downstairs in the Tower of Fire north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 17));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Lilith Needlehand sucht jemanden, der ihr behilflich ist. Ihr könnt sie in der Nähe von Uriel finden. Die Treppe runter in dem Turm des Feuers nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 17));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Lilith Needlehand the tailor is looking for someone to lend a hand. She can be found just around the corner from Uriel, downstairs in the Fower of Fire north of the marketplace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 17));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Lilith Needlehand sucht jemanden, der ihr behilflich ist. Ihr könnt sie in der Nähe von Uriel finden. Die Treppe runter in dem Turm des Feuers nördlich vom Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I'm sure you can find your way around here without my help now. Just ask the people you meet if they have tasks for you and you will be fine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 18));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich bin sicher, Ihr kommt nun auch ohne meine Hilfe zurecht. Fragt einfach die Leute, die Ihr trefft, ob sie Aufgaben für Euch haben und Ihr werdet zurechtkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 18));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I'm sure you can find your way around here without my help now. Just ask the people you meet if they have tasks for you and you will be fine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(820, "=", 18));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich bin sicher, Ihr kommt nun auch ohne meine Hilfe zurecht. Fragt einfach die Leute, die Ihr trefft, ob sie Aufgaben für Euch haben und Ihr werdet zurechtkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I cannot help you with that. Why not ask Elesil Daelwon over there, I'm sure she has the answer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich kann Euch damit nicht helfen. Wieso fragt Ihr nicht Elesil Daelwon dort drüben, ich bin mir sicher sie hat eine Antwort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in Runewick!", "Welcome to Runewick!");
talkingNPC:addCycleText("Wenn ihr Hilfe benötigt, sprecht mich einfach an.", "If you need help, just speak to me.");
talkingNPC:addCycleText("Ich kann Euch sagen, wer in diesem Reich eure Hilfe benötigt.", "I can tell you who in this realm needs your help.");
talkingNPC:addCycleText("Wenn Ihr neu hier seid, bin ich Euer Mann.", "If you're new to this realm, I'm your man.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 461);
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