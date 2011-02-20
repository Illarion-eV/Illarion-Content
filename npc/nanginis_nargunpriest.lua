--------------------------------------------------------------------------------
-- NPC Name: Nanginis                                                    None --
-- NPC Job:  Nargunpriest                                                     --
--                                                                            --
-- NPC Race: human                      NPC Position:  500, 500, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Ardian                                                           --
--                                                                            --
-- Last parsing: February 20, 2011                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 500, 500, 0, 4, 'Nanginis', 'npc.nanginis', 0, 4, 3, 192, 192, 192, 245, 222, 179);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.talkstate")
require("npc.base.talk")
module("npc.nanginis", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] Maybe you should ask him after his name, that would be at least a beginning."));
talkEntry:addResponse("Ohh boohoo! Little child got lost eh? Well don't expect any help from me, I've got more important things to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Vielleicht solltest du ihn nach seinem Namen fragen, das wäre zumindest ein Anfang."));
talkEntry:addResponse("Ohh buhuhu! Hat sich der kleine Matz etwa verlaufen? Nun, erwartet keine Hilfe von mir ich habe wichtigeres zu tun.");
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
talkEntry:addCondition(npc.base.condition.quest.quest(63, ">", 1));
talkEntry:addResponse("%CHARNAME! I have caught a flea! Want to see it, he's really tame, hihihi. No? Well have you come back for the blessing then?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addCondition(npc.base.condition.quest.quest(63, ">", 1));
talkEntry:addResponse("%CHARNAME! Ich habe einen Flo gefangen! Wollt ihr ihn sehen, er ist ganz zahm, hihihi. Nein? Wollt ihr nun doch den Segen empfangen?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(63, ">", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("%CHARNAME! I have caught a flea! Want to see it, he's really tame, hihihi. No? Well have you come back for the blessing then?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.quest.quest(63, ">", 1));
talkEntry:addResponse("%CHARNAME! Ich habe einen Flo gefangen! Wollt ihr ihn sehen, er ist ganz zahm, hihihi. Nein? Wollt ihr nun doch den Segen empfangen?");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should ask him about the fish or atleast after his name."));
talkEntry:addResponse("Huaaah! I bid you a glorious welcome. And a lot of fish!");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vielleicht solltest du ihn genauer nach dem Fisch fragen oder zumindest in Erfahrung bringen wie er heißt."));
talkEntry:addResponse("Huaaah! Einen glorreichen Tag wünsche ich dir. Und viel Fisch!");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Maybe you should ask him about the fish or atleast after his name."));
talkEntry:addResponse("Huaaah! I bid you a glorious welcome. And a lot of fish!");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Vielleicht solltest du ihn genauer nach dem Fisch fragen oder zumindest in Erfahrung bringen wie er heißt."));
talkEntry:addResponse("Huaaah! Einen glorreichen Tag wünsche ich dir. Und viel Fisch!");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("begin"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 3));
talkEntry:addResponse("Pah! Boring. Does your mother know what a coward you are anyway?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 3));
talkEntry:addResponse("Pah! Wie langweilig, weiß eure Mutter eigentlich was für ein Feigling ihr seid?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 3));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Pah! Boring. Does your mother know what a coward you are anyway?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 3));
talkEntry:addResponse("Pah! Wie langweilig, weiß eure Mutter eigentlich was für ein Feigling ihr seid?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Oh, leaving already? I regret that, but it doesn't trouble me at all, hihihi. Take care and mind the fish.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Oh ihr geht schon? Das tut mir aber leid, jedoch nicht weh, hihihi. Passt auf den Fisch auf.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, leaving already? I regret that, but it doesn't trouble me at all, hihihi. Take care and mind the fish.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Oh ihr geht schon? Das tut mir aber leid, jedoch nicht weh, hihihi. Passt auf den Fisch auf.");
talkEntry:addConsequence(npc.base.consequence.talkstate.talkstate("end"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm fine, thank you for your concern.");
talkEntry:addResponse("I can't complain, even if some more action wouldn't be that bad.");
talkEntry:addResponse("Very good, and you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, danke der Nachfrage.");
talkEntry:addResponse("Ich kann nicht klagen, auch wenn ein bisschen mehr Abenteuer mal wieder nicht schlecht wäre.");
talkEntry:addResponse("Ganz gut, und euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Nanginis! Just call me Nanginis! 'Nargun' has granted me this name in a vision, but to be frank my real name is Peter, hihihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Nanginis! Nennt mich einfach Nanginis! 'Nargun' hat mir diesen Namen in einer Vision geschickt, aber unter uns, eigentlich heiße ich Peter. Hihihi.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("At the moment I have everything, but thanks for asking.");
talkEntry:addResponse("Maybe another time, I have already everything I need.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Derzeit habe ich alles, aber danke für eure Sorge.");
talkEntry:addResponse("Vielleicht ein anderes mal, derzeit habe ich alles was ich brauche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("I have no tasks for you right now, maybe another time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Ich habe derzeit keine Aufgaben für euch, vielleicht aber wann anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Hear the frogs, they are calling you, professional aswell! Hihi no, my profession is to preach the words of 'Nargun' and share his blessing with others.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Hört die Unke rufen, sie berufen euch und machen auch viel! Hihi nein, berufen bin ich die Worte Narguns zu verkünden und seinen Segen zu verbreiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hear the frogs, they are calling you, professional aswell! Hihi no, my profession is to preach the words of 'Nargun' and share his blessing with others.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Hört die Unke rufen, sie berufen euch und machen auch viel! Hihi nein, berufen bin ich die Worte Narguns zu verkünden und seinen Segen zu verbreiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Well it's an island, duh! I don't know more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addResponse("Nun, es ist eine Insel, bäh! Mehr weiß ich nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hihihi. Right, I may have found a new follower for Nargun with you. Misspronouncing words is what we do in our freetime. It's called Gobaith you idiot!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hihihi. Klar, in dir hab ich wohl einen neuen Nargun Anhänger gefunden. Wörter falsch aussprechen tun wir in unserer Freizeit. Es heißt Gobaith du Idiot!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Tell");
talkEntry:addTrigger("Benefication");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("For a small donation of 5 silvercoins you have the chance to receive something very special. Interested?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addTrigger("Tell");
talkEntry:addTrigger("Benefication");
talkEntry:addTrigger("Sure");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "<", 1));
talkEntry:addResponse("But we don't even know each other! Tell me your name and your favourite color first.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("yes");
talkEntry:addTrigger("Interested");
talkEntry:addTrigger("sure");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 2));
talkEntry:addResponse("#me unfolds a small piece of parchment and starts to read \"Nargun and his representatives do not take any responsibility for damage of property or health or infringement other interests which may occur to you or a third party due to the use of the offered service. Do you accept this agreement?\"");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Erzähl");
talkEntry:addTrigger("Segnung");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Für eine Spende von 5 Silberstücken hast du die Chance auf etwas Besonderes! Also, hast du Interesse?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Erzähl");
talkEntry:addTrigger("Segnung");
talkEntry:addTrigger("Sicher");
talkEntry:addTrigger("Klar");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "<", 1));
talkEntry:addResponse("Aber wir kennen uns doch garnicht! Sag mir zuerst deinen Namen und deine Lieblingsfarbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addTrigger("Interess");
talkEntry:addTrigger("Klar");
talkEntry:addTrigger("Sicher");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 2));
talkEntry:addResponse("#me nimmt ein kleines Pergament hervor und liest vor \"Nargun und seine Abgesandten übernehmen keinerlei Haftung für etwaige Schäden an Vermögen, Gesundheit oder anderen Interessensverletzungen die durch die angebotene Dienstleistung beim Auftraggebenden oder einem Dritten entstehen. Akzeptiert ihr diese Vereinbarung?\"");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addTrigger("i am");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "<", 1));
talkEntry:addResponse("Very good, very good! Nargun be beside you %CHARNAME. You didn't realy expect your favourite color to matter at all to me. Anyways, back to the blessing. Are you still interrested?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addTrigger("heiße");
talkEntry:addTrigger("ich bin");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "<", 1));
talkEntry:addResponse("Sehr schön, sehr schön! Nargun sei neben dir %CHARNAME. Du dachtest doch nicht wirklich dass die Farbe mich interessiert. Aber zurück zum Segen, noch interessiert?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("chance");
talkEntry:addTrigger("Special");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I can sweettalk Nargun for you! The effect of that usually reveals itself immidiately after the prayer! Interested?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Chance");
talkEntry:addTrigger("besonderes");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Ich kann bei Nargun ein gutes Wort für dich einlegen! Meistens zeigt sich der Erfolg sofort nach dem Gebet! Interessiert?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("donation");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("It's only 5 silvercoins which I will spend to 'worship' Nargun. I will chant a 'prayer' for you and it's effect will reveal itself at once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spende");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Es kostet dich nur 5 Silberstücke die ich zur 'Lobpreisung' Narguns verwenden werde. Ich werde ein 'Gebet' für dich sprechen und dessen 'Erfolg' wird sich sofort zeigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("worship");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Intoxicating substances don't pay for themselves, so I am forced to charge 5 silvercoins for a prayer, which will 'benefit' you greatly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lobpreisung");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Berauschende Substanzen bezahlen sich nicht von selbst, ich muss 5 Silberstücke verlangen für ein Gebet, das dir großen 'Nutzen' bereiten wird!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("success");
talkEntry:addTrigger("prayer");
talkEntry:addTrigger("chant");
talkEntry:addTrigger("benefit");
talkEntry:addTrigger("effect");
talkEntry:addCondition(npc.base.condition.quest.quest(63, ">", 1));
talkEntry:addResponse("He might turn you into a pig, or throw lightning down from the sky, gasbombs perhaps, or nothing at all might happen. But most likely he will 'gift' you a 'present'!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erfolg");
talkEntry:addTrigger("Gebet");
talkEntry:addTrigger("Nutzen");
talkEntry:addCondition(npc.base.condition.quest.quest(63, ">", 1));
talkEntry:addResponse("Er könnte dich in ein Schwein verwandeln, oder Blitze vom Himmel schleudern, oder Stinkwolken. Aber am wahrscheinlichsten wird er dir ein 'Geschenk' machen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("present");
talkEntry:addTrigger("Gift");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Nargun likes small glittery magical 'stones'. If he likes you he might share some with you, mayhaps he doesn't, he can be moody at times.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschenk");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Nargun mag kleine glitzernde magische 'Steinchen'. Wenn er dich mag teilt er vielleicht mit dir, vielleicht passiert aber auch garnichts, er ist manchmal launisch wisst ihr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stone");
talkEntry:addTrigger("Magic");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes! Stones that grant the one carrying them part of their power if you treat them nicely. Of course you've heard about those already. Are you... interrested then?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stein");
talkEntry:addTrigger("Magi");
talkEntry:addCondition(npc.base.condition.quest.quest(63, "=", 1));
talkEntry:addResponse("Ja! Steinchen die ihrem Träger was von ihrer Kraft abgeben wenn er sie lieb behandelt. Du hast sicher schon davon gehört. Also hast du Interesse?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(63, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fish");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You wonder what he could mean by this."));
talkEntry:addResponse("Oh yes! My 'lord' adores fish! And 'snowstorms'!");
talkEntry:addResponse("Fish is the answer, all 'chaos' derrives from the fish!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Snowstorm");
talkEntry:addTrigger("Chaos");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nothing pleases my lord 'Nargun' more than a bit of unpredictable, unleashed destruction, right? Hihihi");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("God");
talkEntry:addTrigger("Lord");
talkEntry:addTrigger("Deity");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bless the name of my lord, 'Nargun'! Or don't, or do it differently, or not at all.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Priest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Indeed! I am a priest of my god. And for a small donation I will let you have some of his blessing, how about it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vision");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yes! It only took 10 mugs of dwarven ale to please Nargun and make him speak to me. I still got that foul taste on my tongue!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ahh! Bless his name, we're close friends, you know. But that's what being a 'priest' is all about anyway.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fisch");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du fragst dich was er wohl damit meint."));
talkEntry:addResponse("Oh ja! Mein 'Herr' liebt Fisch! Und 'Schneestürme'!");
talkEntry:addResponse("Fisch ist die Antwort, alles 'Chaos' leitet sich aus dem Fisch ab!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schneest[uü]rm");
talkEntry:addTrigger("Chaos");
talkEntry:addResponse("Nichts erfreut meinen Herren 'Nargun' mehr als etwas unvorhersehbare unbändige Zerstörung, nicht wahr? Hihihi.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Herr");
talkEntry:addTrigger("Gott");
talkEntry:addResponse("Gepriesen sei mein Herr 'Nargun'! Oder auch nicht, oder anders, oder überhaupt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Priester");
talkEntry:addResponse("In der Tat! Ich bin ein Priester meines Gottes, für eine kleine Spende lass ich dich an seinem 'Segen' teilhaben, wie siehts aus?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Vision");
talkEntry:addResponse("Ja! Es hat nur 10 Krüge Zwergenbräu gebraucht um 'Nargun' gnädig zu stimmen mit mir zu sprechen. Der bittere Geschmack liegt mir noch immer auf der Zunge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ahh! Gelobt sei sein Name, wir verstehn uns, er und ich. Bringt das 'Priester' sein so mit sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addTrigger("i am");
talkEntry:addResponse("So what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addTrigger("heiße");
talkEntry:addTrigger("ich bin");
talkEntry:addResponse("Ja und?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spende");
talkEntry:addTrigger("Segen");
talkEntry:addResponse("Nichts ist umsonst auf der Welt, vieles sinnlos. Soll ich dir mehr über Narguns Segnung erzählen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blesseing");
talkEntry:addTrigger("Donation");
talkEntry:addResponse("Nothing's for free in this world, much is in vain. Do you want to learn more about Narguns 'benefication'?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Pah! Do I look like a merchant? I carry enough rubbish around with me, in my head!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Pah! Seh ich so aus als wäre ich ein Händler? Ich trag genug Trödel mit mir herum, in meinem Kopf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20));
talkEntry:addResponse("GERMAN1.");
talkEntry:addResponse("GERMAN2.");
talkEntry:addResponse("GERMAN3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
talkingNPC:addCycleText("GERMAN.", "ENGLISH.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Nanginis der Nargunpriester.", "This NPC is Nanginis the Nargunpriest.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 811);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 822);
mainNPC:setEquipment(10, 326);
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