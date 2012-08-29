--------------------------------------------------------------------------------
-- NPC Name: Berni Grunweld                                              None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  124, 581, 200          --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: May 23, 2011                            easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 124, 581, 200, 4, 'Berni Grunweld', 'npc.berni_grunweld', 0, 2, 5, 123, 62, 9, 245, 180, 137);
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
module("npc.berni_grunweld", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addResponse("[Game Help] This NPC is the cook Berni Grunweld. Keywords: Hello, quest, seed, adventure, hatchet, cooking spoon");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addResponse("[Spielhilfe] Dieser NPC ist der Koch Berni Grunweld. Schlüsselwörter: Hallo, Quest, Aufgaben, Samen, Beil, Kochlöffel ");
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
talkEntry:addResponse("Hiho, take a seat next me if you are hungry.");
talkEntry:addResponse("Huhu, sit next me I have something great to eat for you");
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
talkEntry:addResponse("Hiho du, setzt dich doch zu mir falls du Hunger hast.");
talkEntry:addResponse("Huhu, schnapp dir ein Plätzchen neben mir, ich hab was ganz tolles zu essen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hiho, take a seat next me if you are hungry");
talkEntry:addResponse("Huhu, sit next me I have something great to eat for you");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hiho du, setzt dich doch zu mir falls du Hunger hast");
talkEntry:addResponse("Huhu, schnapp dir ein Plätzchen neben mir, ich hab was ganz tolles zu essen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("good bye");
talkEntry:addTrigger("bye");
talkEntry:addTrigger("see you");
talkEntry:addResponse("Bye, i hope you will visit me again");
talkEntry:addResponse("Good day to you, if you are hungry, just come to me again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tschüßi und besuch mich mal wieder.");
talkEntry:addResponse("Mach es gut du und komme schnell wieder wenn du Hunger hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bye, i hope you will visit me again.");
talkEntry:addResponse("Good day to you, if you are hungry, just come to me again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Tschüßi und besuch mich mal wieder.");
talkEntry:addResponse("Mach es gut du und komme schnell wieder wenn du Hunger hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("how are you");
talkEntry:addTrigger("how feel");
talkEntry:addTrigger("how do you do");
talkEntry:addResponse("I'm prett good, thank you, and how are you if I may ask?");
talkEntry:addResponse("I feel very well, yes very, very well, how about you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie gehts");
talkEntry:addTrigger("wie fühlst");
talkEntry:addResponse("Mir geht es ganz prima, danke. Wie geht es denn dir?");
talkEntry:addResponse("Ich fühle mich toll, ganz toll und du, geht es dir auch so gut?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Berni Grunweld the great cook and who are you?");
talkEntry:addResponse("I'm Berni, yes Berni is alright.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der Berni Grunweld der großartige Koch und wer bist denn du?");
talkEntry:addResponse("Ich bin der Berni, ja Berni reicht vollkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, I have something to do for you. Bring me 10 onions and 10 cabbage, than I might let you taste from my soup and it would be nice if you bring me a cooking spoon as well. Here are some seeds and a sickle.");
talkEntry:addConsequence(npc.base.consequence.item.item(534, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(291, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addResponse("Jup, ich hätte was für dich zu tun, bring mir 10 Zwiebeln sowie 10 Kohlköpfe, dann lass ich dich auch von meiner Suppe kosten und ein neuer Kochlöffel wäre auch nett. Ach und hier ist eine Sichel, die wirst du brauche und ein paar Samen.");
talkEntry:addConsequence(npc.base.consequence.item.item(534, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(291, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addResponse("Yes, I have something to do for you. Bring me 10 onions and 10 cabbage, than I might let you taste from my soup and it would be nice if you bring me a cooking spoon as well. Here are some seeds and a sickle.");
talkEntry:addConsequence(npc.base.consequence.item.item(534, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(291, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addResponse("Jup, ich hätte was für dich zu tun, bring mir 10 Zwiebeln sowie 10 Kohlköpfe, dann lass ich dich auch von meiner Suppe kosten und ein neuer Kochlöffel wäre auch nett. Ach und hier ist eine Sichel, die wirst du brauche und ein paar Samen.");
talkEntry:addConsequence(npc.base.consequence.item.item(534, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(291, 30, 399, 0));
talkEntry:addConsequence(npc.base.consequence.item.item(126, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you don't bring me those 10 onions and 10 cabbage, I won't be able to make soup. And without a cooking spoon I cannot cook.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addResponse("Wenn du mir nicht die 10 Zwiebeln und die 10 Kohlköpfe bringst, kann ich leider auch keine Suppe machen. Und ohne den neuen Kochlöffel kann ich nicht kochen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addResponse("If you don't bring me those 10 onions and 10 cabbage, I won't be able to make soup. And without a cooking spoon I cannot cook.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addResponse("Wenn du mir nicht die 10 Zwiebeln und die 10 Kohlköpfe bringst, kann ich leider auch keine Suppe machen. Und ohne den neuen Kochlöffel kann ich nicht kochen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("Ah, you're back and you even have everything with you, that I requested. Very good. Now watch closely!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(201, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(227, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("Ah, du bist zurück und du hast sogar alles da, was ich von dir wollte, sehr schön. Jetzt aber Augen auf!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(290, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(201, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(227, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's not everything I wanted. I wanted 10 cabbage, 10 onions and a cooking spoon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(290, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(201, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(227, "all", "<", 1));
talkEntry:addResponse("Das ist nicht alles was ich haben wollte, ich wollte 10 Kohlköpfe, 10 Zwiebeln und einen Kochlöffel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oioioi, you again! Now bring me 15 tomatoes, a hatchet for a new fire and a bucket. And don't forget to bring me 5 bowls of onionsoup as well, I want to see if yours is as good as mine by now!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addResponse("Uiuiui, da bist du ja wieder! Jetzt bring mir aber schnell 15 Tomaten, ein Beil für ein neues Feuer und einen Eimer. Und vergiss nicht mir auch noch 5 Schüsseln Zwiebelsuppe zu bringen, ich will sehen ob du die endlich genau so gut machen kannst wie ich! ");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addResponse("Oioioi, you again! Now bring me 15 tomatoes, a hatchet for a new fire and a bucket. And don't forget to bring me 5 bowls of onionsoup as well, I want to see if yours is as good as mine by now!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 20));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addResponse("Uiuiui, da bist du ja wieder! Jetzt bring mir aber schnell 15 Tomaten, ein Beil für ein neues Feuer und einen Eimer. Und vergiss nicht mir auch noch 5 Schüsseln Zwiebelsuppe zu bringen, ich will sehen ob du die endlich genau so gut machen kannst wie ich!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You have to practice a little more, than I will gladly help you with more advances recipes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 2));
talkEntry:addResponse("Du musst noch ein bisschen mehr üben, dann helf ich dir auch gerne weiter bei schwierigeren Rezepten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 2));
talkEntry:addResponse("You have to practice a little more, than I will gladly help you with more advances recipes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 20));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 2));
talkEntry:addResponse("Du musst noch ein bisschen mehr üben, dann helf ich dir auch gerne weiter bei schwierigeren Rezepten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bring me the 15 tomatoes, the hatchet and the bucket, as well as 5 bowls of selfmade onionsoup and I will cook us a tasty stew!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addResponse("Bring mir die 15 Tomaten, das Beil und den Eimer, sowie deine 5 Schüsseln selbstgemacher Zwiebelsuppe und ich koch uns einen leckeren Eintopf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addResponse("Bring me the 15 tomatoes, the hatchet and the bucket, as well as 5 bowls of selfmade onionsoup and I will cook us a tasty stew!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addResponse("Bring mir die 15 Tomaten, das Beil und den Eimer, sowie deine 5 Schüsseln selbstgemacher Zwiebelsuppe und ich koch uns einen leckeren Eintopf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(2923, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.item.item(74, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("You're finally back, now quickly hand me those things. Watch me now, maybe you learn a thing or two from me!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(200, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2923, 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(74, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(2923, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.item.item(74, "all", ">", 1));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", ">", 1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("Endlich bist du wieder da, jetzt aber schnell her mit den Sachen. Schau zu, vielleicht lernst du ja noch dies und das von mir!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(200, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2923, 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(74, 1));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(51, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2923, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.item.item(74, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's not working, you will have to bring me those things I asked you for, I will tell it as well, better note it down. 15 tomatoes, a hatchet, a bucket and 5 bowls of onionsoup!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(200, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(2923, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.item.item(74, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.item.item(51, "all", "=", 0));
talkEntry:addResponse("So wird das nichts, du musst mir schon die Sachen bringen die ich von dir wollte, ich zähle sie nochmal auf also schreibs auf. 15 Tomaten, ein Beil, einen Eimer und 5 Schüsseln Zwiebelsuppe!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, you're back so soon. I just wanted to make a cake, please bring me the following things: four peels, a small pouch with 10 hops in it, 10 muffins and the most important thing, five honeycombs.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addResponse("So, so, schnell bist du zurück. Ich wollte gerade einen Kuchen backen, bring' mir bitte folgende Sachen: vier Ofenschieber, ein kleinen Beutel mit 10 Hopfen darin, 10 Muffins und das wichtigste nicht zu vergessen, fünf Honigwaben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addResponse("Ah, you're back so soon. I just wanted to make a cake, please bring me the following things: four peels, a small pouch with 10 hops in it, 10 muffins and the most important thing, five honeycombs.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 40));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addResponse("So, so, schnell bist du zurück. Ich wollte gerade einen Kuchen backen, bring' mir bitte folgende Sachen: vier Ofenschieber, ein kleinen Beutel mit 10 Hopfen darin, 10 Muffins und das wichtigste nicht zu vergessen, fünf Honigwaben.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don't disturbe me now, I'm just working on a new recipe. Come back later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 4));
talkEntry:addResponse("Störe mich jetzt nicht, ich bastel grad an einem neuen Rezept. Komm später wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 4));
talkEntry:addResponse("Don't disturbe me now, I'm just working on a new recipe. Come back later.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 40));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 4));
talkEntry:addResponse("Störe mich jetzt nicht, ich bastel grad an einem neuen Rezept. Komm später wieder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("4 peels, 10 hops, 10 muffings and 5 honeycombs, I think you will have that in no time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addResponse("4 Ofenschieber, 10 Hopfen, 10 Muffins und 5 Honigwaben waren es, ich denke mal das hast du im nu zusammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addResponse("4 peels, 10 hops, 10 muffings and 5 honeycombs, I think you will have that in no time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addResponse("4 Ofenschieber, 10 Hopfen, 10 Muffins und 5 Honigwaben waren es, ich denke mal das hast du im nu zusammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(121, "all", ">", 3));
talkEntry:addCondition(npc.base.condition.item.item(154, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(454, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("You're back and you have everything with you, fantastic! Now you can help me with this cake, I#m sure that'll help you!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(121, 4));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(154, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(454, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2529, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(121, "all", ">", 3));
talkEntry:addCondition(npc.base.condition.item.item(154, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(454, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", ">", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("Da bist du ja wieder und du hast sogar alles dabei, großartig! Nun kannst du mir auch zugucken wie ich den Kuchen backe, das hilft dir sicher weiter!");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(121, 4));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(154, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(454, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2529, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(121, "all", "<", 4));
talkEntry:addCondition(npc.base.condition.item.item(154, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(454, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You don't have everything I asked you for. Get me all those things than I will bake a super tasty cake!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(121, "all", "<", 4));
talkEntry:addCondition(npc.base.condition.item.item(154, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(454, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(2529, "all", "<", 5));
talkEntry:addResponse("Du hast ja nicht alles was ich wollte wie mir scheint, hol' mir die Sachen doch bitte, dann back ich einen super leckeren Kuchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 80));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I have one recipe for you left but I want to try some of you selfmade dished. I would like to try 15 sausage dishes, one box with 10 cookies, as well as 10 meat dishes and 5 strawberry cakes.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 80));
talkEntry:addResponse("Ein Rezept habe ich noch für dich, dafür will ich aber von dir einige selbstgemachte Gerichte testen. 15 Teller Würstchen mit Beilage, eine Dose mit 10 Keksen darin, sowie 10 Teller Steak mit Beilage und zu guter letzt 5 Erdbeertorten will ich von dir kosten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 80));
talkEntry:addResponse("I have one recipe for you left but I want to try some of you selfmade dished. I would like to try 15 sausage dishes, one box with 10 cookies, as well as 10 meat dishes and 5 strawberry cakes.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", ">", 60));
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 80));
talkEntry:addResponse("Ein Rezept habe ich noch für dich, dafür will ich aber von dir einige selbstgemachte Gerichte testen. 15 Teller Würstchen mit Beilage, eine Dose mit 10 Keksen darin, sowie 10 Teller Steak mit Beilage und zu guter letzt 5 Erdbeertorten will ich von dir kosten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Practice your cooking skill a little more, because with practice you get better and if you later ask nicely, I might have another recipe for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 6));
talkEntry:addResponse("Übe dich noch etwas im Kochen, denn nur durch Übung wird man besser und wenn du später nett fragst, habe ich vielleicht sogar noch ein Rezept für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 6));
talkEntry:addResponse("Practice your cooking skill a little more, because with practice you get better and if you later ask nicely, I might have another recipe for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.skill.skill(2, "baking", "=<", 60));
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 6));
talkEntry:addResponse("Übe dich noch etwas im Kochen, denn nur durch Übung wird man besser und wenn du später nett fragst, habe ich vielleicht sogar noch ein Rezept für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You should bring me 15 sausage dishes, a box with 10 cookies, 10 steaks and of course the 5 strawberry cakes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addResponse("Du solltest mir 15 Teller Würstchen mit Beilage, eine Dose mit 10 Keksen, 10 Teller Steak mit Beilage bringen und natürlich die 5 Erdbeertorten nicht zu vergessen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addResponse("You should bring me 15 sausage dishes, a box with 10 cookies, 10 steaks and of course the 5 strawberry cakes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addResponse("Du solltest mir 15 Teller Würstchen mit Beilage, eine Dose mit 10 Keksen, 10 Teller Steak mit Beilage bringen und natürlich die 5 Erdbeertorten nicht zu vergessen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2922, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(453, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(557, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(354, "all", ">", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You have the feeling that you've learnt a lot today."));
talkEntry:addResponse("Mhh..your dishes are tasty. But one small, last tipp, if you mix a small piece of a Sibanac leaf under your dishes it gets this nice smell.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2922, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(453, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(557, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(354, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2922, "all", ">", 14));
talkEntry:addCondition(npc.base.condition.item.item(453, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(557, "all", ">", 9));
talkEntry:addCondition(npc.base.condition.item.item(354, "all", ">", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du hast das Gefühl als hättest du heute viel gelernt."));
talkEntry:addResponse("Jam, jam, deine Gerichte schmecken klasse. Aber ein kleiner Tipp noch, ab und an misch ich ein kleines Stück von einem Sibanacblatt in mein Essen, dadurch bekommt es den herlichen Duft.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(2, "baking", "+", 5));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2922, 15));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(453, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(557, 10));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(354, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(80, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2922, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(453, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(557, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(354, "all", "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you don't emphasize my demands, to bring me some of you dishes, I cannoth help you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2922, "all", "<", 15));
talkEntry:addCondition(npc.base.condition.item.item(453, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(557, "all", "<", 10));
talkEntry:addCondition(npc.base.condition.item.item(354, "all", "<", 5));
talkEntry:addResponse("Wenn du keinen Wert auf meine Forderung legst, mir ein paar von deinen Gerichten zu bringen, helfe ich dir auch nicht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You're good enough now, there is nothing more I could teach you. If you keep on practicing you might become a master cook!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 8));
talkEntry:addResponse("Du bist nun gut genug, es gibt nichts dass ich dir noch beibringen könnte. Strengst du dich noch ein wenig mehr an, wirst du noch ein Meister im kochen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 8));
talkEntry:addResponse("You're good enough now, there is nothing more I could teach you. If you keep on practicing you might become a master cook!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 8));
talkEntry:addResponse("Du bist nun gut genug, es gibt nichts dass ich dir noch beibringen könnte. Strengst du dich noch ein wenig mehr an, wirst du noch ein Meister im kochen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seed");
talkEntry:addTrigger("seedling");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 0));
talkEntry:addResponse("You will have to plant the seeds into the earth, so that they can grow. If you need more just ask Fred for some.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Samen");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 0));
talkEntry:addResponse("Die Samen musst du in die Erde einpflanzen, damit sie auch wachsen. Wenn du mehr braucht, frag einfach Fred nach ein paar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cooking spoon");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 0));
talkEntry:addResponse("A carpenter can make you a cooking spoon, you sure find one on the market place or in the workshop.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kochlöffel");
talkEntry:addCondition(npc.base.condition.quest.quest(80, "=", 0));
talkEntry:addResponse("Einen Kochlöffel kann dir auch ein Schreiner herstellen, den findest du sicher auf dem Marktplatz oder in der Werkstatt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a cook, that's right.");
talkEntry:addResponse("I'm a cook, even the best!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beruf");
talkEntry:addResponse("Von Beruf bin ich Koch, ja genau.");
talkEntry:addResponse("Ich bin Koch, einer der besten sogar!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm a cook, that's right.");
talkEntry:addResponse("I'm a cook, even the best!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Von Beruf bin ich Koch, ja genau.");
talkEntry:addResponse("Ich bin Koch, einer der besten sogar!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gobaith? That's where all those refugees come from all of a sudden, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gobiath");
talkEntry:addResponse("Gobaith? Da kommen diese ganzen Flüchtlinge plötzlich her, richtig?");
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
talkEntry:addResponse("Archmage Morgan is a really kind and generous leader and I trust him completely. He is good to us, even to the farmers and the once who do not have any profession at all.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Erzmagier Morgan is ein großherziger und gütiger Anfürhrer und ich vertraue ihm. Er ist gut zu uns, sogar zu den Bauern und jenen die keine Arbeit haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Archmage Morgan is a really kind and generous leader and I trust him completely. He is good to us, even to the farmers and the once who do not have any profession at all.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Erzmagier Morgan is ein großherziger und gütiger Anfürhrer und ich vertraue ihm. Er ist gut zu uns, sogar zu den Bauern und jenen die keine Arbeit haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick is a mighty fine town, isn't it? Lots of fresh veggies and fruits for the perfect dish. The farmers here are the best!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("runewick");
talkEntry:addResponse("Runewick ist eine ganz prima Stadt oder? Viel frisches Obst und Gemüse für das perfecte Gericht. Die Bauern hier sind die besten!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio Guilianni");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Valerion Gui..Guilia...Guilianni? Who's that? The name doesn't sound really friendly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio Guilianni");
talkEntry:addResponse("Valerion Gui..Guilia...Guilianni? Wer ist denn das? Der Name hört sich nicht sehr freundlich an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair... I don't know much about this place, but I heard that you only are treated fair when you have enough money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("galmair");
talkEntry:addResponse("Galmair... Ich weiß nicht viel über diesen Ort, aber ich habe gehört, dass man nur fair behandelt wird, wenn man genug Geld hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("It is said that queen Rosaline of Cadomyr is really pretty but also very strict. I think I saw her once, when she visited the archmage and maybe she even had the chance to taste one of my cakes that day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Es wird gesagt, das Königin Rosaline von Cadomyr sehr hübsch sein soll, aber auch sehr streng. Ich glaube ich habe sie mal gesehen, als sie den Erzmagier besuchte und vielleicht hatte sie an dem Tag auch die Chance einen meiner Kuchen zu probieren!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is said that queen Rosaline of Cadomyr is really pretty but also very strict. I think I saw her once, when she visited the archmage and maybe she even had the chance to taste one of my cakes that day!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Es wird gesagt, das Königin Rosaline von Cadomyr sehr hübsch sein soll, aber auch sehr streng. Ich glaube ich habe sie mal gesehen, als sie den Erzmagier besuchte und vielleicht hatte sie an dem Tag auch die Chance einen meiner Kuchen zu probieren!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's this desert town right? They probably have a hard time to find fresh ingredients there to cook. Maybe I should travel there and serve them some of my cabbage soup.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cadomyr");
talkEntry:addResponse("Das ist diese Wüstenstadt, richtig? Die haben es sicher schwer, frische Zutaten zum kochen zu finden. Vielleicht sollte ich mal dort hinreisen und ihnen etwas von meiner Kohlsuppe servieren.");
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
talkEntry:addResponse("I'm cook, not a trader");
talkEntry:addResponse("I prefer exchanging my wares, I don't like selling them");
talkEntry:addResponse("I have nothing here, I could sell you");
talkEntry:addResponse("I don't have any prices, because I don't sell anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin kein Händler, nur Koch.");
talkEntry:addResponse("Ich tausche lieber als zu verkaufen");
talkEntry:addResponse("Ich hab leider nichts da zum verkaufen");
talkEntry:addResponse("Eine Preisliste habe ich nicht da, weil ich eigentlich nichts verkaufe.");
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
talkEntry:addResponse("Great, hurry up.");
talkEntry:addResponse("Fantastic, now run!");
talkEntry:addResponse("Great, but pleace hurry up");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Super, mach schnell.");
talkEntry:addResponse("Wunderbar, dann los!");
talkEntry:addResponse("Toll, aber beeil dich bitte");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Maybe you will change your mind?");
talkEntry:addResponse("Why not? Aren't you nice?");
talkEntry:addResponse("Please, do it for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Vielleicht änderst du deine Meinung noch einmal?");
talkEntry:addResponse("Wieso denn nicht, bist du nicht nett?");
talkEntry:addResponse("Ach bitte, mach es für mich");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me blickt nachdenklich auf den Kochtopf vor sich", "#me looks thoughtful to the kettle infront of him");
talkingNPC:addCycleText("#me schwingt leise kichernd einen Kochlöffel durch die Luft.", "ENGLISH");
talkingNPC:addCycleText("#me versucht vergeblich einen kleinen Fleck auf seiner Hose mit einem Tuch weg zu wischen.", "ENGLISH");
talkingNPC:addCycleText("#me summt leise etwas vor sich hin.", "ENGLISH");
talkingNPC:addCycleText("#me wirft verschiedenes Gemüse in den Topf vor sich und mischt diese zusammen.", "ENGLISH");
talkingNPC:addCycleText("#me schaut sich suchend um.", "ENGLISH");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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
