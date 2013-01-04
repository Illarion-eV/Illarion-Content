--------------------------------------------------------------------------------
-- NPC Name: Gavin Northstar                                          Galmair --
-- NPC Job:  Guard                                                            --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  384, 328, 0            --
-- NPC Sex:  female                     NPC Direction: east                   --
--                                                                            --
-- Author:   Kawan Baxter                                                     --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 384, 328, 0, 2, 'Gavin Northstar', 'npc.gavin_northstar', 1, 2, 0, 0, 0, 0, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
require("npc.base.guards_static")
module("npc.gavin_northstar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Gavin Northstar the bridge guardian. Keyphrases: Hello, Bridge, Galmair, Guard."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Gavin Northstar, die Brückenwächterin. Schlüsselwörter: Hallo, Brücke, Galmair, Wache."));
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
talkEntry:addResponse("Good day. You have arrived at the City of Galmair.");
talkEntry:addResponse("May your walk in justice bring you peace.");
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
talkEntry:addResponse("Guten Tag. Ihr seid in Galmair angekommen.");
talkEntry:addResponse("Betretet Galmair, doch überschreitet nicht die Gesetze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("If you are in peace come through these doors.");
talkEntry:addResponse("Good day. You have arrived at the City of Galmair.");
talkEntry:addResponse("May your walk in justice bring you peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Guten Tag. Ihr seid in Galmair angekommen.");
talkEntry:addResponse("Betretet Galmair, doch überschreitet nicht die Gesetze.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Be wary of danger on your travels.");
talkEntry:addResponse("Alert me if there is any trouble in Galmair.");
talkEntry:addResponse("The Civil Watch is always watching. Walk in peace and justice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Nehm Euch auf Reise vor Gefahren in Acht.");
talkEntry:addResponse("Die Stadtwache hält immer wacht. Seid friedlich und achtet das Recht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Be wary of danger on your travels.");
talkEntry:addResponse("Alert me if there is any trouble in Galmair.");
talkEntry:addResponse("The Civil Watch is always watching. Walk in peace and justice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Nehm Euch auf Reise vor Gefahren in Acht.");
talkEntry:addResponse("Die Stadtwache hält immer wacht. Seid friedlich und achtet das Recht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I relinquished such cares in the pursuit of peace and justice.");
talkEntry:addResponse("As long as you don?t cause any trouble in Galmair my day is correct");
talkEntry:addResponse("Galmair is at peace. That is my state of being.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich kümmere mich nicht darum, Frieden und Gerechtigkeit sind weitauf wichtiger");
talkEntry:addResponse("Solange Ihr mir keinen Ärger macht, ist alles in Ordnung.");
talkEntry:addResponse("Glamair ist friedlich und mir geht es gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Gavin Northstar.");
talkEntry:addResponse("Gavin Northstar. Now please move along.");
talkEntry:addResponse("Gavin Northstar. I guard this bridge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Gavin Northstar.");
talkEntry:addResponse("Gavin Northstar. Bitte geht weiter.");
talkEntry:addResponse("Gavin Northstar. Ich bewache die Brücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I am capable of accommodating any of my own needs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich kann meine Bedürfnisse unterordnen, wenn es seim muss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I am capable of accommodating any of my own needs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich kann meine Bedürfnisse unterordnen, wenn es seim muss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am guard of Galmair?s bridge.");
talkEntry:addResponse("I am a Silverstone in the Civil Watch.");
talkEntry:addResponse("I serve this city by being in the Civil Watch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin die Wache der Brücke von Galmair.");
talkEntry:addResponse("Ich bin ein Silberstein in der Stadtwache.");
talkEntry:addResponse("Ich diene in der Stadtwache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am guard of Galmair?s bridge.");
talkEntry:addResponse("I am a Silverstone in the Civil Watch.");
talkEntry:addResponse("I  Serve this city by being in the Civil Watch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin die Wache der Brücke von Galmair.");
talkEntry:addResponse("Ich bin ein Silberstein in der Stadtwache.");
talkEntry:addResponse("Ich diene in der Stadtwache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bre");
talkEntry:addResponse("Why do you want to know?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Civil Watch");
talkEntry:addResponse("They are the people dedicated to keeping people in Galmair safe from criminals, monsters and invaders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Man");
talkEntry:addTrigger("husband");
talkEntry:addTrigger("Family");
talkEntry:addResponse("Please dont ask me personal questions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sister");
talkEntry:addResponse("Bre of the south gate is my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dwarf");
talkEntry:addResponse("Yes I am tall for being a dwarf. Please move on.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Woman");
talkEntry:addTrigger("Girl");
talkEntry:addTrigger("Female");
talkEntry:addResponse("Being a woman has never deterred me from reaching my goal of being in the Civil Watch because the hate of others has never overshadowed my own fire for justice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bre");
talkEntry:addResponse("Warum fragt Ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadtwache");
talkEntry:addResponse("Das sind alles Leute die die Bürger von Galmair vor Monstern, Dieben und Angreifer schützt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mann");
talkEntry:addTrigger("Ehemann");
talkEntry:addTrigger("Familie");
talkEntry:addResponse("Stellt mir keine persönliche Fragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schwester");
talkEntry:addResponse("Bre vom Südtor ist meine Schwester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwerg");
talkEntry:addResponse("Ja, ich bin groß für einen Zwerg. Weiter gehen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frau");
talkEntry:addTrigger("Mädchen");
talkEntry:addTrigger("weib");
talkEntry:addResponse("Eine Frau zu sein hat mich nicht aufgehalten meine Ziele in der Stadtwache zu erreichen, denn der Hass auf andere hat niemals mein eigenes Feuer der Gerechtigkeit überschattet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bre");
talkEntry:addResponse("She is the prettiest, strongest, smartest person I know.");
talkEntry:addResponse("I rescued her from being homeless.");
talkEntry:addResponse("Bre of the other gate is my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sister");
talkEntry:addResponse("She is the prettiest, strongest, smartest person I know.");
talkEntry:addResponse("I rescued her from being homeless.");
talkEntry:addResponse("Bre of the other gate is my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Homeless");
talkEntry:addResponse("It is no place for a girl... I can tell you that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Peace");
talkEntry:addTrigger("Justice");
talkEntry:addResponse("One should do everything in peace and justice.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guard");
talkEntry:addTrigger("Civil Watch");
talkEntry:addTrigger("bridge");
talkEntry:addResponse("It is my job to protect the city and its citizen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drugs");
talkEntry:addResponse("#me looks at you bemused.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("men");
talkEntry:addResponse("Men are the counterpart to women.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Weapon");
talkEntry:addResponse("Weapons are the guards best friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bre");
talkEntry:addResponse("Sie ist die schönste, stärkste und schlauste Person, die ich kenne.");
talkEntry:addResponse("Ich hab sie aus der Obdachlosigkeit geholt.");
talkEntry:addResponse("Bre am anderen Tor, das ist meine Schwester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schwester");
talkEntry:addResponse("Sie ist die schönste, stärkste und schlauste Person, die ich kenne.");
talkEntry:addResponse("Ich hab sie aus der Obdachlosigkeit geholt.");
talkEntry:addResponse("Bre am anderen Tor, das ist meine Schwester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("obdachlos");
talkEntry:addResponse("Das ist nichts für ein Mädchen, glaubt mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frieden");
talkEntry:addTrigger("Gerechtigkeit");
talkEntry:addResponse("Man sollte alles für Frieden und Gerechtigkeit tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wache");
talkEntry:addTrigger("Bürgerwehr");
talkEntry:addTrigger("Brücke");
talkEntry:addResponse("Meine Aufgabe ist es die Stadt und ihre Bürger zu bewachen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drogen");
talkEntry:addTrigger("Rauschgift");
talkEntry:addResponse("#me schaut dich irritiert an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Männer");
talkEntry:addResponse("Männer sind das Gegenteil von Frauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waffe");
talkEntry:addResponse("Waffen sind der beste Freund einer Wache.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("You have no need to know who I worship.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara the bright once said --Justice is a tree. Wisdom is its leaves, power is its trunk, and love is its roots.-- This is the saying I hold in my mind every day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ihr bracht nicht wissen, wen ich ehre.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara die Erleuchtet sagte einmal folgends: Gerechtigkeit ist ein Baum. Weisheit sind seine Blätter, Macht ist seim Stamm und Liebe die Wurzeln. Diesen Spruch bewahre ich mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("There is an enormous bridge that stretches across a large sea.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die Stadt ist mit einer riesigen Brücke über das Meer mit dem Festland verbunden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I hear he is a strong mage. Magic is nothing compared to a strong blow from a dwarven great axe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich hörte, er weiß, mit der Magie umzugehen. Aber mal im Ernst: Was ist schon Magie gegen den Hieb einer Zwergenaxt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Archmage");
talkEntry:addResponse("I hear he is a strong mage. Magic is nothing compared to a strong blow from a dwarven great axe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich hörte, er weiß, mit der Magie umzugehen. Aber mal im Ernst: Was ist schon Magie gegen den Hieb einer Zwergenaxt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I work for him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich arbeite für ihn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("The streets are cold, the men are rude, but this is where my sister is and my job.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Die Straßen sind kalt, die Leute ungehobelt aber hier ist meine Schwester und meine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Bre wants to go there. I will take her on my next day off.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Bre möchte dort hin gehen. Ich werde sie an meinem nächsten freien Tag dort hinbringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I don't know her personally.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich kenne sie nicht persönlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I don't know her personally.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich kenne sie nicht persönlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I have nothing to say of it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Dazu habe ich nichts zu sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Weiter gehen!", "Move on!");
talkingNPC:addCycleText("Wenn Ihr friedvoll aseid, seid ihr in Galmair willommen.", "If you bring peace. Galmair will watch over you.");
talkingNPC:addCycleText("Die, die mit dem Bösen im Bunde stehen und es wagen die Brücke zu betreten werden sterben!", "Those who stand in evil who dare to pass this gate will die.");
talkingNPC:addCycleText("Dies ist Galmair. Kommt in Frieden.", "This is Galmair. Come in peace.");
talkingNPC:addCycleText("Ihr habe jetzt grade die Zwergische Siedlung Galmair betetren.", "You have just crossed into The Dwarvan gathering of Galmair");
talkingNPC:addCycleText("Meine Schwester gehört auch zur Stadtwache.", "My sister is also part of the Civil Watch.");
talkingNPC:addCycleText("Bedenkt, ich sehe was Ihr tut.", "Remember. I can see what you are doing.");
talkingNPC:addCycleText("Ich frage mich, wann der Don zum letzten Mal über diese Brücke ging.", "I wonder the last time I?ve seen The Don pass this bridge.");
talkingNPC:addCycleText("Jeder der versucht starke Drogen nach Galmair zu schmuggeln wird bestarft!.", "Anyone who tries to sneak strong drugs into Galmair will be punished.");
talkingNPC:addCycleText("Fall nicht. Geht weiter!", "Do not fall! Move on!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("", "This NPC is Gavin Daystar the gate guardian, a broad shouldered dwarf");
mainNPC:setUseMessage("Zurück!", "Back up!");
mainNPC:setConfusedMessage("#me schaut verwirrt umher.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2359);
mainNPC:setEquipment(11, 195);
mainNPC:setEquipment(5, 2731);
mainNPC:setEquipment(6, 95);
mainNPC:setEquipment(4, 530);
mainNPC:setEquipment(9, 367);
mainNPC:setEquipment(10, 771);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar)
  mainNPC:nextCycle(npcChar);
  npc.base.guards_static.NextCycle(npcChar);
end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END