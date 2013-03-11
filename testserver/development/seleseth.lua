--------------------------------------------------------------------------------
-- NPC Name: Seleseth                                                 Galmair --
-- NPC Job:  Brick maker, mason and gem grinder                               --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  387, 277, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Zot                                                              --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 387, 277, 0, 6, 'Seleseth', 'npc.seleseth', 0, 6, 0, 241, 245, 63, 58, 137, 61);
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
module("development.seleseth", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Seleseth the gem grinder, mason and brick maker. Keywords: quest"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Seleseth der Edelsteinschleifer, Steinmetz und Ziegelmacher. Schlüsselwörter: Quest"));
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
talkEntry:addResponse("Yess, greetingsss.");
talkEntry:addResponse("Blessingsss of the Mother upon you, greetingsss");
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
talkEntry:addResponse("May the sssea-Mother watch your path.");
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
talkEntry:addResponse("Ssseleseth isss fine, yesss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ssseleseth issst gut, ja..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I be Ssseleseth, would you like to do a job for me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich sindss Ssseleseth, machenss du Aufgabe für michss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a gem grinder, massson and bricksss maker, do you wantssz to help Ssseleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich binss Edelsteinsschleifer, Sssteinmetzzs und Zzsiegelmacher, wollen du michssz helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a gem grinder, massson and bricksss maker, do you wantssz to help Ssseleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich binss Edelsteinsschleifer, Sssteinmetzzs und Zzsiegelmacher, wollen du michssz helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 1));
talkEntry:addResponse("Zsss, tasssk? Yesss, Seleseth has tasks for yous. Bring Seleseth ten clumps of clay. You can findz clay at the lake west of here. Here, Seleseth givess you old sshovel of hiss for digging clay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 1));
talkEntry:addResponse("Zsss, Aufgabe? Ja, Seleseth haben Aufgabe für dichsss. Bring Seleseth zehn Lehmssz! Du finden Lehm bei Sssee wesstlich der Stadt. Hier haben alte Ssschaufel von Seleseth um Lehm zu graben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 1));
talkEntry:addResponse("Zsss, tasssk? Yesss, Seleseth has tasks for yous. Bring Seleseth ten clumps of clay. You can findz clay at the lake west of here. Here, Seleseth givess you old sshovel of hiss for digging clay.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(24, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 1));
talkEntry:addResponse("Zsss, Aufgabe? Ja, Seleseth haben Aufgabe für dichsss. Bring Seleseth zehn Lehmssz! Du finden Lehm bei Sssee wesstlich der Stadt. Hier haben alte Ssschaufel von Seleseth um Lehm zu graben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("clay");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 2));
talkEntry:addResponse("Well done. Pleasse keep clay for next tasssk of Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("lehm");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 2));
talkEntry:addResponse("Gut gemacht. Bittes behalten Lehm für nächsste Aufgabe von Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 2));
talkEntry:addResponse("Well done. Pleasse keep clay for next tasssk of Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 2));
talkEntry:addResponse("Gut gemacht. Bittes behalten Lehm für nächsste Aufgabe von Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, Seleseth wantsss ten clumps of clay, that not enough clayssz. Come back when you have finished the taskz!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(26, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, ichse haben wollten zehn Lehmss! Dasss nicht sssein zehn Lehm. Kommen zurück wenn fertig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 3));
talkEntry:addResponse("Now we make brickss with clayss. You go to glass melting oven and makes ten bricksss. First you make unfired bricksess, and then froms the unfired ones you make fired bricks! Here, me givesss you an old brickssz mould of mines.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 3));
talkEntry:addResponse("Jetztss wir machen Zzziegel mit Lehm. Du gehen zum Glaschmelzofen und machen zehn Zzziegels. Erst du machen ungebrannte Zzziegel und aus ungebrannte Zzziegel du machen fertige Ziegel. Hier ich geben dir alte Zzziegelform von mirs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 3));
talkEntry:addResponse("Now we make brickss with clayss. You go to glass melting oven and makes ten bricksss. First you make unfired bricksess, and then froms the unfired ones you make fired bricks! Here, me givesss you an old brickssz mould of mines.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 3));
talkEntry:addResponse("Jetztss wir machen Zzziegel mit Lehm. Du gehen zum Glaschmelzofen und machen zehn Zzziegels. Erst du machen ungebrannte Zzziegel und aus ungebrannte Zzziegel du machen fertige Ziegel. Hier ich geben dir alte Zzziegelform von mirs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("brick");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 4));
talkEntry:addResponse("Well done, thanks you. Do you wants another taskss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("ziegel");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 4));
talkEntry:addResponse("Gut gemacht. Wollen weitere Aufgabe von Seleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 4));
talkEntry:addResponse("Well done, thanks you. Do you wants another taskss?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 10, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 4));
talkEntry:addResponse("Gut gemacht, dankes. Wollen weitere Aufgabe von Seleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("You not finished! I want ten bricksss, come backsss when you have finished.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 3));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", "<", 10, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Du nichtss fertig seinsss. Ich wollen zehn Zzziegels, kommen wieder wenn du fertig seinsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(251, 8, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2140, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 5));
talkEntry:addResponse("Zzzs, now we makesz ssshiny gems! I'll givesss you eight raw amethyssstsz and a pair of tongsss. You grindz them at the gem grinder for me and ssshow me resssult when you done, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(251, 8, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2140, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 5));
talkEntry:addResponse("Zzzz, nun wir machen glänzzsende Sssteine! Ich geben dir acht rohe Amethysssten und Zzange. Du sschleifen Amethysssten für michs am Edelssteinsschleifer neben michs. Wenn du fertig, dann mir zeigen, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(251, 8, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2140, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 5));
talkEntry:addResponse("Zzzs, now we makesz ssshiny gems! I'll givesss you eight raw amethyssstsz and a pair of tongsss. You grindz them at the gem grinder for me and ssshow me resssult when you done, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(251, 8, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(2140, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 5));
talkEntry:addResponse("Zzzz, nun wir machen glänzzsende Sssteine! Ich geben dir acht rohe Amethysssten und Zzange. Du sschleifen Amethysssten für michs am Edelssteinsschleifer neben michs. Wenn du fertig, dann mir zeigen, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(197, "all", ">", 7, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("amethyst");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 6));
talkEntry:addResponse("Well done. Pleasse keep the amethysssts for next tasssk of Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(197, "all", ">", 7, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("amethyst");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 6));
talkEntry:addResponse("Gut gemacht. Bittes behalten Amethyssten für nächsste Aufgabe von Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(197, "all", ">", 7, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 6));
talkEntry:addResponse("Well done. Pleasse keep the amethysssts for next tasssk of Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(197, "all", ">", 7, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 6));
talkEntry:addResponse("Gut gemacht. Bittes behalten Amethyssten für nächsste Aufgabe von Seleseth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(197, "all", "<", 8, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, I want eight amethyssstsz. Come back when you have finissshed the tasssk, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(197, "all", "<", 8, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, ich wollten acht Amethyssten. Komm wieder wenn du Aufgabe erledigt hassst, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 7));
talkEntry:addResponse("Zss, now we make powder with the ssshiny gemsz. You go to the gem grinder again and make two bagsz of amethyssst powder from eight amethyssstsz for me, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 7));
talkEntry:addResponse("Zss, nun wir machen aus glänzzsenden Sssteinen Staub. Du gehen zu Edelsteinschleifer und machen aus acht geschliffenen Amethyssten zwei Beutel Amethyststaub für michs, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 7));
talkEntry:addResponse("Zss, now we make powder with the ssshiny gemsz. You go to the gem grinder again and make two bagsz of amethyssst powder from eight amethyssstsz for me, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 7));
talkEntry:addResponse("Zss, nun wir machen aus glänzzsenden Sssteinen Staub. Du gehen zu Edelsteinschleifer und machen aus acht geschliffenen Amethyssten zwei Beutel Amethyststaub für michs, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(450, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("powder");
talkEntry:addTrigger("amethyst");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(450, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 8));
talkEntry:addResponse("Zsss, well done! The quality of thisss powder isss very good. Do you want another tasssk from Ssseleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(450, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("staub");
talkEntry:addTrigger("amethyst");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(450, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 8));
talkEntry:addResponse("Zsss, gut gemachts! Staub haben gute Qualität. Wollen neue Aufgabe von Ssseleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(450, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(450, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 8));
talkEntry:addResponse("Zsss, well done! The quality of thisss powder isss very good. Do you want another tasssk from Ssseleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(450, "all", ">", 1, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(450, 2, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 8));
talkEntry:addResponse("Zsss, gut gemachts! Staub haben gute Qualität. Wollen neue Aufgabe von Ssseleseth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(450, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, I want two bagsss of amethyssst powder. Come back when you have the amethyssst powder!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(450, "all", "<", 2, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, ich wollte zwei Beutel Amethyssstssstaub, zsss. Komm wieder wenn Staub fertig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(737, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(735, 2, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, do you want to learn sssomething about masssonry? I'll give you two raw ssstonesz and a chisssel and you can makesz 20 sssmall ssstonesz for me with them! Raw ssstonesz can be found in minesz, a lot, zsss! Take the chisssel in your hand and ssstart cutting raw ssstonesz into ssstone blocksss, then you repeat that with the ssstone blocksss to make sssmall ssstonesz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.item.item(737, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(735, 2, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, du wollen mehr über Steinmetz lernen? Ich geben dir zwei rohe Sssteine und Meissel um 20 kleine Sssteine für mich zu machen, zsss. Rohe Sssteine gibtsss in der Mine viel! Du nehmen Meisel in die Hand und bearbeiten rohe Sssteine, danach Sssteinquadar bearbeiten zu kleinen Sssteinen und mir bringen 20, zss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.item.item(737, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(735, 2, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, do you want to learn sssomething about masssonry? I'll give you two raw ssstonesz and a chisssel and you can makesz 20 sssmall ssstonesz for me with them! Raw ssstonesz can be found in minesz, a lot, zsss! Take the chisssel in your hand and ssstart cutting raw ssstonesz into ssstone blocksss, then you repeat that with the ssstone blocksss to make sssmall ssstonesz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.item.item(737, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(735, 2, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, du wollen mehr über Steinmetz lernen? Ich geben dir zwei rohe Sssteine und Meissel um 20 kleine Sssteine für mich zu machen, zsss. Rohe Sssteine gibtsss in der Mine viel! Du nehmen Meisel in die Hand und bearbeiten rohe Sssteine, danach Sssteinquadar bearbeiten zu kleinen Sssteinen und mir bringen 20, zss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1266, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("stone");
talkEntry:addTrigger("small stone");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1266, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, well done, thanksss you. Zsss, Ssseleseth says thanksss for the help and hopesss you learnt sssomething about gem grinding, masssonry and bricksss making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1266, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("stein");
talkEntry:addTrigger("kleiner stein");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1266, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, gut gemachts, dankes. Zsss, Ssseleseth sagen danke für Hilfess und hoffen du was über Edelssteinssschleifen, Sssteine bahauen und Zzziegelmachen gelernt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1266, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1266, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, well done, thanksss you. Zsss, Ssseleseth says thanksss for the help and hopesss you learnt sssomething about gem grinding, masssonry and bricksss making.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1266, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1266, 20, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(709, "=", 9));
talkEntry:addResponse("Zsss, gut gemachts, dankes. Zsss, Ssseleseth sagen danke für Hilfess und hoffen du was über Edelssteinssschleifen, Sssteine bahauen und Zzziegelmachen gelernt haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1266, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, they are not the twenty sssmall ssstonesz that I was looking for. Come backsss when you have the ssstonesz!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 9));
talkEntry:addCondition(npc.base.condition.item.item(1266, "all", "<", 20, nil));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addResponse("Zsss, dasss nicht ssein 20 kleine Steiness die ich wollte. Komm wieder wenn du Sssteine haben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Zsss, I don't have any other thingsss for yousss to do. Thank yousss for the help though, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Zsss, ich haben nichtsss weiter für dich zu tun. Aber dankes nochmal für deine Hilfe, zsss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I could needs sssome help, just asssk me for a task, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(709, "<", 10));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich könnte etwasss Hilfe gebrauchen, fragss michs ruhig nach einer Aufgabe. Ich habe sssicher etwass für dichss zu tun, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("You are not a citizzsen of Galmairss. I don't have anything for yousss to do, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Du ssscheint kein Bürgers Galmair zu sssein. Ich hab nichtsss für dichss zu tun, zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich gelangweilt um.", "#me looks around bored.");
talkingNPC:addCycleText("#me kratzt sich am Kopf.", "#me scratches his head.");
talkingNPC:addCycleText("Wenns du Hilfe beim Edelsssteinsschleifen, Sssteine behauen oder Zzziegelbrennen brauchst dann frag michss!", "If you need any help in gem grinding, masssonry or bricksss making, jussst asssk me!");
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
mainNPC:setEquipment(3, 696);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 824);
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