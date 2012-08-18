--------------------------------------------------------------------------------
-- NPC Name: Ehrom Goldhammer                                            Free --
-- NPC Job:  smuggler                                                         --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  628, 288, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 628, 288, 0, 6, 'Ehrom Goldhammer', 'npc.ehrom_goldhammer', 0, 3, 4, 242, 182, 0, 207, 158, 116);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.ehrom_goldhammer", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the smuggler Ehrom Goldhammer. Keyphrases: Hello, quest, smuggler."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schmuggler Ehrom Goldhammer. Schlüsselwörter: Hallo, Quest, Schmuggler."));
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
talkEntry:addResponse("Greetings! Could it be that he send you to me to help me with my task?");
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
talkEntry:addResponse("Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings! Could it be that Ronagan sent you to me to help me with my task?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ronagan zum Gruße! Könnte es sein, dass Ronagan Euch zu mir geschickt hat, um mir bei meiner Aufgabe zu helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Ronagan's blessing! And watch your back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Ronagans Segen! Und paßt auf, was hinter euch passiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ronagan's blessing! And watch your back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ronagan's Segen! Und Und paßt auf, was hinter euch passiert!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Besides my poor back I'm fine, thank you! Maybe you can help me with a task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Abgesehen von meinem Rücken geht es mir gut, danke sehr! Vielleicht könnte Ihr mir ja bei einer Aufgabe helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("In front of you stands the smuggler Ehrom Goldhammer, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Vor Euch steht der Schmuggler Ehrom Goldhammer, aye!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler I"));
talkEntry:addResponse("So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler I"));
talkEntry:addResponse("Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler I"));
talkEntry:addResponse("So you want to help me. A client of mine needs five copper goblets for a banquet, but I cannot get to Cadomyr's finesmiths to obtain them. I'll reward you generously!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler I"));
talkEntry:addResponse("Ihr wollt mir also helfen. Einer meiner Klienten benötigt fünf Kupferkelche für ein Bankett. Ich kann allerdings nicht nach Cadomyr gehen, um sie von den Schmieden dort zu besorgen. Ich werde euch großzügig belohnen!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1840, "all", ">", "4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 500 copper coins."));
talkEntry:addResponse("By Ronagan, you brought copper goblets. Take these silver coins as a small appreciation. But I could use your service again for another order.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1840, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1840, "all", ">", "4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 500 Kupferstücke."));
talkEntry:addResponse("Bei Ronagan, ihr habt tatsächlich die Kupferkelche gebracht. Nehmt diese Silberstücke als kleine Anerkennung. Allerdings könnte ich nochmal Eure Dienste bei einem Auftrag brauchen.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1840, 5));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I need at least five copper goblets. Return to be when you have them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 1));
talkEntry:addResponse("Ich brauche wenigstens fünf Kupferkelche. Kehrt zurück wenn ihr sie habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 1));
talkEntry:addResponse("I need at least five copper goblets. Return to be when you have them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 1));
talkEntry:addResponse("Ich brauche wenigstens fünf Kupferkelche. Kehrt zurück wenn ihr sie habt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler II"));
talkEntry:addResponse("I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler II"));
talkEntry:addResponse("Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler II"));
talkEntry:addResponse("I got a new order from abroad. A dwarven souvereign ordered two dwarven state armours. But I cannot get to Galmair to get them due to... personal reasons. Please help me for a reward.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler II"));
talkEntry:addResponse("Ich habe eine neue Bestellung aus einem fernen Land bekommen. Ein Zwergenherrscher benötigt zwei Zwergenprunkrüstungen, ich kann aber aus... persönlichen Gründen nicht einfach nach Galmair spazieren, um sie zu holen. Helft mir bitte, für eine angemessene Belohnung.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2390, "all", ">", "1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 5000 copper coins."));
talkEntry:addResponse("Aye aye, I have to say that you are getting better and better. These silver coins are yours now.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 5000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2390, 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2390, "all", ">", "1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 5000 Kupferstücke."));
talkEntry:addResponse("Aye aye, ich muß schon sagen, Ihr werdet immer besser. Diese Silberstücke gehören nun Euch.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 5000));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2390, 2));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My customer needs two dwarven state armours, discreet and fast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 3));
talkEntry:addResponse("Mein Kunde benötigt zwei diskret erworbene Zwergenprunkrüstungen. Bitte beeilt euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 3));
talkEntry:addResponse("My customer needs two dwarven state armours, discreet and fast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 3));
talkEntry:addResponse("Mein Kunde benötigt zwei diskret erworbene Zwergenprunkrüstungen. Bitte beeilt euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler III"));
talkEntry:addResponse("A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler III"));
talkEntry:addResponse("Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler III"));
talkEntry:addResponse("A customer, who prefers to remain unnamed, ordered five black priest robes of Runewick origin. 'For his freshmen', he said. Will you bring me those?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler III"));
talkEntry:addResponse("Einer meiner Auftraggeber, der unerkannt bleiben möchte, hat fünf schwarze Priesterroben nach Runewick-Machart bestellt. 'Für seine Frischlinge', hat er gesagt. Besorgt ihr mir die?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2420, "all", ">", "4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a magical blackstone ring."));
talkEntry:addResponse("It seems as if Ronagan is looking on you benevolently. My customer gave me this ring in advance, it is now yours.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2420, 5));
talkEntry:addConsequence(npc.base.consequence.item.item(278, 1, 999, 42));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2420, "all", ">", "4));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen magischen Schwarzsteinring."));
talkEntry:addResponse("As scheint, als wäre Ronagan Euch wohlgesonnen. Mein Auftraggeber gab mir diesen Ring als Anzahlung, er ist nun Euer.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2420, 5));
talkEntry:addConsequence(npc.base.consequence.item.item(278, 1, 999, 42));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Just five black priest robes is all I still need for my customer. And no questions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 5));
talkEntry:addResponse("Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 5));
talkEntry:addResponse("Just five black priest robes is all I still need for my customer. And no questions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 5));
talkEntry:addResponse("Fünf schwarze Priesterroben sind alles, was ich für meinen Kunden brauche. Und keine Fragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler IV"));
talkEntry:addResponse("Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler IV"));
talkEntry:addResponse("Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] The Smuggler II"));
talkEntry:addResponse("Psst! I need you for a very special task. Sneak into Runewick and get me a wand of wind. For what? None of your business!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 6));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schmuggler IV"));
talkEntry:addResponse("Psst! Ich brauche euch für eine besondere Aufgabe. Schleicht euch nach Runewick und bringt mir einen Zauberstab des Windes. Wofür? Das geht euch nichts an!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2785, "all", ">", "0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a fire longsword."));
talkEntry:addResponse("Ronagan's thanks... yes, this wand should be good enough. I just have this word for your, I want to get rid of it. Do not ask why and accept it.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2785, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(206, 1, 999, 14));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2785, "all", ">", "0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Feuerlangschwert."));
talkEntry:addResponse("Ronagans Dank... ja, dieser Zauberstab sollte gut genug sein. Ich habe nur dieses Schwert für euch, welches ich gerne loswerden würde. Fragt nicht, warum und nehmt es an.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2785, 1));
talkEntry:addConsequence(npc.base.consequence.item.item(206, 1, 999, 14));
talkEntry:addConsequence(npc.base.consequence.quest.quest(72, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ronagan knows that I do my best. Do your best and bring me a wand of wind for my customer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 7));
talkEntry:addResponse("Ronagan weiß, dass ich mich bemühe. Bemüht euch auch und bringt mir einen Stab des Windes für meinen Kunden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 7));
talkEntry:addResponse("Ronagan knows that I do my best. Do your best and bring me a wand of wind for my customer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 7));
talkEntry:addResponse("Ronagan knows that I do my best. Do your best and bring me a wand of wind for my customer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ronagan with you... there is nothing left that you can do for me at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 8));
talkEntry:addResponse("Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 8));
talkEntry:addResponse("Ronagan with you... there is nothing left that you can do for me at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(72, "=", 8));
talkEntry:addResponse("Ronagan mit Euch... es ist nichts übrig, was Ihr für mich momentan tun könntet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Smuggler is such a prestressed word. I make good available to those who have no access to them... at a cost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Schmuggler, das ist so ein vorbelastetes Wort. Ich mache Waren denen zugänglich, die sie normalerweise nicht bekommen würden... für eine Gebühr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Smuggler is such a prestressed word. I make good available to those who have no access to them... at a cost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Schmuggler, das ist so ein vorbelastetes Wort. Ich mache Waren denen zugänglich, die sie normalerweise nicht bekommen würden... für eine Gebühr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I used to trade Sibanac with some halfling fellow on Gobaith... Brendan Mason was his name I guess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich hab damals Sibanac mit einem Halbling auf Gobaith gehandelt... Brendan Mason war sein Name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("You gave me your name, what do you want from me now? Money?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Danke für euren Namen, was wollt ihr jetzt von mir? Geld?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("smuggler");
talkEntry:addTrigger("smuggle");
talkEntry:addResponse("Smuggler is such a prestressed word. I make good available to those who have no access to them... at a cost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schmuggler");
talkEntry:addTrigger("Schmuggel");
talkEntry:addResponse("Schmuggler, das ist so ein vorbelastetes Wort. Ich mache Waren denen zugänglich, die sie normalerweise nicht bekommen würden... für eine Gebühr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tunnel");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("As we dwarves like to say: Tunnels are absence of rock in a mountain. But you should always mind your head in the tunnels.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stollen");
talkEntry:addTrigger("Tunnel");
talkEntry:addResponse("Wie wir Zwerge immer sagen: Stollen sind Abwesenheit von Gestein in einem Berg. Aber Ihr solltet in den Stollen immer auf Euren Kopf aufpassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mountain");
talkEntry:addResponse("Yes, it is true that we dwarves prefer to live under a mountain. We enjoy the comforting and protecting sturdiness of the rocks... and its wealth inside.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Berg");
talkEntry:addResponse("Ja, es ist wahr, wir Zwerge bevorzugen es, unter einem Berg zu leben. Wir genießen die beruhigende und beschützende Festigkeit des Gesteins... und seinen Reichtum im Inneren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wealth");
talkEntry:addResponse("Well, wealth leads to envy. Envy leads to war. And war leads to suffering. So wealth is both a blessing and a curse. Ronagan knows that, aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reichtum");
talkEntry:addTrigger("Reichtümer");
talkEntry:addResponse("Nun, Reichtum führt zu Neid. Neid führt zu Krieg. Krieg führt zu Leid. Reichtum ist also sowohl ein Segen als auch ein Fluch. Ronagan weiß das, aye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("darkness");
talkEntry:addResponse("Darkness is part of a life under the mountain. We dwarves can live with it easily but people from the world above sometimes have a problem with it. But you can use a portable light source to fight the darkness.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dunkelheit");
talkEntry:addResponse("Dunkelheit ist Teil des Lebens unter dem Berg. Wir Zwerge können leicht damit leben, aber Leute von der Welt oben haben manchmal ein Problem damit. Aber Ihr könnt eine tragbare Lichtquelle verwenden, um die Dunkelheit zu bekämpfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("light");
talkEntry:addResponse("There may not be much daylight under the mountain but we have other light sources. We use torches, candles, lanterns or lamps.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Licht");
talkEntry:addTrigger("Lichtquelle");
talkEntry:addResponse("Es mag vielleicht nicht genug Tageslicht unter dem Berg geben aber wir haben andere Lichtquellen. Wir verwenden Fackeln, Kerzen, Laternen oder Lampen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("portal");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I have heard that there are portals all over the land. They seem to be linked with each other somehow. You step inside, announce where you want to go and in a blink of an eye you are there. I would never use such a magic device.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Portal");
talkEntry:addResponse("Ich habe gehört, dass es überall Portale gibt. Sie scheinen irgendwie miteinander verbunden zu sein. Man betritt sie, sagt wohin man will und im nächten Augenblick ist man dort. Ich würde nie ein solches magisches Gerät benutzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pickaxe");
talkEntry:addResponse("The pickaxe is the best tool for mining. But don't be fooled by the simple appearance. It is difficult to master. You won't be the first to end up with a pickaxe in a leg, so please be careful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spitzhacke");
talkEntry:addResponse("Die Spitzhacke ist das beste Werkzeug für den Bergbau. Aber laßt Euch nicht vom einfachen Äußeren täuschen. Es ist schwer zu meistern. Ihr wäret nicht der Erste mit einer Spitzhacke im Bein endet, also seid bitte vorsichtig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hammer");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The hammer is the trademark of any smith. There are different hammers for each and every purpose. It is important to use the right hammer for the appropriate task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hammer");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Der Hammer ist das Erkennungsmerkmaler aller Schmiede. Es gibt verschiedene Hämmer für jeden Zweck. Es ist wichtig den richtigen Hammer für die entsprechende Aufgabe zu benutzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gem");
talkEntry:addResponse("Gems are the true treasure of the mountain. There are many different gems but they all have something in common. They are all rare and you'll need a lot of luck to find suitable raw pieces, I can tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Edelstein");
talkEntry:addResponse("Edelsteine sind der wahre Schatz des Berges. Es gibt viele verschiedene Edelsteine, aber alle haben etwas gemeinsam. Sie sind alle sehr selten und Ihr braucht schon viel Glück passende rohe Stücke zu finden, das kann ich Euch sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If archmage Morgan knew that his minions order things from me, I think he would slap them with a book.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Wenn Erzmagier Morgan wüßte, dass seine Leute bei mir Waren bestellen, dann würde er sie sicher mit einem Buch verprügeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If archmage Morgan knew that his minions order things from me, I think he would slap them with a book.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wenn Erzmagier Morgan wüßte, dass seine Leute bei mir Waren bestellen, dann würde er sie sicher mit einem Buch verprügeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The people of Runewick come to me to trade for metals and minerals. If you look for them you have to travel south and east.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die Leute aus Runewick kommen zu mir, um Metalle und Mineralien einzutauschen. Wenn Ihr sie sucht, so müßt Ihr nach Süden und Osten reisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If the Don would not rule Galmair, I'd be there again. He interfered with my business too much, so I... had to leave.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("don");
talkEntry:addResponse("Wenn der Don nicht Galmair kontrollieren würde, wäre ich längst wieder da. Er hat sich zu sehr in mein Geschäft eingemischt, also... musste ich das Weite suchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, Galmair. You want to know about Galmair? It is much like us dwarves. It may not appear as much on the outside, but its wealth lies within. More I won't reveal at the moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Oh, Galmair. Ihr möchtet etwas über Galmair erfahren? Es ist wie wir Zwerge. Es mag von außen als nicht viel erscheinen, aber sein Reichtum liegt innen. Mehr werde ich im Moment nicht verraten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The queen has placed a bounty on my head. Literally, on my head. So, I better avoid the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die Königin hat ein Kopfgeld auf mich ausgesetzt. Genauer, auf meinen Kopf, im wahrsten Sinne des Wortes. Also bleibe ich besser der Wüste fern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The queen has placed a bounty on my head. Literally, on my head. So, I better avoid the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Königin hat ein Kopfgeld auf mich ausgesetzt. Genauer, auf meinen Kopf, im wahrsten Sinne des Wortes. Also bleibe ich besser der Wüste fern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr is wealthy, but they don't like me there anymore. I have no honour, they say, so I deserve no head anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist reich an Schätzen, aber sie mögen mich nicht mehr dort. Ich hätte keine Ehre, sagen sie, und daher sollte ich auch keinen Kopf mehr verdient haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Albar?! Oh please, let us talk about something more relevant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar?! Oh, bitte, lasst uns über etwas wichtigeres sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some think, all dwarves come from Sevenmountains. I am from Gynk and proud of it!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Viele denken, alle Zwerge kommen aus Siebenbergen. Ich bin aus Gynk und stolz darauf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Salkamar, where is that, anyway?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar, wo soll das eigentlich sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("You may guess what god I pray to. One hint: It isn't Sirani.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ihr dürft dreimal raten, zu welchem Gott ich bete. Ein Tipp: Es ist nicht Sirani.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hmm? Shhh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Hmm? Shhh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I pray to Ronagan, but it is more a matter of respect than worshipping.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ich bete zu Ronagan, aber das hat viel mehr mit Respekt als mit Ehrerbietung zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't have anything I want to trade at the moment. But I have a special task for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich gibt momentan nichts, was ich handeln möchte. Aber ich habe einen Sonderauftrag für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I don't have time to tell stories. Ronagan be my witness, I'm a dwarf of deeds not of words.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich habe keine Zeit Geschichten zu erzählen. Ronagan sei mein Zeug, ich bin ein Zwerg der Taten, nicht der Worte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehrom");
talkEntry:addTrigger("Goldhammer");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ehrom Goldhammer is indeed my name. Who told you? Me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ehrom");
talkEntry:addTrigger("Goldhammer");
talkEntry:addResponse("Ehrom Goldhammer ist in der Tat mein Name. Wer hat euch den verraten? Ich etwa?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Pardon, I don't understand what you are referring to.");
talkEntry:addResponse("What do you mean with 'Yes'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
talkEntry:addResponse("Was meint Ihr mit 'Ja'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Pardon, I don't understand what you are referring to.");
talkEntry:addResponse("What do you mean with 'No'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Verzeiht, ich verstehe nicht, worauf Ihr Euch bezieht.");
talkEntry:addResponse("Was meint Ihr mit 'Nein'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me begutachtet einen Edelstein in seiner Hand sehr sorgfältig.", "#me inspects a gem in his hand thoroughly.");
talkingNPC:addCycleText("#me streicht seinen dunkelgrauen Bart.", "#me strokes his dark grey beard.");
talkingNPC:addCycleText("#me murmelt etwas in seinen dunkelgrauen Bart.", "#me voices something under his breath.");
talkingNPC:addCycleText("#me betrachtet nachdenklich einen Stein in seiner Hand aus allen Winkeln bevor er ihn wegwirft.", "#me examines a stone in his hand thoughtfully from all angles before throwing it away.");
talkingNPC:addCycleText("Arr!", "Arr!");
talkingNPC:addCycleText("Arr.", "Arr.");
talkingNPC:addCycleText("Arr?", "Arr?");
talkingNPC:addCycleText("Das wird einen guten Preis erzielen.", "This will yield a good price.");
talkingNPC:addCycleText("Geheimverstecke? Pah, je offener, desto besser, dann fragt keiner.", "Secret compartment? Pah, the more visible, the better. Nobody is gonna ask then.");
talkingNPC:addCycleText("Ein gutes Geschäft verlangt nicht nach einem guten Gewissen.", "A good business does not require a good conscience.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schmuggler Ehrom Goldhammer.", "This NPC is the smuggler Ehrom Goldhammer.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2390);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 88);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2112);
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