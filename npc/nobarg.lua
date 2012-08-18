--------------------------------------------------------------------------------
-- NPC Name: Nobarg                                                      None --
-- NPC Job:  Priest                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  475, 795, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   envi                                                             --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 475, 795, 0, 6, 'Nobarg', 'npc.nobarg', 0, 1, 3, 139, 87, 74, 211, 137, 126);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.item")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.deleteitem")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.nobarg", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addResponse("Quest status set to 0");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 5");
talkEntry:addResponse("Quest status set to 5");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 6");
talkEntry:addResponse("Quest status set to 6");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 7");
talkEntry:addResponse("Quest status set to 7");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 8");
talkEntry:addResponse("Quest status set to 8");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 11");
talkEntry:addResponse("Quest status set to 11");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 12");
talkEntry:addResponse("Quest status set to 12");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 13");
talkEntry:addResponse("Quest status set to 13");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 14");
talkEntry:addResponse("Quest status set to 14");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 14));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 15");
talkEntry:addResponse("Quest status set to 15");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 16");
talkEntry:addResponse("Quest status set to 16");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 16));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 17");
talkEntry:addResponse("Quest status set to 17");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 18");
talkEntry:addResponse("Quest status set to 18");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 19");
talkEntry:addResponse("Quest status set to 19");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 20");
talkEntry:addResponse("Quest status set to 20");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 21");
talkEntry:addResponse("Quest status set to 21");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 22");
talkEntry:addResponse("Quest status set to 22");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 23");
talkEntry:addResponse("Quest status set to 23");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 23));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 24");
talkEntry:addResponse("Quest status set to 24");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 24));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 25");
talkEntry:addResponse("Quest status set to 25");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 25));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 26");
talkEntry:addResponse("Quest status set to 26");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 27");
talkEntry:addResponse("Quest status set to 27");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 27));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 28");
talkEntry:addResponse("Quest status set to 28");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 28));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 29");
talkEntry:addResponse("Quest status set to 29");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 29));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 30");
talkEntry:addResponse("Quest status set to 30");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 40");
talkEntry:addResponse("Quest status set to 40");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 40));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the priest Nobarg. Keyphrases: Hello, quest, Bragon, god, information."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Priester Nobarg. Schlüsselwörter: Hallo, Quest, Bragon, Götter, information."));
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
talkEntry:addResponse("#me nods slightly and continues his prayer.");
talkEntry:addResponse("Hmm? Yes, yes.");
talkEntry:addResponse("Brágon with you.");
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
talkEntry:addResponse("#me nickt leicht und betet weiter.");
talkEntry:addResponse("Hmm? Ja, ja.");
talkEntry:addResponse("Bragon mit euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me nods slightly and continues his prayer.");
talkEntry:addResponse("Hmm? Yes, yes.");
talkEntry:addResponse("Brágon with you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("#me nickt leicht und betet weiter.");
talkEntry:addResponse("Hmm? Ja, ja.");
talkEntry:addResponse("Bragon mit euch.");
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
talkEntry:addResponse("Brágon with you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lebt wohl.");
talkEntry:addResponse("Aufwiedersehen.");
talkEntry:addResponse("Bragon sei mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Brágon with you!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Lebt wohl.");
talkEntry:addResponse("Aufwiedersehen.");
talkEntry:addResponse("Bragon sei mit euch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("If Brágon listens to me today, better.");
talkEntry:addResponse("Would you pray with me?");
talkEntry:addResponse("Fine, Brágon to honor of course!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Wenn Bragon mich heute erhört, besser.");
talkEntry:addResponse("Möchtet ihr mit mir beten?");
talkEntry:addResponse("Gut, Bragon zu Ehren!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Nobarg.");
talkEntry:addResponse("Nobarg, priest of Brágon");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Nobarg");
talkEntry:addResponse("Nobarg, Priester von Bragon");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 5));
talkEntry:addResponse("I don't have to do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 5));
talkEntry:addResponse("Ich habe für euch nichts zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 5));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't have to do anything for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 5));
talkEntry:addResponse("Ich habe für euch nichts zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 21));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Ask your question from Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm, you are seeking knowledge traveler? Well, what is your question?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 21));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Stelle deine Frage von Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm, ihr möchtet etwas von mir wissen? Nun, was ist eure Frage?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Ask your question from Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm, you are seeking knowledge traveler? Well, what is your question?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 10));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 21));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Stelle deine Frage von Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm, ihr möchtet etwas von mir wissen? Nun, was ist eure Frage?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("age");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Well, I know the answer but you have to bring me three things first. Start by bringing me a pure element of fire. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zeitalter");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 11));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("support");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("The answer is within reach traveler but Brágon demands charity. Start by bringing me a pure element of fire. Brágon guide you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Unterstützung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Purge");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 13));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Well, I know the answer but only one worthy may acquire such knowledge. Start by bringing me a pure element of fire. Brágon will guide you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vernichter");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 13));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("realized");
talkEntry:addTrigger("realised");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 14));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Answers will come once charity is given traveler. Start by bringing me a pure element of fire. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bemerkt hat");
talkEntry:addTrigger("erkannt hat");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 14));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sun");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Well, I know the answer you seek, but are you worthy? Bring me a pure element of fire to prove that worth. Brágon keep you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sonne");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 15));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("remedy");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("If you seek answers start by bringing me a pure element of fire. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wiedergutmachung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 16));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("relationship");
talkEntry:addTrigger("relate");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Bring me a pure element of fire and you shall have your answers traveler. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verbindet");
talkEntry:addTrigger("verbindung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Summer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 18));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Well, I know the answer you seek, but I will need test your worth. Start by bringing me a pure element of fire. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sommer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 18));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pray");
talkEntry:addTrigger("praying");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("So many questions, but only a few have the answers. Bring me a  pure element of fire and I will give you the answers you seek. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beten");
talkEntry:addTrigger("gebet");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eternity");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Alright traveler but first  bring me a pure element of fire. Brágon with you!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ewigkeit");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tribunal");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' started] Bring him a pure fire"));
talkEntry:addResponse("Ah, in search of answers traveler? To get them you will need to bring me a pure element of fire though. Brágon show you the path to righteousness!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tribunal");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gestartet] Bringe ihm ein reines Feuer"));
talkEntry:addResponse("Nun, ich weiß die Antwort, aber ihr müsst mir erst drei Dinge bringen. Aber bringt mir erst mal ein reines Feuer. So, geht und findet es!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addTrigger("fire");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' solved, Quest 'red priest robe' started] Bring him a red priest robe"));
talkEntry:addResponse("Well done, you are ready for the next task. My red priest robes are in poor condition. Please bring me a new one.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Feuer");
talkEntry:addTrigger("Ding");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gelöst, Quest 'rote Priesterrobe' gestartet] Bringe ihm eine rote Priesterrobe"));
talkEntry:addResponse("Gut gemacht, du bist bereit für die nächste Aufgabe. Nun, schaut auf meine rote Priester Robe... Sie ist schon alt. Bitte bringt mir eine neue.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'pure fire' solved, Quest 'red priest robe' solved] Bring him a red priest robe"));
talkEntry:addResponse("Well done, you are ready for the next task. My red priest robes are in poor condition. Please bring me a new one.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'reines Feuer' gelöst, Quest 'rote Priesterrobe' gestartet] Bringe ihm eine rote Priesterrobe"));
talkEntry:addResponse("Gut gemacht, du bist bereit für die nächste Aufgabe. Nun, schaut auf meine rote Priester Robe... Sie ist schon alt. Bitte bringt mir eine neue.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2553, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 6));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addTrigger("fire");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addResponse("Please, do not interrupt me until you've gotten the pure fire!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Feuer");
talkEntry:addTrigger("Ding");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr das reine Feuer habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, do not interrupt me until you've gotten the pure fire!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 5));
talkEntry:addCondition(npc.base.condition.item.item(2553, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr das reine Feuer habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'red priest robe' solved, Quest 'golden goblet' started] Bring him a golden goblet"));
talkEntry:addResponse("Very good! Well, I am also preparing a ritual for Brágon and I need a golden goblet. Please bring me one.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Ding");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'rote Priesterrobe' gelöst, Quest 'goldener Kelch' gestartet] Bringe ihm einen goldenen Kelch"));
talkEntry:addResponse("Sehr gut! Ich bin am vorbereiten eines Rituals für Bragon and brauche einen Goldkelch hierfür. Bitte bringt mir einen.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addTrigger("robe");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'red priest robe' solved, Quest 'golden goblet' started] Bring him a golden goblet"));
talkEntry:addResponse("Very good! Well, I am also preparing a ritual for Brágon and I need a golden goblet. Please bring me one.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addTrigger("Robe");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'rote Priesterrobe' gelöst, Quest 'goldener Kelch' gestartet] Bringe ihm einen goldenen Kelch"));
talkEntry:addResponse("Sehr gut! Ich bin am vorbereiten eines Rituals für Bragon and brauche einen Goldkelch hierfür. Bitte bringt mir einen.");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(2419, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Please, do not interrupt me again unless you have that red priest robe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Ding");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr die rote Priesterrobe habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addTrigger("robe");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, do not interrupt me again unless you have that red priest robe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addTrigger("Robe");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 6));
talkEntry:addCondition(npc.base.condition.item.item(2419, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr die rote Priesterrobe habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addTrigger("goblet");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'golden goblet' solved] Ask him your question from Sir Fludnar Yednos"));
talkEntry:addResponse("You have done everything I've asked of you. Tell me what you seek?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(224, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Kelch");
talkEntry:addTrigger("Ding");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'goldener Kelch' gelöst] Frage ihn nun deine Frage von Sir Fludnar Yednos"));
talkEntry:addResponse("Ihr habt alles getan, was ich haben wollte. Was ist eure Frage nun?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(224, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", ">", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'golden goblet' solved] Ask him your question from Sir Fludnar Yednos"));
talkEntry:addResponse("You have done everything I've asked of you. Tell me what you seek?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(224, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", ">", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest 'goldener Kelch' gelöst] Frage ihn nun deine Frage von Sir Fludnar Yednos"));
talkEntry:addResponse("Ihr habt alles getan, was ich haben wollte. Was ist eure Frage nun?");
talkEntry:addConsequence(npc.base.consequence.deleteitem.deleteitem(224, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addTrigger("goblet");
talkEntry:addTrigger("thing");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", "=", 0));
talkEntry:addResponse("Please, do not interrupt me until there is a golden goblet in your possession!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Kelch");
talkEntry:addTrigger("Ding");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr den Goldkelch habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Please, do not interrupt me until there is a golden goblet in your possession!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 7));
talkEntry:addCondition(npc.base.condition.item.item(224, "all", "=", 0));
talkEntry:addResponse("Bitte stört mich nicht bis ihr den Goldkelch habt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("age");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("That is not difficult, of course. It was in the Age of Concord! *sings a few lines to himself* The world is perfect. You cannot improve her. La, la,....well, I hope you are satisfied! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zeitalter");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Es war im Zeitalter der Eintracht! *singt einige Zeilen vor sich her* Die Welt ist perfekt. Man kann sie nicht verbessern. La, la,...nun gut, ich hoffe ihr seid zufrieden! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("support");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("That is not difficult, of course. Brágon had hoped to comfort the Bloodgod in his loneliness through the creation of the orcs! ?Well, there is your answer! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Unterstützung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Bragon hatte die Hoffnung den Blutgott in seiner Einsamkeit zu trösten durch die Erschaffung der Orks! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Purge");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("Of course, no problem. Brágon is the lifegiver, and purged of all impurity and weakness! ?Well, that is all I have to say about that. *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 23));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vernichter");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Bragon ist der Lebensspender und Vernichter alles Unreinen und Schwachen! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 23));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("realized");
talkEntry:addTrigger("realised");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("Not a difficult inquiry. It was in the Age of Discord! *sings a few lines to himself* Deep down, where loneliness and darkness reign...well,  I hope my singing satisfied you! Farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 24));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bemerkt hat");
talkEntry:addTrigger("erkannt hat");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Es war im Zeitalter der Zwietracht! *singt einige Zeilen vor sich her* Tief unten, wo Einsamkeit und Dunkelheit herrschen...nun gut, ich hoffe ihr seid zufrieden! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 24));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sun");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("Of course of course, the 'Daily sunmaker'! ?All you needed to know farewell! *lowers his head and starts praying*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 25));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sonne");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. 'Täglich Sonnenmacher'! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 25));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("remedy");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("Easy enough, he sent Dragons into the battle?well, I hope you are satisfied with my answer! Be well! *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wiedergutmachung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Drachen! Er sendete Drachen in die Schlacht...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 26));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("relationship");
talkEntry:addTrigger("relate");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("The answer is simple, Fire! There is a fire in both you must feel to understand. I hope that will suffice, be well. *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 27));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("verbindet");
talkEntry:addTrigger("verbindung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Feuer! Da brennt ein Feuer in beiden, dass du bestimmt noch nicht gesehen hast wie ich annehme...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 27));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Summer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("Not difficult, `'Strong in summer'! If that is all I will return to my prayers, be well! *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 28));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sommer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. 'Stark im Sommer'! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 28));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pray");
talkEntry:addTrigger("praying");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("The answer is rather simple,  orcs see Brágon as the one who gives life! ?Well, I hope you are satisfied with this answer! Farewell! *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 29));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beten");
talkEntry:addTrigger("gebet");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Die Orks sehen Bragon als denjenigen der das Leben schenkt! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 29));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eternity");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("A noble inquiry, among other things Brágon will discern whether they lived for the purpose of the Holy Flame or not! Take my words as you will, good day. *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ewigkeit");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Unteranderem Brágon wird feststellen, ob sie gerecht und im Sinne der heiligen Flamme gelebt haben! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tribunal");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest answer is imparted] Deliver the answer to Sir Fludnar Yednos"));
talkEntry:addResponse("This is not difficult to understand really. Among other things Brágon will discern whether they lived for the purpose of the Holy Flame or not! ?Well, I hope you are satisfied with this answer! Farewell! *Lowers his head and starts praying.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tribunal");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 8));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Antwort erhalten] Überbringe nun die Antwort zu Sir Fludnar Yednos"));
talkEntry:addResponse("Das ist nicht schwierig, gewiss. Unteranderem Brágon wird feststellen, ob sie gerecht und im Sinne der heiligen Flamme gelebt haben! ...nun gut, ich hoffe ihr seid zufrieden mit der Antwort! Lebt wohl! *senkt seinen Kopf und beginnt zu beten*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 30));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("know");
talkEntry:addTrigger("question");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 20));
talkEntry:addResponse("There is nothing more to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("wissen");
talkEntry:addTrigger("Frage");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 20));
talkEntry:addResponse("Ich habe für euch nichts mehr zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There is nothing more to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("info");
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 20));
talkEntry:addResponse("Ich habe für euch nichts mehr zu tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("pure fire");
talkEntry:addResponse("I really don't know where you can find pure fire. Ask in Runewick, there are people there that know many things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("reines feuer");
talkEntry:addResponse("Ich habe wirklich keine Ahnung wo man reines Feuer findet. Fragt in Runewick. Die Leute dort wissen viele Dinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("robe");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("You should ask a tailor. Best be off to Runewick or Cadomyr to find a worthy one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("robe");
talkEntry:addResponse("Ihr solltet einen Schneider finden. Ihr solltet in der Lage sein einen in Runewick oder in Cadomyr zu finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("goblet");
talkEntry:addResponse("I'm sure a finesmith in Cadomyr or in Galmair can help forge you a goblet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kelch");
talkEntry:addResponse("Ich bin mir sicher ein Goldschmied in Cadomyr oder in Galmair kann euch bezüglich des Kelches helfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addTrigger("work");
talkEntry:addResponse("Priest of Brágon of course.");
talkEntry:addResponse("Priest, perhaps you are inflicted traveler?");
talkEntry:addResponse("Brágon's devotee is my profession.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addTrigger("arbeit");
talkEntry:addTrigger("was mach");
talkEntry:addResponse("Priest von Bragon natürlich.");
talkEntry:addResponse("Priester, seht ihr das nicht?");
talkEntry:addResponse("Bragon ist meine Leidenschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Priest of Brágon of course.");
talkEntry:addResponse("Priest, perhaps you are inflicted traveler?");
talkEntry:addResponse("Brágon's devotee is my duty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Priest von Bragon natürlich.");
talkEntry:addResponse("Priester, seht ihr das nicht?");
talkEntry:addResponse("Bragon ist meine Leidenschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Do you pray to Brágon too?");
talkEntry:addResponse("Nice name, I like it.");
talkEntry:addResponse("Well I hope you have offered you prayers to lord Brágon this day traveler.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Betet ihr auch zu Bragon?");
talkEntry:addResponse("Schöner Name, gefällt mir.");
talkEntry:addResponse("Gut, aber nun kommt und lasst uns zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bearer");
talkEntry:addResponse("They fight for the light and protect the weak ones.");
talkEntry:addResponse("A very honorable community.");
talkEntry:addResponse("Fire is in them, that they carry the light as far as possible.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("doom");
talkEntry:addTrigger("extinction");
talkEntry:addTrigger("collapse");
talkEntry:addTrigger("fall");
talkEntry:addResponse("It was horrible!");
talkEntry:addResponse("Brágon be praised that he saved me!");
talkEntry:addResponse("Pray that it never happens again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("horrible");
talkEntry:addResponse("The fall of Gobaith");
talkEntry:addResponse("The last days of Gobaith.");
talkEntry:addResponse("Yes, it was so...I don't have words to describe it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("died");
talkEntry:addTrigger("death");
talkEntry:addTrigger("what did happen");
talkEntry:addTrigger("what happened");
talkEntry:addResponse("Yes, many died in those days.");
talkEntry:addResponse("Yes, but some did flee, I think you can find them here somewhere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dragon");
talkEntry:addResponse("These creatures are children of Brágon and are protected by him!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Träger");
talkEntry:addResponse("Die kämpfen für das Licht und schützen die Schwachen.");
talkEntry:addResponse("Eine sehr ehrenhafte Gemeinschaft.");
talkEntry:addResponse("Das Feuer brenne in ihnen, dass sie das Licht weit tragen werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Untergang");
talkEntry:addTrigger("Zerstörung");
talkEntry:addResponse("Es war furchtbar!");
talkEntry:addResponse("Bragon sei gepriesen, dass er mich rettete!");
talkEntry:addResponse("Bettet, dass es nie wieder passiert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("furchtbar");
talkEntry:addResponse("Der Untergang von Gobaith.");
talkEntry:addResponse("Die letzten Tage von Gobaith.");
talkEntry:addResponse("Ja, es war so...Ich habe keine Wörter um es besser zu beschreiben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tot");
talkEntry:addTrigger("gestorben");
talkEntry:addTrigger("starben");
talkEntry:addTrigger("was ist passiert");
talkEntry:addTrigger("was ist geschehen");
talkEntry:addResponse("Ja, viele sind gestorben.");
talkEntry:addResponse("Ja, aber manche konnten fliehen. Ich denke ihr könnt sie hier irgendwo finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drachen");
talkEntry:addResponse("Diese Kreaturen sind Kinder von Bragon und werden geschützt von ihm!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gold");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Brágon loves gold and I give him every gold that I have ever gotten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gold");
talkEntry:addResponse("Bragon liebt Gold und ich gebe ihm alles Gold, dass ich habe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("five");
talkEntry:addResponse("There are five elder gods and several younger gods. The elder gods are Bragon, Ushara, Eldan, Tanora and Findari. They, past one, have left us to another realm for our protection.");
talkEntry:addResponse("Bragon, Ushara, Eldan, Tanora and Findari are their names. We have of each of them a statue here. Only exception is Eldan... So, take a look!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fünf");
talkEntry:addResponse("Es gibt fünf alte Götter und mehrere junge Götter. Die alten sind Bragon, Ushara, Eldan, Tanora und Findari. Sie haben uns in eine andere Ebene verlassen.");
talkEntry:addResponse("Bragon, Ushara, Eldan, Tanora und Findari sind ihre Namen. Wir haben von jeden von ihnen eine Statue hier. Eldan ist die Ausnahme... Aber werft doch einen Blick auf sie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("level");
talkEntry:addResponse("Yes level. Other people call it world. However, Illarion is our level. For more information ask someone else.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ebene");
talkEntry:addResponse("Ja Ebene. Andere nennen sie auch Welt. Wie dem auch sei, Illarion ist unsere Ebene. Für mehr Information fragt jemand anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Chapel");
talkEntry:addResponse("Chapel of the Five? The name of this place. It has been built after one of the many wars between the factions to praise the Five for the pease. But don't ask after which war. I don't know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kapelle");
talkEntry:addResponse("Kapelle der Fünf? Der Name dieses Orts. Sie wurde nach einem der vielen Kriege zwischen den Fraktionen erbaut um die Fünf für den Frieden zu huldigen. Aber ich habe keine Ahung nach welchem Krieg.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("statue");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you take a look our statues here you will find representations of the Five.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("statue");
talkEntry:addResponse("Wenn ihr einen Blick auf die Statuen hier werft, werdet ihr die Fünf sehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("four");
talkEntry:addResponse("Four? Statues? Of course! There is no need for Eldan. We are surrounded by Eldan anyway.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vier");
talkEntry:addResponse("Vier? Statuen? Natürlich! Es besteht kein Grund für Eldan. Wir sind ohnehin umgeben von Eldan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Does he believe in Brágon? Then I do not care about him.");
talkEntry:addResponse("He rules Runewick as far as I know.");
talkEntry:addResponse("I think he knows many things about arcane magic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Glaubt er an Bragon? Ansonsten interessiert er mich nicht.");
talkEntry:addResponse("Er regiert Runewick soweit ich weiß.");
talkEntry:addResponse("Ich denke er weiß viele Dinge über arkane Magie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Does he believe in Brágon? Then I do not care about him.");
talkEntry:addResponse("He rules Runewick as far as I know.");
talkEntry:addResponse("I think he knows many things about arcane magic.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Glaubt er an Bragon? Ansonsten interessiert er mich nicht.");
talkEntry:addResponse("Er regiert Runewick soweit ich weiß.");
talkEntry:addResponse("Ich denke er weiß viele Dinge über arkane Magie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are looking for wisdom. But I don't know why they are always looking for it in the west.");
talkEntry:addResponse("They think they are wise, but I don't know if I shall agree.");
talkEntry:addResponse("I can remember a blue and a red gate when you enter the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die suchen nach Weisheit. Aber warum sie sie ständig im Westen suchen, weiß ich nicht.");
talkEntry:addResponse("Die denken, dass sie weise sind, aber ich weiß nicht ob ich darin zustimmen soll.");
talkEntry:addResponse("Ich kann mich an ein blaues und ein rotes Tor erinnern wenn man die Stadt betritt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Does he believe in Brágon? Then I do not care about him.");
talkEntry:addResponse("He is the richest man in Galmair.");
talkEntry:addResponse("He is quite good with his daggers, particularly if he has your flank.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Glaubt er an Bragon? Ansonsten interessiert er mich nicht.");
talkEntry:addResponse("Er ist der reichste Mann in Galmair.");
talkEntry:addResponse("Er kann ganz gut mit Dolchen umgehen. Vor allem wenn er von hinten kommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They are looking for coins and are not interested to sacrifice them to Brágon.");
talkEntry:addResponse("Take care of your belongings if you are there.");
talkEntry:addResponse("Do not trust anyone there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Die sind auf Geld aus und werden es bestimmt nicht Bragon spenden.");
talkEntry:addResponse("Achtet auf euer Hab und Gut wenn ihr dort seid.");
talkEntry:addResponse("Vertraut niemanden dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Does she believe in Brágon? Then I do not care about her.");
talkEntry:addResponse("She is on a quick road to ruin Cadomyr.");
talkEntry:addResponse("Lovely face, but nothing more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Glaubt sie an Bragon? Ansonsten interessiert sie mich nicht.");
talkEntry:addResponse("Sie stürzt Cadomyr in den Ruin.");
talkEntry:addResponse("Nettes Gesicht, aber nicht mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Does she believe in Brágon? Then I do not care about her.");
talkEntry:addResponse("She is on a quick road to ruin Cadomyr.");
talkEntry:addResponse("Lovely face, but nothing more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Glaubt sie an Bragon? Ansonsten interessiert sie mich nicht.");
talkEntry:addResponse("Sie stürzt Cadomyr in den Ruin.");
talkEntry:addResponse("Nettes Gesicht, aber nicht mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They live for their so called honor, and it is found to the east. Their troops often march by my temple.");
talkEntry:addResponse("A very sandy town.");
talkEntry:addResponse("I have no idea the exact route there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Die suchen nach Ehre, und anscheinend dürfte sie im Osten liegen, da ich schon öfters Truppen dieser Stadt diesen Tempel passieren gesehen habe.");
talkEntry:addResponse("Eine sehr sandige Stadt.");
talkEntry:addResponse("Ich habe keine Ahnung wie ihr dort hinkommt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the big empires, but I have never been there.");
talkEntry:addResponse("Who cares about this town?");
talkEntry:addResponse("Hmm...I don't know if they pray to Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Eines der großen Reiche, aber ich war nie dort.");
talkEntry:addResponse("Wer interessiert sich schon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the big empires, but I have never been there.");
talkEntry:addResponse("Who cares about this town?");
talkEntry:addResponse("Hmm...I don't know if they pray to Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Eines der großen Reiche, aber ich war nie dort.");
talkEntry:addResponse("Wer interessiert sich schon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One of the big empires, but I have never been there.");
talkEntry:addResponse("Who cares about this town?");
talkEntry:addResponse("Hmm...I don't know if they pray to Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Eines der großen Reiche, aber ich war nie dort.");
talkEntry:addResponse("Wer interessiert sich schon für diese Stadt?");
talkEntry:addResponse("Ich weiß nicht, ob die zu Bragon beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Bragon, Bragon and again Bragon.");
talkEntry:addResponse("I pray to Bragon, join me.");
talkEntry:addResponse("I believe in Bragon and his fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bragaon, Bragon und nochmals Bragon.");
talkEntry:addResponse("Ich bete zu Bragon, bete mit mir.");
talkEntry:addResponse("Ich glaube an Bragon und sein Feuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists but is not interesting to me.");
talkEntry:addResponse("I believe in Brágon and his fire, that it leads me not this one you speak.");
talkEntry:addResponse("That's one of the younger gods, therefore, nothing compared to Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich glaube an Bragon und sein Feuer, dass es mir den rechten Weg zeige.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists, but he has left this level. I hope he is coming back one day.");
talkEntry:addResponse("He is the elder god of fire and stands for a wisdom, strength, and nobility.");
talkEntry:addResponse("One of the statues in the front of me represents him. Just take a look if you want to know how he could look like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ja, dieser Gott existiert. Aber er hat diese Ebene verlassen. Ich hoffe er kommt zurück eines Tages. Das ist auch der Grund warum ich bete.");
talkEntry:addResponse("Er ist einer der alten Götter und steht für eine weise, starke, noble und ansehnliche  Persönlichkeit.");
talkEntry:addResponse("Eine der Statuen hinter mir repräsentiert ihn. Wirf einen Blick darauf wenn du wissen möchtest wie er aussehen könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists but she does not interest me.");
talkEntry:addResponse("I've heard about priests of this god, but I cannot remember their names.");
talkEntry:addResponse("That's one of the younger gods, therefore, nothing compared to Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists but is of no interest to me.");
talkEntry:addResponse("I've heard priests of this goddess live in Runewick .");
talkEntry:addResponse("That's one of the younger gods, therefore, beneath my lord, Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der alten Götter wie Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This is not a god I take much interest in.");
talkEntry:addResponse("I once knew a priest of Eldan, but cannot recall his name.");
talkEntry:addResponse("He is an elder god like my lord, Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der alten Götter wie Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I give little attention to this god.");
talkEntry:addResponse("I cannot recall anyone I know worshipping her.");
talkEntry:addResponse("Like Brágon she is an elder god.");
talkEntry:addResponse("One of the statues behind me represents her. Just take a look if you want to know how she could look like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der alten Götter wie Bragon.");
talkEntry:addResponse("Eine der Statuen hinter mir repräsentiert sie. Wirf einen Blick darauf wenn du wissen möchtest wie sie aussehen könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Best speak with someone from Galmair about such a god.");
talkEntry:addResponse("I do not know anyone personally that honors this god.");
talkEntry:addResponse("Just one of many younger gods that cannot compare to Lord Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I've heard travelers from Cadomyr utter his name.");
talkEntry:addResponse("A god of war but cannot purge the field of battle like Lord Brágon.");
talkEntry:addResponse("One of the younger gods I believe, I lose track of all of them some times.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't talk about this god.");
talkEntry:addResponse("No priest should ever openly worship such a god!");
talkEntry:addResponse("Do not utter the name of such a thief. He took some of my Lord's beloved dragons!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Über diesen Gott spreche ich nicht.");
talkEntry:addResponse("Es gibt Gerüchte, dass der Tempel ihm folgt.");
talkEntry:addResponse("Er hat meinen Göttern die Drachen gestohlen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The god of chaos they say, but he means little to me.");
talkEntry:addResponse("How can you even consider a person who follows such a god a priest?");
talkEntry:addResponse("Just one of the younger gods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ask someone in Runewick about Oldra, not me.");
talkEntry:addResponse("#me yawns, 'Another subject perhaps?'.");
talkEntry:addResponse("A younger god living in the shadows of my Lord Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go to Galmair to join his shadow.");
talkEntry:addResponse("The only way to rid the world of his shadow is by the flame of Brágon.");
talkEntry:addResponse("A mere younger god, ha, nothing to the Lord Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes, this god exists but she is not interesting to me.");
talkEntry:addResponse("I heard about priests of this goddess, but I cannot remember their names.");
talkEntry:addResponse("Oh, all this speak of younger gods bores me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is of little interest to me.");
talkEntry:addResponse("Search yourself a lizardman if you seek answers about her");
talkEntry:addResponse("That's one of the elder gods like Brágon.");
talkEntry:addResponse("One of the statues behind me represents her. Just take a look if you want to know how she could look like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der alten Götter wie Bragon.");
talkEntry:addResponse("Eine der Statuen hinter mir repräsentiert sie. Wirf einen Blick darauf wenn du wissen möchtest wie sie aussehen könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("She is of little concern to me.");
talkEntry:addResponse("Never heard of a priest dedicated to Ushara.");
talkEntry:addResponse("She is an elder god but nothing compared to Brágon.");
talkEntry:addResponse("One of the statues in front of me me represents her. Just take a look if you want to know how she could look like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich.");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der alten Götter wie Bragon.");
talkEntry:addResponse("Eine der Statuen vor mir repräsentiert sie. Wirf einen Blick darauf wenn du wissen möchtest wie sie aussehen könnte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("#me looks disinterested, 'Perhaps another subject?'");
talkEntry:addResponse("I don't know anyone that worships Zhambra.");
talkEntry:addResponse("One of the many younger gods that serve Brágon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ja, dieser Gott existiert aber ist nicht von Interesse für mich .");
talkEntry:addResponse("Ich hörte von einem Priester dieser Gottheit, aber ich kann mich nicht an den Namen des Priesters erinnern.");
talkEntry:addResponse("Das ist einer der jungen Götter. Nichts im Vergleich zu Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Do I look like I sell something?");
talkEntry:addResponse("I don't sell anything.");
talkEntry:addResponse("I'm not a merchant, I am clearly a priest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Sehe ich aus als würde ich etwas verkaufen?");
talkEntry:addResponse("Ich verkaufe nichts.");
talkEntry:addResponse("Ich bin kein Händler, sondern Priester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("In Brágon I believe.");
talkEntry:addResponse("Another time maybe. Now I have to pray.");
talkEntry:addResponse("It is not the time for stories, yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("An Bragon glaube ich.");
talkEntry:addResponse("Vielleicht ein andermal. Jetzt muss ich beten.");
talkEntry:addResponse("Nun ist nicht die Zeit um Geschichten zu erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC first name>");
talkEntry:addTrigger("<NPC last name>");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes? How can I help you? Do you like to know more about gods?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC-Vorname>");
talkEntry:addTrigger("<NPC-Nachname>");
talkEntry:addResponse("Ja? Wie kann ich euch behilflich sein? Wollt ihr etwas über Götter wissen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Very well. I feared you would say no.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Sehr gut. Ich fürchtete ihr sagt nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No? Are you sure?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein? Seid ihr sicher?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Don't you think it is time for another pray now?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Denkt ihr nicht es ist an der Zeit für ein weiteres Gebet?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me kniet vor dem Altar.", "#me kneels in front of the altar.");
talkingNPC:addCycleText("#me klopft gegen den Altar und ruft 'Heil dir Bragon!'", "#me knocks against the altar and calls 'Hail Brágon!'");
talkingNPC:addCycleText("#me poliert gedankenverloren seinen Goldring.", "#me seems to be lost in thought while polishing a gold ring.");
talkingNPC:addCycleText("#me murmelt vor sich hin: 'Bragon, möchte uns dein Feuer leuchten.'", "#me mumbles: 'Brágon, your fire shall be a light for us.'");
talkingNPC:addCycleText("Bragon, er ist weise, stark, nobel, einfach wunderbar.", "Brágon, he is wise, strong, noble, and heavenly.");
talkingNPC:addCycleText("Bragon belohnt manchmal Leute mit heilgen, wertvollen Dinge in diesem Temple.", "Brágon blesses people sometimes who sacrifice valuable things in his temple.");
talkingNPC:addCycleText("Malachin, nicht gerade wie Bragon!", "Brágon oh how your greatness exceeds Malachin's!");
talkingNPC:addCycleText("Hmm... wo kriege ich nur mehr Gold her?", "Hmm... where do I get more gold?");
talkingNPC:addCycleText("#me hält seinen Priesterstab gehn Himmel und ruft nach Bragon", "#me holds his cleric's staff to heaven and calls for Bragon.");
talkingNPC:addCycleText("#me betrachtet seinen Rubin mit wohlwollen.", "#me looks at his ruby with a satisfied smirk on his face.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("#me kniet vor dem Altar und betet.", "#me kneels in front of the altar praying.");
mainNPC:setUseMessage("Dein Feuer berühre und erleuchte mich!", "Your fire touches and enlightens me!");
mainNPC:setConfusedMessage("#me blickt verwirrt.", "#me is clearly confused.");
mainNPC:setEquipment(1, 358);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 40);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
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