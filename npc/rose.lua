--------------------------------------------------------------------------------
-- NPC Name: Rose                                                     Galmair --
-- NPC Job:  Companion                                                        --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  404, 292, 0            --
-- NPC Sex:  female                     NPC Direction: southwest              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: October 28, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 404, 292, 0, 5, 'Rose', 'npc.rose', 1, 2, 0, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.money")
require("npc.base.condition.quest")
require("npc.base.condition.sex")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.rose", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Rose the Companion. Keywords: race, gods, company, adventure."));
talkEntry:addResponse("Ask me about 'company','profession' or 'adventure', answering with 'yes' or 'no'.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Rose die Gesellschafterin. Schlüsselwörter: Völker, Götter, Gesellschaft, Beruf, Abenteuer."));
talkEntry:addResponse("Frage bei mir nach 'Gesellaschft','Beruf' oder 'Abenteuer', antworte eventuell mir mit 'ja' oder 'nein'.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gesellschaft");
talkEntry:addResponse("Du möchtest das ich dir Gesellschaft leiste?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("compan");
talkEntry:addResponse("Do you want me to keep you company?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addTrigger("deine aufgabe");
talkEntry:addTrigger("eure aufgabe");
talkEntry:addTrigger("t[äae]+tigkeit");
talkEntry:addTrigger("was tust du");
talkEntry:addTrigger("was tut ihr");
talkEntry:addResponse("Ich bin Näherin. Hast du Löcher in deinen Socken die ich stopfen soll?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addTrigger("what you do");
talkEntry:addTrigger("occupation");
talkEntry:addResponse("I'm a seamstress. Do you have holes in your socks which I can help with?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("warenliste");
talkEntry:addResponse("Ich verkaufe meine Gesellschaft, Schätzchen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("list wares");
talkEntry:addResponse("I sell my company, sweety!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 3));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Fein, ich will aber 250 Kupfermünzen dafür haben. In Ordnung?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 3));
talkEntry:addTrigger("yes");
talkEntry:addResponse("Great, But you have to give me 250 coppercoins?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 3));
talkEntry:addTrigger("nein");
talkEntry:addResponse("Gut, komm wieder falls du doch noch möchtest.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 3));
talkEntry:addTrigger("no");
talkEntry:addResponse("Allright, come again if you change your mind.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 4));
talkEntry:addTrigger("nein");
talkEntry:addResponse("Nein? Was soll das heißen? Du kommst dir wohl zu fein für meine Gesellschaft vor!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 4));
talkEntry:addTrigger("no");
talkEntry:addResponse("No? What are you trying to say? I'm not good enough for you?!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 4));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Fantastisch, komm wir suchen uns ein ruhiges Plätzchen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 250));
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 250));
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 4));
talkEntry:addTrigger("yes");
talkEntry:addResponse("Awesome, come on, lets go somewhere more... quiet.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 250));
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 4));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Schätzchen, du hast ja gar nicht geügend Münzen. Geh schnell welche hohlen, ich warte auf dich!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 4));
talkEntry:addTrigger("yes");
talkEntry:addResponse("Sorry sweetheart, you havn't enough coins. Go fetch them, I'll wait for you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Fein und weil ich dich gern hab will ich nur 200 Kupfermünzen dafür haben. In Ordnung?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(303, ">", 7));
talkEntry:addTrigger("yes");
talkEntry:addResponse("Great, its just 200 coppercoins. A special price for my honey!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 200));
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 5));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Fantastisch, komm wir suchen uns ein ruhiges Plätzchen.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.money.money("=>", 200));
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 5));
talkEntry:addTrigger("yes");
talkEntry:addResponse("Awesome, lets go somewhere more quiet.");
talkEntry:addConsequence(npc.base.consequence.money.money("-", 200));
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 5));
talkEntry:addTrigger("ja");
talkEntry:addResponse("Schätzchen, du hast ja gar nicht geügend Münzen. Geh schnell welche hohlen, ich warte auf dich!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 5));
talkEntry:addTrigger("yes");
talkEntry:addResponse("Sweetie, you havn't enough coins. Go get them, I'll wait for you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 5));
talkEntry:addTrigger("nein");
talkEntry:addResponse("Nein? Was soll das heißen? Du kommst dir wohl zu fein für meine Gesellschaft vor!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 5));
talkEntry:addTrigger("no");
talkEntry:addResponse("No? What are you trying to say? Do you think I'm not good enough for you?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("was kauft");
talkEntry:addTrigger("was kaufst");
talkEntry:addResponse("#w Für deine 'Wahre' musst du einen professionellen 'Händler' finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addTrigger("sell");
talkEntry:addTrigger("what buy");
talkEntry:addResponse("#w you have to find a professional 'r' to sell your 'goods'.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("yes");
talkEntry:addResponse("#w Do you think, you have the ability to 'find' an item which is already in someone else's possession?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("ja");
talkEntry:addResponse("#w Denkst du, du kannst nach einem Gegenstand suchen der im Momment einer anderen Person gehört?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("no");
talkEntry:addResponse("Don't worry, I'll find someone else");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 6));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("nein");
talkEntry:addResponse("In Ordnung, dann muss ich mir jemand anderen dafür suchen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("yes");
talkEntry:addResponse("#w Allright, listen to me. I'm searching a special necklace. It's a heirloom of my family. My stupid brother sold it to a merchant. You should bring it back to me. Ask me for 'information' if you need me to repeat it for you.  Search the mearchant in Varshikar. His name is Gilbert. Do not listen to him, he will just lie to you. Well, good luck, I am waiting for you.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("ja");
talkEntry:addResponse("#w In Ordnung, hör zu. Ich suche ein besonderes Kollier. Es ist ein Erbstück meiner Familie, aber mein Bruder hat es einem Händler verkauft. Kannst du es bitte zurückbringen? Frage mich wenn nach 'Informationen' wenn ich die Details wiederholen soll.   Suche den Händler in Varshikar, sein Name ist Gilbert. Am Besten hörst du ihm gar nicht zu was er sagt, er würde dich nur belügen. Viel Glück! Ich warte hier auf dich.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("no");
talkEntry:addResponse("I'll ask someone else");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 7));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 1));
talkEntry:addTrigger("nein");
talkEntry:addResponse("In Ordnung, dann muss ich mir jemand anderen dafür suchen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addResponse("#w Allright, listen to me. I'm searching for a special necklace. It's a heirloom of my family. My stupid brother sold it to a merchant. You should bring it back to me. Search the mearchant in Varshikar. His name is Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#w Allright, listen to me. I'm searching for a special necklace. It's a heirloom of my family. My stupid brother sold it to a merchant. You should bring it back to me. Search the mearchant in Varshikar. His name is Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("#w In Ordnung, hör zu. Ich suche ein besonderes Kollier. Es ist ein Erbstück meiner Familie, aber mein Bruder hat es einem Händler verkauft. Kannst du es bitte zurückbringen? Suche den Händler in Varshikar, sein Name ist Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addResponse("#w In Ordnung, hör zu. Ich suche ein besonderes Kollier. Es ist ein Erbstück meiner Familie, aber mein Bruder hat es einem Händler verkauft. Kannst du es bitte zurückbringen? Suche den Händler in Varshikar, sein Name ist Gilbert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you 100 coppercoins. It feels good, doesn't it?"));
talkEntry:addResponse("Oh, that's amazing! You really found it! This to compensate you for your effort.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie bezahlt dir 100 Kupferlinge. Das fühlt sich gut an, oder?"));
talkEntry:addResponse("Oh wie fantastisch! Du hast es wirklich gefunden! Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addResponse("Yes? You found it? Amazing... but hey where is it? You havn't the necklace with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addResponse("Ja? Du hast es gefunden? Fantastisch... aber wo hast du's? Du hast das Kollier nicht bei dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=", 1, nil));
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you 100 coppercoins. It feels good, right?"));
talkEntry:addResponse("Oh, that's amazing! You really found it! This to compensate you for your effort.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "belt", "=", 1, nil));
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie bezahlt dir 100 Kupferlinge. Das fühlt sich gut an, oder?"));
talkEntry:addResponse("Oh wie fantastisch! Du hast es wirklich gefunden! Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(79, 1, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Yes? You found it? Amazing... but hey where is it? Bring it with you next time");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("Ja? Du hast es gefunden? Fantastisch... aber wo hast du's? Du hast das Kollier nicht bei dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Put the necklet into your belt, when you are willing to give it Rose."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=>", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Lege das Amuelett in deinen Gürtel, um es Rose zu geben."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=", 1, nil));
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Put the necklet into your belt, when you are willing to give it Rose."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(79, "all", "=", 1, nil));
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Lege das Amuelett in deinen Gürtel, um es Rose zu geben."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("#w Oh ja, jetzt müssen wir dafür sorgen, dass Gilbert nicht auf falsche Ideen kommt. Kannst du diese Fälschung in seine Tasche stecken, ohne dass er es bemerkt?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addResponse("#w Oh ja, jetzt müssen wir dafür sorgen, dass Gilbert nicht auf falsche Ideen kommt. Kannst du diese Fälschung in seine Tasche stecken, ohne dass er es bemerkt?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#w Hmm, now we have to take care, that Gilbert doesn't get false ideas. Could you place this fake into his bag without getting caught?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addResponse("#w Hmm, now we have to care, taht Gilbert don't get false ideas. Could you place this fake into his bag without getting caught?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addTrigger("Ja");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie legt dir ein Bündel gerollten Stoff in die Hände. Darinn findest du ein Kollier."));
talkEntry:addResponse("#w Großartig, nimm dieses gefälschte Kollier und schiebe es umbermerkt in Gilberts Tasche. Er wird den Trick nicht bemerken. Frage mich wenn nach 'Infromationen' wenn ich die Details wiederholen soll.");
talkEntry:addConsequence(npc.base.consequence.item.item(222, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addTrigger("Nein");
talkEntry:addResponse("In Ordnung, dann muss ich mir jemand anderen dafür suchen.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addTrigger("Yes");
talkEntry:addConsequence(npc.base.consequence.inform.inform("She places a bundle of cloth in your hands. Inside you are able to feel a necklace."));
talkEntry:addResponse("#w Awesome, take this fake necklace and put it unnoticed into Gilbert's bag. He shouldn't notice any difference. Ask me for 'information' if I should repeat the details.");
talkEntry:addConsequence(npc.base.consequence.item.item(222, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "=", 9));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 4));
talkEntry:addTrigger("No");
talkEntry:addResponse("Allrigth, so I have to ask another one.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addResponse("#w Allright, listen to me. Take the fake necklace and put it unnoticed into Gilbert's bag, who stays at Varshikar. He will not realise what happened");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addResponse("#w Allright, listen to me. Take the fake necklace and put it unnoticed into Gilbert's bag, who stays at Varshikar. He will not realise what happened.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("#w In Ordnung, hör zu. Nimm dieses gefälschte Kollier, gehe nach Varshikar und schiebe es umbermerkt in Gilberts Tasche. Er wird den Trick nicht bemerken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("info");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addTrigger("detail");
talkEntry:addResponse("#w In Ordnung, hör zu. Nimm dieses gefälschte Kollier, gehe nach Varshikar und schiebe es umbermerkt in Gilberts Tasche. Er wird den Trick nicht bemerken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you again 100 coppercoins. It feels also feels good, right?"));
talkEntry:addResponse("Great work, Gilbert hasn't noticed. So he's never going to start searching for the necklace. This to compensate you for your effort!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you again 100 coppercoins. It feels also feels good, right?"));
talkEntry:addResponse("Great work, Gilbert hasn't noticed. So he's never going to start searching for the necklace. This to compensate you for your effort!!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("She pays you again 100 coppercoins. It feels again good, agree?"));
talkEntry:addResponse("Gut gemacht! Gilbert hat unseren Trick nicht bemerkt. Jetzt wird er erst gar nicht anfangen nach dem Kollie zu suchen. Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=", 7));
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sie bezahlt dir abermals 100 Kupferlinge. Das fühlt sich abermals gut an, oder?"));
talkEntry:addResponse("Gut gemacht! Gilbert hat unseren Trick nicht bemerkt. Jetzt wird er erst gar nicht anfangen nach dem Kollie zu suchen. Das ist für deine Mühe.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("info");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, you should remember this name. Maybe you'll meet him someday."));
talkEntry:addResponse("I'm sorry my dear, I havn't any more tasks for you. A lot of thanks for helping with the necklace. But if you really need a job, why you don't ask the Gibberson for it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addTrigger("necklet");
talkEntry:addTrigger("necklace");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, you should remember this name. Maybe you'll meet him someday."));
talkEntry:addResponse("I'm sorry my dear, I havn't any more tasks for you. A lot of thanks for helping with the necklace. But if you really need a job, why you don't ask the Gibberson for it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("job");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("info");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, den Namen solltest du dir merken. Vielleicht triffst du diese Person eines Tages."));
talkEntry:addResponse("Es tut mir Leid mein Schatz, ich habe keine weiteren Aufgaben für dich. Danke für die Hilfe mit dem Kollier. Aber wenn du so unbedingt Geld brauchst, warum fragst du dann nicht den Gibberson?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=>", 8));
talkEntry:addTrigger("kollier");
talkEntry:addTrigger("amulett");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Gibberson, den Namen solltest du dir merken. Vielleicht triffst du diese Person eines Tages."));
talkEntry:addResponse("Es tut mir Leid mein Schatz, ich habe keine weiteren Aufgaben für dich. Danke für die Hilfe mit dem Kollier. Aber wenn du so unbedingt Geld brauchst, warum fragst du dann nicht den Gibberson?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addTrigger("sell");
talkEntry:addTrigger("what buy");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should ask more 'Rose' more about the quest."));
talkEntry:addResponse("#w you have to find a professional 'r' to sell your 'goods'. But I could offer you a quest if you are in need of money?");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addTrigger("verkauf");
talkEntry:addTrigger("was kauft");
talkEntry:addTrigger("was kaufst");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vielleicht solltest du 'Rose' über die Aufgabe befragen."));
talkEntry:addResponse("#w Für deine 'Wahre' musst du einen professionellen 'Händler' finden, aber ich hätte eine Aufgabe für dich wenn du dir etwas verdienen möchtest?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addResponse("#w Möchtest du etwas Geld verdienen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addTrigger("verdienen");
talkEntry:addTrigger("aufgabe");
talkEntry:addTrigger("abenteuer");
talkEntry:addResponse("#w Möchtest du etwas Geld verdienen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("job");
talkEntry:addResponse("#w Do you want to earn some money?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(316, "<", 2));
talkEntry:addCondition(npc.base.condition.quest.quest(303, "=<", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("money");
talkEntry:addTrigger("earn");
talkEntry:addResponse("#w Do you want to earn some money?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(316, "=", 6));
talkEntry:addConsequence(npc.base.consequence.quest.quest(303, "=", 1));
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
talkEntry:addResponse("Be greeted, I'm seamstress %NPCNAME.");
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Greets.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted.");
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
talkEntry:addResponse("Grüß dich, ich bin die Näherin %NPCNAME.");
talkEntry:addResponse("#me zwinkert dich verführerisch an.");
talkEntry:addResponse("Grüße.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Be greeted, I'm seamstress %NPCNAME.");
talkEntry:addResponse("Good day.");
talkEntry:addResponse("Greetings.");
talkEntry:addResponse("Greets.");
talkEntry:addResponse("Hello.");
talkEntry:addResponse("Be greeted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüß dich, ich bin die Näherin %NPCNAME.");
talkEntry:addResponse("#me zwinkert dich verführerisch an.");
talkEntry:addResponse("Grüße.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir");
talkEntry:addResponse("You're leaving? I'll miss you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Auf bald");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir.");
talkEntry:addResponse("Mach's gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Bye.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir");
talkEntry:addResponse("You're leaving? I'll miss you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Tschüß.");
talkEntry:addResponse("Tschüss.");
talkEntry:addResponse("Wiedersehen.");
talkEntry:addResponse("Auf bald");
talkEntry:addResponse("Gehabt euch wohl.");
talkEntry:addResponse("Ciao");
talkEntry:addResponse("Adieu");
talkEntry:addResponse("Au revoir.");
talkEntry:addResponse("Mach's gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine.");
talkEntry:addResponse("Great, and you?");
talkEntry:addResponse("Pfff!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Pfff!");
talkEntry:addResponse("Danke, gut.");
talkEntry:addResponse("Ja, ja, und dir?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm seamstress %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin die Näherin %NPCNAME.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("näherin");
talkEntry:addResponse("Ich leiste den Leuten Gesellschaft, wenn sie das wollen. Diskretion, ist bei mir natürlich oberstes Gebot.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("seamstress");
talkEntry:addResponse("If you like I can keep you company. Of course I'll be completly discreet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nähen");
talkEntry:addResponse("Das musst du wohl selbst herausfinden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sewing");
talkEntry:addResponse("You have to find this on your own.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("socke");
talkEntry:addResponse("Socken zieht man über den Fuß damit man keine kalten Zechen bekommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("sock");
talkEntry:addResponse("Socks, wear it to avoid cold feet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("loch");
talkEntry:addResponse("Was soll ich dazu sagen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hole");
talkEntry:addResponse(" What should I say now?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("race");
talkEntry:addTrigger("folk");
talkEntry:addResponse("Ask me about humans, dwarves, elves, orcs, pixies, gnomes, goblins, halfings and lizards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rasse");
talkEntry:addTrigger("Volk");
talkEntry:addTrigger("Völker");
talkEntry:addResponse("BEfrage mich über Menschen, Zwerge, Elfen, Orks, Feen, Gnomen, Goblins, Halblingen und Echsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("elf");
talkEntry:addResponse("#me kichert 'Du würdest nicht glauben was ich über Elfen erzählen könnte.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("elf");
talkEntry:addTrigger("elv");
talkEntry:addResponse("#me giggles. 'You wouln't belive what I could tell you about them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mensch");
talkEntry:addResponse("Also ich bin abgesehen von meiner überragenden Klug-und Schönheit, ein ganz durchschnittlicher Mensch");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("human");
talkEntry:addResponse("I'm an average human, apart from my awesome cleverness and beauty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("zwerg");
talkEntry:addResponse("#me grinst. 'Du weißt ja was man über Zwerge sagt.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dwarf");
talkEntry:addTrigger("dwarv");
talkEntry:addResponse("#me grinses. 'Sure, you know what they say about dwarfs.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ork");
talkEntry:addResponse("Weißt du was man über Zwerge sagt? Bei Orks stimmt es.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Do you know waht they say about dwarves? With orcs is it the truth!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("fee");
talkEntry:addResponse("Die Feen sind sehr mysteriös, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fairy");
talkEntry:addResponse("Fairies are very mysterious, do you agree?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pixie");
talkEntry:addResponse("Pixies are very mysterious, don't you agree?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("gnom");
talkEntry:addResponse("Gnome zahlen mir meistens eine 'zusätzliche Gebühr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gnome");
talkEntry:addResponse("Gnomes pay mostly a 'supplemental fee' to me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("goblin");
talkEntry:addResponse("Goblins brauchen immer eine, äh... besondere Behandlung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("goblin");
talkEntry:addResponse("Goblins allways need, uhm.. speacial treatment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("echse");
talkEntry:addResponse("Kennst du die Geschichten in denen der Held mit einer riesigen Schlange kämpfen muss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("lizard");
talkEntry:addResponse("Do you know the stories, where the hero has to fight a giant snake?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halbling");
talkEntry:addResponse("Halblinge, manche überraschen andere weniger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halfi[l ]ng");
talkEntry:addResponse("Halfings, some suprise and other don't.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Elara, Oldra, Adron, Irmorom, Ronagan, Nargun, Malachin, Zhambra and Sirani. Ushara, Bragon, Eldan and Findari. What do you want to know?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Elara, Oldra, Adron, Irmorom, Ronagan, Nargun, Malachin, Zhambra and Sirani. Ushara, Bragon, Eldan und Findari. Über wen, sollen wir sprechen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara ist die Göttin der Erde. Gibt nicht viele die sie verehren glaub ich. Nur ein paar Druiden und Elfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Br[áàa]gon");
talkEntry:addResponse("Brágon ist der Gott des Feuers. Er hat Illarion vor langer Zeit schon verlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan ist der Gott des Geistes. Die meisten seiner Anhänger sind Magier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Tanora ist die Göttin des Wassers. Die Echsenmenschen verehren sie. Bei ihnen ist sie als Zelphia bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Zelphia ist der Name von Tanora, der bei den Echsenmenschen üblich ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari ist die Göttin der Luft. Barden sollen sie verehren hab ich gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Narg[úùu]n");
talkEntry:addResponse("Nargún ist der Gott des Chaos. Die die ihn verehren sind ausschlieslich irgendwelche Spinner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara ist die Göttin des Wissens und der Weisheit. Viele Gelehrte beten sie an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron ist der Gott des Weines und der Feste. Wenn man von einem Gott eine volle Taverne erbitten will, dann von Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra ist die Göttin der Fruchtbarkeit und des Lebens. Viele Bauern beten sie an, die Halblinge besonders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Cherga ist die Göttin der Geister. Sie sorgt dafür das die Seele in die Nächste Welt kommt, wenn man diese hier verlässt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Malachin");
talkEntry:addResponse("Malachin ist der Gott der Jagd. Die Graue Rose die ihre Burg im Norden von Trollsbane hat, hat sich dem Glauben an ihm verschrieben. Dort erfahrt ihr sicher mehr über Malachin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom ist der Gott des Handwerks. Die Zwerge beten ihn an und können dir sicher alles über ihn erzählen, wenn wir du paar Krüge Bier ausgiebst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sirani ist die Göttin der Liebe und der Freude. Wenn ihr mehr über sie wissen wollt, solltet ihr eine Sirani Priesterin suchen. Sie kann euch sicher sehr genau zeigen was es bedeutet Sirani anzubeten. Sehr genau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sirani ist die Göttin der Liebe und der Freude. Wenn ihr mehr über sie wissen wollt, solltet ihr eine Sirani Priesterin suchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra ist der Gott der Freundschaft und Treue. Zhrambra Anhänger sind meistens die verlässligsten Freunde die man finden kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan ist der Gott der Diebe und Schatten. Viele die im Schatten der Gesellschaft leben beten zu ihm, wie ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Moshran ist der Blut Gott. Der ist böse. Durch und durch. Genau wie seine Anhänger. Mit denen sollte man sich nicht einlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ushara is the goddess of earth. There are not many who pray to her. Only some druids and elves");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Br[áàa]gon");
talkEntry:addResponse("Brágon is the god of fire. He left Illarion a long time ago.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan is the god of spirit. Most of his followers are mages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addResponse("Tanora is the goddess of water. The lizards pray to her. They call her Zelphia.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Zelphia is the Name of Tanora the lizards use.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Findari is the goddess of air. Her followers are bards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Narg[úùu]n");
talkEntry:addResponse("Nargún is the god of chaos. Those who follow him are mad. All of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara is the goddess of knowledge and wisdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron is the god of wine and festivals. Owners of Taverns follow him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Oldra is the goddess of life. Many halflings follow her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Cherga is the goddess of death. She takes care that your soul travels safely into the next world. After your life ends.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addResponse("Malachin is the god of hunting. The Grey Rose who live in the castle north of Trollsbane follow him. There you get more information about Malachin for sure.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom is the god of the crafts. The dwarfs follow him and can tell you everything about him if you give them some beer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(0));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sirani is the godness of love and joy. If you want to know more about her you should search a Sirani Priestess. She can show you very exactly what is means to follow Sirani. Very exactly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.sex.sex(1));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Sirani is the godness of love and joy. If you want to know more about her you should search a Sirani Priestess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Zhambra is the god of friendship. Followers of Zhambras are the best friends you can find.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan is the god of the thieves and shadows. Most people who like living in the shadows of life pray to him, like me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Moshran is the blood god. He is evil. Really evily evil. As his followers are. Do not trust any of them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eagle");
talkEntry:addResponse("Do You think I'm a fool? Thats just a stupid bird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("adler");
talkEntry:addResponse("Hältst du mich für Blöd? Das ist nur so ein dummer Vogel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hawk");
talkEntry:addResponse("Do You think I'm a fool? Thats just a stupid bird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("falke");
talkEntry:addResponse("Hältst du mich für Blöd? Das ist nur so dummer ein Vogel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mouse");
talkEntry:addResponse("Here are mice like grass on a meadow. Or they are rats?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("m[aä]us");
talkEntry:addResponse("Mäuse gibt's hier genügend. Oder sind das Ratten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("maulw[üu]rf");
talkEntry:addResponse("Bin ich ein Bauer oder wie? Keine Ahnung!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mole");
talkEntry:addResponse("Am I a farmer or what? No Idea!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hase");
talkEntry:addResponse("Sie sin sooo süß! Hey, was isst du da?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rabbit");
talkEntry:addResponse("They are sooo cute! Ey, what are you eating there?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("gilbert");
talkEntry:addTrigger("bruder");
talkEntry:addResponse("Ja, mein Bruder ist ja so einfältig! Gilbert ist in Varshikar zu finden, denke ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gilbert");
talkEntry:addTrigger("brother");
talkEntry:addResponse("Yes, my brother is a fool. Gilbert lives at Varshikar, I think.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Gibb");
talkEntry:addResponse("Gibb Gibberson. Er besucht mich regelmäßig. Er lebt vermutlich irgendwo in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("Gibberson");
talkEntry:addResponse("Gibb Gibberson. Er besucht mich regelmäßig. Er lebt vermutlich irgendwo in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Nett dich kennen zu lernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger("rose");
talkEntry:addResponse("Ja, so heiß ich. Empfehle meine Gesellschaft weiter!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rose");
talkEntry:addResponse("Yes, thats my Name. Recommend my company to others!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Alright.");
talkEntry:addResponse("Well then.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Alles klar.");
talkEntry:addResponse("In Ordnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Are you shure?");
talkEntry:addResponse("Hm-hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Seid ihr sicher?");
talkEntry:addResponse("Hm-hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I see!");
talkEntry:addResponse("Indeed?");
talkEntry:addResponse("Well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich verstehe.");
talkEntry:addResponse("Achso?");
talkEntry:addResponse("Aha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kichert hinter vorgehaltener Hand.", "#me giggles behind her hand.");
talkingNPC:addCycleText("#me kratzt sich kurz zwischen den Beinen.", "#me has a quick scratch between her legs.");
talkingNPC:addCycleText("Lust auf etwas Gesellschaft, Schätzchen?", "Would you like some company, my darling?");
talkingNPC:addCycleText("Hei! Süschen!", "Hey sweety!");
talkingNPC:addCycleText("#me schnalzt verführerisch mit der Zunge.", "#me clicks on her tounge in alluring way.");
talkingNPC:addCycleText("#me hebt ihre Augenbrauen und gurrt in deine Richtung", "#me raises her brows and purrs in your direction.");
talkingNPC:addCycleText("#me zwinkert dir zu und leckt sich langsam über ihre Lippen.", "#me winks at you and licks slowly over her lips.");
talkingNPC:addCycleText("#me streckt ein Bein nach vorne und hebt ganz langsam un dmit beadacht den saum ihres Rockes ein wenig an, so das man ihr Knie zu sehen ist.", "Hey sweety!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Eine leicht bekleidete hübsche Frau, die dich verführerisch anzwinkert als sie deinen Blick bemerkt.", "A sexy dressed and pretty woman. As she notices your gaze, she winks seductively at you.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 849);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 843);
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