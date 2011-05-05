--------------------------------------------------------------------------------
-- NPC Name: Aurora Snow                                             Runewick --
-- NPC Job:  Druid                                                            --
--                                                                            --
-- NPC Race: elf                        NPC Position:  910, 700, 1            --
-- NPC Sex:  female                     NPC Direction: north                  --
--                                                                            --
-- Author:   Grokk                                                            --
--                                                                            --
-- Last parsing: May 05, 2011                            easyNPC Parser v1.02 --
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
talkEntry:addTrigger("set 0");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Debugging] Quest status set to 0"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, ">", 11));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Aurora Snow the druid. Keyphrases: quest, Ushara, profession, gods, Aurora."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist <Name> der <Beruf/Funktion>. Schlüsselwörter: TRIGGER1, TRIGGER2, TRIGGER3, TRIGGER4, TRIGGER5."));
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
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Greetings, my brother.");
talkEntry:addResponse("Welcome, brother.");
talkEntry:addResponse("Ah, yes. I was expecting you, my brother.");
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
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Greetings, my sister.");
talkEntry:addResponse("Welcome, sister.");
talkEntry:addResponse("Ah, yes. I was expecting you, my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("Greetings, my brother.");
talkEntry:addResponse("Welcome, brother.");
talkEntry:addResponse("Ah, yes. I was expecting you, my brother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("Greetings, my sister.");
talkEntry:addResponse("Welcome, sister.");
talkEntry:addResponse("Ah, yes. I was expecting you, my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("May the Five watch over you.");
talkEntry:addResponse("May Ushara guide you along your path, my brother.");
talkEntry:addResponse("The Five with you, brother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("May the Five watch over you.");
talkEntry:addResponse("May Ushara guide you along your path, my sister.");
talkEntry:addResponse("The Five with you, sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addResponse("May the Five watch over you.");
talkEntry:addResponse("May Ushara guide you along your path, my brother.");
talkEntry:addResponse("The Five with you, brother.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part IV"));
talkEntry:addResponse("Natiana appears to have the symptoms of corrupted blood. The illness is highly infectious and has been the cause of at least one known pandemic. Fortunately, I am aware of a potion to cure it. Will you help me gather the ingredients?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 5));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche I"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, if you wish to help Miss Banius, then I shall need you to bring me the entrails of five wild animals and ten black thistles. I shall get to work preparing the potion.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 6));
talkEntry:addResponse("GERMAN");
talkEntry:addConsequence(npc.base.consequence.quest.quest(1337, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You must find those ten black thistles, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10));
talkEntry:addResponse("You must bring me those ten black thistles, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", "<", 10));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You have ten black thistles, but we still need five entrails also. Hurry, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5));
talkEntry:addResponse("You have ten black thistles, but we still need five entrails also. Hurry, Miss Banius may not have much time left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", "<", 5));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("Yes, these shall suffice. Well done. Hmm...perhaps you shall find more use for these coins than I am able.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(141, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(141, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(63, "all", ">", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(141, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(63, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part V"));
talkEntry:addResponse("#me gasps lightly as she fumbles with a glass bottle. Time almost seems to slow as it falls from her grip, shattering against the solid floor, 'Oh, dear. That was my last bottle. I shall need one small empty bottle so that you can transport the potion.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Farmer's Wife: Part V"));
talkEntry:addResponse("#me gasps lightly as she fumbles with a glass bottle. Time almost seems to slow as it falls from her grip, shattering against the solid floor, 'Oh, dear. That was my last bottle. I shall need one small empty bottle so that you can transport the potion.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche II"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I need that small empty bottle urgently. Natiana's life depends upon it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0));
talkEntry:addResponse("I need that empty bottle urgently. Natiana's life depends upon it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", "=", 0));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You have received Natiana's medicine and 20 coppers."));
talkEntry:addResponse("Wonderful. Now just let me mix that a little...fill that up for you...and there we are. Hand this to Mister Banius. You must hurry though, Natiana cannot have much longer.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 20));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1317, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(2499, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1317, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Kupferstücke und ein ITEM."));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 20));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1317, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(2499, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(322, "=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Aurora's Staff: Part I"));
talkEntry:addResponse("Natiana is slowly recovering, thanks to your efforts. I could use your help again, actually. I've left my staff in the possession of my apprentice, Madeline Clarbelis. If you could go to Runewick, collect and return it, I would be most grateful.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Aurora's Staff: Part I"));
talkEntry:addResponse("Natiana is slowly recovering, thanks to your efforts. I could use your help again, actually. I've left my staff in the possession of my apprentice, Madeline Clarbelis. If you could go to Runewick, collect and return it, I would be most grateful.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(322, "=", 11));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("staff");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My staff is of little monetary worth, though it holds a great deal of spiritual and sentimental value to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("German");
talkEntry:addResponse("German");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you are able to retrieve my staff from my apprentice, Madeline Clarbelis, in Runewick, then I shall see to it that you are suitably rewarded.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addResponse("If you are able to retrieve my staff from my apprentice, Madeline Clarbelis, in Runewick, then I shall see to it that you are suitably rewarded.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 2));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest completed] You have received 50 coppers."));
talkEntry:addResponse("Ahh, thank y...wait. This is not my staff. I look forward to hearing the explanation behind this one. That apprentice of mine is nothing but trouble. Well, I do not have my staff, but take this for your troubles.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("staff");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Aurora's Staff: Part II"));
talkEntry:addResponse("If you are looking for a job, I still require someone to recover my staff. Seek to my apprentice again, and return with my staff. My actual staff.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Aurora's Staff: Part II"));
talkEntry:addResponse("If you are looking for a job, I still require someone to recover my staff. Seek to my apprentice again, and return with my staff. My actual staff.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest update] Aurora's Staff: Part II"));
talkEntry:addResponse("How is the recovery of my staff going? You desire my ring? Hmm...I do not see why not. It is of little value to me. Here, take it.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("staff");
talkEntry:addTrigger("dagger");
talkEntry:addTrigger("ring");
talkEntry:addCondition(npc.base.condition.quest.quest(13372, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest update] Aurora's Staff: Part II"));
talkEntry:addResponse("How is the recovery of my staff going? You desire my ring? Hmm...I do not see why not. It is of little value to me. Here, take it.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("german");
talkEntry:addTrigger("german");
talkEntry:addTrigger("german");
talkEntry:addCondition(npc.base.condition.quest.quest(13372, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Die Geistereiche III"));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.item.item(281, 1, 499, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Find out what happened to my staff, and bring it back to me. My apprentice, Madeline Clarbelis, is in Runewick. She should know what happened to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addResponse("Find out what happened to my staff, and bring it back to me. My apprentice, Madeline Clarbelis, is in Runewick. She should know what happened to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(333, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(333, "<", 11));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(209, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You have received a magical serinjah-sword and 200 coppers."));
talkEntry:addResponse("Ahh... my staff! Thank you, my friend. I'll save you the effort of explaining to me what sort of trouble my apprentice got into. Here is the reward, as promised.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(209, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(2693, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 11));
talkEntry:addCondition(npc.base.condition.item.item(209, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Kupferstücke und ein ITEM."));
talkEntry:addResponse("GERMAN.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(209, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(2693, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(333, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thank you for all of your help, my friend. You have truly earned my respect.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 12));
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(333, "=", 12));
talkEntry:addResponse("Thank you for all of your help, my friend. You have truly earned my respect.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(13372, "=", 12));
talkEntry:addResponse("GERMAN.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am a priest of nature.");
talkEntry:addResponse("I am a druid.");
talkEntry:addResponse("I am a child of Ushara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That island often slipped into unbalance. My fellow druids were tasked with putting it right. They were unsuccessful, I fear.");
talkEntry:addResponse("Like many things, Gobaith was beautiful upon appearances, but filled with hate and darkness upon closer inspection.");
talkEntry:addResponse("My kind, druids, were common upon that island.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addTrigger("german");
talkEntry:addResponse("german");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Elvaine is a intelligent being.");
talkEntry:addResponse("I have seen few more powerful beings than the Archmage.");
talkEntry:addResponse("Elvaine, the Archmage, is the ruler of Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick is a place of learning.");
talkEntry:addResponse("Many wise beings reside within the lands of Runewick.");
talkEntry:addResponse("If it is knowledge you seek, Runewick would be a wise starting point.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The people of Galmair concern themselves with wealth, and little else.");
talkEntry:addResponse("I would not waste my breath upon this place.");
talkEntry:addResponse("If it is money you seek, perhaps Galmair should be your destination. Though, I must warn you, you shall find yourself unsatisfied with such a life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Queen Rosaline is the ruler of Cadomyr.");
talkEntry:addResponse("The Queen resides within a large castle in Cadomyr. I cannot agree with such extravagance.");
talkEntry:addResponse("The town of Cadomyr is ruled by the Queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The people of Cadomyr are pleasant, for the most part.");
talkEntry:addResponse("Cadomyr often seems a misguided settlement.");
talkEntry:addResponse("If you value honour above all else, you would do well to visit the lands of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Come now, let us not speak of such trivial matters.");
talkEntry:addResponse("It is merely a place; nothing of any true importance.");
talkEntry:addResponse("I would not waste my breath upon this subject.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Come now, let us not speak of such trivial matters.");
talkEntry:addResponse("It is merely a place; nothing of any true importance.");
talkEntry:addResponse("I would not waste my breath upon this subject.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Come now, let us not speak of such trivial matters.");
talkEntry:addResponse("It is merely a place; nothing of any true importance.");
talkEntry:addResponse("I would not waste my breath upon this subject.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall never be a warrior to match the strength of Bragon.");
talkEntry:addResponse("Bragon holds dominion over the element of fire. Through Him, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The wisest of all beings.");
talkEntry:addResponse("Eldan holds dominion over the element of spirit. Through Him, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("No kinder being, shall you ever meet.");
talkEntry:addResponse("Findari holds dominion over the element of air. Through Her, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Though Tanora is the only Elder God who still walks this land, we sense the presence of each of the Five.");
talkEntry:addResponse("Tanora holds dominion over the element of water. Through Her, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I have never met one so modest as the Mother Goddess.");
talkEntry:addResponse("Ushara holds dominion over the element of earth. Through Her, there is life.");
talkEntry:addResponse("We must be thankful to the Five, our mothers and fathers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, yes. One of the Holy Ancestors.");
talkEntry:addResponse("We wander the paths laid by our ancestors.");
talkEntry:addResponse("There is much to be said about the Holy Ancestors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addTrigger("GERMAN");
talkEntry:addResponse("GERMAN.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aurora");
talkEntry:addTrigger("Snow");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Let us communicate without words.");
talkEntry:addResponse("Have you spoken with my apprentice?");
talkEntry:addResponse("We must all learn to embrace nature and be one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aurora");
talkEntry:addTrigger("Snow");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
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
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("#me closes her eyes, nodding slowly.");
talkEntry:addResponse("Time is just an illusion.");
talkEntry:addResponse("Society is a mask.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("GERMAN.", "#me opens her bag and sorts through a handful of herbs.");
talkingNPC:addCycleText("GERMAN.", "#me's gaze wanders across the scene before her.");
talkingNPC:addCycleText("GERMAN.", "#me lifts her hand in a smooth, graceful movement.");
talkingNPC:addCycleText("GERMAN.", "#me slowly bows her head.");
talkingNPC:addCycleText("GERMAN.", "#me closes her eyes, while her head nods rhythmically.");
talkingNPC:addCycleText("GERMAN.", "#me closes her eyes, a faint hint of movement upon her lips.");
talkingNPC:addCycleText("GERMAN.", "Time is just an illusion.");
talkingNPC:addCycleText("GERMAN.", "Society is a mask.");
talkingNPC:addCycleText("GERMAN.", "Be at peace, my brothers and sisters.");
talkingNPC:addCycleText("GERMAN.", "Open yourselves. Be free.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist <Name> der <Beruf/Funktion>.", "This NPC is Aurora Snow the druid.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Physical boundaries are a construct of society.");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me closes her eyes, nodding slowly, 'We communicate at levels far deeper than mere sounds and words.'");
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

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END