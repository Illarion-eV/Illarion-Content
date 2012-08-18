--------------------------------------------------------------------------------
-- NPC Name: Cormac                                                   Galmair --
-- NPC Job:  Smuggler                                                         --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  392, 327, -6           --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Authors:  Cromwell                                                         --
--           Estralis                                                         --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 392, 327, -6, 6, 'Cormac', 'npc.cormac', 0, 1, 1, 28, 28, 28, 208, 159, 117);
---]]

require("npc.base.basic")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.cormac", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.quest.quest(74, ">", 2));
talkEntry:addResponse("Error! Something went wrong, please inform a developer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game help] This NPC is the smuggler Cormac. To learn more about him, your should greet the NPC first."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schmuggler Cormac. Um mehr über ihn zu erfahren, grüße ihn zunächst."));
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
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair's Gossiper"));
talkEntry:addResponse("#me flashes you a sparse-toothed grin. 'Eh! If ye want to sit down with me, ye better bring me a mug of beer. Then I'll answer yer questions.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
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
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
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
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("If that isn't mah good ol' buddy! Come, sit down and drink with meh!");
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
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Galmair"));
talkEntry:addResponse("#me zeigt ein zahnloses Grinsen. 'Eh! Wenn du dich hier hinsetzen willst, bring mir besser ein Bier. Dann beantworte ich deine Fragen.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
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
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
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
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Wenn das nicht mein guter Kumpel ist! Komm, setz dich und trink mit mir!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair's Gossiper"));
talkEntry:addResponse("#me strokes his beard and grins: 'Arr, Greetings! If ye want to talk, then ye better quench my thirst first!'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What! Haven't seen ya since last time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Galmair"));
talkEntry:addResponse("#me streicht seinen Bart zurecht: 'Arr, grüß dich. Wenn du mit mir reden willst, dann lösch erstmal meinen Durst mit einem Bier.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Was! Dich hab ich ja seit dem letzten mal nicht mehr gesehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Until next time, traveller!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Bis zum nächsten mal, Reisender.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("See ye around, traveller! Stay safe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Man sieht sich, Fremder. Gib auf dich acht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair's Gossiper"));
talkEntry:addResponse("Arr! My throat is dry as tha desert! When ye want tha talk, ye need to bring me a beer first.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("A beer in the morning drives away the sorrows. And I have none anymore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Galmair"));
talkEntry:addResponse("Arr! Meine Kehle ist so trocken wie die Wüste. Wenn du reden willst, bring mir erstmal ein Bier.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Ein Bier am Morgen vertreibt Kummer und Sorgen. Und ich hab keine mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Cormac, the... river transportation entrepreneur.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Cormac, der... Flussschiffahrtstransportunternehmer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair's Gossiper"));
talkEntry:addResponse("A task? Bring mah meh beer, ye bum!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What is it ya want to know? I know the latest gossip. The Don, Galmair and its neighbours, everything!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Galmair"));
talkEntry:addResponse("Hol' mir mal 'ne Flasche Bier sonst streik ich hier!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Was willst du wissen? Ich kenne alle Gerüchte. Der Don, Galmair und seine Nachbarn, alles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Galmair's Gossiper"));
talkEntry:addResponse("A task? Bring mah meh beer, ye bum!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("What is it ya want to know? I know the latest gossip. The Don, Galmair and its neighbours, everything!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Der Schwätzer von Galmair"));
talkEntry:addResponse("Hol' mir mal 'ne Flasche Bier sonst streik ich hier!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Was willst du wissen? Ich kenne alle Gerüchte. Der Don, Galmair und seine Nachbarn, alles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", ">", "0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Cormac will now answer your questions. You advance in Don Valerio Guilianni's favour."));
talkEntry:addResponse("#me takes the mug and grins: 'Arr! Ye aint so bad after all! I've been all over tha place, so I can tell ye about tha town, tha Don, Galmair or even the neighbours if ye really want.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1909, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", ">", "0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] Cormac will now answer your questions."));
talkEntry:addResponse("#me takes the mug and grins: 'Arr! Ye aint so bad after all! I've been all over tha place, so I can tell ye about tha town, tha Don, Galmair or even the neighbours if ye really want.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1909, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", ">", "0));
talkEntry:addCondition(npc.base.condition.town.town(3));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Cormac wird nun deine Fragen beantworten. Dein Ansehen bei Don Valerio Guilianni steigt."));
talkEntry:addResponse("#me nimmt den Krug und grinst: 'Arr! Du bist gar nicht so schlecht, wie du aussiehst. Ich bin schon überall gewesen, du kannst mich alles über die Stadt, den Don, Galmair oder sogar unsere dummen Nachbarn fragen.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1909, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Galmair", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", ">", "0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Cormac wird nun deine Fragen beantworten."));
talkEntry:addResponse("#me nimmt den Krug und grinst: 'Arr! Du bist gar nicht so schlecht, wie du aussiehst. Ich bin schon überall gewesen, du kannst mich alles über die Stadt, den Don, Galmair oder sogar unsere dummen Nachbarn fragen.'");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(1909, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(74, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Beer here, now! A real sip.");
talkEntry:addResponse("Is there wax in yer ears or what? If ye want tha talk with me, ye need to bring me a beer! I'm bloody thirsty.");
talkEntry:addResponse("Beer here now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 1));
talkEntry:addCondition(npc.base.condition.item.item(1909, "all", "<", "1));
talkEntry:addResponse("Bier her! So einen richtigen Schluck.");
talkEntry:addResponse("Hast du Wachs in den Ohren oder was? Wenn du mit mir reden willst, musst du mir ein Bier bringen. Ich bin verdammt nochmal durstig.");
talkEntry:addResponse("Bier her, jetzt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("town");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me chuckles: 'This town is a bloody fine place fer a man or woman with coin. Ye can live free and mind yer business, as long as ye let others mind theirs.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Urbano");
talkEntry:addTrigger("Dorian");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me frowns: 'Dorian Urbano, he called himself. A former bigshot in these parts... a no-good thief and scoundrel whom Don Guillianni booted out. Haha!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("money");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Ha! Money is a fine way o' measuring everything. When ye got more money, yer o' course more powerful too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("like[s]");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Tha Don likes expensive and and rare weapons or armours. He's a bit o' a collector, I hear. Hah... n' o' course money.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gift");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Gifts? Arr! I heard tha Don likes expensive weapons n' armour... very prudent, don't ye think? Money is good too...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beer");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me flashes you a sparse-toothed grin: 'Thank ye fer tha beer, traveller! What ye want to know now?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("neighbo");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me scowls: 'May tha plague visit those bastards, Runewick and Cadomyr! This is 'our' bloody land n' they're just enroaching.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("smuggle");
talkEntry:addTrigger("smuggling");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("By Ron... moron... I am a... Arr... 'river transportation entrepreneur', aye.. that's what I do fer living.");
talkEntry:addResponse("#me scowls: 'ARR! I know nothing 'bout such things! I'm a decent n' hardworking... arr... river transportation entrepreneur.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadt");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Diese Stadt ist ein guter Ort für einen Mann oder ein Frau mit dem nötigen Kleingeld. Man kann hier frei schalten und walten und niemand funkt dir dazwischen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Urbano");
talkEntry:addTrigger("Dorian");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me grummelt: 'Dorian Urbano, so schimpft er sich. Früher mal ein mächtiges Tier hier, jetzt eher ein gemeiner Schurk, den Don Guillianni aus dem Geschäft gedrängt hat. Haha!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geld");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Ha! Geld ist gut, um Dingen einen Wert zu geben. Aber Geld bedeutet auch Macht, lass dir das gesagt sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vorliebe");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Der Don liebt Teures und Seltenes, wie Waffen und Rüstungen. Er ist ein Sammler, so sagt man. Ein Geldeinsammler, ha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschenk");
talkEntry:addTrigger("präsent");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Geschenke? Arr! Ich hab gehört, der Don mag seltene Waffen und Rüstungen. Ziemlich prahlerisch, nicht? Geld ist aber auch eine gute Wahl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bier");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me grinst: 'Danke für das Bier, Fremder. Was willst du jetzt wirklich wissen?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nachbar");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me bellt: 'Möge die Pest über diese Bastarde kommen, Runewick und Cadomyr! Dies ist unser Land, die lungern hier nur rum.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("schmugg");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Bei Ron... moron... Ich bin ein... Arr... 'Flussschiffahrtstransportunternehmer', ja, das ist, was ich mache.");
talkEntry:addResponse("#me faucht: 'ARR! Ich weiß nichts über solche Machenschaften. Ich bin ein ehrlicher, hart arbeitender... Flussschiffahrtstransportunternehmer!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("My profession? Well, I am in tha... transportation business, sorta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Mein Beruf? Ich bin im... Fuhrgewerbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("My profession? Well, I am in tha... transportation business, sorta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Mein Beruf? Ich bin im... Fuhrgewerbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Leave me alone with that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Lasst mich doch damit in Frieden!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("That information is to vital to me I'll write it down immediatly... after my next beer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Diese Information ist so weltbewegend für mich, dass ich sie sofort niederschreiben werde... nach meinem nächsten Bier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tavern");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Did you ever wonder where all this booze comes from? No? Good!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tavern");
talkEntry:addResponse("Hast du dich nie gefragt, wo all der Schnaps hier herkommt? Nein? Gut so!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Some say the archmage Morgan of Runewick was once a woman but some mysterious, failed spell turned her in a man... partially, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Manche behaupten, der Erzmagier Morgan von Runwick war einst eine Frau, aber ein geheimnisvoller, fehlgeschlagener Zauber hat sie in einen Mann verwandelt... zumindestens teilweise, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some say the archmage Morgan of Runewick was once a woman but some mysterious, failed spell turned him in a man... partially, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Manche behaupten, der Erzmagier Morgan von Runwick war einst eine Frau, aber ein geheimnisvoller, fehlgeschlagener Zauber hat sie in einen Mann verwandelt... zumindestens teilweise, har, har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick! Hah! They're a nation o' folks who sat on a bloody broomstick in tha morning, ruled by a bloody lass who waves a magic wand around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Runewick! Hah! Ein Land von Knilchen, die morgens erstmal auf einem Besen reiten, regiert von einem Kerl, der mit seinem Zauberstab rumfuchtelt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Lord");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Arr! Don Valerio Guilianni is in charge around here! He's tha richest n' most powerful man in tha land, or so they say! A fine leader!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ye've been keeping yer ears open, good! Aye, he's the man in charge. He keeps us free from tha oppressing neighbours and that bastard Urbano.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Lord");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Arr! Don Valerio Guilianni ist hier der Boss! Er ist der mächtigste und reichste Mann weit und breit, so sagt man. Ein guter Anführer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Ich sehe, du hast dich schlau gemacht. Ja, das ist hier der Boss. Er hält uns den Rücken von unseren kontrollwütigen Nachbarn und diesem Bastard Urbano frei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me grins: 'Welcome to tha land o' tha free, traveller! When ye got enough coins and show loyalty tha Don, yer free to mind yer own business as ye please.'");
talkEntry:addResponse("Galmair, home o' tha free, land o' those who can take care o' themselves. Ha!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Willkommen im Land der Freien, Reisender. Wenn du genug Gold hast und dem Don nicht in die Quere kommst, kannst du machen, was du willst.'");
talkEntry:addResponse("Galmair, Heimat der Freien, Land derer, die für sich selbst sorgen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("The princess, erm, queen of Cadomyr is quite a fittie. She would fit as the Don's wife. And rumour says he got quite a crash on her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Die Prinzessin, äh, Königin von Cadomyr ist ein ziemlich heißer Feger. Sie sollte mal die Küche vom Don fegen. Und es spricht sich herum, dass er ganz schön wild nach ihr ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The princess, erm, queen of Cadomyr is quite a fittie. She would fit as the Don's wife. And rumour says he got quite a crash on her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Die Prinzessin, äh, Königin von Cadomyr ist ein ziemlich heißer Feger. Sie sollte mal die Küche vom Don fegen. Und es spricht sich herum, dass er ganz schön wild nach ihr ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They make a big fuss 'bout honour, bending over backwards to kiss arse and look down on people who like coins. Hehe... Ye know what they say, a man fights fer what he lacks tha most.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Die machen einen riesen Aufstand über ihre Ehre, kriechen einander in den Allerwertesten und spucken auf geschäftstüchtige Leute. Aber wie sagt man, man kämpft am stärksten für etwas, was man gar nicht hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Talking about anything abroad, eh? No way. I know so much about these lands, everything!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Du willst über irgendwas in Weitwegland reden? Nichts da! Ich weiß so viel über diese Region, alles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So, you think I'm from Gynk? Pah! Then I should think you come from a badger's burrow or what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("So, du denkst also, ich komme aus Gynk? Pah! Dann müßte ich ja glauben, du kommst aus einem Dachsbau oder wie?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Talking about anything abroad, eh? No way. I know so much about these lands, everything!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Du willst über irgendwas in Weitwegland reden? Nichts da! Ich weiß so viel über diese Region, alles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Blah.");
talkEntry:addResponse("Bleh.");
talkEntry:addResponse("Blubb.");
talkEntry:addResponse("Moep.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("Eh?");
talkEntry:addResponse("Hmm?");
talkEntry:addResponse("Shh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me nods and strokes his beard: 'We're all pious folks down here, though we mind our own business with this like with other stuff.'");
talkEntry:addResponse("Gods are overrated.");
talkEntry:addResponse("Do I look like I want to talk about faith and devotion?");
talkEntry:addResponse("Go... to a temple if you want to talk about gods. Or just go... elsewhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addCondition(npc.base.condition.quest.quest(74, "=", 2));
talkEntry:addResponse("#me nickt und streicht durch seinen Bart: 'Wir sind alle fromme Leute hier, auch wenn wir das niemanden auf die Nase binden, wie wir uns auch sonst aus anderer Leute Angelegenheiten raushalten.");
talkEntry:addResponse("Die Götter werden überschätzt.");
talkEntry:addResponse("Sehe ich wie jemand aus, der über Glaube und Hingabe reden will?");
talkEntry:addResponse("Geh doch in einen Tempel, wenn du über die Götter reden wollt. Oder geh... einfach weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Business, eh? Not here! Meet me... wait... Nevermind!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Geschäfte, häh? Nicht hier! Triff mich... Moment mal... Vergiss es!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Moep.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Moep.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cormac");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So, you think you know my name? Did I tell it to you? Did I!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cormac");
talkEntry:addResponse("So, du denkst also, du kennst meinen Namen? Hab ich ihn dir gesagt? Hab ich etwas!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fine.");
talkEntry:addResponse("Moep.");
talkEntry:addResponse("Got beer?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fein.");
talkEntry:addResponse("Moep.");
talkEntry:addResponse("Haste Bier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fine.");
talkEntry:addResponse("Moep.");
talkEntry:addResponse("Got beer?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Fein.");
talkEntry:addResponse("Moep.");
talkEntry:addResponse("Haste Bier?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Ich war schon überall und woanders, aber verdammt nochmal, nichts ist schöner als das gute, alte Galmair.", "I've been all over the place and more, but damn... there's no place like good ol' Galmair!");
talkingNPC:addCycleText("#me schnattert: 'Wie viele Cadomyrer braucht man, um eine Kerze anzuzünden? Einen, um die Kerze anzuzünden und eine Brigade, um das brennende Haus zu löschen!'", "#me cackles: 'How many Cadomyrians do you need to light a candle? One to light tha candle and a brigade to extinguish tha burning house!'");
talkingNPC:addCycleText("Verdammt! Wirt, meine Kehle ist so leer und trocken wie der Schädel eines Runewickers!", "Damn! Oy, bartender! My throat is as empty and dry as a Runewickian skull!");
talkingNPC:addCycleText("#me ist ein Zwerg mit einem schwarzen, buschigem Bart, gekleidet in grober, zerschlissener Kleidung.", "#me is a dwarf with a black bushy beard, dressed in ragged and coarse clothes.");
talkingNPC:addCycleText("#me scheint bester Laune zu sein, auch wenn sein Bierkrug leer erscheint.", "#me seems to be in jubilant mood, though his beer-mug is empty.");
talkingNPC:addCycleText("Hey! Füll meinen Krug und wir können reden.", "Oy, fill my mug with beer n' we can talk.");
talkingNPC:addCycleText("#me summt: Fässer voll Schnaps, fließen den Fluss entlang. Der Zollmann weiß von nichts, die Nacht beschützt meine Fracht. Mein Profit ist recht und Steuern gibts von mir nicht.'", "#me hums: 'Barrels o' booze, downstream they go! That tha bailiff don't know! The night protects my cargo n' coins, n' tha taxman can kiss my loins! Haha!'");
talkingNPC:addCycleText("Borps!", "Burp!");
talkingNPC:addCycleText("Ist der Krug leer, dann muss ein neuer her!", "An empty mug is not good!");
talkingNPC:addCycleText("Sagt ein Mütterchen zum Wachtmeister: Können sie mir über den Fluss helfen? Der Wachtmeister: Ja, ich bringe euch zur Brücke dort. Das Mütterchen: Pah, da komm ich alleine rüber!", "An hag to the constable: Could you help me cross the river? The constable replies: Sure, I'll guide you to the bridge. The hag: Pah! There, I can do it on my own!");
talkingNPC:addCycleText("Ein Bauer zum Wachtmeister: Man hat mir meinen Karren gestohlen! Der Wachtmeister: Hatte der Wagen eine Laterne und eine Tröte? Der Bauer: Nein, warum? Der Wachtmeister: Das macht dann dreißig Kupferstücke Strafe!", "A peasant to the constable: Someone stole my cart! The constable: Did the cart have a lantern and a horn? The peasant. No, why? The constable: That's thirty copper fine then!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schmuggler Cormac.", "This NPC is the smuggler Cormac.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 809);
mainNPC:setEquipment(11, 193);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 2113);
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