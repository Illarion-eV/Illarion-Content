--------------------------------------------------------------------------------
-- NPC Name: Saren Eisenfaust                                         Galmair --
-- NPC Job:  stuff for skill                                                  --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  333, 258, 0            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Authors:  Someone                                                          --
--           & Rincewind                                                      --
--                                                                            --
-- Last parsing: May 27, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 333, 258, 0, 0, 'Saren Eisenfaust', 'npc.saren_eisenfaust', 0, 3, 4, 255, 113, 3, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
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
module("npc.saren_eisenfaust", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the smith Saren Eisenfaust. Keyphrases: Hello, quest, pickaxe, adventure");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist der Schmied Saren Eisenfaust. Schlüsselwörter: Hallo, Quest, Aufgaben, Spitzhacke");
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
talkEntry:addResponse("Good day, what do ya want?");
talkEntry:addResponse("Irmorom with ya, do ya need anything?");
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
talkEntry:addResponse("Tach auch, wat gibts?");
talkEntry:addResponse("Irmorom zum Gruße, brauchst du wat?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What do ya want, eh? We say greetings around here.");
talkEntry:addResponse("Aye, whatever.");
talkEntry:addResponse("You won't go far with that greeting around here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Wat willste, eh? Dat heißt Tach!");
talkEntry:addResponse("Aye, wat auch immer.");
talkEntry:addResponse("Damit kommste hier nich weit, es heißt Tach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Aye, take care.");
talkEntry:addResponse("Irmorom with ya!");
talkEntry:addResponse("Until next time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Aye, machs gut.");
talkEntry:addResponse("Irmorom mit dir!");
talkEntry:addResponse("Man sieht sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, take care.");
talkEntry:addResponse("Irmorom with ya!");
talkEntry:addResponse("Until next time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Aye, machs gut.");
talkEntry:addResponse("Irmorom mit dir!");
talkEntry:addResponse("Man sieht sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Can't say anything's bothering me and ya?");
talkEntry:addResponse("So-so, but I'm fine right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich kann nich klagen und du?");
talkEntry:addResponse("Ganz gut und selbst?");
talkEntry:addResponse("Mal so, mal so, aber gerade geht es mir ganz gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Saren and who are you?");
talkEntry:addResponse("I'm called Saren, Saren Eisenfaust and what's your name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der Saren und wer bist du?");
talkEntry:addResponse("Man nennt mich Saren, Saren Eisenfaust und wie nennt man dich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pickaxe");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addResponse("You can mine for ore with it, a merchant can surely sell ya one if you lose yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spitzhacke");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addResponse("Damit kannst du das Erz abbauen, ein Händler kann dir sicher eine verkaufen wenn du deine verlierst");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I can help ya if ya wanna become a smith, but first bring me 10 lumps of coal as well as 10 chunks of iron ore, and don't forget to bring a hammer. Here is a pickaxe for you to get the ore.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich kann dir helfen falls du Schmied werden willst, hol mir aber erstma 10 Brocken Kohle sowie 10 Klumpen Eisenerz und nen Hammer nich zu vergessen. Hier noch die Spitzhacke zum abbauen des Erzes.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("smith");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addResponse("I can help ya if ya wanna become a smith, but first bring me 10 lumps of coal as well as 10 chunks of iron ore, and don't forget to bring a hammer. Here is a pickaxe for you to get the ore.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schmied");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addResponse("Ich kann dir helfen, falls du Schmied werden willst, dafür solltest du mir aber erstma 10 Brocken Kohle sowie 10 Klumpen Eisenerz bringen. Und hier eine Hacke um das Erz abzubauen.");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I want ya to get 10 lumps of coal and 10 chunks of iron ore, and don't forget the hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("10 Brocken Kohle und 10 Klumpen Eisenerz will ich das du holst, vergiss aber auch nicht den Hammer");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addResponse("Aye, 10 lumps of coal and 10 chunks of iron ore and a hammer, that's what I want.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addResponse("Aye, 10 Brocken Eisenerz, 10 Klumpen Kohle und nen Hammer is es wat ich haben will!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt."));
talkEntry:addResponse("Arr, gut gemacht. Jetzt schau mir gut zu, damit du auch wat lernst!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(23, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learned something."));
talkEntry:addResponse("Arr, good job. Now watch me, so that you actually learn something!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(23, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Arr, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nich helfen, ich sehe genau das du nich alles da hast wat ich haben wollte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arr, if you try to trick me, I won't help you. I see that this is not everything that I wanted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Aye, I have another task for ya. I need 15 copper ore, a new crucible, a fine smith hammer and 5 iron ingots!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Aye, hab wieder wat für dich zu tun. 15 Kupfererz, einen neuen Schmelztiegel, einen Feinschmiedehammer und 5 Eisenbarren brauch ich!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addResponse("Aye, I have another task for ya. I need 15 copper ore, a new crucible, a fine smith hammer and 5 iron ingots!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addResponse("Aye, hab wieder wat für dich zu tun. 15 Kupfererz, einen neuen Schmelztiegel, einen Feinschmiedehammer und 5 Eisenbarren brauch ich!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Leave me be for now, I wanna do my own smithing for a change. Come back later, alright?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Lass mich mal in Ruhe, will auch selber mal wat schmieden. Kannst ja später wieder kommen, nich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addResponse("Leave me be for now, I wanna do my own smithing for a change. Come back later, alright?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addResponse("Lass mich mal in Ruhe, will auch selber mal wat schmieden. Kannst ja später wieder kommen, nich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arr! You're supposed to bring me 15 copper ore, a crucible, a fine smith hammer and 5 iron ingots. Not that hard to memorize, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du sollst mir 15 Kupfererz, einen neuen Schmelztiegel, einen Feinschmiedehammer und 5 Eisenbarren bringen, is das so schwer zu merken,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addResponse("Arr! You're supposed to bring me 15 copper ore, a crucible, a fine smith hammer and 5 iron ingots. Not that hard to memorize, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addResponse("Du sollst mir 15 Kupfererz, einen neuen Schmelztiegel, einen Feinschmiedehammer und 5 Eisenbarren bringen, is das so schwer zu merken,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.item.item(2699, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt."));
talkEntry:addResponse("Sieht gut aus, alles da wat ich von dir verlangt hab, scheint als könnt aus dir doch nen richtiger Schmied werden.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2699, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(122, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.item.item(2699, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You have feel like you really learned something."));
talkEntry:addResponse("Looks good and it's even everything that I wanted ya to bring. Looks as if you could become a real smith after all.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2699, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(122, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.item.item(2699, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wie mir scheint, kann man sich nich auf dich verlassen. Oder du bist dümmer als du aussiehst, denn es is nich besonders schwer 15 Kupfererz, 5 Eisenbarren, einen Schmelztiegel und einen Feinschmiedehammer zu besorgen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.item.item(2699, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It seems you're not trustworthy after all, or maybe you're just dumber that ya look, because you didn't bring me the 15 copper ore, 5 iron ingots, a crucible and a fine smith hammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arr! You're quite good now. It's time to teach ya something real. Bring me 10 iron ingots, 10 copper ingots, 5 steel greaves and 4 pickaxes, then I'll show ya what a smith can do.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Du machst dich ganz gut. Nun wird es aber an der Zeit dir wat richtiges beizubringen. Bring mir zehn Eisenbarren, zehn Kupferbarren, fünf Stahlbeinschienen und vier Spitzhacken, dann siehst du selbst was ein Schmied so alles kann.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addResponse("Arr! You're quite good now. It's time to teach ya something real. Bring me 10 iron ingots, 10 copper ingots, 5 steel greaves and 4 pickaxes, then I'll show ya what a smith can do.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addResponse("Du machst dich ganz gut. Nun wird es aber an der Zeit dir wat richtiges beizubringen. Bring mir zehn Eisenbarren, zehn Goldbarren, fünf Kupferbarren und vier große Schwertgriffe, dann siehst du selbst was ein Schmied so alles kann.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Be gone, I have no time for ya right now since you didn't make any progress! Practice some more, then I'll show you how to smith some nice weapons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Verschwinde, ich hab grad keine Zeit und so wie du aussiehst, hast du eh keine Fortschritte gemacht! Übe mehr, dann zeig ich dir auch wie man ne nette Waffe schmiedet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addResponse("Be gone, I have no time for ya right now since you didn't make any progress! Practice some more, then I'll show you how to smith some nice weapons.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addResponse("Verschwinde, ich hab grad keine Zeit und so wie du aussiehst, hast du eh keine Fortschritte gemacht! Übe mehr, dann zeig ich dir auch wie man ne nette Waffe schmiedet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It's 10 iron ingots, 10 copper ingots, 5 steel greaves and 4 pickaxes I wanted from you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Es waren zehn Eisenbarren, zehn Kupferbarren, fünf Stahlbeinschienen und vier Spitzhacken die ich haben wollt, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addResponse("It's 10 iron ingots, 10 copper ingots, 5 steel greaves and 4 pickaxes I wanted from you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addResponse("Es waren zehn Eisenbarren, zehn Kupferbarren, fünf Stahlbeinschienen und vier Spitzhacken die ich haben wollt, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", ">", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2172, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt."));
talkEntry:addResponse("Endlich biste wieder zurück, ich hatte mir schon Sorgen gemacht. Nun pass aber auf wie ich die Erze kombiniere.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2763, 4));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2550, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2172, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", ">", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2172, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learned something."));
talkEntry:addResponse("Finally, you're back, I started to worry about ya. Now watch how I combine these materials.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2763, 4));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2550, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2172, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "<", 4));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2172, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wenn du nix lernen willst, dann mach das du verschwindest! Wenn du nichtmal die kleinsten Aufträge erfüllen willst, wie willste da nen guter Schmied werden?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2763, "all", "<", 4));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2172, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If ya don't wanna learn anything, just go. Ya can't even complete the simplest task! How do ya think you'll become a good smith then?!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 80));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Never thought I'd see your face again. But glad that you ask. I need 15 copper ingots, 10 war hammer, 10 rapier and 2 steel plate.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 80));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ich dich mal wieder zu Gesicht bekomme hätte ich nich gedacht. Aber jut das du fragst. 15 Kupferbarren, 10 Kriegshämmer, 10 Degen und 2 Stahlharnische bräuchte ich von dir.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 80));
talkEntry:addResponse("Never thought I'd see your face again. But glad that you ask. I need 15 copper ingots, 10 war hammer, 10 rapier and 2 steel plate.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 80));
talkEntry:addResponse("Das ich dich mal wieder zu Gesicht bekomme hätte ich nich gedacht. Aber jut das du fragst. 15 Kupferbarren, 10 Kriegshämmer, 10 Degen und 2 Stahlharnische bräuchte ich von dir.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Come back later, I've no time for ya at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Komm später wieder, ich hab im Moment keine Zeit für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addResponse("Come back later, I've no time for ya at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "smithing", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addResponse("Komm später wieder, ich hab im Moment keine Zeit für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You were supposed to bring me 15 copper ingots, 10 war hammer, 10 rapier and 2 steel plate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 15 Kupferbarren, 10 Kriegshämmer, 10 Degen und 2 Stahlharnische.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addResponse("You were supposed to bring me 15 copper ingots, 10 war hammer, 10 rapier and 2 steel plate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 15 Kupferbarren, 10 Kriegshämmer, 10 Degen und 2 Stahlharnische.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(2675, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2364, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt."));
talkEntry:addResponse("Sehr gut gemacht, ich wusste man kann sich auf dich verlassen. Nun sperr die Augen weit auf und beobachte wie ich dat Schwert schmiede!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2550, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2675, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(226, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2364, 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(2675, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2364, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learned something."));
talkEntry:addResponse("Good job. Now that I know I can count on you, watch closely here and see how this sword is made.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "smithing", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2550, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2675, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(226, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2364, 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2675, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2364, "all", "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nay, ick red mit dir kein Wort mehr bist du mir nicht das bringst, was ich von dir haben wollte!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2675, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2364, "all", "<", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nah, I won't talk to ya until ya bring me the things I asked you for.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nah, you learned enough from me. You have to figure out everything else for yourself . That's what a good smith is all about.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nay, ich glaub du hast genug von mir gelernt. Alles weitere musst du jetzt selber herausfinden, das macht einen guten Schmied aus!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addResponse("Nah, you learned enough from me. You have to figure out everything else for yourself. That's what a good smith is all about.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addResponse("Nay, ich glaub du hast genug von mir gelernt. Alles weitere musst du jetzt selber herausfinden, das macht einen guten Schmied aus!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("You ask what my profession is? I'm a smith, the best even.");
talkEntry:addResponse("I'm a smith and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Du fragst nach meinem Beruf? Ich bin Schmied, einer der besten sogar.");
talkEntry:addResponse("Von Beruf bin ich Schmied und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER1");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER2");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER3");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER4");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YOURTRIGGER5");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER1");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER2");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER3");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER4");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DEINTRIGGER5");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Don't know him, who's that supposed to be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Kenn ich nicht, wer soll denn das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don't know him, who's that supposed to be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Kenn ich nicht, wer soll denn das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick is the city full of them mage-folk right? Don't like them much.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist die Stadt mit diesem Magierpack, stimmts? Mag die nicht besonders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, nothing much to say. He's the leader of Galmair and does a really good job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Nun, gibt nicht viel zu sagen. Er ist der Anführer von Galmair und macht seine Arbeit sehr gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Fine town, really fine town you know. But only if ya have enough silver coins in your pocket you know what I mean?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Tolle Stadt, wirklich tolle Stadt weißt du. Aber nur wenn du genug Silbermünzen in der Tasche hast, weißt du was ich meine?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Don't know her personally but wouldn't mind if she really is as good looking as they say. Hear she's a harsh leader though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Kenn die nicht persönlich aber würde mich nicht weigern wenn sie wirklich so gut aussieht wie man sagt. Man sagt auch das sie eine taffe Herrscherin is.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don't know her personally but wouldn't mind if she really is as good looking as they say. Hear she's a harsh leader though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Kenn die nicht persönlich aber würde mich nicht weigern wenn sie wirklich so gut aussieht wie man sagt. Man sagt auch das sie eine taffe Herrscherin is.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, a little hot there but the queen is supposed to be good looking, wouldn't mind if she came here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Nun, ein bisschen warm dort, aber die Königin soll gutaussehen. Würde nichts dagegen haben, wenn sie mal herkommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Do I look like a merchant? I don't think so!");
talkEntry:addResponse("Nah, I don't buy anything and I won't ever sell something to you!");
talkEntry:addResponse("Maybe some other time, not today.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Sehe ich aus wie ein Händler, ich denke nicht!");
talkEntry:addResponse("Nay, ich kauf nix und verkaufen tu ich erst recht nix an dich!");
talkEntry:addResponse("Ein ander mal vielleicht, heute nich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC first name>");
talkEntry:addTrigger("<NPC last name>");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC-Vorname>");
talkEntry:addTrigger("<NPC-Nachname>");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Aye, then go and collect those things I asked you for.");
talkEntry:addResponse("If ya say so.");
talkEntry:addResponse("Alright, have fun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Aye, dann mach dich auf dem Weg und sammel was ich von dir wollte!");
talkEntry:addResponse("Na wenn du meinst");
talkEntry:addResponse("Is gut, viel Vergnügen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What did ya say? I hope I didn't hear ya correctly!");
talkEntry:addResponse("You say no... no to me, who do ya think your speaking to?");
talkEntry:addResponse("With that attitude, ya won't become a good smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Wat sachste, ich hoffe ich habe mich verhört?!");
talkEntry:addResponse("Du sagst Nein...nein zu mir, wat denkst du mit wem du sprichst!");
talkEntry:addResponse("Dann nich, so wird nie was aus dir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Eh..what did you just say about my mother?");
talkEntry:addResponse("What are you jabbering about?");
talkEntry:addResponse("Nah, I don't wanna buy that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Eh..wat hast du grad über meine Mutter gesagt?");
talkEntry:addResponse("Wat quasselst du da?");
talkEntry:addResponse("Nay, ich will dat nich kaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht sich über seinen langen Bart.", "#me untangles his long beard.");
talkingNPC:addCycleText("#me blickt sich mistrauisch um und kratzt sich anschließend breit grinsend am Hintern.", "#me looks around suspiciously then scratches his buttocks and grins broadly.");
talkingNPC:addCycleText("#me nimmt eine Bierflasche aus seiner Tasche und trinkt einen Schluck", "#me pulls a bottle of beer from his bag and takes a swig.");
talkingNPC:addCycleText("#me wischt sich den Schweiß von der Stirn, als er seine Arbeit unterbricht.", "#me interrupts his work to wipe the sweat off his forehead.");
talkingNPC:addCycleText("#me brummt leise etwas in seinen Bart.", "#me grumbles something into his beard.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein in Fällen gekleideter Zwerg, stolz trägt er seinen prächtigen Bart zur Schau.", "A proud looking dwarf, dressed in fur. His beard is enormous.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 810);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2123);
mainNPC:setEquipment(10, 697);
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