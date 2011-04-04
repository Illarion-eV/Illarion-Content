--------------------------------------------------------------------------------
-- NPC Name: Gregor Remethar                                         Runewick --
-- NPC Job:  mortician                                                        --
--                                                                            --
-- NPC Race: human                      NPC Position:  907, 804, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: April 04, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 907, 804, 0, 4, 'Gregor Remethar', 'npc.gregor_remethar', 0, 3, 4, 90, 90, 90, 192, 140, 98);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.gregor_remethar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Debugging] Quest status set to 0"));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, ">", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Status error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This is NPC is the mortician Gregor Remethar. Keyphrases: Hello, quest, mortician, tomb, value of life."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Leichenbestatter Gregor Remethar. Schlüsselwörter: Hallo, Quest, Leichenbestatter, Gruft, Wert des Lebens."));
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
talkEntry:addResponse("Ah, one of the living visits me. What brought you here - do you want to honour your ancestors in the tomb?");
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
talkEntry:addResponse("Ah, einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, one of the living visits me. What brought you here - do you want to visit your ancestors in the tomb?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse(", einer der Lebenden besucht mich. Was hat euch hergebracht - wollt ihr in der Gruft eure Vorfahren ehren?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Go with the gods' blessing. And don't return too soon, if you know what I mean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go with the gods' blessing. And don't return too soon, if you know what I mean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehet mit dem Segen der Götter. Und kehrt nicht sobald wieder - falls ihr versteht, was ich meine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I bury those who fell. How do you I think I feel? Assessing one's life's value is not an easy task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich beerdige diejenigen, die starben. Wie meint ihr wohl, fühle ich mich dabei? Den Wert eines Lebens zu schätzen ist fürwahr nicht einfach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am called Gregor Remethar, nice to meet you and to be able to - still - talk to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Gregor Remethar, es freut mich, mit mich euch - noch -unterhalten zu können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A light at the end of the tunnel"));
talkEntry:addResponse("Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Ein Licht am Ende des Tunnels"));
talkEntry:addResponse("In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] A light at the end of the tunnel"));
talkEntry:addResponse("Indeed, I have a task for you. Could you go down into the tomb and make sure the lights of honour in front of the urns of the mages are alight? Here, have this lamp oil and come back if you lit the lamps.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Ein Licht am Ende des Tunnels"));
talkEntry:addResponse("In der Tat, ich habe einen Auftrag für euch. Könntet ihr bitte in die Gruft gehen und sicherstellen, dass die Ehrenlichter vor den Urnen der Magier brennen? Hier, nehmt dieses Lampenöl und kommt zu mir zurück, wenn ihr die Leuchten angezündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 1));
talkEntry:addResponse("Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 1));
talkEntry:addResponse("Well, did you make sure the lights are burning in the tomb? Whenever you lit the flames of honour, come here for a small compensation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 1));
talkEntry:addResponse("Nun, habt ihr schon sichergestellt, dass die Ehrenlichter in der Gruft brennen? Wenn immer ihr die Leuchten angezündet habt, kommt zu mir für eine kleine Aufwandsentschädigung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 copper coins. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Kupfermünzen. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 20 copper coins."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have these twenty coppercoins as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 20 Kupfermünzen."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese zwanzig Kupfermünzen für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 20));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a bottle of lamp oil. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Flasche Lampenöl. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a bottle of lamp oil."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this lamp oil as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Flasche Lampenöl."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Lampenöl für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(390, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a piece of wax. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this piece of wax as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(431, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Stück Wachs. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(431, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a piece of wax."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this this piece of wax as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(431, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Stück Wachs."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Stück Wachs für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(431, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a candle. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(43, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Kerze. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(43, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a candle."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this candle as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(43, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Kerze."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Kerze für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(43, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a torch. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Fackel. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a torch."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this torch as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Fackel."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diese Fackel für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(33));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a cookie. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(453, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(33));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Keks. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(453, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(33));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a cookie."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this cookie as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(453, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(33));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Keks."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Keks für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(453, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(50));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a parchment. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(2745, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(50));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Pergament. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(2745, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(50));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a parchment."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this parchment as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(2745, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.chance.chance(50));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Pergament."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt dieses Pergament für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(2745, 1, 333, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a golden ring. You advance in archmage Elvaine Morgan's favour."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(235, 1, 577, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Goldring. Dein Ansehen bei Erzmagier Elvaine Morgan steigt."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(235, 1, 577, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Runewick", "+", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a golden ring."));
talkEntry:addResponse("Ah, you lit the lights of honour. Here, have this golden ring as compensation. Come back whenever you relit the lights.");
talkEntry:addConsequence(npc.base.consequence.item.item(235, 1, 577, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Goldring."));
talkEntry:addResponse("Ah, ihr habt also die Ehrenlichter angezündet. Hier, nehmt diesen Goldring für eure Mühen. Kommt erneut zu mir, wenn ihr die Lichte erneut entzündet habt.");
talkEntry:addConsequence(npc.base.consequence.item.item(235, 1, 577, 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(105, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(105, "=", 2));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Chance error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mortician");
talkEntry:addTrigger("undertaker");
talkEntry:addTrigger("gravedigger");
talkEntry:addTrigger("funeral");
talkEntry:addResponse("My job is to bury those who fell - and to assess the value of their life. Depending on that, their fate is sealed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bestatter");
talkEntry:addTrigger("Totengräber");
talkEntry:addTrigger("Beerdigung");
talkEntry:addResponse("Meine Aufgabe ist es, diejenigen zu begraben, deren Leben am Ende ist - und den Wert ihres Lebens einzuschätzen. Den der bestimmt, was mit ihnen geschieht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am the local mortician. I judge who earned himself most fame about wisdom and justice. For this is what determines our fame in the afterlife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin hier der Bestatter. Ich entscheide, wer sich wie sehr verdient gemacht hat um die Weisheit und die Gerechtigkeit. Denn dies bestimmt unser aller Ansehen im Tode.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Mind me taking your measures?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Darf ich schonmal eure Maße aufnehmen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tomb");
talkEntry:addResponse("The tomb of Runewick is a place where the people seperates; urns for the mages, coffins for the apprentices and darkness for the commoners.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("value");
talkEntry:addTrigger("fame");
talkEntry:addTrigger("fate");
talkEntry:addResponse("Depening on the value of one's life, there are three methods to get buried. I could tell you more on these methods...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("assess");
talkEntry:addTrigger("earn");
talkEntry:addTrigger("judge");
talkEntry:addResponse("Who am I to judge over one's life you might say? I do not judge. One's fame usually arrives here long before one's body.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("method");
talkEntry:addTrigger("urn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bury");
talkEntry:addTrigger("grave");
talkEntry:addTrigger("coffin");
talkEntry:addResponse("Those who earned most fame in life are cremated so that their body cannot be spoiled. Those who did well are buried in coffins - for future use. And those who failed are tossed into darkness...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gruft");
talkEntry:addTrigger("Grab");
talkEntry:addResponse("Die Gruft von Runewick ist ein Ort, an dem sich das Volk aufteilt; Urnen für die Magier, Särge für die Lehrlinge und die Dunkelheit für das gemeine Volk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wert");
talkEntry:addTrigger("Ansehen");
talkEntry:addTrigger("Schicksal");
talkEntry:addResponse("Je nachdem, wie hoch der Wert des Lebens war, gibt es drei Methoden, jemanden zu begraben. Ich könnte euch mehr über diese Methoden erzählen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verdien");
talkEntry:addTrigger("schätz");
talkEntry:addTrigger("Urteil");
talkEntry:addResponse("Was ich mir einbilde, den Wert eines Lebens einschätzen zu können? Das muss ich gar nicht; der Ruf eilten einer Leiche zumeist vorraus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("method");
talkEntry:addTrigger("grab");
talkEntry:addTrigger("urne");
talkEntry:addTrigger("Sarg");
talkEntry:addResponse("Die, deren Leben einen hohen Wert hatte, werden eingeäschert, so dass ihre Leiche nicht geschändet werden kann. Die, die guter Dinge waren, werden in Särgen begraben - für weitere Verwendung. Die, die versagten, werden in die Dunkelheit geworfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Calaway");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am not the undertaker! I prefer the term mortician.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Calaway");
talkEntry:addResponse("Ich bin nicht der Totengräber! Ich ziehe die Bezeichnung Leichenbestatter vor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The archmage is a good man. He knows exactly who's life is valuable for the society and who's isn't.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier ist ein guter Mann. Er weiß genau, wessen Leben wertvoll für die Gemeinschaft ist; und wessen nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The archmage is a good man. He knows exactly who's life is valuable for the society and who's isn't.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier ist ein guter Mann. Er weiß genau, wessen Leben wertvoll für die Gemeinschaft ist; und wessen nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In Runewick, everyone is equal; you have equal chances, but if you don't achieve something, your life is wasted.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("In Runewick ist Jedermann gleich geboren. Wer nichts zustandebringt, dessen Leben ist allerdings verwirkt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I heard a rumour about the Don; that he makes people dissapear he does not like. No tombstone reminds on them...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich habe eine Gerücht über den Don gehört; er lässt Leute einfach so verschwinden, die ihm quer kommen. Kein Grabstein wird jemals an sie erinnern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In Galmair, your fame in afterlife depends a lot on the amount of money you have - or had. Big purse, big grave, small purse, no grave. Horrible!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("In Galmair hängt der Ruf eines Verstorbenen offensichtlich stark vom Reichtum ab. Großer Geldbeutel, großes Grab, kleiner Geldbeutel, kein Grab - wie schrecklich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I overheard queen Rosaline wants to have a magnificient grave in the desert. Her royal builder Robertus is in charge; I wonder whether he'll finish the grave before she passes...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich habe gehört, dass Königin Rosaline ein glorreiches Grab in der Wüste haben möchte. Ihr königlicher Baumeister Robertus ist damit beauftragt. Ich frage mich nur, ob er damit fertig wird, bevor sie verstirbt...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I overheard queen Rosaline wants to have a magnificient grave in the desert. Her royal builder Robertus is in charge; I wonder whether he'll finish the grave before she passes...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich habe gehört, dass Königin Rosaline ein glorreiches Grab in der Wüste haben möchte. Ihr königlicher Baumeister Robertus ist damit beauftragt. Ich frage mich nur, ob er damit fertig wird, bevor sie verstirbt...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do respect the people of Cadomyr. Their habits are unlike ours; they assess the value of one's life upon birth, we do upon death. But does this make us so different?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich schätze das Volk von Cadomyr. Ihre Gebräuche sind etwas anders als unsere; der Wert eines Lebens wird bei ihnen bei der Geburt bestimmt, bei uns nach dem Tode. Aber macht uns das so verschieden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are burning the bodies of their deads in Albar. This is, as a matter of fact, an act of honour - for those will never be raised as undeads by foul craft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Die Albarier verbrennen ihre Toten. Dies ist fürwahr eine Ehrerweisung, denn wer verbrannt ist, kann nicht durch dunkle Künste ins Leben zurückgerufen werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They have strange habits in Gynk. Word is they just sink their deads in the swamps. What a horrible custom!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Es gibt merkwürdige Sitten in Gynk. Man sagt, sie werfen ihre Toten einfach in den Sumpf. Was für ein grausamer Brauch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The archmage once told me that in Salkamar, only the good are buried in coffins while the evil face an undescribeable fate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Einst sagte mir der Erzmagier, dass in Salkamar nur die Rechtschaffenden in Särgen begraben werden während die Niederträchtigen ein unbeschreibliches Schicksal erleiden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I do service to Cherga every day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich diene Cherga jeden Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not love Cherga. But I honour her. Being the keeper of the afterlife, her deeds deserve our respect. Or would you like to do that job?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich liebe Cherga nicht, aber ich ehre sie. Ihre Taten als Hüterin des Jenseits verdienen unseren Respekt. Oder möchtet ihr ihren Job übernehmen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("You cannot bribe me. I do not accept any goods nor money. My judgement is neutral.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Man kann mich nicht bestechen. Ich nehme weder Waren noch Geld an. Mein Urteil ist unabhängig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("We could talk about the tomb or my profession as mortician. I also have a task for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wir könnten über die Gruft oder meinen Beruf reden. Ich habe auch eine Aufgabe für euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gregor");
talkEntry:addTrigger("Remethar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am the local mortician. Nobody loves me, but everyone needs me. One day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gregor");
talkEntry:addTrigger("Remethar");
talkEntry:addResponse("Ich bin hier der Leichenbestatter. Niemand liebt mich, aber jeder braucht mich - eines Tages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Really.");
talkEntry:addResponse("By Cherga, could you rephrase that?");
talkEntry:addResponse("Honour the dead.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Wirklich.");
talkEntry:addResponse("Bei Cherga, könntet ihr das anders ausdrücken?");
talkEntry:addResponse("Ehret die Toten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Shall I take your measurements for a coffin now or later?");
talkEntry:addResponse("I do not understand. Do I have to?");
talkEntry:addResponse("Pardon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Soll ich eure Maße für einen Sarg jetzt aufnehmen oder später?");
talkEntry:addResponse("Ich verstehe nicht recht. Müßte ich etwa?");
talkEntry:addResponse("Pardon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Wie soll jemand seine letzte Ruhe finden, wenn kein Licht brennt?", "How can they rest when no light is burning?");
talkingNPC:addCycleText("Die Dunkelheit wartet... darauf, dass das Licht ausgeht.", "Darkness awaits... that the light goes off.");
talkingNPC:addCycleText("Eine helle Kerze soll dir ein Leuchtfeuer sein.", "A candle of light shall be your beacon in the night.");
talkingNPC:addCycleText("Drei Schicksale und ich bin der Schätzer; was wird wohl euer Schicksal sein?", "Three fates and I have to choose; what may be your fate?");
talkingNPC:addCycleText("Es ist nicht die Zeit, Trübsal zu blasen.", "No time to wallow in the mire.");
talkingNPC:addCycleText("Drei Pfade; welchen werdet ihr beschreiten?.", "Three paths - which will you go?");
talkingNPC:addCycleText("#me rollt bedächtig ein Maßband aus.", "#me rolls out a measuring tape.");
talkingNPC:addCycleText("Soll ich eure Maße jetzt oder später aufnehmen?", "Shall I take your measures now or later?");
talkingNPC:addCycleText("Mein Geschäft ist sicher - gestorben wird immer!", "My business is save - people always die.");
talkingNPC:addCycleText("#me keucht wiederholt auf.", "#me coughes over and over again.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Leichenbestatter Gregor Remethar.", "This is NPC is the mortician Gregor Remethar.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 809);
mainNPC:setEquipment(11, 194);
mainNPC:setEquipment(5, 24);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
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