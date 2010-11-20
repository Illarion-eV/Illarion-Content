--------------------------------------------------------------------------------
-- NPC Name: Henry Darter                                                None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  920, 659, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: November 20, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 920, 659, 0, 4, 'Henry Darter', 'npc.henry_darter', 0, 0, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.henry_darter", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addResponse("Quest status set to 0");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 1");
talkEntry:addResponse("Quest status set to 1");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 2");
talkEntry:addResponse("Quest status set to 2");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 3");
talkEntry:addResponse("Quest status set to 3");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 4");
talkEntry:addResponse("Quest status set to 4");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 5");
talkEntry:addResponse("Quest status set to 5");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 6");
talkEntry:addResponse("Quest status set to 6");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 7");
talkEntry:addResponse("Quest status set to 7");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 8");
talkEntry:addResponse("Quest status set to 8");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the butcher Henry Darter. Keyphrases: Hello, quest, butcher."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schlachter Henry Darter. Schlüsselwörter: Hallo, Quest, Schlachter."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Greetings, my friend.");
talkEntry:addResponse("Hello. A great day to butcher some pigs, isn't it?");
talkEntry:addResponse("Hello, hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Grüße, mein Freund.");
talkEntry:addResponse("Hallo. Ein herrlicher Tag zum Schweineschlachten, nicht?");
talkEntry:addResponse("Hallo, hallo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings. Do not waste your time with small talk!");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Greetings, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Grüße. Verschwende deine Zeit nicht mit Plausch!");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Grüße, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Have a nice day!");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Goodbye, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addTrigger("Auf bald");
talkEntry:addResponse("Schönen Tag noch!");
talkEntry:addResponse("Lebt wohl!");
talkEntry:addResponse("Auf bald, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("See you later!");
talkEntry:addResponse("Aye, goodbye.");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Auf bald!");
talkEntry:addResponse("Ja, ja, gehabt euch wohl!");
talkEntry:addResponse("Frohes Schaffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Good, as long as I have enough to butcher.");
talkEntry:addResponse("Good as always.");
talkEntry:addResponse("I'm fine and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Gut, so lange ich genug zum Schlachten habe");
talkEntry:addResponse("Gut wie immer.");
talkEntry:addResponse("Mir geht's gut und euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Henry the butcher.");
talkEntry:addResponse("Just the good, old Henry");
talkEntry:addResponse("Henry Darter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Henry der Schlachter");
talkEntry:addResponse("Der gute alte Henry.");
talkEntry:addResponse("Henry Darter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't buy anything.");
talkEntry:addResponse("I'm a butcher, not a trader.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich kaufe nichts.");
talkEntry:addResponse("Bin Schlachter, aber kein Händler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("If you want to butcher, make sure that you're using a sharp knife.");
talkEntry:addResponse("You better smoke meat rather than cook it.");
talkEntry:addResponse("Work carefully with deer meat! It is expensive.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wenn du Schlachten willst, stelle sicher, dass du ein scharfes Messer verwendest.");
talkEntry:addResponse("Fleisch kann besser geräuchert werden als gekocht.");
talkEntry:addResponse("Arbeite vorsichtig mit Wildfleich. Es ist kostbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("butcher");
talkEntry:addResponse("I am a butcher and proud of it!");
talkEntry:addResponse("Yes, I am a butcher.");
talkEntry:addResponse("Butchering is a hard but good work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schlachter");
talkEntry:addResponse("Ich bin Schlachter und stolz darauf!");
talkEntry:addResponse("Ja, ich bin ein Schlachter.");
talkEntry:addResponse("Schlachten ist eine harte, aber ehrliche Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("swamp");
talkEntry:addTrigger("dew");
talkEntry:addResponse("It's beautiful here, isn't it? So wet and full of life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sumpf");
talkEntry:addTrigger("morgentau");
talkEntry:addResponse("Schön hier, nicht? So feucht und lebendig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Messer");
talkEntry:addTrigger("Dolch");
talkEntry:addTrigger("Beil");
talkEntry:addResponse("Schlachten tut man am besten mit einem Messer. Ein Beil ist so... brutal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knife");
talkEntry:addTrigger("dagger");
talkEntry:addTrigger("hatchet");
talkEntry:addResponse("Butchering is done best with a knife. A hatchet is so... brute.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Friedlich ist es hier in der Nähe von Runewick. Nur manchmal stören mich die Tierliebhaber, was essen denn die? Blumen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is peaceful in the vicinity of Runewick. But sometimes, those animal lovers enerve me, what do they eat? Flowers?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nett ist es in Galmair, aber ich zahl doch kein Schutzgeld von dem wenigen, was ich mit meinem Fleisch verdiene.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is quite nice in Galmair, but I don't want to pay for my safety; I earn not much with my meat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Cadomyr hat diverse Nachteile: Es ist weit weg, die Leute reden komisch und es ist trocken dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr has serveral drawbacks: It is far away, the people speak strangely and it is dry there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps I"));
talkEntry:addResponse("You can help me butchering the pigs. Take this knife and bring me ten pieces of pork. You will earn some money.");
talkEntry:addConsequence(npc.base.consequence.item.item(189, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf I"));
talkEntry:addResponse("Du kannst mir helfen die Schweine zu schlachten. Nehme dieses Messer und bring mir zehn Stücke Schweinefleisch. Du bekommst auch ein paar Münzen.");
talkEntry:addConsequence(npc.base.consequence.item.item(189, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps I"));
talkEntry:addResponse("You can help me butchering the pigs. Take this knife and bring me ten pieces of pork. You will earn some money.");
talkEntry:addConsequence(npc.base.consequence.item.item(189, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf I"));
talkEntry:addResponse("Du kannst mir helfen die Schweine zu schlachten. Nehme dieses Messer und bring mir zehn Stücke Schweinefleich. Du bekommst auch ein paar Münzen.");
talkEntry:addConsequence(npc.base.consequence.item.item(189, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You can help me butchering the pigs. Bring me ten pieces of pork. You will earn some money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du kannst mir helfen die Schweine zu schlachten. Bring mir zehn Stücke Schweinefleisch. Du bekommst auch ein paar Münzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addResponse("You can help me butchering the pigs. Bring me ten pieces of pork. You will earn some money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addResponse("Du kannst mir helfen die Schweine zu schlachten. Bring mir zehn Stücke Schweinefleisch. Du bekommst auch ein paar Münzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(307, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Kochfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, wunderbar. Ich nehme das Fleisch und du bekommst deinen Lohn. Sag bescheid, wenn du noch einen Auftrag willst.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(307, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(307, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 40 copper coins and your cooking skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, great. I'll take the pork and you get your money. Tell me if you want another task.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(307, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(307, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Kochfertigkeit steigt."));
talkEntry:addResponse("Ah, wunderbar. Ich nehme das Fleisch und du bekommst deinen Lohn. Sag bescheid, wenn du noch einen Auftrag willst.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(307, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(307, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your cooking skill increases."));
talkEntry:addResponse("Ah, great. I'll take the pork and you get your money. Tell me if you want another task.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(307, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(307, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Zehn Stücke Schweinefleisch und nicht weniger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(307, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Not less than ten pieces of pork!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps II"));
talkEntry:addResponse("You did it very well with the pork. Now you can try to bring twenty slabs of raw leather to me. Your reward will be a hundred copper coins.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf II"));
talkEntry:addResponse("Das Schweinefleisch hast du gut besorgt. Nun kannst du mir mal zwanzig Häute Rohleder auftreiben. Dein Lohn sollen hundert Kupferstücke sein.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps II"));
talkEntry:addResponse("You did it very well with the pork. Now you can try to bring twenty slabs of raw leather to me to me. Your reward will be a hundred copper coins.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf II"));
talkEntry:addResponse(" Das Schweinefleisch hast du gut besorgt. Du kannst mir nun mal zwanzig Häute Rohleder auftreiben. Dein Lohn sollen hundert Kupferstücke sein.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You did it very well with the pork. Now you can try to bring twenty slabs of raw leather to me. Your reward will be a hundred copper coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das Schweinefleisch hast du gut besorgt. Nun kannst du mir mal zwanzig Häute Rohleder auftreiben. Dein Lohn sollen hundert Kupferstücke sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addResponse("You did it very well with the pork. Now you can try to bring twenty slabs of raw leather to me. Your reward will be a hundred copper coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addResponse("Das Schweinefleisch hast du gut besorgt. Nun kannst du mir mal zwanzig Häute Rohleder auftreiben. Dein Lohn sollen hundert Kupferstücke sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(69, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kochfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Das sind doch mal ein paar ordentlichen Häute! Hier dein Geld und sag bescheid, wenn du wieder eine Aufgabe brauchst.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(69, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(69, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your cooking skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Very good pieces of leather. Here is your money and tell me, if you want an other task.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(69, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(69, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kochfertigkeit steigt."));
talkEntry:addResponse("Das sind doch mal ein paar ordentlichen Häute! Hier dein Geld und sag bescheid, wenn du wieder eine Aufgabe brauchst.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(69, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(69, "all", ">", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your cooking skill increases."));
talkEntry:addResponse("Very good pieces of leather. Here is your money and tell me, if you want an other task.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(69, 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(69, "all", "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Na, wo bleiben meine zwanzig Häute Rohleder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(69, "all", "<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("And? Where are my twenty slabs of raw leather?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps III"));
talkEntry:addResponse("You want another task? Well, bring me five pieces of deer meat and you will earn a hundred copper coins.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf III"));
talkEntry:addResponse("Du willst noch eine Aufgabe? Dann bring mir mal fünf Rehrücken und du erhältst hundert Kupfermünzen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps III"));
talkEntry:addResponse("You want another task? Well, bring me five pieces of deer meat and you will earn a hundred copper coins.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf III"));
talkEntry:addResponse("Du willst noch eine Aufgabe? Dann bring mir mal fünf Rehrücken und du erhältst hundert Kupfermünzen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You want another task? Well, bring me five pieces of deer meat and you will earn a hundred copper coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du willst noch eine Aufgabe? Dann bring mir mal fünf Rehrücken und du erhälst hundert Kupfermünzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addResponse("You want another task? Well, bring me five pieces of deer meat and you will earn a hundred copper coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addResponse("Du willst noch eine Aufgabe? Dann bring mir mal fünf Rehrücken und du erhälst hundert Kupfermünzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(552, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kochfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Was für ein hervorragendes Fleisch. Dafür bekommst du deine hundert Kupfermünzen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(552, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(552, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your cooking skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("That's meat with a great quality. Here are your coins for this work.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(552, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(552, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Kochfertigkeit steigt."));
talkEntry:addResponse("Was für ein hervorragendes Fleisch. Dafür bekommst du deine hundert Kupfermünzen.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(552, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(552, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your cooking skill increases."));
talkEntry:addResponse("That's meat with a great quality. Here are your coins for this work.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(552, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(552, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Fünf feine Rehrücken. Los, los.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(552, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Five fine pieces of deer meat, hurry up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps IV"));
talkEntry:addResponse("Of course I have an other task for you. For a barbecue, I need ten lumps of coal. Head for the Malachite mine, my buddy Bruno will help you. And believe it or not, your reward will be two hundred copper coins!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf IV"));
talkEntry:addResponse("Natürlich habe ich noch was für dich zutun. Für ein richtiges Grillfest brauche ich zehn Klumpen Kohle. Lauf mal zur Malachitmine, mein Kumpel Bruno wird dir helfen. Und glaub es oder nicht, dein Lohn werden zweihundert Kupfermünzen sein.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Dewy Swamps IV"));
talkEntry:addResponse("Of course I have an other task for you. For a barbecue, I need ten lumps of coal. Head for the Malachite mine, my buddy Bruno will help you. And believe it or not, your reward will be two hundred copper coins!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Morgentausumpf IV"));
talkEntry:addResponse(" Natürlich habe ich noch was für dich zutun. Für ein richtiges Grillfest brauche ich zehn Klumpen Kohle. Lauf mal zur Malachitmine, mein Kumpel Bruno wird dir helfen. Und glaub es oder nicht, dein Lohn werden zweihundert Kupfermünzen sein.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Of course I have an other task for you. For a barbecue, I need ten lumps of coal. Head for the Malachite mine, my buddy Bruno will help you. And believe it or not, your reward will be two hundred copper coins!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Natürlich habe ich noch was für dich zutun. Für ein richtiges Grillfest brauche ich zehn Klumpen Kohle. Lauf mal zur Malachitmine, mein Kumpel Bruno wird dir helfen. Und glaub es oder nicht, dein Lohn werden zweihundert Kupfermünzen sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addResponse("Of course I have an other task for you. For a barbecue, I need ten lumps of coal. Head for the Malachite mine, my buddy Bruno will help you. And believe it or not, your reward will be two hundred copper coins!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addResponse("Natürlich habe ich noch was für dich zutun. Für ein richtiges Grillfest brauche ich zehn Klumpen Kohle. Lauf mal zur Malachitmine, mein Kumpel Bruno wird dir helfen. Und glaub es oder nicht, dein Lohn werden zweihundert Kupfermünzen sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Kochfertigkeit steigt. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Das ist wirklich gute Kohle. Da hast du dir diese Münzen wirklich verdient.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your cooking skill increases. You advance in Archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Hmmm, good coal. You really deserve the coins.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Kochfertigkeit steigt."));
talkEntry:addResponse("Das ist wirklich gute Kohle. Da hast du dir diese Münzen wirklich verdient.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your cooking skill increases."));
talkEntry:addResponse("Hmmm, good coal. You really deserve the coins.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10));
talkEntry:addConsequence(npc.base.consequence.quest.quest(64, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wo ist denn meine Kohle, bitte schön?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Where is my coal, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry, but you really did enough for me. You were a great help. But maybe you go to the Malachite mine close to Galmair. There is someone who can need your help, too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Tut mir leid, du hast wirklich genug gemacht. Du warst eine tolle Hilfe. Aber gehe doch mal zur Malachitmine bei Galmair. Da ist jemand, der deine Hilfe gebrauchen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 8));
talkEntry:addResponse("I'm sorry, but you really did enough for me. You were a great help. But maybe you go to the Malachite mine close to Galmair. There is someone who can need your help, too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(64, "=", 8));
talkEntry:addResponse("Tut mir leid, du hast wirklich genug gemacht. Du warst eine tolle Hilfe. Aber gehe doch mal zur Malachitmine bei Galmair. Da ist jemand, der deine Hilfe gebrauchen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rind");
talkEntry:addTrigger("Kuh");
talkEntry:addTrigger("Kühe");
talkEntry:addTrigger("Kalb");
talkEntry:addResponse("Rinder findet ihr in der Steppe. Die Steaks von den Rindern sind wirklich gut. Aber irgendwie mögen die Elfen nicht, wenn ich sie besuchen komme...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schwein");
talkEntry:addResponse("Schinken vom Schwein ist der Klassiker. Damit verdient so mancher sein erstes Geld hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schaf");
talkEntry:addResponse("Schafe findet ihr auf den Weiden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reh");
talkEntry:addTrigger("Wild");
talkEntry:addResponse("Rehe findet ihr in den meißten Waldgebieten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cow");
talkEntry:addTrigger("cattle");
talkEntry:addResponse("You can find cattle on the plains. The steaks from the cattle there are really good. But somehow, the elves don't like me visiting them...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pig");
talkEntry:addResponse("Ham from the pigs is delicate. A lot of people earn their first money with it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sheep");
talkEntry:addResponse("You can find sheep on the stockyards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("deer");
talkEntry:addResponse("You can find deers in most of the forest areas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me wischt etwas Blut von seinem Schlachtermesser.", "#me wipes off some blood from his knife.");
talkingNPC:addCycleText("Frisches Fleisch! Beste Qualität!", "Fresh meat! Best quality!");
talkingNPC:addCycleText("#me spricht leise zu sich selbst: 'Ich brauche neues Fleisch.'", "#me speaks quietly to himself: 'I need more meat.'");
talkingNPC:addCycleText("#me singt: 'Ich hack das Schwein, ich hack es klein'", "#me sings: 'I butcher the pig, I butcher until it's dead.'");
talkingNPC:addCycleText("Will man es richtig geschlachtet haben, muss man es selbst schlachten.", "If you want to have it butchered the right way, you need to butcher it by your own.");
talkingNPC:addCycleText("Brust oder Keule? Was räuchere ich zuerst?", "Chest or ham? What shall I smoke first?");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schlachter Henry Darter.", "This NPC is the butcher Henry Darter.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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