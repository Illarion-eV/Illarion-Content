--------------------------------------------------------------------------------
-- NPC Name: Truciolo Pialla                                          Galmair --
-- NPC Job:  stuff for skill                                                  --
--                                                                            --
-- NPC Race: elf                        NPC Position:  338, 268, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Baylamon & envi                                                  --
--                                                Illarion easyNPC Editor 1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 338, 268, 0, 6, 'Truciolo Pialla', 'npc.truciolo_pialla', 0, 7, 0, 66, 55, 0, 255, 222, 163);
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
module("npc.truciolo_pialla", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the carver Truciolo Pialla. Keywords: task, wood, adventure, tell something, forest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist der Schnitzer Truciolo Pialla. Schlüsselwörter: Aufgaben, Holz, Messer, Erzähl was, Wald.");
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
talkEntry:addResponse("Greeting, what do you want?");
talkEntry:addResponse("The five with you, may I help you?");
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
talkEntry:addResponse("Grüßt Euch.");
talkEntry:addResponse("Die Fünf mit Euch, kann ich Euch irgendwie helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("What do you want? Oh sorry, Greetings!");
talkEntry:addResponse("Ja ja.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Was? Oh entschuldigt, natürlich. Grüßt Euch!");
talkEntry:addResponse("Ja ja.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("By by, take care.");
talkEntry:addResponse("The five with you!");
talkEntry:addResponse("Until next time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Die Fünf mit dir!");
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
talkEntry:addResponse("By by, take care.");
talkEntry:addResponse("The five with you!");
talkEntry:addResponse("Until next time!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Die Fünf mit dir!");
talkEntry:addResponse("Man sieht sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Can't say anything's bothering me and you?");
talkEntry:addResponse("So-so, but I'm fine right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich kann nicht klagen und du?");
talkEntry:addResponse("Ganz gut und selbst?");
talkEntry:addResponse("Mal so, mal so, aber gerade geht es mir ganz gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Truciolo and who are you?");
talkEntry:addResponse("I'm called Truciolo, and what's your name?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der Schnitzer Truciolo und wer bist du?");
talkEntry:addResponse("Man nennt mich Truciolo und wie nennt man dich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 1));
talkEntry:addResponse("I could help you if you want to become a carver as well, but first bring me 10 pieces applewood, along with 10 boughs, and don't forget to bring a saw. Here is a hatchet for you to get the wood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 1));
talkEntry:addResponse("Ich kann dir helfen falls du Holzschnitzer werden willst, Aber zuerst brauchen wir 10 Scheite Apfelholz sowie 10 Äste. Und natürlich sollten wir eine Säge haben. Hier hast du ein Beil für das Holz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("smith");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 1));
talkEntry:addResponse("I could help you if you want to become a carver as well, but first bring me 10 pieces applewood, along with 10 boughs, and don't forget to bring a saw. Here is a hatchet for you to get the wood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Schmied");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 1));
talkEntry:addResponse("Ich kann dir helfen falls du Holzschnitzer werden willst, Aber zuerst brauchen wir 10 Scheite Apfelholz sowie 10 Äste. Und natürlich sollten wir eine Säge haben. Hier hast du ein Beil für das Holz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(56, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(56, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(9, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sehr schön, gut gemacht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(56, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(56, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(9, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Thank you, well done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(56, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(56, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(9, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sehr schön, gut gemacht. Jetzt schau mir gut zu, damit du auch etwas lernst!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(56, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2560, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(56, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(9, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Well, good job. Now watch me, so that you actually learn something!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Sorry, if you try to trick me, I won't help you. I want 10 pieces of apple wood, 10 boughs and a saw!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(2560, "all", "<", 10, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na na, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nicht helfen. Ich wollte 10 Scheite Apfelholz, 10 Äste und eine Säge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(56, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Sorry, if you try to trick me, I won't help you. I want 10 pieces of apple wood, 10 boughs and a saw!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(56, "all", "<", 10, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na na, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nicht helfen. Ich wollte 10 Scheite Apfelholz, 10 Äste und eine Säge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Sorry, if you try to trick me, I won't help you. I want 10 pieces of apple wood, 10 boughs and a saw!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(9, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na na, wenn du dir mit mir einen Spaß erlauben willst, werd ich dir nicht helfen. Ich wollte 10 Scheite Apfelholz, 10 Äste und eine Säge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 3));
talkEntry:addResponse("Sure, I have a task for you if you are interested. I need 15 naldor boards, new carving tools, a cooking spoon and 5 conifer woods!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 3));
talkEntry:addResponse("Sicher hätte ich etwas für dich zu tun wenn du willst. 15 Naldorbretter, eine Satz neuer Schnitzmesser, einen Kochlöffel und 5 Nadelholzscheite brauch ich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 3));
talkEntry:addResponse("Sure, I have a task for you if you are interested. I need 15 naldor wooden boards, new carving tools, a cooking spoon and 5 conifer woods!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 3));
talkEntry:addResponse("Sicher hätte ich etwas für dich zu tun wenn du willst. 15 Naldorbretter, eine Satz neuer Schnitzmesser, einen Kochlöffel und 5 Nadelholzscheite brauch ich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(546, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(227, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2752, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Looks good, it's everything that I wanted you to bring me, well done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(546, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(227, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2752, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sieht gut aus, Alles was ich brauche ist dabei. Gut gemacht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(546, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(227, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2752, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Looks good. It's everything that I wanted you to bring. Looks as if you could really feel wood.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", ">", 14, nil));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(546, 15, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(3, 5, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(227, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2752, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sehr schön. Alles da was ich von dir verlangt hab. Du scheinst Holz gut zu fühlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", "<", 15, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Are you sure? You're supposed to bring me 15 naldor boards, new carving tools, a cooking spoon and 5 conifer woods. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", "<", 15, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Naldorbretter, eine Satz neuer Schnitzmesser, einen Kochlöffel und 5 Nadelholzscheite bringen. Das kann doch nicht so schwer zu merken sein oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Are you sure? You're supposed to bring me 15 naldor boards, new carving tools, a cooking spoon and 5 conifer woods. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(3, "all", "<", 5, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Naldorbretter, eine Satz neuer Schnitzmesser, einen Kochlöffel und 5 Nadelholzscheite bringen. Das kann doch nicht so schwer zu merken sein oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Are you sure? You're supposed to bring me 15 naldor boards, new carving tools, a cooking spoon and 5 conifer woods. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Naldorbretter, eine Satz neuer Schnitzmesser, einen Kochlöffel und 5 Nadelholzscheite bringen. Das kann doch nicht so schwer zu merken sein oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", "<", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Are you sure? You're supposed to bring me 15 naldor boards, new carving tools, a cooking spoon and 5 conifer woods. Not that hard to memorise, is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2752, "all", "<", 1, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du sollst mir 15 Naldorbretter, eine Satz neuer Schnitzmesser, einen Kochlöffel und 5 Nadelholzscheite bringen. Das kann doch nicht so schwer zu merken sein oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 5));
talkEntry:addResponse("Sure, I have another task for you if you are interested. Bring me 10 cherry wood boards, 10 wooden plates, 5 skull staffs and 4 large handles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 5));
talkEntry:addResponse("Sehr gerne. Bring mir 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 5));
talkEntry:addResponse("Sure, I have another task for you if you are interested. Bring me 10 cherry wood boards, 10 wooden plates, 5 skull staffs and 4 large handles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 5));
talkEntry:addResponse("Sehr gerne. Bring mir 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2544, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(545, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(39, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2544, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(545, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(39, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Finally, you're back. Thanks for your help! But next time take more care about the skulls. They do not looks like real ones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2544, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(545, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(39, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2544, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(545, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(39, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Da bist du ja endlich. Aber ehrlich, diese Totenköpfe verdienen noch etwas mehr Strenge. Aber für's Erste sollte es reichen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2544, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(545, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(39, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2544, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(545, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(39, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Finally, you're back, I was starting to worry about you. Now watch how I drill the hole.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2544, "all", ">", 3, nil));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(545, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(39, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2544, 4, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2952, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(545, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(39, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Da bist du ja endlich. Ich hatte mir schon Sorgen gemacht. Nun pass aber auf wie man die Löcher richtig bohrt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2544, "all", "<", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Nun, there are still some things missing. You are supposed to bring me 10 cherry wood boards, 10 wooden plates, 5 skull staffs and 4 large handles");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2544, "all", "<", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na, fehlt da nicht noch was? Ich sagte 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Nun, there are still some things missing. You are supposed to bring me 10 cherry wood boards, 10 wooden plates, 5 skull staffs and 4 large handles");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2952, "all", "<", 10, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na, fehlt da nicht noch was? Ich sagte 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(545, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Nun, there are still some things missing. You are supposed to bring me 10 cherry wood boards, 10 wooden plates, 5 skull staffs and 4 large handles");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(545, "all", "<", 10, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na, fehlt da nicht noch was? Ich sagte 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(39, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Nun, there are still some things missing. You are supposed to bring me 10 cherry wood boards, 10 wooden plates, 5 skull staffs and 4 large handles");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(39, "all", "<", 5, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Na, fehlt da nicht noch was? Ich sagte 10 Kirschholzbretter, 10 Holzteller, 5 Schädelstäbe und 4 große Griffe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 7));
talkEntry:addResponse("You are looking for some more work? I could need help! I need 150 arrows, 10 buckets, 10 harps and 2 wands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 7));
talkEntry:addResponse("Du suchst noch eine Aufgabe? Damit kann ich helfen! Ich brauche 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 7));
talkEntry:addResponse("You are looking for some more work? I could need help! I need 150 arrows, 10 buckets, 10 harps and 2 wands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 7));
talkEntry:addResponse("Du suchst noch eine Aufgabe? Damit kann ich helfen! Ich brauche 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", ">", 149, nil));
talkEntry:addCondition(npc.base.condition.item.item(332, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(64, 150, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(332, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(323, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Well done, thank you very much!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", ">", 149, nil));
talkEntry:addCondition(npc.base.condition.item.item(332, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(64, 150, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(332, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(323, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sehr gut gemacht, ich wusste man kann sich auf dich verlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", ">", 149, nil));
talkEntry:addCondition(npc.base.condition.item.item(332, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished!] You feel like you really learnt something. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(64, 150, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(332, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(323, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Well done. Now that I know I can count on you, watch closely here and see how this is supposed to be done!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "<", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", ">", 149, nil));
talkEntry:addCondition(npc.base.condition.item.item(332, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest erfüllt!] Du hast das Gefühl als hättest du was dazu gelernt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.carpentry, "+", 2));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(64, 150, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(332, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 10, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(323, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(670, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Sehr gut gemacht, ich wusste man kann sich auf dich verlassen. Nun sperr die Augen weit auf und beobachte wie ich dat hier schmiede!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", "<", 150, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 150 arrows, 10 buckets, 10 harps and 2 wands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(64, "all", "<", 150, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(332, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 150 arrows, 10 buckets, 10 harps and 2 wands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(332, "all", "<", 10, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 150 arrows, 10 buckets, 10 harps and 2 wands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "<", 10, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You were supposed to bring me 150 arrows, 10 buckets, 10 harps and 2 wands.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(323, "all", "<", 2, nil));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Die Sachen die du mir bringen solltest waren 150 Pfeile, 10 Eimer, 10 Harfen und 2 Zauberstäbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I must sorry, I don't have anything else for you to do. Leave me alone now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Leider nein, ich hab nichts mehr für dich zu tun. Lass mich nun in Ruhe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I must sorry, I don't have anything else for you to do. Leave me alone now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Leider nein, ich hab nichts mehr für dich zu tun. Lass mich nun in Ruhe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Sorry? I don't have anything for you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wie bitte? Ich habe nichts für dich zu tun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Sorry? I don't have anything for you to do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Wie bitte? Ich habe nichts für dich zu tun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("No! I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nein! Ich habe nichts für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("No! I don't have anything for you to do, you are not from Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(670, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Nein! Ich habe nichts für dich zu tun, du kommst nicht aus Galmair!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Sorry? I don't have anything for you to do, leave me alone now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, ">", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wie bitte? Ich habe nichts mehr für dich zu tun, lass mich in Ruhe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, ">", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Sorry? I don't have anything for you to do, leave me alone now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.carpentry, "=>", 80));
talkEntry:addCondition(npc.base.condition.quest.quest(670, ">", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Wie bitte? Ich habe nichts mehr für dich zu tun, lass mich in Ruhe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("You ask what my profession is? I'm a carver, for sure the best in town.");
talkEntry:addResponse("I'm a carver and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Du fragst nach meinem Beruf? Ich bin Holzschnitzer, einer der besten in der Stadt.");
talkEntry:addResponse("Von Beruf bin ich Holzschnitzer und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("You ask what my profession is? I'm a carver, for sure the best in town.");
talkEntry:addResponse("I'm a carver and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Du fragst nach meinem Beruf? Ich bin Holzschnitzer, einer der besten in der Stadt.");
talkEntry:addResponse("Von Beruf bin ich Holzschnitzer und du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? Never heard about. Where shall it be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? Nie gehört, wo soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I see. It's a pleasure.");
talkEntry:addResponse("So, so? Well, then. How may I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Aha. Freut mich eure Bekanntschaft zu machn.");
talkEntry:addResponse("Soso? Na, dann - wie kann ich dir helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarv");
talkEntry:addResponse("This is the town of dwarves. But dwarves have no real feeling for wood. A real dwarf works in the smithy or the mines and by the wooden things he need.,");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("elf");
talkEntry:addResponse("Nobody else made ever fine wooden items. And you know, each famous dwarven sword has a handle, made by elves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elve");
talkEntry:addResponse("Nobody else made ever fine wooden items. And you know, each famous dwarven sword has a handle, made by elves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("forest");
talkEntry:addResponse("I love the forest, even if there live quite dangerous monsters. But I love a warm and safe bed as well. Sleeping in trees is no mine");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("smith");
talkEntry:addResponse("A smith needs a hammer, and handles course. He can by everything at the market. Or he ask a carver.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("carver");
talkEntry:addResponse("A carver needs a saw, carving tools and a slicer, and wood of course. Saw the wood to boards. There is a workbench in the workshop. Got it?");
talkEntry:addResponse("Search for the workbench to start. There is one in the workshop.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hatchet");
talkEntry:addResponse("You can cut any tree with it, a merchant can surely sell you one if you lose yours.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beil");
talkEntry:addResponse("Damit kannst du Bäume fällen und an Holz kommen, ein Händler kann dir sicher eine verkaufen wenn du deine verlierst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schnitzer");
talkEntry:addResponse("Ein Holzschnitzer braucht eine Säge, Schnitzmesser und einen Hobel. Und Holz natürlich. Das kann man alles am Markt kaufeSägst du zu Brettern. Und aus denen werden dann die tollsten Dinge.");
talkEntry:addResponse("Du musst zu einer Werkbank gehen, wenn du schnitzen willst. Du findest eine in der Werkstatt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wald");
talkEntry:addResponse("Ich liebe die Stille der Wälder. Aber hier gibt es so viele Monster. Und ich habe auch gerne ein trockenes und warmes Bett.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Ja Galmair ist die Stadt der Zwerge. Aber ein echter Zwerg arbeitet in den Minen oder in der Schmiede und kauft bei uns alle Holzwaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addResponse("Niemand außer uns Elfen stellt so schöne hölzerne Dinge her. Sogar jedes berühmte Zwergenschwert hat einen Griff, der von Elfenhand gefertigt wurde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tree");
talkEntry:addResponse("It depends on what wood you need! You can find every kind of tree right before the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baum");
talkEntry:addTrigger("Bäum");
talkEntry:addResponse("Du findest jede beliebige Baumart gleich vor der Stadt. Such dir die aus, deren Holz du gerade benötigst.");
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
talkEntry:addResponse("What would you say? Why do I carve this statuette here with his face currently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Nun, gibt nicht viel zu sagen. Er ist der Anführer von Galmair und macht seine Arbeit sehr gut.");
talkEntry:addResponse("Ja was meinst du, warum ich diese Statue mit seinem Antlitz gerade schnitze?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Fine town, really fine town you know... but only if you have enough silver coins in your pocket, you know what I mean?");
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
talkEntry:addResponse("Forgive me... I don't know about the human towns, but maybe you are interested to hear about the silverlake forest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Vergebt mir... Ich weiß viel zu wenig über die Städte der Menschen. Aber vielleicht interssiert ihr Euch dafür über meine Heimat zu sprechen, den Silberseewald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Forgive me... I don't know about the human towns, but maybe you are interested to hear about the silverlake forest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Vergebt mir... Ich weiß viel zu wenig über die Städte der Menschen. Aber vielleicht interssiert ihr Euch dafür über meine Heimat zu sprechen, den Silberseewald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Forgive me... I don't know about the human towns, but maybe you are interested to hear about the silverlake forest!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Vergebt mir... Ich weiß viel zu wenig über die Städte der Menschen. Aber veilleicht interssiert ihr Euch dafür über meine Heimat zu sprechen, den Silberseewald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("siverlake");
talkEntry:addResponse("I can't remember to eat anything more delicious than a silversee sturgeon. But you need the right receipt.");
talkEntry:addResponse("Around the silverlake live a number od Elven clans. It is told that anybody who walks around the see in a dark new moon night get blessed by the five.");
talkEntry:addResponse("The best carvers come out of the forest around the silverlake. Fome may hundread years now.");
talkEntry:addResponse("Humans, dwarves and lizardmen don't visit us often. I can't say they are welcome.");
talkEntry:addResponse("No we have no animals. There are enough wild animals to hunt in the forest and the rivers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silbersee");
talkEntry:addResponse("Es gibt nichts Besseres zu essen als einen gedünsteten Silberseestör. Aber man brauch die richtigen Zutaten.");
talkEntry:addResponse("Rund um den Silbersee leben viele Elfenclans. Es wird gesagt, dass jemand, der in einer Neumondnacht allein um den See geht, von den Göttern gesegnet wird.");
talkEntry:addResponse("Die besten Schnitzer kommen aus den Wäldern um den Silbersee. Und das schon seit hunderten von Jahren.");
talkEntry:addResponse("Menschen, Zwerge oder Echsenmenschen finden selten zu uns. Und wir sehen sie auch nicht so gerne dort.");
talkEntry:addResponse("Nein, wir züchten dort keine Tiere. In den Wäldern und Flüssen lebt genug jagdbares Wild.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I follow the five old, create the world as we know nowadays.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Die Fünf mögen mit Euch sein. Huldigen wir denen, die die Welt wie wir sie heute kennen erschaffen haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("The flame of Brágon warms the living as a part of the five.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Die Flamme Brágons wärmt die Völker als Teil des Segens der Fünf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Do I look like a merchant? I don't think so!");
talkEntry:addResponse("Nein, I don't buy anything and I won't ever sell something to you!");
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
talkEntry:addResponse("No, ich kaufe und verkaufe nichts. Erst recht nicht an dich!");
talkEntry:addResponse("Ein ander mal vielleicht, heute nich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("No, it's a fairy tale that the figure is in the wood if I start working. In reality, it's in my head.");
talkEntry:addResponse("They say in the swamps of Gynk exists a tree with marvelous wood. Some of the best sculptures are made from. This one is a just simple Naldor. I'd pay a lot, if I could get so fine wood even here.");
talkEntry:addResponse("I'd bet the Don will cut his hair in the moment, I finished this statuette. And tell me, how I should cut the hair on wood?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Nein, es ist ein Märchen. Wenn ich anfang zu arbeiten ist die Figur, die ich schnitze ist nicht im Holz drin. Sie ist in meinem Kopf.");
talkEntry:addResponse("Es heißt in den Sümpfen Galmairs wächst ein erstaunlicher Baum. Sein Holz ist das Beste, was sich Bildschnitzer vorstellen können. Ich würde einiges dafür geben, könnte ich davon etwas haben.");
talkEntry:addResponse("Ich möchte fast wetten der Don lässt sich an dem Tag die Haare schneiden, an dem ich sein Bildnis fertig habe. Nur sagt, wie soll ich die Haare aus Holz schneiden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Truciolo");
talkEntry:addTrigger("Pialla");
talkEntry:addResponse("What's up?");
talkEntry:addResponse("Sorry?");
talkEntry:addResponse("#me nods once and raises an eyebrow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Truciolo");
talkEntry:addTrigger("Pialla");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Was wollt ihr?");
talkEntry:addResponse("#me nickt dir zu und zieht eine Braue hoch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Sure, then go and collect those things I asked you for.");
talkEntry:addResponse("If you say so.");
talkEntry:addResponse("Alright, have fun!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Abe nun mal los, dann mach dich auf dem Weg und sammel was ich von dir wollte!");
talkEntry:addResponse("Na wenn du meinst");
talkEntry:addResponse("Ist gut, viel Vergnügen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What did you say? I hope I didn't hear you correctly!");
talkEntry:addResponse("You say no... no to me, who do you think your speaking to?");
talkEntry:addResponse("With that attitude, you won't become a good carver.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Was sagt ihr da, ich hoffe ich habe mich verhört?!");
talkEntry:addResponse("Du sagst Nein...nein zu mir, was denkst du mit wem du sprichst!");
talkEntry:addResponse("Dann nicht, so wird nie was aus dir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Eh..what did you just say about my brothers and sisters?");
talkEntry:addResponse("What are you jabbering about?");
talkEntry:addResponse("No, I don't wanna buy that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Eh..wat hast du grad über meine Geschwister gesagt?");
talkEntry:addResponse("Wat quasselst du da?");
talkEntry:addResponse("Nein, ich will das nicht kaufen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht sich über seine langen Haare.", "#me untangles his long hair.");
talkingNPC:addCycleText("#me blickt sich mistrauisch um und schaut auf ein Bild des Don.", "#me looks around suspiciously then he looks to a picture of the Don.");
talkingNPC:addCycleText("#me nimmt eine Flasche aus seiner Tasche und trinkt einen Schluck", "#me pulls a bottle from his bag and takes a swig.");
talkingNPC:addCycleText("#me wischt sich mit dem Handrücken über die Stirn.", "#me wipes with his hand over his forehead.");
talkingNPC:addCycleText("#me brummt leise etwas vor sich hin.", "#me grumbles something to himself.");
talkingNPC:addCycleText("#me streicht mit zusammengeniffenen Augen über seine Arbeit, etwas Staub löst sich daraus und schwebt zu Boden.", "#me pats the wooden pice he is working on. Some dust gets released and sinks to the ground.");
talkingNPC:addCycleText("#me lächelt verträumt.", "#me dreamy smiles.");
talkingNPC:addCycleText("#me pfeift die Melodie eines alten elfischen Schlachtliedes.", "#me whistles the tune of an old even battle song.");
talkingNPC:addCycleText("#me schaut sich einen besonders langen Span an.", "#me examines a very long splinter.");
talkingNPC:addCycleText("#me blickt mit zusammengeniffenen Augen in den Himmel.", "#me glances to the sky with narrowed eyes.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein in seine Arbeit vertiefter Elf schnitzt an einer Statue , die den Don darstellen könnte.", "A crafting elf, carving on a wooden statue that looks like the Don itself.");
mainNPC:setUseMessage("Fass mich nicht an!", "Don't touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 830);
mainNPC:setEquipment(3, 809);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2752);
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