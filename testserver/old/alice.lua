--------------------------------------------------------------------------------
-- NPC Name: Alice                                                    Galmair --
-- NPC Job:  slave                                                            --
--                                                                            --
-- NPC Race: human                      NPC Position:  389, 262, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 389, 262, 0, 6, 'Alice', 'npc.alice', 1, 1, 0, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.talk")
module("npc.alice", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Alice the ore melting slave. Change a raw ore and a piece of coal into a melted ingot. Fee: 1 silver coin for each task. Keywords: smelt 5 gold, smelt 3 copper, smelt 17 silver, smelt 8 iron."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Alice die versklavte Erzschmelzerin. Tausche ein Stück Kohle und einen Erzbrocken gegen einen eingeschmolzenen Barren. Gebühr: 1 Silberstück á Auftrag. Schlüsselwörter: schmelze 5 Gold, schmelze 3 Kupfer, schmelze 17 Silber, schmelze 8 Eisen."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("(%d+) gold");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(236, "%NUMBER", 333, nil));
talkEntry:addResponse("#me takes the silver coin and starts to melt the ore, after a few moments she finishes her work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("(%d+) gold");
talkEntry:addResponse("#me answers in a whiny voice: 'I-I'm soo sorry. You d-don't have enough coins to p-pay the fee. It's o-one silver coin.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("(%d+) gold");
talkEntry:addResponse("#me answers in a whiny voice: 'I-I'm soo sorry. You d-didn't b-bring enough coal and gold nuggets.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) gold");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(234, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(236, "%NUMBER", 333, nil));
talkEntry:addResponse("#me bekommt ein Silberstück und beginnt Erz einzuschmelzen. Nach einigen Augenblicken beendet sie ihre Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(234, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) gold");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr h-habt nicht genug Münzen bei... bei Euch. E-es kostet e-ein Silberstück.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) gold");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr brachtet nicht genug Kohle und Goldnuggets.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) copper");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2550, "%NUMBER", 333, nil));
talkEntry:addResponse("#me takes the silver coin and starts to melt the ore, after a few moments she finishes her work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) copper");
talkEntry:addResponse("#me answers in a whiny voice: 'I-I'm soo sorry. You d-don't have enough coins to p-pay the fee. It's o-one silver coin.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) copper");
talkEntry:addResponse("#me answers in a whiny voice: 'I-I'm soo sorry. You d-didn't b-bring enough coal and copper ore.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) kupfer");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2550, "%NUMBER", 333, nil));
talkEntry:addResponse("#me bekommt ein Silberstück und beginnt Erz einzuschmelzen. Nach einigen Augenblicken beendet sie ihre Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) kupfer");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr h-habt nicht genug Münzen bei... bei Euch. E-es kostet e-ein Silberstück.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) kupfer");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr brachtet nicht genug Kohle und Kupfererz.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) iron");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2535, "%NUMBER", 333, nil));
talkEntry:addResponse("#me takes the silver coin and starts to melt the ore, after a few moments she finishes her work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) iron");
talkEntry:addResponse("#me answers in a whiny voice: 'I-I'm soo sorry. You d-don't have enough coins to p-pay the fee. It's o-one silver coin.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) iron");
talkEntry:addResponse("#me answers in a whiny voice: 'I-I'm soo sorry. You d-didn't b-bring enough coal and iron ore.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 100));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) eisen");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, "%NUMBER", nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2535, "%NUMBER", 333, nil));
talkEntry:addResponse("#me bekommt ein Silberstück und beginnt Erz einzuschmelzen. Nach einigen Augenblicken beendet sie ihre Arbeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "=>", function(number) return (number*1); end, nil));
talkEntry:addTrigger("(%d+) eisen");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr h-habt nicht genug Münzen bei... bei Euch. E-es kostet e-ein Silberstück.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("(%d+) eisen");
talkEntry:addResponse("#me antwortet mit weinerlicher Stimme: 'E-es tut mir sehr Leid. I-Ihr brachtet nicht genug Kohle und Eisenerz.'");
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
talkEntry:addResponse("#me gives you a shy 'H-hello...'.");
talkEntry:addResponse("#me nods in a frightened manner.");
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
talkEntry:addResponse("#me gibt ein schhüchternes 'H-hallo...' von sich.");
talkEntry:addResponse("#me nickt dir ängstlich zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me gives you a shy 'H-hello...'.");
talkEntry:addResponse("#me nods in a frightened manner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me gibt ein schhüchternes 'H-hallo...' von sich.");
talkEntry:addResponse("#me nickt dir ängstlich zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Uhm...hm.");
talkEntry:addResponse("#me gives a quiet '...bye...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("#me gibt ein leises '...tschüß...' von sich.");
talkEntry:addResponse("Uhm, hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Uhm...hm.");
talkEntry:addResponse("#me gives a quiet '...bye...'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("#me gibt ein leises '...tschüß...' von sich.");
talkEntry:addResponse("Uhm, hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I-I'm f-fine. H-h-haven't d-done some-something wrong, h-have I?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("G-gut! M-Mir geht-gehts g-gut. I-ich h-hab doch n-nichts falsch g-gemacht, o-oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("M-my n-n-name is Alice...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("I-ich b-bin Alice...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Y-you just can't help me. I h-have to w-work alone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ihr, ihr k-könnt mir einfach nicht helfen. I-Ich muss m-meine Arbeit s-selbst machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Y-you just can't help me. I h-have to w-work alone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ihr, ihr k-könnt mir einfach nicht helfen. I-Ich muss m-meine Arbeit s-selbst machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I m-melt all ores i-into ingots. G-gold. Copper, silver... a-and iron. A s-silver piece... each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("I-ch schmelze a-alle Erze z-zu Barren. G-gold. Kupfer, Silber... u-und Eisen. E-ein Silberstück pr-pro Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I m-melt all ores i-into ingots. G-gold. Copper, silver... a-and iron. A s-silver piece... each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("I-ch schmelze a-alle Erze z-zu Barren. G-gold. Kupfer, Silber... u-und Eisen. E-ein Silberstück pr-pro Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("E-excuse m-me. I never heard of it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("E-entschuldigung. I-ich hab nie davon gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("H-how m-may I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("W-was soll i-ich machen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Slave");
talkEntry:addResponse("#me jerks subtly. 'How m-may I h-help y-you?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Krudash");
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addResponse("I h-have to do w-what the orcs say. I must not cry and h-have to be st-st-strong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("I g-grew up w-with orcs my whole l-life. I c-can't remember a t-time when it was different....");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sklave");
talkEntry:addResponse("#me zuckt unmerklich zusammen. 'B-bitte, w-was soll i-ich machen?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Krudash");
talkEntry:addTrigger("Murgo");
talkEntry:addTrigger("er hja");
talkEntry:addTrigger("erhja");
talkEntry:addTrigger("er'hja");
talkEntry:addResponse("I-ich muss h-hören was d-die Orks mir sagen. I-ich darf n-nicht j-jammern und m-muss t-tüchtig sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Ich b-bin praktisch b-bei Orks aufgewachsen. S-schon mein... mein ganzes Leben. I-ich kann mich nicht erinnern d-das es je anders w-war. H-hab nie w-was anders ge-gemacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Th-the Leader of Runewick. H-he should be a mighty and smart wizard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("D-der Anführer v-von Runewick. E-er soll ein m-mächtiger u-und weiser Zauberer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Th-the Leader of Runewick. H-he should be a mighty and smart wizard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("D-der Anführer v-von Runewick. E-er soll ein m-mächtiger u-und weiser Zauberer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("R-runewick. They count on s-smart people. I th-think... I w-would fit in g-good there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("R-runewick. D-dort schätzen sie die Klugen. I-Ich glaube ich k-könnte es dort z-zu mehr bringen, als hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Th-the ch-chieftain o-of Galmair. I hear... - heard he's a dangerous person.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("D-der H-häuptling von Galmair. Ich h-hab ge-gehört... er ist sehr g-gefählich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("G-galmair. Th-the name of the t-town here. Th-the life is hard and the work i-is difficult.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("G-galmair. D-das ist d-diese Stadt hier. D-das Leben ist hart u-und man muss v-viel arbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("I... - I heard sh-she is a beautiful and mighty q-queen. N-nobody w-would be rude to h-her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("I-ich... - Ich habe gehört sie ist eine schöne und mächtige K-königin. N-niemand w-würde sie f-falsch behandeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I... - I heard sh-she is a beautiful and mighty q-queen. N-nobody w-would be rude to h-her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I-ich... - Ich habe gehört sie ist eine schöne und mächtige K-königin. N-niemand w-würde sie f-falsch behandeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("C-cadomyr? Th-they told me it's horrible there. B-but c-could it be worse than here?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("C-cadomyr? M-man hat mir gesagt, d-dort ist es grauenhaft. A-aber k-kann es irgendwo schlimmer s-sein als hier, wo i-ich eine Slkavin s-sein muss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("#me sighs. 'E-excuse me. I d-don't know about these things. I've b-been a s-slave for m-my whole life.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("#me schluchzt. 'E-entschulidge, a-aber von s-solchen S-sachen w-weiß ich f-fast nichts. I-ich bin d-doch s-schon mein ganzes L-leben lang Sklave.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("#me sighs. 'E-excuse me. I d-don't know about these things. I've b-been a s-slave for m-my whole life.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("#me schluchzt. 'E-entschulidge, a-aber von s-solchen S-sachen w-weiß ich f-fast nichts. I-ich bin d-doch s-schon mein ganzes L-leben lang Sklave.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("#me sighs. 'E-excuse me. I d-don't know about these things. I've b-been a s-slave for m-my whole life.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("#me schluchzt. 'E-entschulidge, a-aber von s-solchen S-sachen w-weiß ich f-fast nichts. I-ich bin d-doch s-schon mein ganzes L-leben lang Sklave.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I'm s-sorry, I know just a l-little bit about the gods of I-Illarion. B-but I will you tell what th-the orcs t-told me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Es tut m-mir Leid, ich weiß so w-wenig über d-die Götter I-Illairons. A-aber ich will E-euch sagen was m-mir die Orks g-gesagt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("M-my owner said Brágon is th-the 'daily?sun?maker'. H-he is th-the big lord of the fire orcs. A-and oh I d-don't know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("M-mein Besitzer sagt Brágon ist der 'täglich?Sonnen?Macher'. Er i-ist der g-große Herr der Flammenorks. U-und ich w-weiß nicht mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Th-the icy witch. It's w-what the orcs call her. B-But just their shaman's seem to talk a-about her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("D-die eisige Hexe. S-so n-nennen sie die Orks. A-Aber nur d-die S-schamanen scheinen darüber zu s-sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Th-the dwarves, h-here all arround pray t-to Irm-irmorom. There's a temple i-in the town. B-but I don't know anything about him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("D-die Zwerge hier ü-überal b-beten zu ihm. Und es g-gibt auch einen T-tempel i-in der Stadt. A-aber ich weiß n-nichts über ihn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me jerks horrible: 'I-It is f-forbidden to s-say - say this n-name!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me zuckt schrecklich zusammen: 'E-es ist v-verboten diesen - diesen Namen z-zu sagen!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("If enough ore and... and coal is brought, I w-will melt them f-for fee of a s-silver piece... each task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("W-wenn genügend K-kohle u-und Erz da ist sch-schmelze ich sie z-zu Barren. K-kostet e-ein Silberstück pr-pro Auftrag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("O-once, the fire di-died during melting. A-and Krudash saw it... *sighs*");
talkEntry:addResponse("So-sometimes, if there's no business, I... - I j-just close my eyes and i-imagine I'm far far away.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("E-einmal i-ist mir das Feuer während dem S-schmelzen ausgegangen. U-und Krudash hat es gesehen. *schnieft*");
talkEntry:addResponse("Ma-manchmal wenn n-nichts zu tun ist, dann mach ich di-die Augen zu und d-denk mir, ich wäre wo anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Alice");
talkEntry:addTrigger("Snaga");
talkEntry:addResponse("#me jerks subtly. 'How m-may I h-help y-you?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alice");
talkEntry:addTrigger("Snaga");
talkEntry:addResponse("#me zuckt unmerklich zusammen. 'B-bitte, w-was soll i-ich machen?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me gives a humble nod. 'Y-yes... yes sir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt zaghaft. 'Z-zu... zu Befehl!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me gives a humble nod. 'Y-yes... yes sir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me nickt zaghaft. 'Z-zu... zu Befehl!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I-I'm sorry!");
talkEntry:addResponse("E-excuse m-me.");
talkEntry:addResponse("Y-yes. I w-will work h-harder from n-now on...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("E-es tut m-mir Leid!");
talkEntry:addResponse("E-entschuldigung.");
talkEntry:addResponse("J-ja. I-ich werde m-mir mehr Mü-mühe geben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me reibt sich müde die Augen.", "#me rubs her sleepy eyes.");
talkingNPC:addCycleText("#me tritt eineige Male auf den Blasebalg, schnell beginnen die Kohlen in der Esse hell zu glühen.", "#me pumps the bellows several times and the coals in the forge start to glow brightly.");
talkingNPC:addCycleText("#me schaufelt einige Kohlenstücke in die Esse.", "#me shovels some coal into the forge.");
talkingNPC:addCycleText("#me gibt eine leisen Schluchzer von sich.", "#me sobs quietly.");
talkingNPC:addCycleText("#me kratzt an ihren verfilzten Haaren.", "#me scratches her scruffy hair.");
talkingNPC:addCycleText("#me rülpst leise, Duft von schalem Bier und gebratenen Fleisch entschwebt in die Nasen der Umgebung.", "#me burps quietly, the scent of stale beer and roasted meat floats into the noses of anyone in the surrounding area.");
talkingNPC:addCycleText("#me balanziert für einige Sekunden auf den Zähenspitzen.", "#me balances for several second on her toes.");
talkingNPC:addCycleText("#me beißt sich auf die Unterlippe und blickt skeptisch auf das Feuer in der Esse.", "#me bites her lower lip and glances skeptically at the fire in the forge.");
talkingNPC:addCycleText("#me zuckt plötzlich heftig zusammen. Dann blickt sie sich beunruhigt um.", "#me jerks hard, then she glances around, seeming worried.");
talkingNPC:addCycleText("#me kneift die Augen zusammen und späht durch die Türe in Richtung des Marktes.", "#me narrows her eyes and peeks through the door at the market.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Eine junge in Lumpen gekleidete Frau. Ihr Haar ist verdreckt und ihre Haut von Ruß und Kohle geschwärzt.", "A young women dressed in rags. Her hair is filthy and her skin is covered with coal and dust.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 802);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 826);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END