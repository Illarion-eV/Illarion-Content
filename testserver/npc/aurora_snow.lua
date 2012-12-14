--------------------------------------------------------------------------------
-- NPC Name: Aurora Snow                                             Runewick --
-- NPC Job:  Druid                                                            --
--                                                                            --
-- NPC Race: elf                        NPC Position:  910, 700, 1            --
-- NPC Sex:  female                     NPC Direction: north                  --
--                                                                            --
-- Author:   Grokk                                                            --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 910, 700, 1, 0, 'Aurora Snow', 'npc.aurora_snow', 1, 1, 0, 245, 245, 245, 255, 239, 219);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.aurora_snow", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 12));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, ">", 11));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Aurora Snow the druid. Keywords: quest, Ushara, profession, gods, Aurora."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Aurora Show die Druidin. Schlüsselwörter: Auftrag, Ushara, Beruf, Götter, Aurora."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings, my brother.");
talkEntry:addResponse("Welcome, brother.");
talkEntry:addResponse("Ah, yes. I was expecting you, my brother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings, my sister.");
talkEntry:addResponse("Welcome, sister.");
talkEntry:addResponse("Ah, yes. I was expecting you, my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May the Five watch over you.");
talkEntry:addResponse("May Ushara guide you along your path, my brother.");
talkEntry:addResponse("The Five with you, brother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May the Five watch over you.");
talkEntry:addResponse("May Ushara guide you along your path, my sister.");
talkEntry:addResponse("The Five with you, sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am at peace.");
talkEntry:addResponse("I am everywhere, and everything, yet nowhere, and nothing.");
talkEntry:addResponse("The Five watch over me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich bin mit mir im reinen und habe meinen Frieden gefunden.");
talkEntry:addResponse("Ich bin überall, und alles, doch bin ich nirgendwo und nichts.");
talkEntry:addResponse("Die Fünf wachen über mich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Aurora Snow, a priest of nature.");
talkEntry:addResponse("My name is Aurora Snow.");
talkEntry:addResponse("Aurora Snow. I am a druid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Aurora Snow, eine Priesterin der Natur.");
talkEntry:addResponse("Ich bin Aurora Snow.");
talkEntry:addResponse("Aurora Snow. Ich bin eine Druidin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part IV"));
talkEntry:addResponse("Natiana appears to have the symptoms of corrupted blood. The illness is highly infectious and has been the cause of at least one known pandemic. Fortunately, I am aware of a potion to cure it. Will you help me gather the ingredients?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("Natiana zeigt Symtome von schlechtem Blut. Die Krankheit ist hochansteckend und war die Ursache für mindestens eine  uns bekannte Pandemie. Glücklicherweise, kenne ich einen Trank um sie zu heilen. Werdet Ihr mir helfen die Zutaten zu sammeln?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Well, if you wish to help Miss Banius, then I shall need you to bring me the entrails of five wild animals and ten black thistles. I shall get to work preparing the potion.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 6));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Nun, da Ihr wünscht Frau Banius zu helfen, bitte ich Euch mir Eingeweide wilder Tiere zu bringen, ebenso wie 10 schwarze Disteln. Ich werde  mich an die Arbeit begeben und den Trank zubereiten");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You must find those ten black thistles, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr müsst mir die besagten 10 schwarzen Disteln finden, Frau Banius scheint nicht mehr all zu viel Zeit zu bleiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You must bring me those ten black thistles, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ihr müsst mir die besagten 10 schwarzen Disteln finden, Frau Banius scheint nicht mehr all zu viel Zeit zu bleiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You have ten black thistles, but we still need five entrails also. Hurry, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr habt 10 schwarze Disteln, aber wir benötigen noch fünf Eingeweide. Um Frau Willen, so beeilt euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You have ten black thistles, but we still need five entrails also. Hurry, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ihr habt 10 schwarze Disteln, aber wir benötigen noch fünf Eingeweide. Um Frau Willen, so beeilt euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded ten silver coins."));
talkEntry:addResponse("Yes, these shall suffice. Well done. Hmm...perhaps you shall find more use for these coins than I am able.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(141, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Ja, dies sollte reichen. Gut gemacht. Hmm... vielleicht habt Ihr für diese Münzen eine bessere Verwendung als ich.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(141, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part V"));
talkEntry:addResponse("#me gasps lightly as she fumbles with a glass bottle. Time almost seems to slow as it falls from her grip, shattering against the solid floor, 'Oh, dear. That was my last bottle. I shall need one small empty bottle so that you can transport the potion.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("#me atmet auf, während sie mit einer Glasflasche hantiert. Die Zeit scheint still zu stehen, als ihr die Flasche aus den Händen fällt und auf dem Fußboden zerbirst. 'Oh jeh. Das was meine letzte Flasche. Ich benötige eine kleine leere Flasche, damit Ihr den Trank transportieren könnt.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part V"));
talkEntry:addResponse("#me gasps lightly as she fumbles with a glass bottle. Time almost seems to slow as it falls from her grip, shattering against the solid floor, 'Oh, dear. That was my last bottle. I shall need one small empty bottle so that you can transport the potion.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("#me atmet auf, während sie mit einer Glasflasche hantiert. Die Zeit scheint still zu stehen, als ihr die Flasche aus den Händen fällt und auf dem Fußboden zerschellt/zerbirst. 'Oh jeh. Das was meine letzte Flasche. Ich benötige eine kleine leere Flasche, damit Ihr den Trank transportieren könnt.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I need that small empty bottle urgently. Natiana's life depends upon it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich benötige eine kleine leere Flasche. Natianas Leben hängt davon ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I need that empty bottle urgently. Natiana's life depends upon it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich brauche unbedingt eine kleine leere Flasche. Natianas Leben hängt davon ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You have received Natiana's medicine and are awarded two silver coins."));
talkEntry:addResponse("Wonderful. Now just let me mix that a little...fill that up for you...and there we are. Hand this to Mister Banius. You must hurry though, Natiana cannot have much longer.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1317, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2499, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Kupferstücke und Natianas Medizin."));
talkEntry:addResponse("Wunderbar. Jetzt lasst mich das ein wenig mischen, ? nun  einwenig davon abfüllen ?. und da hätten wir es! Gebt das Herrn Banius. Ihr musst euch jedoch beeilen, Natiana hat nicht mehr viel Zeit.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1317, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2499, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Aurora's Staff: Part I"));
talkEntry:addResponse("Natiana is slowly recovering, thanks to your efforts. I could use your help again, actually. I've left my staff in the possession of my apprentice, Madeline Clarbelis. If you could go to Runewick, collect and return it, I would be most grateful.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Natiana ist dank Euch auf dem Wege der Besserung. Ich könnte jedoch erneut Eure Hilfe gebrauchen. Ich habe meinen Stab unter der Obhut meiner Schülerin Madeline Clarbelis gelassen. Wenn Ihr nach Runewick gehen und mir meinen Stab bringen könntet, wäre ich Euch ausgesprochen dankbar.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Aurora's Staff: Part I"));
talkEntry:addResponse("Natiana is slowly recovering, thanks to your efforts. I could use your help again, actually. I've left my staff in the possession of my apprentice, Madeline Clarbelis. If you could go to Runewick, collect and return it, I would be most grateful.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Natiana ist dank Euch auf dem Wege der Besserung. Ich könnte jedoch erneut Eure Hilfe gebrauchen.Ich habe meinen Stab unter der Obhut meiner Schülerin Madeline Clarbelis gelassen.Wenn Ihr nach Runewick gehen könntet und mir meinen Stab bringen könntet, wäre ich Euch ausgesprochen dankbar.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("staff");
talkEntry:addResponse("My staff is of little monetary worth, though it holds a great deal of spiritual and sentimental value to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stab");
talkEntry:addResponse("Mein Stab ist von wenig finanziellem Wert, dennoch bedeutet er mir eine Menge. Er beherbergt viele meiner Erinnerungen und Kräfte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("If you are able to retrieve my staff from my apprentice, Madeline Clarbelis, in Runewick, then I shall see to it that you are suitably rewarded.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wenn es Euch gelingt meinen Stab von meiner Schülerin Madeline Clarbelis in Runewick zurück zu erhalten, so will ich dafür Sorge tragen, dass Ihr angemessen belohnt werdet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("If you are able to retrieve my staff from my apprentice, Madeline Clarbelis, in Runewick, then I shall see to it that you are suitably rewarded.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Wenn es Euch gelingt meinen Stab von meiner Schülerin Madeline Clarbelis in Runewick zurück zu erhalten, so will ich dafür Sorge tragen, dass Ihr angemessen belohnt werdet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest completed] You have received five silver coins."));
talkEntry:addResponse("Ahh, thank y...wait. This is not my staff. I look forward to hearing the explanation behind this one. That apprentice of mine is nothing but trouble. Well, I do not have my staff, but take this for your troubles.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke"));
talkEntry:addResponse("Ahh, ich Danke Eu... Moment. Dies ist nicht mein Stab. Ich bin da aber mal auf die Erklärung gespannt, was hinter dieser Sache steckt. Meine Schülerin macht nichts als Ärger. Nun, Ich habe zwar meinen Stab nicht wieder, aber nehmt dies als Entschädigung für eure Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("staff");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Aurora's Staff: Part II"));
talkEntry:addResponse("If you are looking for a job, I still require someone to recover my staff. Seek out my apprentice again, and return with my staff. My actual staff.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Wenn Ihr einen Auftrag wünscht, Ich bräuchte noch immer jemanden, der mir meinen Stab wiederbringt. Sucht erneut meine Schülerin auf und kehrt mit meinem Stab zurück. Meinem richtigen Stab.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Aurora's Staff: Part II"));
talkEntry:addResponse("If you are looking for a job, I still require someone to recover my staff. Seek out my apprentice again, and return with my staff. My actual staff.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Wenn Ihr einen Auftrag wünscht, Ich bräuchte noch immer jemanden, der mir meinen Stab wiederbringt. Sucht erneut meine Schülerin auf und kehrt mit meinem Stab zurück. Meinem richtigen Stab.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest update] Aurora's Staff: Part II"));
talkEntry:addResponse("How is the recovery of my staff going? You desire my ring? Hmm...I do not see why not. It is of little value to me. Here, take it.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Wie sieht es mit der Wiederbeschaffung meines Stabes aus? Ihr benötigt meinen Ring. Hmm... Ich sehe keinen Grund ihn Euch nicht zu geben. Hier, nehmt.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(13372, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("staff");
talkEntry:addTrigger("dagger");
talkEntry:addTrigger("ring");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest update] Aurora's Staff: Part II"));
talkEntry:addResponse("How is the recovery of my staff going? You desire my ring? Hmm...I do not see why not. It is of little value to me. Here, take it.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(13372, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Dolch");
talkEntry:addTrigger("Ring");
talkEntry:addTrigger("Stabh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("Wie sieht es mit der Wiederbeschaffung meines Stabes aus? Ihr benötigt meinen Ring. Hmm... Ich sehe keinen Grund ihn Euch nicht zu geben. Hier, nehmt.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Find out what happened to my staff, and bring it back to me. My apprentice, Madeline Clarbelis, is in Runewick. She should know what happened to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Finde heraus was mit meinem Stab passiert, und bring ihn mir zurück. Meine Schülerin Madeline Clarbelis, ist in Runewick. Sie sollte wissen was mit meinem Stab geschehen ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Find out what happened to my staff, and bring it back to me. My apprentice, Madeline Clarbelis, is in Runewick. She should know what happened to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Finde heraus was mit meinem Stab passiert, und bring ihn mir zurück. Meine Schülerin Madeline Clarbelis, ist in Runewick. Sie sollte wissen was mit meinem Stab geschehen ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(209, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You have received a magical serinjah-sword and forty silver coins."));
talkEntry:addResponse("Ahh... my staff! Thank you, my friend. I'll save you the effort of explaining to me what sort of trouble my apprentice got into. Here is the reward, as promised.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 4000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(209, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2693, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(209, "all", ">", 0, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Kupferstücke und ein magisches Serinjah-Schwert."));
talkEntry:addResponse("Ahh...mein Stab! Ich danke euch, mein Freund. Ich erlasse Euch die Mühe mir zu erklären in welche Schwierigkeiten sind meine Schülerin gebracht hat.Hier ist Eure Belohnung, wie versprochen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 4000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(209, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2693, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Thank you for all of your help, my friend. You have truly earned my respect.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 12));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Danke für all deine Hilfe mein Freund. Du hast dir meinen Respekt wirklich verdient.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 12));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Thank you for all of your help, my friend. You have truly earned my respect.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(13372, "=", 12));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Danke für all deine Hilfe mein Freund. Du hast dir meinen Respekt wirklich verdient.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a priest of nature.");
talkEntry:addResponse("I am a druid.");
talkEntry:addResponse("I am a child of Ushara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin eine Priesterin der Natur.");
talkEntry:addResponse("Ich bin eine Druidin.");
talkEntry:addResponse("Ich bin ein Kind Usharas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a priest of nature.");
talkEntry:addResponse("I am a druid.");
talkEntry:addResponse("I am a child of Ushara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin eine Priesterin der Natur.");
talkEntry:addResponse("Ich bin eine Druidin.");
talkEntry:addResponse("Ich bin ein Kind Usharas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("That island often slipped into unbalance. My fellow druids were tasked with putting it right. They were unsuccessful, I fear.");
talkEntry:addResponse("Like many things, Gobaith was beautiful upon appearances, but filled with hate and darkness upon closer inspection.");
talkEntry:addResponse("My kind, druids, were common upon that island.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Diese Insel stürzte oft ins Ungleichgewicht. Meine Mitstreiter unter den Druiden waren beaufragt das Gleichgewicht wieder herzustellen. Sie waren nicht sehr erfolgreich, fürchte ich.");
talkEntry:addResponse("Wie viele Dinge war Gobaith auf den ersten Blick sehr schön, jedoch voll von Hass und Dunkelheit, wenn man  genauer hinschaute.");
talkEntry:addResponse("Druidnen, wie ich einer bin, waren weit verbeitet auf dieser Insel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("It is a true honour to meet you.");
talkEntry:addResponse("Ah, yes. I see it now.");
talkEntry:addResponse("I am most pleased to have met you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Es ist für wahr eine Ehre Euch zu treffen.");
talkEntry:addResponse("Ah jah, jetzt verstehe ich.");
talkEntry:addResponse("Ich bin hoch erfeut Euch getroffen zu haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("apprentice");
talkEntry:addResponse("Madeline Clarbelis is my apprentice...she is talented, though impatient.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Leherling");
talkEntry:addResponse("Madeline Clarbelis ist meine Schülerin... sie ist begabt, aber ungeduldig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Elvaine is a intelligent being.");
talkEntry:addResponse("I have seen few more powerful beings than the Archmage.");
talkEntry:addResponse("Elvaine, the Archmage, is the ruler of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Elvaine ist eine intelligentes Wesen.");
talkEntry:addResponse("Ich habe mächtige Wesen als den Erzmagier gesehen.");
talkEntry:addResponse("Elvaine, der Erzmagier, ist Herrscher von Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine is a intelligent being.");
talkEntry:addResponse("I have seen few more powerful beings than the Archmage.");
talkEntry:addResponse("Elvaine, the Archmage, is the ruler of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Elvaine ist eine intelligentes Wesen.");
talkEntry:addResponse("Ich habe mächtige Wesen als den Erzmagier gesehen.");
talkEntry:addResponse("Elvaine, der Erzmagier, ist Herrscher von Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is a place of learning.");
talkEntry:addResponse("Many wise beings reside within the lands of Runewick.");
talkEntry:addResponse("If it is knowledge you seek, Runewick would be a wise starting point.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist ein Ort des Lernens.");
talkEntry:addResponse("Viele weise Wesen leben auf Runewicks Länderein.");
talkEntry:addResponse("Wenn Ihr Wissen sucht, wäre Runewick ein guter Anfang .");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Mister Guilianni is concerned with nought but material possessions.");
talkEntry:addResponse("The Don places that of least importance above all else.");
talkEntry:addResponse("Mister Guilianni has yet to learn that true value is not to be found in a simple coin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Herr Guillianni ist nur an materiellen Besitz interessiert.");
talkEntry:addResponse("Der Don misst dem Bedeutungslosesten die meiste meißt Bedeutung zu.");
talkEntry:addResponse("Herr Guilianni muss noch begreifen, dass wahre Werte nicht in Münzen gefunden werden können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("The people of Galmair concern themselves with wealth, and little else.");
talkEntry:addResponse("I would not waste my breath upon this place.");
talkEntry:addResponse("If it is money you seek, perhaps Galmair should be your destination. Though, I must warn you, you shall find yourself unsatisfied with such a life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Die Leute in Galmair kümmer der Reichtum, und wenig anderes.");
talkEntry:addResponse("Ich wurde meinen Atem nicht verschwenden um über diesen Ort zu reden.");
talkEntry:addResponse("Wenn Ihr Geld sucht, vielleicht wäre Galmair ein guter Ort für Euch. Doch, ich muss Euch warnen, Ihr werdet keine Erfüllung in solch einem Leben finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen Rosaline is the ruler of Cadomyr.");
talkEntry:addResponse("The Queen resides within a large castle in Cadomyr. I cannot agree with such extravagance.");
talkEntry:addResponse("The town of Cadomyr is ruled by the Queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin Rosaline ist Herrscherin über Cadomyr.");
talkEntry:addResponse("Die Königin wohnt in einem großen Schloß in Cadomyr. Ich kann solch einer extravaganz nicht zustimmen.");
talkEntry:addResponse("Die Stadt Cadomyr wird beherrscht von der Königin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen Rosaline is the ruler of Cadomyr.");
talkEntry:addResponse("The Queen resides within a large castle in Cadomyr. I cannot agree with such extravagance.");
talkEntry:addResponse("The town of Cadomyr is ruled by the Queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin Rosaline ist Herrscherin über Cadomyr.");
talkEntry:addResponse("Die Königin wohnt in einem großen Schloß in Cadomyr. Ich kann solch einer extravaganz nicht zustimmen.");
talkEntry:addResponse("Die Stadt Cadomyr wird beherrscht von der Königin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("The people of Cadomyr are pleasant, for the most part.");
talkEntry:addResponse("Cadomyr often seems a misguided settlement.");
talkEntry:addResponse("If you value honour above all else, you would do well to visit the lands of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Die meistehn Leute in Cadomyr sind feundlich.");
talkEntry:addResponse("Cadomyr erinnert oft an eine falsch geführte Siedlung.");
talkEntry:addResponse("Wenn Euch Ehre am meisten bedeutet, so tut Ihr gut daran Cadomyr zu besuchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Come now, let us not speak of such trivial matters.");
talkEntry:addResponse("It is merely a place; nothing of any true importance.");
talkEntry:addResponse("I would not waste my breath upon this subject.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Hört, lasst uns nicht über solch unwichtige Dinge sprechen.");
talkEntry:addResponse("Das ist kaum ein Ort, nichts von Wichtigkeit.");
talkEntry:addResponse("Ich würde meinen Atem nicht verschwenden um über ein solches Thema zu sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Come now, let us not speak of such trivial matters.");
talkEntry:addResponse("It is merely a place; nothing of any true importance.");
talkEntry:addResponse("I would not waste my breath upon this subject.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Hört, lasst uns nicht über solch unwichtige Dinge sprechen.");
talkEntry:addResponse("Das ist kaum ein Ort, nichts von Wichtigkeit.");
talkEntry:addResponse("Ich würde meinen Atem nicht verschwenden um über ein solches Thema zu sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Come now, let us not speak of such trivial matters.");
talkEntry:addResponse("It is merely a place; nothing of any true importance.");
talkEntry:addResponse("I would not waste my breath upon this subject.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Hört, lasst uns nicht über solch unwichtige Dinge sprechen.");
talkEntry:addResponse("Das ist kaum ein Ort, nichts von Wichtigkeit.");
talkEntry:addResponse("Ich würde meinen Atem nicht verschwenden um über ein solches Thema zu sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The Elder Gods created all that ever was, and all that ever will be, upon Illarion.");
talkEntry:addResponse("I worship all five of the Elder Gods, though Ushara is of most importance to me.");
talkEntry:addResponse("The Elder Gods control the five elements. These elements are the very roots of existence.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die alte Götter erschufen alles was je jemals gab und alles was jemals sein wird in Illarion.");
talkEntry:addResponse("Ich bete zu allen der Fünf alten Götter, wobei ich jedoch Ushara am nächsten stehe.");
talkEntry:addResponse("Die alten Götter herrschen über die Fünf Elemente. Diese sind die Wurzel jeglicher Existenz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("There shall never be a warrior to match the strength of Bragon.");
talkEntry:addResponse("Bragon holds dominion over the element of fire. Through Him, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Niemals wird ein Krieger sich mit der Stärke Bargons messen können.");
talkEntry:addResponse("Bargon beherrscht das Element des Feuers. Durch ihn, ist leben.");
talkEntry:addResponse("Wir müssen den Fünf, unseren Müttern und Vätern dankbar sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("The wisest of all beings.");
talkEntry:addResponse("Eldan holds dominion over the element of spirit. Through Him, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Der Weiseste unter allem was ist.");
talkEntry:addResponse("Eldan herrscht über den Geist.Durch ihn, ist Leben.");
talkEntry:addResponse("Wir müssen den Fünf, unseren Müttern und Vätern dankbar sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("No kinder being, shall you ever meet.");
talkEntry:addResponse("Findari holds dominion over the element of air. Through Her, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Kein gütigeres Wesen, wird Euch jemals begegnen.");
talkEntry:addResponse("Findari herrscht über die Luft. Durch sie, ist leben.");
talkEntry:addResponse("Wir müssen den Fünf, unseren Müttern und Vätern dankbar sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren.");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren..");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren..");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren..");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Though Tanora is the only Elder God who still walks this land, we sense the presence of each of the Five.");
talkEntry:addResponse("Tanora holds dominion over the element of water. Through Her, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora ist die einzige der alten Götter, die noch in diesem Land wandelt. Wir spüren die Gegenwart von jedem der Fünf.");
talkEntry:addResponse("Tanora herrscht über die Wasser. Durch sie, ist Leben.");
talkEntry:addResponse("Wir müssen den Fünf, unseren Müttern und Vätern dankbar sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I have never met one so modest as the Mother Goddess.");
talkEntry:addResponse("Ushara holds dominion over the element of earth. Through Her, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ich traf niemals jemanden so bescheiden wie Ushara.");
talkEntry:addResponse("Ushara herrscht über die Erde. Durch sie, ist Leben.");
talkEntry:addResponse("Wir müssen den Fünf, unseren Müttern und Vätern dankbar sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ah ja. Einer der heiligen Vorfahren..");
talkEntry:addResponse("Wir schreiten die Pfade entlang, die unsere Ahnen für uns bereiteten.");
talkEntry:addResponse("Es gibt vieles zu berichten über die heiligen Vorfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I have no need for material possessions.");
talkEntry:addResponse("Your money is worthless to me.");
talkEntry:addResponse("I do not desire to trade.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich habe kein Interesse an weltlichem Besitz.");
talkEntry:addResponse("Euer Geld ist für mich wertlos.");
talkEntry:addResponse("Ich bin nicht daran interessiert zu handeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("#me closes her eyes and places a hand upon your shoulder.");
talkEntry:addResponse("Hmm...I sense that you already know what I shall say.");
talkEntry:addResponse("I shall do so. But I shall not reply upon mere words.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("#me schließt ihre Augen und legt eine Hand auf deine Schulter.");
talkEntry:addResponse("Hmm... I spüre, das Ihr bereits wisst, was I sagen werde.");
talkEntry:addResponse("Das werde ich tun. Doch werde ich nicht auf bloße Worte antworten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("corrupted blood");
talkEntry:addResponse("Wow, really?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schlechtes Blut");
talkEntry:addResponse("Wow, wirklich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Aurora");
talkEntry:addTrigger("Snow");
talkEntry:addResponse("Let us communicate without words.");
talkEntry:addResponse("Have you spoken with my apprentice?");
talkEntry:addResponse("We must all learn to embrace nature and be one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aurora");
talkEntry:addTrigger("Snow");
talkEntry:addResponse("Lass und ohne Worte sprechen.");
talkEntry:addResponse("Habt Ihr mit meiner Schülerin gespochen?");
talkEntry:addResponse("Wir alle müssen lernen eines mit der Natur zu werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Let us communicate without words.");
talkEntry:addResponse("Have you spoken with my apprentice?");
talkEntry:addResponse("We must all learn to embrace nature and be one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Lass und ohne Worte sprechen.");
talkEntry:addResponse("Habt Ihr mit meiner Schülerin gespochen?");
talkEntry:addResponse("Wir alle müssen lernen eines mit der Natur zu werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Let us communicate without words.");
talkEntry:addResponse("Have you spoken with my apprentice?");
talkEntry:addResponse("We must all learn to embrace nature and be one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Lass und ohne Worte sprechen.");
talkEntry:addResponse("Habt Ihr mit meiner Schülerin gespochen?");
talkEntry:addResponse("Wir alle müssen lernen eines mit der Natur zu werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me closes her eyes, nodding slowly.");
talkEntry:addResponse("Time is just an illusion.");
talkEntry:addResponse("Society is a mask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me schließt ihre Augen und nickt langsam.");
talkEntry:addResponse("Zeit ist eine Illusion.");
talkEntry:addResponse("Gesellschaft ist eine Fassade.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me öffnet ihre Tasche und sortiert einige Käuter.", "#me opens her bag and sorts through a handful of herbs.");
talkingNPC:addCycleText("#me's Blick wandert durch die Landschaft", "#me's gaze wanders across the scene before her.");
talkingNPC:addCycleText("#me hebt ihre Hand, in einer eleganten, fließenden Bewegung", "#me lifts her hand in a smooth, graceful movement.");
talkingNPC:addCycleText("#me senkt langsam den Kopf", "#me slowly bows her head.");
talkingNPC:addCycleText("#me schließt ihre Augen, während sie rhythmisch mit dem Kopf nickt.", "#me closes her eyes, while her head nods rhythmically.");
talkingNPC:addCycleText("#me schließt ihre Augen, ihre Lippen bewegen sich kaum.", "#me closes her eyes, a faint hint of movement upon her lips.");
talkingNPC:addCycleText("Zeit ist lediglich eine Illusion.", "Time is just an illusion.");
talkingNPC:addCycleText("Die Gesellschaft ist eine Fassade.", "Society is a mask.");
talkingNPC:addCycleText("Erkennt euch selbst, meine Brüder und Schwestern.", "Be at peace, my brothers and sisters.");
talkingNPC:addCycleText("Öffnet euren Geist. Seid frei!", "Open yourselves. Be free.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Aurora Snow die Druidin.", "This NPC is Aurora Snow the druid.");
mainNPC:setUseMessage("Körperliche Genzen sind ein Konstukt der Gesellschaft.", "Physical boundaries are a construct of society.");
mainNPC:setConfusedMessage("#me schließt ihre Augen, nickt langsam. 'Wir verständigen uns auf wesentlich tieferen Ebenen als nur durch Laute oder Worte.", "#me closes her eyes, nodding slowly, 'We communicate at levels far deeper than mere sounds and words.'");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 0);
mainNPC:setEquipment(11, 55);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 805);
mainNPC:setEquipment(10, 0);
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