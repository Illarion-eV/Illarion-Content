--------------------------------------------------------------------------------
-- NPC Name: John Doe                                                    None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: human                      NPC Position:  0, 0, 0                --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.talk")
module("npc.john_doe", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addTrigger("Hilfe");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("(( [Help] This is a NPC with the name %NPCNAME. He reacts on: Hello, Who are you, What do you do, Troll's Bane");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addTrigger("Hilfe");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("(( [Hilfe] Das ist ein NPC mit Namen %NPCNAME. Er reagiert auf: Hallo, Wer bist du, Was machst du, Troll's Bane");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grü[ßs]+e");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hi");
talkEntry:addTrigger("Hiho");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Grüße euch");
talkEntry:addResponse("Guten Tag");
talkEntry:addResponse("Grüße, geht jetzt weiter ich muss aufpassen");
talkEntry:addResponse("Hmmm? Was? Ah...grüße, ja ja.");
talkEntry:addResponse("Grüße, wollt ihr etwas?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Hi");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Hiho");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings");
talkEntry:addResponse("Good day");
talkEntry:addResponse("Greetings, move along now please, I have to watch");
talkEntry:addResponse("Hmm? What? Ah... greetings, yes yes.");
talkEntry:addResponse("Greetings, do you want anything?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auf bald");
talkEntry:addTrigger("Bis bald");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Mach[t]*s gut");
talkEntry:addResponse("Auf bald und haltet euch an die Gesetze in der Stadt.");
talkEntry:addResponse("Bis bald, wenn etwas passiert wisst ihr wo ich bin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Be well");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("see you");
talkEntry:addResponse("Farewell and follow the laws of this town.");
talkEntry:addResponse("Farewell, in case something happens you know where to find me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wer du");
talkEntry:addTrigger("Wer sie");
talkEntry:addTrigger("Wer ihr");
talkEntry:addResponse("Ich bin %NPCNAME, Stadtwache von Troll's Bane und Soldat in der Armee Salkamars! Hail dem Imperium!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Who you");
talkEntry:addResponse("I'm %NPCNAME, town guard of Troll's Bane and soldier at the salkamaerian Army");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Was tust");
talkEntry:addTrigger("Was machst");
talkEntry:addTrigger("Was macht");
talkEntry:addTrigger("Was tut");
talkEntry:addTrigger("Aufgabe");
talkEntry:addResponse("Was meine Aufgabe ist? Wonach sieht es denn aus? Ich passe hier auf das keiner Ärger macht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("What do");
talkEntry:addTrigger("work");
talkEntry:addTrigger("task");
talkEntry:addResponse("What my task is? What does it look like? I'm watching so nobody causes any trouble here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll's Bane");
talkEntry:addTrigger("Trolls Bane");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ja das hier ist Troll's Bane, eine ziemlich herunter gekommene Stadt die nun aber dank Prinz von Lonewood wieder erblühen wird! Dabei helfen ihm Herzog Devan und Herzog Ross.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Troll's Bane");
talkEntry:addTrigger("Trolls Bane");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well yes this is Troll's Bane, it's a mess here, but thanks to prince of Lonewood this town will become much better now! By this he is supported by Duke Devan and Duke Ross.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Varshikar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Varshikar ist eine kleine Stadt im Nordosten. Die Träger des Feuers haben dort ihren Sitz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Varshikar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Varshikar is a small town in the northeast. The bearers of fire live there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordmark");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ist irgendeine Barbarensiedlung. Soll im Norden sein... mehr weis ich davon nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Northmark");
talkEntry:addTrigger("Nordmark");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This is some barbarian settlement. Somewhere in the north, I don't know more about this.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greenbriar");
talkEntry:addTrigger("Green Briar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Halblingssiedlung, liegt im Südwesten auf einer kleinen Insel. Etwas südlich davon ist das Versteck der Tempelratten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Greenbriar");
talkEntry:addTrigger("Green Briar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The halfling settlement, this is located in the south west on a small island. A little south of is the hideout of the temple rats is located.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hellbriar");
talkEntry:addTrigger("Hell Briar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Das ist das Versteck des Tempels, einer Bande von Mördern, Entführern, Moschran Anbetern und Nekromanten. Die Sorte von Leuten die in Troll's Bane nichts zu suchen haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hellbriar");
talkEntry:addTrigger("Hell Briar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This is the hideout of the temple, a group of murderers, kidnappers, moshran worshippers and necromants. The kind of persons who are absolutly not wanted in Troll's Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vanima");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Insel der Elfen, soll ein ziemlich ruhiger Ort sein, ich war nie dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vanima");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The island of the elves. I heared is a pretty quiet place... but I was never there myself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silberbrand");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ah ja, Silberbrand, Heimat der Zwerge. Die haben mit Abstand das beste Bier hier auf der Insel!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Silverbrand");
talkEntry:addTrigger("Silberbrand");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah yes, Silverbrand. Home of the dwarfs. They make the best beer on this island by far!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Union");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Farmers Union... das sind ein paar Bauern die südlich von Troll's Bane leben glaube ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Union");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The farmers union... thats some peasants who live south of Troll's Bane as far as I know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lonewood");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Unser großer Anführer, Prinz Anarius of Lonewood. Er regiert Troll's Bane und hat die ganzen Verbrecher, wie den Tempel, die diese Stadt bevölkert haben hinausgetrieben!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lonewood");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Out great leader, prince Anarius of Lonewood. He leads Troll's Bane and drove all those criminals, such as the temple, who were in that town out!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ross");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Herzog Roland Ross ist einer der Herzöge von Troll's Bane die den Prinzen bei seiner Arbeit zum Wohle der Stadt unterstützen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ross");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Duke Roland Ross is one of the dukes of Troll's Bane who help the prince at this work to improve the welfare of the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Devan");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Herzog Geralt Devan ist einer der Herzöge von Troll's Bane die den Prinzen bei seiner Arbeit zum Wohle der Stadt unterstützen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Devan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Duke Geralt Devan is one of the dukes of Troll's Bane who help the prince at this work to improve the welfare of the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mitglieder Tempel");
talkEntry:addTrigger("Mitglieder Temple");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Man muss den Feind kennen um ihn zu besiegen. Darum sage ich euch die bekannten Mitglieder des Tempels. Es sind Verdazar, Joxia Doral, Dain Laiden, Daelyn, Johann Brown, Drathe Blue, Endyl, Dominic Fisher, Edward Cromwell, Orioli, Dramyr, Misjlah, Azrael Suruki, Slug'nar, Thain, Ian Blyte, Lindian und Erick McSpinan. Merkt euch diese Namen, sie sind der Feind!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Members Temple");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One has to know the enemy to defend it. So I tell you the currently known members of the temple. There are Verdazar, Joxia Doral, Dain Laiden, Daelyn, Johann Brown, Drathe Blue, Endyl, Dominic Fisher, Edward Cromwell, Orioli, Dramyr, Misjlah, Azrael Suruki, Slug'nar, Thain, Ian Blyte, Lindian and Erick McSpinan. Remember them! They are the enemy!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Temple");
talkEntry:addTrigger("Tempel");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Der Tempel ist eine Bande von Verbrechern, Halsabschneidern, Mördern, Entführern, Moschran Anbetern und Nekromanten! Jedes ihrer Mitglieder ist aus der Stadt verbannt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Temple");
talkEntry:addTrigger("Tempel");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The temple is a group of criminals, cutthroats, murderers, kidnappers, Moshran worshippers and necromants! Every of their members is banned from the town!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Träger Feuer");
talkEntry:addTrigger("Bearer Fire");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Die Träger des Feuers leben im Nordenosten, bei Varshikar. Sie kämpfen wie auch Troll's Bane gegen Abschaum wie den Tempel. Angeführt werden sie von Djironnyma.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bearer Fire");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Bearers of Fire live in the north east, at Varshikar. They fight, similar to Troll's Bane against scums like the temple. They are leaded by Djironnyma.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me blickt sich aufmerksam um.", "#me looks around concentrated.");
talkingNPC:addCycleText("#me lehnt sich leicht gegen die Wand.", "#me leans slightly against the wall.");
talkingNPC:addCycleText("#me blickt zum Tor.", "#me looks towards the door.");
talkingNPC:addCycleText("#me blickt zu seinem Partner und nickt ihm zu.", "#me looks to his partner and nods to him.");
talkingNPC:addCycleText("#me gähnt leicht und hält die Hand vor den Mund.", "#me yawns slightly and puts his hand in front of his mouth.");
talkingNPC:addCycleText("#me wischt über seine Rüstung bis diese wieder glänzt.", "#me wipes over his armor until it looks shiny again.");
talkingNPC:addCycleText("#me hustet kurz.", "#me coughs once.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist ein NPC dessen Entwickler zu faul war eine Beschreibung einzutragen.", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
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