--------------------------------------------------------------------------------
-- NPC Name: Bippi                                                       None --
-- NPC Job:  none                                                             --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  514, 741, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: August 09, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.bippi", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Bippi the peasant. Keyphrases: milk,cow,farmhand,quest,'what is my task?'."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Bippi der Bauer. Schlüsselwörter: Milch,Kuh,Helfer,Aufgabe,'Was ist meine Aufgabe?'."));
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
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milk sounds like a wonderful idea, but you better ask him first what kind of milk he has."));
talkEntry:addResponse("Oh greetings, traveler! How nice of you to drop by, can I offer you a bowl of 'milk'?");
talkEntry:addResponse("Hello there! Oh you sure look tired. May I offer you a bowl of milk, it's replenishing.");
talkEntry:addResponse("Hiho! So you've found your way to old Bippi here. You're here to try my famous milk, I guess?");
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
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milch hört sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt."));
talkEntry:addResponse("Oh Grüße, Reisender! Besuch freut mich immer, darf ich euch eine Schale 'Milch' anbieten?");
talkEntry:addResponse("Hallo da! Oh ihr seht aber müde aus. Darf ich euch eine Schale Milch aufwarten, als Stärkung?");
talkEntry:addResponse("Hiho! Da habt ihr also zum alten Bippi gefunden. Ihr kommt bestimmt um meine berühmte Milch zu probieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milk sounds like a wonderful idea, but you better ask him first what kind of milk he has."));
talkEntry:addResponse("Oh greetings, traveler! How nice of you to drop by, can I offer you a bowl of 'milk'?");
talkEntry:addResponse("Hello there! Oh you sure look tired. May I offer you a bowl of milk, it's replenishing.");
talkEntry:addResponse("Hiho! So you've found your way to old Bippi here. You're here to try my famous milk, I guess?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Milch hört sich jetzt sehr verlockend an, aber du fragst ihn besser vorher um was für eine Milch es sich handelt."));
talkEntry:addResponse("Oh Grüße, Reisender! Besuch freut mich immer, darf ich euch eine Schale 'Milch' anbieten?");
talkEntry:addResponse("Hallo da! Oh ihr seht aber müde aus. Darf ich euch eine Schale Milch aufwarten, als Stärkung?");
talkEntry:addResponse("Hiho! Da habt ihr also zum alten Bippi gefunden. Ihr kommt bestimmt um meine berühmte Milch zu probieren.");
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
talkEntry:addResponse("Oh you're back, that's nice! I think there's a new task waiting for you, but I might be wrong.");
talkEntry:addResponse("Good to see you again! Let's check if there's something to do for you.");
talkEntry:addResponse("Welcome, the cows have already inquired about you.");
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
talkEntry:addResponse("Oh wie schön, dass ihr zurück seid! Ich glaube es wartet eine neue Aufgabe auf euch, ich kann mich aber auch irren.");
talkEntry:addResponse("Es ist schön euch wiederzusehen. Lasst uns schauen ob es etwas für euch zu tun gibt.");
talkEntry:addResponse("Willkommen, die Kühe haben schon nach euch gefragt.");
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
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Oh wie schön, dass ihr zurück seid! Ich glaube es wartet eine neue Aufgabe auf euch, ich kann mich aber auch irren.");
talkEntry:addResponse("Es ist schön euch wiederzusehen. Lasst uns schauen ob es etwas für euch zu tun gibt.");
talkEntry:addResponse("Willkommen, die Kühe haben schon nach euch gefragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Fare thee well and come back soon!");
talkEntry:addResponse("Goodbye! Tell your friends about old Bippi and his milk.");
talkEntry:addResponse("Oh, leaving already? A pity, good luck on your further travels!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Gehabt euch wohl und kommt bald mal wieder vorbei!");
talkEntry:addResponse("Auf bald! Erzählt euren Freunden vom alten Bippi und seiner Milch.");
talkEntry:addResponse("Oh, ihr geht schon? Schade, viel Erfolg auf eurem weiteren Weg!");
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
talkEntry:addResponse("Fare thee well and come back soon!");
talkEntry:addResponse("Goodbye! Tell your friends about old Bippi and his milk.");
talkEntry:addResponse("Oh, leaving already? A pity, good luck on your further travels!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Gehabt euch wohl und kommt bald mal wieder vorbei!");
talkEntry:addResponse("Auf bald! Erzählt euren Freunden vom alten Bippi und seiner Milch.");
talkEntry:addResponse("Oh, ihr geht schon? Schade, viel Erfolg auf eurem weiteren Weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Ach, I feel my age creeping up my bones. If only I had someone to help in the stable.");
talkEntry:addResponse("Ah my leg grows stiffer each passing week. I worry who will take care of my cows when one day I...");
talkEntry:addResponse("Work is hard and I'm not growing any younger. I think I need someone to take care of some of my tasks.");
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
talkEntry:addResponse("I'm old Bippi and my cows have the tastiest milk for miles.");
talkEntry:addResponse("Call me Bippi. I'm a peasant and tend my cows here on this farm.");
talkEntry:addResponse("My name? I'm Bippi and I sell my milk everywhere, even as far away as Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin der alte Bippi und meine Kühe geben die beste Milch weit und breit.");
talkEntry:addResponse("Nennt mich Bippi, ich bin Bauer und kümmere mich hier um meine Kühe.");
talkEntry:addResponse("Mein Name? Ich bin der Bippi und ich verkaufe meine Milch nach überall hin, sogar nach Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I sell cow milk, but I have a lot of orders, I can't sell any to you. Unless you help me of course.");
talkEntry:addResponse("I sell my milk! It's sold quicker than I can bottle it up, I'm sorry but you can't have any of it.");
talkEntry:addResponse("Milk milk milk! Milk is healthy and tasty, and it fills my pockets with lots of copper coins .");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe die Milch meiner Kühe, aber ich habe so viele Bestellungen, euch kann ich nichts abgeben. Außer ihr macht euch nützlich.");
talkEntry:addResponse("Meine Milch verkauf ich! Die geht schneller weg als ich sie abfüllen kann, ihr könnt leider nichts davon haben.");
talkEntry:addResponse("Milch Milch Milch! Milch ist gesund und wohlschmeckend. Und sie füllt meine Taschen mit Kupfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Well you don't look like a cattle breeder, otherwise I would talk about my work.");
talkEntry:addResponse("My Greatgrandfather has started to pass on his knowledge about cows, today I am the one knowing all secrets.");
talkEntry:addResponse("Well if you ask like that. I think I need farmhands to cope with all the work, maybe you want to help me?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Nun, ihr seht nicht aus wie ein Viehzüchter, sonst würde ich über die Arbeit sprechen.");
talkEntry:addResponse("Mein Großgroßvater hat angefangen sein Wissen über Milchkühe weiterzugeben, heute bin ich der, der alle Geheimnisse kennt.");
talkEntry:addResponse("Nun, wenn ihr so bittet. Ich glaube ich brauche Helfer um die Arbeit zu bewältigen, wie wäre es mit euch?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I raise cows in order to sell their milk.");
talkEntry:addResponse("I'm a peasant and I specialized in tending dairy cows.");
talkEntry:addResponse("I live and work here as a cattle breeder. I sell the milk I've milked.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("I raise cows in order to sell their milk.");
talkEntry:addResponse("I'm a peasant and I specialized in tending dairy cows.");
talkEntry:addResponse("I live and work here as a cattle breeder. I sell the milk I've milked.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I raise cows in order to sell their milk.");
talkEntry:addResponse("I'm a peasant and I specialized in tending dairy cows.");
talkEntry:addResponse("I live and work here as a cattle breeder. I sell the milk I've milked.");
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
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Never heard about it. Are there cows at that place?");
talkEntry:addResponse("Gobaith sounds lush somehow. Like a meadow of the greenest grass, best thing for cows.");
talkEntry:addResponse("Ah I heard about it. I think it looks like a latrine after being visited by someone who drank too much milk now.");
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
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you! Let's celebrate this with a glass of milk.");
talkEntry:addResponse("That name is pleasant to the tongue. Like a big gulp of milk.");
talkEntry:addResponse("Wellmet. You look like someone who'll appreciate a fine glass of milk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Schön dich kennenzulernen! Lass uns darauf anstoßen mit einem Glas Milch.");
talkEntry:addResponse("Das ist aber ein hübscher Name. Zergeht auf der Zunge wie ein kräftiger Schluck Milch.");
talkEntry:addResponse("Sehr erfreut. Ihr seht wie jemand aus der ein Glas bester Milch zu schätzen weiß.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milk");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("You want to know more about the cows."));
talkEntry:addResponse("Why of course, help yourself! Good, isn't it? My 'cows' give an extraordinary delicious milk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cow");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addResponse("I'm proud of my cows! I earn my living with their milk. If only I had someone to help me with all the work...");
talkEntry:addResponse("I'm getting older and the work with the cows gets harder all by myself. I could use some help in the stable, but who would care for a task like that...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stable");
talkEntry:addResponse("Yes, my cows are in the stable, unless they are on the meadow grazing.");
talkEntry:addResponse("My stable is the big building to the right of us.");
talkEntry:addResponse("Three cows fit into my stable, isn't that wonderful?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("work");
talkEntry:addTrigger("stablehand");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'I help you' if you want to help him."));
talkEntry:addResponse("Once you tend to my cows, you may have some milk. Will you help me?");
talkEntry:addResponse("Well I could use some sturdy helping hands. Will you help me?");
talkEntry:addResponse("Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milch");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Du möchtest mehr über die Kühe erfahren."));
talkEntry:addResponse("Aber bitte nehmt nur und bedient euch! Schmeckts? Meine 'Kühe' geben eine besonders wohlschmeckende Milch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kuh");
talkEntry:addTrigger("Kühe");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
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
talkEntry:addTrigger("Arbeit");
talkEntry:addTrigger("helfer");
talkEntry:addCondition(npc.base.condition.quest.quest(28, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sag 'Ich helfe euch' wenn du ihm helfen möchtest."));
talkEntry:addResponse("Wenn ihr euch um meine Kühe kümmert, könnt ihr auch etwas Milch haben. Helft ihr mir?");
talkEntry:addResponse("Nun, ich könnte Hände die zupacken können gebrauchen. Wollt ihr mir helfen?");
talkEntry:addResponse("Könntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I am proud to say that archmage Morgan never starts a day without a glass of my milk!");
talkEntry:addResponse("They say the only vital signs of the archmage over the course of weeks are the empty milk bottles and other dishes he summons infront of his chambers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich bin stolz sagen zu können, dass Erzmagier Morgan keinen Tag ohne ein Glas meiner Milch beginnt!");
talkEntry:addResponse("Es heißt die einzigen Lebenszeichen des Erzmagiers über Wochen hinweg wären die leeren Milchflaschen und anderes Geschirr das er vor die Tür seiner Gemächer zaubert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("What would you call a town full of weakly mages with bad bone structure? I'm calling it paradise!");
talkEntry:addResponse("Runewick, by far most of my customers live there!");
talkEntry:addResponse("An impressive place. I would've moved there already but alas the cows don't take the sea breeze there well.");
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
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The Don doesn't care about milk. Luckily Runewick is near enough not to be offered the Dons 'protection'.");
talkEntry:addResponse("If you look at the Don closely you might assume he's drinking milk day in and day out.");
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
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Once I have been forced to yield my best cows to the city. Of course they didn't give good milk, due to the sparse grass growing there.");
talkEntry:addResponse("Although they could use my milk there, due to the harsh conditions in the mountains, most prefer to drink alcoholic beverages.");
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
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("A pity the queen swears on donkey milk to use in her bath.");
talkEntry:addResponse("If my cows were mules, all I would do is produce milk for the bath of the queen and I would be rich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Leider schwört die Königin auf Eselsmilch um ihr Bad zu nehmen.");
talkEntry:addResponse("Wären meine Kühe Esel, ich bräuchte nur für das Bad der Königin zu arbeiten und hätte ausgesorgt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Due to the hot temperature not much milk is drank there. Only a choosen few appreciate my milk there.");
talkEntry:addResponse("Some connoisseurs spend good money on having my milk transported to Cadomyr.");
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
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I've heard cows are treated better than peasants there, terrifying thought!");
talkEntry:addResponse("Children in Albar are said to be weaned from breast milk very early. Milk is a symbol for weakness there, they say.");
talkEntry:addResponse("A lot of milk in Albar is wasted to be processed to smelly cheese, that's aweful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ich habe gehört die Kühe werden dort besser behandelt als die Bauern, schauerlich.");
talkEntry:addResponse("In Albar sollen Kinder sehr früh der Muttermilch entwöhnt werden. Milch wird mit Schwäche assoziert heißt es.");
talkEntry:addResponse("Viel Milch in Albar wird vergeudet um sie zu stinkendem Käse zu verarbeiten. Schrecklich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("If you want to order milk in Gynka, you'll only get it in a dirty glas.");
talkEntry:addResponse("Gynk people don't care that much about milk.");
talkEntry:addResponse("I heard many cows get sick there because of all the swamps nearby.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Wenn man in Gynka Milch bestellen will, bekommt man es nur in einem schmutzigen Glas.");
talkEntry:addResponse("Die Leute aus Gynk machen sich nicht viel aus Milch.");
talkEntry:addResponse("Ich hörte viele Kühe dort werden krank wegen den Sümpfen in der Nähe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Some 'scholars' of Salkamar are said to try to create milk out of plants. How could they!?");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("Amongst some upperclass people of Salkamar it is respectable to carry a downy beard openly! I think.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ein paar 'Gelehrte' in Salkamar sollen versuchen Milch aus Pflanzen zu gewinnen. Wie kann man nur!?");
talkEntry:addResponse("Es soll Leute dort geben die mischen ihre Milch mit heißem Wasser und Kräutern. Verrückt, nicht?");
talkEntry:addResponse("In manchen gehobenen Kreisen Salkamars gilt das Tragen eines Milchbarts als schicklich! Glaube ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("After a long feast there's nothing better to get on track than a glass of milk, even Adron knows that!");
talkEntry:addResponse("Adron loves beverages. Milk is a beverage. I love milk. Thus we share a love for milk.");
talkEntry:addResponse("A long time ago I became very ill. A wanderer found me shivering with fever in the stables and nursed me back to health. I think he was that wanderer!");
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
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
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
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh stop talking about that one! Else the milk will turn sour.");
talkEntry:addResponse("Next to noone has spilled as much milk as that meanie did.");
talkEntry:addResponse("I am hospitable. But for nothing in the world would I give him a glass of milk!");
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
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Thanks to her plants grow, and thanks to those plants my cows give milk!");
talkEntry:addResponse("Oldra, yes. We have to thank her for everything, you know. Without crops grown from soil all of us would die of hunger.");
talkEntry:addResponse("She is the highest godess of all, without her creation everything else would perish due to hunger.");
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
talkEntry:addTrigger("Ronagan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I'm sorry. I don't pray to that deity that often, so I can't say much about this.");
talkEntry:addResponse("I trust Adron and Oldra to take care of my farm and sucess, I'm not that familiar with other deities.");
talkEntry:addResponse("Hmm. I can't say much about that one. I usually pray to Adron and Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Tut mir leid. Ich bete zu dieser Gottheit eigentlich kaum, kann also nichts dazu sagen.");
talkEntry:addResponse("Ich lege meinen Hof und meinen Erfolg in die Hände Adrons und Oldras, andere Götter sind mir nicht so vertraut.");
talkEntry:addResponse("Hmm. Leider kann ich nicht viel darüber sagen. Ich bete eher zu Adron und Oldra.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'I help you' if you want to help him."));
talkEntry:addResponse("Once you tend to my cows, you may have some milk. Will you help me?");
talkEntry:addResponse("Well I could use some sturdy helping hands. Will you help me?");
talkEntry:addResponse("Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sag 'Ich helfe euch' wenn du ihm helfen möchtest."));
talkEntry:addResponse("Wenn ihr euch um meine Kühe kümmert, könnt ihr auch etwas Milch haben. Helft ihr mir?");
talkEntry:addResponse("Nun, ich könnte Hände die zupacken können gebrauchen. Wollt ihr mir helfen?");
talkEntry:addResponse("Könntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'I help you' if you want to help him."));
talkEntry:addResponse("Once you tend to my cows, you may have some milk. Will you help me?");
talkEntry:addResponse("Well I could use some sturdy helping hands. Will you help me?");
talkEntry:addResponse("Could you help me? I can't pay much but it'd mean a lot to me. It would also take away some of my worries.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sag 'Ich helfe euch' wenn du ihm helfen möchtest."));
talkEntry:addResponse("Wenn ihr euch um meine Kühe kümmert, könnt ihr auch etwas Milch haben. Helft ihr mir?");
talkEntry:addResponse("Nun, ich könnte Hände die zupacken können gebrauchen. Wollt ihr mir helfen?");
talkEntry:addResponse("Könntet ihr mir helfen? Ich kann euch nicht viel dafür geben aber es würde mir viel bedeuten und mir einige Sorgen abnehmen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("That's true! Let's have a glass of milk to celebrate.");
talkEntry:addResponse("Absolutely! Even my cows understand.");
talkEntry:addResponse("#me nods leisuredly: 'My grandfather used to say that all the time.");
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
talkEntry:addResponse("That's sad. Still you should try my milk.");
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
talkingNPC:addCycleText("#me plagt sich damit einen schweren Eimer Getreide zu heben.", "#me labours hard on lifting a heavy bucket of grain.");
talkingNPC:addCycleText("#me sieht sich traurig um und seufzt: 'So viel zu tun...'", "#me looks arround with a worried frown: 'So much to do...");
talkingNPC:addCycleText("#me nimmt einen großen Schluck aus einer Flasche: 'Mhh... Milch.'", "#me takes a big gulp from a bottle: 'Mhh... milk.'");
talkingNPC:addCycleText("Trinkt ihr brav Milch?", "Got milk?");
talkingNPC:addCycleText("Cheeseball, Mjilka, Betsy! Es wird Zeit euch zu melken!", "Cheeseball, Mjilka, Betsy! Time to milk you!");
talkingNPC:addCycleText("Milch ist gesund! Macht die Knochen stark, nicht wund!", "Milk is tasty, so always be hasty, to drink for your bones, make them turn as hard as stones!");
talkingNPC:addCycleText("Früher sah der Hof und der Arbeitsaufwand hier viel kleiner aus...", "Back in the days working on this farm wasn't that stressful to me...");
talkingNPC:addCycleText("Wo man Milch trinkt da lass dich gern nieder.", "Where there's milk drunk, one can come to rest with no worries in his heart.");
talkingNPC:addCycleText("Hallo! Ja ihr da! Wolltet ihr schon mal auf einem Hof arbeiten?", "Hello! Yes you over there! Did you ever consider working on a farm?");
talkingNPC:addCycleText("Hat man Milch getrunken kann nichts mehr in die Hose gehen! Hmm, wobei...", "Once you tried milk, you never go back!");
talkingNPC:addCycleText("Die Milch macht's!", "Milk makes mighty!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
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