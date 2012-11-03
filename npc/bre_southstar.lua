--------------------------------------------------------------------------------
-- NPC Name: Bre Southstar                                            Galmair --
-- NPC Job:  Guard                                                            --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  415, 248, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Kawan Baxter                                                     --
--           Estralis Seborian                                                --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 415, 248, 0, 4, 'Bre Southstar', 'npc.bre_southstar', 1, 7, 0, 205, 102, 0, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.bre_southstar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Bre Southstar the gate guardian. Keywords: Hello, Gavin, Galmair, Guard."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Bre Southstar die Torwächterin. Schlüsselwörter: Hallo, Gavin, Galmair, Wache."));
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
talkEntry:addResponse("Good day. I hope you are doing well.");
talkEntry:addResponse("This is Galmair, have a pleasant time.");
talkEntry:addResponse("I'm happy that you decided to choose this gate. Please have a pleasant trip.");
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
talkEntry:addResponse("Guten Tag, ich hoffe, es geht euch gut.");
talkEntry:addResponse("Dies hier ist Galmair, genießt euren Aufenthalt.");
talkEntry:addResponse("Es freut mich, dass ihr dieses Tor gewählt habt. Eine gute Reise wünsche ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Good day. I hope you are doing well.");
talkEntry:addResponse("This is Galmair, have a pleasant time.");
talkEntry:addResponse("I'm happy that you decided to choose this gate. Please have a pleasant trip.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Guten Tag, ich hoffe, es geht euch gut.");
talkEntry:addResponse("Dies hier ist Galmair, genießt euren Aufenthalt.");
talkEntry:addResponse("Es freut mich, dass ihr dieses Tor gewählt habt. Eine gute Reise wünsche ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May justice and peace make your day merry.");
talkEntry:addResponse("I will see you later.");
talkEntry:addResponse("Have a good day, please walk in peace wherever you step.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Mögen Gerechtigkeit und Frieden euren Tag versüßen.");
talkEntry:addResponse("Wir sehen uns noch.");
talkEntry:addResponse("Einen schönen Tag noch, gehet hin in Frieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May Justice and peace make your day merry.");
talkEntry:addResponse("I will see you later.");
talkEntry:addResponse("Have a good day, please walk in peace wherever you step.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Mögen Gerechtigkeit und Frieden euren Tag versüßen.");
talkEntry:addResponse("Wir sehen uns noch.");
talkEntry:addResponse("Einen schönen Tag noch, gehet hin in Frieden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm doing great, can't really explain why.");
talkEntry:addResponse("Today is a good day, well I guess everyday is a good day.");
talkEntry:addResponse("I'm in utter peace... or at least I think I am.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mir geht es gut, auch wenn ich gar nicht weiß, wieso.");
talkEntry:addResponse("Heute ist ein guter Tag, eigentlich ist jeder neue Tag ein guter.");
talkEntry:addResponse("Ich bin mit mir im Einklang... denke ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I'm Bre Southstar.");
talkEntry:addResponse("I am the pretty dwarf warrior, Bre Southstar.");
talkEntry:addResponse("I prefer the name 'Amazing Battle Dwarf Bre the Southstar'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Bre Southstar.");
talkEntry:addResponse("Ich bin die schicke Zwergenkriegerin, Bre Southstar.");
talkEntry:addResponse("Ich würde die Anrede 'Großartige Zwergenkriegerin Bre der Southstar' vorziehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I don't need anything right now. Thank you though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich brauche gerade nichts, danke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I don't need anything right now. Thank you though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich brauche gerade nichts, danke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a Galmairian Gateguard.");
talkEntry:addResponse("I am a Silverstone rank in the Civil Watch.");
talkEntry:addResponse("I guard gates and smash people in the face with my ball and chain, but not often.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin eine Torwache Galmairs.");
talkEntry:addResponse("Ich habe den Rang eines Silbersteins in der Bürgerwehr.");
talkEntry:addResponse("Ich bewache Tore und schlag Leuten, wenn nötig, das Gesicht ein. Das kommt aber nicht so oft vor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a Galmairian Gateguard.");
talkEntry:addResponse("I am a Silverstone rank in the Civil Watch.");
talkEntry:addResponse("I guard gates and smash people in the face with my ball and chain, but not often.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin eine Torwache Galmairs.");
talkEntry:addResponse("Ich habe den Rang eines Silbersteins in der Bürgerwehr.");
talkEntry:addResponse("Ich bewache Tore und schlag Leuten, wenn nötig, das Gesicht ein. Das kommt aber nicht so oft vor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gavin");
talkEntry:addResponse("She is the prettiest, strongest, smartest person I know.");
talkEntry:addResponse("She rescued me from being homeless.");
talkEntry:addResponse("Gavin is too tall for a girl.");
talkEntry:addResponse("Gavin of the other gate is my sister.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sister");
talkEntry:addResponse("She is the prettiest, strongest, smartest person I know.");
talkEntry:addResponse("She rescued me from being homeless.");
talkEntry:addResponse("Gavin is too tall for a girl.");
talkEntry:addResponse("Gavin of the other gate is my sister.");
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
talkEntry:addResponse("Gavin keeps telling me I need to do everything in peace and justice. I tell her that she needs to do everything in fun and sunshine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("guard");
talkEntry:addTrigger("Civil Watch");
talkEntry:addTrigger("gate");
talkEntry:addResponse("My job. I never thought when I was a little girl, or a slightly older little homeless girl that I would become a watchman.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drugs");
talkEntry:addResponse("#me looks away silently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("men");
talkEntry:addResponse("They are all as bad as Don. All of the male watchmen only hang out with me to try and get with me. It's truly annoying.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Weapon");
talkEntry:addResponse("Gavin taught me the morning star. I practiced with it every day until I became the second best morning star user in the watch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gavin");
talkEntry:addResponse("Sie ist die schönste, stärkste und schlauste Person, die ich kenne.");
talkEntry:addResponse("Sie hat mich aus der Obdachlosigkeit geholt.");
talkEntry:addResponse("Gavin ist eindeutig zu groß für ein Weib.");
talkEntry:addResponse("Gavin am anderen Tor, das ist meine Schwester.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schwester");
talkEntry:addResponse("Sie ist die schönste, stärkste und schlauste Person, die ich kenne.");
talkEntry:addResponse("Sie hat mich aus der Obdachlosigkeit geholt.");
talkEntry:addResponse("Gavin ist eindeutig zu groß für ein Weib.");
talkEntry:addResponse("Gavin am anderen Tor, das ist meine Schwester.");
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
talkEntry:addResponse("Gavin sagt immer, ich solle alles für Frieden und Gerechtigkeit tun. Ich sage ihr immer, sie solle alles mit Freude und der Sonne im Herzen tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wache");
talkEntry:addTrigger("Bürgerwehr");
talkEntry:addTrigger("Tor");
talkEntry:addResponse("Meine Aufgabe. Nie habe ich gedacht, eine Wache zu werden, als ich noch jung war und auf der Straße lebte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drogen");
talkEntry:addTrigger("Rauschgift");
talkEntry:addResponse("#me schaut verschämt zu Boden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Männer");
talkEntry:addResponse("Männer sind alles so wie der Don. Die Männer in der Bürgerwehr wollen alle immer nur mit mir Dienst schieben und bei mir sein. Das nervt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waffe");
talkEntry:addResponse("Gavin brachte mir bei, mit dem Morgenstern umzugehen. Ich übte jeden Tag, bis ich die zweitbeste in der Bürgerwehr damit war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't want to buy or sell anything, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich will weder etwas kaufen noch verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I could tell you a lot about my sister, Gavin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich könnte euch eine Menge über meine Schwester Gavin erzählen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I serve Elara because that is my sister's chosen god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich diene Elara, denn meine Schwester tut das auch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("I serve Elara because that is my sister's chosen god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ich diene Elara, denn meine Schwester tut das auch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I hear that there is an enormous bridge that stretches across a large sea just to get to the city. The image in my head is very pretty. Don't you think?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Ich hörte, dass die Stadt mit einer riesigen Brücke über das Meer mit dem Festland verbunden ist. Das klingt doch wunderschön, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I hear he is a strong mage user, but honestly. Magic is nothing compared to a strong blow from a dwarven great axe.");
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
talkEntry:addResponse("I hear he is a strong mage user, but honestly. Magic is nothing compared to a strong blow from a dwarven great axe.");
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
talkEntry:addResponse("I hear he is the worst womanizer, but he pays my salary, so I work for him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich hörte, er ist der schlimmste Weiberhgeld, aber da er mein Gehalt zahlt, arbeite ich für ihn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("The streets are cold, the men are rude, but this is where my sister is and my job. I love it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Die Straßen sind kalt, die Leute ungehobelt aber hier ist meine Schwester und meine Aufgabe, also liebe ich es.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I made Gavin promise she would take me there. She said on her next day off. That was two years ago.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich habe Gavin dazu gebracht, mir zu versprechen, dass wir dort mal hingehen. Sie meinte, dass wir das an ihrem nächsten freien Tag machen. Das war vor zwei Jahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I hear she is the meanest witch, even compared to the ugly ferocious women of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich hörte, sie ist die böseste Hexe unter den gräßlichen Frauen Cadomyrs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I hear she is the meanest witch, even compared to the ugly ferocious women of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich hörte, sie ist die böseste Hexe unter den gräßlichen Frauen Cadomyrs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Outside of Galmair I know nothing, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Über die Welt ausserhalb Galmairs weiß ich nicht viel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I think that is what this place is like, but I really don't know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich meine, dort ist es so ähnlich wie hier, aber ich weiß es nicht genau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I've never even heard that word before.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Das Wort habe ich ja noch nie gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("What is that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Was soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Is that you?");
talkEntry:addResponse("Yes?");
talkEntry:addResponse("Do you need something?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Seid ihr das?");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Braucht ihr was?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bre");
talkEntry:addTrigger("Southstar");
talkEntry:addResponse("I am her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bre");
talkEntry:addTrigger("Southstar");
talkEntry:addResponse("Das bin ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes to what?");
talkEntry:addResponse("Pardon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Pardon?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Sorry, I did not ask a question.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Entschuldigt, ich habe gar nicht gefragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("I am the merely a guard of Galmair.");
talkEntry:addResponse("Tell that somebody else.");
talkEntry:addResponse("Move along.");
talkEntry:addResponse("Pass along");
talkEntry:addResponse("Do not loiter!");
talkEntry:addResponse("In or out?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Ich bin in erster Linie eine Wache Galmairs.");
talkEntry:addResponse("Erzählt das irgendwem, nur nicht mir.");
talkEntry:addResponse("Weitergehen.");
talkEntry:addResponse("Geht weiter.");
talkEntry:addResponse("Lungert hier nicht so rum!");
talkEntry:addResponse("Rein oder raus?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Nun, ihr kennt ja die Geschichten über Recht und Unrecht. Gavin glaubt sogar daran.", "Well you know those stories about right and wrong. Gavin is the one of the ones who believes that.");
talkingNPC:addCycleText("Geht geordnet weiter, danke.", "Please pass in an orderly fashion. Thank you.");
talkingNPC:addCycleText("Ihr da! Macht keinen Ärger.", "Hey you! Don't cause any trouble.");
talkingNPC:addCycleText("Mir ist so langweilig. Ich wünscht, wir Wachen dürften im Dienst trinken.", "I'm so bored. I wish we could drink at work.");
talkingNPC:addCycleText("Ich bin so hungrig. Ich frage mich, was Gavin wohl heute wieder kocht.", "So very very hungry. I wonder what Gavin is cooking tonight.");
talkingNPC:addCycleText("Roar, ich mach alles mit meinem Morgenstern platt.", "Roar, I will crush anyone with my morning star.");
talkingNPC:addCycleText("Ich brauche keinen Mann.", "I'm not looking for a man.");
talkingNPC:addCycleText("In der Bürgerwehr zu sein ist der beste Beruf von allen.", "Civil watch is the best job ever.");
talkingNPC:addCycleText("Aye, Galvin hat immer recht.", "Aye, Gavin is always right.");
talkingNPC:addCycleText("Ich wünschte, Galvin wäre manchmal etwas besser gelaunt.", "I wish Gavin would lighten up every now and then.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Bre Southstar, die Torwächterin.", "This NPC is Bre Southstar the gate guardian.");
mainNPC:setUseMessage("Zurück!", "Back up!");
mainNPC:setConfusedMessage("#me schaut verwirrt umher.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 2359);
mainNPC:setEquipment(11, 55);
mainNPC:setEquipment(5, 2737);
mainNPC:setEquipment(6, 17);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 367);
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