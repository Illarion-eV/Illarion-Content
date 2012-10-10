--------------------------------------------------------------------------------
-- NPC Name: Laramir  Silverwood                                         None --
-- NPC Job:  Carpenter/Schmied                                                --
--                                                                            --
-- NPC Race: elf                        NPC Position:  352, 256, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                                            --
-- Last parsing: October 02, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 352, 256, 0, 2, 'Laramir  Silverwood', 'npc.laramir__silverwood', 0, 2, 0, 200, 221, 243, 245, 217, 200);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.laramir__silverwood", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
tradingNPC:addNotEnoughMoneyMsg("Mein Freund, ich glaube du hast deine Münzren nicht gezählt.", "My friend. I think you forgot counting you coins.");
tradingNPC:addDialogClosedMsg("Komm wieder, mein Freund.", "Please come again, my friend.");
tradingNPC:addDialogClosedNoTradeMsg("Bis zum nächsten mal, mein Freund.", "Hope to see you again, my friend!");
tradingNPC:addWrongItemMsg("Mein Freund, was soll ich mit diesem Gegenstand?.", "My friend, what shall I use this thing for?");
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Laramir  Silverwood the carpenter. Keywords: TRIGGER1, TRIGGER2, TRIGGER3, TRIGGER4, TRIGGER5."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Laramir  Silverwood der Schreiner. Schlüsselwörter: TRIGGER1, TRIGGER2, TRIGGER3, TRIGGER4, TRIGGER5."));
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
talkEntry:addResponse("#me smiles 'Greetings, my Friend.'");
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
talkEntry:addResponse("#me smiles 'Greetings, my Friend.'");
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
talkEntry:addResponse("My the gods protect you, my Friend!");
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
talkEntry:addResponse("My the gods protect you, my Friend!");
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
talkEntry:addResponse("Mewin Name ist Laramir silverwood, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
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
talkEntry:addResponse("I handle mit hölzernen Waren. Bitte, sieh dir ruhig um mein Freund!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("My Friend, there is nothing I could ask you for. But I'm thankfull for your concern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Mein Freund, es gibts nicht um was ich dich bitten könnte. Aber ichbin dankbar für deine Sorge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("My Friend, there is nothing I could ask you for. But I'm thankfull for your concern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Mein Freund, es gibts nicht um was ich dich bitten könnte. Aber ichbin dankbar für deine Sorge.");
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
talkEntry:addResponse("Do you like nice conversations, my friend? We have to lean how to talk with others from young age on.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addResponse("Magst du nette Plaudereinen, mein Freund? Wir müssen von klein auf lernen mit anderen zu reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Mein Freund, ich glaube du hast deine Münzren nicht gezählt.", "My friend. I think you forgot counting you coins.");
tradingNPC:addDialogClosedMsg("Komm wieder, mein Freund.", "Please come again, my friend.");
tradingNPC:addDialogClosedNoTradeMsg("Bis zum nächsten mal, mein Freund.", "Hope to see you again, my friend!");
tradingNPC:addWrongItemMsg("Mein Freund, was soll ich mit diesem Gegenstand?.", "My friend, what shall I use this thing for?");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buySecondary"));
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
tradingNPC:addNotEnoughMoneyMsg("Mein Freund, ich glaube du hast deine Münzren nicht gezählt.", "My friend. I think you forgot counting you coins.");
tradingNPC:addDialogClosedMsg("Komm wieder, mein Freund.", "Please come again, my friend.");
tradingNPC:addDialogClosedNoTradeMsg("Bis zum nächsten mal, mein Freund.", "Hope to see you again, my friend!");
tradingNPC:addWrongItemMsg("Mein Freund, was soll ich mit diesem Gegenstand?.", "My friend, what shall I use this thing for?");
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