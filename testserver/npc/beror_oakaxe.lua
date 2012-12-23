--------------------------------------------------------------------------------
-- NPC Name: Beror Oakaxe                                             Cadomyr --
-- NPC Job:  Quartermaster                                                    --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  135, 620, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 135, 620, 0, 4, 'Beror Oakaxe', 'npc.beror_oakaxe', 0, 3, 1, 79, 79, 79, 240, 175, 130);
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
module("npc.beror_oakaxe", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, ">", 18));
talkEntry:addTrigger(".+");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Beror Oakaxe the royal quartermaster. Keywords: Hello, Quest, Orders, Knight, Gate."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Beror Oakaxe der königliche Quartiermeister. Schlüsselwörter: Hallo, Quest, Befehle, Ritter, Tor."));
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
talkEntry:addResponse("Ha! A new recruit. You came here to get your orders for today, right?");
talkEntry:addResponse("Attention! The queen issued new orders, and her majesty will not tolerate delay! Report for duty!");
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
talkEntry:addResponse("Ha! Ein neuer Rekrut. Du bist hier, um deinen Tagesbefehl zu erhalten, richtig?");
talkEntry:addResponse("Hergehört! Die Königin hat neue Befehle ausgegeben. Und ihre Majestät mag keine Verzögerungen in ihrer Ausführung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ha! A new recruit. You came here to get your orders for today, right?");
talkEntry:addResponse("Ha! A new recruit, bet your looking for orders aren't you, greenhorn?");
talkEntry:addResponse("Attention! The queen issued new orders, and her majesty will not tolerate delay! Report for duty!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Ha! Ein neuer Rekrut. Du bist hier, um deinen Tagesbefehl zu erhalten, richtig?");
talkEntry:addResponse("Hergehört! Die Königin hat neue Befehle ausgegeben. Und ihre Majestät mag keine Verzögerungen in ihrer Ausführung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Dismissed.");
talkEntry:addResponse("Best of luck.");
talkEntry:addResponse("Move out!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Wegetreten.");
talkEntry:addResponse("Viel Glück.");
talkEntry:addResponse("Los!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Dismissed.");
talkEntry:addResponse("Best of luck.");
talkEntry:addResponse("Move out!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Wegetreten.");
talkEntry:addResponse("Viel Glück.");
talkEntry:addResponse("Los!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Casual conversation? Small talk? Do you think Cadomyr was built by words!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Eine entspannte Unterhaltung? Klatsch und Tratsch? Denkst du, Cadomyr wurde mit Worten gebaut!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am the royal quartermaster, Beror Oakaxe, and yes, I am a dwarf. An angry dwarf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der königliches Quartiermeister Beror Oakaxe. Und ja, ich bin ein Zwerg. Ein zorniger Zwerg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I do not issue quests to honourless commoners, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich vergebe keine Aufgaben an ehrloses Gesindel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I do not issue quests to honourless commoners, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich vergebe keine Aufgaben an ehrloses Gesindel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I do not issue quests to brain-dead wanderers, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich vergebe keine Aufgaben an hirnverbrannte Idioten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I do not issue quests to brain-dead wanderers, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(2));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich vergebe keine Aufgaben an hirnverbrannte Idioten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour I"));
talkEntry:addResponse("You are fairly new to Cadomyr, aren't you? As a good recruit, you should make yourself familiar with the Cadomyr laws. Visit Sir Reginald's statue and study the customs thoroughly.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(110, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre I"));
talkEntry:addResponse("Du bist neu hier, richtig? Als braver Rekrut solltest du dich zuerst mit den Gesetzen Cadomyrs vertraut machen. Geh zu Sir Reginalds Statue, dort kannst du sie ausgiebig studieren.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(110, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour I"));
talkEntry:addResponse("You are fairly new to Cadomyr, aren't you? As a good recruit, you should make yourself familiar with the Cadomyr laws. Visit Sir Reginald's statue and study the customs thoroughly.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(110, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 0));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre I"));
talkEntry:addResponse("Du bist neu hier, richtig? Als braver Rekrut solltest du dich zuerst mit den Gesetzen Cadomyrs vertraut machen. Geh zu Sir Reginalds Statue, dort kannst du sie ausgiebig studieren.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(110, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Very well, now you are ready for a real mission. You didn't expect a reward, did you?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 2));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Soweit, so gut. Du bist nun bereit für höhere Aufgaben. Du hast jetzt nicht mit einer Belohnung gerechnet, oder?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 3));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You cannot defend Cadomyr's way of life if you do not even know our laws. They are clearly engraved upon Sir Reginald's statue in front of the palace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wie willst du Cadomyrs Lebensstil verteidigen, wenn du noch nicht einmal die Gesetze kennst? Du findest sie auf Sir Reginalds Statue vor dem Palast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You cannot defend Cadomyr's way of life if you do not even know our laws. They are clearly engraved upon Sir Reginald's statue in front of the palace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Wie willst du Cadomyrs Lebensstil verteidigen, wenn du noch nicht einmal die Gesetze kennst? Du findest sie auf Sir Reginalds Statue vor dem Palast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour II"));
talkEntry:addResponse("Attention recruit! Your first mission is to patrol Cadomyr and report any uncommon events. Check the notary's office, the palace and especially the gate.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre II"));
talkEntry:addResponse("Stillgestanden, Rekrut! Deine erste Mission besteht darin, in Cadomyr zu patroullieren und besonder Vorkommnisse zu melden. Überprüf das Notarbüro, den Palast und natürlich das Stadttor.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour II"));
talkEntry:addResponse("Attention recruit! Your first mission is to patrol Cadomyr and report any uncommon events. Check the notary's office, the palace and especially the gate.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 3));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre II"));
talkEntry:addResponse("Stillgestanden, Rekrut! Deine erste Mission besteht darin, in Cadomyr zu patroullieren und besonder Vorkommnisse zu melden. Überprüf das Notarbüro, den Palast und natürlich das Stadttor.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a beer. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Any uncommon events? I expect a written report later. Now let's have a beer before I send you out again!");
talkEntry:addConsequence(npc.base.consequence.item.item(1909, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 5));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst ein Bier. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Irgendwelche besonderen Vorkommnisse? Ich erwarte deinen schriftlichen Bericht später. Jetzt lass uns erstmal ein Bier leeren, bevor ich dich auf deine nächste Mission schicke.");
talkEntry:addConsequence(npc.base.consequence.item.item(1909, 1, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 6));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 4));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("What are you waiting for? Patrol the notary's office, the palace, and the town gate!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Worauf wartest du!? Überprüfe das Notarbüro, den Palast und das Stadttor!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("What are you waiting for? Patrol the notary's office, the palace, and the town gate!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 4));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Worauf wartest du!? Überprüfe das Notarbüro, den Palast und das Stadttor!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 6));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour III"));
talkEntry:addResponse("Maybe you noticed on your patrol the small breach in the town wall. Glorious deeds sometimes are hard labour; bring me twenty bricks so we fix the breach.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre III"));
talkEntry:addResponse("Wahrscheinlich ist dir währender der Patroullie die kleine Bresche in der Stadtmauer aufgefallen. Manchmal bedeuten glorreiche Taten auch harte Arbeit; bring mir bitte zwanzig Ziegel zum Ausbessern der Bresche.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour III"));
talkEntry:addResponse("Maybe you noticed on your patrol the small breach in the town wall. Glorious deeds sometimes are hard labour; bring me twenty bricks so we fix the breach.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 6));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre III"));
talkEntry:addResponse("Wahrscheinlich ist dir währender der Patroullie die kleine Bresche in der Stadtmauer aufgefallen. Manchmal bedeuten glorreiche Taten auch harte Arbeit; bring mir bitte zwanzig Ziegel zum Ausbessern der Bresche.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a brick mould. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Recruit! Imagine we were under siege and it takes you that long again to get some ordinary bricks! Here, have this brick mould so you can provide bricks faster the next time!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(2588, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine Ziegelform. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Rekrut! Stell dir mal vor, wir würden belagert werden und du brauchst wieder so lange, um ein paar gewöhnliche Ziegel zu besorgen! Nimm diese Ziegelform, damit du nächstes mal schneller bist!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2588, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(734, 1, 599, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 8));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 7));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Twenty fired bricks are needed at least to fix the town wall. If you need help, ask Robertus at the market place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Zwanzig gebrannte Ziegel werden benötigt, um die Stadtmauer auszubessern. Wenn du Hilfe brauchst, frage auf dem Markt nach Robertus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Twenty fired bricks are needed at least to fix the town wall. If you need help, ask Robertus at the market place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 7));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Zwanzig gebrannte Ziegel werden benötigt, um die Stadtmauer auszubessern. Wenn du Hilfe brauchst, frage auf dem Markt nach Robertus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour IV"));
talkEntry:addResponse("Time for some serious action! Please patrol the Candour Foundation, the Circle of Blood, the northern bridge over the Kantabi River and the eastern border. Make Cadomyr's homeland a safe place!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre IV"));
talkEntry:addResponse("Zeit für wahre Heldentaten. Patroulliere bitte den Grundstein der Aufrichtigkeit, den Blutkreis, die nördliche Brücke über den Kantabifluss und die Ostgrenze. Sorge dafür, dass das Hinterland Cadomyrs sicher ist!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour IV"));
talkEntry:addResponse("Time for some serious action! Please patrol the Candour Foundation, the Circle of Blood, the northern bridge over the Kantabi River and the eastern border. Make Cadomyr's homeland a safe place!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 8));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre IV"));
talkEntry:addResponse("Zeit für wahre Heldentaten. Patroulliere bitte den Grundstein der Aufrichtigkeit, den Blutkreis, die nördliche Brücke über den Kantabifluss und die Ostgrenze. Sorge dafür, dass das Hinterland Cadomyrs sicher ist!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 9));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 10));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded an albarian soldier helmet. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("What? An ambush of bandits? Bad news, I'll report to the queen as soon as possible. Good work, recruit! You deserve this helmet of Cadomyr's warriors.");
talkEntry:addConsequence(npc.base.consequence.item.item(2287, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 11));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 10));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen albarischen Soldatenhelm. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Was? Ein Banditenhinterhalt? Schlimme Kunde, die ich der Königin so bald wie möglich zu berichten habe. Gute Arbeit, Rekrut! Du hast dir diesen Helm der Krieger Cadomyrs redlich verdient.");
talkEntry:addConsequence(npc.base.consequence.item.item(2287, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 11));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 9));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The Candour Foundation is a mine to the south, the Circle of Blood is the arena of these lands, the northern bridge over the Kantabi River is in the north and your patrol should also lead you to the eastern border.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Der Grundstein der Aufrichtigkeit ist eine Mine im Süden, der Blutkreis die Arena dieses Landes, die nördliche Brücker über den Kantabifluss ist im Norden und deine Patroullie sollte dich auch an die Ostgrenze führen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("The Candour Foundation is a mine to the south, the Circle of Blood is the arena of these lands, the northern bridge over the Kantabi River is in the north and your patrol should also lead you to the eastern border.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 9));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Der Grundstein der Aufrichtigkeit ist eine Mine im Süden, der Blutkreis die Arena dieses Landes, die nördliche Brücker über den Kantabifluss ist im Norden und deine Patroullie sollte dich auch an die Ostgrenze führen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour V"));
talkEntry:addResponse("Sometimes, intelligence can be vital for surviving. We do not spy, but we want to know who our enemy is, if you know what I mean. I want you to reconnoitre the Hemp Necktie Inn, the Don's hideout in Galmair and the Archmage's chamber in Runewick.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre V"));
talkEntry:addResponse("Aufklärung sichert manchmal das Überleben. Wir sind keine Spione, wollen aber wissen, wer unser Feind ist. Ich will, du den Gasthof zur Hanfschlinge, das Versteck des Dons in Galmair und die Kammer des Erzmagiers in Runewick 'aufklärst'.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour V"));
talkEntry:addResponse("Sometimes, intelligence can be vital for surviving. We do not spy, but we want to know who our enemy is, if you know what I mean. I want you to reconnoitre the Hemp Necktie Inn, the Don's hideout in Galmair and the Archmage's chamber in Runewick.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre V"));
talkEntry:addResponse("Aufklärung sichert manchmal das Überleben. Wir sind keine Spione, wollen aber wissen, wer unser Feind ist. Ich will, du den Gasthof zur Hanfschlinge, das Versteck des Dons in Galmair und die Kammer des Erzmagiers in Runewick 'aufklärst'.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 13));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded enchanted albarian steelboots. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Once again, you can write your report later. For now, I am happy you made it back alive, recruit. For your next patrol, I have fitting footwear for you.");
talkEntry:addConsequence(npc.base.consequence.item.item(771, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 14));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 13));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst verzauberte albarische Stahlschuhe. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Wie immer kannst du deinen Bericht später schreiben, Rekrut. Ich bin erstmal froh, dass du heil zurück bist. Für deine nächste Patroullie habe ich passendes Schuhwerk für dich.");
talkEntry:addConsequence(npc.base.consequence.item.item(771, 1, 699, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 14));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Please reconnoitre the Hemp Necktie Inn, the Don's hideout in Galmair and the Archmage's chamber in Runewick and see who is friend and who is foe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Bitte besuche den Gasthof zur Hanfschlinge, das Versteck des Dons in Galmair und die Kammer des Erzmagiers in Runewick und finde heraus, wer Feind und wer Freund ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Please reconnoitre the Hemp Necktie Inn, the Don's hideout in Galmair and the Archmage's chamber in Runewick and see who is friend and who is foe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 12));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Bitte besuche den Gasthof zur Hanfschlinge, das Versteck des Dons in Galmair und die Kammer des Erzmagiers in Runewick und finde heraus, wer Feind und wer Freund ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 14));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour VI"));
talkEntry:addResponse("Being a knight means more than swinging a sword. Fostering one's home requires hard labour, too. Cadomyr is short on wood supply, as you might know. Please provide twenty naldor wood boards for the reconstruction of the Malachín temple.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre VI"));
talkEntry:addResponse("Ein Ritter zu sein verlangt mehr als ein Schwert zu schwingen. Die Heimat zu hegen erfordert auch harte Arbeit. Cadomyr mangelt es bekanntermaßen an Holzlieferungen. Bring mir bitte zwanzig Naldorholzbretter für den Umbau des Malachíntempels.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour VI"));
talkEntry:addResponse("Being a knight means more than swinging a sword. Fostering one's home requires hard labour, too. Cadomyr is short on wood supply, as you might know. Please provide twenty naldor wood boards for the reconstruction of the Malachín temple.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 14));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre VI"));
talkEntry:addResponse("Ein Ritter zu sein verlangt mehr als ein Schwert zu schwingen. Die Heimat zu hegen erfordert auch harte Arbeit. Cadomyr mangelt es bekanntermaßen an Holzlieferungen. Bring mir bitte zwanzig Naldorholzbretter für den Umbau des Malachíntempels.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a coppered dagger. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Good job, recruit! You did a good deed today for the glory of Cadomyr and Malachín. I award you this dagger which identifies you as a defender of Cadomyr.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(546, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(398, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 16));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 15));
talkEntry:addCondition(npc.base.condition.item.item(546, "all", ">", 19, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Kupferdolch. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Gut gemacht, Rekrut! Du hast heute eine gute Tat im Namen Cadomyrs und Malachíns vollbracht. Ich verleihe dir hiermit diesen Dolch, welcher dich als Verteidiger Cadomyr ausweist.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(546, 20, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(398, 1, 799, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 16));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 15));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Malachín is the patron of all knights and his temple really needs a new panelling. Please fetch twenty naldor wood boards for this holy cause..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 15));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Malachín ist der Patron aller Ritter und sein Tempel braucht wirklich eine neue Vertäfelung. Bitte holt zwanzig Naldorholzbretter für diesen heiligen Zweck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 15));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("Malachín is the patron of all knights and his temple really needs a new panelling. Please fetch twenty naldor wood boards for this holy cause.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 15));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Malachín ist der Patron aller Ritter und sein Tempel braucht wirklich eine neue Vertäfelung. Bitte holt zwanzig Naldorholzbretter für diesen heiligen Zweck.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 16));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour VII"));
talkEntry:addResponse("I have new orders from the queen. She demands precious goods from the best artisans of Cadomyr for impressing an albarian ambassador. Provide a charm of the icebird, a ring of the archmage and a vase. For the glory of Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 16));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre VII"));
talkEntry:addResponse("Ich habe neue Befehle der Königin. Sie verlangt nach wertvollen Kunstwerken der besten Artisanen Cadomyrs um damit einen albarischen Botschafter zu beeindrucken. Bring mir bitte ein Eisvogelamulett, einen Erzmagierring und eine Vase. Für die Ehre von Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 16));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] A Question of Honour VII"));
talkEntry:addResponse("I have new orders from the queen. She demands precious goods from the best artisans of Cadomyr for impressing an albarian ambassador. Provide a charm of the icebird, a ring of the archmage and a vase. For the glory of Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 16));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Eine Frage der Ehre VII"));
talkEntry:addResponse("Ich habe neue Befehle der Königin. Sie verlangt nach wertvollen Kunstwerken der besten Artisanen Cadomyrs um damit einen albarischen Botschafter zu beeindrucken. Bring mir bitte ein Eisvogelamulett, einen Erzmagierring und eine Vase. Für die Ehre von Cadomyr!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(334, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(2559, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(315, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a knight shield. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("You are truly an altruistic knight of Cadomyr. Bear the crest of Cadomyr on your shield, the shield of a knight. I salute you!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(334, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2559, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(315, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(20, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 18));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 17));
talkEntry:addCondition(npc.base.condition.item.item(334, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(2559, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.item.item(315, "all", ">", 0, nil));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst einen Ritterschild. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Du bist wahrhaftig ein selbstloser Ritter Cadomyrs. Trage fortan das Wappen Cadomyrs auf deinem Schild, der Schild eines Ritters. Ich salutiere vor dir!");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(334, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2559, 1, nil));
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(315, 1, nil));
talkEntry:addConsequence(npc.base.consequence.item.item(20, 1, 999, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(111, "=", 18));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 17));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("The queen demands a charm of the icebird, a ring of the archmage and a vase. Bring it to me and do not dare to bother herself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 17));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Die Königin verlangt nach einem Eisvogelamulett, einem Erzmagierring und einer Vase. Bringt diese Dinge zu mir und wagt es nicht, sie mit dieser Angelegenheit zu behelligen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 17));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("The queen demands a charm of the icebird, a ring of the archmage and a vase. Bring it to me and do not dare to bother herself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 17));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Die Königin verlangt nach einem Eisvogelamulett, einem Erzmagierring und einer Vase. Bringt diese Dinge zu mir und wagt es nicht, sie mit dieser Angelegenheit zu behelligen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You might become one of Cadomyr's heroes one day. Now set out and do good deeds in the name of the Queen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 18));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Du wirst noch mal ein Held Cadomyrs. Jetzt ziehe aus in die weite Welt und vollbringe ehrenhafte Taten im Namen der Königin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 18));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("You might become one of Cadomyr's heroes one day. Now set out and do good deeds in the name of the Queen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(111, "=", 18));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Du wirst noch mal ein Held Cadomyrs. Jetzt ziehe aus in die weite Welt und vollbringe ehrenhafte Taten im Namen der Königin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("You outcast! Can't you find a home? They accept everyone in Galmair I was told, as long as you have some money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Du Ausgestoßener! Kannst du keine Heimat finden? Sie nehmen jeden in Galmair, solange die Kasse stimmt, sagt man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("You outcast! Can't you find a home? They accept everyone in Galmair I was told, as long as you have some money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Du Ausgestoßener! Kannst du keine Heimat finden? Sie nehmen jeden in Galmair, solange die Kasse stimmt, sagt man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am the royal quartermaster. Didn't I just mention that!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der königliche Quartiermeister. Hab ich das nicht eben schon gesagt!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am the royal quartermaster. Didn't I just mention that!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin der königliche Quartiermeister. Hab ich das nicht eben schon gesagt!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("When all those refugees came I was glad that the scum went to Galmair. Otherwise, it might have ended up in a bloodbath.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Als all die Flüchtlinge kamen war ich sehr froh darüber, dass der Abschaum nach Galmair gegangen ist. Anderenfalls hättes es hier wohlmöglich noch ein Blutbad gegeben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("I'll call you private Cotton Swab if you don't mind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ich werde dich Gefreiter Wattebausch nennen, wenns dich nicht stört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quartermaster");
talkEntry:addResponse("I take my job serious and I am a serious person. My task is to care for new recruits of Cadomyr and to make sure they have all they need - orders especially!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("order");
talkEntry:addResponse("How kind! You ask me kindly for an order. Stand still! Attention! I will send you on a mission for the glory of Cadomyr, not a walk in the park!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knight");
talkEntry:addTrigger("page");
talkEntry:addResponse("So, you want to become a knight of the Queen like all the heroes your mother told you about before you went to bed? Ha! The first thing a knight has to learn is to obey orders. I got plenty!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gate");
talkEntry:addResponse("So, Horatio let you pass? I trained him, so you cannot be a threat to Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Horatio");
talkEntry:addTrigger("Milenus");
talkEntry:addResponse("So, Horatio let you pass? I trained him, so you cannot be a threat to Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Quartiermeister");
talkEntry:addResponse("Ich nehme meine Aufgabe ernst und bin ein harter Hund. Mein Dienst sieht vor, mich um die neuen Rekruten Cadomyrs zu kümmern und sicherzustellen, dass es ihnen an nichts fehlt - insbesondere an Befehlen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Oh, wie lieb, du fragst mich ganz vornehm nach einem Befehl? Stillgestanden! Achtung! Ich werde dich auf eine Mission zu Ehren Cadomyrs schicken, nicht auf einen Spaziergang!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ritter");
talkEntry:addTrigger("Knappe");
talkEntry:addResponse("So, du willst also ein Ritter der Königin werden, genauso wie all die Helden, von denen dir deine Mutter erzählt hat, bevor sie dich ins Bett gebracht hat? Ha! Das erste, was ein Ritter lernen muss, ist Befehlen zu gehorchen. Und ich hab davon eine Menge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tor");
talkEntry:addResponse("Horatio hat dich also durchgelassen? Dann bist du keine Bedrohung Cadomyrs, denn ich hab ihn ausgebildet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Horatio");
talkEntry:addTrigger("Milenus");
talkEntry:addResponse("Horatio hat dich also durchgelassen? Dann bist du keine Bedrohung Cadomyrs, denn ich hab ihn ausgebildet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("'Archmage' sounds as if Mr. Morgan is in charge of Runewick. He is not. He just starts the discussions about probably doing something sometime.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("'Erzmagier', das klingt fast so, als würde Herr Morgan den Ton in Runewick angeben. Dem ist nicht so. Er beginnt lediglich Diskussion darüber, irgendwas irgendwann vielleicht mal zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("'Archmage' sounds as if Mr. Morgan is in charge of Runewick. He is not. He just starts the discussions about probably doing something sometime.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("'Erzmagier', das klingt fast so, als würde Herr Morgan den Ton in Runewick angeben. Dem ist nicht so. Er beginnt lediglich Diskussion darüber, irgendwas irgendwann vielleicht mal zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("What they totally miss in Runewick is a clear chain of command. They discuss and talk a lot and act little.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("An was es in Runewick eindeutig fehlt ist eine klare Hackordnung. Sie diskutieren und reden eine Menge anstatt zu handeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("You can say whatever you want about Don Valerio, but he'll never become a prince as long as I can still breath.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Man kann von Don Valerio halten, was immer man will, aber eines ist klar: Er wird nicht zum Märchenprinz, solange ich noch atme.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair is a disturbing place. Everyone who can hold a sword holds also a grudge against Galmair... because... of the past.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair ist ein widerlicher Ort. Jeder, der ein Schwert halten kann, hat ein Problem mit Galmair wegen... damals.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I swore loyalty to Queen Rosaline many years ago, and not a single day has gone by with regret. She is the most wise and just ruler a kingdom can have.");
talkEntry:addResponse("Sometimes, a woman can be twice as courageous as a man, and our Queen is that example!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich hab der Königin die Treue schon vor vielen Jahren geschworen und habe es nicht einen einzigen Tag bereut. Sie ist die beste Königin, die ein Königreich haben kann.");
talkEntry:addResponse("Manche Frauen sind zweimal so mutig wie Männer. Aber nur sehr, sehr wenige und Königinnen sind äußerst ungewöhnlich in diesen Landen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I swore loyalty to Queen Rosaline many years ago, and not a single day has gone by with regret. She is the most wise and just ruler a kingdom can have.");
talkEntry:addResponse("Sometimes, a woman can be twice as courageous as a man, and our Queen is that example!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich hab der Königin die Treue schon vor vielen Jahren geschworen und habe es nicht einen einzigen Tag bereut. Sie ist die beste Königin, die ein Königreich haben kann.");
talkEntry:addResponse("Manche Frauen sind zweimal so mutig wie Männer. Aber nur sehr, sehr wenige und Königinnen sind äußerst ungewöhnlich in diesen Landen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is not just a town or a kingdom. This place is an idea and a way of life, a vision and a feeling. If you don't fit in you'd better leave us, be assured.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist nicht bloß eine Stadt oder ein Königreich. Es ist eine Idee, ein Lebensgefühl mit einer Vision. Wenn du du dieser nicht entsprichst, hau besser ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I know that the Albarian kingdom does not really appreciate the existence of Cadomyr, but the Albarians also accept that we are not their foe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich weiß, dass das albarische Reich nicht gerade erfreut über die Existenz Cadomyrs ist. Aber die Albarier wissen, dass wir nicht der Feind sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Do you know what they do in Gynk to punish foreigners that commit a crime? They release them into the slums of Gynk. A capital punishment...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Wußtest du, was sie in Gynk mit Fremden machen, die unangenehm auffallen? Sie lassen sie frei - in den Slums von Gynk. Kommt der Todesstrafe gleich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Salkamar lacks organization. Other than that, it seems to be quite a nice place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("In Salkamar fehlt es an der nötigen Ordnung. Ansonsten soll es da ganz nett sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I obey queen Rosaline alone and if she orders me to worship a god, I'll worship it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich gehorche nur Königin Rosaline und wenn sie mir befiehlt, einem Gott zu huldigen, dann tu ich das auch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Well, Brágon's impact on Illarion is still a mystery to me. So, he gave us the fire? When I light a candle, it burns, not much of a miracle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Nun, Brágons Bedeutung für Illarion ist mir immernoch unklar. Er hat uns angeblich das Feuer gegeben? Wenn ich eine Kerze anzünde, dann brennt sie, soll das etwa ein Wunder sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Pray to Cherga if you want to meet her, I say!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Betet zu Cherga, wenn ihr sie treffen wollt, ja das sage ich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ah, yes, all proud knights pray to Malachín and eat their vegetables - forget all that! Loyalty is what makes a knight, not begging for divine assistance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ja, ja, edle Ritter beten zu Malachín und essen brav ihr Gemüse - vergiss es! Loyalität ist das, was einen Ritter ausmacht, nicht das betteln nach göttlichem Beistand.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("You may even worship Moshran, I have no problem with that, but any jokes about the Queen and you'd wish that you were never born.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Du kannst von mir aus zu Moshran beten, ich hab da kein Problem mit. Aber erzähl irgendwelche Witze über die Königin und du wirst dir wünschen, nie geboren worden zu sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Girls wanna have fun, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Mädchen wollen auch mal Spaß, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("You may worship whatever god you want as long as you obey the orders of her majesty. Loyalty counts more than faith here in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Es ist mir egal, zu welchem Gott du betest, solange du den Befehlen ihrer Majestät gehorchst. Loyalität zählt hier in Cadomyr mehr als dein Glaube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("The doctrines of Zhambra's followers are also mine. Does that make me a follower of Zhambra? I do not know and I do not care.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Die Doktrin der Anhänger Zhambra's sind auch meine. Bin ich also ein Anhänger Zhambras? Ich weiß es nicht und es ist mir eigentlich auch egal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I issue orders, not in terms of trading but in terms of obeying!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich gebe Befehle aus, keine Waren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I would really enjoy talking to you all day long about soap and flowers, but meanwhile, our enemies would massacre Cadomyr's children.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich würde ja gerne den ganzen Tag mit dir über Seife und Blumen reden, aber derweilen würden die Feinde die Kinder Cadomyrs abschlachten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Beror");
talkEntry:addTrigger("Oakaxe");
talkEntry:addResponse("At your service?");
talkEntry:addResponse("What is it?");
talkEntry:addResponse("Is this supposed to be a report!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Beror");
talkEntry:addTrigger("Oakaxe");
talkEntry:addResponse("Stets zu Diensten?");
talkEntry:addResponse("Was gibt es?");
talkEntry:addResponse("Soll das eine Meldung sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Acknowledged.");
talkEntry:addResponse("Affirmative.");
talkEntry:addResponse("Confirmed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Zur Kenntnis genommen.");
talkEntry:addResponse("Verstanden.");
talkEntry:addResponse("Bestätigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Acknowledged.");
talkEntry:addResponse("Affirmative.");
talkEntry:addResponse("Confirmed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Zur Kenntnis genommen.");
talkEntry:addResponse("Verstanden.");
talkEntry:addResponse("Bestätigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in Cadomyr.", "Welcome to Cadomyr.");
talkingNPC:addCycleText("Zwerge sind ungewöhnlich für Cadomyr? Sehe ich ungewöhnlich aus? Ich zeig dir gleich ungewöhnlich!", "Dwarves are uncommon in Cadomyr? Do I look uncommon? I'll show you something uncommon!");
talkingNPC:addCycleText("Ich bin es gewohnt, Befehle zu schreien. Hier im Inneren eines Hauses, brauche ich nicht zu schreien. Ich werde es aber, solltet ihr meine Befehle missachten.", "I am used to yelling orders, but inside this house I'll keep my voice down. Should you disobey though, I promise you'll be the one yelling.");
talkingNPC:addCycleText("Achtung!", "Attention!");
talkingNPC:addCycleText("Du da! Komm mal her.", "You! Come here.");
talkingNPC:addCycleText("Wo ist Gefreiter Rasselschwinger schon wieder!?", "Where is private Rattleswinger!?");
talkingNPC:addCycleText("#me grummelt vor sich hin.", "#me curses silently.");
talkingNPC:addCycleText("#me geht eine Liste durch und streicht einen Namen durch: 'Armer Kerl...'.", "#me browses a list and marks out a name, 'Poor fellow.'.");
talkingNPC:addCycleText("Es gibt nichts ehrbareres als ein Duell bis zum Tod. Seine Prinzipien bis in den Tod treu zu bleiben, das macht einen Mann aus.", "There is nothing more honourable than a duel to death. To be true to one's principles until death, that is the mark of a true man.");
talkingNPC:addCycleText("Alles in bester Ordnung.", "All clear.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Beror Oakaxe der königliche Quartiermeister.", "This NPC is Beror Oakaxe the royal quartermaster.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confusion etched over his face.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 226);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 325);
mainNPC:setEquipment(9, 2117);
mainNPC:setEquipment(10, 770);
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