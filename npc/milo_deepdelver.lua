--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
--------------------------------------------------------------------------------
-- NPC Name: Milo Deepdelver                                         Runewick --
-- NPC Job:  Herbalist                                                        --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  883, 634, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Nanuk                                                            --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.23 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 883, 634, 0, 4, 'Milo Deepdelver', 'npc.milo_deepdelver', 0, 2, 0, 205, 170, 125, 232, 187, 145);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.milo_deepdelver", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the herbalist Milo Deepdelver. He knows some things about the Gods and herb lore. It also looks like he has a problem with his ox."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Kräuterkundige Milo Deepdelver. Er weiß ein paar Dinge über die Götter und Kräuterkunde. Auch scheint er ein Problem mit seinem Ochsen zu haben."));
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
talkEntry:addResponse("Greetings my friend and may the Gods be with you. I don't have much time, as this obstinate ox of mine won't take a step forward, but if you know anything about oxen lend me a hand, will you?");
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
talkEntry:addResponse("Ich grüße euch mein Freund und mögen die Götter mit euch sein. Ich habe leider nicht sehr viel Zeit, weil mein starrsinniger Ochse keine Schritt mehr tut. Aber falls ihr etwas von Ochsen versteht, dann könnt ihr mir gerne zur Hand gehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings my friend and may the Gods be with you. I don't have much time, as this obstinate ox of mine won't take a step forward, but if you know anything about oxen lend me a hand, will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ich grüße euch mein Freund und mögen die Götter mit euch sein. Ich habe leider nicht sehr viel Zeit, weil mein starrsinniger Ochse keine Schritt mehr tut. Aber falls ihr etwas von Ochsen versteht, dann könnt ihr mir gerne zur Hand gehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell my friend. May Oldra guide your way wherever you go.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Auf Wiedersehen mein Freund. Möge Oldra über euren Wegen wachen, wo auch immer ihr hingeht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Farewell my friend. May Oldra guide your way wherever you go.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Auf Wiedersehen mein Freund. Möge Oldra über euren Wegen wachen, wo auch immer ihr hingeht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#me sighs, 'Well, you know, I was on my way back home, but the Gods blessed me with this old ox, that doesn't want to move.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("#me seufzt: 'Ach, wisst ihr, ich war auf dem Weg nach Hause, aber die Götter haben mich mit diesem alten Ochsen bedacht, der sich nicht mehr bewegen will.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My Name is Milo Deepdelver. I am a herbalist from Runewick. If the Gods are with me, I will be on my way home with this no good ox of mine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Milo Deepdelver. Ich bin ein Kräuterkundiger aus Runewick. So die Götter es wollen, bin ich auf dem Weg nach Hause mit meinem unnützen Ochsen hier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Milo's ox"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 1));
talkEntry:addResponse("This stupid ox of mine doesn't move a single step and I am late returning to my family. My ox will do anything for carrots, but a few miles back I ran out. If you could get me ten carrots, I could show you a few tricks with herb lore, as I am quite proficient in this art.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 0));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Milos Ochse"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 1));
talkEntry:addResponse("Mein dummer Ochse bewegt sich kein Stück mehr nach vorne und ich bin jetzt schon spät dran, zu meiner Familie zurückzukehren. Mein Ochse würde alles für Karotten machen aber vor ein paar Meilen sind sie mir ausgegangen. Wenn Ihr mir zehn Karotten besorgen könntet, könnte ich euch ein paar Tricks in Kräuterkunde beibringen, denn ich bin sehr bewandert in dieser Kunst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("yes");
talkEntry:addTrigger("ox");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Milo's ox"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 1));
talkEntry:addResponse("This stupid ox of mine doesn't move a single step and I am late returning to my family. My ox will do anything for carrots, but a few miles back I ran out. If you could get me ten carrots, I could show you a few tricks with herb lore, as I am quite proficient in this art.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 0));
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("ja");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Ochse");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Milos Ochse"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 1));
talkEntry:addResponse("Mein dummer Ochse bewegt sich kein Stück mehr nach vorne und ich bin jetzt schon spät dran, zu meiner Familie zurückzukehren. Mein Ochse würde alles für Karotten machen aber vor ein paar Meilen sind sie mir ausgegangen. Wenn Ihr mir zehn Karotten besorgen könntet, könnte ich euch ein paar Tricks in Kräuterkunde beibringen, denn ich bin sehr bewandert in dieser Kunst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 89));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You received ten mandrakes and one bottle of elven wine."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1318, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(752, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard, but I can't teach you anything anymore. You already surpass my skills. Here let me give you some of my provisions in exchange, especially this nice wine from the elven domain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 89));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Alraunen und eine Flasche Elfenwein."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1318, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(752, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr mit diesem faulen Bastard haben. Aber ich kann euch leider nichts mehr beibringen. Ihr übertrefft meine Fähigkeiten bereits. Lasst mich euch im Austausch ein paar meiner Vorräte geben, insbesondere dieser exzellente Elfenwein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 89));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("ox");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You received ten mandrakes and one bottle of elven wine."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1318, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(752, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard, but I can't teach you anything anymore. You already surpass my skills. Here let me give you some of my provisions in exchange, especially this nice wine from the elven domain!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 89));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Ochse");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst zehn Alraunen und eine Flasche Elfenwein."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(1318, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(752, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr mit diesem faulen Bastard haben. Aber ich kann euch leider nichts mehr beibringen. Ihr übertrefft meine Fähigkeiten bereits. Lasst mich euch im Austausch ein paar meiner Vorräte geben, insbesondere dieser exzellente Elfenwein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 70));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Your skill in herb lore is increased."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard. Let me show you a few things about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 70));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Deine Fertigkeit in Kräuterkunde wurde gesteigert."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr haben, mit diesem faulen Bastard heim zu kehren. Kommt, lasst mich euch ein paar Geheimnisse der Kräuterkunde zeigen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 70));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("ox");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Your skill in herb lore is increased."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard. Let me show you a few things about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 70));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("befehl");
talkEntry:addTrigger("Ochse");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Deine Fertigkeit in Kräuterkunde wurde gesteigert."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr haben, mit diesem faulen Bastard heim zu kehren. Kommt, lasst mich euch ein paar Geheimnisse der Kräuterkunde zeigen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 30));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Your skill in herb lore is increased."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard. Let me show you a few things about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 30));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Deine Fertigkeit in Kräuterkunde wurde gesteigert."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr haben, mit diesem faulen Bastard heim zu kehren. Kommt, lasst mich euch paar Geheimnisse der Kräuterkunde zeigen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 30));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("ox");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Your skill in herb lore is increased."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard. Let me show you a few things about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, ">", 30));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("befehl");
talkEntry:addTrigger("Ochse");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Deine Fertigkeit in Kräuterkunde wurde gesteigert."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr haben, mit diesem faulen Bastard heim zu kehren. Kommt, lasst mich euch paar Geheimnisse der Kräuterkunde zeigen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, "<", 31));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Your skill in herb lore is increased."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 3));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard. Let me show you a few things about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, "<", 31));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Deine Fertigkeit in Kräuterkunde wurde gesteigert."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 3));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr haben, mit diesem faulen Bastard heim zu kehren. Kommt, lasst mich euch paar Geheimnisse der Kräuterkunde zeigen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, "<", 31));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("ox");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Your skill in herb lore is increased."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 3));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Thanks a lot for bringing me these carrots. Now I will have no problems returning home with this lazy bastard. Let me show you a few things about herbs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.herblore, "<", 31));
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=>", 10, nil));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Ochse");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Deine Fertigkeit in Kräuterkunde wurde gesteigert."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.herblore, "+", 3));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2493, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(106, "=", 2));
talkEntry:addResponse("Ich danke euch vielmals für die Karotten. Nun werde ich kein Problem mehr haben, mit diesem faulen Bastard heim zu kehren. Kommt, lasst mich euch paar Geheimnisse der Kräuterkunde zeigen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addResponse("Yes, I am still waiting for those ten carrots you wanted to bring to me. Please hurry up, my family are waiting for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=", 0, nil));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addResponse("Ja, ich warte immer noch auf die zehn Karotten, die ihr mir versprochen habt, zu bringen. Bitte, beeilt euch, meine Familie macht sich bestimmt schon Sorgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=", 0, nil));
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addTrigger("ox");
talkEntry:addResponse("Yes, I am still waiting for those ten carrots you wanted to bring to me. Please hurry up, my family are waiting for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "=", 0, nil));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("Hilfe");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("befehl");
talkEntry:addTrigger("Ochse");
talkEntry:addResponse("Ja, ich warte immer noch auf die zehn Karotten, die ihr mir versprochen habt, zu bringen. Bitte, beeilt euch, meine Familie macht sich bestimmt schon Sorgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addResponse("Alas this is not the number of carrots I need. I would not get home with this few. Bring me at least ten carrots and please hurry up!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "<", 10, nil));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addResponse("Aber das ist nicht die Anzahl an Karotten, die ich brauche. Mit den wenigen würde ich es niemals bis nach Hause schaffen. Bringt mir wenigstens zehn Karotten und bitte beeilt euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "<", 10, nil));
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("order");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("ox");
talkEntry:addResponse("Alas this is not the number of carrots I need. I would not get home with this few. Bring me at least ten carrots and please hurry up!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2493, "all", "<", 10, nil));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Ochse");
talkEntry:addResponse("Aber das ist nicht die Anzahl an Karotten, die ich brauche. Mit den wenigen würde ich es niemals bis nach Hause schaffen. Bringt mir wenigstens zehn Karotten und bitte beeilt euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("problem");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("quest");
talkEntry:addResponse("With the carrots you brought I will have no problems returning home. May Adron give you wine whenever you desire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 2));
talkEntry:addTrigger("Problem");
talkEntry:addTrigger("Mission");
talkEntry:addTrigger("Quest");
talkEntry:addResponse("Mit den Karotten, die ihr gebracht habt, werde ich kein Problem haben, nach Hause zurück zu kehren. Adron gebe euch Wein wann immer ihr danach gelüstet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 2));
talkEntry:addTrigger("ox");
talkEntry:addTrigger("help");
talkEntry:addTrigger("carrot");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("With the carrots you brought I will have no problems returning home. May Adron give you wine whenever you desire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(106, "=", 2));
talkEntry:addTrigger("Möhre");
talkEntry:addTrigger("Wurzel");
talkEntry:addTrigger("Ochse");
talkEntry:addTrigger("Hilfe");
talkEntry:addTrigger("helfe");
talkEntry:addTrigger("Karotte");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Mit den Karotten, die ihr gebracht habt, werde ich kein Problem haben, nach Hause zurück zu kehren. Adron gebe euch Wein wann immer ihr danach gelüstet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am an expert when it comes to herbs. I could tell you all day long about herb lore!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Kräuterexperte. Ich könnte euch den ganzen Tag über Kräuterkunde vollquatschen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am an expert when it comes to herbs. I could tell you all day long about herb lore!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Kräuterexperte. Ich könnte euch den ganzen Tag über Kräuterkunde vollquatschen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elder");
talkEntry:addResponse("The Elder Gods were first on this world. There are five of them with the names Ushara, Brágon, Eldan, Tanora and Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Alte");
talkEntry:addResponse("Die Alten Götter kamen zuerst auf diese Welt. Es gibt fünf von Ihnen und sie heißen Ushara, Brágon, Eldan, Tanora und Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("young");
talkEntry:addResponse("The Younger Gods were created by the Elder Ones. Their names are Nargùn, Elara, Adron, Oldra, Cherga, Malachín, Irmorom, Sirani, Zhambra, Ronagan and Moshran.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Junge");
talkEntry:addResponse("Die Jungen Götter wurden von den Alten erschaffen. Ihre Namen lauten Nargùn, Elara, Adron, Oldra, Cherga, Malachín, Irmorom, Sirani, Zhambra, Ronagan und Moshran.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("God");
talkEntry:addResponse("The Gods affect our lives in all aspects. It would be wise to give them due respect. There are the Younger and Elder Gods. Which group are you interested in?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Götter haben auf alle Aspekte unseres Lebens Einfluss. Es wäre weise, Ihnen Respekt zu erweisen. Es gibt die Jungen und die Alten Götter. Zu welcher Gruppe wollt ihr mehr erfahren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra is the beginning of everything on earth. From her, all has emerged. Well, maybe with the exception of this stubborn ox.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra verdanken wir alles auf dieser Welt. Aus Ihr ist jeder hervorgegangen. Nun ja, vielleicht mit Ausnahme von diesem störrischen Tier hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Our mother, Goddess of the earth. May She be praised!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Unsere Mutter, Göttin der Erde. Geehrt sei Sie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Brágon");
talkEntry:addTrigger("Bragon");
talkEntry:addResponse("Now we are talking about a great God. He imprisoned Moshran a long time ago, unfortunately he escaped.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brágon");
talkEntry:addTrigger("Bragon");
talkEntry:addResponse("Ja, das ist mal einer der ganz großen Götter. Er hat vor langer Zeit Moshran eingekerkert. Zu unserem Unglück ist er wieder entkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan is one of the Elder Gods. The only thing I have in common with him might be the wooden staff I am carrying.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan ist einer der alten Götter. Das einzige, was ich mit Ihm gemeinsam habe ist wohl dieser hölzerne Stab, den ich trage.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Tanora is the Goddess of Water, but you should go and ask a lizardman about her... they call her Zelphia.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Tanora ist die Göttin des Wassers. Aber ihr solltest einen Echsenmenschen über Sie befragen. Bei ihnen ist Sie unter dem Namen Zelphia bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Yes, the Goddess Tanora is known among the lizardmen by this name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ja, die Göttin Tanora ist bei den Echsenmenschen unter diesem Namen bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("The best tavern music I know comes from those bards and musicians who worship the Goddess of Air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Die beste Tavernenmusik, die ich kenne, kommt von den Barden und Musikern, welche die Göttin der Luft verehren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargun");
talkEntry:addResponse("Argh, don't call him by his name unless you want to seek his attention. Chaos follows his path and we don't really want that, do we?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargun");
talkEntry:addResponse("Argh, nennt Ihn doch nicht bei seinem Namen sofern ihr nicht Seine Aufmerksamkeit erregen wollt. Auf seinen Pfaden folgt das Chaos und das ist nicht etwas, was wir wirklich wollen, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara is the host of wisdom and knowledge. She is not really my kind but if you are much into reading and stuff like that, you should give it a try.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara ist angefüllt mir Weisheit und Wissen. Sie ist nicht so das richtige für mich, aber wenn Ihr gerne in Büchern stöbert, dann wäre Sie genau das richtige für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron is one of my favoured Gods. When I sit together with my friends and drink a wine we compete with toasts to the God of Wine and Festivities.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron ist einer meiner liebsten Götter. Wenn ich mit Freunden auf ein Glas Wein zusammen sitze, wetteifern wir mit Trinksprüchen für den Gott des Weines und der Feste.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("When I hear the name of Cherga the hairs on my feet stay on end. You should be on the watch if you meet one of the followers of the Goddess of Spirits and the Underworld.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Wenn ich den Namen Cherga höre, stehen mir die Fußhaare zu Berge. Ihr solltet vorsichtig sein, wenn ich auf Anhänger der Göttin der Geister und der Unterwelt trefft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachín");
talkEntry:addTrigger("Malachin");
talkEntry:addResponse("Malachín, the God of Battle and Hunting, flourishes his swords too much. Why battle, if all problems can be discussed with a nice roast on your plate and a beaker of wine in your hand?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachín");
talkEntry:addTrigger("Malachin");
talkEntry:addResponse("Malachín, der Gott der Jagt und der Schlachten, fuchtelt mir ein wenig zu viel mit Schwertern herum. Warum sich streiten, wenn man alle Probleme bei einem schönen Braten und einem Humpen Wein besprechen könnte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("You should never trust those dwarven traders praying to the God of Trade and Craftsmanship. With one hand they offer you a good deal and with the other they strip you of all your belongings.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ihr solltet niemals diesen Zwergenhändlern vertrauen, die zum Gott des Handels und Handwerks beten. Mit einer Hand bieten sie Euch einen guten Handel an und mit der anderen klauen sie euch das letzte Kupferstück aus der Tasche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("I have to admit, that Sirani sometimes is dancing in my dreams. Oh yes, the Goddess of Love and Pleasure surely is a sight to be remembered.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ich muss zugeben, dass Sirani manchmal in meinen Träumen tanzt. Ach ja, die Göttin der Liebe und Freuden ist wahrlich ein Anblick, an den man sich gerne erinnert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Count yourself lucky if you have a friend who is a true follower of Zhambra. You can trust this kind of person absolutely. Nobody would dare to deceive the God of Friendship and Loyalty by going behind his back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Schätzt euch glücklich, wenn ihr einen Freund habt, welcher ein ehrfürchtiger Anhänger von Zhambra ist. Auf so eine Person ist immer Verlaß. Es würde keiner wagen, dem Gott der Freundschaft und Treue so zu hintergehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me laughs heartily, 'The rogue in our godly pantheon. Always good for a joke, but you should never ever stray on his bad side... the God of Thieves and Shadows doesn't like to lose out.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me lacht herzhaft. 'Der Spitzbube in unserem Pantheon. Er ist immer für einen guten Scherz zu haben. Aber ihr solltet ihm niemals auf dem falschen Fuß erwischen. Der Gott der Diebe und der Schatten liebt es nicht, den Kürzeren zu ziehen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("If you are not tired of your life, you should stay far away from the God of Blood and Bones. I don't even dare to wisper his name, so that no misfortune or evil may befall me. He lurks in the dark waiting for a weakness of your soul, to get hold of it... forever. Be on your guard!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Wenn Ihr nicht lebensmüde seid, so haltet euch fern vom Gott des Blutes und der Gebeine. Ich wage nicht, seinen Namen auszusprechen, so mir nicht Unglück und Verderben widerfährt. Er lauert im Dunkeln auf eine Schwäche eurer Seele, um ihrer habhaft zu werden... auf ewige Zeiten. Seid auf der Hut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("herbalist");
talkEntry:addResponse("You can do a lot of stuff working as a herbalist. You can heal the wounded or poison the culprit. You can strengthen the weak or weaken the strong. You can change the biggest troll to the smallest fairy or create devastating bombs. All that is possible!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kräuterkundiger");
talkEntry:addResponse("Als Kräuterkundiger kann man eine Menge machen. Ihr könnt die Kranken heilen oder den Schuldigen vergiften. Ihr könnt den Schwachen stark oder den Starken schwach machen. Ihr könnt den größten Troll in die kleinste Fee verwandeln oder zerstörerische Bomben herstellen. All das ist möglich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Druid");
talkEntry:addResponse("You can do a lot of stuff working as a druid. You can heal the wounded or poison the culprit. You can strengthen the weak or weaken the strong. You can change the biggest troll to the smallest fairy or create devastating bombs. All that is possible!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Druid");
talkEntry:addResponse("Als Druide kann man eine Menge machen. Ihr könnt die Kranken heilen oder den Schuldigen vergiften. Ihr könnt den Schwachen stark oder den Starken schwach machen. Ihr könnt den größten Troll in die kleinste Fee verwandeln oder zerstörerische Bomben herstellen. All das ist möglich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("herb lore");
talkEntry:addResponse("It is a good and decent trade. You learn a lot about herbs and other ingredients, their usage and the history of herb lore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kräuterkunde");
talkEntry:addResponse("Dies ist ein gutes und respektables Handwerk. Man lernt eine Menge über Kräuter umd anderen Ingredienzien, ihren Gebrauch und die Geschichte der Kräuterkunde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("herb");
talkEntry:addResponse("There are different kind of herbs which can be found on the ground. You just need a sickle in your hand to cut them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kräuter");
talkEntry:addResponse("Es gibt verschiedene Arten von Kräutern, die auf der Erde gefunden werden können. Ihr benötigt nur eine Sichel in eurer Hand, um sie zu ernten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ingredient");
talkEntry:addResponse("There are some kind of minerals which are used to finish a brew. In general, it is gem dust.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ingredienz");
talkEntry:addResponse("Es gibt bestimmt Arten von Mineralien, mit denen man das Gebräu 'abschmeckt'. In der Regel ist dies der zermalene Staub von Edelsteinen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("usage");
talkEntry:addResponse("You will need a cauldron, the plants and other ingredients, and an empty bottle to create a potion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gebrauch");
talkEntry:addResponse("Ihr benötigt einen Kessel, die Kräuter und Ingredienzien und eine leere Flasche, um einen Trank herzustellen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("history");
talkEntry:addResponse("The history of herb lore is very interesting. It dates back to the old seer Nifrindarai from the perished Elven domain of the Raenandor dynasty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geschichte");
talkEntry:addResponse("Die Geschichte der Kräuterkunde ist sehr interessant. Sie basiert auf die Lehren des alten Sehers Nifrindarai aus den untergegangenen Elfenreichen der Geschlechter der Raenandor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nifrindarai");
talkEntry:addResponse("He has found out that all herbs contain active substances with different effects. The success of a formula therefore requires a harmonic combination of the ingredients in the correct proportions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nifrindarai");
talkEntry:addResponse("Er hat herausgefunden, dass alle Kräuter aktive Substanzen mit unterschiedlichen Wirkungen beinhalten. Der Erfolg einer Formel bedarf somit einer harmonischen Zusammenstellung der Ingredienzien und deren Mischungsverhältnisse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Raenandor");
talkEntry:addResponse("I don't know much about their story as even the name is so old that it is covered in dust.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raenandor");
talkEntry:addResponse("Ich weiß nicht viel über ihre Geschichte, da selbst der Name schon so alt ist, dass der Staub bei deren Erwähnung aufgewirbelt wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Elvaine Morgan is the current Archmage of Runewick. From far and near people flock to him, just to see him in flesh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Elvaine Morgan ist der Erzmagier von Runewick. Von nah und fern kommen die Menschen in Massen, nur um ihn leibhaftig zu erblicken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("He is our wise and benevolent Archmage, the ruler of Runewick. Never before was there such a fair mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er ist unser weiser und mildtätiger Erzmagier, der Gebieter von Runewick. Niemals zuvor ward gesehen ein so brillianter Kopf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Could you imagine a nicer place to live at than Runewick? This fabulous city of wisdom fills my heart with joy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Könnt Ihr Euch einen schöneren Ort zum Leben als Runewick vorstellen? Diese fabelhafte Stadt der Weisheit erfüllt mich jedesmal mit großer Freude.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("An unpleasent person with too much gold at his disposal. I even heard that when his father died he had his fingers in the pie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ein unangenehmer Zeitgenosse mit zu viel Gold in seinen Händen. Ich habe auch gehört, dass er seine Finger im Spiel hatte, als sein Vater gestorben ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is not a good place to be, if you ask me. They just crave for money but their character is spoiled.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Wenn ihr mich fragt, so ist Galmair kein guter Ort sich aufzuhalten. Ihr Sinn steht nur nach Geld, doch ihr Charakter ist verdorben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("Quite stiff they are over there in Cadomyr and their Queen Rosaline is no exception. I would expect that the backs of most people in Cadomyr hurt from all the bowing they have to perform.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die sind schon recht steif drüben in Cadomyr und ihre Königin Rosaline ist da keine Ausnahme. I würde mich nicht wundern, wenn der Rücken der meisten Leute in Cadomyr schmerzt aufgrund der ganzen Verbeugungen, die sie täglich ausüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rosaline");
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Quite stiff they are over there in Cadomyr and their Queen Rosaline is no exception. I would expect that the backs of most people in Cadomyr hurt from all the bowing they have to perform.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosaline");
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Die sind schon recht steif drüben in Cadomyr und ihre Königin Rosaline ist da keine Ausnahme. I würde mich nicht wundern, wenn der Rücken der meisten Leute in Cadomyr schmerzt aufgrund der ganzen Verbeugungen, die sie täglich ausüben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyrs customs are strange. Rather than relying on wisdom and knowledge, their rank determines status in society. It could even happen that a total retard rules the land. Crazy, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyrs Gebräuche sind eigenartig. Anstatt sich auf Weisheit und Wissen zu berufen, wird der Status einer Person in der Gesellschaft durch dessen Rang bestimmt. Es könnte sogar passieren, dass ein absoluter Volltrottel das Land beherrscht. Verrückt, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Albar");
talkEntry:addResponse("Last I heard there was another rebellion going on in Albar. Those poor peasants were forming an uprising again, but as always the so called nobles will put an end to it pretty soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Albar");
talkEntry:addResponse("Soweit ich gehört habe, gab es wieder mal eine Rebellion in Albar. Diese armen Bauern haben sich wieder erhoben. Aber wie so häufig werden diese sogenannten Adligen dem bald ein Ende setzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gynk");
talkEntry:addTrigger("Gync");
talkEntry:addResponse("I tell you, you can smell a person from Gynk three miles upwind. Those foul people live in stinking and chaotic dung heaps, that they actually call cities.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gync");
talkEntry:addTrigger("Gynk");
talkEntry:addResponse("Ich sage es euch, ihr könnt eine Person von Gynk drei Meilen gegen den Wind riechen. Diese verdorbenen Leute leben in stingenden und chaotischen Misthaufen, was sie auch noch als Städte bezeichen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Salkamar");
talkEntry:addResponse("Once I went to Salkamar. Oh, such beautiful places, those great people! You should go there yourself one day and you will not return the same as you are today.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Salkamar");
talkEntry:addResponse("Ein mal bin ich in Salkamar gewesen. Ach, diese wunderschönen Orte, diese einzigartigen Leute! Ihr solltet selbst einmal dort hingehen und ich verspreche euch, dass ihr bei eurer Rückkehr nicht mehr der gleiche sein werdet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("#me laughs loudly, 'Nobody will ever stand again with two feet on Gobaith, but I expect that you knew that.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("#me lacht laut: 'Niemand wird jemals wieder mit seinen beiden Füßen auf Gobaith stehen. Ich denke mir, dass ihr das gewußt habt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Halfling");
talkEntry:addResponse("Yes, I am a Halfling. Naturally the best people there are! Good for a nice chat and easy to have around. You only need to watch your provisions if one of us is around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Halbling");
talkEntry:addResponse("Ja, ich bin ein Halbling. Selbstverständlich das beste Volk weit und breit! Immer für einen netten Plausch zu haben und gute Gesellschafter. Man muss nur auf seinen Proviant aufpassen, wenn wir in der Nähe sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hobbit");
talkEntry:addResponse("Some call us Hobbits but most refer to us as Halflings.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hobbit");
talkEntry:addResponse("Manche nennen uns Hobbits, aber von den meisten werden wir als Halblinge bezeichnet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dwarf");
talkEntry:addTrigger("Dwarv");
talkEntry:addResponse("There is quite a strong community of Dwarves living at Galmair in the mountain range.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Es gibt eine recht große Niederlassung der Zwerge in Galmair in den Bergen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Human");
talkEntry:addResponse("Humans provide the biggest group of people in this land. You will find good and bad people amongst them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Menschen");
talkEntry:addResponse("Die Menschen stellen die größte Gruppe in diesen Landen. Du wirst gute und schlechte Leute unter ihnen finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elves");
talkEntry:addTrigger("Elfs");
talkEntry:addResponse("I don't really have much to do with the Elves. They are quite snobbish if you ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elben");
talkEntry:addTrigger("Elfen");
talkEntry:addResponse("Mit den Elfen habe ich eigentlich nicht viel zu tun. Sie sind mir einfach zu eingebildet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elb");
talkEntry:addTrigger("Elf");
talkEntry:addResponse("I don't really have much to do with the Elves. They are quite snobbish if you ask my.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elb");
talkEntry:addTrigger("Elf");
talkEntry:addResponse("Mit den Elfen habe ich eigentlich nicht viel zu tun. Sie sind mir einfach zu eingebildet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lizard");
talkEntry:addResponse("The Lizardmen are a very guarded community. With the exception of Zerarisa at Cape Farewell, I don't really know them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Echsen");
talkEntry:addResponse("Die Echsenmenschen sind eine sehr verschlossene Gruppe. Mit Ausnahme von Zerarisa am Kap des Abschiedes kenne ich nicht wirklich jemanden von ihnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Orc");
talkEntry:addResponse("The Orcs are a kind of brutish lot. You don't want to mess with them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork");
talkEntry:addResponse("Die Orks sind recht raue Gesellen. Ihr solltet keinen Streit mit ihnen anfangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fairy");
talkEntry:addTrigger("Fairies");
talkEntry:addResponse("The little flying creatures can be annoying sometimes, but in general they are good natured. I haven't seen many of them around though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fee");
talkEntry:addResponse("Die kleinen fliegenden Kreaturen können manchmal recht nervig sein, aber in der Regel sind sie freundlich. Ich habe nur in letzter Zeit wenige von ihnen gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gnom");
talkEntry:addResponse("Sorry, I have never really met a Gnome. I just heard that they are similar to dwarves but I can't say if that is true.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gnom");
talkEntry:addResponse("Entschuldigt, aber ich habe bisher noch keinen Gnom angetroffen. Man hört, sie wären den Zwergen nicht unähnlich, aber ob das stimmt, kann ich nicht sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Goblin");
talkEntry:addResponse("In my youth my mother used to tell me lurid tales about those little creatures. I would advise to stay away from them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Goblin");
talkEntry:addResponse("In meiner Jugend hat meine Mutter mir immer Horrorgeschichten von den Goblins erzählt. Mein Rat wäre, sich von ihnen fern zu halten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("A very nice lizardwoman living at Cape Farewell. She works as a fisherwoman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zerarisa");
talkEntry:addResponse("Eine sehr nette Echsenfrau, die am Kap des Abschiedes lebt. Sie ist eine Fischerin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fronita");
talkEntry:addTrigger("Emery");
talkEntry:addResponse("She is the dwarven glass artisan of Runewick. A really good lass with the best bottles in town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fronita");
talkEntry:addTrigger("Emery");
talkEntry:addResponse("Sie ist die zwergische Glaskünstlerin von Runewick. Ein wirklich sympatisches Mädel, die die besten Flaschen der Stadt bläßt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nana");
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Nana is a good friend of mine. Normally you can find her around the fields in Yewdale.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nana");
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Nana ist eine gute Freundin von mir. Man kann sie meistens bei den Feldern im Eibenthal finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("family");
talkEntry:addResponse("I am living together with my wife and child in Runewick. A peaceful place to be.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Familie");
talkEntry:addResponse("Ich lebe zusammen mit meiner Frau und meinem Kind in Runewick. Es ist ein sehr friedvoller Ort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wife");
talkEntry:addResponse("My wife is called Rose and she is the most beautiful woman you will ever see!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frau");
talkEntry:addResponse("Meine Frau heißt Rose und sie ist die schönste Frau, welche ihr je zu Gesicht bekommen werdet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("child");
talkEntry:addTrigger("Daughter");
talkEntry:addResponse("I have a small daughter of three years and she is the sunshine of my life.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kind");
talkEntry:addTrigger("Tochter");
talkEntry:addResponse("Ich habe eine kleine Tochter von drei Jahren und sie ist der Sonnenschein in meinem Leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Sorry, I don't sell anything. I am trying to get this stupid ox to move... so, get out of my way if you don't want to help me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Entschuldigt, aber ich verkaufe nichts. Ich versuche diesen dummen Ochse in Bewegung zu setzten. Also, geht mir aus dem Weg, wenn ihr mir nicht helfen wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I could tell you a lot about herb lore, and my family, if you wish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich könnte eine Menge über Kräuterkunde erzählen - und über meine Familie, wenn ihr wollt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("my name");
talkEntry:addResponse("My Name is Milo Deepdelver. I am a herbalist from Runewick. If the Gods are with me, I will be on my way home with this no good ox of mine!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein name");
talkEntry:addResponse("Mein Name ist Milo Deepdelver. Ich bin ein Kräuterkundiger aus Runewick. So die Götter es wollen, bin ich auf dem Weg nach Hause mit meinem unnützen Ochsen hier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Milo");
talkEntry:addTrigger("Deepdelver");
talkEntry:addResponse("Yes, this is my name. If you need some information on the Gods or herb lore just talk to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milo");
talkEntry:addTrigger("Deepdelver");
talkEntry:addResponse("Ja, so heiße ich. Falls ihr ein paar Informationen zu den Göttern oder Kräuterkunde benötigt, stehe ich zu eurer Verfügung.");
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
talkingNPC:addCycleText("Nun komm schon, du dickköpfiger alter Ochse!", "Come on, you stubborn old ox!");
talkingNPC:addCycleText("#me zieht verzweifelt am Joch des Ochsens.", "#me desperately pulls at the headcollar of the ox.");
talkingNPC:addCycleText("#me versucht dem Ochse gut zuzureden.", "#me tries to cajole the ox into moving.");
talkingNPC:addCycleText("Jetzt beweg dich endlich, du Mistviech von einem Ochse!", "Now move, you bastard of an ox!");
talkingNPC:addCycleText("Ich verspreche dir, ich mach aus dir Ochsenschwanzsuppe, wenn du dich nicht auf der Stelle in Bewegung setzt.", "I promise I will turn you into oxtail soup if you do not move right away.");
talkingNPC:addCycleText("Soll dich doch Cherga ins Reich der Toten holen, du faules Stück!", "May Cherga take you into the realm of the dead, you numbskull!");
talkingNPC:addCycleText("#me schlägt mit dem Stock nach dem Ochse.", "#me hits the ox with a stick.");
talkingNPC:addCycleText("In Galmair wüßte man mit einem Ochse wie dir umzugehen!", "They would know how to deal with with a ox like you in Galmair!");
talkingNPC:addCycleText("Bei den Haaren meiner Füße, ich trete dir gleich in den Hintern!", "By the hairs on my feet, I will kick you in the butt!");
talkingNPC:addCycleText("Wegen dir kommen wir zu spät zum Essen, du dickköpfige Kreatur!", "Because of you we will be late for dinner, you thickheaded creature!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(6);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Kräuterkundige Milo Deepdelver.", "This NPC is the herbalist Milo Deepdelver.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 810);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 126);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 367);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END