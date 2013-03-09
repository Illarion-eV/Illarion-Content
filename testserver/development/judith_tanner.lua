--------------------------------------------------------------------------------
-- NPC Name: Judith Tanner                                           Runewick --
-- NPC Job:  Tailor                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  905, 780, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Zot                                                              --
--                                                       easyNPC Parser v1.23 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 905, 780, 0, 4, 'Judith Tanner', 'npc.judith_tanner', 1, 7, 0, 160, 55, 196, 245, 200, 145);
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
module("development.judith_tanner", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Judith Tanner the tailor. Keywords: quest, cloth, sheeps"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Judith Tanner die Schneiderin. Schlüsselwörter: Quest, Stoff, Schafe"));
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
talkEntry:addResponse("Nice to meet you, I'm Judith Tanner.");
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
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Judith Tanner.");
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
talkEntry:addResponse("Nice to meet you, I'm Judith Tanner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, kann ich Euch helfen?");
talkEntry:addResponse("Freut mich, Euch zu treffen. Ich bin Judith Tanner");
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
talkEntry:addResponse("Ich hoffe wir sehen uns wieder, auf bald!");
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
talkEntry:addResponse("I'm Judith Tanner, who are you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Judith Tanner. Wer bist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a tailor. Do you want to know more about it? Then just ask me for a task!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Schneiderin. Wollt Ihr mehr darüber wissen? Dann fragt mich einfach nach einer Aufgabe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a tailor. Do you want to know more about it? Then just ask me for a task!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Schneiderin. Wollt Ihr mehr darüber wissen? Dann fragt mich einfach nach einer Aufgabe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("cloth");
talkEntry:addResponse("If you place grey cloth on the ground and let it bleach in the sun it will turn into white cloth. That works with some dye as well!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stoff");
talkEntry:addResponse("Wenn Ihr grauen Stoff auf den Boden legt und ihn in der Sonne trocknen lasst, dann wird er zu weißem Stoff. Das funktioniert übrigens auch mit einigen Farben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("tailor");
talkEntry:addResponse("For tailoring you need many different things, the most important ones are scissors and a needle though!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schneid");
talkEntry:addResponse("Zum Schneidern braucht Ihr verschiedene Dinge. Das wichtigste ist aber wohl eine Schere und eine Nadel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("sheep");
talkEntry:addResponse("If you leave the town and you can find sheeps at the forest or at yewdale.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schaf");
talkEntry:addResponse("Schafe findet Ihr außerhalb der Stadt im Wald oder bei Yewdale.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("scissors");
talkEntry:addResponse("You can get scissors from a smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schere");
talkEntry:addResponse("Eine Schere kann Euch ein Schmied herstellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("needle");
talkEntry:addResponse("You can get a needle from a smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nadel");
talkEntry:addResponse("Eine Nadel bekommt Ihr bei einem Schmied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(6, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 1));
talkEntry:addResponse("Oh, you want to learn something about tailoring? Well, let's start with something simple. Could you collect twenty bales of wool for me? You can find sheep if you leave the city and look around for them in the forest or Yewdale. You can have my old scissors to collect the wool.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(6, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 1));
talkEntry:addResponse("Oh, Ihr wollt etwas über das Schneidern lernen? Nun gut, fangen wir mit etwas Einfachem an. Bringt mir doch bitte 20 Wollknäule. Schafe solltet Ihr finden, wenn Ihr die Stadt verlasst und in den Wäldern oder Yewdale sucht. Hier noch eine Schere, um die Schafe zu scheren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(6, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 1));
talkEntry:addResponse("Oh, you want to learn something about tailoring?Well, let's start with something simple. Could you collect twenty bales of wool for me? You can find sheep if you leave the city and look around for them in the forest or Yewdale. You can have my old scissors to collect the wool.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(6, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 1));
talkEntry:addResponse("Oh, Ihr wollt etwas über das Schneidern lernen? Nun gut, fangen wir mit etwas Einfachem an. Bringt mir doch bitte 20 Wollknäule. Schafe solltet Ihr finden, wenn Ihr die Stadt verlasst und in den Wäldern oder Yewdale sucht. Hier noch eine Schere, um die Schafe zu scheren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 2));
talkEntry:addResponse("Ah, so you found the sheep, well done. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 2));
talkEntry:addResponse("Ah, also habt Ihr die Schafe gefunden, gut gemacht. Wollt Ihr eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 2));
talkEntry:addResponse("Ah, so you found the sheep, well done. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 2));
talkEntry:addResponse("Ah, also habt Ihr die Schafe gefunden, gut gemacht. Wollt Ihr eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("That isn't twenty bales of wool yet, please come back once you've finished this task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(170, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Das sind noch keine 20 Wollknäule, die ich haben wollte. Kommt wieder, wenn Ihr die Aufgabe erledigt habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 3));
talkEntry:addResponse("You want another task? Alright, please go to the loom over there and make two sheets of grey cloth. Furthermore, go to the spinning wheel and produce five spools of thread from the remaining wool.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 3));
talkEntry:addResponse("Ihr wollt noch eine Aufgabe? Von mir aus gerne. Bitte geht zum Webstuhl da vorne und macht aus den zwei übrigen Knäulen grauen Stoff und aus den anderen zehn Knäulen beim Spinnrad daneben Garn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 3));
talkEntry:addResponse("You want another task? Alright, please go to the loom over there and make two sheets of grey cloth. Furthermore, go to the spinning wheel and produce five spools of thread from the remaining wool.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 3));
talkEntry:addResponse("Ihr wollt noch eine Aufgabe? Von mir aus gerne. Bitte geht zum Webstuhl da vorne und macht aus den zwei übrigen Knäulen grauen Stoff und aus den anderen zehn Knäulen beim Spinnrad daneben Garn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 4));
talkEntry:addResponse("Well done. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 4));
talkEntry:addResponse("Gut gemacht. Wollt Ihr eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 4));
talkEntry:addResponse("Well done. Do you want another task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 4));
talkEntry:addResponse("Gut gemacht. Wollt Ihr eine weitere Aufgabe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Could you produce two sheets of grey cloth and five spools of thread from the remaining twenty bales of wool for me please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(176, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Stellt doch bitte aus den übrigen 20 Wollknäulen fünf Garnrollen und zwei Rollen grauen Stoff her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Could you produce two sheets of grey cloth and five spools of thread from the remaining twenty bales of wool for me please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(50, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Stellt doch bitte aus den übrigen 20 Wollknäulen fünf Garnrollen und zwei Rollen grauen Stoff her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(176, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(50, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 5));
talkEntry:addResponse("You want another task? Well alright, could you produce a grey dress for me please? Here take this needle, some thread and grey cloth to produce the dress at the tailoring table next me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(176, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(50, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 5));
talkEntry:addResponse("Ihr wollt noch eine weitere Aufgabe? Nun gut, meinetwegen. Geht zum Schneidertisch neben mir und stellt mir bitte ein graues Gewand her. Hier habt Ihr eine Nadel, etwas grauen Stoff und einige Garnrollen, um das Gewand herzustellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(176, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(50, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 5));
talkEntry:addResponse("You want another task? Well alright, could you produce a grey dress for me please? Here take this needle, some thread and grey cloth to produce the dress at the tailoring table next me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(47, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(176, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(50, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 5));
talkEntry:addResponse("Ihr wollt noch eine weitere Aufgabe? Nun gut, meinetwegen. Geht zum Schneidertisch neben mir und stellt mir bitte ein graues Gewand her. Hier habt Ihr eine Nadel, etwas grauen Stoff und einige Garnrollen, um das Gewand herzustellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(802, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(802, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 6));
talkEntry:addResponse("Well done, thank you very much. If you have more time I can give you another task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(802, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(802, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Wenn Ihr noch etwas Zeit erübrigen könnt, hätte ich eine weitere Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(802, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(802, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 6));
talkEntry:addResponse("Well done, thank you very much. If you have more time I can give you another task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(802, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(802, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 6));
talkEntry:addResponse("Gut gemacht, vielen Dank. Wenn Ihr noch etwas Zeit erübrigen könnt, hätte ich eine weitere Aufgabe für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(802, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Come back once you've made the grey dress I'm looking for.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(802, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt, wie ich sehe. Bitte bringt mir ein graues Gewand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(58, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(302, 15, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(544, 3, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 7));
talkEntry:addResponse("Let's produce some dye now, you will need dye for tailoring as well. Please go outside and make a little fire with the wood, which you get from me, and produce five buckets of red dye. You need a mortar, five buckets filled with water and fifteen cherries to make the dye. I'll give you these things, just this once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(58, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(302, 15, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(544, 3, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 7));
talkEntry:addResponse("Lasst uns nun etwas Farbe herstellen. Bitte geht hinaus, macht ein kleines Feuer mit dem dem Holz, das ich Euch gebe, und stellt fünf Eimer mit roter Farbe her. Dafür braucht Ihr außerdem noch einen Mörser, 5 Eimer mit Wasser darin und 15 Kirschen. Dies kriegt Ihr heute ausnahmsweise alles von mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(58, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(302, 15, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(544, 3, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 7));
talkEntry:addResponse("Let's produce some dye now, you will need dye for tailoring as well. Please go outside and make a little fire with the wood, which you get from me, and produce five buckets of red dye. You need a mortar, five buckets filled with water and fifteen cherries to make the dye. I'll give you these things, just this once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(58, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(52, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(302, 15, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(544, 3, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 7));
talkEntry:addResponse("Lasst uns nun etwas Farbe herstellen. Bitte geht hinaus, macht ein kleines Feuer mit dem dem Holz, das ich Euch gebe, und stellt fünf Eimer mit roter Farbe her. Dafür braucht Ihr außerdem noch einen Mörser, 5 Eimer mit Wasser darin und 15 Kirschen. Dies kriegt Ihr heute ausnahmsweise alles von mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2681, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 8));
talkEntry:addResponse("Well done, thank you very much. I have one last task for you if you are interested?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2681, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 8));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich habe eine letzte Aufgabe für Euch, wenn Ihr Interesse habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2681, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 8));
talkEntry:addResponse("Well done, thank you very much. I have one last task for you if you are interested?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2681, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 8));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ich habe eine letzte Aufgabe für Euch, wenn Ihr Interesse habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2681, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Come back once you've filled all five buckets with red dye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2681, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt, wie ich sehe. Bitte bringt mir die fünf Eimer mit roter Farbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2781, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(178, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 9));
talkEntry:addResponse("Alright, one last task. Please bring me five bolts of red cloth. You need a dyeing rod, white cloth and of course the buckets of dye. You can get white cloth if you place grey cloth on the ground and let it bleach in the sun. I'll give you my old dyeing rod and some white cloth. Please bring me five red cloth back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2781, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(178, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 9));
talkEntry:addResponse("Nun gut, eine letzte Aufgabe für Euch. Ihr sollt mir fünf rote Stoffe färben. Dazu braucht Ihr einen Färbestab, weißen Stoff und natürlich die Eimer mit Farbe. Wenn Ihr grauen Stoff lang genug in der Sonne liegen lasst, wird er weiß. Hier ich gebe euch meinen alten Färbestab, außerdem noch etwas weißen Stoff. Geht zum schwarzen Fass da vorne und stellt mir die fünf Rollen roten Stoff her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(2781, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(178, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 9));
talkEntry:addResponse("Alright, one last task. Please bring me five bolts of red cloth. You need a dyeing rod, white cloth and of course the buckets of dye. You can get white cloth if you place grey cloth on the ground and let it bleach in the sun. I'll give you my old dyeing rod and some white cloth. Please bring me five red cloth back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(2781, 1, 555, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(178, 5, 555, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 9));
talkEntry:addResponse("Nun gut, eine letzte Aufgabe für Euch. Ihr sollt mir fünf rote Stoffe färben. Dazu braucht Ihr einen Färbestab, weißen Stoff und natürlich die Eimer mit Farbe. Wenn Ihr grauen Stoff lang genug in der Sonne liegen lasst, wird er weiß. Hier ich gebe euch meinen alten Färbestab außerdem noch etwas weißen Stoff. Geht zum schwarzen Fass da vorne und stellt mir die fünf Rollen roten Stoff her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 10));
talkEntry:addResponse("Well done, thank you very much. You helped me a lot, I hope I was able to teach you the basics of tailoring.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 10));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ihr wart mir eine wirklich große Hilfe. Ich hoffe, ich konnte Euch auch etwas beibringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 10));
talkEntry:addResponse("Well done, thank you very much. You helped me a lot, I hope I was able to teach you the basics of tailoring.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(715, "=", 10));
talkEntry:addResponse("Gut gemacht, vielen Dank. Ihr wart mir eine wirklich große Hilfe. Ich hoffe, ich konnte Euch auch etwas beibringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You haven't solved the task yet. Come back once you have the five bolts of red cloth for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(174, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Ihr habt die Aufgabe noch nicht erfüllt, wie ich sehe. Kommt doch bitte wieder, wenn Ihr die fünf Rollen roten Stoff zusammen habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I don't have anything for you to do anymore. Thank you for the help though!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich habe nichts weiter für Euch zu tun. Aber danke nochmals für Eure Hilfe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could use some help, just ask me for a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(715, "<", 10));
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
talkingNPC:addCycleText("Wenn Ihr Hilfe beim schneidern braucht, dann fragt nur mich!", "If you need any help in tailoring, just ask me!");
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
mainNPC:setEquipment(11, 2421);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 844);
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