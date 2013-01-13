--------------------------------------------------------------------------------
-- NPC Name: Elvaine Morgan                                          Runewick --
-- NPC Job:  Archmage                                                         --
--                                                                            --
-- NPC Race: elf                        NPC Position:  898, 775, 2            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                       easyNPC Parser v1.22 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 898, 775, 2, 2, 'Elvaine Morgan', 'npc.elvaine_morgan', 0, 2, 0, 168, 165, 187, 250, 239, 237);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.trade")
require("npc.base.consequence.treasure")
require("npc.base.talk")
module("npc.elvaine_morgan", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Archmage Elvaine Morgan the ruler of Runewick. Keywords: Runewick, quest, gods, tower, magic."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Erzmagier Elvaine Morgan, der Herrscher über Runewick. Schlüsselwörter: Runewick, Quest, Götter, Türme, Magie."));
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
talkEntry:addResponse("Elara may be with you. Is something urgent?");
talkEntry:addResponse("Be greeted. What brings you here?");
talkEntry:addResponse("Greeted be. Why do you wish to see me?");
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
talkEntry:addResponse("Elara sei mit Euch. Habt ihr ein Anliegen das Ihr vortragen wollt?");
talkEntry:addResponse("Seid gegrüßt. Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Guten Tag. Wozu, wollt Ihr mit mir sprechen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Elara may be with you. Is something urgent?");
talkEntry:addResponse("Be greeted. What brings you here?");
talkEntry:addResponse("Greeted be. Why do you wish to see me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Elara sei mit Euch. Habt ihr ein Anliegen das Ihr vortragen wollt?");
talkEntry:addResponse("Seid gegrüßt. Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Guten Tag. Wozu, wollt Ihr mit mir sprechen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell. I hope you found this discussion illuminating.");
talkEntry:addResponse("Elara shall guard your path. May it be led by wisdom and reason.");
talkEntry:addResponse("See you soon. The gods have woven our destinies together, though it may be a thin thread.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt Euch wohl. Ich hoffe, Ihr befandet diese Unterhaltung für zufrieden stellend.");
talkEntry:addResponse("Elara geleite Euch auf Euren Weg. Möge er von Weisheit erleuchtet sein.");
talkEntry:addResponse("Bis bald, denn gewiss haben die Götter unsere Schicksale miteinander verwoben. - Auch wenn es nur ein geringer und kleiner Faden ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell. I hope you found this discussion illuminating.");
talkEntry:addResponse("Elara shall guard your path. May it be led by wisdom and reason.");
talkEntry:addResponse("See you soon. The gods have woven our destinies together, though it may be a thin thread.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehabt Euch wohl. Ich hoffe, Ihr befandet diese Unterhaltung für zufrieden stellend.");
talkEntry:addResponse("Elara geleite Euch auf Euren Weg. Möge er von Weisheit erleuchtet sein.");
talkEntry:addResponse("Bis bald, denn gewiss haben die Götter unsere Schicksale miteinander verwoben. - Auch wenn es nur ein geringer und kleiner Faden ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("There are plenty of things far more important than my own grievances.");
talkEntry:addResponse("I'm flattered that you care about my welfare, though there's very few problems that I can't solve.");
talkEntry:addResponse("#me glances out of the window, briefly. 'Runewick is my child and I worry about it, as all parents do.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Im Großen und Ganzen gesehen, ist Eure Frage sehr höflich aber nicht besonders wichtig.");
talkEntry:addResponse("Ich freue mich zu sehen, das ihr Euch um mein Wohlergehen sorgt. Dennoch möchte ich Euch versichern, es gibt nur wenige Probleme die ein Mann meiner Fähigkeiten nicht zu überwinden vermag.");
talkEntry:addResponse("#me breitet in einer dramatischen Geste die Arme aus. 'Runewick ist mein Kind und es bereitet mir Sorge, so wie alle Kinder ihren Eltern Sorgen bereiten.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("The tales of old speak my name, 'Elvaine Morgan', founder and leader of this town.");
talkEntry:addResponse("Elvaine Morgan. Archmage of the four towers. What do you wish to know?");
talkEntry:addResponse("I'm Elvaine Morgan, the Archmage of this town. Is there something you require?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist so alt wie die Sagen aus vergangenen Zeiten und in manchen wird er wohl auch genannt werden. 'Elvaine Morgan', Gründer und Herr dieser Stadt.");
talkEntry:addResponse("Morgan... Elvaine Morgen. Erzmagier der vier Türme von Runewick. Worüber wollt Ihr mit mir sprechen?");
talkEntry:addResponse("Ich bin Erzmagier Morgan. - Ich hoffe Euer Anliegen ist es tatsächlich Wert beredet zu werden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addTrigger("despatch");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail V: You deliver the message from Hector Valerion to Archmage Elvaine Morgan."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkEntry:addResponse("#me opens the seal of the despatch and reads it: 'Interesting, Rosaline always surprises me. I suppose I'll have to decline, though.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addTrigger("depesche");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post V: Du überbringst Erzmagier Elvaine Morgan die Nachricht von Hector Valerion."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkEntry:addResponse("#me öffnet das Siegel der Depesche und ließt sie: 'Interessant, Rosaline überrascht mich ein ums andere mal. Ich muss aber wohl ablehnen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail V: You deliver the message from Hector Valerion to Archmage Elvaine Morgan."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkEntry:addResponse("#me opens the seal of the despatch and reads it: 'Interesting, Rosaline always surprises me. I suppose I'll have to decline, though.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post V: Du überbringst Erzmagier Elvaine Morgan die Nachricht von Hector Valerion."));
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkEntry:addResponse("#me öffnet das Siegel der Depesche und ließt sie: 'Interessant, Rosaline überrascht mich ein ums andere mal. Ich muss aber wohl ablehnen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Fortunately, there's nothing I need doing for me right now, but I do require quiet for my research.");
talkEntry:addResponse("There are tasks to do, but tasks I will undertake myself.");
talkEntry:addResponse("There are many things to be done, but they're probably beyond your grasp... I have to handle them personally.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich bedaure, zur Zeit möchte ich keine meiner Aufgaben Euch anvertrauen.");
talkEntry:addResponse("Gewiss muss viel erledigt werden, aber an Euch werde ich im Moment nichts delegieren.");
talkEntry:addResponse("Selbstverständlich habe ich eine Reihe an Aufgaben zu vergeben, aber zweifellos würdet Ihr an jeder einzellnen scheitern. Also muss ich mich persönlich damit befassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Fortunately, there's nothing I need doing for me right now. But I do require quiet for my research.");
talkEntry:addResponse("There are tasks to do, but tasks I will undergo myself.");
talkEntry:addResponse("There are many things to be done, but they're probably beyond your grasp... I have to handle them personally.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich bedaure, zur Zeit möchte ich keine meiner Aufgaben Euch anvertrauen.");
talkEntry:addResponse("Gewiss muss viel erledigt werden, aber an Euch werde ich im Moment nichts delegieren.");
talkEntry:addResponse("Selbstverständlich habe ich eine Reihe an Aufgaben zu vergeben, aber zweifellos würdet Ihr an jeder einzellnen scheitern. Also muss ich mich persönlich damit befassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(1));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(1));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(2));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(2));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(13.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(3));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(13.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(3));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(4));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(4));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(17.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(5));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(17.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(5));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(7));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(7));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(34.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(34.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(51.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(45, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(51.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(45, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addResponse("#me nods and hands over an item silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(622, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(623, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addTrigger("Mordak");
talkEntry:addTrigger("Kharud");
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, {["gemLevel"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(623, "=", 1));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the Archmage. I bear the responsibility for the four towers of Runewick and their inhabitants.");
talkEntry:addResponse("It's my duty to advise Runewick with knowledge and reason, and now and again with physical acts.");
talkEntry:addResponse("I'm the Archmage, therefore I'm very busy. I advise you to ask a novice for details of my position.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Erzmagier. Also obliegt mir die Verantwortung über die Türme Runewicks und deren Wirken. Nicht mehr, aber auch nicht weniger.");
talkEntry:addResponse("Es ist meine selbst auferlegte Pflicht, Runwick mit meinem bestem Rat und der einen oder anderen Tat zur Seite zu stehen.");
talkEntry:addResponse("Ich bin der Erzmagier hier, demnach sehr sehr beschäftigt. Am Besten lasst ihr Euch das von einem Novizen erklären.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the Archmage. I bear the responsibility for the four towers of Runewick and their inhabitants.");
talkEntry:addResponse("It's my duty to advise Runewick with knowledge and reason, and now and again with physical acts.");
talkEntry:addResponse("I'm the Archmage, therefore I'm very busy. I advise you to ask a novice for details of my position.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der Erzmagier. Also obliegt mir die Verantwortung über die Türme Runewicks und deren Wirken. Nicht mehr, aber auch nicht weniger.");
talkEntry:addResponse("Es ist meine selbst auferlegte Pflicht, Runwick mit meinem bestem Rat und der einen oder anderen Tat zur Seite zu stehen.");
talkEntry:addResponse("Ich bin der Erzmagier hier, demnach sehr sehr beschäftigt. Am Besten lasst ihr Euch das von einem Novizen erklären.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Indeed, I am well aware of Gobaith's plight, but don't let's waste time dwelling on what has become.");
talkEntry:addResponse("I know about Gobaith, a tiny island far away from the mainland. I'm sure you understand now that there is a much greater world out here.");
talkEntry:addResponse("Some from Gobaith still remain, you should head to them if you want to know more about this.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("In der Tat ist mir Gobaith nicht unbekannt. Aber lasst uns keine Worte darüber verlieren, denn sie sind wohl kaum von Wert.");
talkEntry:addResponse("Natürlich weiß ich von Gobaith. Eine kleinere Inselgruppe, weit entfert vom Festland. Aber sicher versteht ihr, dass es kaum von Interesse für mich ist.");
talkEntry:addResponse("Ich ließ mir sagen es gibt Leute hier, die einst auf Gobaith lebten. Ihr solltet sie suchen und befragen, wenn ihr so bemüht seid mehr zu erfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("#me gives a stiff nod. 'Be welcome. How may I help you?'");
talkEntry:addResponse("Excellent. I already willing to introduce yourself.");
talkEntry:addResponse("#me smirks. 'I understand, I'm aware of this fact, after all I'm the archmage here.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("#me nickt etwas steif. 'Sehr erfreut. Wie kann ich Euch helfen?'");
talkEntry:addResponse("Ausgezeichnet. Ich dachte mir bereits das ihr Euch vorstellen wolltet.");
talkEntry:addResponse("#me schmunzelt. 'Das weiß ich natürlich, schließlich bin ich hier der Erzmagier.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("holy");
talkEntry:addTrigger("ancestors");
talkEntry:addTrigger("path");
talkEntry:addTrigger("seeker");
talkEntry:addResponse("The traditional belief of the elven folk - 'The Path of the Seeker'");
talkEntry:addResponse("After many years of meditation and lifespans which exceed the lives of men several times over, most elves view circumstances and events in a different light");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tower");
talkEntry:addTrigger("four");
talkEntry:addResponse("The four towers of Runewick: The tower of earth, The tower of water, The tower of fire and the tower of air. Together they form a mighty arcane structure, which towers impressively over these lands");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mage");
talkEntry:addTrigger("magic");
talkEntry:addTrigger("wizard");
talkEntry:addTrigger("theurgy");
talkEntry:addResponse("The mana stream fills the air. Many scholars pretend to feel it in the tip of their fingers.");
talkEntry:addResponse("Magic and Wizardry. Since our foundation, these have been the tools of Runewick's growth. There is a reason why the Archmage is the leader of the four towers.");
talkEntry:addResponse("Magic is isotropic throughout Runewick, as it is through the entire world. Do not touch any strange artifices, or you may not leave in the same form you entered.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor Angur");
talkEntry:addResponse("Yes, you asked around already I assume? A long while ago I moved here and laid down the first foundations of the four towers.");
talkEntry:addResponse("Indeed, a long time ago I spent my time in Lor Angur, but those times are long past and there are few reasons to invest my time thinking about them.");
talkEntry:addResponse("You are well aware that I once I lived in Lor Angur. There's not much more to say than that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("This is Runewick. Each of the four towers represents an element. Here, wisdom is the most precious good.");
talkEntry:addResponse("Runewick isn't just a town, you must understand. Runewick's name symbolises wisdom and the power of mind.");
talkEntry:addResponse("I thank Elara every day for the powerful minds she awards the citizens of the four towers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dies ist Runewick. Jeder der vier Türme steht für ein Element. Erde. Wasser. Feuer. Luft. Hier ist die Weisheit der Leute Gut.");
talkEntry:addResponse("Runewick ist nicht nur eine Stadt, müsst Ihr wissen. Runewick's Name steht für Weisheit und die Kraft des Geistes.");
talkEntry:addResponse("Ich danke Elara jeden Tag für die starke geistige Kraft die sie den Bürgern der vier Türme verleiht. Denn die Weisheit selbst ist unser höchstes Gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor Angur");
talkEntry:addResponse("Ja, ihr habt Euch wohl bereits umgehört, nicht wahr? Ich zog einst aus Lor Angur hier her und legte den Grundstein der vier Türme.");
talkEntry:addResponse("In der Tat, vor langer Zeit lebte ich in Lor Angur. Aber diese Zeit ist fern und es gibt wenig Gründe meine Zeit damit zu vertun, darüber zu sinnieren.");
talkEntry:addResponse("Einst lebte ich in Lor Angur, ihr seid gut unterichtet. Aber es liegt mir fern mich mit Euch darüber zu unterhalten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magie");
talkEntry:addTrigger("zauber");
talkEntry:addResponse("Nun, Runewick ist durchwirkt von Magie und viele Gelehrte meinen sie könnten das Prickeln in den Fingerspitzen fühlen. *zwinkert*");
talkEntry:addResponse("Magie und Zauberei, darauf hat sich Runewick seit je her besonnen. Nun schließlich leitet nicht umsonst ein Erzmagier das Geschick der vier Türme.");
talkEntry:addResponse("Magie ist hier in den Türmen Runewicks allgegenwärtig. Fasst nicht die falschen Dinge an, oder es mag sein, dass Ihr Euch eines Tages in einen Frosch verwandelt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("turm");
talkEntry:addTrigger("türme");
talkEntry:addTrigger("vier");
talkEntry:addResponse("Die vier Türme Runewicks. Der Turm der Erde. Der Turm des Wassers. Der Turm des Feuers und der Turm der Lüfte. Gemeinsam bilden sie eine mächtige arkane Struktur und sind außerdem auch noch sehr hübsch anzusehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heilig");
talkEntry:addTrigger("Urahnen");
talkEntry:addTrigger("suchenden");
talkEntry:addTrigger("pfad");
talkEntry:addResponse("Der traditionelle Glaube der Elfengemeinschaft. - Der Pfad der Suchenden.");
talkEntry:addResponse("Durch meditationsbedingter geistiger Klarheit und einem Leben das über viele Lebensspannen der Menschen hinaus geht sehen wir Elfen die Dinge und Geschehnisse oft aus einer anderen Sichtweiße.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I won't pretend to be overly fond of the man, but each to his own.");
talkEntry:addResponse("It wouldn't be very diplomatic of me to talk about a leader of a faction behind their back.");
talkEntry:addResponse("He's.. an interesting character, but it's not of any real importance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Es macht keinen Sinn vorzugeben ich hätte keine Differenzen mit Valerio, aber näheres geht Euch jetzt wirklich nicht's an.");
talkEntry:addResponse("Nun... ich denke, wenn ihr von diesen Dingen wissen solltet wüsstet Ihr es bereits. Also bin ich nicht bereit Auskünfte hierüber zu verteilen.");
talkEntry:addResponse("Sicherlich seid Ihr Euch im klaren darüber, dass meine Meinung über Don Guilianni eine Sache ist, die ausschließlich mich und Don Guilianni selbst betrifft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("They possess some important resources, but I fear their metal and coal reserves simply feed their egos. Once the resources are gone, they will be left with nothing.");
talkEntry:addResponse("A city based on greed cannot sustain itself. If every man is trying to manipulate and scam each other for money, they will lose everything they have.");
talkEntry:addResponse("I would never typecast a whole town as fools, but when your plans are entirely based on greed, you're always rather predictable.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Das Metall und die Kohlen in den Böden Galmairs nähren die Habgier seiner Bürger. Doch wenn die Minen erschöpft sind wird man erkennen müssen, dass Weisheit das einzige erstrebenswerte Gut ist.");
talkEntry:addResponse("Galmair trachtet seit jäh her nach Wohlstand und Reichtum. Vernunft und Gemäßigtheit sind ihnen fremd. Zügellosigkeit und gierige Entscheidungen werden diese Stadt einmal zu Grunde richten.");
talkEntry:addResponse("Ich halte die Bürger Galmairs keinesweges für besinnungloße Leichtgeistige. Doch ihre Ziele und Pläne die stehts von Gier dominiert werden, sind nur wenig undurchschaubar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Queen Rosaline is exactly what it says on the tin. I was never entirely convinced that the right to lead should be determined by blood, and not personal competence.");
talkEntry:addResponse("The short lifespan of mankind limits their existence, but sometimes I have to admit, they impress me with how much they can achieve.");
talkEntry:addResponse("Well, I have observed all of Rosaline's lineage. I thought that choosing leaders based on blood would be a foolish option, but I must admit, it's worked very well for their family.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Königin Rosaline, nun sie ist... eine Sphinx ohne Geheimnisse. Dabei ist es erstaunlich wie wenig diese Blutslinie aus den Fehlern ihrer Vorfahren gelernt hat.");
talkEntry:addResponse("Die kurzlebigkeit der Menschen mag ihre Welt beschränken. Allerdings finde ich es doch immer wieder erstaunlich wozu sie denoch fähig sind.");
talkEntry:addResponse("Nun, ich errinere mich noch gut an Rosalines Großvater. Ein bemerkenswerter Mensch in mancherlei Hinsicht. So wie sein Sohn. Und nun, soll sich zeigen ob dessen Tochter ein ähnliches Schicksal erwartet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Queen Rosaline is exactly what it says on the tin. I was never entirely convinced that the right to lead should be determined by blood, and not personal competence.");
talkEntry:addResponse("The short lifespan of mankind limits their existence, but sometimes I have to admit, they impress me with how much they can achieve.");
talkEntry:addResponse("Well, I have observed all of Rosaline's lineage. I thought that choosing leaders based on blood would be a foolish option, but I must admit, it's worked very well for their family.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Königin Rosaline, nun sie ist... eine Sphinx ohne Geheimnisse. Dabei ist es erstaunlich wie wenig diese Blutslinie aus den Fehlern ihrer Vorfahren gelernt hat.");
talkEntry:addResponse("Die kurzlebigkeit der Menschen mag ihre Welt beschränken. Allerdings finde ich es doch immer wieder erstaunlich wozu sie denoch fähig sind.");
talkEntry:addResponse("Nun, ich errinere mich noch gut an Rosalines Großvater. Ein bemerkenswerter Mensch in mancherlei Hinsicht. So wie sein Sohn. Und nun, soll sich zeigen ob dessen Tochter ein ähnliches Schicksal erwartet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Honour is nice, but occasionally having a very firm moral code based on honour can have extremely negative consequences, if your enemies are willing to exploit it.");
talkEntry:addResponse("Cadomyr's code of honour makes their actions extremely predictable. Even someone of basic intellect will figure out their plans nine times out of ten.");
talkEntry:addResponse("Cadomyr may possess strong men, but these people are brainwashed into thinking that courage is the most important quality, and that makes them extremely dangerous. A man who values some code more than his own life is a force to be reckoned with.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Wenn ein Feind um jemandens ehrenhaften Kodex weiß, mag sich das für den dem die Ehre ein göttliches Gut ist, eventuell als gefährliches Hindernis erweisen.");
talkEntry:addResponse("Cadomyrs Kodex der Ehre, macht es langsam und träge - vorhersehbar. Stets, könnte ein kluger Mann die Pläne der Stadt ersinnen. Veränderung ereignen sich nur langsam, wenn sie nicht so und so versickern.");
talkEntry:addResponse("Cadomyr mag standhafte Streiter haben. Doch viel zu nah liegt der Unterschied zwischen Tapferkeit und Torheit. Der Adel Cadomyrs spaltet sich an der Weiblichkeit von Rosaline Edwards und Uneinigkeit schwächt die Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar's principles have been the polar opposite of mine since I was a child, and especially so when I was mage of Lor Angur.");
talkEntry:addResponse("Everything that Runewick was founded on is of little importance in Albar.");
talkEntry:addResponse("The nobility in Albar govern against their own people. The current king appears less strict than previous monarchs, but even I can't sense his true motives.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar stand seit jeher gegen mich und meine Überzeugungen. Schon damals, als ich noch ein Magier Lor Angurs war.");
talkEntry:addResponse("Alles woran ich Glaube und all meine Überzeugungen scheinen in Albar mit Füßen getreten zu werden. Denkt Ihr nicht?");
talkEntry:addResponse("Albar regiert gegen sein eigenes Volk. Nun der jetzige Hochkönig scheint weniger strikt zu sein, aber Menschen sind Wankelmütig und nichteinmal ich vermag zu sagen wie er sich entscheiden mag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("The people of Gynk differ to us in many views. When you're run by councils and the like, it's difficult to pass a definitive law or decision. This just confirms my belief that a shared government would be at a disadvantage.");
talkEntry:addResponse("At first glance Gynk seems chaotic. If you observe it better, it simply appears complex. But it's so complex that all the factors don't mean anything tangible to a person.");
talkEntry:addResponse("The instinct driven mindset which dominates Gynk is foolhardy as far as I'm concerned.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Über ein heterogenes Volk jenem aus Gynks ist es schwer eine pregnante Aussage zu machen. Doch gerade aus diesem Grund bin ich der Meinung das in Gynk eine organisiertere Regierung nicht von Nachteil währe.");
talkEntry:addResponse("Auf Ersten Blick mag einem Gynk als chaotisches Unsystem erscheinen. Näher betrachtet - komplex. Ausführlich studiert - als ein sich slebst frei entwickelndes und unreguliertes System.");
talkEntry:addResponse("Die Unvernunft und Triebhaftigkeit welche in Gynk überwiegend vorherrscht, ist mir zu wider. Unaustehlich ist mir der Gedanke, dort zu leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar is one of the more enlightened realms of men. With that in mind, it won't surprise you to know that they have links with Runewick.");
talkEntry:addResponse("The beliefs of the Salkamaerian Empire have correlated well with mine for centuries.");
talkEntry:addResponse("Should you ever visit Salkamar, I advise you to visit the library. It's an incredible piece of architecture, and holds extremely rare and precious books and scriptures. You would be foolish to overlook the wisdom you can learn there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Beinahe will ich so weit gehen und Salkamar als das erleuchtete Reich der Menschen zu bezeichnen. Es dürfte Euch nicht überraschen das Runewick einige Beziehungen zu jenen Landen pflegt.");
talkEntry:addResponse("Der Lichtblick unter den Reichen der Menschen. Die Werte Salkamars spiegeln zu vielen Teilen jene wieder die ich mir seit vielen Jarhunderten zu eigen gemacht habe.");
talkEntry:addResponse("Habt ihr die Möglichkeit eines Tages in die Stadt Salkamar selbst zu reisen, besucht die hießige Bibliothek. Sie ist weltbekannt und beherbergt ungezählte Schränke mit wertvollen Büchern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blood God");
talkEntry:addResponse("All the Blood God knows is influenced by violence and pain. He is mighty, but his actions are not responsible.");
talkEntry:addResponse("He is the 'Blood God' of many barbaric orcish war tribes, who take living sacrifices. His altars are often drenched in blood. His followers are malicious, but low in number.");
talkEntry:addResponse("The Blood God shows some hidden wisdom and dark humour. I can appreciate his intellect, but our views do not align.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blutgott");
talkEntry:addResponse("Die Weltordnung des Blutgottes ist geprägt von Gewalt und Schmerz. Er ist gewalttätig, mächtig, blutrüstig und kriegsliebend.");
talkEntry:addResponse("Er ist der 'Blutgott' vieler wilder, blutrünstiger Orkkriegsstämme, die ihm zu Ehren Sterbliche opfern. Diese Altare sind blutgetränkte Zeugnisse seines Charakters und seine Anhänger sind abgrundtief böse Kreaturen.");
talkEntry:addResponse("Der Blutgott verfügt über ungeahntes, verborgenes Wissen und hat eine eigene, sehr rauhe Art von Humor. Wenn Ihr geneigt seid das Humor zu nennen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("The gods who watch over the four towers are easy to guess. Elara gives us wisdom, and many are blessed at Sirani's altars. Naturally, many halfings prefer Oldra.");
talkEntry:addResponse("The Younger Gods are worshiped, but generally not as deities. Elves often dub them the 'holy ancestors'.");
talkEntry:addResponse("Overall, the 'Path of the Seeker' seems to be comprised of tolerance, self awareness, balance, meditation, and personal spirituality.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Götter der vier Türme lassen sich schnell benennen. Elara schenkt uns stets Weisheit und so mancher findet Erleuchtung bei Siranis Altaren. Aber natürlich geben viele Halblinge Oldra den Vorzug.");
talkEntry:addResponse("Vielleicht werdet Ihr bemerken das die Älteren unter uns Elfen die jungen Götter nicht als solche bezeichnen. Viel eher sind sie unsereins Heilige Urahnen.");
talkEntry:addResponse("Der Pfad der Suchenden ist ein Weg der Meditation, Spiritualität, geistiger Klarheit und Geduld.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron is the house god of almost every tavern and inn. Young people especially hand their lives over to him. Older people drink in moderation.");
talkEntry:addResponse("Many young folk enjoy Adron's way of living, as well as some bards, but most of them alter their views when they become older.");
talkEntry:addResponse("Is the truth found in wine? Regret both fuels and is fuelled by heavy drinking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron, fast schon die Hausgottheit aller Tavernen und Gaststätten. Vor allem junge Leute lassen sich von seiner Art begeistern.");
talkEntry:addResponse("Viele junge Leute begeistern sich für Adron und auch einige Barden. Aber viele ändern ihre Meinung und ihren Glauben als Erwachsene.");
talkEntry:addResponse("Nun fragt euch selbst, liegt im Wein die Warheit?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("They say Brágon was the first god to leave Illarion. Now, though, from time to time he still visits us and walks unknown in the guise of a mortal.");
talkEntry:addResponse("Brágon is the God of fire. Some dwarves and orcs dedicate their lives to honour him. They try to become as strong and passionate as the god himself.");
talkEntry:addResponse("when Brágon left Illarion he gave Malachín the power over his former worshippers, but these followers still passed on the teachings of Brágon, so his followers still remain.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Man sagt Brágon sei der erste der Götter gewesen die Illarion verlassen haben. Aber von zeit zu Zeit soll er dennoch unerkannt unter den Sterblichen wandeln.");
talkEntry:addResponse("Brágon ist der Gott des Feuers. Manche Zwerge und Orks richten ihr Leben ihm zur Ehre. Dabei versuchen sie ihrem Gott in Stärke und Weisheit nach zu eifern.");
talkEntry:addResponse("Als Brágon Illarion verlies übergab er Malachín die Macht über seine Anhänger. Aber das ist mehr als drei Lebensspannen her und nun möget ihr sodar es Euch bestimmt ist, wieder auf Anhänger Brágons begegnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addTrigger("Cheerga");
talkEntry:addResponse("Once her name was written with two 'e's, but time moves on and Illarion changes. She is the goddess of spirits and the realm of the afterlife.");
talkEntry:addResponse("There are not many followers of Cherga. Cherga is the one who collects the dead, and brings them to the realms they belong to. No mortal can truly understand or relate to this.");
talkEntry:addResponse("Some people pray to Cherga to give eternal rest to the restless, others to use the undead for a purpose.");
talkEntry:addResponse("Many necromancers are followers of Cherga, but this is scorned upon in Runewick. Our dead should stay dead, and respected, so we cremate our mages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addTrigger("Cheerga");
talkEntry:addResponse("Einst schrieb man ihren Namen 'Cheerga', doch die Zeit vergeht und Illarion wandelt sich. Sie ist die Göttin der Nachwelten und Toten.");
talkEntry:addResponse("Cherga hat nicht viele Anhänger. Sie ist jene, welche die Toten begleitet und in ihre vorbestimmten Reiche führt. Manche beten zu ihr, um den ruhelosen Geistern den ewigen Frieden zu bringen.");
talkEntry:addResponse("Viele Nekromanten sind Chergas Anhänger und auch einige Wahrsager. Cherga selbst kümmert es nicht, was die Sterblichen mit dem von ihr verliehenen Wissen anfangen, doch ihr Beistand hat einen hohen Preis...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara is the Goddess of wisdom and knowledge. Many scholars inside of the four towers pray to her to for intellect and knowledge.");
talkEntry:addResponse("The three big questions: The reason for greed, the reason for violence, and the reason for suffering. Most followers who claim to have come close to a suitable answer, have become very peaceful, righteous people.");
talkEntry:addResponse("We, the worshippers of Elara, believe in the power of wisdom and that all actions have a reason. The Goddess helps us with ideas and grants us better understanding.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara ist die Göttin des Wissens und der Weisheit. Viele der Scholare innerhalb der vier Türme beten zu ihr um zu lernen und um Wissen zu erlangen.");
talkEntry:addResponse("Die drei großen Fragen: Den Grund für die Gier, den Grund für Gewalt und den Grund für das Leiden. Es heißt Gelehrte die der Antwort nahe kommen sind sehr friedvolle, rechtsschaffende und nachdenkliche Personen.");
talkEntry:addResponse("Wir Anhänger Elaras glauben an die Macht der Weisheit. Alles folgt einem großen Plan und die Göttin hilft uns all dies zu verstehen und zu lernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan has never been active amongst mortals. Very few people pray to him. Since he was never heard or seen in public, nobody knows how to identify him");
talkEntry:addResponse("Eldan is one of the five Elder Gods. Not much is known about their origin, and they seldom let others know something about their past. They left Illarion for a long time, but recently returned.");
talkEntry:addResponse("People who follow him are often hermits, or people who love a good drink and a long philosophical discussion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan ist der Gott des Geistes. Seine Anhänger sind meist Einsiedler oder Leute, die nicht nein zu einem Schluck Wein und einem langen, philosophischen Gespräch sagen.");
talkEntry:addResponse("Eldan einer der fünf 'älteren' Götter. Nur wenig ist über deren Ursprung in Erfahrung zu bringen. Sie selbst erzählen nur wenig und die meißten haben Illarion verlassen. Niemand mag sagen an welchen Tagen sie dennoch hier wandern.");
talkEntry:addResponse("Eldan hat sich nie persönlich um die Sterblichen gekümmert und nur wenige beten zu ihm. Alle behaupten, ihn schon einmal persönlich getroffenen zu haben, doch in Wirklichkeit haben sie sich einer Illusion hingegeben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari's believers were always few and far apart, since she never cared for temples and worship.");
talkEntry:addResponse("It is said that she still chooses some rare followers by herself, who then become visionaries or wandering prophets, or even great bards and artists.");
talkEntry:addResponse("Findari is one of the five Elder Gods. Not much is known about their origin, and they seldom let others know something about their past. They left Illarion for a long time, but recently returned.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findaris Anhänger waren immer wenige, da sie nicht viel Wert auf Tempel oder die Anbetung legt.");
talkEntry:addResponse("Ich ließ mir sagen manche Wahrsager und wandernde Prophetendie es zu Bekanntschaft brachten wurden von Findari ausgewählt.");
talkEntry:addResponse("Findari eine der fünf 'älteren' Göttheiten. Nur wenig ist über deren Ursprung in Erfahrung zu bringen. Sie selbst erzählen nur wenig und die meißten haben Illarion verlassen. Niemand mag sagen an welchen Tagen sie dennoch hier wandern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("Irmorom is the God of craftsmanship. Talkative, good natured and sociable like many men of these guilds.");
talkEntry:addResponse("Not only do dwarves pray to Irmorom, but also businessmen and crafters. They try to gather wealth, in life as well as in the afterlife.");
talkEntry:addResponse("You can find a temple of Irmorom, hollowed out of the mountain behind the gates of Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom ist der Gott des Handwerks und des Handels. Sehr gesprächig und gesellig, so wie die Mannen dieser Zünfte.");
talkEntry:addResponse("Nicht nur Zwerge beten zu ihm. Händler, Handwerker im selben Maße. Doch strebt man stehts nach materiellen Wohlstand. - Im Leben wie dannach.");
talkEntry:addResponse("Mit Sicherheit werdet ihr hinter Galmairs Toren, eingeschlagen in den Berg einen Tempel Irmoroms finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín is the God of battle and hunting, so people try to pray to him for a successful hunt.");
talkEntry:addResponse("Malachín the patron of warriors and mercenaries. Often they hear Malachín howling in form of a big black wolf, before a heavy battle starts. ");
talkEntry:addResponse("Many follow the honourable Malachín. Soldiers and knights pray to him. Paladins and clergyman join crusaders against demonic minions of the Blood God, in his name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachín ist der Gott der Jagd. Und das Volk bittet ihn stets um Erfolg bei der Jagd.");
talkEntry:addResponse("Der Schutzpatron der Krieger und Söldner. Oftmals hört man einen von ihnen Malachín als den Schwarzen Wolf rufen, bevor ein schwerer Kampf ausbricht.");
talkEntry:addResponse("Viele folgen dem ehrenwerten Malachín, Soldaten und Ritter beten zu ihm. Paladine und Kriegskleriker ziehen in seinen Namen aus um die dämonische Brut des Ungesagten zu bekämpfen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("All the Blood God knows is influenced by violence and pain. He is mighty, but his actions are not responsible.");
talkEntry:addResponse("He is the 'Blood God' of many barbaric orcish war tribes, who take living sacrifices. His altars are often drenched in blood. His followers are malicious, but low in number.");
talkEntry:addResponse("The Blood God shows some hidden wisdom and dark humour. I can appreciate his intellect, but our views do not align.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Die Weltordnung des Blutgottes ist geprägt von Gewalt und Schmerz. Er ist gewalttätig, mächtig, blutrüstig und kriegsliebend.");
talkEntry:addResponse("Er ist der 'Blutgott' vieler wilder, blutrünstiger Orkkriegsstämme, die ihm zu Ehren Sterbliche opfern. Diese Altare sind blutgetränkte Zeugnisse seines Charakters und seine Anhänger sind abgrundtief böse Kreaturen.");
talkEntry:addResponse("Der Blutgott verfügt über ungeahntes, verborgenes Wissen und hat eine eigene, sehr rauhe Art von Humor. Wenn Ihr geneigt seid das Humor zu nennen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Nargùn likes to play mean tricks on people. He enjoys dark humour. By his hand, anything can happen, good or bad.");
talkEntry:addResponse("Strange and astounding tricks, whether malicious or benevolent are Nargùn's elements. Sometimes he helps people, sometimes he destroys them, but he always makes a big show of it.");
talkEntry:addResponse("Many gamblers pray to Nargùn, and some people claim to be chaos priests. Most of these people are just deluded.");
talkEntry:addResponse("The beliefs of Nargùn's followers are totally varying. One prophet wrote the famous, 'Very Sacred Book of MOO'. I'm sure you can imagine what it contains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Intrigen, gemeine oder vermeintlich lustige Tricks sind Nargùns Metier. Manchmal ist er hilfsbereit, manchmal zerstörerisch, stets aber verursacht sein Verhalten großes Aufsehen.");
talkEntry:addResponse("Verrückte Propheten und Einsiedler, oder brabbelnde Idioten... dies sind diejenigen die Nargùn folgen. Glückspieler... Verrückte - und so weiter.");
talkEntry:addResponse("Die Glaubensansichten von Nargùns Anhängern sind völlig uneinheitlich und verworren. Aber anders wäre es dem Gott des Chaos wohl nicht recht zu machen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("For the growing of grain and food, and for healthy childbirth, many halflings pray to Oldra, the Goddess of life and fertility.");
talkEntry:addResponse("Oldra dislikes greed and selfishness. Rather she prefers a good meal, beautiful gardens and the company of animals.");
talkEntry:addResponse("Oldra is the motherly figure of the Eleven. Her advice is wise and helpful and she protects all kind of living beings.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Für eine gute Ernte oder für den Segen eines Neugeborenen. - Viele Halblinge beten zu Oldra, der Göttin der Fruchtbarkeit und des Lebens.");
talkEntry:addResponse("Oldra verabscheut gierige und selbstsüchtige Leute. Viel mehr schätzt sie gutes Essen, liebt Gärten und Haustiere. Da wundert es nicht das viele Halblinge zu ihr beten.");
talkEntry:addResponse("Oldra - eine eher mütterliche Gottheit. Und sehr weise. Alle Arten des Lebens liegen ihr am Herzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan, the patron of all those who live in the shadows. Thieves, beggars and harlots pray to him.");
talkEntry:addResponse("I know merchants who pray, and donate money to Ronagan to avoid being robbed.");
talkEntry:addResponse("Although Ronagan plays jokes on those in a position of authority, he dislikes betrayal between accomplices much more than any kind of authority.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan ist der Schutzpatron all jener die im Schatten der menschlichen Gesellschaften leben. Diebe, Bettler, Dirnen... Landstreicher.");
talkEntry:addResponse("Ich kenne Händler die beten und opfern Ronagan Geld, um zu verhindern das sie ausgeraubt werden.");
talkEntry:addResponse("Auch wenn Ronagan so manche Obrikeit zum Narren hält, verabscheut er doch Vertrauensbruch oder Verrat im selben Maße wie staatliche Autoritäten und Gesetze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Several young women pray to Sirani, asking for love or to pay attention to their loved ones.");
talkEntry:addResponse("Most Sirani priests are good healers. Her followers believe in peace and harmony, and most of them oppose weapons and violence. ");
talkEntry:addResponse("In the Sirani temples, poor people are healed and given food, a place to sleep, and work if they can. Some of those become Sirani priests as well, after they are stable.");
talkEntry:addResponse("Sirani dislikes rough or very selfish people. Strong insults can make her furious when someone uses it to demean her followers or herself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Oh, viele junge Frauen beten zu Sirani. Der Liebe wegen. - Und wegen anderer junger Männer, versteht sich.");
talkEntry:addResponse("Die meisten Priester Siranis sind gute Heiler und glauben wie alle Ihre Anhänger an ein Leben in Friede und Harmonie. In den Tempeln der Göttin findet man stets Obdach.");
talkEntry:addResponse("Sirani mag rauschende Feste, Liebe, Spaß und das Leben selbst. Sie hasst die Missachtung von Frauen und kann sehr aufbrausend und wütend werden, wenn ihnen nicht die nötige Wertschätzung zuteil wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora was the only Elder God who remained active throughout Illarion. Her religion dominates the lizard society. Many of her temples lie under water, and most are located at the centre of the lizardmen's under water towns.");
talkEntry:addResponse("Some strange legends say that when the Elder Gods left, Tanora gave her believers to Zelphia. This is nonsense, Tanora and Zelphia are one and the same, she herself has assured this to many mortals.");
talkEntry:addResponse("Most of her believers are lizards, sailors, or even elves. Many healers pray to her as well. Her followers believe that she is a very powerful and righteous goddess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora mag die unberührte Schönheit der Natur, deshalb ist sie auch die einzige der ältern Götter, welche nicht selten auf Illarion umherwandert.");
talkEntry:addResponse("Die Gesellschaft der Echsenmenschen wird sehr stark von den glauben an Tenora geprägt. Allerdings nennen sie Tanora, Zelphia.");
talkEntry:addResponse("Echsenmenschen, Fischer, Heiler, Seeleute. Das sind die Anhänger Tanoras, der Göttin des Wassers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara's believers are very few. Most are old female druids, or elves who met her personally. At the departure of the Elder Gods, she put Oldra in charge, but now she has returned.");
talkEntry:addResponse("Ushara is one of the five Elder Gods. Not much is known about their origin, and they seldom let others know anything about their past. They left Illarion for a long time, but recently returned.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Als Ushara Illarion verließ, ernannte sie Oldra zu ihrer Verteterin und so wird sie nun an Ihrer statt in neuen Tempeln verehrt.");
talkEntry:addResponse("Ushara, die Mutter - die Erde, auf der die vier Türme Runewicks erbaut wurde. Wie mir selbst ist ihr die Vergänglichkeit der Dinge besonders bewusst.");
talkEntry:addResponse("Ushara hat besonders wenige Anhänger, die meisten sind weibliche alte Druiden oder Elfen. Und einige wenige von ihnen scheinen Ushara persönlich begegnet zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Friendship and loyalty are the most precious traits of Zhambra the 'Brother God'. He would never tolerate 'dirty' behaviour. He rewards loyalty and honour.");
talkEntry:addResponse("The followers of Zhambra are righteous and loyal, believing in honour and law. There should be a temple located in Cadomyr.");
talkEntry:addResponse("Zhambra is worshipped by nobles and knights, paladins, and many soldiers in Cadomyr. During battle, friendship is a precious resource.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra der Brudergott. Freundschaft und Treue sind ihm das höchste Gut. Die Ehre eines Mannes ist ihm teuer, niemals würde er hinterlistige Tricks gut heißen.");
talkEntry:addResponse("Der Gott der Freundschaft und Treue - Zhambra. Mit sicherheit findet ihr einen seiner Tempel in Cadomyr.");
talkEntry:addResponse("Zhambras Anhänger sind eher, nun - geradlinig. Ritter, Höflinge und Krieger. In der Schlacht ist die Freundschaft der Mitstreiter eine ungleich wertvolle Kraftquelle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I'm a leader, not ar.");
talkEntry:addResponse("I care more about theory and experiments than exchanging objects.");
talkEntry:addResponse("The market is located next to the entrance portals to the town. It should be impossible to miss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Bitte verzeiht, aber ich handle nicht mit Euch.");
talkEntry:addResponse("Eines Erzmagiers Geschäfte sind, nun ja - Geschäfte die nur für den Erzmagier von Revelanz sind.");
talkEntry:addResponse("Der Marktplatz befindet sich gleich vor den Portalen zur Stadt. Es sollte unmöglich sein daran vorbei zu laufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Magic is gone from these lands, but one day it will return.");
talkEntry:addResponse("Only a fool ignores the hypothetical and uses only what they already know.");
talkEntry:addResponse("I could tell you many things. The problem is whether you'd understand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Die Zeichen, die ich bemerkte sind eindeutig und schon bald werden sie auch weithin zu sehen sein.");
talkEntry:addResponse("Nur der Narr ignoriert die unwahrscheinlichsten Möglichkeiten und versteift sich auf das was offensichtlich ist.");
talkEntry:addResponse("An manchen Tagen denke ich... - Könnten die Leute Regenbögen in Zoos stecken, sie würden's glatt tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("You want a word?");
talkEntry:addResponse("You desire to speak?");
talkEntry:addResponse("Please make it short.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Auf ein Wort?");
talkEntry:addResponse("Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Bitte fasst Euch kurz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("You want a word?");
talkEntry:addResponse("You desire to speak?");
talkEntry:addResponse("Please make it short.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Auf ein Wort?");
talkEntry:addResponse("Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Bitte fasst Euch kurz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me gives a gentle, but serious nod.");
talkEntry:addResponse("Good. Are we done?");
talkEntry:addResponse("May Elara's wisdom enlighten you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt sanft aber bestimmt.");
talkEntry:addResponse("War das alles?");
talkEntry:addResponse("Elaras Weisheit möge Euch erleuchten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me smiles slightly and remains silent.");
talkEntry:addResponse("Often, when someone thinks they want something, it is not something they require.");
talkEntry:addResponse("Why not?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me lächelt ein wenig und schweigt.");
talkEntry:addResponse("Jene Dinge von denen einer glauben mag, er wolle sie, sind oft nicht die die einer braucht.");
talkEntry:addResponse("Warum nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("And why do you think that?");
talkEntry:addResponse("I see.");
talkEntry:addResponse("If you prefer to put it like that.");
talkEntry:addResponse("Virtue needs some cheaper thrills.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Weshalb? Was ist der Grund dafür?");
talkEntry:addResponse("Ich verstehe.");
talkEntry:addResponse("Wenn Ihr das auf diese Art ausdrücken wollt...");
talkEntry:addResponse("Tugend bedarf einiger billigerer Vergnügen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#mes leuchtend graue Augen mustern achtsam die Umgebung.", "#me's gloomy grey eyes glance across the surrounding area carefully.");
talkingNPC:addCycleText("#me atmet langsam und leise aus, für einen Moment scheint er einem Gedanken nachzuhängen.", "#me breathes slowly and quietly as he appears to reflect upon a theory, concerning a difficult topic.");
talkingNPC:addCycleText("#me streicht mit den Fingern über die Seiten seines Buches.", "#me moves his fingers over the pages of his book.");
talkingNPC:addCycleText("#mes Augen überfliegen einige Zeilen des Textes innerhalb seines Buches.", "#me's eyes dart quicky over something written in his book.");
talkingNPC:addCycleText("#me fährt mit der Fingerspitze an eine bestimmte Stelle der Buchseiten und schlägt diese auf.", "#me places his fingertip at a precise page in his book and turns right to it.");
talkingNPC:addCycleText("#me nickt sachte. Dann wirft er einen Blick zur Seite.", "#me glances out of the window, observing the sky for a few moments.");
talkingNPC:addCycleText("#me greift sich kruz an den Kopf und seine Stirn legt sich in sanften Falten.", "#me runs his hand over his fringe, adjusting his hair from his line of sight.");
talkingNPC:addCycleText("#me reibt sich mit dem Zeigefigner an der Nase. Im nächsten Moment schnippst er mit den Fingern und ruft 'Ich habs!'.", "#me rubs his nose with his fingers, before clicking his fingers excitedly, proclaiming 'Got it!'.");
talkingNPC:addCycleText("#mes graue Augen scheinen für einen Moment hell auf zu leuchten.", "#me's grey eyes seems to be more gloomy than usual for a couple of seconds.");
talkingNPC:addCycleText("#mes lächelt gutmütig und für einen Augenblick ist ein merkwürdiges Glitzern in seinen Pupillen zu sehen.", "#me smiles contently. For a brief a moment a shiny sparkle appears in his eyes.");
talkingNPC:addCycleText("#me dreht seinen Kopf ein wenig und für kurze Zeit scheinen seine Gedanken in der Ferne zu verweilen.", "#me turns his head. For a short while, his thoughts seem distant.");
talkingNPC:addCycleText("#me murmelt leise. 'Das Problem mit der Zukunft ist, dass sie zur Gegenwart wird...'", "#me mumbles quietly. 'The problem with the future is that it keeps turning into the present.'");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein galanter Elf, mit langem geflochtenen Haar und leuchtenden grauen Augen. Ihn umgibt eine Aura von Klarheit und Einsicht die jedem in seiner Nähe mit zu reißen scheint.  Sein Gesicht wirkt gelassen und gewandt erscheinen seine Bewegungen.", "A proud elf adorned in the finest clothing. By his side, he carries a gem encrusted wand, and expensive rings adorn his fingers. His sophisticated mannerisms evince his intelligence.");
mainNPC:setUseMessage("Macht Euch doch keine Mühe, ihr verletzt Euch noch selbst.", "It would be wise to keep your hands off me.");
mainNPC:setConfusedMessage("#me schaut dich ausdruckslos an. 'Wie bitte?'", "#me glances motionlessly. 'Excuse me?'");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 807);
mainNPC:setEquipment(11, 558);
mainNPC:setEquipment(5, 209);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 823);
mainNPC:setEquipment(10, 53);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END