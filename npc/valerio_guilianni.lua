--------------------------------------------------------------------------------
-- NPC Name: Valerio Guilianni                                        Galmair --
-- NPC Job:  Don                                                              --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  337, 215, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Faladron                                                         --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 337, 215, 0, 4, 'Valerio Guilianni', 'npc.valerio_guilianni', 0, 1, 1, 180, 180, 180, 210, 162, 120);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.treasure")
require("npc.base.talk")
module("npc.valerio_guilianni", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Don Valerio Guilianni of Galmair. Keyphrases: quest, task, gods, or faction."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Don Valerio Guilianni von Galmair. Schlüsselwörter: Quest, Aufgabe, Götter, Fraktionen."));
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
talkEntry:addResponse("The Don greets you.");
talkEntry:addResponse("Greetings, greetings. The Don is busy right now but he always has an open ear for the pleas of his protégés.");
talkEntry:addResponse("Hm? State your cause to the Don but make it brief or one of my associates might have to cut you off.");
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
talkEntry:addResponse("Der Don grüßt euch. Ihr seid also gekommen um euch um euer Schicksal zu kümmern?");
talkEntry:addResponse("Grüße, Grüße. Der Don ist zwar beschäftigt aber für die Anliegen seiner Schützlinge hat er immer ein offenes Ohr.");
talkEntry:addResponse("Hm? Tragt eure Sache dem Don vor aber fasst es kurz oder ich mache euch ein Angebot, das ihr nicht ablehnen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Don greets you. Now tell me what you can do for me.");
talkEntry:addResponse("Greetings, greetings. The Don is busy right now but he always has an open ear for the pleas of his protégés.");
talkEntry:addResponse(" Hm? State your cause to the Don but make it brief or one of my associates might have to cut you off.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Der Don grüßt euch. Ihr seid also gekommen um euch um euer Schicksal zu kümmern?");
talkEntry:addResponse("Grüße, Grüße. Der Don ist zwar beschäftigt aber für die Anliegen seiner Schützlinge hat er immer ein offenes Ohr.");
talkEntry:addResponse("Hm? Tragt eure Sache dem Don vor aber fasst es kurz oder ich mache euch ein Angebot, das ihr nicht ablehnen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("#me rubs his chin looking contemplative, 'Eh, you may leave. Probably not worth it to send someone to keep an eye on ya.'");
talkEntry:addResponse("May Ronagan keep ya safe in the shadows but not too safe, and be sure to give my regards to the family!");
talkEntry:addResponse("#me gives a brief nod and then turns away, 'Hm, an interesting person, gonna get good one day, maybe too good. Hope I don't have to send Miggs to keep an eye on him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("#me fährt sich nachdenklich übers Kinn 'Eh, ihr könnt gehen. Wohl nicht wert euch im Auge behalten zu lassen.'");
talkEntry:addResponse("Ronagan breite seinen schützenden Mantel über euch aus. Und Grüße an die Familie!");
talkEntry:addResponse("#me nickt nur knapp und wendet sich dann ab 'Hm. Eine interessante Person, könnte es weit bringen, zu weit. Miggs soll ihn beschatten lassen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me rubs his chin looking contemplative, 'Eh, you may leave. Probably not worth it to send someone to keep an eye on ya.'");
talkEntry:addResponse("May Ronagan keep ya safe in the shadows but not too safe, and be sure to give my regards to the family!");
talkEntry:addResponse("#me gives a brief nod and then turns away, 'Hm, an interesting person, gonna get good one day, maybe too good. Hope I don't have to send Miggs to keep an eye on him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("#me fährt sich nachdenklich übers Kinn 'Eh, ihr könnt gehen. Wohl nicht wert euch im Auge behalten zu lassen.'");
talkEntry:addResponse("Ronagan breite seinen schützenden Mantel über euch aus. Und Grüße an die Familie!");
talkEntry:addResponse("#me nickt nur knapp und wendet sich dann ab 'Hm. Eine interessante Person, könnte es weit bringen, zu weit. Miggs soll ihn beschatten lassen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Excellent. But that's of no concern right now. Tell me, %CHARNAME, what can the Don do for you?");
talkEntry:addResponse("#me waves dismissively 'Oh still a little shaken from the weekly assassination attempt.'");
talkEntry:addResponse("How? One could say: Like the leader of a pack of wolves that has to guard his position at all times.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ausgezeichnet. Aber das tut nichts zur Sache. Sagt was kann der Don für euch tun, %CHARNAME?");
talkEntry:addResponse("#me winkt ab 'Oh noch etwas aufgeregt vom allwöchentlichen Anschlag auf mein Leben.'");
talkEntry:addResponse("Wie? Ein treffender Vergleich wäre dies: Wie der einsame Leitwolf, der seine Stellung im Rudel verteidigen muss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("#me makes a broad welcoming gesture with his hands. 'Ah forgive my manners. Valerio Guilianni is my name but call me 'The Don'.");
talkEntry:addResponse("Hm, you're not too bright are ya? I thought my residence and hoards of servants would have given you a hint.");
talkEntry:addResponse("#me sighs, '%CHARNAME, how can one be so naive? Where's the respect? I am the Don.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("#me macht eine ausladende willkommende Geste 'Ah meine Manieren. Valerio Guilianni ist mein Name aber nennt mich 'Mein Don'.");
talkEntry:addResponse("Hm, der hellste Blitz scheint ihr nicht zu sein. Und ich dachte die Residenz und Dienerschaft wären Hinweis genug.");
talkEntry:addResponse("#me seufzt '%CHARNAME, wie kann man nur so blauäugig sein? Wo bleibt der Respekt? Ich bin der Don.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The day will come, when the Don will ask you for a favor. Ask Miggs if that day is today.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Es wird der Tag kommen, an dem dich der Don um einen Gefallen bittet. Frage Miggs, ob heute dieser Tag ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You know, the Don likes you for some reason, ya gotta look about ya. Maybe I gotta task for ya; go and ask Miggs how you can earn the Don's favor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Weißt du, der Don mag dich. Und der Don wird dir auch eine Arbeit verschaffen. Frage Miggs, wie du in der Gunst des Don steigen kannst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(10.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(11.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(13.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(13.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(14.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(17.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(17.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(25.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(34.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(34.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(51.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.item.item(45, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(51.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.item.item(45, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addResponse("#me nods and hands you an item silently.");
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mordak al Kharud");
talkEntry:addCondition(npc.base.condition.quest.quest(632, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(633, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(100.0));
talkEntry:addResponse("#me nickt und reicht dir leise einen Gegenstand.");
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(633, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Well, I provide for myself and my family. Ah and I rule Galmair of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Nun, ich sorge für mich, meine Familie und meine Freunde. Ach und Galmair beherrsche ich natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, I provide for myself and my family. Ah and I rule Galmair of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Nun, ich sorge für mich, meine Familie und meine Freunde. Ach und Galmair beherrsche ich natürlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ja, eine Schande. Tragisch, furchtbar. Und dabei herrschten ideale Bedingungen um ein zweites Galmair zu errichten.");
talkEntry:addResponse("As far as I heard, Troll's Bane could easily compete with Galmair in terms of security, quality of life and civil rights.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ja, eine Schande. Tragisch, furchtbar. Und dabei herrschten ideale Bedingungen um ein zweites Galmair zu errichten.");
talkEntry:addResponse("Soweit ich gehört habe, stand Troll's Bane Galmair in Sicherheit, Lebensqualität und politischer Mitsprache um nichts nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I got deep pockets if ya know what I mean, %CHARNAME. It's my business to know people and what happens in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ich zahle gutes Geld um zu wissen was in meiner Stadt passiert, %CHARNAME. Euer Aufenthalt hier war mir bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosie");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She doesn't like the name, what can I say? Prefers Rosaline and her fancy title o' Queen.");
talkEntry:addResponse("Believe me, it is my privilege alone to call her that. Best ta keep it outya mouth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosie");
talkEntry:addResponse("Sie mag den Namen nicht, ihr werdet sie eher als Königin Rosaline kennen.");
talkEntry:addResponse("Glaubt mir, das Privileg sie so zu nennen ist allein mir vorbestimmt. Versucht es erst gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Every successful businessman need two things: A supportive wife and a muscle to do his biding. If only I had Rosie, I'd have both in one person.");
talkEntry:addResponse("Miggs is like a second left hand for me, but enough jokes. See him if you need a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miggs");
talkEntry:addResponse("Jeder erfolgreiche Geschäftsmann braucht zwei Dinge: Eine unterstützende Frau und einen Mann fürs Grobe. Ach, mit Rosie hätte ich beides in einem.");
talkEntry:addResponse("Miggs ist wie eine zweite linke Hand, aber genug gescherzt. Geh zu ihm wenn du eine Aufgabe suchst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("protection");
talkEntry:addTrigger("fee");
talkEntry:addResponse("You wanna be in the know? So do about a thousand other people. Don't talk about things that don't concern you.");
talkEntry:addResponse("You talking about protection fees? You need some protection? You might if you keep talking about things that don't concern you.");
talkEntry:addResponse("A business has to have protection from a lot things. Also, has to pay a lot fees. That's about all you need to know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Protektionsgebühr");
talkEntry:addTrigger("Schutz");
talkEntry:addTrigger("Protekt");
talkEntry:addTrigger("Gebühr");
talkEntry:addResponse(" Was wollt Ihr wissen? - Sprecht nicht über Dinge die Euch nichts angehen.");
talkEntry:addResponse("Sprecht Ihr über die Protektionsgebühren? Braucht ihr etwa Schutz? Vermutlich schon... sprecht Ihr immerhin über Dinge die Euch nicht im gerningsten zu interessieren haben.");
talkEntry:addResponse("Ein Laden muss vor vielen Dingen geschützt werden. - Und muss viele Gebühren zahlen. Das ist alles was Ihr wissen müsst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Corleone");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ach, a dazzler from Gynka, no honor. And throaty all the time, only the gods know why.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Corleone");
talkEntry:addResponse("Ach, ein Blender aus Gynka, keine Ehre. Und immer heiser, die Götter wissen warum.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faction");
talkEntry:addResponse("Ya know I hear people talking about these ?factions', but all I see is the land of my future wife and a drugged out magician leading halfers.");
talkEntry:addResponse("Ya, ya Runewick, Cadomyr, and Galmair that's all you newcomers want to talk about. Focus on what's important, getting rich, plain and simple.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fraktion");
talkEntry:addResponse("Wisst Ihr, ich höre die Leute immer wieder über die Fraktionen sprechen. - Aber  für mich sind sie nichts weiter als die Länder meiner zukünftigen Frau und des übergeschnappten Magiers der Frauenkleider trägt.");
talkEntry:addResponse("Aye, Runewick, Cadomyr und Galmair, das ist alles worüber Neuankömmlinge wie ihr sprechen wollt. Konzentriert Euch lieber auf die  wichtigen Dinge! Reichtum und Macht! - Ganz einfach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tell me, what should I think of a man who wears women's clothing and enjoys men swooning over his greatness?");
talkEntry:addResponse("He is said not to leave his tower very often. If you ask me, that's a good thing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Sagt mir ernsthaft, was soll ich von einem Mann halten der Frauengewänder trägt und sich von Männern anhimmeln lässt?");
talkEntry:addResponse("Er soll seinen Turm ja nicht oft verlassen, und wenn ihr mich fragt ist das auch gut so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Tell me, what should I think of a man who wears women's clothing and enjoys men swooning over his greatness?");
talkEntry:addResponse("He is said not to leave his tower very often. And if you ask me, that's a good thing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Sagt mir ernsthaft, was soll ich von einem Mann halten der Frauengewänder trägt und sich von Männern anhimmeln lässt?");
talkEntry:addResponse("Er soll seinen Turm ja nicht oft verlassen, und wenn ihr mich fragt ist das auch gut so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sadly, the tide never rises high enough for a wave to wash away all those bookworms into the sea.");
talkEntry:addResponse("Some suspect me of blackmail, but do you know how much a mage from Runewick charges for his services? Now that's a crime!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Leider steigt die Flut nie hoch genug, um diese ganzen Bücherwürmer mit einer Welle ins Meer zu spülen.");
talkEntry:addResponse("Man warf mir schon einmal Erpressung vor, aber wisst ihr, wieviel die Magier Runewicks für ihre Dienste verlangen? Das ist ein Verbrechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair is like a mountain flower, enchanting every wanderer with its beauty.");
talkEntry:addResponse("Sometimes, if I am up early and look down from the battlement I can almost smell the success and profit of Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist eine wilde Gebirgsblume, die jeden Wanderer mit ihrer Schönheit in ihren Bann zieht.");
talkEntry:addResponse("Manchmal, wenn ich früh aufstehe und von den Zinnen hinabblicke kann ich den Erfolg und Profit von Galmair fast riechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh Rosie! That's my kind of woman. Such fire, such a fierce temper!");
talkEntry:addResponse("She fell for me completely! Sadly, she would never show her true feelings openly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Oh Rosie! Das ist eine richtige Frau! Voll Feuer, voll Temperament!");
talkEntry:addResponse("Sie ist mir vollkommen verfallen! Leider würde sie ihre wahren Gefühle für mich nie offen zeigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh Rosie! That's my kind of woman. Such fire, such a fierce temper!");
talkEntry:addResponse("She fell for me completely! Sadly, she would never show her true feelings openly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Oh Rosie! Das ist eine richtige Frau! Voll Feuer, voll Temperament!");
talkEntry:addResponse("Sie ist mir vollkommen verfallen! Leider würde sie ihre wahren Gefühle für mich nie offen zeigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A nice place. Maybe it lacks the proper nightlife, but Rosie does a good job overall.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ein hübscher Ort. Das Nachtleben lässt vielleicht etwas zu wünschen übrig, aber Rosie macht ihre Sache gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Proud people. I find their way of dealing with weakness appealing.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ein stolzes Volk. Und ihre Art, wie sie mit Schwäche umgehen, gefällt mir ebenfalls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Honorable former 'business partners' of my father lived there. Until we had to terminate them, the business relationships o'course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ehrenwerte ehemalige 'Geschäftspartner' meines Vaters wohnten dort. Wir mussten sie leider terminieren. Die Geschäftsbeziehungen meine ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Even though they like to act all noble, many of them visit Galmair to entertain themselves. Their vice pays our dice, see whatta mean?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Auch wenn sie sich gerne nobel geben, viele kommen zu uns nach Galmair um sich zu amüsieren. Ihr Laster bringt uns Zaster, hehe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You got faith, %CHARNAME? Don't let the priests and zealots fool ya, if you're looking for practical words about the gods just ask me about one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gott");
talkEntry:addTrigger("götter");
talkEntry:addResponse("Glaubt Ihr, %CHARNAME? Habt Ihr vertrauen? - Lasst Euch von den Priestern und Mönchen nicht an der Nase herumführen, wenn ihr nach ein paar aufrichtige Worte über die Götter sucht, seid Ihr bei mit genau an den Richtigen geraten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ahh, what would a tavern be without him? How could tempers run high over a game of cards if not due to Adron's gifts?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ahh, was wäre eine Taverne ohne ihn? Wie könnten sich sonst die Gemüter so beim Kartenspiel erhitzen wenn nicht durch Adrons Gaben?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I wonder if he takes offense to my dragon hide boots, but didn't he leave this world already? If you can't stand the heat, stay outta the hearth, I always say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ich frage mich ob er meine Stiefel aus Drachenleder anstößig findet. Aber hat er diese Welt nicht schon verlassen? Und was er nicht weiß macht ihn nicht heiß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you had to wake up with a dagger poking your throat every other night you'd also respect the lady in black.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Würdet ihr jede zweite Nacht mit einem Messer an der Kehle aufwachen, ihr hättet auch Respekt vor der schwarzen Dame.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Books might teach ya a lot, but everything I had to learn to become successful I've experienced through action.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Bücher mögen einem viel beibringen können. Aber alles, was ich lernen musste um erfolgreich zu sein, habe ich durch Taten erfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't believe Eldan shows any interest in Galmair or myself. The mountains are pretty secluded however, maybe he'd like those.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich glaube kaum, dass Eldan sich für Galmair und mich interessiert. Obwohl das Gebirge doch sehr abgeschieden ist, vielleicht würde ihm das gefallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sometimes, when the temperature becomes unbearable in winter, I think to myself 'One can overdo in fulfilling his tasks'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Manchmal, wenn die Temperaturen im Winter unerträglich werden, denke ich mir 'Man kann seine Aufgaben auch zu gründlich erfüllen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("As Galmair's wealth comes from the mining and processing of ore it would be foolish not to drink a mug of beer regularly in honor of the great craftsman, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Da Galmair vorallem vom Bergbau und Weiterverarbeitung von Metallen lebt, wäre es töricht, nicht regelmäßig einen Krug Bier für den großen Handwerker mitzutrinken, nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hah, noble that one, jumping in front of an arrow to save a comrade in battle. Doesn't he know how much that hurts!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Hah, ehrenhaft ist, wer einen Pfeil abfängt um seinen Kameraden in der Schlacht zu retten. Weiß er nicht wie weh sowas tut!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Maybe not all of my decisions in life were 'right', but I do know the thin line between twilight and eternal darkness. You cross that line and your just a foolish bastard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ich mag nicht immer das 'Richtige' getan haben, aber ich kenne die feine Linie zwischen dem Zwielicht und der ewigen Dunkelheit. Ich werde diese Linie nicht übertreten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nargún blessed me many a times when I had to play my cards right. On the other hand there's no reason not to tip luck into your favor, he's pretty unreliable after all.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Schon oft war mir Nargún hold, als es darum ging auf die richtige Karte zu setzen. Anderenseits spricht nichts dagegen dem Glück auch nachzuhelfen, immerhin ist er nicht sehr verlässlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("We live amidst a scarce mountain range and I shall pay reverence to Oldra? Forget about it...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Wir leben inmitten eines kargen Gebirges, und da soll ich Oldra Respekt erweisen? Pfft... also bitte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("No coins, no wares leave my possession without being blessed in the face of Ronagan. You can figure out why I'd do that ya'self.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Kein Geldstück, keine Ware verlässt meinen Besitz bevor sie nicht in Gebete zu Ronagan mit eingeschlossen wurde. Spekulationen, warum ich das mache, seien euch selbst überlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I would have the most beautiful temple carved into the mountains, if only Rosie wouldn't be so abrasive. Sirani is gunna to have to settle for less until that happens.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Den schönsten Tempel würde ich in das Gebirge hauen lassen, wenn nur Rosie nicht immer so abweisend zu mir wäre. Bis dahin muss Sirani sich mit weniger begnügen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In spring after the snow has melted I sometimes think we don't pay enough respect to her. Then after the floods are under control I disregard those thoughts again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Nach der Schneeschmelze im Frühling glaube ich manchmal dass wir Tanora nicht genug huldigen. Wenn die Überschwemmungen aber beseitigt sind, verdränge ich diese Gedanken wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some of the dwarves pray to her. They say if we don't, the mountain will collapse upon us. Whatever, let the superstitious believe what they wanna.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Einige der Zwerge beten zu ihr. Sie sagen sonst stürzt uns der Berg auf den Kopf, was auch immer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Family is all that matters, you remember that. You rely on friends and best believe your pockets will be empty and a knife will be in your back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Wenn man lacht, lacht die Welt mit einem mit, aber weine und du weinst allein. Ich hatte nie eine Verwendung für Freunde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't sell anything, I grant favors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe nichts, ich gewähre Gefälligkeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Money gets you everywhere in Galmair. Even those places you probably shouldn't be.");
talkEntry:addResponse("My father once said: 'Son, stay honest and upright, you'll be rewarded.' Oh how we laughed that day.");
talkEntry:addResponse("#me winks knowingly, 'If there's one habit I broke out of doing, it's telling others about something.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("In Galmair bringt Geld euch überall hin. Wohl auch an Orte die ihr meiden solltet.");
talkEntry:addResponse("Mein Vater sagte einmal: 'Sohn, bleib ehrbar und anständig, es wird dir gelohnt.' Oh was haben wir an diesem Tag gelacht.");
talkEntry:addResponse("#me zwinkert wissend. 'Wenn es eine Sache gibt die ich mir abgewöhnt habe, dann anderen Dinge zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me bows ever so slightly. 'That's me. How can I help you, %CHARNAME ?'");
talkEntry:addResponse("You've heard about me I see very good, very good. Ask and the Don will help you.");
talkEntry:addResponse("What do you want from him? Who sent you? Guards! Has this meat bag been searched for weapons?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("#me deutet eine Verbeugung an. 'Das bin ich. Wie kann ich euch helfen, %CHARNAME ?'");
talkEntry:addResponse("Ihr habt also von mir gehört. Sehr schön, sehr schön. Bittet und der Don wird euch helfen.");
talkEntry:addResponse("Was wollt ihr von ihm? Wer hat euch geschickt? Wache! Wurde diese Person auf Waffen untersucht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Good to hear, Good to hear.");
talkEntry:addResponse("The Don approves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("In der Tat.");
talkEntry:addResponse("Der Don stimmt zu.");
talkEntry:addResponse("Der Don heißt dies gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("'No'? Don't force the Don to make the impossible possible.");
talkEntry:addResponse("'No'? Well, you may keep your opinion. One can sell everything else with a profit anyway.");
talkEntry:addResponse("And this negative attitude divides success from failure. That's why you're just a petitioner before the Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("'Nein'? Zwingt den Don nicht das unmögliche möglich zu machen.");
talkEntry:addResponse("'Nein'? Nun gut ihr könnt eure Meinung behalten. Alles andere kann man ja mit Gewinn verkaufen.");
talkEntry:addResponse("Und genau diese negative Einstellung entscheidet über Erfolg und Misserfolg. Deswegen seid ihr nur ein Bittsteller vor dem Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me geht müßig ein paar Schritte auf und ab, dabei lächelt er zufrieden.", "#me walks with at a leisurely pace with a content smile on his face.");
talkingNPC:addCycleText("Respekt? Wo ist nur der Respekt geblieben? All diese Möchtegerns...", "Respect? Where's the respect? All these wannabes...");
talkingNPC:addCycleText("#me dreht sich besorgt um 'Halt! Wer ist da? Es ist noch nicht Zeit für das wöchentliche Attentat!'", "#me turns around concerned, ?Damn assassination attempts there almost weekly now.'");
talkingNPC:addCycleText("#me spuckt angewidert ein paar Trauben aus. 'Ugh. Wer hat das zu verantworten?", "#me spits out some grapes in disgust. 'Ugh. Who's responsible for that?'");
talkingNPC:addCycleText("Ich befürchet, dieser Kräuterhandel wird uns noch in den nächsten Jahren viele Sorgen bereiten.", "I believe this herb business is gonna destroy us in the years to come.");
talkingNPC:addCycleText("Ich war niemals unvorsichtig. Frauen und Kinder dürfen unvorsichtig sein, Männer nicht.", "I spent my life trying not to be careless. Females and children can be careless, but not dwarves or men.");
talkingNPC:addCycleText("Ich glaube an Gold, Reichtümer und Macht. Wer an sie nicht ehrt, hat sie wohl schlichtweg nicht!", "I have faith in gold, wealth and power. Those who don't honor such meaningful things simply don't have either.");
talkingNPC:addCycleText("Miggs! Wo ist Miggs schon wieder! Einige Händler haben ihre 'Protektionsgebühr' diesen Monat noch nicht entrichtet.", "Miggs! Where is Miggs again? Some traders haven't paid their 'protection fee' this month.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Aufgrund seines noblen Gebahrens und Auftretens muss dies Don Valerio Guilianni höchst persönlich sein.", "Judging by his noble attire and overall demeanor this must be Don Valerio Guilianni.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2390);
mainNPC:setEquipment(11, 2384);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 526);
mainNPC:setEquipment(9, 2172);
mainNPC:setEquipment(10, 697);
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