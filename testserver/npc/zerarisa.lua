--------------------------------------------------------------------------------
-- NPC Name: Zerarisa                                                 Cadomyr --
-- NPC Job:  fisherwoman                                                      --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  46, 683, 0             --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 46, 683, 0, 4, 'Zerarisa', 'npc.zerarisa', 1, 3, 0, 200, 130, 0, 60, 140, 100);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.consequence.talkstate")
require("npc.base.talk")
module("npc.zerarisa", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the fisherwoman Zerarisa. Keywords: Hello, quest, rod, fisher."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist die Fischerin Zerarisa. Schlüsselwörter: Hallo, Quest, Angelrute, Fischerin."));
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
talkEntry:addResponse("Greetingsss to you.");
talkEntry:addResponse("Yess, greetingss.");
talkEntry:addResponse("Blessingss of the Mother upon you, greetingss");
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
talkEntry:addResponse("Grüßsse dir.");
talkEntry:addResponse("Ja, Grüßsse.");
talkEntry:addResponse("Grüßsse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetingsss to you.");
talkEntry:addResponse("Yess, greetingss.");
talkEntry:addResponse("Greetsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüßsse dir.");
talkEntry:addResponse("Ja, Grüßsse.");
talkEntry:addResponse("Grüßsse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May the rainsss be heavy and frequent.");
talkEntry:addResponse("May the ssea-Mother watch your path.");
talkEntry:addResponse("Farewell, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Mögenss Regen häufig und ssstark sssein.");
talkEntry:addResponse("Mögenss die Meermutter dein Pfad leitenss.");
talkEntry:addResponse("Abschied, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Goodbye");
talkEntry:addResponse("Farewell");
talkEntry:addResponse("#me nods slowly: 'Goodbye'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Gut wiedersehensss.");
talkEntry:addResponse("Abschied.");
talkEntry:addResponse("#me nickt langsam: 'Gut wiedersehensss'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Zerarisa iss fine, yess, but her claw hurtsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Zerarisa issst gut, ja, aber Krallensss ssschmerzensss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I be Zerarisa, would you like to do a job for me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich sindss Zerarisa, machenss du Aufgabe für michss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 0));
talkEntry:addTrigger("rod");
talkEntry:addResponse("You'll need a fissshing rod, you can get one from Fredericus, if the line breakss, you need thread to fix.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 0));
talkEntry:addTrigger("rute");
talkEntry:addTrigger("angel");
talkEntry:addResponse("Brauchenss Angelrute, gehenss Fredericuss. Wennss Sschnur reißenss, brauchensss Fadensss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rod");
talkEntry:addResponse("Broke your rod? If itss jusst the line, you can usse thread to fix it. If itss the wood, assk a carpenter for a new one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rute");
talkEntry:addTrigger("angel");
talkEntry:addResponse("Habenss gebrochen die Rute? Wennss die Schnur, brauchenss Faden. Wennss das Holzss, brauchenss Ssschreiner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell I"));
talkEntry:addConsequence(npc.base.consequence.item.item(72, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 1));
talkEntry:addResponse("Zerarisa hass hurt her claw, if you could collect ten trout for me, I give you coinsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes I"));
talkEntry:addConsequence(npc.base.consequence.item.item(72, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 1));
talkEntry:addResponse("Sschwester Zerarisa habenss verletzt Pfote, fangenss zssehn Forelle, kriegenss Münzssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell I"));
talkEntry:addConsequence(npc.base.consequence.item.item(72, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 1));
talkEntry:addResponse("Zerarisa hass hurt her claw, if you could collect ten trout for me, I give you coinsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes I"));
talkEntry:addConsequence(npc.base.consequence.item.item(72, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 1));
talkEntry:addResponse("Sschwester Zerarisa habenss verletzt Pfote, fangenss zssehn Forelle, kriegenss Münzssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Did you get the ten troutss for me yet?");
talkEntry:addResponse("Zerarisa iss sstill waiting for the troutss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habenss zssehn Forellen? Nein?");
talkEntry:addResponse("Zerarisa wartenss auf Forellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Did you get the ten troutss for me yet?");
talkEntry:addResponse("Zerarisa iss sstill waiting for the troutss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Habenss zssehn Forellen? Nein?");
talkEntry:addResponse("Zerarisa wartenss auf Forellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins and your fishing skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Zerarisa thankss you for the troutss, here, take ssome coinss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Zerarisa thankss you for the troutss, here, take ssome coinss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Silberstücke und deine Fischereifertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Zerarisa dankenss für Forellen, nehmenss Silberss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Silberstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Zerarisa dankenss für Forellen, nehmenss Silberss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins and your fishing skill increases."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addResponse("Zerarisa thankss you for the troutss, here, take ssome coinss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded five silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addResponse("Zerarisa thankss you for the troutss, here, take ssome coinss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Silberstücke und deine Fischereifertigkeit steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addResponse("Zerarisa dankenss für Forellen, nehmenss Silberss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(73, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst fünf Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(73, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 2));
talkEntry:addResponse("Zerarisa dankenss für Forellen, nehmenss Silberss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 3));
talkEntry:addResponse("Thankss for troutss again, if you want you can catch twenty ssalmonss for me now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 3));
talkEntry:addResponse("Dankss für Forellen nochmalss, wollenss fangen zsswanzig Lachss nun für Zerarisa?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 3));
talkEntry:addResponse("Thankss for troutss again, if you want you can catch twenty ssalmonss for me now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 3));
talkEntry:addResponse("Dankss für Forellen nochmalss, wollenss fangen zsswanzig Lachss nun für Zerarisa?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Twenty ssalmonss for Zerarisa, and you get coinss.");
talkEntry:addResponse("Zerarisa sstill waitss for her ssalmonss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 20, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zsswanzigs Lachsess, kriegenss Münzssenss.");
talkEntry:addResponse("Zerarisa immernoch wartenss für Lachsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 20, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Twenty ssalmonss for Zerarisa, and you get coinss.");
talkEntry:addResponse("Zerarisa sstill waitss for her ssalmonss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", "<", 20, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Zsswanzigs Lachsess, kriegenss Münzssenss.");
talkEntry:addResponse("Zerarisa immernoch wartenss für Lachsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your fishing skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkEntry:addResponse("Thankss for ssalmonss, Zerarisa hass coinss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkEntry:addResponse("Thankss for ssalmonss, Zerarisa hass coinss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke und deine Fischereifertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkEntry:addResponse("Dankss für Lachsss, Zerarisa habenss Münzssen für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkEntry:addResponse("Dankss für Lachsss, Zerarisa habenss Münzssen für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your fishing skill increases."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addResponse("Thankss for ssalmonss, Zerarisa hass coinss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addResponse("Thankss for ssalmonss, Zerarisa hass coinss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke und deine Fischereifertigkeit steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addResponse("Dankss für Lachsss, Zerarisa habenss Münzssen für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(355, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(355, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 4));
talkEntry:addResponse("Dankss für Lachsss, Zerarisa habenss Münzssen für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 5));
talkEntry:addResponse("Zerarisa needss five roasst trout now, you can cookss them at a ssmoke oven. You'll get coinsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 5));
talkEntry:addResponse("Zerarisa brauchenss fünf geräuchert Forellenss nun, könnenss räuchern in Ofenss. Kriegensss Münzssenss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 5));
talkEntry:addResponse("Zerarisa needss five roasst trout now, you can cookss them at a ssmoke oven. You'll get coinsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 5));
talkEntry:addResponse("Zerarisa brauchenss fünf geräuchert Forellenss nun, könnenss räuchern in Ofenss. Kriegensss Münzssenss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Have you the five roasst trout? Catch five trout and smoke them at an oven.");
talkEntry:addResponse("Zerarisa ssstill waitss for roasst trout, sshe wantss five.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habenss fünf geräuchertss Forellenss? Fangenss und räuchernss in Räuchehütte.");
talkEntry:addResponse("Zerarisa wartenss auf fünf geräuchertss Forellenss, wollenss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Have you the five roasst trout? Catch five trout and cook them at an oven.");
talkEntry:addResponse("Zerarisa ssstill waitss for roasst trout, sshe wantss five.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("job");
talkEntry:addResponse("Habenss fünf geräuchertss Forellenss? Fangenss und räuchernss in Räuchehütte.");
talkEntry:addResponse("Zerarisa wartenss auf fünf geräuchertss Forellenss, wollenss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your fishing skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkEntry:addResponse("Zerarisa thanksss you for the troutss, here...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkEntry:addResponse("Zerarisa thanksss you for the troutss, here...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke und deine Fischereifertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkEntry:addResponse("Zerarisa dankenss für Forellenss, nehmenss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkEntry:addResponse("Zerarisa dankenss für Forellenss, nehmenss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins and your fishing skill increases."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addResponse("Zerarisa thanksss you for the troutss, here...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addResponse("Zerarisa thanksss you for the troutss, here...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke und deine Fischereifertigkeit steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addResponse("Zerarisa dankenss für Forellenss, nehmenss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(455, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(455, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 6));
talkEntry:addResponse("Zerarisa dankenss für Forellenss, nehmenss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 7));
talkEntry:addResponse("Do Zerarisa favour, go findss Henry, he'ss butcher in Dewy Sswampss, getss me ten piecess of leather from him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 7));
talkEntry:addResponse("Tuenss Zerarisa Gefallen, findenss Henry, isst Sschlachter in Morgentausumpfss, bringenss zehn Lederhäute von ihmss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Cape Farewell IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 7));
talkEntry:addResponse("Do Zerarisa favour, go findss Henryss, he'ss butcher in Dewy Swampss, getss me ten piecess of leather from him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Kap des Abschiedes IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 7));
talkEntry:addResponse("Tuenss Zerarisa Gefallen, findenss Henry, isst Sschlachter in Morgentausumpfss, bringenss zehn Lederhäute von ihmss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You findss Henry in Dewy Swampss? He owess me ten piecess of leather.");
talkEntry:addResponse("Zerarisa sstill waitss for leather from Henry in Dewy Swampss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Habenss sschon gefundenss Henry in Morgentausumpfss? Schuldenss zehn Lederhäute.");
talkEntry:addResponse("Zerarisa wartenss noch auf Leder von Henry in Morgentaussumpf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You findss Henry in Dewy Swampss? He owess me ten piecess of leather.");
talkEntry:addResponse("Zerarisa sstill waitss for leather from Henry in Dewy Swampss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Habenss sschon gefundenss Henry in Morgentausumpfss? Schuldenss zehn Lederhäute.");
talkEntry:addResponse("Zerarisa wartenss noch auf Leder von Henry in Morgentaussumpf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins and your fishing skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkEntry:addResponse("Zerarisa thanksss you, here'ss money for your troubless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkEntry:addResponse("Zerarisa thanksss you, here'ss money for your troubless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke und deine Fischereifertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkEntry:addResponse("Zerarisa dankenss dir, hier sindsss Geld für Ärgerss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkEntry:addResponse("Zerarisa dankenss dir, hier sindsss Geld für Ärgerss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins and your fishing skill increases."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addResponse("Zerarisa thanksss you, here'ss money for your troubless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addResponse("Zerarisa thanksss you, here'ss money for your troubless.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.fishing, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke und deine Fischereifertigkeit steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.fishing, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addResponse("Zerarisa dankenss dir, hier sindsss Geld für Ärgerss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2547, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Silberstücke."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2547, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(71, "=", 8));
talkEntry:addResponse("Zerarisa dankenss dir, hier sindsss Geld für Ärgerss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zerarisa hass no more jobss for you, sshe hass enough fissh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zerarisa habenss nichts mehr Aufgabe für dich, habenss genug Fissch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Zerarisa hass enough fissh, no more jobss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(71, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Zerarisa habenss nichts mehr Aufgabe für dich, habenss genug Fissch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nana");
talkEntry:addResponse("Yesss, the halfling... sshe'll want ssalmonss from me, but I don't have enough for her too. Could you catch ssome yourssself and give them to her?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nana");
talkEntry:addResponse("Ja, Halblingsss... Wollenss Lachsss, aber habensss nicht genug für sssie. Fangenss sselbsst und gebensss ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Yesss, the halfling... sshe'll want ssalmonss from me, but I don't have enough for her too. Could you catch ssome yourssself and give them to her?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Ja, Halblingsss... Wollenss Lachsss, aber habensss nicht genug für sssie. Fangenss sselbsst und gebensss ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I catch fisssh and ssell them to landlingss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich fangenss Fischss und verkaufensss Landlinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I catch fisssh and ssell them to landlingss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich fangenss Fischss und verkaufensss Landlinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Zerarisa wished ssshe could dive down to forsssaken issslands!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Zerarisa wünschensss dasss könnensss tauchen tief zssu verwunsschen Inselsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("We all equalsss for the mother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Wir sssinds alle gleich in Angesichtsss der Mutter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fisher");
talkEntry:addResponse("I catch fisssh and ssell them to landlingss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fischer");
talkEntry:addResponse("Ich fangenss Fischss und verkaufensss Landlinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cape");
talkEntry:addResponse("You are at Cape Farewell, Zerarisa wavesss landlingsss on boatsss here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kap");
talkEntry:addTrigger("Abschied");
talkEntry:addResponse("Wir sindsss am Kap desss Abschiedesss, Zerarisa winkensss Landlinge auf Booten hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Wizard be mean, make thingsss not undersstandss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Zauberer machenss Dingenss nicht verstehensss, gemein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wizard be mean, make thingsss not undersstandss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Zauberer machenss Dingenss nicht verstehensss, gemein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Witchess be, wizardsss be. Runewick evilss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Hexenss sindss, Magier sindss. Runewick bössse!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Owesss Zerarisa something, Zerarise owess something. Handsss wash each othersss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ssschuldet Zerarisa wasss, Zerarisa schuldetss was. Eine Hand wässscht die anderess!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Paying good, paying in time. Galmair goodss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Zahlenss gut, zahlenss pünktlich. Galmair gutss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen jussst, queen pretty, isss not ssshe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin gerecht, Königin hübschss, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen jussst, queen pretty, isss not ssshe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin gerecht, Königin hübschss, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Zss, Zerarisa living here. Queen jussst, queen pretty, isss not ssshe?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Zss, Zerarisa lebenss hier. Königin gerecht, Königin hübschss, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albarss far awaysss along coastss. Never ssswum there Zerarisa.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albarsss weit weg entlang Küssste. Niemalsss schwommen dort Zerarisa.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Zss! Gynk dangerousss, robss, sssteals!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Zss! Gynk gefährlichsss, raubenss, stehlenss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Sssalkamar have funny name for realm, no?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Sssalkamar habenss witzig Namen für Reichsss, nein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Have faith only in mothersss, Zerarisa! Hail Zshhel?pheey?arrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Habenss nur Glaube in Mutter, Zerarisa! Heil Zshhel?pheey?arrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Mothersss caresss, mothersss providesss. What wantss more?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Mutter kümmertss, Mutter füttertss. Wasss wollenss mehr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I ssell nothingss, I am not a merchant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich kaufenss nichtss, nichtss bin Handelsssfrau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("If you're interessted in a job, assk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Habenss Lust auf Aufgabe, fragensss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Zerarisa have name, have claw, have tail! And you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Zerarisa habenss Namensss, habenss Klauensss, habensss Ssschwanzss. Und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dewy");
talkEntry:addTrigger("swamps");
talkEntry:addResponse("Zss, Dewy Sswampss be Runewick landss. Go far, north, easst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Morgentau");
talkEntry:addTrigger("Sumpf");
talkEntry:addResponse("Zss, Morgentaussumpf seienss Runewickland. Gehenss weit, Nord, Osst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("What iss the yess for? If you want a job assk me for a job.");
talkEntry:addResponse("You are very agreeable persson, but if you want job, assk for job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkEntry:addResponse("Wass meinenss mit ja? Wollenss Aufgabe, fragenss Aufgabe.");
talkEntry:addResponse("Seienss zssustimmaber wenn wollenss Aufgabe, fragenss Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("You isss not very nice?");
talkEntry:addResponse("No, zss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Du seienss nicht ssehr nett?");
talkEntry:addResponse("Nein, zss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kratzt sich an ihrer schlaff runterhängenden Kralle.", "#me lazily scratches her limp-looking claw.");
talkingNPC:addCycleText("#me setzt sich hin und schaut gedankenverloren drein.", "#me sits down on the ground and looks thoughtful.");
talkingNPC:addCycleText("#me stinkt nach Fisch.", "#me smells strongly of fish.");
talkingNPC:addCycleText("#me bleckt die Zähne während sie hungrig auf's Wasser schaut.", "#me bares her teeth as she looks hungrily towards the water.");
talkingNPC:addCycleText("#me pult Dreck unter ihren Krallen hervor.", "#me cleans her claws.");
talkingNPC:addCycleText("Zsss.", "Zsss.");
talkingNPC:addCycleText("Zsss!", "Zsss!");
talkingNPC:addCycleText("Zsss?", "Zsss?");
talkingNPC:addCycleText("#me zischelt.", "#me hisses.");
talkingNPC:addCycleText("Willkommens am Kap desss Abschiedsss!", "Welcome to Cape Farewell, zss!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist die Fischerin Zerarisa.", "This NPC is the fisherwoman Zerarisa.");
mainNPC:setUseMessage("Fassens mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 72);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 367);
mainNPC:setEquipment(10, 369);
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