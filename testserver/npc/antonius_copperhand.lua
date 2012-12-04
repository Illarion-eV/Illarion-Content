--------------------------------------------------------------------------------
-- NPC Name: Antonius Copperhand                                      Galmair --
-- NPC Job:  Goldsmith NPC                                                    --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  353, 255, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 353, 255, 0, 2, 'Antonius Copperhand', 'npc.antonius_copperhand', 0, 2, 1, 140, 50, 15, 189, 162, 151);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.antonius_copperhand", package.seeall)

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
talkEntry:addResponse("Ah, so you are interested in my wares.");
talkEntry:addResponse("Take your time to look around.");
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
talkEntry:addResponse("Ah, dann interessiert Ihr Euch also für meine Waren.");
talkEntry:addResponse("Schaut Euch ruhig in Ruhe um.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Antonius Copperhand the smith. Keywords: buy, sell, trade, job, your name."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Antonius Copperhand der Schmied. Schlüsselwörter: kaufe, verkaufe, Handel, Beruf, dein Name."));
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
talkEntry:addResponse("Be greeted in Irmoroms name.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Good day.");
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
talkEntry:addResponse("Zum Gruße.");
talkEntry:addResponse("Seid gegrüßt in Namen Irmoroms.");
talkEntry:addResponse("Guten Tach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Good day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Zum Gruße.");
talkEntry:addResponse("Seid gegrüßt.");
talkEntry:addResponse("Guten Tach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Goodbye.");
talkEntry:addResponse("May Irmorom be with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkEntry:addResponse("Möge Irmorom über Euch wachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Goodbye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Bis bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine, thanks. And how are ya?");
talkEntry:addResponse("Good, good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir jeht ett wunderbar und wie jeht et Euch?");
talkEntry:addResponse("Jut, jut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Me? I'm the goldsmith of Galmair, the hard working Antonius.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ick? Ick bin der Goldchmied von Galmair, der fleißge Antonius.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("At the moment I have nothing to do for ya. Sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zur Zeit gibbet für dich nix zu tun. T'schuldigung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("At the moment I have nothing to do for ya. Sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Zur Zeit gibbet für dich nix zu tun. T'schuldigung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a smith. Can't ya tell?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin 'nen Schmied. Siehste datt nich'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a smith. Can't ya tell?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin 'nen Schmied. Siehste datt nich'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Never heard of that place...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Kenn' ich nich'...");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me pfeift eine Melodie.", "#me whistles a melodie.");
talkingNPC:addCycleText("#me wischt sich den Schweiß von der Stirn.", "#me whipes the sweat off his forhead.");
talkingNPC:addCycleText("#me betrachtet zufrieden seine geschmiedeten Werke.", "#me looks at his smithes works with a conten face..");
talkingNPC:addCycleText("#me hält ein Amulett gegen das Licht, um es besser zu betrachten.", "#me holds an Amulett against the light, to have a better look at it.");
talkingNPC:addCycleText("Schmiedewaren! Schöner Schmuck! Kaufste woanders, dann bereustes!", "Smithes goods! Fine Juwelry! Ya buy elsewhere, and ya will regret it!");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(122,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2747,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2140,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(92,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(393,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(397,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(399,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1001,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2031,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(446,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(447,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(448,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(449,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(450,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(451,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(452,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(225,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(336,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(465,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(45,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(46,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(197,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(198,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(283,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(284,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(285,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(62,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(67,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(71,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(79,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(82,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(83,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(222,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(68,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(235,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(277,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(279,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(280,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(281,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(282,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(122,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2747,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2140,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(92,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(393,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(397,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(399,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1001,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2031,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(446,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(447,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(448,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(449,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(450,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(451,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(452,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(225,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(336,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(465,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(45,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(46,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(197,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(198,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(283,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(284,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(285,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(62,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(67,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(71,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(79,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(82,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(83,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(222,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(68,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(235,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(277,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(278,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(279,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(280,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(281,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(282,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Antonius Copperhand der fleißige Goldschmied.", "This NPC is Antonius Copperhand the hardworking goldsmith.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 8);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 45);
mainNPC:setEquipment(10, 53);
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