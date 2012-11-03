--------------------------------------------------------------------------------
-- NPC Name: Rutrus                                                   Cadomyr --
-- NPC Job:  Digger                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  359, 678, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 359, 678, 0, 6, 'Rutrus', 'npc.rutrus', 0, 3, 4, 192, 107, 5, 187, 134, 92);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.skill")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.skill")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.rutrus", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the digger Rutrus. Keywords: Hello, quest, shovel, profession."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Gräber Rutrus. Schlüsselwörter: Hallo, Quest, Schaufel, Beruf."));
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
talkEntry:addResponse("Hello, Hello.");
talkEntry:addResponse("You greet me and I greet back: Greetings!");
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Welcome to this sandy area.");
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
talkEntry:addResponse("Hallo, Hallo.");
talkEntry:addResponse("Du grüßt mich und ich grüße zurück: Grüße!");
talkEntry:addResponse("Guten Tag.");
talkEntry:addResponse("Willkommen in dieser sandigen Gegend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hello, Hello.");
talkEntry:addResponse("You greet me and I greet back: Greetings!");
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Welcome to this sandy area.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hallo, Hallo.");
talkEntry:addResponse("Du grüßt mich und ich grüße zurück: Grüße!");
talkEntry:addResponse("Guten Tag.");
talkEntry:addResponse("Willkommen in dieser sandigen Gegend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Have a nice day!");
talkEntry:addResponse("Goodbye, goodbye, come back soon!");
talkEntry:addResponse("Farewell, you friendly being!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Einen schönen Tag auch.");
talkEntry:addResponse("Leb wohl, leb wohl, komm bald wieder!");
talkEntry:addResponse("Auf bald, du freundliches Wesen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Have a nice day!");
talkEntry:addResponse("Goodbye, goodbye, come back soon!");
talkEntry:addResponse("Farewell, you friendly being!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Einen schönen Tag auch.");
talkEntry:addResponse("Leb wohl, leb wohl, komm bald wieder!");
talkEntry:addResponse("Auf bald, du freundliches Wesen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I have a grain of sand in my eye - how would you feel?!");
talkEntry:addResponse("Fine, fine.");
talkEntry:addResponse("All I can say is: I hope you are feeling as good as I do!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie befind");
talkEntry:addResponse("Ich habe Sand ins Auge bekommen - wie würdest du dich fühlen!?");
talkEntry:addResponse("Gut, gut.");
talkEntry:addResponse("Ich kann nur sagen, ich hoffe es geht dir so gut wie mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Rutrus and who are you?");
talkEntry:addResponse("Be greeted, I am the digger Rutrus.");
talkEntry:addResponse("I am Rutrus and this here is my shovel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Rutrus und wer bist du?");
talkEntry:addResponse("Grüße dich, ich bin der Gräber Rutrus.");
talkEntry:addResponse("Ich bin Rutrus und das in meinen Händen ist meine Schaufel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars I"));
talkEntry:addResponse("Oh! You want to help me? Take this shovel and get ten piles of coarse sand. Dig for it next to the rocks in the desert. Your reward will be fifty copper coins.");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase I"));
talkEntry:addResponse("Oh! Du willst mir helfen? Nehme diese Schaufel hier und beschaffe mir zehn Haufen groben Sand. Grabe neben Steinen in der Wüste. Dein Lohn sollen fünfzig Kupferlinge sein.");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars I"));
talkEntry:addResponse("Oh! You want to help me? Take this shovel and get ten piles of coarse sand. Dig for it next to the rocks in the desert. Your reward will be fifty copper coins. Oh");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase I"));
talkEntry:addResponse("Du willst mir helfen? Nimm diese Schaufel hier und beschaffe mir zehn Haufen groben Sand. Grabe neben Steinen in der Wüste. Dein Lohn sollen fünfzig Kupferlinge sein.");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 399, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your mining skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("Oh, hoho! Great job, my friend. Here is the reward I promised you. Just tell me if you want an other task.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("Oh, hoho! Great job, my friend. Here is the reward I promised you. Just tell me if you want an other task.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Oh, hoho! Das hast du toll gemacht. Hier deine versprochene Belohung. Solltest du noch eine Aufgabe wollen, sag es.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Oh, hoho! Das hast du toll gemacht. Hier deine versprochene Belohung. Solltest du noch eine Aufgabe wollen, sag es.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins and your mining skill increases."));
talkEntry:addResponse("Oh, hoho! Great job, my friend. Here is the reward I promised you. Just tell me, if you want an other task.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 50 copper coins."));
talkEntry:addResponse("Oh, hoho! Great job, my friend. Here is the reward I promised you. Just tell me, if you want an other task.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Oh, hoho! Das hast du toll gemacht. Hier deine versprochene Belohung. Solltest du noch eine Aufgabe wollen, sag es.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 50 Kupferstücke."));
talkEntry:addResponse("Oh, hoho! Das hast du toll gemacht. Hier deine versprochene Belohung. Solltest du noch eine Aufgabe wollen, sag es.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(726, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I told you to bring me ten piles of coarse sand! Back to the desert!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich sagte, du sollest zehn Haufen groben Sand bringen! Zurück in die Wüste, husch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You want to help me? Just bring me ten piles of coarse sand and you'll get fifty copper coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(726, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Oh! Du willst mir helfen? Bringe mir zehn Haufen groben Sand und dein Lohn sollen fünfzig Kupferlinge sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars II"));
talkEntry:addResponse("Another task? Alright, listen: I need twenty piles of quartz sand. First of all you need to get the coarse sand and then you need to filter it with a sieve. You will earn a hundred copper coins.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase II"));
talkEntry:addResponse("Du willst eine weitere Aufgabe? Hör zu: Ich brauche zwanzig Haufen Quartzsand. Zuerst musst du groben Sand sammeln und diesen dann mit einem Sieb filtern. Du wirst hundert Kupferlinge als Lohn erhalten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars II"));
talkEntry:addResponse("Another task? Alright, listen: I need twenty piles of quartz sand. First of all you need to get the coarse sand and then you need to filter it with a sieve. You will earn a hundred copper coins.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase II"));
talkEntry:addResponse("Du willst eine weitere Aufgabe? Hör zu: Ich brauche zwanzig Haufen Quartzsand. Zuerst musst du groben Sand sammeln und diesen dann mit einem Sieb filtern. Du wirst hundert Kupferlinge als Lohn erhalten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("This is what I call fine sand. And here is your money.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("This is what I call fine sand. And here is your money.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Das ist doch mal feiner Sand. Und hier hast du dein Geld.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Das ist doch mal feiner Sand. Und hier hast du dein Geld.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases."));
talkEntry:addResponse("This is what I call fine sand. And here is your money.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("This is what I call fine sand. And here is your money.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Das ist doch mal feiner Sand. Und hier hast du dein Geld.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 19, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Das ist doch mal feiner Sand. Und hier hast du dein Geld.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(316, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I want my twenty piles of quartz sand!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 20, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich will meine zwanzig Haufen Quartzsand!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 20, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I want my twenty piles of quartz sand!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 20, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich will meine zwanzig Haufen Quartzsand!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars III"));
talkEntry:addResponse("I need your help again. But this time it is a bit more complicated. I want you to collect five raw topaz and your reward will be a hundred coppers!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase III"));
talkEntry:addResponse("Ich brauche wieder deine Hilfe. Dieses ist es etwas schwerer. Du sollst fünf ungeschliffene Topaze sammeln und dein Lohn sollen hundert Kupferlinge sein!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars III"));
talkEntry:addResponse("I need your help again. But this time it is a bit more complicated. I want you to collect five raw topaz and your reward will be a hundred coppers!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase III"));
talkEntry:addResponse("Ich brauche wieder deine Hilfe. Dieses ist es etwas schwerer. Du sollst fünf ungeschliffene Topaze sammeln und dein Lohn sollen hundert Kupferlinge sein!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("You really found raw topaz? Great! Here you go.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("You really found raw topaz? Great! Here you go.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Du hast tatsächlich ungeschliffene Topaze gefunden? Großartig! Hier, dein Lohn.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Du hast tatsächlich ungeschliffene Topaze gefunden? Großartig! Hier, dein Lohn.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and your mining skill increases."));
talkEntry:addResponse("You really found raw topaz? Great! Here you go.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("You really found raw topaz? Great! Here you go.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Du hast tatsächlich ungeschliffene Topaze gefunden? Großartig! Hier, dein Lohn.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", ">", 4, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Du hast tatsächlich ungeschliffene Topaze gefunden? Großartig! Hier, dein Lohn.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(257, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I need you to collect five raw topaz. Could you... dig on?");
talkEntry:addResponse("You don't have enough topaz yet. It seems that you need to dig some more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", "<", 5, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich brauche dich, um fünf ungeschliffene Topaze zu sammeln. Buddel weiter!");
talkEntry:addResponse("Das sind aber nicht genug Topaze. Da musst du wohl noch ein bisschen graben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", "<", 5, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I need you to collect five raw topaz. Could you... dig on?");
talkEntry:addResponse("You don't have enough topaz yet. It seems that you need to dig some more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(257, "all", "<", 5, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich brauche dich, um fünf ungeschliffene Topaze zu sammeln. Buddel weiter!");
talkEntry:addResponse("Das sind aber nicht genug Topaze. Da musst du wohl noch ein bisschen graben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars IV"));
talkEntry:addResponse("You are a hard working one.  I'd like to host a barbeque for my shovel now. Can you bring me ten lumps of coal from the Dark Hole mine for two hundred copper coins?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase IV"));
talkEntry:addResponse("Dich nenne ich fleißig! Ich würde gerne für meine Schaufel eine kleine Grillfeier schmeißen. Kannst du mir zehn Kohleklumpen für zweihundert Kupferstücke aus der Dunkellochmine bringen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Oasis of Stars IV"));
talkEntry:addResponse("You are a hard working one. I'd like to host a barbeque for my shovel now. Can you bring me ten lumps of coal from the Dark Hole mine for two hundred copper coins?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sternenoase IV"));
talkEntry:addResponse("Dich nenne ich fleißig! Ich würde gerne für meine Schaufel eine kleine Grillfeier schmeißen. Kannst du mir zehn Kohleklumpen für zweihundert Kupferstücke aus der Dunkellochmine bringen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your mining skill increases. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("Ha! You did it perfectly - just like all the other tasks. You were a big help and here are your coins. I'll place a sausage over the fire later on for you, my friend.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins. You advance in Queen Rosaline Edwards's favour."));
talkEntry:addResponse("Ha! You did it perfectly - just like all the other tasks. You were a big help and here are your coins. I'll place a sausage over the fire later on for you, my friend.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Bergbaufertigkeit steigt. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ha! Das hast du großartig gemacht - wie auch alle anderen Aufgaben. Du warst eine große Hilfe und hier ist dein Lohn. Ich werde nachher eine Extrawurst für dich auf den Grill packen, mein Freund.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ha! Das hast du großartig gemacht - wie auch alle anderen Aufgaben. Du warst eine große Hilfe und hier ist dein Lohn. Ich werde nachher eine Extrawurst für dich auf den Grill packen, mein Freund.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins and your mining skill increases."));
talkEntry:addResponse("Ha! You did it great - just like all the other tasks. You were a big help and here are your coins. I'll place a sausage over the fire later on for you, my friend.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 200 copper coins."));
talkEntry:addResponse("Ha! You did it great - just like all the other tasks. You were a big help and here are your coins. I'll place a sausage over the fire later on for you, my friend.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.skill.skill(Character.mining, "<", 90));
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke und deine Bergbaufertigkeit steigt."));
talkEntry:addResponse("Ha! Das hast du großartig gemacht - wie auch alle anderen Aufgaben. Du warst eine große Hilfe und hier ist dein Lohn. Ich werde nachher eine Extrawurst für dich auf den Grill packen, mein Freund.");
talkEntry:addConsequence(npc.base.consequence.skill.skill(Character.mining, "+", 1));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 200 Kupferstücke."));
talkEntry:addResponse("Ha! Das hast du großartig gemacht - wie auch alle anderen Aufgaben. Du warst eine große Hilfe und hier ist dein Lohn. Ich werde nachher eine Extrawurst für dich auf den Grill packen, mein Freund.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 200));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(21, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(67, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ten lumps of coal - shouldn't be too difficult, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10, nil));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zehn Klumpen Kohle - Das kann doch nicht so schwer sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10, nil));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Ten lumps of coal - shouldn't be too difficult, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(21, "all", "<", 10, nil));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Zehn Klumpen Kohle - Das kann doch nicht so schwer sein!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You helped me enough, really. I have no other jobs for you. But maybe you can find someone in the Dark Hole mine who will give you something to do. And remember: The shovel is your friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 8));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Du hast mir genug geholfen, wirklich. Ich habe keine Aufgaben mehr für dich. Aber vielleicht findest du in der Dunkellochmine jemanden, der etwas für dich zu tun hat. Und denk daran: Die Schaufel ist dein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 8));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You helped me enough, really. I have no other jobs for you. But maybe you can find someone in the Dark Hole mine who will give you something to do. And remember: The shovel is your friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(67, "=", 8));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Du hast mir genug geholfen, wirklich. Ich habe keine Aufgaben mehr für dich. Aber vielleicht findest du in der Dunkellochmine jemanden, der etwas für dich zu tun hat. Und denk daran: Die Schaufel ist dein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Profession");
talkEntry:addResponse("I'm a digger. I dig. I dig in the sand and anywhere else one can dig.");
talkEntry:addResponse("My job? I bring sand to glassblowers.");
talkEntry:addResponse("I steal the sand from the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beruf");
talkEntry:addResponse("Ich bin Gräber. Ich grabe. Ich grabe im Sand und wo man sonst noch graben kann.");
talkEntry:addResponse("Mein Beruf? Ich bringe Glasbläsern Sand.");
talkEntry:addResponse("Ich stehle der Wüste den Sand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a digger. I dig. I dig in the sand and anywhere else one can dig.");
talkEntry:addResponse("My job? I bring sand to glassblowers.");
talkEntry:addResponse("I steal the sand from the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Gräber. Ich grabe. Ich grabe im Sand und wo man sonst noch graben kann.");
talkEntry:addResponse("Mein Beruf? Ich bringe Glasbläsern Sand.");
talkEntry:addResponse("Ich stehle der Wüste den Sand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith, what's that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Was soll das für ein Ort sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("And my name is Rutrus. This is my shovel. I call her Susie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Und mein Name ist Rutrus. Dies hier ist meine Schaufel. Ich nenne sie Susie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("desert");
talkEntry:addResponse("The Katabi desert is a nice place, aye, but you need to watch out for scorpions.");
talkEntry:addResponse("Welcome to the Katabi desert! If your throat gets try, you can visit the tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wüste");
talkEntry:addResponse("Obgleich unsere Katabiwüste ein schöner Ort ist, sollte man sich vor den Skorpionen hüten.");
talkEntry:addResponse("Willkommen in der Katabiwüste! Sollte deine Kehle mal zu trocken werden, schau doch in der Taverne vorbei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Katabi");
talkEntry:addTrigger("sand");
talkEntry:addResponse("The Katabi desert is a nice place, aye, but you need to watch out for scorpions.");
talkEntry:addResponse("Welcome to the Katabi desert! If your throat gets try, you can visit the tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katabi");
talkEntry:addTrigger("sand");
talkEntry:addResponse("Obgleich unsere Katabiwüste ein schöner Ort ist, sollte man sich vor den Skorpionen hüten.");
talkEntry:addResponse("Willkommen in der Katabiwüste! Sollte deine Kehle mal zu trocken werden, schau doch in der Taverne vorbei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oasis");
talkEntry:addResponse("This is the Oasis of Stars - a paradise for diggers.");
talkEntry:addResponse("This oasis is a beacon of hope in the Katabi desert - just like a bright star in the darkest night.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("oase");
talkEntry:addResponse("Dies ist die Sternenoase - ein Paradies für Sandgräber!");
talkEntry:addResponse("Diese Oase ist ein Leuchtfeuer der Hoffnung in der Katabiwüste - genau wie ein heller Stern in einer dunklen Nacht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Raban");
talkEntry:addResponse("Raban... I remember this name. It has been a while.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raban");
talkEntry:addResponse("Raban... Ich erinnere mich an diesen Namen. Lange ist's her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tool");
talkEntry:addTrigger("shovel");
talkEntry:addResponse("The shovel is my tool. It may seem like a normal object, but it is powerful in the right hands. I will give you one if you do a little task for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Werkzeug");
talkEntry:addTrigger("Schaufel");
talkEntry:addResponse("Mein Werkzeug ist die Schaufel. Sie scheint gewöhnlich, aber in richtigen Händen ist sie mächtig. Ich gebe dir eine, wenn du Aufgaben für mich erledigst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Never trust an elf, I say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Traue keinem Elfen, sage ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Never trust an elf, I say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Traue keinem Elfen, sage ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("A wicked place! Never trust an elf, I say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ein verwunschener Ort. Traue keinem Elfen, sage ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Who's that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Wer soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair, what's that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Was soll das für ein Ort sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Edwards... I remember an Edward, he is pretty awesome. Concerning the queen of Cadomyr, I doubt she even knows anyone is living in the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Edwards... Ich kann mich an einen Edward erinnern, er ist einfach nur großartig. Aber nun zur Königin Cadomyrs, ich glaube kaum, dass sie überhaupt weiß, dass jemand hier in der Wüste lebt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Edwards... I remember an Edward, he is pretty awesome. Concerning the queen of Cadomyr, I doubt she even knows anyone is living in the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Edwards... Ich kann mich an einen Edward erinnern, er ist einfach nur großartig. Aber nun zur Königin Cadomyrs, ich glaube kaum, dass sie überhaupt weiß, dass jemand hier in der Wüste lebt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("They leave me alone, usually.");
talkEntry:addResponse("From time to time, I go to Cadomyr to get my shovel fixed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Die lassen mich meist alleine.");
talkEntry:addResponse("Manchmal gehe ich nach Cadomyr um meine Schaufel reparieren zu lassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Rabla-bab!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Rabla-bab!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I talk to you about sand, but not about THAT.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich rede gerne über Sand, aber nicht über DAS!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar, Salkamaer, Salkmar... I keep forgetting how one pronounces that realm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar, Salkamaer, Salkmar... Ich kann mir einfach nicht merken, wie man das Reich ausspricht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Gods!? Look around! Do you see any gods here? Just sand? What a surprise!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Götter!? Siehst du hier etwa irgendwo Götter? Nur Sand? Was für eine Überraschung!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("It is pretty hot and arid here, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ist es nicht recht heiß und trocken hier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("It is windy today... Is that divine intervention?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Es ist ziemlich windig heute... ob das göttliches Wirken ist?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("The Katabi desert is tanoraforsaken!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Die Katabiwüste ist tanoraverlassen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I'm not ar but a digger!");
talkEntry:addResponse("I do not sell or buy anything, but I may have a quest for you.");
talkEntry:addResponse("No trading! However, You could get some coins, if you do a task for me.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich bin kein Händler sondern ein Gräber!");
talkEntry:addResponse("Ich kaufe und verkaufe nichts, aber ich habe vielleicht eine Aufgabe für dich.");
talkEntry:addResponse("Kein Handel! Wie auch immer, du kannst ein paar Münzen bekommen, wenn du einen Auftrag erledigst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("We have to be very thankful that the shovel allows us to work with it.");
talkEntry:addResponse("Without shovel; no clay, without clay; no bricks, without bricks; no house! The shovel if the beginning of everything.");
talkEntry:addResponse("Dig for sand next to rocks. You can find the best sand to make glass there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wir müssen dankbar sein, dass die Schaufel uns das Arbeiten mit ihr erlaubt.");
talkEntry:addResponse("Ohne Schaufel kein Lehm, ohne Lehm keine Ziegel, ohne Ziegel kein Haus! Die Schaufel ist der Anfang von Allem.");
talkEntry:addResponse("Grabe neben Steinen nach Sand. Da findet du den besten Sand zum Glasmachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rutrus");
talkEntry:addResponse("Rutrus, that's me, most probably. State your business!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rutrus");
talkEntry:addResponse("Rutrus, das bin wahrscheinlich ich. Was gibt es denn?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("I do not agree.");
talkEntry:addResponse("Indeed!");
talkEntry:addResponse("Really?");
talkEntry:addResponse("Why?");
talkEntry:addResponse("Ah, yes.");
talkEntry:addResponse("Whatever.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Dem kann ich nicht zustimmen.");
talkEntry:addResponse("In der Tat.");
talkEntry:addResponse("Wirklich?");
talkEntry:addResponse("Warum?");
talkEntry:addResponse("Ahja.");
talkEntry:addResponse("Mir egal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("I agree.");
talkEntry:addResponse("Indeed!");
talkEntry:addResponse("Really?");
talkEntry:addResponse("Why?");
talkEntry:addResponse("Ah, yes.");
talkEntry:addResponse("Whatever.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Dem muss ich zustimmen.");
talkEntry:addResponse("In der Tat.");
talkEntry:addResponse("Wirklich?");
talkEntry:addResponse("Warum?");
talkEntry:addResponse("Ahja.");
talkEntry:addResponse("Mir egal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht sich durch das Haar und lässt so einige Sandkörner herumfliegen.", "#me runs a hand through his hair and a few grains of sand fly from it.");
talkingNPC:addCycleText("#me säubert seine Schaufel.", "#me cleans his shovel. ");
talkingNPC:addCycleText("Na warte, Wüste. Ich grabe so lange, bis du erledigt bist!", "Just wait, desert. I'll keep on digging 'til you're gone!");
talkingNPC:addCycleText("#me lässt seinen Blick durch die Gegend wandern, während er sich auf seiner Schaufel abstützt.", "#me leans on his shovel and looks around.");
talkingNPC:addCycleText("Ein Mann ohne Schaufel ist nur ein halber Mann.", "A man without a shovel is just half a man.");
talkingNPC:addCycleText("#me murmelt etwas zu seiner Schaufel.", "#me murmurs to his shovel.");
talkingNPC:addCycleText("Ich sollte beginnen, ein Loch im Sand auszuheben.", "I should start to dig a hole.");
talkingNPC:addCycleText("Es gibt hier eindeutig zu viel Sand.", "Too much sand here, am I not right?");
talkingNPC:addCycleText("Verdammt soll derjenige sein, der all den Sand genau hier hin bringen mußte!", "Cursed be the one who brought all that sand to exactly this location.");
talkingNPC:addCycleText("Aus der Nordbrücke wird noch eine Sandbrücke.", "The Northbridge will become a Sandybridge.");
talkingNPC:addCycleText("Willkommen in... im Sand!", "Welcome to the... sand!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Gräber Rutrus.", "This NPC is the digger Rutrus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 24);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 526);
mainNPC:setEquipment(9, 367);
mainNPC:setEquipment(10, 53);
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