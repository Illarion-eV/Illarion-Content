--------------------------------------------------------------------------------
-- NPC Name: Zassaria Riverbank                                      Runewick --
-- NPC Job:  Messaege quest giver                                             --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  900, 800, 1            --
-- NPC Sex:  female                     NPC Direction: east                   --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                                            --
-- Last parsing: October 13, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 900, 800, 1, 2, 'Zassaria Riverbank', 'npc.zassaria_riverbank', 1, 3, 0, 70, 77, 0, 70, 52, 0);
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
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.zassaria_riverbank", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Zassaria Riverbank. Keywords: guest, mission, Order."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Zassaria Riverbank. Schlüsselwörter: Quest, Misson, Auftrag."));
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
talkEntry:addResponse("Seid gegrüßsst.");
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
talkEntry:addResponse("me hisses");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid gegrüßsst.");
talkEntry:addResponse("#me zischt");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Ssss. Zzzelphia be with you. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Ssss. Zzzelphia sssei mit Euch. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ssss. Zzzelphia be with you. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Ssss. Zzzelphia sssei mit Euch. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm feeling very good. Sss. Exss...Extraordinary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es sssehr gut. Ausssgezzeichnet. Sss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am called Zassaria Riverbank.Nice so meet you. Sss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich werde Zassaria Riverbank genannt. Sss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("Tsss! I ate all my fisssch. I'll chatch new fisssch sssoon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addTrigger("veräußer");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("Tsss! Ich aß all meinen Fisssch. Ich werde ssschnellssstmöglich neuen fangen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me I"));
talkEntry:addResponse("Could you help me jussst a little? Sss... Jonathan Idler assked me for an oli lamp some time ago. Tsss. I found one while fissshing, just yesssterday. Zss. Can you tell him he ssshould talk to me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich I"));
talkEntry:addResponse("Könntet Ihr mit Helfen? Sss ... Jonathan Idler fragte mich nach einer Öllampe. Zss. Gessstern habe ich eine beim Fissschen gefunden. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Frag für mich I"));
talkEntry:addResponse("Could you help me jussst a little? Sss... Jonathan Idler assked me for an oli lamp some time ago. Tsss. I found one while fissshing, just yesssterday. Zss. Can you tell him he ssshould talk to me?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich I"));
talkEntry:addResponse("Könntet Ihr mit Helfen? Sss ... Jonathan Idler fragte mich nach einer Öllampe. Zss. Gessstern habe ich eine beim Fissschen gefunden. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the Quest and are rewarded by Zarissa with an old sabre from the ground of the sea."));
talkEntry:addResponse("Ssso you talked to Missster Idler? Thatss what he'd sssay. Tsss. Well, thank you for you help... Zss...");
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 345, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst und erhälst zum Dank einen Säbel den Zarissa auf dem Grund des Meeres gefunden hat."));
talkEntry:addResponse("Ihr habt also mit Missster Idler gessssprochen? Dass hat er gesssagt.Tsss. Nun, danke für eure Hilfe..Zss...");
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 345, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the Quest and are rewarded by Zarissa with an old sabre from the ground of the sea."));
talkEntry:addResponse("Ssso you talked to Missster Idler? Thatss what he'd sssay. Tsss. Well, thank you for you help... Zss...");
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 345, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst und erhälst zum Dank einen Säbel den Zarissa auf dem Grund des Meeres gefunden hat."));
talkEntry:addResponse("Ihr habt also mit Missster Idler gessssprochen? Dass hat er gesssagt.Tsss. Nun, danke für eure Hilfe..Zss...");
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 345, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Sss... Jonathan Idler assked me for an oli lamp some time ago. Can you tell him he ssshould talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Jonathan Idler fragte mich nach einer Öllampe. Zss. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Sss... Jonathan Idler assked me for an oli lamp some time ago. Can you tell him he ssshould talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Jonathan Idler fragte mich nach einer Öllampe. Zss. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me II"));
talkEntry:addResponse("Ssso, you came to help me again? zss. Thatsss very nice of you. Sss. Pleassse bring 10 ?? to an NPC ");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich II"));
talkEntry:addResponse("...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform(""[New quest] ask for me II""));
talkEntry:addResponse("...");
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform(""[Neues Quest] NAME I""));
talkEntry:addResponse("....");
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(1318, "all", ">", 9, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] INFORM ..."));
talkEntry:addResponse("...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1318, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 0, 0, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 4));
talkEntry:addCondition(npc.base.condition.item.item(1318, "all", ">", 9, nil));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] INFORM..."));
talkEntry:addResponse("...");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1318, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 0, 0, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(118, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Thank you. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Danke ssschön. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Thank you. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Danke ssschön. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I work asss a fisssher. It'sss fun. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich arbeite alsss Fischerin. Esss macht Spaßsss. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I work asss a fisssher. It'sss fun. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich arbeite alsss Fischerin. Esss macht Spaßsss. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Do you know there'sss a diffrentce between Zsss, Tsss and Ssss?");
talkEntry:addResponse("Usssually marriages between my people are arranged by the partentsss. Sss. Usually.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addTrigger("erzähl mir was");
talkEntry:addTrigger("erzählt mir was");
talkEntry:addResponse("Wissst ihr, dasss es einen Unterschied zzzwischen Zsss, Tss und Ssss?");
talkEntry:addResponse("Normalerweisse werden Ehen in meinem Volk arrangiert. Ssss. Normalerweissse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Lizzardsss pray to Zzzelphia. To whom do you pray?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Echsssenmenschen beten zzzu Zzzelphia. Zzzu wem betet Ihr? Sss");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("She'sss to godesss of the water and the sssea.");
talkEntry:addResponse("You call her Tanora, thisss iss not a word eassy tp pronoucsse for usss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Sssie isssst die Göttin desss Wassers und dess Meereess.");
talkEntry:addResponse("Ihr nennt sssie Tanora, dasss issst kein Wort ausss unssserer Ssssprache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("There isss no place like thisss under the sssea. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Esss gibt sssolch einen Ort Unterwassser nicht. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Ssss...", "Ssss...");
talkingNPC:addCycleText("Ssss?", "Ssss?");
talkingNPC:addCycleText("Ssss!", "Ssss!");
talkingNPC:addCycleText("#me zischt.", "#me hisses.");
talkingNPC:addCycleText("Zss!", "Zss!");
talkingNPC:addCycleText("Tsss...", "Tsss...");
talkingNPC:addCycleText("lässt ihren Schwanz hin und her schnellen.", "#me moves her tail.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Zassaria Riverbank von Runewick.", "This NPC is Zassaria Riverbank of Runewick.");
mainNPC:setUseMessage("#me zischt verärgert.", "#me hisses angrily.");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 0);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 52);
mainNPC:setEquipment(9, 0);
mainNPC:setEquipment(10, 0);
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