--------------------------------------------------------------------------------
-- NPC Name: Bippi                                                       None --
-- NPC Job:  farmer                                                           --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  787, 795, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Ardian/Faladron/Rincewind                                        --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 787, 795, 0, 4, 'Bippi', 'npc.bippi', 0, 2, 0, 255, 255, 255, 230, 185, 143);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.bippi", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Bippi the peasant. Keywords: milk, cow, farmhand, quest, 'what is my task?'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Bippi der Bauer. Schlüsselwörter: Milch ,Kuh, Helfer, Aufgabe, 'Was ist meine Aufgabe?'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Hello");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milk sounds like a wonderful idea, but you better ask him what kind of milk he has first."));
talkEntry:addResponse("Oh greetings, traveler! How nice of you to drop by, can I offer you some fresh 'milk'?");
talkEntry:addResponse("Hey there! No offense but you sure look tired traveler. May I offer you some milk, it's deliciously replenishing!");
talkEntry:addResponse("Hiho! So you've found your way to ole Bippi. No doubt you are in search of my famous milk!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milch hört sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt."));
talkEntry:addResponse("Oh Grüße, Reisender! Besuch freut mich immer, darf ich Euch eine Schale 'Milch' anbieten?");
talkEntry:addResponse("Hallo da! Oh ihr seht aber müde aus. Darf ich Euch eine Schale Milch aufwarten, als Stärkung?");
talkEntry:addResponse("Hiho! Da habt Ihr also zum alten Bippi gefunden. Ihr kommt bestimmt um meine berühmte Milch zu probieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milk sounds like a wonderful idea, but you better ask him what kind of milk he has first."));
talkEntry:addResponse("Oh greetings, traveler! How nice of you to drop by, can I offer you some of my refreshing 'milk'?");
talkEntry:addResponse("Hello there! Oh you sure look tired, may I offer you some of my delicious milk, it's replenishing!");
talkEntry:addResponse("Hiho! So you've found your way to ole Bippi. No doubt you are in search my famous milk!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milch hört sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt."));
talkEntry:addResponse("Oh Grüße, Reisender! Besuch freut mich immer, darf ich Euch eine Schale 'Milch' anbieten?");
talkEntry:addResponse("Hallo da! Oh ihr seht aber müde aus. Darf ich Euch eine Schale Milch aufwarten, als Stärkung?");
talkEntry:addResponse("Hiho! Da habt ihr also zum alten Bippi gefunden. Ihr kommt bestimmt um meine berühmte Milch zu probieren.");
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
talkEntry:addResponse("Oh you're back, how nice! I think there's a new task waiting for you, but I might be wrong.");
talkEntry:addResponse("Good to see you again! Let's check if there's something to do for you.");
talkEntry:addResponse("Welcome, the cows have already inquired about you.");
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
talkEntry:addResponse("Oh wie schön, dass ihr zurück seid! Ich glaube es wartet eine neue Aufgabe auf Euch, ich kann mich aber auch irren.");
talkEntry:addResponse("Es ist schön Euch wiederzusehen. Lasst uns schauen ob es etwas für Euch zu tun gibt.");
talkEntry:addResponse("Willkommen, die Kühe haben schon nach Euch gefragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Oh you're back, that's nice! I think there's a new task waiting for you, but I might be wrong.");
talkEntry:addResponse("Good to see you again! Let's check if there's something to do for you.");
talkEntry:addResponse("Welcome, the cows have already inquired about you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Oh wie schön, dass Ihr zurück seid! Ich glaube es wartet eine neue Aufgabe auf Euch, ich kann mich aber auch irren.");
talkEntry:addResponse("Es ist schön Euch wiederzusehen. Lasst uns schauen ob es etwas für Euch zu tun gibt.");
talkEntry:addResponse("Willkommen, die Kühe haben schon nach Euch gefragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fare thee well and come back soon!");
talkEntry:addResponse("Goodbye, and don't forget to tell your friends about ole Bippi and his milk!");
talkEntry:addResponse("Oh, leaving already? A pity, good luck to ya in all your travels!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt Euch wohl und kommt bald mal wieder vorbei!");
talkEntry:addResponse("Auf bald! Erzählt euren Freunden vom alten Bippi und seiner Milch.");
talkEntry:addResponse("Oh, Ihr geht schon? Schade, viel Erfolg auf eurem weiteren Weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fare thee well and come back soon!");
talkEntry:addResponse("Goodbye, and don't forget to tell your friends about ole Bippi and his milk!");
talkEntry:addResponse("Oh, leaving already? A pity, good luck to ya in all your travels!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehabt Euch wohl und kommt bald mal wieder vorbei!");
talkEntry:addResponse("Auf bald! Erzählt euren Freunden vom alten Bippi und seiner Milch.");
talkEntry:addResponse("Oh, Ihr geht schon? Schade, viel Erfolg auf eurem weiteren Weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Ach, I feel my age creeping into my bones. Might be shameful but it's hard working the stables without help.");
talkEntry:addResponse("Ah my leg grows stiffer with each passing day it seems. I worry who will take care of my cows when one day I... *Grimaces*");
talkEntry:addResponse("Work is hard and I'm not growing any younger. I think it's about time I get some help with some of these tasks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Ach, ich spüre das Alter in meinen Knochen. Hätte ich doch nur jemanden der im Stall aushilft.");
talkEntry:addResponse("Ah mein Bein wird von Woche zu Woche steifer. Ich sorge mich schon wer sich um meine Kühe kümmern wird wenn ich einmal...");
talkEntry:addResponse("Die Arbeit ist hart und ich werde nicht jünger. Ich glaube ich brauche jemanden der mir meine Aufgaben abnimmt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I'm Bippi and my cows have the tastiest milk for miles.");
talkEntry:addResponse("Call me Bippi, peasant byI tend to this dairy farm you see.");
talkEntry:addResponse("My name ya say? Try tah speak up, I'm no spring chicken, but most call me Bippi, and everyone from here to Cadomyr knows I have the best milk! *Coughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid Ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der alte Bippi und meine Kühe geben die beste Milch weit und breit.");
talkEntry:addResponse("Nennt mich Bippi, ich bin Bauer und kümmere mich hier um meine Kühe.");
talkEntry:addResponse("Mein Name? Ich bin der Bippi und ich verkaufe meine Milch nach überall hin, sogar nach Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'I help you' if you want to help him."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("If you can help me tend to these cows I'll share some of my milk from my personal stock.");
talkEntry:addResponse("Well I could use some sturdy hands, if ya got the strength, will ya help me?");
talkEntry:addResponse("Could ya help me? I can't pay much but it'd mean a lot to me. The cows are all I got, and I can't tend to them like I used to.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sag 'Ich helfe Euch' wenn du ihm helfen möchtest."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Wenn Ihr Euch um meine Kühe kümmert, könnt Ihr auch etwas Milch haben. Helft Ihr mir?");
talkEntry:addResponse("Nun, ich könnte Hände die zupacken können gebrauchen. Wollt Ihr mir helfen?");
talkEntry:addResponse("Könntet Ihr mir helfen? Ich kann Euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'I help you' if you want to help him."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("If you can help me tend to these cows I'll share some of my milk from my personal stock.");
talkEntry:addResponse("Well I could use some sturdy hands, if ya got the strength, will ya help me?");
talkEntry:addResponse("Could ya help me? I can't pay much but it'd mean a lot to me. The cows are all I got, and I can't tend to them like I used to.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sag 'Ich helfe Euch' wenn du ihm helfen möchtest."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Wenn Ihr Euch um meine Kühe kümmert, könnt Ihr auch etwas Milch haben. Helft Ihr mir?");
talkEntry:addResponse("Nun, ich könnte Hände die zupacken können gebrauchen. Wollt Ihr mir helfen?");
talkEntry:addResponse("Könntet Ihr mir helfen? Ich kann Euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I raise dairy cattle in order to sell their milk.");
talkEntry:addResponse("I'm a peasant byand specialize in tending to dairy cows.");
talkEntry:addResponse("I live and work on this farm breeding the best dairy cattle from here to Cadoymr. I sell their milk with great pride!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich ziehe Kühe groß um dann deren Milch zu verkaufen.");
talkEntry:addResponse("Ich bin Bauer und habe mich auf Milchkuh Haltung spezialisiert.");
talkEntry:addResponse("Ich lebe und arbeite hier als Kuhzüchter. Die gemolkene Milch verkaufe ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addResponse("I raise dairy cattle in order to sell their milk.");
talkEntry:addResponse("I'm a peasant byand specialize in tending to dairy cows.");
talkEntry:addResponse("I live and work here breeding the best dairy cattle from here to Cadoymr. I sell their milk with great pride!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich ziehe Kühe groß um dann deren Milch zu verkaufen.");
talkEntry:addResponse("Ich bin Bauer und habe mich auf Milchkuh Haltung spezialisiert.");
talkEntry:addResponse("Ich lebe und arbeite hier als Kuhzüchter. Die gemolkene Milch verkaufe ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Never heard of it, are there cows there?");
talkEntry:addResponse("Gobaith sounds lush somehow, like a meadow of the greenest grass. Nothing better for cows you know?");
talkEntry:addResponse("Gobaith you say, I've no clue where that is. Gotta be honest, I've never been one for travel I find it too scary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Davon hab ich noch nie gehört. Gibt es dort Kühe?");
talkEntry:addResponse("Gobaith klingt irgendwie sehr saftig. Wie eine grüne Wiese besten Grases für die Kühe.");
talkEntry:addResponse("Ah ich habs gehört. Ich glaube dort sieht es jetzt so aus wie auf dem Donnerbalken wenn man zu viel Milch getrunken hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you! Let's celebrate with a glass of milk.");
talkEntry:addResponse("That name is pleasant to the tongue, but not as pleasant as a glass of my fresh milk.");
talkEntry:addResponse("Well met traveler. You look like someone who'd appreciate a fine glass of milk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Schön dich kennenzulernen! Lass uns darauf anstoßen mit einem Glas Milch.");
talkEntry:addResponse("Das ist aber ein hübscher Name. Zergeht auf der Zunge wie ein kräftiger Schluck Milch.");
talkEntry:addResponse("Sehr erfreut. Ihr seht wie jemand aus der ein Glas bester Milch zu schätzen weiß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Milk");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You want to know more about the cows."));
talkEntry:addResponse("Why of course, help yourself! Good, isn't it? My 'cows' give extraordinarily delicious milk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Cow");
talkEntry:addResponse("I'm proud of my cows! I earn my living with their milk. If only I had someone to help me with all the work...");
talkEntry:addResponse("I'm getting older and the work is getting harder to do by myself. I could really use some help in the stable, but who would care for a task like that...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stable");
talkEntry:addResponse("Yes, my cows are in the stable, unless they're in the meadow grazing.");
talkEntry:addResponse("My stable is the big building to the right of us.");
talkEntry:addResponse("It may not look like much but just three stales is all I need to survive, my cows are great! *Coughs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("work");
talkEntry:addTrigger("stablehand");
talkEntry:addTrigger("farmhand");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'I help you' if you want to help him."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Once you tend to my cows, I'll give you some delicious milk. Will you help me?");
talkEntry:addResponse("Well, I could use some sturdy hands. Will you help me?");
talkEntry:addResponse("Could you help me? I can't pay you much but it'd mean a lot to me and ease me of some worries.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Milch");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du möchtest mehr über die Kühe erfahren."));
talkEntry:addResponse("Aber bitte nehmt nur und bedient Euch! Schmeckts? Meine 'Kühe' geben eine besonders wohlschmeckende Milch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Kuh");
talkEntry:addTrigger("Kühe");
talkEntry:addResponse("Meine Kühe sind mein ganzer Stolz! Außerdem sichern sie mir meine Existenz. Wenn ich nur jemanden hätte der mir mit all der Arbeit hilft...");
talkEntry:addResponse("Ich werde alt und die Arbeit mit den Kühen wird für mich immer schwerer. Ich könnte Hilfe im Stall gebrauchen aber wer nimmt sich schon so einer Aufgabe an...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stall");
talkEntry:addResponse("Ja, im Stall stehen meine Kühe, wenn sie nicht gerade weiden.");
talkEntry:addResponse("Mein Stall ist das große Gebäude rechts von uns.");
talkEntry:addResponse("Drei Kühe passen in meinen Stall, toll oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addTrigger("Arbeit");
talkEntry:addTrigger("helfer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sag 'Ich helfe Euch' wenn du ihm helfen möchtest."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Wenn Ihr Euch um meine Kühe kümmert, könnt Ihr auch etwas Milch haben. Helft Ihr mir?");
talkEntry:addResponse("Nun, ich könnte Hände die zupacken können gebrauchen. Wollt Ihr mir helfen?");
talkEntry:addResponse("Könntet Ihr mir helfen? Ich kann Euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yewdale");
talkEntry:addResponse("Yewdale is the name of this place; just a cottage of peaceful farmers. There is not much to do here except watching the crops grow.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eibenthal");
talkEntry:addTrigger("Eibental");
talkEntry:addResponse("Eibenthal heißt dieser Ort hier; es ist einfach nur ein Hof friedlicher Bauern. Hier kann man nicht viel tun außer dem Gras beim Wachsen zuzusehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nana");
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Nana over there is the local cook. I overheard she might need help with a recipe of her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nana");
talkEntry:addTrigger("Winterbutter");
talkEntry:addResponse("Nana dort drüben ist hier die Köchin. Ich hörte, sie könnte etwas Hilfe bei einem ihrer Rezepte gebrauchen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I am proud to say that archmage Morgan never starts a day without a glass of my milk!");
talkEntry:addResponse("They say when the archmage is doing research the only signs of life are the empty milk bottles and dishes he summons to the front of his chambers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich bin stolz sagen zu können, dass Erzmagier Morgan keinen Tag ohne ein Glas meiner Milch beginnt!");
talkEntry:addResponse("Es heißt die einzigen Lebenszeichen des Erzmagiers über Wochen hinweg wären die leeren Milchflaschen und anderes Geschirr das er vor die Tür seiner Gemächer zaubert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I am proud to say that archmage Morgan never starts a day without a glass of my milk!");
talkEntry:addResponse("They say when the archmage is doing research the only signs of life are the empty milk bottles and dishes he summons to the front of his chambers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich bin stolz sagen zu können, dass Erzmagier Morgan keinen Tag ohne ein Glas meiner Milch beginnt!");
talkEntry:addResponse("Es heißt die einzigen Lebenszeichen des Erzmagiers über Wochen hinweg wären die leeren Milchflaschen und anderes Geschirr, das er vor die Tür seiner Gemächer zaubert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("What would you call a town full of weak mages and bad bone structure? I call it paradise!");
talkEntry:addResponse("Runewick, by far most of my customers live there!");
talkEntry:addResponse("An impressive place, I would've moved there already, but alas, the cows don't take the sea breeze there well.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Wie würdet ihr eine Stadt voller kränklicher Magier mit schwachem Knochenbau nennen? Ich nenne es Paradies!");
talkEntry:addResponse("Runewick, da befindet sich mit Abstand mein größter Kundenstock.");
talkEntry:addResponse("Ein beeindruckender Ort. Ich würde gerne dort leben aber die Kühe vertragen die Seeluft nicht so gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The Don doesn't care about milk. Luckily, Runewick is near enough not to be offered the Dons 'protection'.");
talkEntry:addResponse("He never buys from me, but if ya ever see him I swear it looks like he drinks milk day and night. *Chuckles*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Don macht sich nichts aus Milch. Gut dass Runewick nahe genug ist um nicht seinen 'Schutz' angeboten zu bekommen.");
talkEntry:addResponse("Wenn man sich den Don so ansieht möchte man meinen er tränke nichts anderes als Milch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Few years back Galmair forced me to yield over my cattle. Poor Bessies I doubt they lasted a week without grass in those dismal caves.");
talkEntry:addResponse("Aaah, those folks in Galmair need to take better care of themselves by drinking my nutritious milk, instead, they choose to buy alcohol. What a pity.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Man hat mich einmal gezwungen meine besten Milchkühe der Stadt zu überlassen. Natürlich gaben sie bei dem kargen Gras dort keine gute Milch.");
talkEntry:addResponse("Obwohl sie bei den harten Bedingungen dort oben in den Bergen die Kraft aus Milch gut brauchen könnten, sprechen sie doch lieber dem Alkohol zu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("A pity the queen swears on donkey milk to use in her bath.");
talkEntry:addResponse("If my cows were mules, all I would do is produce milk for the bath of the queen and I would be rich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Leider schwört die Königin auf Eselsmilch um ihr Bad zu nehmen.");
talkEntry:addResponse("Wären meine Kühe Esel, ich bräuchte nur für das Bad der Königin zu arbeiten und hätte ausgesorgt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("A pity the queen swears on donkey milk to use in her bath.");
talkEntry:addResponse("If my cows were mules, all I would do is produce milk for the bath of the queen and I would be rich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Leider schwört die Königin auf Eselsmilch um ihr Bad zu nehmen.");
talkEntry:addResponse("Wären meine Kühe Esel, ich bräuchte nur für das Bad der Königin zu arbeiten und hätte ausgesorgt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("*Sighs* I wish Cadomyr wasn't so hot it's too hard to keep good milk there. Only a chosen few appreciate my milk from those parts.");
talkEntry:addResponse("Folks that know what's good for them and have the coin gladly transport my milk back to Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Wegen der Hitze dort wird leider nicht viel Milch getrunken. Nur wenige wissen meine Milch dort zu schätzen.");
talkEntry:addResponse("Ein paar Kenner lassen es sich viel kosten um meine Milch nach Cadomyr geliefert zu bekommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I've heard cows are treated better than peasants there, scares the cow pies right out of me!");
talkEntry:addResponse("Children in Albar are said to be weaned from breast milk very early. Milk is a symbol for weakness there, they say.");
talkEntry:addResponse("A lot of milk in Albar is wasted on making smelly cheese, that's just awful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich habe gehört die Kühe werden dort besser behandelt als die Bauern, schauerlich.");
talkEntry:addResponse("In Albar sollen Kinder sehr früh der Muttermilch entwöhnt werden. Milch wird mit Schwäche assoziert heißt es.");
talkEntry:addResponse("Viel Milch in Albar wird vergeudet um sie zu stinkendem Käse zu verarbeiten. Schrecklich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("If you want to order milk in Gynka, you'll only get it in a dirty glass.");
talkEntry:addResponse("Gynk people don't care that much about milk.");
talkEntry:addResponse("I heard many cows get sick there because of all the swamps nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Wenn man in Gynk Milch bestellen will, bekommt man es nur in einem schmutzigen Glas.");
talkEntry:addResponse("Die Leute aus Gynk machen sich nicht viel aus Milch.");
talkEntry:addResponse("Ich hörte viele Kühe dort werden krank wegen den Sümpfen in der Nähe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Some 'scholars' of Salkamar are rumored to be working on creating milk out of plants. How could they!?");
talkEntry:addResponse("I've heard stories about the rolling hills of lush green grass covering the Salkamaerian countryside, and it makes me wonder what kind of milk their cows make.");
talkEntry:addResponse("A traveler from Salkamar told me he'd never lie with a woman named Sam again. Whatever that means? *Shrugs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ein paar 'Gelehrte' in Salkamar sollen versuchen Milch aus Pflanzen zu gewinnen. Wie kann man nur!?");
talkEntry:addResponse("Es soll Leute dort geben die mischen ihre Milch mit heißem Wasser und Kräutern. Verrückt, nicht?");
talkEntry:addResponse("In manchen gehobenen Kreisen Salkamars gilt das Tragen eines Milchbarts als schicklich! Glaube ich.");
talkEntry:addResponse("Ein Reisender aus Salkamar erzählte mir er werde nie wieder mit einer Frau die Sam heißt schlafen. Was auch immer das bedeutet? *zuckt mit den Schultern*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Ah, the gods... makes me think of my service to Adron and Oldra, I hope I am serving them well!");
talkEntry:addResponse("I'm no expert about the gods, but I know that the elder gods left Illarion in the hands of our beloved younger gods.");
talkEntry:addResponse("Please don't ask me to name them, reminds me of my mum and how she tried to teach me their names, gods rest her soul. *Sighs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ah, die Götter... gut das du mich erinnerst ,Ich muss noch meine Verpflichtungen gegenüber Adron und Oldra erfüllen, ich hoffe ich diene Ihnen gut!");
talkEntry:addResponse("Ich bin kein Götterexperte, aber ich weiß dass die Elder Götter, Illarion in die Hand unserer geliebten jungen Götter übergeben haben");
talkEntry:addResponse("Frag mich ja nicht danach sie jetzt aufzuzählen, das erinnert mich an meine Mutter die auch versuchte mir die Namen der Götter beizubringen, die Götter seien Ihrer Seele gnädig. *seufzt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("After a long feast there's nothing better to get on track than a glass of milk, even Adron knows that!");
talkEntry:addResponse("Adron loves beverages, milk is a beverage, I love milk, and thus we share a love for milk.");
talkEntry:addResponse("A long time ago, I became very ill, and as I lay shivering with fever a wanderer came. He stayed weeks with me and nursed me back to health then without a trace he vanished. To this very day I know Adron was that wanderer!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Nach einem langen Fest gibt es nichts besseres um wieder zu Kräften zu kommen als ein Glas Milch, das weiß auch Adron.");
talkEntry:addResponse("Adron liebt Getränke. Milch ist ein Getränk. Ich liebe Milch. Also teilen wir eine Liebe zur Milch.");
talkEntry:addResponse("For langer Zeit wurde ich schwer krank. Ein Wanderer fand mich zitternd vor Fieber im Stall und pflegte mich gesund. Ich glaube er war das!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("I'm sorry. I don't pray to that deity so I can't say much about him.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and bless me with success, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("The name sounds familiar, I'm pretty sure she is a goddess of sorts, but past that I can't help ya.");
talkEntry:addResponse("One of the younger gods I think. I look to Adron and Oldra to take care of my farm and me, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Dieser Name kommt mir bekannt vor, ich bin mir sicher dass sie eine Göttin ist, aber mehr kann ich dazu nicht sagen");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Not a clue on that one traveler.");
talkEntry:addResponse("Sounds like a pretty name for a girl, perhaps if... naah I'm too old. *Chuckles*");
talkEntry:addResponse("Uh... Elara? Who's that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Diesen Wandere kenne ich nicht.");
talkEntry:addResponse("Klingt nach einem netten Mädchennamen, vielleicht wenn ich ? nee, ich bin zu alt dazu *lacht*");
talkEntry:addResponse("Hm.... Elara? Wer ist das?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan? Who's that?");
talkEntry:addResponse("Eldan... Eldan... sounds familiar. *Shrugs*");
talkEntry:addResponse("You think Eldan would like some milk?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Eldan? Wer ist das?");
talkEntry:addResponse("Eldan...Eldan ... dieser Name sagt mir irgendwas.*zuckt mit den Schultern*");
talkEntry:addResponse("Meint Ihr Eldan mag Milch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Now that is a pretty name, Findari!");
talkEntry:addResponse("Pretty sure she is one of the elder gods.");
talkEntry:addResponse("My mum always said I never paid attention, I think she is a god of sorts but... *Shrugs*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Na, das ist ja mal ein schöner Name, Findari!");
talkEntry:addResponse("Ich bin mir ganz sich das sie eine der alten Götter ist. ");
talkEntry:addResponse("Meine Mutter sagte immer ich hätte nie aufgepasst, ich denke Findari ist eine Göttin, oder so ähnlich...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("I've heard a dwarf mention his name a time or two, is he their king?");
talkEntry:addResponse("Not a clue who Irm- whatever is but I've heard a dwarf say his name before.");
talkEntry:addResponse("What was that name again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ich habe gehört wie Zwerg den ofter mal erwähnt haben, ist das ihr König?");
talkEntry:addResponse("Ich habe keinen Schimmer wer Irmo-wie-auch-immer ist, aber ich hörte schon Zwerge seinen Namen nennen.");
talkEntry:addResponse("Wie war das Name noch gleich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("I've heard those folks from Cadomyr mention his name, that's about all I can tell you.");
talkEntry:addResponse("Malachin, I think he lives in Cadomyr.");
talkEntry:addResponse("I think you should ask someone in Cadomyr about him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ich glaube diese Leute in Cadomyr spachen von ihm, das ist allen was ich dir sagen kann.");
talkEntry:addResponse("Malachin, ich glaube er lebt in Cadomyr.");
talkEntry:addResponse("Besser wenn Ihr jemanden aus Cadomyr nach ihm fragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Oh stop talking about that one! Else the milk will turn sour.");
talkEntry:addResponse("*Cringes* I don't like that name at all and refuse to talk about him.");
talkEntry:addResponse("I am hospitable, but there is nothing in the world worth giving him a glass of milk!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Hört mir bloß auf von dem! Sonst wird noch die Milch sauer.");
talkEntry:addResponse("Kaum jemand hat so boshaft so viel Milch verschüttet wie er.");
talkEntry:addResponse("Ich bin gastfreundlich. Aber um nichts in der Welt würde er ein Glas Milch von mir bekommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Nargun... Nargun... nope never heard that name before.");
talkEntry:addResponse("Sounds like a plant.");
talkEntry:addResponse("I gotta be honest I am just a simple peasant I don't know such things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Nargun...Nargun...nein, den Namen habe ich noch nie gehört.");
talkEntry:addResponse("Das klingt nach einer Pflanze.");
talkEntry:addResponse("Um ehrlich zu sein, ich bin nur ein einfacher Bauer, ich kenne mich mit solchen Dingen nicht aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Thanks to her, plants grow, my cows have something to eat, and I have milk to drink!");
talkEntry:addResponse("Oldra, blessed be her name. We have many thanks to give to her! Without her there'd be no creation or crops to grow.");
talkEntry:addResponse("She is the goddess of life and fer-Fert... fertileness, without her we could not eat or mate!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Wegen ihr gedeihen die Pflanzen, und diese wiederum ermöglichen es dass meine Kühe Milch geben!");
talkEntry:addResponse("Oldra, ja. Ihr haben wir doch alles zu verdanken. Ohne die Früchte der Erde würden wir alle verhungern.");
talkEntry:addResponse("Sie ist die höchste Gottheit von allen, ohne ihre Schöpfung würde alles andere vor Hunger umkommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Runagain? Afraid you are mistaken I never run, too old. *Chuckles*");
talkEntry:addResponse("Name sounds familiar, but that's about it.");
talkEntry:addResponse("Can't say I know who that is, friend of yours?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Den Namen habe ich schonmal gehört, mehr kann ich dazu wirklich nicht sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Ich weiß nicht wer das ist. Ist er ein Freund von Euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Oh, that is a nice name.");
talkEntry:addResponse("There was a group of half dressed women that stopped by the farm shouting her name a few months back. If you ask me I hope she is a seamstress.");
talkEntry:addResponse("Heard that name a few times, every one of them human, and if you ask me a bit strange.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Oh, das ist ein schöner Name.");
talkEntry:addResponse("For ein paar Monaten kam hiereine Gruppe halb bekleideter Frauen vorbei, die haben diesen Namen gerufen. Wenn Ihr mich fragt, ich hoffe sie ist eine Schneiderin.");
talkEntry:addResponse("Den Namen hört ich bereits, jedesmal von Menschen gesprochren, die etwas seltsam waren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora? Never heard that name before.");
talkEntry:addResponse("Apologies but I am just a simple peasant not the best source for information.");
talkEntry:addResponse("What was that name again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tanora? Diesen Namen hab ich ja noch nie gehört.");
talkEntry:addResponse("Entschuldigt, aber ich bin nur ein einfacher Bauer und nicht gerade die beste Informationsquelle für soetwas.");
talkEntry:addResponse("Wie war der Name noch gleich?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I don't have a clue who that is honestly.");
talkEntry:addResponse("I'm sorry were you talking to me?");
talkEntry:addResponse("*Yawns* Who?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ich weiß um ehrlich zu sein nicht wer das ist.");
talkEntry:addResponse("Oh, Entschuldigung, sprecht Ihr mit mir?");
talkEntry:addResponse("*gähnt* Wer?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Now I know I've heard that name before, ask me again later when I've had a moment to think.");
talkEntry:addResponse("Zhambra... Zhambra... oh, that is one of the younger gods.");
talkEntry:addResponse("I think he is the god of thorns or friends... one of the two.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ich weiß das ich den Namen mal gehört habe, gebt mit etwas Zeit zum denken.");
talkEntry:addResponse("Zhambar....Zhambar... oh, einer der jungen Götter.");
talkEntry:addResponse("Ich glaube er ist der Gott der Trohne oder Freunde ? eines von beidem.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell cow's milk, but I have a lot of orders right now. It's delicious, tell you what if you help me out we'll see what we can do.");
talkEntry:addResponse("I sell my famous cow's milk! It's sold quicker than I can bottle it up. So I don't have any to sell right now.");
talkEntry:addResponse("Milk milk milk! Milk is healthy and tasty, and it fills my pockets with lots of copper coins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe die Milch meiner Kühe, aber ich habe so viele Bestellungen, Euch kann ich nichts abgeben. Außer ihr macht Euch nützlich.");
talkEntry:addResponse("Meine Milch verkauf ich! Die geht schneller weg als ich sie abfüllen kann, ihr könnt leider nichts davon haben.");
talkEntry:addResponse("Milch Milch Milch! Milch ist gesund und wohlschmeckend. Und sie füllt meine Taschen mit Kupfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Well you don't look like a cattle breeder, otherwise I would talk about my work.");
talkEntry:addResponse("My Greatgrandfather started this farm with his knowledge about cows, today I am the only one that knows all his secrets.");
talkEntry:addResponse("Well currently I only have one thing on my mind, work. I could really use a farmhand if you're willing to help?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Nun, ihr seht nicht aus wie ein Viehzüchter, sonst würde ich über die Arbeit sprechen.");
talkEntry:addResponse("Mein Großgroßvater hat angefangen sein Wissen über Milchkühe weiterzugeben, heute bin ich der, der alle Geheimnisse kennt.");
talkEntry:addResponse("Nun, wenn ihr so bittet. Ich glaube ich brauche Helfer um die Arbeit zu bewältigen, wie wäre es mit Euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bippi");
talkEntry:addResponse("That's my name and milk is my business.");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("That's me! Ask me again, I'll tell ya the same.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bippi");
talkEntry:addResponse("Das ist mein Name und die Milch ist mein Geschäft.");
talkEntry:addResponse("Hiho!");
talkEntry:addResponse("Das bin ich! Frag mich erneut, und Ich erzähle dir das selbe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("That's true! Let's have a glass of milk to celebrate.");
talkEntry:addResponse("Absolutely! Even my cows understand.");
talkEntry:addResponse("#me nods leisurely: 'My grandfather used to say that all the time.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Richtig so! Darauf trinken wir ein Glas Milch.");
talkEntry:addResponse("Absolut! Sogar meine Kühe verstehen das.");
talkEntry:addResponse("#me nickt müßig: 'Mein Großvater sagte das auch immer.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Ah? Can a glass of milk change your mind?");
talkEntry:addResponse("That's sad, still you should try my milk.");
talkEntry:addResponse("Don't be that negative! Drink a bit of milk and everything will turn out well!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Ah? Kann ein Glas Milch dich umstimmen?");
talkEntry:addResponse("Das ist schade. Aber meine Milch solltest du trotzdem probieren.");
talkEntry:addResponse("Sei nicht so negativ! Trink ein wenig Milch und alles wird gut!");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me plagt sich damit einen schweren Eimer Getreide zu heben.", "#me struggles desperately lifting a heavy bucket of grain.");
talkingNPC:addCycleText("#me sieht sich traurig um und seufzt: 'So viel zu tun...'", "#me looks arround with a worried frown: 'So much to do...");
talkingNPC:addCycleText("#me nimmt einen großen Schluck aus einer Flasche: 'Mhh... Milch.'", "#me takes a big gulp from a bottle: 'Mhh... milk.'");
talkingNPC:addCycleText("Trinkt ihr brav Milch?", "Got milk?");
talkingNPC:addCycleText("Cheeseball, Mjilka, Betsy! Es wird Zeit Euch zu melken!", "Cheeseball, Mjilka, Betsy! Time to milk you!");
talkingNPC:addCycleText("Milch ist gesund! Macht die Knochen stark, nicht wund!", "Milk is so tasty, so always be hasty, to drink for your bones, and soon they'll be hard as stones!");
talkingNPC:addCycleText("Früher sah der Hof und der Arbeitsaufwand hier viel kleiner aus...", "I never remember my work being this difficult or stressful, oh, I hate getting old... *Sighs*");
talkingNPC:addCycleText("Wo man Milch trinkt da lass dich gern nieder.", "Where there's milk to be drunk, one can come and rest with ease and keep his heart content.");
talkingNPC:addCycleText("Hallo! Ja ihr da! Wolltet ihr schon mal auf einem Hof arbeiten?", "Hello! Yes you over there! Have you ever considered working on a farm?");
talkingNPC:addCycleText("Hat man Milch getrunken kann nichts mehr in die Hose gehen! Hmm, wobei...", "Once you've tried milk, you'll never go back!");
talkingNPC:addCycleText("Die Milch macht's!", "Milk makes the mighty, mightier!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Das ist Bippi der Bauer.", "This is Bippi the peasant.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 457);
mainNPC:setEquipment(11, 196);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 183);
mainNPC:setEquipment(10, 369);
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