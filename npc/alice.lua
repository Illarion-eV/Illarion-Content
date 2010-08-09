--------------------------------------------------------------------------------
-- NPC Name: Alice                                                       None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  389, 268, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.consequence.item")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.alice", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt (%d+) gold");
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to melt the ore, after a few moments she finishes her work.");
talkEntry:addConsequence(npc.base.consequence.item.item(236, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt (%d+) gold");
talkEntry:addResponse("#me answers whiny-voiced: 'I-I'm soo sorry. You brought n-not enough coal and gold nuggets.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz (%d+) gold");
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt Erz einzuschmelzen. Nach einigen Augenblicken beendet sie ihre Arbeit.");
talkEntry:addConsequence(npc.base.consequence.item.item(236, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz (%d+) gold");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr brachtet nicht genug Kohl und Goldnuggets.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt (%d+) copper");
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to melt the ore, after a few moments she finishes her work.");
talkEntry:addConsequence(npc.base.consequence.item.item(2550, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt (%d+) copper");
talkEntry:addResponse("#me answers whiny-voiced: 'I-I'm soo sorry. You brought n-not enough coal and copper ore.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz (%d+) kupfer");
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt Erz einzuschmelzen. Nach einigen Augenblicken beendet sie ihre Arbeit.");
talkEntry:addConsequence(npc.base.consequence.item.item(2550, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz (%d+) kupfer");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr brachtet nicht genug Kohl und KUpfererz.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt (%d+) iron");
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me starts to melt the ore, after a few moments she finishes her work.");
talkEntry:addConsequence(npc.base.consequence.item.item(2535, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt (%d+) iron");
talkEntry:addResponse("#me answers whiny-voiced: 'I-I'm soo sorry. You brought n-not enough coal and iron ore.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz (%d+) eisen");
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "=>", function(number) return (number*1); end));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end));
talkEntry:addResponse("#me beginnt Erz einzuschmelzen. Nach einigen Augenblicken beendet sie ihre Arbeit.");
talkEntry:addConsequence(npc.base.consequence.item.item(2535, "%NUMBER", 333, 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz (%d+) eisen");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr brachtet nicht genug Kohl und Eisenerz.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("melt");
talkEntry:addResponse("I 'melt copper ore', '-iron ore' and '-gold nuggets'...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmelz");
talkEntry:addResponse("Ich 'schmelze Kupfererz', '-Eisenerz' und '-Goldnugets'...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("#me gibt ein schhüchternes 'H-hallo...' von sich.");
talkEntry:addResponse("#me nickt dir ängstlich zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("#me gives you a shy 'H-hello...'.");
talkEntry:addResponse("#me nods in a scared way.");
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
talkEntry:addResponse("#me gives you a shy 'H-hello...'.");
talkEntry:addResponse("#me nods in a scared way.");
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
talkEntry:addResponse("#me gibt ein schhüchternes 'H-hallo...' von sich.");
talkEntry:addResponse("#me nickt dir ängstlich zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("I-ich b-bin %NPCNAME...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Uhm...hm.");
talkEntry:addResponse("#me gives a quiet '...bye...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("#me gibt ein leises '...tschüß...' von sich.");
talkEntry:addResponse("Uhm, hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Uhm...hm.");
talkEntry:addResponse("#me gives a quiet '...bye...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me gibt ein leises '...tschüß...' von sich.");
talkEntry:addResponse("Uhm, hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("G-g-gut! M-Mir geht-gehts g-gut. I-ich h-h-hab doch n-nichts falsch g-gemacht, o-o-oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("I-I'm f-f-fine. H-h-havn't d-done some-something wrong, o-o-or?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("M-my n-n-name is NPCNAME...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("H-how m-may I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("W-was soll i-ich machen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addResponse("Ich 'schmelze Kupfererz', '-Eisenerz' und '-Goldnugets'...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addResponse("Ich 'schmelze Kupfererz', '-Eisenerz' und '-Goldnugets'...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addResponse("I 'melt copper ore', '-iron ore' and '-gold nuggets'...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Murgo? He is my owner. And Krudash is his wife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Murgo? Er ist mein Besitzer. Und Krudash seine Frau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me reibt sich müde die Augen.", "#me rubs her sleepy eyes.");
talkingNPC:addCycleText("#me tritt eineige Male auf den Blasebalg, schnell beginnen die Kohlen in der Esse hell zu glühen.", "#me pumps the bellows several times and the coals in the forge start to glow brigtly.");
talkingNPC:addCycleText("#me schaufelt einige Kohlenstücke in die Esse.", "#me shovels some coal into the forge.");
talkingNPC:addCycleText("#me gibt eine leisen Schluchzer von sich.", "#me sobs quietly.");
talkingNPC:addCycleText("#me kratzt an ihren verfilzten Haaren.", "#me scratches her scruffy hairs.");
talkingNPC:addCycleText("#me rülpst leise, Duft von schalem Bier und gebratenen Fleisch entschwebt in die Nasen der Umgebung.", "#me burps quietly, flavour of stale beer and roasted meat floats into the noses of the surrounding area.");
talkingNPC:addCycleText("#me balanziert für einige Sekunden auf den Zähenspitzen.", "#me balances for several second at his/her toes.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
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