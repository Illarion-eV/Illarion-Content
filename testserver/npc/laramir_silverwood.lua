--------------------------------------------------------------------------------
-- NPC Name: Laramir Silverwood                                          None --
-- NPC Job:  Carpenter/Schmied                                                --
--                                                                            --
-- NPC Race: elf                        NPC Position:  367, 277, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 367, 277, 0, 4, 'Laramir Silverwood', 'npc.laramir_silverwood', 0, 2, 0, 200, 221, 243, 245, 217, 200);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.laramir_silverwood", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("I trade with wooden goods. Feel free to take a look my friend.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addTrigger("veräußer");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("I handle mit hölzernen Waren. Bitte, sieh dich ruhig um, mein Freund!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Laramir Silverwood the carpenter. Keywords: buy, sell, trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Laramir Silverwood der Schreiner. Schlüsselwörter: kaufe, verkaufe, Handel."));
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
talkEntry:addResponse("Be greeted, my friend. How are you today?");
talkEntry:addResponse("Greetings my friend. Did you come here for taking a look at my wares?");
talkEntry:addResponse("#me smiles 'Greetings, my friend.'");
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
talkEntry:addResponse("Seid Gegrüßt mein Freund. Wie geht es dir heute?");
talkEntry:addResponse("Grüße, mein Freund. Bist du gekommen um meine Ware zu bewundern?");
talkEntry:addResponse("#me lächelt 'Grüße, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted, my friend. How are you today?");
talkEntry:addResponse("Greetings my friend. Did you come here for taking a look at my wares?");
talkEntry:addResponse("#me smiles 'Greetings, my friend.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid Gegrüßt mein Freund. Wie geht es dir heute?");
talkEntry:addResponse("Grüße, mein Freund. Bist du gekommen um meine Ware zu bewundern?");
talkEntry:addResponse("#me lächelt 'Grüße, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fare well, my friend.");
talkEntry:addResponse("Stay safe, my friend!");
talkEntry:addResponse("May the gods protect you, my friend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lebt wohl, mein Freund.");
talkEntry:addResponse("Pass auf dich auf, mein Freund.");
talkEntry:addResponse("Mögen die Götter dich beschützen, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fare well, my friend.");
talkEntry:addResponse("Stay safe, my friend!");
talkEntry:addResponse("May the gods protect you, my friend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Lebt wohl, mein Freund.");
talkEntry:addResponse("Pass auf dich auf, mein Freund.");
talkEntry:addResponse("Mögen die Götter dich beschützen, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Thank you for asking, my friend. I feel fine. And you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Danke der Nachfrage, mein Freund. Ich fühle mich gut. Und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My friend, my name is Laramir Silverwood.");
talkEntry:addResponse("My name is Laramir Silverwood, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Freund, ich heiße Laramir Silverwood.");
talkEntry:addResponse("Mein Name ist Laramir silverwood, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("My friend, there is nothing I could ask you to do. But I'm thankful for your concern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Mein Freund, es gibt nichts um was ich dich bitten könnte. Aber ich bin dankbar für deine Sorge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("My friend, there is nothing I could ask you to do. But I'm thankful for your concern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Mein Freund, es gibt nichts um was ich dich bitten könnte. Aber ich bin dankbar für deine Sorge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm an elven trader, my friend.");
talkEntry:addResponse("I'm an elven carpenter, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein elfischer Händler, mein Freund.");
talkEntry:addResponse("Ich bin ein elfischer Schreiner, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm an elven trader, my friend.");
talkEntry:addResponse("I'm an elven carpenter, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein elfischer Händler, mein Freund.");
talkEntry:addResponse("Ich bin ein elfischer Schreiner, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Do you like nice conversations, my friend? We have to learn how to talk with others from young age on.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addResponse("Magst du nette Plaudereinen, mein Freund? Wir müssen von klein auf lernen mit anderen zu reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hmm...ask someone else if you want know about it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hmm...fragt jemand anderen bezüglich dieses Ortes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("What a fine name, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Was für ein schöner Name, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Laramir");
talkEntry:addTrigger("Silverwood");
talkEntry:addResponse("Yes, that is my name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Laramir");
talkEntry:addTrigger("Silverwood");
talkEntry:addResponse("Ja, das ist mein Name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("A bit more concrete, please!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Etwas konkreter wenn ich bitten darf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("A bit more concrete, please!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Etwas konkreter wenn ich bitten darf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, what are you talking about, my friend?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, was sagt ihr dort, mein Freund?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me gähnt.", "#me yawns.");
talkingNPC:addCycleText("#me blickt herum mit geschlossenen Augen.", "#me looks around with closed eyes.");
talkingNPC:addCycleText("#me untersucht seine Kleidung.", "#me examines his cloths.");
talkingNPC:addCycleText("#me kämmt sein Haar.", "#me combs his hair.");
talkingNPC:addCycleText("#me isst einen Apfel.", "#me eats an apple.");
talkingNPC:addCycleText("#me prüft seine Waren.", "#me examines his wares.");
tradingNPC:addNotEnoughMoneyMsg("Mein Freund, ich glaube du hast deine Münzen nicht gezählt.", "My friend. I think you forgot counting your coins.");
tradingNPC:addDialogClosedMsg("Komm wieder, mein Freund.", "Please come again, my friend.");
tradingNPC:addDialogClosedNoTradeMsg("Bis zum nächsten mal, mein Freund.", "Hope to see you again, my friend!");
tradingNPC:addWrongItemMsg("Mein Freund, was soll ich mit diesem Gegenstand?", "My friend, what shall I use this thing for?");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(9,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(74,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2709,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2715,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2752,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2193,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2194,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(323,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2782,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2783,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2784,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2785,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(64,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(237,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(322,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1266,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(545,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(546,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2543,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2716,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(65,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(70,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2646,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2685,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2708,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2714,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2718,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2723,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2727,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2780,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2525,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2527,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2528,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2530,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2541,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2544,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2548,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2549,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2561,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2566,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2567,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2570,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2572,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2573,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2584,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2585,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(90,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(332,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(333,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(335,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(56,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(543,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(544,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2560,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2786,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(17,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(18,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(19,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(20,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(95,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(96,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(186,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(916,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(917,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2284,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2388,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2439,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2445,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2447,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2448,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(39,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(40,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(57,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(76,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(207,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(208,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(209,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(293,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(294,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2645,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(9,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(74,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2709,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2715,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2752,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2193,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2194,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(323,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2782,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2783,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2784,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2785,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(64,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(237,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(322,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1266,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(545,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(546,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2543,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2716,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(65,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(70,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2646,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2685,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2708,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2714,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2718,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2723,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2727,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2780,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2525,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2527,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2528,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2530,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2541,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2544,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2548,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2549,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2561,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2566,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2567,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2570,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2572,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2573,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2584,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2585,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(90,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(332,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(333,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(335,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(56,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(543,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(544,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2560,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2786,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(17,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(18,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(19,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(20,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(95,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(96,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(186,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(916,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(917,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2284,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2388,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2439,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2445,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2447,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2448,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(39,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(40,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(57,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(76,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(207,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(208,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(209,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(293,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(294,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2645,"buySecondary"));
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Laramir Silverwood der Schreiner.", "This NPC is Laramir Silverwood the carpenter.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me lächelt und zuckt mit den Schultern.", "#me smilies and shrougs his shoulders.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 364);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 335);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 183);
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