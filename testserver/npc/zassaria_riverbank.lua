--------------------------------------------------------------------------------
-- NPC Name: Zassaria Riverbank                                      Runewick --
-- NPC Job:  Message quest giver                                              --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  908, 812, 1            --
-- NPC Sex:  female                     NPC Direction: east                   --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 908, 812, 1, 2, 'Zassaria Riverbank', 'npc.zassaria_riverbank', 1, 3, 0, 70, 77, 0, 70, 52, 0);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Zassaria Riverbank. Keywords: quest, mission, order."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Zassaria Riverbank. Schlüsselwörter: Quest, Mission, Auftrag."));
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
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addResponse("Could you help me jussst a little? Sss... Jonathan Idler assked me for an oli lamp some time ago. Tsss. I found one while fissshing, just yesssterday. Zss. Can you tell him he ssshould talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addResponse("Könntet Ihr mit Helfen? Sss ... Jonathan Idler fragte mich nach einer Öllampe. Zss. Gessstern habe ich eine beim Fissschen gefunden. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Frag für mich I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addResponse("Could you help me jussst a little? Sss... Jonathan Idler assked me for an oli lamp some time ago. Tsss. I found one while fissshing, just yesssterday. Zss. Can you tell him he ssshould talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addResponse("Könntet Ihr mit Helfen? Sss ... Jonathan Idler fragte mich nach einer Öllampe. Zss. Gessstern habe ich eine beim Fissschen gefunden. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Sss... William Daloire   assked me for an oli lamp some time ago. Can you tell him he ssshould talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("William Daloire fragte mich nach einer Öllampe. Zss. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Sss... William Daloire assked me for an oli lamp some time ago. Can you tell him he ssshould talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("William Daloire fragte mich nach einer Öllampe. Zss. Ssso sssagt ihm, er möge mit mir reden. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the Quest and are rewarded by Zarissa with some coins, an old sabre from the ground of the sea and a pair of new boots."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.item.item(0, 0, 0, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 0));
talkEntry:addResponse("Ssso you talked to Missster Idler? Thatss what he'd sssay. Tsss. Well, thank you for you help... Zss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 2));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst und erhälst zum Dank etwas Geld, einen Säbel den Zarissa auf dem Grund des Meeres gefunden hat und ein Paar neue Stiefel."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.item.item(0, 0, 0, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 0));
talkEntry:addResponse("Ihr habt also mit Missster Idler gessssprochen? Dass hat er gesssagt.Tsss. Nun, danke für Eure Hilfe..Zss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 4));
talkEntry:addResponse("Ssso, you came to help me again? Zss. Thatsss very nice of you. Sss. I haven't sssseen Argentusss Almbag for a while. Zzz. Pleassse, asssk him if he still wantsss to have thisss fisssh. It's ssstarting to sssmell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 4));
talkEntry:addResponse("Sssso, du kommssst um mir zzzu helfen? Wie nett. Zss. Argenutsss Almsbag hat sssich ssschon lange nicht mehr bei mir blicken lassssen. Ffragt ihn, ob er noch Fisssch kaufen möchter. Zss. Der Fisssch beginnt zzzu riechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] ask for me II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addResponse("Ssso, you came to help me again? Zss. Thatsss very nice of you. Sss. I haven't sssseen Argentusss Almbag for a while. Zzz. Pleassse, asssk him if he still wantsss to have thisss fisssh. It's ssstarting to sssmell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 4));
talkEntry:addResponse("Sssso, du kommssst um mir zzzu helfen? Wie nett. Zss. Argenutsss Almsbag hat sssich ssschon lange nicht mehr bei mir blicken lassssen. Fragt ihn, ob er noch Fisssch kaufen möchte. Zss. Der Fisssch beginnt zzzu riechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Pleassse asssk Argentusss Almsssbag about hisss fisssh order. Zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 4));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte fragt bei Argentuss Almsssbag wegen ssseiner Fisschbestellung nach. Sss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 4));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Pleassse asssk Argentusss Almsssbag about hisss fisssh order. Zsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 4));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte fragt bei Argentuss Almsssbag wegen ssseiner Fisschbestellung nach. Sss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded 10 silver coins, and an old wizard hat."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.item.item(357, 1, 277, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 4));
talkEntry:addResponse("Thank you. Zzzs. Take thisss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 5));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst. Du wirst mit 10 Silbermünzen und einem alten Zauberhut belohnt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.item.item(357, 1, 277, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 4));
talkEntry:addResponse("Danke sssehr. Nehmt diesss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Pleassse asssk Neiran el Nyarale what happend to my colcction of oil lampsss. I sssaw him carring them away. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 6));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Bitte fragt Neiran el Nyarale wass er mit meiner Sssammlung Öllampen gemacht hat. Ich sssah wie er ssie davon trug. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 6));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Pleassse asssk Neiran el Nyarale what happend to my colcction of oil lampsss. I sssaw him carring them away. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 6));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Pleassse asssk Neiran el Nyarale what happend to my colcction of oil lampsss. I sssaw him carring them away. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Pleassse asssk Neiran el Nyarale what happend to my colcction of oil lampsss. I sssaw him carring them away. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 7));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Bitte fragt Neiran el Nyarale wass er mit meiner Sssammlung Öllampen gemacht hat. Ich sssah wie er ssie davon trug. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 7));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Pleassse asssk Neiran el Nyarale what happend to my collection of oil lampsss. I sssaw him carring them away. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 7));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 7));
talkEntry:addResponse("Pleassse asssk Neiran el Nyarale what happend to my colcction of oil lampsss. I sssaw him carring them away. Zss Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded 12 silver coins, and two new robes in the colors of the ocean."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.item.item(193, 1, 277, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("What? He saisss he threw them away? Zss! Zss! Firssst I ssshall thank you for assking Neiran el Nyarale. Zzzs. Take thisss as a present. Then I will talk to him! Zss... ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 8));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst. Du wirst mit 12 Silbermünzen und zwei neuen Roben in den Farben des Ozeans belohnt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.item.item(193, 1, 277, {["descriptionEn"] = "This robe has the colour of the sea.", ["descriptionDe"] = "Diese Robe hat die Farbe des Meers."}));
talkEntry:addConsequence(npc.base.consequence.item.item(55, 1, 277, {["descriptionEn"] = "This robe has the colour of the sea.", ["descriptionDe"] = "Diese Robe hat die Farbe des Meers."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Wasss? Veggeworfen hat er sssie? Zss! Zss! Zzzuerssst will ich Euch danken, dassss Ihr mit Neiran el Nyarale spracht. Nehmt diesss alsss Gessschenk. Dann werde ich mir ihm ssssprechen! Zss...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 10));
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 9));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich II"));
talkEntry:addConsequence(npc.base.consequence.item.item(73, 1, 440, {["nameDe"] = "Echt großer Fisch", ["nameEn"] = "Really big fish", ["descriptionEn"] = "This trout is as large as a salmon.", ["rareness"] = "2", ["descriptionDe"] = "Dieser Forelle ist so groß wie ein Lachs!"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 10));
talkEntry:addResponse("Zss! Zss! Ssschaut, ich habe eine Forelle gefangen, die issst ssso großsss wie ein Lachssss. Aber, zss, Marianne Forgeron, magisssche Ssschmied auss Galmair sssagt, ich lüge! Zss! Zzzeigt ihr diesssen Fisssch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 9));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me IV"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 10));
talkEntry:addResponse("....");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 9));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 10));
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Pleassse, ssshow thiss fischss to Marinanne Forgeron in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 10));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zzzeigt Marianne Forgeron auss Galmair diesssen großssen Fisssch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 10));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Pleassse, ssshow thiss fischss to Marinanne Forgeron in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 10));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Zzzeigt Marianne Forgeron auss Galmair diesssen großssen Fisssch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded with some coins and jewlry."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 3000));
talkEntry:addConsequence(npc.base.consequence.item.item(71, 1, 277, {["rareness"] = "1"}));
talkEntry:addConsequence(npc.base.consequence.item.item(62, 1, 877, {["rareness"] = "1", ["craftedBy"] = "Zassaria Riverbank"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 9));
talkEntry:addResponse("Thank you. Please take thisss asss reward. And keep the fissch as souvenir, I caught a lager one than thisss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 11));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst. Du wirst mit Münzen und Schmuck belohnt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 2500));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 3000));
talkEntry:addConsequence(npc.base.consequence.item.item(71, 1, 877, {["rareness"] = "1", ["craftedBy"] = "Zassaria Riverbank"}));
talkEntry:addConsequence(npc.base.consequence.item.item(62, 1, 877, {["rareness"] = "1", ["craftedBy"] = "Zassaria Riverbank"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 9));
talkEntry:addResponse("Danke ssschön. Bitte nehmt diess. Und behaltet den Fisssch als Suvernir, ich habe bereits einen größeren gefangen. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me V"));
talkEntry:addConsequence(npc.base.consequence.item.item(0, 0, 0, {["descriptionEn"] = "This crown belongs to Rosaline Edwarts.", ["descriptionDe"] = "Diese Krone gehört Rosaline Edwarts."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 13));
talkEntry:addResponse("I was lucky today. Zss! Zss! I found the crown of Rosaline Edwards. She will sssurely misss it, please go and bring her cown back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 12));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich V"));
talkEntry:addConsequence(npc.base.consequence.item.item(0, 0, 0, {["descriptionEn"] = "This crown belongs to Rosaline Edwarts.", ["descriptionDe"] = "Diese Krone gehört Rosaline Edwarts."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 13));
talkEntry:addResponse("Ich habe wirklich Anglerglück. Zss! Zss! Ich habe die Krone von Rosaline Edwards gefissscht. Sicher vermisst sie ihren Kopfssschuck ssschon. Geht und birngt ihr die Krone zurück. Zss! Zss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 12));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Ask for me V"));
talkEntry:addConsequence(npc.base.consequence.item.item(0, 0, 0, {["descriptionEn"] = "This crown belongs to Rosaline Edwarts.", ["descriptionDe"] = "Diese Krone gehört Rosaline Edwarts."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 13));
talkEntry:addResponse("I was lucky today. Zss! Zss! I found the crown of Rosaline Edwards. She will sssurely misss it, please go and bring her cown back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 12));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Frag für mich V"));
talkEntry:addConsequence(npc.base.consequence.item.item(0, 0, 0, {["descriptionEn"] = "This crown belongs to Rosaline Edwarts.", ["descriptionDe"] = "Diese Krone gehört Rosaline Edwarts."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 13));
talkEntry:addResponse("Ich habe wirklich Anglerglück. Zss! Zss! Ich habe die Krone von Rosaline Edwards gefissscht. Sicher vermisst sie ihren Kopfssschuck ssschon. Geht und birngt ihr die Krone zurück. Zss! Zss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Pleassse bring the crown back to Rosaline Edwards. Ssshe will misss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 13));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte bringt Rosaline Edwards ihre Krone zzzurück. Ssssie wird sie vermisssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 13));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Pleassse bring the crown back to Rosaline Edwards. Ssshe will misss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 13));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte bringt Rosaline Edwards ihre Krone zzzurück. Ssssie wird sie vermisssen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded a wand of water, a old magical broadsword, and some coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50000));
talkEntry:addConsequence(npc.base.consequence.item.item(2784, 1, 987, {["descriptionEn"] = "This wand was a present by Zassaria Riverbank", ["magicalEmerald"] = "4", ["rareness"] = "1", ["descriptionDe"] = "Dieser Zauberstab war ein Geschenk von Zassaria Riverbank.", ["magicalRuby"] = "2"}));
talkEntry:addConsequence(npc.base.consequence.item.item(2654, 1, 222, {["descriptionEn"] = "This sword was a present by Zassaria Riverbank", ["rareness"] = "1", ["descriptionDe"] = "Dieses Schwert war ein Geschenk von Zassaria Riverbank."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 15));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 12));
talkEntry:addResponse("It'sss not her crown? Then, keep it. and take thisss as reward.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 14));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelößt] Du hast den Quest gelöst. Du wirst mit einem Stab des Wassers, einem alten magischen Breitschwert und ein paar Silbermünzen belohnt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 50000));
talkEntry:addConsequence(npc.base.consequence.item.item(2784, 1, 987, {["descriptionEn"] = "This sword was a present by Zassaria Riverbank", ["magicalEmerald"] = "4", ["rareness"] = "1", ["descriptionDe"] = "Dieser Zauberstab war ein Geschenk von Zassaria Riverbank.", ["magicalRuby"] = "2"}));
talkEntry:addConsequence(npc.base.consequence.item.item(2654, 1, 222, {["descriptionEn"] = "This wand was a present by Zassaria Riverbank", ["rareness"] = "1", ["descriptionDe"] = "Dieses Schwert war ein Geschenk von Zassaria Riverbank."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(701, "=", 15));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 12));
talkEntry:addResponse("Esss issst nicht ihre Krone. Dann behaltet sssie doch. Und nehmt diess als Belohung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 15));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Thank you. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 15));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Danke ssschön. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 15));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Thank you. Zss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(701, "=", 15));
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
talkEntry:addResponse("Wissst Ihr, dasss es einen Unterschied zzzwischen Zsss, Tss und Ssss?");
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