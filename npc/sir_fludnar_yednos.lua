--------------------------------------------------------------------------------
-- NPC Name: Sir Fludnar Yednos                                      Runewick --
-- NPC Job:  Scholar                                                          --
--                                                                            --
-- NPC Race: human                      NPC Position:  896, 757, 1            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                                            --
-- Last parsing: November 17, 2010                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 896, 757, 1, 4, 'Sir Fludnar Yednos', 'npc.sir_fludnar_yednos', 0, 2, 0, 255, 255, 255, 255, 255, 255);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.state")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.quest")
require("npc.base.consequence.state")
require("npc.base.consequence.treasure")
require("npc.base.talk")
module("npc.sir_fludnar_yednos", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addResponse("Quest status set to 0");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 1");
talkEntry:addResponse("Quest status set to 1");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 2");
talkEntry:addResponse("Quest status set to 2");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 3");
talkEntry:addResponse("Quest status set to 3");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 4");
talkEntry:addResponse("Quest status set to 4");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 17");
talkEntry:addResponse("Quest status set to 17");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 17));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 18");
talkEntry:addResponse("Quest status set to 18");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 19");
talkEntry:addResponse("Quest status set to 19");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 20");
talkEntry:addResponse("Quest status set to 20");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 21");
talkEntry:addResponse("Quest status set to 21");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 40");
talkEntry:addResponse("Quest status set to 40");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 40));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 41");
talkEntry:addResponse("Quest status set to 41");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 41));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 42");
talkEntry:addResponse("Quest status set to 42");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 42));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 43");
talkEntry:addResponse("Quest status set to 43");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 43));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 44");
talkEntry:addResponse("Quest status set to 44");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 44));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 45");
talkEntry:addResponse("Quest status set to 45");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 45));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 46");
talkEntry:addResponse("Quest status set to 46");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 46));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 47");
talkEntry:addResponse("Quest status set to 47");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 47));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 48");
talkEntry:addResponse("Quest status set to 48");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 48));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 49");
talkEntry:addResponse("Quest status set to 49");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 49));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the scholar Sir Fludnar Yednos. Keyphrases: Hello, quest, god, orc."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Gelehrte Sir Fludnar Yednos. Schlüsselwörter: Hallo, Quest, Götter, Ork."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("Could you lower your tongue? But be greeted anyway!");
talkEntry:addResponse("Hmm...Can I help you?");
talkEntry:addResponse("Be greeted as well, but now let me continue to research.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("mit dir");
talkEntry:addResponse("Könnt ihr nicht leiser sprechen? Aber seid trotzdem gegrüßt!");
talkEntry:addResponse("Hmm...Kann ich euch helfen?.");
talkEntry:addResponse("Seid auch gegrüßt, aber nun last mich doch weiter forschen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Did you get lost?");
talkEntry:addResponse("Leave me quick!");
talkEntry:addResponse("Who is disturbing my work?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Habt ihr euch verlaufen?");
talkEntry:addResponse("Raus hier aber schnell!");
talkEntry:addResponse("Wer stört ich hier bei der Arbeit?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farewell.");
talkEntry:addResponse("Good bye.");
talkEntry:addResponse("Don't forget to close the door!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Lebt wohl.");
talkEntry:addResponse("Aufwiedersehen.");
talkEntry:addResponse("Vergesst nicht die Tür zu schließen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Get out!");
talkEntry:addResponse("Finally!");
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Raus hier!");
talkEntry:addResponse("Endlich!");
talkEntry:addResponse("...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("If nobody would disturb me, it would be better!");
talkEntry:addResponse("Could you keep silent pleace?");
talkEntry:addResponse("Fine, fine, but let me continue my work now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Würde man mich nicht stören, würde es mir besser gehen.");
talkEntry:addResponse("Könnt ihr bitte leise sein?");
talkEntry:addResponse("Gut, Gut, aber nun lasst mich weiterarbeiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Who asks?");
talkEntry:addResponse("Sir Fludnar Yednos.");
talkEntry:addResponse("Is this necessary to know?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Wer fragt?");
talkEntry:addResponse("Sir Fludnar Yednos.");
talkEntry:addResponse("Ist das von belang zu wissen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Do I look as I sell something?");
talkEntry:addResponse("Do you remember where the gate is? GET OUT!");
talkEntry:addResponse("I can sell you this book for 1000 gold! *smirks* ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Sehe ich aus als würde ich etwas verkaufen?");
talkEntry:addResponse("Erinnerst du dich wo die Türe ist? RAUS HIER!");
talkEntry:addResponse("Ich kann dir das Buch hier um 1000 Goldmünzen verkaufen. *grinst frech*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I am working and you are disturbing me!");
talkEntry:addResponse("The gate is behind you.");
talkEntry:addResponse("Have somebody ever told you that you are disturbing?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich arbeite und ihr stört.");
talkEntry:addResponse("Die Tür ist hinter euch.");
talkEntry:addResponse("Hat euch jemals jemand erzählt, dass ihr störend seid?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addTrigger("work");
talkEntry:addResponse("I'm a scholar, or what have you thought?");
talkEntry:addResponse("I am researching on Orcs.");
talkEntry:addResponse("I'm a researcher and my interest is in the race of orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addTrigger("arbeit");
talkEntry:addResponse("Ich bin ein Gelehrter, oder was habt ihr gedacht?");
talkEntry:addResponse("Ich forsche an Orks.");
talkEntry:addResponse("Ich bin Forscher und interessiert an der Rasse der Orks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm a scholar, or what have you thought?");
talkEntry:addResponse("I am researching on Orcs.");
talkEntry:addResponse("I'm a researcher and my interest is in the race of orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Gelehrter, oder was habt ihr gedacht?");
talkEntry:addResponse("Ich forsche an Orks.");
talkEntry:addResponse("Ich bin Forscher und interessiert an der Rasse der Orks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh yes, the good, old times. *sigh*");
talkEntry:addResponse("It was a small island somewhere in the east of the main land.");
talkEntry:addResponse("It was a chaotic place with many wannabes!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Oh ja, die guten alten Zeiten. *seufzt*");
talkEntry:addResponse("Es war eine kleine Insel irgendwo im Osten des Festlands.");
talkEntry:addResponse("Es war ein chaotischer Ort mit lauter Möchtegern-Typen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you.");
talkEntry:addResponse("Well, what do you want from me?");
talkEntry:addResponse("Interesting, interesting, but never heared such a ridiculous name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Schön euch kennen zu lernen.");
talkEntry:addResponse("Schön, was wollt ihr von mir?");
talkEntry:addResponse("Interessant, interessant, aber ich habe noch nie so einen lächerlichen Namen gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sir");
talkEntry:addTrigger("fludnar");
talkEntry:addTrigger("yednos");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's my name.");
talkEntry:addResponse("Impressing, you can pronounce my name correctly!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sir");
talkEntry:addTrigger("fludnar");
talkEntry:addTrigger("yednos");
talkEntry:addResponse("Das ist mein Name.");
talkEntry:addResponse("Beeindruckend, ihr könnt meinen Namen richtig aussprechen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("alter of fire");
talkEntry:addResponse("Ask people. I am sure someone knows it.");
talkEntry:addResponse("I think it is in the east.");
talkEntry:addResponse("Shall I looking for by myself?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orcs");
talkEntry:addResponse("Green, strong, bloody.");
talkEntry:addResponse("An interesting race for research, isn't?.");
talkEntry:addResponse("Better you show some respect if you meet one! You never know if the enslave you otherwise!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Northern");
talkEntry:addTrigger("Mountains");
talkEntry:addTrigger("krest");
talkEntry:addResponse("A mighty clan. Better avoid to bother them.");
talkEntry:addResponse("They have a very honourfull chief.");
talkEntry:addResponse("Their warlord destroyed a whole dwarves army once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("halfings");
talkEntry:addResponse("Halfings...their favorite food.");
talkEntry:addResponse("The have several recepies for them.");
talkEntry:addResponse("They are also very usefull as slaves for them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bloodgod");
talkEntry:addResponse("I don't want mention is right name. It would be heresey");
talkEntry:addResponse("Orcs celebrating and following him, because he created them.");
talkEntry:addResponse("Beware of those who follow him. Those are lost as he is.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Altar des Feuer");
talkEntry:addResponse("Fragt herum. Ich bin sicher jemand kann euch helfen.");
talkEntry:addResponse("Ich denke der liegt im Osten.");
talkEntry:addResponse("Soll ich selber suchen gehen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Orks");
talkEntry:addResponse("Grün, stark, Blutig.");
talkEntry:addResponse("Eine interessante Rasse zum forschen, oder?");
talkEntry:addResponse("Besser ihr zeigt ihnen gegenüber etwas Respekt. Man weiß nie, ob sie einen sonst versklaven?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Northern");
talkEntry:addTrigger("Mountains");
talkEntry:addTrigger("krest");
talkEntry:addResponse("Ein mächtiger Klan. Besser ihr vermeidet diese zu ärgern.");
talkEntry:addResponse("Die haben einen ehrenhaften Chief.");
talkEntry:addResponse("Deren Kriegsherr zerstörrte eine ganze Armee von Zwergen einst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Halbling");
talkEntry:addResponse("Halblinge...ihr favorisiertes Essen.");
talkEntry:addResponse("Die haben verschiedene Rezepte für sie.");
talkEntry:addResponse("Sie verwenden sie auch als Sklaven.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blutgott");
talkEntry:addResponse("Ich möchte seinen Namen nicht nennen. Es wäre Häresie.");
talkEntry:addResponse("Orks feiern und folgen ihm, weil er sie erschaffen hat.");
talkEntry:addResponse("Hütet euch von jenen die ihm folgen. Verloren wie er, sind auch sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He has so much knowledge.");
talkEntry:addResponse("I have not seen anyone who is smarter than he.");
talkEntry:addResponse("If you have a question, nobody can answer it better than him..");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er hat so viel Wissen.");
talkEntry:addResponse("Ich habe noch nie jemanden gesehen der so schlau ist.");
talkEntry:addResponse("Wenn ihr eine Frage habt, es gibt niemanden der es besser beantworten kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nice towers do we have, haven't we?");
talkEntry:addResponse("Our forest is so beautiful.");
talkEntry:addResponse("I enjoy it to live here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Schöne Türme haben wir, nicht wahr?.");
talkEntry:addResponse("Unser Wald ist so wunderhübsch.");
talkEntry:addResponse("Ich genieße es hier zu leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Watch his daggers!");
talkEntry:addResponse("He has only one aim: more wealth!");
talkEntry:addResponse("I think he belives in Nargun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Achte auf seine Dolche!");
talkEntry:addResponse("Er hat nur ein einziges Interesse: mehr Reichtum!");
talkEntry:addResponse("Ich denke er glaubt an Nargun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Only one word: Criminals.");
talkEntry:addResponse("They are all greedy and moody.");
talkEntry:addResponse("A disgusting place.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Nur ein Wort: Verbrecher.");
talkEntry:addResponse("Die sind all gierig und launisch.");
talkEntry:addResponse("Ein abscheulicher Platz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I don't know how such a person could become queen.");
talkEntry:addResponse("Wisdom is not one of her characteristics.");
talkEntry:addResponse("I haven't seen her so far, but she should be very pretty.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich weiß nicht wie soe eine Person Königin werden konnte.");
talkEntry:addResponse("Weisheit ist nicht gerade eine ihrer Eigenschaften.");
talkEntry:addResponse("Ich habe sie noch nie gesehen, aber sie soll sehr hübsch sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("They think the have honor.");
talkEntry:addResponse("I think the have some quite good goldsmiths.");
talkEntry:addResponse("I would not be surprised if they have some slaves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Die denken, dass sie Ehre hätten.");
talkEntry:addResponse("Ich denke, dass sie ein paar ganz gute Goldschmiede haben.");
talkEntry:addResponse("Ich wäre nicht überrascht wenn die nicht einge Sklaven hätten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Why are you not going there?");
talkEntry:addResponse("That is no place I like to live.");
talkEntry:addResponse("Are they still enslaving people?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Warum geht ihr nicht dort hin?.");
talkEntry:addResponse("Das ist kein Ort wo ich leben möchte.");
talkEntry:addResponse("Versklaven die noch immer Leute?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Why are you not going there?");
talkEntry:addResponse("Huuu, why do remember me that I still have to pay my debts there.");
talkEntry:addResponse("They have nice game halls.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Warum geht ihr nicht dort hin?");
talkEntry:addResponse("Huuu, warum müsst ihr mich erinnern, dass ich dort noch Schulden zu begleichen habe?");
talkEntry:addResponse("Nette Spielhalen haben sie dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Why are you not going there?");
talkEntry:addResponse("I hope they come and free us from all this evil here.");
talkEntry:addResponse("I say you, I am very sorry that they killed their prince at Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Warum geht ihr nicht dort hin?");
talkEntry:addResponse("Ich hoffe die kommen und befreien uns von diesem Übel hier.");
talkEntry:addResponse("Ich sage dir, dass es mir sehr leid tut, dass sie ihren Prinzen in Gobaith getötet haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Elara, who else?");
talkEntry:addResponse("I pray to Elara.");
talkEntry:addResponse("If you look around here, you could belive I pray to Nargun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Eldra, wem sonst?");
talkEntry:addResponse("Ich bete zu Eldra.");
talkEntry:addResponse("Wenn man sich hier umsieht könnt man glauben Nagrun ist mein Gott.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I hope she gives me knowledge.");
talkEntry:addResponse("I believe in here as other scholars.");
talkEntry:addResponse("She will help me to solve this matter here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ich hoffe sie verleiht wir mehr Wissen.");
talkEntry:addResponse("Wie andere Gelehrte verehre ich nur sie.");
talkEntry:addResponse("Sie wird mir helfen mein Rätsel hier zu lösen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("One more word about him and I call the guards.");
talkEntry:addResponse("There is rumours that the temple follows him.");
talkEntry:addResponse("The Father of the Orks he is.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ein Wort mehr über ihn und ich rufe die Wache.");
talkEntry:addResponse("Es gibt Gerüchte, dass der Tempel ihm folgt.");
talkEntry:addResponse("Für Orks ist er ihr Vater, ja.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Don't belive I pray to him just because it looks chaotic here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Glaubt nur nicht ich bette zu ihm weil es hier so chaotisch aussieht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There shall be people who pray to this god.");
talkEntry:addResponse("I do not believe in this god.");
talkEntry:addResponse("Nothing compared to Elara");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Es soll Leute geben die an diesen Gott glauben.");
talkEntry:addResponse("Ich glaube nicht an diesen Gott.");
talkEntry:addResponse("Nichts im Vergleich zu Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("can I do");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Find information for Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm... are you sure that you can do something for me? Collecting information for me, for example?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("kann ich was tun");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Finde Information für Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm... seid ihr sicher, dass ihr etwas für mich tun könnt? Information sammeln zum Beispiel?.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Find information for Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm... are you sure that you can do something for me? Collecting information for me, for example?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Finde Information für Sir Fludnar Yednos"));
talkEntry:addResponse("Hmm... seid ihr sicher, dass ihr etwas für mich tun könnt? Information sammeln zum Beispiel?.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("can I do");
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 1));
talkEntry:addResponse("Then shall it be! But first one short question before I give you a task. Do you know something about Bragon and the creation of the orcs?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("kann ich was tun");
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 1));
talkEntry:addResponse("Dann soll es so sein! Aber erst eine kurze Frage bevor ich euch einen Auftrag gebe. Wisst ihr etwas über Bragon und die Erschaffung der Orks");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 1));
talkEntry:addResponse("Then shall it be! But first one short question before I give you a task. Do you know something about Bragon and the creation of the orcs?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 1));
talkEntry:addResponse("Dann soll es so sein! Aber erst eine kurze Frage bevor ich euch einen Auftrag gebe. Wisst ihr etwas über Bragon und die Erschaffung der Orks");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addResponse("Well, well. That sounds promising... Ready for the task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addResponse("So, so. Das klingt ja vielversprechend... Bereit für die Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well, well. That sounds promising... Ready for the task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addResponse("So, so. Das klingt ja vielversprechend... Bereit für die Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addResponse("Anyway. Does not matter. But listen carefully now... Ready for the task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addTrigger("Nix");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addResponse("Wie auch immer. Nicht so schlimm. Aber hört gut zu... Bereit für die Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Anyway. Does not matter. But listen carefully now... Ready for the task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nay");
talkEntry:addTrigger("Nubba");
talkEntry:addTrigger("Nope");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 2));
talkEntry:addResponse("Wie auch immer. Nicht so schlimm. Aber hört gut zu... Bereit für die Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(10));
talkEntry:addResponse("Find out, in which age did Bragon help to create the orks? I think it was the fourth, but the name...However, I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(10));
talkEntry:addResponse("Findet heraus, in welchem Zeitalter Bragon half die Orks zu schaffen! Ich denke es war das vierte, aber der Name... Wie auch immer, ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(10));
talkEntry:addResponse("Find out, in which age did Bragon help to create the orks? I think it was the fourth, but the name...However, I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(10));
talkEntry:addResponse("Findet heraus, in welchem Zeitalter Bragon half die Orks zu schaffen! Ich denke es war das vierte, aber der Name... Wie auch immer, ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(11));
talkEntry:addResponse("Find out, what was the reason for Bragons to support the Bloodgod in the creation of the orcs! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(11));
talkEntry:addResponse("Findet heraus, was der Grund für Bragons Unterstüzung für den Blutgott in der Erschaffung der Orks war! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(11));
talkEntry:addResponse("Find out, what was the reason for Bragons to support the Bloodgod in the creation of the orcs! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(11));
talkEntry:addResponse("Findet heraus, was der Grund für Bragons Unterstüzung für den Blutgott in der Erschaffung der Orks war! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(13));
talkEntry:addResponse("Find out, what is Bragon for the orcs... something with like a purge or similar, but i cannot remember! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(13));
talkEntry:addResponse("Findet heraus, was Bragon für die Orks ist... etwas mit Vernichter oder ähnlichem, aber ich kann mich nicht mehr recht erinnern! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(13));
talkEntry:addResponse("Find out, what is Bragon for the orcs... something with like a purge or similar, but i cannot remember! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(13));
talkEntry:addResponse("Findet heraus, was Bragon für die Orks ist... etwas mit Vernichter oder ähnlichem, aber ich kann mich nicht mehr recht erinnern! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addResponse("Find out, in which age did Bragon realize that the creation of the orcs could not change the Bloodgod! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addResponse("Findet heraus, in welchem Zeitalter Bragon bemerkt hat, dass die Erschaffung der Orks den Blutgott besänftigen konnte! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addResponse("Find out, in which age did Bragon realize that the creation of the orcs could not change the Bloodgod! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(14));
talkEntry:addResponse("Findet heraus, in welchem Zeitalter Bragon bemerkt hat, dass die Erschaffung der Orks den Blutgott besänftigen konnte! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addResponse("Find out, what do the orcs use as name for Bragon... something with sun! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addResponse("Findet heraus, welchen Namen die Orks für Bragon haben... etwas mit Sonne! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addResponse("Find out, what do the orcs use as name for Bragon... something with sun! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(17));
talkEntry:addResponse("Findet heraus, welchen Namen die Orks für Bragon haben... etwas mit Sonne! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Find out, what did Bragon in order to remedy his mistake of helping to creat the orcs! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Findet heraus, was Bragon in Bezug auf die Wiedergutmachung seines Fehlers durch die Erschaffung der Orks tat! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Find out, what did Bragon in order to remedy his mistake of helping to creat the orcs! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("Findet heraus, was Bragon in Bezug auf die Wiedergutmachung seines Fehlers durch die Erschaffung der Orks tat! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addResponse("Find out, what kind of relationship was it between Bragon and the Bloodgod! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addResponse("Findet heraus, was verbindet die Bragon und dem Blutgott! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addResponse("Find out, what kind of relationship was it between Bragon and the Bloodgod! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(25));
talkEntry:addResponse("Findet heraus, was verbindet die Bragon und dem Blutgott! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(34));
talkEntry:addResponse("Find out, Find out, what do the orcs use as name for Bragon... something with summer! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(34));
talkEntry:addResponse("Findet heraus, welchen Namen die Orks für Bragon haben... etwas mit Sommer! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(34));
talkEntry:addResponse("Find out, Find out, what do the orcs use as name for Bragon... something with summer! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(34));
talkEntry:addResponse("Findet heraus, welchen Namen die Orks für Bragon haben... etwas mit Sommer! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(51));
talkEntry:addResponse("Find out, why are orcs praying to Bragon! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(51));
talkEntry:addResponse("Findet heraus, warum die Orks zu Bragon beten! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(51));
talkEntry:addResponse("Find out, why are orcs praying to Bragon! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(51));
talkEntry:addResponse("Findet heraus, warum die Orks zu Bragon beten! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Find out, what has it to do with the so called 'Tribunal of Eternity'! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Findet heraus, findet raus was es mit dem so genannten 'Tribunal der Ewigkeit'auf sich hat! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Find out, what has it to do with the so called 'Tribunal of Eternity'! I think you can ask a priest. There should be one at the alter of fire. Good luck and be carefull!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 3));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Findet heraus, findet raus was es mit dem so genannten 'Tribunal der Ewigkeit'auf sich hat! Ich denke ihr sollter hierfür einen Priester fragen. Es sollte einer am Altar des Feuers zu findne sein. Viel Glück und seid vorsichtig!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("can I do");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished] You bungled it. :O"));
talkEntry:addResponse("Hmm... do you have forgotten what I asked you? Well, than you are not worth to work for me.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("kann ich was tun");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest beendet] Du hast es verbockt. :O"));
talkEntry:addResponse("Hmm... habt ihr vergessen um was ich euch los schickte? Nun, dann seid ihr es nicht wert für mich zu arbeiten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 17));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest finished] You bungled it. :O"));
talkEntry:addResponse("Hmm... do you have forgotten what I asked you? Well, than you are not worth to work for me.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.quest.quest(600, ">", 3));
talkEntry:addCondition(npc.base.condition.quest.quest(600, "<", 17));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest beendet] Du hast es verbockt. :O"));
talkEntry:addResponse("Hmm... habt ihr vergessen um was ich euch los schickte? Nun, dann seid ihr es nicht wert für mich zu arbeiten.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 17));
talkEntry:addResponse("Greetings. Do you have the answer now?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüße");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("mit dir");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 17));
talkEntry:addResponse("Grüße euch. Wisst ihr die Antwort nun?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 17));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greetings. Do you have the answer now?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 17));
talkEntry:addResponse("Grüße euch. Wisst ihr die Antwort nun?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 18));
talkEntry:addResponse("Well...so, how is the answer?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 18));
talkEntry:addResponse("Gut...und wie lautet sie die Antwort?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well...so, how is the answer?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 18));
talkEntry:addResponse("Gut...und wie lautet sie die Antwort?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Age of Concord");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you vey much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zeitalter der Eintracht");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("comfort");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trösten");
talkEntry:addTrigger("Hoffnung");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("purge of all impurity and weakness");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vernichter alles Unreinen und Schwachen");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Age of Discord");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zeitalter der Zwietracht");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Daily sunmaker");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Täglich Sonnenmacher");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dragons");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drachen");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fire");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Feuer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Strong in summer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stark im Sommer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("live");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("leben");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Holy Flame");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Thank you very much for your help! ...do like to have something for it?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heiligen Flamme");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 19));
talkEntry:addResponse("Vielen Dank für eure Unterstützung! ...würdet ihr dafür auch etwas haben wollen?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addResponse("Hmm ...Thank you for your support!...I have something for you. Maybe you can use it. However... you know where the door is. Farewell, and leave now! But Silent!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addResponse("Hmm...ich habe hier etwas für euch. Vielleicht könnt ihr etwas damit anfangen. Wie dem auch sei... ihr wisst wo die Türe ist. Lebt wohl, und nun geht! Aber leise!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addResponse("Hmm...Thank you for your support! ...I have something for you. Maybe you can use it. However... you know where the door is. Farewell, and leave now! But Silent!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.chance.chance(30));
talkEntry:addResponse("Hmm...ich habe hier etwas für euch. Vielleicht könnt ihr etwas damit anfangen. Wie dem auch sei... ihr wisst wo die Türe ist. Lebt wohl, und nun geht! Aber leise!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.item.item(46, 1, 999, 1));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Sure");
talkEntry:addTrigger("Of course");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Hmm...Thank you for your support! ...I have something for you. Maybe you can use it. However... you know where the door is. Farewell, and leave now! But Silent!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Gerne");
talkEntry:addTrigger("Jawohl");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Hmm...Vielen Dank für eure Unterstützung! ...ich habe hier etwas für euch. Vielleicht könnt ihr etwas damit anfangen. Wie dem auch sei... ihr wisst wo die Türe ist. Lebt wohl, und nun geht! Aber leise!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Hmm...Thank you for your support! ...I have something for you. Maybe you can use it. However... you know where the door is. Farewell, and leave now! But Silent!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yeah");
talkEntry:addTrigger("Yubba");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 20));
talkEntry:addCondition(npc.base.condition.chance.chance(100));
talkEntry:addResponse("Hmm...Vielen Dank für eure Unterstützung! ...ich habe hier etwas für euch. Vielleicht könnt ihr etwas damit anfangen. Wie dem auch sei... ihr wisst wo die Türe ist. Lebt wohl, und nun geht! Aber leise!");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkEntry:addConsequence(npc.base.consequence.quest.quest(600, "=", 21));
talkEntry:addConsequence(npc.base.consequence.treasure.treasure(8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("can I do");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 21));
talkEntry:addResponse("Hmm... You already had your task. There nothing to do for you here. Better ask someoneelse! Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 21));
talkEntry:addResponse("Hmm... Du hattest bereits deine Aufgabe. Hier ist nichts mehr zu tun für dich. Besser du fragst jemand anderen. Leb wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hmm... You already had your task. There nothing to do for you here. Better ask someoneelse! Farewell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(600, "=", 21));
talkEntry:addResponse("Hmm... Du hattest bereits deine Aufgabe. Hier ist nichts mehr zu tun für dich. Besser du fragst jemand anderen. Leb wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me sitzt am Tisch und liest in einem Buch.", "#me sits at the table and reads in a book.");
talkingNPC:addCycleText("#me macht einige Notizen und seufzt leicht.", "#me takes some notes and sighs.");
talkingNPC:addCycleText("#me blickt hin und wieder über seine Schulter.", "#me looks over his soulder time to time.");
talkingNPC:addCycleText("#me murmelt vor sich hin: 'Orks, welches interessantes Geschöpf'", "#me mumbles: 'Orks, how interesting creatures.'");
talkingNPC:addCycleText("#w Diese Orks... was die alles klein hauen können. Sagenhaft!", "#w Those orks... what they can crash easily. Impressing!");
talkingNPC:addCycleText("#w Der Kriegsrat besteht aus dem Häuptling, dem Schaman und dem Kriegsherrn.", "#w The war-cycle consists of the chief, the shaman and the warlord.");
talkingNPC:addCycleText("#w So dumm sind sie ja gar nicht.", "#w They are not that dumb as assumed.");
talkingNPC:addCycleText("#w Oh ein Rezept... 'gefüllter Halbing'.", "#w Oh a recipe... 'stuffed halfing'.");
talkingNPC:addCycleText("#w In der Kriegsführung ist der Ork herausragend.", "#w In warfare the ork is outstanding.");
talkingNPC:addCycleText("#me betrachtet seine Notizen mit wohlwollen.", "#me looks at his notes with a satisfied glance in his face.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Einer der Gelehrten dieser Stadt, der sich insbesondere für die Rasse der Orks interessiert.", "One of the scholars of this town, who is interested in the race of orcs in particular.");
mainNPC:setUseMessage("Psss! Ruhe bitte!", "Psss! Silent please!");
mainNPC:setConfusedMessage("Was sagtet ihr? Könntet ihr deutlicher sprechen?", "What are you saying? Could you say that again?");
mainNPC:setEquipment(1, 357);
mainNPC:setEquipment(3, 182);
mainNPC:setEquipment(11, 193);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 110);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 369);
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