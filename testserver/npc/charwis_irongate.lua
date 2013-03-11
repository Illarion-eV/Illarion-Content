--------------------------------------------------------------------------------
-- NPC Name: Charwis Irongate                                         Galmair --
-- NPC Job:  Message quest giver                                              --
--                                                                            --
-- NPC Race: human                      NPC Position:  360, 281, 0            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   Lillian                                                          --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 360, 281, 0, 2, 'Charwis Irongate', 'npc.charwis_irongate', 0, 3, 2, 54, 54, 54, 238, 223, 204);
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
module("npc.charwis_irongate", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Charwis Irongate. Keywords: quest, mission, order."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Charwis Irongate. Schlüsselwörter: Quest, Mission, Auftrag."));
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
talkEntry:addResponse("Greetings to you.");
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
talkEntry:addResponse("Seid gegrüßt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid gegrüßt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Irmorom be with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Irmorom sei mit Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Irmorom be with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Irmorom sei mit Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Good, good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Gut, gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am called Charwis, Charwis Irongate. Nice to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich werde Charwis genannt, Charwis Irongate. Schön Euch kennenzulernen.");
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
talkEntry:addResponse("Charwis Irongate is not a trader!");
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
talkEntry:addResponse("Charwis Irongate ist kein Händler!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("joey");
talkEntry:addTrigger("licavoli");
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Ah Joey send you but you already ask me for something to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("joey");
talkEntry:addTrigger("licavoli");
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Ah Joey hat dich geschickt aber du hast mich bereits nach einer Aufgabe gefragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Ah Joey send you but you already ask me for something to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Ah Joey hat dich geschickt aber du hast mich bereits nach einer Aufgabe gefragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(712, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Could you help me? Nik Nilo asked me for a ruby some time ago. I found one whilst mining the other day. Could you tell him that he should talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Könntet Ihr mir Helfen? Nik Nilo fragte mich vor einiger Zeit nach einem Rubin. Neulich habe ich eine beim Schürfen gefunden. Könnt Ihr ihm bitte sagen, dass er mit mir reden möge?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Could you help me? Nik Nilo asked me for a ruby some time ago. I found one whilst mining the other day. Could you tell him that he should talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(712, "=", 8));
talkEntry:addResponse("Könntet Ihr mir Helfen? Nik Nilo fragte mich vor einiger Zeit nach einem Rubin. Neulich habe ich eine beim Schürfen gefunden. Könnt Ihr ihm bitte sagen, dass er mit mir reden möge?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addResponse("Could you help me? Nik Nilo asked me for a ruby some time ago. I found one whilst mining the other day. Could you tell him that he should talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addResponse("Könntet Ihr mir Helfen? Nik Nilo fragte mich vor einiger Zeit nach einem Rubin. Neulich habe ich eine beim Schürfen gefunden. Könnt Ihr ihm bitte sagen, dass er mit mir reden möge?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addResponse("Could you help me? Nik Nilo asked me for a ruby some time ago. I found one whilst mining the other day. Could you tell him that he should talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen I"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 1));
talkEntry:addResponse("Könntet Ihr mir Helfen? Nik Nilo fragte mich vor einiger Zeit nach einem Rubin. Neulich habe ich eine beim Schürfen gefunden. Könnt Ihr ihm bitte sagen, dass er mit mir reden möge?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nik Nilo asked me for a ruby some time ago. Can you tell him he should talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nik Nilo fragte mich nach einem Rubin. Sagt ihm bitte, er möge mit mir reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Nik Nilo asked me for a ruby some time ago. Can you tell him he should talk to me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Nik Nilo fragte mich nach einem Rubin. Sagt ihm bitte, er möge mit mir reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the Quest and are rewarded by Charwis with some coins, an old sabre and a pair of new boots. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(53, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 2));
talkEntry:addResponse("So you talked to Mister Nik Nilo? Well, thank you for your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du hast das Quest gelöst und erhälst zum Dank etwas Geld, einen Säbel und ein Paar neue Stiefel von Charwis. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 600));
talkEntry:addConsequence(npc.base.consequence.item.item(25, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(53, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 2));
talkEntry:addResponse("Ihr habt also mit Mister Nik Nilo gesprochen? Nun, danke für Eure Hilfe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 4));
talkEntry:addResponse("So, you came to help me again? That's very nice of you. I haven't seen Morri in a while. Please, ask him if he would still like to buy the pins he ordered, they are already starting to corrode.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 4));
talkEntry:addResponse("So, Ihr kommt um mir zu helfen? Wie nett. Morri hat sich schon lange nicht mehr bei mir blicken lassen. Fragt ihn, ob er noch die Nägel kaufen möchte, die er bestellt hat. Die Nägel beginnen schon zu rosten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(118, "=", 4));
talkEntry:addResponse("So, you came to help me again? That's very nice of you. I haven't seen Morri in a while. Please, ask him if he would still like to buy the pins he ordered, they are already starting to corrode.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen II"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 4));
talkEntry:addResponse("So, Ihr kommt um mir zu helfen? Wie nett. Morri hat sich schon lange nicht mehr bei mir blicken lassen. Fragt ihn, ob er noch die Nägel kaufen möchte, die er bestellt hat. Die Nägel beginnen schon zu rosten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please ask Morri about his pin order.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte fragt bei Morri wegen seiner Nagelbestellung nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please ask Morri about his pin order.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte fragt bei Morri wegen seiner Nagelbestellung nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded 10 silver coins and an old hat. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 4));
talkEntry:addResponse("Thank you. Take this as a reward.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 5));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du hast das Quest gelöst. Du wirst mit 10 Silbermünzen und einem alten Schlapphut belohnt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.item.item(356, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 4));
talkEntry:addResponse("Danke sehr. Nehmt dies als Belohnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 7));
talkEntry:addResponse("Please ask Gretel Goldhair what happened to my collection of hammers. I saw her carrying them away the other day. You can find her inside the Don's residence, the building right there to the north.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 7));
talkEntry:addResponse("Bitte fragt Gretel Goldhair was sie mit meiner Sammlung Hämmer gemacht hat. Ich sah wie sie sie neulich davon trug. Ihr könnt sie in der Residenz des Dons finden, es ist das Gebäude gleich dort im Norden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 7));
talkEntry:addResponse("Please ask Gretel Goldhair what happened to my collection of hammers. I saw her carrying them away the other day. You can find her inside the Don's residence, the building right there to the north.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen III"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 7));
talkEntry:addResponse("Bitte fragt Gretel Goldhair was sie mit meiner Sammlung Hämmer gemacht hat. Ich sah wie sie sie neulich davon trug. Ihr könnt sie in der Residenz des Dons finden, es ist das Gebäude gleich dort im Norden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please ask Gretel Goldhair what happened to my collection of hammers. I saw her carrying them away.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte fragt Gretel Goldhair was sie mit meiner Sammlung Hämmer gemacht hat. Ich sah wie sie sie davon trug.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please ask Gretel Goldhair what happened to my collection of hammers. I saw her carrying them away.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte fragt Gretel Goldhair was sie mit meiner Sammlung Hämmer gemacht hat. Ich sah wie sie sie davon trug.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded 12 silver coins and a new robe. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.item.item(195, 1, 333, {["descriptionEn"] = "This robe has the colour of the Galmairian flag.", ["descriptionDe"] = "Diese Robe hat die Farbe der Galmairischen Flagge."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("What? She said she threw them away? First I must thank you for asking Gretel Goldhair, take this as a present. Then I will talk to her!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du hast das Quest gelöst. Du wirst mit 12 Silbermünzen und einer neuen Robe belohnt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1200));
talkEntry:addConsequence(npc.base.consequence.item.item(195, 1, 333, {["descriptionEn"] = "This robe has the colour of the Galmairian flag.", ["descriptionDe"] = "Diese Robe hat die Farbe der Galmairischen Flagge."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 9));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Was? Wegeworfen hat sie sie? Zuerst will ich Euch danken, dass Ihr mit Gretel Goldhair spracht. Nehmt dies als Geschenk. Dann werde ich mir ihr sprechen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery IV"));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 440, {["nameDe"] = "Echt großer Goldnugget", ["nameEn"] = "Really big gold nugget", ["descriptionEn"] = "This gold nugget is the size of an apple.", ["rareness"] = "2", ["descriptionDe"] = "Dieser Goldnugget ist so groß wie ein Apfel."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 10));
talkEntry:addResponse("Look, I found this gold nugget. It's as big as an apple but Pheritaleth, the magical smith from Cadomyr, does not believe me! Show her the gold nugget, please.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen IV"));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 440, {["nameDe"] = "Echt großer Goldnugget", ["nameEn"] = "Really big gold nugget", ["descriptionEn"] = "This gold nugget is the size of an apple.", ["rareness"] = "2", ["descriptionDe"] = "Dieser Goldnugget ist so groß wie ein Apfel."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 10));
talkEntry:addResponse("Schaut, ich habe einen Goldnugget gefangen, der ist so groß wie ein Apfel. Aber Pheritaleth, magische Schmied aus Cadomyr, sagt ich lüge! Bitte zeigt ihr diesen Goldnugget!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery IV"));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 440, {["nameDe"] = "Echt großer Goldnugget", ["nameEn"] = "Really big gold nugget", ["descriptionEn"] = "This gold nugget is the size of an apple.", ["rareness"] = "2", ["descriptionDe"] = "Dieser Goldnugget ist so groß wie ein Apfel."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 10));
talkEntry:addResponse("Look, I found this gold nugget. It's as big as an apple but Pheritaleth, the magical smith from Cadomyr, does not believe me! Show her the gold nugget, please.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen IV"));
talkEntry:addConsequence(npc.base.consequence.item.item(234, 1, 440, {["nameDe"] = "Echt großer Goldnugget", ["nameEn"] = "Really big gold nugget", ["descriptionEn"] = "This gold nugget is the size of an apple.", ["rareness"] = "2", ["descriptionDe"] = "Dieser Goldnugget ist so groß wie ein Apfel."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 10));
talkEntry:addResponse("Schaut, ich habe einen Goldnugget gefangen, der ist so groß wie ein Apfel. Aber Pheritaleth, magische Schmied aus Cadomyr, sagt ich lüge! Bitte zeigt ihr diesen Goldnugget!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please, show the gold nugget to Pheritaleth in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte zeigt Pheritaleth aus Cadomyr diesen Goldnugget.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please, show the gold nugget to Pheritaleth in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte zeigt Pheritaleth aus Cadomyr diesen Goldnugget.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are rewarded with some coins and jewellery. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.item.item(62, 1, 877, {["rareness"] = "1", ["craftedBy"] = "Charwis Irongate"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 9));
talkEntry:addResponse("Thank you. Please take this as a reward, and keep the gold nugget as a souvenir, I found an even larger one than that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du hast das Quest gelöst. Du wirst mit Münzen und Schmuck belohnt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.item.item(62, 1, 877, {["rareness"] = "1", ["craftedBy"] = "Charwis Irongate"}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 9));
talkEntry:addResponse("Danke schön. Bitte nehmt dies. Und behaltet den Goldnugget als Souvenir, ich habe bereits einen größeren gefunden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery V"));
talkEntry:addConsequence(npc.base.consequence.item.item(2785, 1, 999, {["descriptionEn"] = "This wand belongs to Elvaine Morgan.", ["descriptionDe"] = "Dieser Stab gehört Elvaine Morgan."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 13));
talkEntry:addResponse("I was lucky today. I found the wand of Elvaine Morgan. He will surely miss it, please go and take his wand back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen V"));
talkEntry:addConsequence(npc.base.consequence.item.item(2785, 1, 999, {["descriptionEn"] = "This wand belongs to Elvaine Morgan.", ["descriptionDe"] = "Dieser Stab gehört Elvaine Morgan."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 13));
talkEntry:addResponse("Ich hatte heute wirklich Glück. Ich habe den Stab von Elvaine Morgan gefunden. Sicher vermisst er ihn schon. Geht und bringt ihm den Stab zurück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Message Delivery V"));
talkEntry:addConsequence(npc.base.consequence.item.item(2785, 1, 999, {["descriptionEn"] = "This wand belongs to Elvaine Morgan.", ["descriptionDe"] = "Dieser Stab gehört Elvaine Morgan."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 13));
talkEntry:addResponse("I was lucky today. I found the wand of Elvaine Morgan. He will surely miss it, please go and take his wand back.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Nachrichten Überbringen V"));
talkEntry:addConsequence(npc.base.consequence.item.item(2785, 1, 999, {["descriptionEn"] = "This wand belongs to Elvaine Morgan.", ["descriptionDe"] = "Dieser Stab gehört Elvaine Morgan."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 13));
talkEntry:addResponse("Ich hatte heute wirklich Glück. Ich habe den Stab von Elvaine Morgan gefunden. Sicher vermisst er ihn schon. Geht und bringt ihm den Stab zurück.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please take the wand back to Elvaine Morgan, he will miss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte bringt Elvaine Morgan seinen Stab zurück. Er wird ihn vermissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Please take the wand back to Elvaine Morgan, he will miss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Bitte bringt Elvaine Morgan seinen Stab zurück. Er wird ihn vermissen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You solved the quest. You are awarded a silvered longsword and some coins. You advance in Don Valerio Guilianni's favour."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(98, 1, 222, {["descriptionEn"] = "This sword was a present from Charwis Irongate", ["rareness"] = "1", ["descriptionDe"] = "Dieses Schwert war ein Geschenk von Charwis Irongate."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 15));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 12));
talkEntry:addResponse("Thank you. Take this for your trouble.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du hast das Quest gelöst. Du wirst mit einem versilberten Langschwert und ein paar Silbermünzen belohnt. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 500));
talkEntry:addConsequence(npc.base.consequence.item.item(98, 1, 222, {["descriptionEn"] = "This wand was a present from Charwis Irongate", ["rareness"] = "1", ["descriptionDe"] = "Dieses Schwert war ein Geschenk von Charwis Irongate."}));
talkEntry:addConsequence(npc.base.consequence.quest.quest(702, "=", 15));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 12));
talkEntry:addResponse("Danke, nehmt dies als Belohnung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 15));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Thank you. I have nothing else for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 15));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Danke schön. Zss. Ich habe nichts mehr für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 15));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Thank you. I have nothing else for you to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(702, "=", 15));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Danke schön. Ich habe nichts mehr für Euch zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I have no task for people who do not belong to Galmair. You can go to Frederik to become a citizen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich habe keine Aufgabe für Leute die nicht Galmair angehören. Ihr könnt zu Frederik gehen, um Bürger zu werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I have no task for people who do not belong to Galmair. You can go to Frederik to become a citizen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich habe keine Aufgabe für Leute die nicht Galmair angehören. Ihr könnt zu Frederik gehen, um Bürger zu werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I work as a smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich arbeite als Schmied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I work as a smith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich arbeite als Schmied.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Do you know there's a difference between iron, coal and gold?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addTrigger("erzähl mir was");
talkEntry:addTrigger("erzählt mir was");
talkEntry:addResponse("Wissst ihr, dass es einen Unterschied zwischen Erz, Kohle und Gold gibt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I pray to Irmorom. To whom do you pray?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bete zu Irmorom. Zu wem betet Ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("He's the God of crafts and merchants.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Er ist der Gott des Handwerks und der Händler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Leave me alone about those wand-wavers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Lasst mich zufrieden mit diesen Zauberstabwedlern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("The best place to be, if you ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Der beste Ort, wenn ihr mich fragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Leave me alone about those palm-wavers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Lasst mich zufrieden mit diesen Palmenwedlern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I don't talk about foreign places.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich spreche nicht über fremde Orte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I don't talk about foreign places.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich spreche nicht über fremde Orte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I don't talk about foreign places.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ich spreche nicht über fremde Orte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schaut sich um.", "#me looks around.");
talkingNPC:addCycleText("#me kratzt sich am Kinn.", "#me scratches his chin.");
talkingNPC:addCycleText("#me räuspert sich geräuschvoll.", "#me clears his throat noisily.");
talkingNPC:addCycleText("So, so...", "There, there...");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "");
mainNPC:setUseMessage("#me schaut verärgert.", "#me looks angry.");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 458);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 23);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 826);
mainNPC:setEquipment(10, 53);
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