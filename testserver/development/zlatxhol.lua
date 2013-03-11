--------------------------------------------------------------------------------
-- NPC Name: Zlatxhol                                                 Cadomyr --
-- NPC Job:  Glass blower and brick maker                                     --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  143, 588, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Zot                                                              --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 143, 588, 0, 6, 'Zlatxhol', 'npc.zlatxhol', 0, 6, 0, 19, 17, 30, 255, 223, 120);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("development.zlatxhol", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Zlatxhol the glass blower and brick maker. Keywords: quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Zlatxhol der Glasbläser und Ziegelmacher. Schlüsselwörter: Quest"));
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
talkEntry:addResponse("Greetingsss to you.");
talkEntry:addResponse("Yess, greetingss.");
talkEntry:addResponse("Blessingss of the Mother upon you, greetingss");
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
talkEntry:addResponse("Grüßsse dir.");
talkEntry:addResponse("Ja, Grüßsse.");
talkEntry:addResponse("Grüßsse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetingsss to you.");
talkEntry:addResponse("Yess, greetingss.");
talkEntry:addResponse("Greetsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüßsse dir.");
talkEntry:addResponse("Ja, Grüßsse.");
talkEntry:addResponse("Grüßsse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May the rainsss be heavy and frequent.");
talkEntry:addResponse("May the ssea-Mother watch your path.");
talkEntry:addResponse("Farewell, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Mögenss Regen häufig und ssstark sssein.");
talkEntry:addResponse("Mögenss die Meermutter dein Pfad leitenss.");
talkEntry:addResponse("Abschied, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Goodbye");
talkEntry:addResponse("Farewell");
talkEntry:addResponse("#me nods slowly, 'Goodbye'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Gut wiedersehensss.");
talkEntry:addResponse("Abschied.");
talkEntry:addResponse("#me nickt langsam: 'Gut wiedersehensss'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Zlatxhol iss fine, yess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Zlatxhol issst gut, ja..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I be Zlatxhol, would you like to do a job for me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich sindss Zlatxhol, machenss du Aufgabe für michss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a glassz blower and bricksss maker, do you wantssz to help Zlatxhol?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich binss Glasssblässzer und Zzsiegelmacher, wollen du michssz helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a glassz blower and bricksss maker, do you wantssz to help Zlatxhol?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich binss Glasssblässzer und Zzsiegelmacher, wollen du michssz helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 1));
talkEntry:addResponse("Zsss, tasssk? Yesss, Zlatxhol has tasks for yous. Bring Zlatxhol ten clumps of clay. You can findz clay at the riverz west of here. Here, Zlatxhol givess you old sshovel of hiss for digging clay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 1));
talkEntry:addResponse("Zsss, Aufgabe? Ja, Zlatxhol haben Aufgabe für dichsss. Bring Zlatxhol zehn Lehmssz! Du finden Lehm bei Flusssz wesstlich der Stadt. Hier haben alte Ssschaufel von Zlatxhol um Lehm zu graben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 1));
talkEntry:addResponse("Zsss, tasssk? Yesss, Zlatxhol has tasks for yous. Bring Zlatxhol ten clumps of clay. You can findz clay at the riverz west of here. Here, Zlatxhol givess you old sshovel of hiss for digging clay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 1));
talkEntry:addResponse("Zsss, Aufgabe? Ja, Zlatxhol haben Aufgabe für dichsss. Bring Zlatxhol zehn Lehmssz! Du finden Lehm bei Flusssz wesstlich der Stadt. Hier haben alte Ssschaufel von Zlatxhol um Lehm zu graben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("clay");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 2));
talkEntry:addResponse("Well done, thanks you. Pleasse keep clay for next tasssk of Zlatxhol.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("lehm");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 2));
talkEntry:addResponse("Gut gemacht, dankes. Bittes behalten Lehm für nächsste Aufgabe von Zlatxhol.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 2));
talkEntry:addResponse("Well done, thanks you. Pleasse keep clay for next tasssk of Zlatxhol.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 2));
talkEntry:addResponse("Gut gemacht, dankes. Bittes behalten Lehm für nächsste Aufgabe von Zlatxhol.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, Zlatxhol wantsss ten clumps of clay, that not enough clayssz. Come back when you have finished the taskz!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, ichse haben wollten zehn Lehmss! Dasss nicht sssein zehn Lehm. Kommen zurück wenn fertig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 3));
talkEntry:addResponse("Now we make brickss with clayss. You go to oven next to me and makes ten bricksss. First you make unfired bricksess, and then froms the unfired ones you make fired bricks! Here, me givesss you an old brickssz mould of mines.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 3));
talkEntry:addResponse("Jetztss wir machen Zzziegel mit Lehm. Du gehen zum Ofen neben mir und machen zehn Zzziegels. Erst du machen ungebrannte Zzziegel und aus ungebrannte Zzziegel du machen fertige Ziegel. Hier ich geben dir alte Zzziegelform von mirs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 3));
talkEntry:addResponse("Now we make brickss with clayss. You go to oven next to me and makes ten bricksss. First you make unfired bricksess, and then froms the unfired ones you make fired bricks! Here, me givesss you an old brickssz mould of mines.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 3));
talkEntry:addResponse("Jetztss wir machen Zzziegel mit Lehm. Du gehen zum Ofen neben mir und machen zehn Zzziegels. Erst du machen ungebrannte Zzziegel und aus ungebrannte Zzziegel du machen fertige Ziegel. Hier ich geben dir alte Zzziegelform von mirs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("brick");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 4));
talkEntry:addResponse("Well done, thanks you. Do you wants another taskss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("ziegel");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 4));
talkEntry:addResponse("Gut gemacht, dankes. Wollen weitere Aufgabe von Zlatxhol?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 4));
talkEntry:addResponse("Well done, thanks you. Do you wants another taskss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 4));
talkEntry:addResponse("Gut gemacht, dankes. Wollen weitere Aufgabe von Zlatxhol?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You not finished! I want ten bricksss, come backsss when you have finished.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du nichtss fertig seinsss. Ich wollen zehn Zzziegels, kommen wieder wenn du fertig seinsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 5));
talkEntry:addResponse("Zzzs, now we continue with glasss blowing! You need ssand first of all, to make glasss ingotss later. You now go out of the city and look for a place with much sssand and find a ssstone with sssand around it. Then you dig coarssse sssand with the big ssshovel I've gave you before and come back to turn it into quartzzs sssand. You ssshould make ten scoops of quartzzs sssand with the sssieve over there, I'll give yous a little ssshovel of mine for making quartzzs sssand!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 5));
talkEntry:addResponse("Zzzz, jetzt gehtsss weiter mit dem Glassblasssen! Du brauchen ersstmal Sand um darausss ssspäter Glasssblöcke zu machen. Du gehen rauss aus Ssstadt und ssuchen einen Ort mit Sssand und Ssstein auf Sssand. Dort graben und holen groben Sssand mit der großen Ssschaufel die Zlatxhol dir vorher gegeben hat. Wenn du groben Sssand haben, kommen zzzurück und machen aus groben Sssand bei Sssieb zehn Quarzzsand für Zlatxhol. Hier du kriegen kleine Sschaufel für Sssand ssieben sspäter von mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 5));
talkEntry:addResponse("Zzzs, now we continue with glasss blowing! You need ssand first of all, to make glasss ingotss later. You now go out of the city and look for a place with much sssand and find a ssstone with sssand around it. Then you dig coarssse sssand with the big ssshovel I've gave you before and come back to turn it into quartzzs sssand. You ssshould make ten scoops of quartzzs sssand with the sssieve over there, I'll give yous a little ssshovel of mine for making quartzzs sssand!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(312, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 5));
talkEntry:addResponse("Zzzz, jetzt gehtsss weiter mit dem Glassblasssen! Du brauchen ersstmal Sand um darausss ssspäter Glasssblöcke zu machen. Du gehen rauss aus Ssstadt und ssuchen einen Ort mit Sssand und Ssstein auf Sssand. Dort graben und holen groben Sssand mit der großen Ssschaufel die Zlatxhol dir vorher gegeben hat. Wenn du groben Sssand haben, kommen zzzurück und machen aus groben Sssand bei Sssieb zehn Quarzzsand für Zlatxhol. Hier du kriegen kleine Sschaufel für Sssand ssieben sspäter von mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("sand");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 6));
talkEntry:addResponse("Well done, pleasse keep the sssand for your next tasssk");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("sand");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 6));
talkEntry:addResponse("Gut gemachtss, bitte behalten Ssand für nächssste Aufgabe von Zlatxhol.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 6));
talkEntry:addResponse("Well done, pleasse keep the sssand for your next tasssk");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 6));
talkEntry:addResponse("Gut gemachtss, bitte behalten Ssand für nächssste Aufgabe von Zlatxhol.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, I want ten quartzzs sssand. Come again when you have finissshed the task, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(316, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, ich wollten zehn Quarzzssand. Komm wieder wenn du Aufgabe erledigt hassst, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(3, 15, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 7));
talkEntry:addResponse("Now we collect asssh for making glasss. I give you an old hatchet of mine and wood, you can make ten piles of asssh for me then. When you have the asssh, you come back to the oven and makes ten glasss ingots with the glasss blow pipe which I'll gives you, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(3, 15, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 7));
talkEntry:addResponse("Nun wir sssammeln Assche für Glasss machen. Du kriegen Beil und Holzz von mir um zzehn Asssche zu machen. Wenn Assche haben du kommst zurück zum Ofen hier und machen mit Glasblasrohr, dass ich dir auch gebe, zehn Glasblöcke, zss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(3, 15, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 7));
talkEntry:addResponse("Now we collect asssh for making glasss. I give you an old hatchet of mine and wood, you can make ten piles of asssh for me then. When you have the asssh, you come back to the oven and makes ten glasss ingots with the glasss blow pipe which I'll gives you, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(311, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(74, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(3, 15, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 7));
talkEntry:addResponse("Nun wir sssammeln Assche für Glasss machen. Du kriegen Beil und Holzz von mir um zzehn Asssche zu machen. Wenn Assche haben du kommst zurück zum Ofen hier und machen mit Glasblasrohr, dass ich dir auch gebe, zehn Glasblöcke, zss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("glass");
talkEntry:addTrigger("ingot");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(41, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 8));
talkEntry:addResponse("Zsss, well done! These glass ingotsss look good. Please keep the glass ingotsss for your next tasssk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("glas");
talkEntry:addTrigger("blöck");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(41, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 8));
talkEntry:addResponse("Zsss, gut gemachts! Glassblöcke sssehen gut aus. Bitte behalten Glassblöcke für nächssste Aufgabe von Zlatxhol, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(41, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 8));
talkEntry:addResponse("Zsss, well done! These glass ingotsss look good. Please keep the glass ingotsss for your next tasssk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(41, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 8));
talkEntry:addResponse("Zsss, gut gemachts! Glassblöcke sssehen gut aus. Bitte behalten Glassblöcke für nächssste Aufgabe von Zlatxhol, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, I want ten glasss ingotsss. Come again when you have the ingotsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(41, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, ich wollte zehn Glassblöcke. Komm wieder wenn Blöcke haben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 9));
talkEntry:addResponse("Zsss, now the difficult part of the work sstartsss! You go to oven with the glasss blow pipe and make empty bottlesss from the glasss ingots. Come backsss when you have five bottlesss to show me, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 9));
talkEntry:addResponse("Zsss, jetzt schwieriger Teil von Arbeit kommen! Du gehen zum Ofen mit Rohr und machen auss den Glassblöcken leere Flassschen. Du kommen zurück wenn fertig und zeigen mir fünf Flaschen, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 9));
talkEntry:addResponse("Zsss, now the difficult part of the work sstartsss! You go to oven with the glasss blow pipe and make empty bottlesss from the glasss ingots. Come backsss when you have five bottlesss to show me, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 9));
talkEntry:addResponse("Zsss, jetzt schwieriger Teil von Arbeit kommen! Du gehen zum Ofen mit Rohr und machen auss den Glassblöcken leere Flassschen. Du kommen zurück wenn fertig und zeigen mir fünf Flaschen, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(790, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("bottle");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(790, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 10));
talkEntry:addResponse("Zsss, well done! These bottlesss look good. Zsss, Zlatxhol says thanksss for the help and hopesss you learnt sssomething about glasss blowing and bricksss making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(790, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("flasche");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(790, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 10));
talkEntry:addResponse("Zsss, gut gemachts! Flasschen sssehen gut aus. Zsss, Zlatxhol sagen danke für Hilfess und hoffen du was über Glasssblassen und Zzziegelmachen gelernt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(790, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(790, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 10));
talkEntry:addResponse("Zsss, well done! These bottlesss look good. Zsss, Zlatxhol says thanksss for the help and hopesss you learnt sssomething about glasss blowing and bricksss making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(790, "all", ">", 4, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(790, 5, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(707, "=", 10));
talkEntry:addResponse("Zsss, gut gemachts! Flasschen sssehen gut aus. Zsss, Zlatxhol sagen danke für Hilfess und hoffen du was über Glasssblassen und Zzziegelmachen gelernt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(790, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, they are not the five bottlesss I was looking for. Come backsss when you have the bottlesss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(790, "all", "<", 5, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, dasss nicht ssein fünf leere Flassschen die ich wollte. Komm wieder wenn du Flasschen haben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Zsss, I don't have any other thingsss for yous to do. Thank yous for the help though, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Zsss, ich haben nichtsss weiter für dich zu tun. Aber dankes nochmal für deine Hilfe, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could needs sssome help, just asssk me for a task, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(707, "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich könnte etwasss Hilfe gebrauchen, fragss michs ruhig nach einer Aufgabe. Ich habe sssicher etwass für dichss zu tun, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizzsen of Cadomyrss. I don't haves anything to do for yous, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Du ssscheint kein Bürgers Cadomyr zu sssein. Ich hab nichtsss für dichss zu tun, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("#me kratzt sich am Kopf.", "#me scratches his head.");
talkingNPC:addCycleText("Wenns du Hilfe beim Glasssblassen oder Zzziegelbrennen brauchst dann fragt michss!", "If you need any help in glassss blowing or bricksss making, jussst asssk me!");
talkingNPC:addCycleText("Zsss...", "Zsss...");
talkingNPC:addCycleText("Zsss!", "Zsss!");
talkingNPC:addCycleText("Zsss?", "Zsss?");
talkingNPC:addCycleText("#me zischelt.", "#me hisses.");
talkingNPC:addCycleText("Ssss...", "Ssss...");
talkingNPC:addCycleText("Ssss?", "Ssss?");
talkingNPC:addCycleText("Ssss!", "Ssss!");
talkingNPC:addCycleText("Tsss...", "Tsss...");
talkingNPC:addCycleText("#me lässt seinen Schwanz hin und her schnellen.", "#me wags his tail back and forth.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("Fass mich nicht an!", "Hands off!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 457);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 183);
mainNPC:setEquipment(10, 0);
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