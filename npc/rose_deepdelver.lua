--------------------------------------------------------------------------------
-- NPC Name: Rose Deepdelver                                         Runewick --
-- NPC Job:  Barkeeper                                                        --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  950, 834, 0            --
-- NPC Sex:  female                     NPC Direction: east                   --
--                                                                            --
-- Author:   Zot                                                              --
--                                                                            --
-- Last parsing: October 28, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 950, 834, 0, 2, 'Rose Deepdelver', 'npc.rose_deepdelver', 1, 1, 0, 205, 102, 29, 232, 187, 145);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.rose_deepdelver", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("handel");
talkEntry:addResponse("Lass uns handeln!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("trade");
talkEntry:addResponse("Let's trade!");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Rose Deepdelver the owner of the tavern. Keywords: Greetings, family, trade."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Rose Deepdelver die Besitzerin der Taverne. Schlüsselwörter: Grüße, Familie, Handel."));
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
talkEntry:addResponse("Hiho! Ich verkauf die besten Getränke weit und breit.");
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
talkEntry:addResponse("Hiho! Ich hab die besten Getränke weit und breit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho! Nice day, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hiho! Schöner Tag heute, nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("See you!");
talkEntry:addResponse("Toodles!");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Mach's gut!");
talkEntry:addResponse("Tschüssi!");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("See you!");
talkEntry:addResponse("Toodles!");
talkEntry:addResponse("Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Mach's gut!");
talkEntry:addResponse("Tschüssi!");
talkEntry:addResponse("Auf wiedersehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine, what about you?");
talkEntry:addResponse("I'm fine, but you look like you could need something to drink, hihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir gehts ganz gut und dir?");
talkEntry:addResponse("Gut., aber du siehst aus als würdest du was zu trinken gebrauchen, hihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Rose Deepdelver, barkeeper. That's me.");
talkEntry:addResponse("I am the barkeeper Rose Deepdelver.");
talkEntry:addResponse("Rose Deepdelver is my name, owner is this lovely tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Rose Deepdelver, die Bedienung. Das bin ich.");
talkEntry:addResponse("Ich bin die Bedienung Rose Deepdelver");
talkEntry:addResponse("Rose Deepdelver mein Name, Besitzerin dieser großartigen Taverne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the owner and also the barkeeper of this tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin die Besiterin und auch die Bedienung dieser Taverne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the owner and also the barkeeper of this tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin die Besiterin und auch die Bedienung dieser Taverne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you. If you want something to drink or eat just ask me, hihi.");
talkEntry:addResponse("A nice name, indeed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Schön dich kennenzulernen. Wenn du etwas trinken oder essen willst, frag mich einfach, hihi.");
talkEntry:addResponse("Ein netter Name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gods");
talkEntry:addResponse("The gods created this world for us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Götter");
talkEntry:addTrigger("Gott");
talkEntry:addResponse("Die Götter haben diese Welt für uns erschaffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Hihi, that one I'd really like to meet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Hihi, den würde ich gerne mal treffen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("family");
talkEntry:addResponse("I am living together with my husband and child in Runewick. A peaceful place to be.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Familie");
talkEntry:addResponse("Ich lebe zusammen mit meinem Mann und meinem Kind in Runewick. Es ist ein sehr friedvoller Ort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("husband");
talkEntry:addResponse("My husband Milo knows a lot about herb lore, just ask him if you want to know something about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mann");
talkEntry:addResponse("Mein Mann Milo weiß eine menge über Kräuterkunde, wenn du etwas wissen willst, frag ihn einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("child");
talkEntry:addResponse("I have a small daughter of three years, she is wonderful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kind");
talkEntry:addResponse("Ich habe eine kleine Tochter von drei Jahren, sie ist einfach wundervoll!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("my name");
talkEntry:addResponse("My Name is Rose Deepdelver. If you are hungry or thirsty, then come to me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name");
talkEntry:addResponse("Mein Name ist Rose Deepdelver. Wenn du hungrig oder durstig bist, dann komm zu mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rose");
talkEntry:addTrigger("Deepdelver");
talkEntry:addResponse("Yes, this is my name. If you need something to drink, just ask me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rose");
talkEntry:addTrigger("Deepdelver");
talkEntry:addResponse("Ja, so heiße ich. Falls ihr etwas trinken wollt, fragt nur mich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Could you rephrase that?");
talkEntry:addResponse("Good to hear that.");
talkEntry:addResponse("Sure?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Könntet ihr das anders ausdrücken?");
talkEntry:addResponse("Gut zu hören!");
talkEntry:addResponse("Sicher?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Could you rephrase that?");
talkEntry:addResponse("Oh, I see.");
talkEntry:addResponse("Sure?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Könntet ihr das anders ausdrücken?");
talkEntry:addResponse("Nun, ich verstehe.");
talkEntry:addResponse("Sicher?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me wischt über die Theke.", "#me wipes the counter.");
talkingNPC:addCycleText("#me schaut sich nach Kunden um.", "#me looks around for customers.");
talkingNPC:addCycleText("#me knabbert an einem Keks.", "#me nibbles on a cookie.");
talkingNPC:addCycleText("#me trocknet ein Glas ab.", "#me cleans a glass.");
talkingNPC:addCycleText("#me summt leise etwas vor sich hin.", "#me hums quitly.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(191,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(224,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(353,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(453,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(454,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(517,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(518,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(783,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(784,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(785,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(786,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(787,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(788,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(789,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(790,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(791,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1315,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1316,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1318,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1319,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1841,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1842,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1843,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1844,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1853,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1854,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1855,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1856,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1857,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1858,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1859,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1860,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1861,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1909,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2056,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2057,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2058,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2059,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2185,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2186,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2187,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2188,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2189,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2276,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2278,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2456,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2496,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2497,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2499,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2500,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2501,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2922,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2923,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2935,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2952,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(80,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(199,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(784,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(785,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1315,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1318,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1319,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1909,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2501,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(81,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(151,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(290,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(783,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(786,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(787,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(788,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(789,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(791,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1316,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2500,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Du hast nicht genug Geld!", "You don't have enough money!");
tradingNPC:addDialogClosedMsg("Danke, komm doch bald wieder.", "Thanks, come back soon.");
tradingNPC:addDialogClosedNoTradeMsg("Nichts gefunden was dir gefällt?", "Don't you like my wares?");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Rose Deepdelver die Bedienung.", "This NPC is Rose Deepdelver the barkeeper.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 801);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 842);
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