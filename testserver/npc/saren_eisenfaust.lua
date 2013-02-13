--------------------------------------------------------------------------------
-- NPC Name: Saren Eisenfaust                                         Galmair --
-- NPC Job:  stuff for skill                                                  --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  333, 258, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Someone                                                          --
--           & Rincewind                                                      --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 333, 258, 0, 4, 'Saren Eisenfaust', 'npc.saren_eisenfaust', 0, 3, 4, 255, 113, 3, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.talk")
module("npc.saren_eisenfaust", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the smith Saren Eisenfaust. Keywords: pickaxe, mine, adventure, tell something, Sevenhill.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist der Schmied Saren Eisenfaust. Schlüsselwörter: Aufgaben, Mine, Spitzhacke, Erzähl was, Siebenberg.");
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
talkEntry:addResponse("Good day, what do ya want?");
talkEntry:addResponse("Irmorom with ya, do ya need anything?");
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
talkEntry:addResponse("Tach auch, wat gibts?");
talkEntry:addResponse("Irmorom zum Gruße, brauchst du wat?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
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
talkEntry:addResponse("I'm called Saren, Saren Eisenfaust, and what's your name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
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
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkEntry:addResponse("I can help ya if ya wanna become a smith, but first bring me 10 lumps of coal, along with 10 chunks of iron ore, and don't forget to bring a hammer. Here is a pickaxe for you to get the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkEntry:addResponse("Ich kann dir helfen falls du Schmied werden willst, hol mir aber erstma 10 Brocken Kohle sowie 10 Klumpen Eisenerz und nen Hammer nich zu vergessen. Hier noch die Spitzhacke zum abbauen des Erzes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("smith");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkEntry:addResponse("I can help ya if ya wanna become a smith, but first bring me 10 lumps of coal, along with 10 chunks of iron ore, and don't forget to bring a hammer. Here is a pickaxe for you to get the ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Schmied");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.item.item(2763, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 1));
talkEntry:addResponse("Ich kann dir helfen, falls du Schmied werden willst, dafür solltest du mir aber erstma 10 Brocken Kohle sowie 10 Klumpen Eisenerz und nen Hammer bringen. Und hier eine Hacke um das Erz abzubauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "+", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("Arr, gut gemacht!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(23, 1, nil));
--talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(23, 1, nil));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 2));
talkEntry:addResponse("Arr, well done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(23, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Arr, gut gemacht. Jetzt schau mir gut zu, damit du auch wat lernst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(22, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(23, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Arr, good job. Now watch me, so that you actually learn something!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nich helfen. Ich wollte 10 Brocken Kohle, 10 Klumpen Eisenerz und einen Hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, if you try to trick me, I won't help you. I want 10 lumps of coal, 10 chunks of iron ore and a hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nich helfen. Ich wollte 10 Brocken Kohle, 10 Klumpen Eisenerz und einen Hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(22, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, if you try to trick me, I won't help you. I want 10 lumps of coal, 10 chunks of iron ore and a hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nich helfen. Ich wollte 10 Brocken Kohle, 10 Klumpen Eisenerz und einen Hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(23, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, if you try to trick me, I won't help you. I want 10 lumps of coal, 10 chunks of iron ore and a hammer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkEntry:addResponse("Aye, I have a task for ya if you are interested. I need 15 copper ore, new crucible-pincers, a fine smith hammer and 5 iron ingots!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkEntry:addResponse("Aye, hab wat für dich zu tun wenn du willst. 15 Kupfererz, eine neue Tiegelzange, einen Feinschmiedehammer und 5 Eisenbarren brauch ich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkEntry:addResponse("Aye, I have a task for ya if you are interested. I need 15 copper ore, new crucible-pincers, a fine smith hammer and 5 iron ingots!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 3));
talkEntry:addResponse("Aye, hab wat für dich zu tun wenn du willst. 15 Kupfererz, eine neue Tiegelzange, einen Feinschmiedehammer und 5 Eisenbarren brauch ich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(2751, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2751, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(122, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sieht gut aus, alles da wat ich von dir verlangt hab, gut gemacht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(2751, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2751, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(122, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Looks good, it's everything that I wanted ya to bring me, well done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(2751, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2751, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(122, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sieht gut aus, alles da wat ich von dir verlangt hab, scheint als könnt aus dir nen richtiger Schmied werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(2751, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2536, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2751, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(122, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Looks good, it's everything that I wanted ya to bring. Looks as if you could become a real smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Kupfererz, eine neue Tiegelzange, einen Feinschmiedehammer und 5 Eisenbarren bringen, is das so schwer zu merken,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2536, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr! You're supposed to bring me 15 copper ore, crucible-pincers, a fine smith hammer and 5 iron ingots. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Kupfererz, eine neue Tiegelzange, einen Feinschmiedehammer und 5 Eisenbarren bringen, is das so schwer zu merken,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr! You're supposed to bring me 15 copper ore, crucible-pincers, a fine smith hammer and 5 iron ingots. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2751, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Kupfererz, eine neue Tiegelzange, einen Feinschmiedehammer und 5 Eisenbarren bringen, is das so schwer zu merken,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2751, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr! You're supposed to bring me 15 copper ore, crucible-pincers, a fine smith hammer and 5 iron ingots. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Kupfererz, eine neue Tiegelzange, einen Feinschmiedehammer und 5 Eisenbarren bringen, is das so schwer zu merken,eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(122, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr! You're supposed to bring me 15 copper ore, crucible-pincers, a fine smith hammer and 5 iron ingots. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkEntry:addResponse("Aye, I have a task for ya if you are interested. Bring me 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkEntry:addResponse("Aye, hab wat für dich zu tun wenn du willst. Bring mir 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkEntry:addResponse("Aye, I have a task for ya if you are interested. Bring me 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 5));
talkEntry:addResponse("Aye, hab wat für dich zu tun wenn du willst. Bring mir 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2584, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(236, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(529, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2584, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(236, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(529, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Endlich biste wieder zurück, ich hatte mir schon Sorgen gemacht. Danke für deine Hilfe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2584, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(236, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(529, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2584, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(236, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(529, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Finally, you're back, I was starting to worry about ya. Thanks for your help!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2584, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(236, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(529, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2584, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(236, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(529, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Endlich biste wieder zurück, ich hatte mir schon Sorgen gemacht. Nun pass aber auf wie ich die Erze kombiniere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2584, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(236, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(529, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2584, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2535, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(236, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(529, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Finally, you're back, I was starting to worry about ya. Now watch how I combine these materials.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2584, "all", "<", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse(" Arr, da fehlt aber noch was. Ick wollte 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2584, "all", "<", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, there are still some things missing. You are supposed to bring me 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse(" Arr, da fehlt aber noch was. Ick wollte 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2535, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, there are still some things missing. You are supposed to bring me 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(236, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse(" Arr, da fehlt aber noch was. Ick wollte 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(236, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, there are still some things missing. You are supposed to bring me 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(529, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse(" Arr, da fehlt aber noch was. Ick wollte 10 Eisenbarren, 10 Goldbarren, 5 zwergische Metalhandschuhe und 4 Schwertgriffe, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(529, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Arr, there are still some things missing. You are supposed to bring me 10 iron ingots, 10 gold ingots, 5 dwarven metal gloves and 4 sword handles, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkEntry:addResponse("Arr, you are looking for some work? Aye, I can help you with that! I need 15 copper ingots, 10 war hammers, 10 gilded battle axes and 2 Salkamaerian armours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkEntry:addResponse("Arr, du willst ne Aufgabe? Aye, damit kann ich helfen! Ick brauche 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkEntry:addResponse("Arr, you are looking for some work? Aye, I can help you with that! I need 15 copper ingots, 10 war hammers, 10 gilded battle axes and 2 Salkamaerian armours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 7));
talkEntry:addResponse("Arr, du willst ne Aufgabe? Aye, damit kann ich helfen! Ick brauche 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(124, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(2389, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2550, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(124, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(226, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2389, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sehr gut gemacht, ich wusste man kann sich auf dich verlassen. Nun sperr die Augen weit auf und beobachte wie ich dat hier schmiede!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(124, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(2389, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.smithing, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2550, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(124, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(226, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2389, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(81, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Well done. Now that I know I can count on you, watch closely here and see how this is supposed to be done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 15 copper ingots, 10 war hammers, 10 gilded battle axes and 2 Salkamaerian armours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2550, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(124, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 15 copper ingots, 10 war hammers, 10 gilded battle axes and 2 Salkamaerian armours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(124, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 15 copper ingots, 10 war hammers, 10 gilded battle axes and 2 Salkamaerian armours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(226, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2389, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 15 copper ingots, 10 war hammers, 10 gilded battle axes and 2 Salkamaerian armours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2389, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 15 Kupferbarren, 10 Kriegshämmer, 10 vergoldete Kriegsäxte und 2 salkamaerische Rüstungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nah, I don't have anything else for you to do. Leave me alone now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nay, Ick hab nix mehr für dich zu tun. Lass mich nun in Ruhe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Nah, I don't have anything else for you to do. Leave me alone now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Nay, Ick hab nix mehr für dich zu tun. Lass mich nun in Ruhe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Arr? I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.smithing, "=<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(81, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Arr? Ich hab nix für dich zu tun, du kommst nicht aus Galmair!");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("You ask what my profession is? I'm a smith, the best even.");
talkEntry:addResponse("I'm a smith and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Du fragst nach meinem Beruf? Ich bin Schmied, einer der besten sogar.");
talkEntry:addResponse("Von Beruf bin ich Schmied und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith! Aye. My cousin fourth removed lived there, down in Silverbrand, for a while. I say, Galmair is the better choice to gain wealth for your clan, though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith! Aye. Mein Cousin vierten Grades lebte ne Weile unten in Silverbrand. Aber ich sag, Galmair iss die bessere Wahl, wenn du Wohlstand anhäufn wills'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Aye. It's a pleasure.");
talkEntry:addResponse("So, so? Well, then. How may I help you?");
talkEntry:addResponse("By Irmorom! So you would like to become a smith, or what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Aye. Freut mich 'n Bekanntschaft zu machn.");
talkEntry:addResponse("Soso? Na, dann - wie kann ich dir helfn?");
talkEntry:addResponse("Bei Irmorom, is mir ne Freude.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addResponse("Dwarves don't drink shandy, they drink it pure! Halflings mix wine with fruit juices and call it a spritzer. Ha'ak! A real dwarf would rather shave his beard. Arr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silverbrand");
talkEntry:addResponse("Silverbrand? There's not much I know about. But my cousin lived there a while.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("smith");
talkEntry:addResponse("A smith needs a hammer, and ore of course. You can buy everything at the market. With coal, ore is smelted to make ingots. Ingots, you can smith with. Got it?");
talkEntry:addResponse("Search for an anvil to smith. The furnace you need to smelt ore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pickaxe");
talkEntry:addResponse("You can mine for ore with it, a merchant can surely sell ya one if you lose yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spitzhacke");
talkEntry:addResponse("Damit kannst du das Erz abbauen, ein Händler kann dir sicher eine verkaufen wenn du deine verlierst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schmied");
talkEntry:addResponse("N' Schmied braucht nen Hammer. Und Erz natürlich. Das kannste alles am Markt kaufn. Erz schmilzst du mit Kohle zu Barren. Und die schmiedet man.");
talkEntry:addResponse("Du musst zu einem Amboss gehn, wenn du schmieden willst. An der Esse kannst du Erz schmelzn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silberbrand");
talkEntry:addResponse("Silberbrand? Weiß ich nich viel von. Aber mein Cousin hat dort ne Weile gelebt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Ein Zwerg trinkt die Mischung pur! - Bei den Halblingen mischen sie Wein mit Früchte-saft. Das nennen sie Schorle oder Spritzer. Ha'ak! Aber ein echter Zwerg trinkt nicht's Gestrecktes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("mine");
talkEntry:addResponse("Arr, you can find the mine if you follow the path south of the workshop. That's the house with the brown roof!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Mine");
talkEntry:addResponse("Arr, du kannst die Mine finden wenn du der Straße südlich von der Werkstatt folgst. Dat is das Haus mit dem bräunlichen Dach!");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Fine town, really fine town you know... but only if ya have enough silver coins in your pocket, you know what I mean?");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Well, a little hot there but the Queen is supposed to be good looking, wouldn't mind if she came here.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Forgive me... I don't know about the human towns, but maybe you are interested to hear about the homeland of my clan, Sevenhill!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Vergebt mir... Ich weiß viel zu wenig über die Städte der Menschen. Aber villeicht interssiert ihr Euch dafür über meine Heimat zu sprechen, Siebenberg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Forgive me... I don't know about the human towns, but maybe you are interested to hear about the homeland of my clan, Sevenhill!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Vergebt mir... Ich weiß viel zu wenig über die Städte der Menschen. Aber villeicht interssiert ihr Euch dafür über meine Heimat zu sprechen, Siebenberg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Forgive me... I don't know about the human towns, but maybe you are interested to hear about the homeland of my clan, Sevenhill!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Vergebt mir... Ich weiß viel zu wenig über die Städte der Menschen. Aber villeicht interssiert ihr Euch dafür über meine Heimat zu sprechen, Siebenberg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sevenhill");
talkEntry:addResponse("'Tunnel pigs' can also be found in Sevenhill. This is not an insulting term for lazy miners, but rather refers to a very large, fat, and nearly naked type of rodent. This animal is well known at most dwarven settlements and is considered a delicacy.");
talkEntry:addResponse("Sevenhill, also known as Siebenberg, is one of the greatest dwarven mines and it's halls and wealth are legendary. The town is located in deep caverns under a range of seven mountains, but only dwarves know the exact location.");
talkEntry:addResponse(" Humans are not permitted in Sevenhill and only a few trusted lizardmen and elves have ever been welcomed into the city. Heavily armed dwarven squads guard every entrance.");
talkEntry:addResponse("Many of the city's exits end in many mountain valleys where crops and livestock are farmed. The infamous 'dwarven cheese' is also produced here; an incredibly strong smelling kind of cheese, highly thought of by dwarves, but completely unpalatable to humans, halflings and elves.");
talkEntry:addResponse("Sevenhill is home to seven dwarven clans. It is said that Irmorom blesses those dwarves who make a pilgrimage to all of the four sanctuaries, located under Sevenhill. Many famous dwarves, are said to have been there on pilgrimages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("siebenberg");
talkEntry:addResponse("'Tunnelschwein',  daß ist kein Schimpfnamen für faule Minenarbeiter, sondern ?n Nagetier. Erinnert an enorm große, fast nackte, fette Ratten. Dieses Tier ist in eigentlich unter allen Zwergen bekannt und oft delikat zubereitet.");
talkEntry:addResponse("Siebenberg ist die Heimat von sieben Zwergenklans. Es wird gesagt, dass ein Zwerg, der zu allen vier Heiligtümern Siebenbergs pilgert und dort zu Irmorom betet, von diesem gesegnet wird.");
talkEntry:addResponse("Siebenberg ist eine der größten bekannten Zwergenminen, ihre Hallen und deren Reichtum sind legendär. Die Stadt befindet sich in den tiefen Höhlen unter den Siebenhügelbergen, die genaue Lage ist nur Zwergen bekannt.");
talkEntry:addResponse("Menschen finden keinen Einlass nach Siebenberg und nur wenige Echsenmenschen oder Elfen ? von denen bekannt ist, dass sie nicht versuchen würden, glänzende Dinge aus kostbaren Verzierungen herauszubrechen.");
talkEntry:addResponse("Es werden  Ziegen gehalten, deren Milch hauptsächlich zum  bekannten Zwergenkäse verarbeitet wird! Eine besonders übelriechende Käsesorte, die von uns Zwergen sehr geschätzt wird, aber die anderen Völker scheinen ihn nicht besonders zu schätzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I follow Irmorom, the father of the dwarven kind and hallow of the crafters... and Brágon, whose flames melt the ores.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Irmorom.  Ich huldige dem Vater der Zwerge und Heiligem der Handwerker. Sowie Brágon, dessen Flammen die Metalle zum schmelzen bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("The flame of Brágon brings dragons their fire and warms the living, and it bends steel, by heating it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Die Flamme Brágons haucht nicht nur Drachen ihr Feuer ein, sondern wärmt die Völker und macht Stahl biegsam.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Smithing is the craft of the dwarves. Irmorom taught us a long time ago, that Brágons flame makes iron soft and malleable.");
talkEntry:addResponse("Irmorom, the godly crafter, told the dwarven folk how to smith and after hundreds of years they figured out how to put runes and gems into mighty weapons and armours.");
talkEntry:addResponse("Irmorom himself was the first smith. He liked the hardwoking dwarves most, so he gave them the ability to smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Das Schmieden ist das Handwerk des Zwergenvolkes, Irmorom hat uns lange vor allen anderen gelehrt, dass Brágons Flammen härtes Eisen biegsam und formbar machen.");
talkEntry:addResponse("Irmorom der göttliche Handwerker, lehrte einst den Zwergen das schmieden, und in hundert Jahr langer Geschichte sollten wir lernen Edelsteine und Runen in mächtigen Waffen und Rüstungen einzufassen.");
talkEntry:addResponse("Irmorom war der erste Schmied und da ihm die fliessigen Zwerge das liebste Volk waren vermachte er dieses Handwerk den Zwergen.");
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
talkEntry:addResponse("Do you know, Gremle Oxenlimb, my sister's husband? He affirms that he beat up a golem with his bare hands. Ga strak ja'ada! Such a fibbed tale.");
talkEntry:addResponse("They say Eygir Goldmalt brews the best beer, but I prefer Yeseult Bockbrew's.");
talkEntry:addResponse("Rustbeard Grimhilds cousin is a good friend of mine, but he can't bear even half a mug of beer. When drunk he sings bawdy songs and throws hatchets targeting young women's plaits.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Kennt ihr Gremle Ochsenschenkel, meinen Schwager? Er behauptet er würde einem Golem im Faustkampf besiegen. Ga strak ja'ada! So'ne erlogene Geschichte.");
talkEntry:addResponse("Es heißt Eygir Goldmalz braut das beste Bier, aber mir schmeckt das von Yseult Bockbräu viel besser. ");
talkEntry:addResponse("Rostbart Grimhilds-Vetter ist ein guter Bekannter von mir. Aber der verträgt kein Bier nicht. Hat der einen halben Humpen drin, fängt er an unflätig zu singen und mit Beilen nach den Zöpfen von jungn' Fraun zu werfn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Saren");
talkEntry:addTrigger("Eisenfaust");
talkEntry:addResponse("What's up?");
talkEntry:addResponse("Aye?");
talkEntry:addResponse("#me nods once and raises an eyebrow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Saren");
talkEntry:addTrigger("Eisenfaust");
talkEntry:addResponse("Aye?");
talkEntry:addResponse("Wat gibt's?");
talkEntry:addResponse("#me nickt dir zun und zieht eine Braue hoch.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Eh..what did you just say about my mother?");
talkEntry:addResponse("What are you jabbering about?");
talkEntry:addResponse("Nah, I don't wanna buy that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Eh..wat hast du grad über meine Mutter gesagt?");
talkEntry:addResponse("Wat quasselst du da?");
talkEntry:addResponse("Nay, ich will dat nich kaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht sich über seinen langen Bart.", "#me untangles his long beard.");
talkingNPC:addCycleText("#me blickt sich mistrauisch um und kratzt sich anschließend breit grinsend am Hintern.", "#me looks around suspiciously then scratches his buttocks and grins broadly.");
talkingNPC:addCycleText("#me nimmt eine Bierflasche aus seiner Tasche und trinkt einen Schluck", "#me pulls a bottle of beer from his bag and takes a swig.");
talkingNPC:addCycleText("#me wischt sich mit dem Handrücken über die Stirn.", "#me wipes with his hand over his forehead.");
talkingNPC:addCycleText("#me brummt leise etwas in seinen Bart.", "#me grumbles something into his beard.");
talkingNPC:addCycleText("#me streicht mit zusammengeniffenen Augen über sein Hemd aus Pferdehaar, etwas Staub löst sich daraus und schwebt zu Boden.", "#me pats his shirt made of horse-hair. Some dust gets released and sinks to the ground.");
talkingNPC:addCycleText("#me grinst breit, ein goldener Zahn blitzt hervor.", "#me shows a broad grin, a golden tooth is shown for a second.");
talkingNPC:addCycleText("#me pfeift die Melodie eines alten Bergwerkliedes.", "#me whistles the tune of an old miner's song.");
talkingNPC:addCycleText("#me kartzt sich an der knubbeligen Nase.", "#me scratches his knobby nose.");
talkingNPC:addCycleText("#me blickt mit zusammengeniffenen Augen in den Himmel.", "#me glances to the sky with narrowed eyes.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein in Fällen gekleideter Zwerg, stolz trägt er seinen prächtigen Bart zur Schau.", "A proud looking dwarf, dressed in fur has an enormous beard.");
mainNPC:setUseMessage("Fass mich nicht an!", "Don't touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 810);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2113);
mainNPC:setEquipment(10, 697);
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