--------------------------------------------------------------------------------
-- NPC Name: Half-hung Bryan                                             None --
-- NPC Job:  Inn-keeper                                                       --
--                                                                            --
-- NPC Race: human                      NPC Position:  696, 317, 0            --
-- NPC Sex:  male                       NPC Direction: west                   --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: September 11, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 696, 317, 0, 6, 'Half-hung Bryan', 'npc.half-hung_bryan', 0, 2, 0, 185, 73, 25, 178, 163, 156);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.half-hung_bryan", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Half-hung Bryan the innkeeper of The Hemp Necktie Inn . Keywords: Inn, Necktie, Law, Farmer"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Half-hung Bryan der Gastwirt vom Gasthof zur Hanfschlinge. Schlüsselwörter: Gasthof, Strick, Gesetz, Knecht"));
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
talkEntry:addResponse("Welcome to my inn.");
talkEntry:addResponse("Greetings, how may I help you?");
talkEntry:addResponse("#me turns his stiff neck to look at you.'Greetings'.");
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
talkEntry:addResponse("Seid Willkommen in meinem Gasthof.");
talkEntry:addResponse("Grüße, wie kann ich Euch helfen?");
talkEntry:addResponse("#me blickt dich mit steifem Nacken an. 'Grüße'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addResponse("Welcome to my inn.");
talkEntry:addResponse("Greetings, how may I help you?");
talkEntry:addResponse("#me nods 'Greetings'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greebas");
talkEntry:addTrigger("Greebs");
talkEntry:addResponse("Seid Willkommen in meinem Gasthof.");
talkEntry:addResponse("Grüße, wie kann ich Euch helfen?");
talkEntry:addResponse("#me nickt grüßend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Au revoir.");
talkEntry:addResponse("Farewell, and don't forget my inn!");
talkEntry:addResponse("Take care!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Au revoir. Und vergeßt nicht, mein Gasthof steht Euch immer offen.");
talkEntry:addResponse("Macht's gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Au revoir.");
talkEntry:addResponse("Farewell, and don't forget my inn!");
talkEntry:addResponse("Take care!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Au revoir. Und vergeßt nicht, mein Gasthof steht Euch immer offen.");
talkEntry:addResponse("Macht's gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("It's hard to breath...");
talkEntry:addResponse("#me hisses slightly. 'My neck hurts.'");
talkEntry:addResponse("#me touches his neck with a thoughtfull gaze. 'Hm-hm... How's your neck?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("#me macht einen kehlig würgendes Geräusch. 'Ich habe Nackenschmerzen...'");
talkEntry:addResponse("#me inhaliert mit einem rasselnden Laut die stickige Luft. 'Das Atmen fällt mir Schwer...'");
talkEntry:addResponse("#me betastet nachdenklich die dunkel verfärbte Narbe quer über seinem Hals: 'Hm-hm... - Und Euch? Wie fühlt sich Euer Hals an?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Bryan, and that is my inn. The Hemp Necktie Inn. You like the name?");
talkEntry:addResponse("I am Half-hung Bryan. What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Bryan. Und das ist mein Gasthof. Der Gasthof zur Hanfschlinge. Gefällt Euch der Name?");
talkEntry:addResponse("Ich bin Half-hung Bryan. Was wollt Ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Half-hung Bryan doesn't have any work for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Half-hung Bryan hat keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Half-hung Bryan doesn't have any work for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Half-hung Bryan hat keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Well, this nice and beautiful inn here in the wilderness is mine. The Hemp Necktie Inn always has a lot of customers.");
talkEntry:addResponse("I care for my inn. Do you want to rent a room?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Mir gehört dieser schmucke Gasthof, mitten in der Wildnis. Und doch! - Der Gasthof zur Hanfschlinge hat immer viele Gäste.");
talkEntry:addResponse("Einst hab ich einfach am feld geschuftet. Dann wurde ich n'Galgenvogel und danach, hatt ich Glück und könnte mir den Gasthof kaufen.");
talkEntry:addResponse("Ich kümmere mich um meinen Gasthof. Wollt Ihr ein Zimmer mieten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Well, this nice and beautiful inn here in the wilderness is mine. The Hemp Necktie Inn always has a lot of customers.");
talkEntry:addResponse("I care for my inn. Do you want to rent a room?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Mir gehört dieser schmucke Gasthof, mitten in der Wildnis. Und doch! - Der Gasthof zur Hanfschlinge hat immer viele Gäste.");
talkEntry:addResponse("Einst hab ich einfach am feld geschuftet. Dann wurde ich n'Galgenvogel und danach, hatt ich Glück und könnte mir den Gasthof kaufen.");
talkEntry:addResponse("Ich kümmere mich um meinen Gasthof. Wollt Ihr ein Zimmer mieten?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("What did you say?");
talkEntry:addResponse(" Gobaith? Never heard of it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Bitte was?");
talkEntry:addResponse("Gobaith? Hab ich noch nie davon gehört.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Good. What do you want?");
talkEntry:addResponse("#me laughs a bit: 'And I am Bryan. They tried to hang me two times and yet here I stand in front of you.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Gut. Was wollt Ihr von mir?");
talkEntry:addResponse("#me krächzt lachend: 'Und ich bin Bryan. Man hat mich zwei Mal gehängt und trotzdem steh ich vor Euch.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("Northoff");
talkEntry:addResponse("Borgate pours the beer. A good guy. Do you want something to drink? Then ask Borgate!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("barkeeper");
talkEntry:addTrigger("innkeeper");
talkEntry:addResponse("Borgate pours the beer. A good guy. Do you want something to drink? Then ask Borgate!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("inn");
talkEntry:addTrigger("guesthouse");
talkEntry:addTrigger("tavern");
talkEntry:addTrigger("necktie");
talkEntry:addResponse("The inn is a free and independent place. City laws are of no interest here. The only law that counts is the law of Half-hung Bryan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hang");
talkEntry:addTrigger("hung");
talkEntry:addTrigger("hemp");
talkEntry:addTrigger("neck");
talkEntry:addTrigger("gibbet");
talkEntry:addResponse("The first time the rope broke. The second time the branch snapped.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gowan");
talkEntry:addTrigger("Sam");
talkEntry:addTrigger("brute");
talkEntry:addTrigger("Booze");
talkEntry:addTrigger("hook");
talkEntry:addResponse("Here in my inn, no one asks questions. That's my law - the only law that counts this far away from the cities.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("knecht");
talkEntry:addTrigger("bauer");
talkEntry:addTrigger("farmer");
talkEntry:addResponse("I once was a farmer. And during war times farmers become soldiers. Farmers live long, soldiers don't. I deserted and the punishment for that was the noose.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("Rule one, don't ask questions. Rule two, don't ask any questions. Rule three, Half-hung Bryan rents room to anyone he wants to rent rooms to. Rule four, Half-hung Bryan does what Half-hung Bryan wants to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("Northoff");
talkEntry:addTrigger("wirt");
talkEntry:addResponse("Borgate schenkt das Bier aus. Ein anständiger Kerl. Wollt ihr etwas trinken? Dann geht zu ihm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gasthof");
talkEntry:addTrigger("Taverne");
talkEntry:addTrigger("hof");
talkEntry:addTrigger("Hanfschlinge");
talkEntry:addResponse("Mein Hof war, zuerst nicht mehr als eine Scheune. Hab sie leer gefunden und darin übernachtet. Seit dem gehörte sie mir.");
talkEntry:addResponse("Klar die Ersten Jahre wahren hart. Allerlei Untier läuft hier draußen rum, weit weg von den Städten. Aber ich bin nur mir selbst verpflichtet.");
talkEntry:addResponse("Der Gasthof zur Hanfschlinge, ist keiner Stadt verpflichtet. Auch wenn das jemanden nicht gefällt, hier gelten Bryans Regeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hängen");
talkEntry:addTrigger("strick");
talkEntry:addTrigger("galgen");
talkEntry:addTrigger("Hanf");
talkEntry:addTrigger("Schlinge");
talkEntry:addResponse("Das erste Mal ist der Strick gerissen. Und beim zweiten Mal, der Ast abgebrochen.");
talkEntry:addResponse("Laßt Euch den Meisterbrief des Henkers zeigen, wenn man Euch einmal hinrichten sollte. Solche Leute stümpern dann wenigstens nicht herum.");
talkEntry:addResponse("#me macht einen gurgelnden Laut. 'Desertation und schwerer Verrat am König. Albarische Soldaten knüpfen sie auch zweimal auf.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gowan");
talkEntry:addTrigger("Sam");
talkEntry:addTrigger("brute");
talkEntry:addTrigger("Booze");
talkEntry:addTrigger("hook");
talkEntry:addResponse("Hier im Gasthof zum Hanfstrick stellt man keine Fragen. So sagt's mein Gesetz. Und das ist das Einzige das hier, so weit außerhalb der Städte zählt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knecht");
talkEntry:addTrigger("bauer");
talkEntry:addTrigger("farmer");
talkEntry:addResponse("Ist schon lange her. Da hab ich auf einem Hof in Albar den Acker gepflügt. Irgendwann kam der Landsherr und befahl mich zum Soldaten. Soldaten leben nicht lang, also bin ich desertiert. Die Strafe für Fahnenflucht ist der Galgen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("regel");
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Regel eins, es werden keine Fragen gestellt. Regel zwei, werden keine Fragen gestellt. Regel drei, Half-hung Bryan vermietet Zimmer an wen und wie er will. Regel vier, Half-hung Bryan tut was Half-hung Bryan tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Wer ist auf dieser Seite? wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Wer ist auf dieser Seite? wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Wer ist auf dieser Seite? wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Who is on this side? Who is on the other side? Half-hung Bryan is on his own side. It's always been like this and it always will. This is the reason the inn is alive, and everybody knows that.");
talkEntry:addResponse("Here, in the middle of the wilderness, my inn is independent of all political matters. That is a blessing.");
talkEntry:addResponse("We don't ask such questions here. I don't wanna know where you are from, what you do or what you are going to do.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar - My homeland. Sometimes I miss the hard work in the fields...A man who has his hands deep in the dirt knows that he is doing honest work.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Albar - Meine Heimat. Es gibt Tage an denen vermisse ich es mir den Rücken krum zu schuften, die harte Erde des Ackers zu Pflügen... Wenn ein Mann seine Finger tief im Dreck hat, weiß er, dass er eine gute Arbeit tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("What shall I tell you about Gynk? Snakes everywhere, the farmers grow sibanac instead of vegetables and the weather is bad.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Was soll man über Gynk schon sagen? Die Erde dort ist voller Schlangen, die Bauern ernten Sibanac anstelle von ordentlichem Gemüse und das Wetter ist schrecklich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Once my old feudal lord told Bryan to fight in the war against Salkamar. I tried to run away - that's why I got hanged, twice. Once for treason against the king, once again for desertion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Als mein alter Lehnsherr in den Krieg gegen Salkamar zog, befahl er auch den tapferen Bryan zum Soldaten. Aber ich versuchte zu fliehen, darauf hin ließ er mich hängen, zwei Mal. Je einmal für Fahnenflucht und für Verrat am König.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("#me clears his throat. 'There's only two people I talk about the gods with and you aren't one of them.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("You can rent a room. Or just a bed for the night. What do you want?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ihr könnt Zimmer bei mir mieten. Oder auch nur n' Bett für die Nacht. Darfs was sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Everyone calls me Half-hung Bryan. Do you see the scar on my neck? That's from the noose.");
talkEntry:addResponse("Hm. My neck wasn't always this crooked, but well..that was a long time ago.");
talkEntry:addResponse("Years ago I was a servant in an Albarian court. I thought I had to leave and see the big world. Now my neck is snapped and people like you always want something from me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Mann nennt mich Half-hung Bryan. Seht Ihr die Narbe an meinem Hals? Das war der Strick.");
talkEntry:addResponse("Hm. Ich hatt nicht immer den schiefen Hals. Aber das war früher. Damals war viel anders.");
talkEntry:addResponse("Früher war ich Knecht auf einem albarischem Hof. Und dann dachte ich ich muss ausziehen in die große Welt. Jetzt ist mein Hals schief und Leute wie Ihr wollen ständig etwas von mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Half-hung");
talkEntry:addTrigger("Bryan");
talkEntry:addResponse("Half-hung Bryan. That's my name.");
talkEntry:addResponse("Hrm?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Half-hung");
talkEntry:addTrigger("Bryan");
talkEntry:addResponse("Half-hung Bryan. So lautet mein Name.");
talkEntry:addResponse("#me krächzt kehlig. 'Hrm?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("No problem.");
talkEntry:addResponse("That's all right.");
talkEntry:addResponse("Then do it, if you must.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me zuckt zaghaft mit den Schultern. 'Geht klar.'");
talkEntry:addResponse("Von mir aus.");
talkEntry:addResponse("Geht in Ordnung.");
talkEntry:addResponse("Na meinetwegen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Hr-hrm.");
talkEntry:addResponse("I don't care.");
talkEntry:addResponse("#me just clears his throat.");
talkEntry:addResponse("Nevermind");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hr-hrm.");
talkEntry:addResponse("Was sollte mich das kümmern?");
talkEntry:addResponse("#me räuspert sich kehlig. 'Das ist mir Wurst wie Käse.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Half-hung Bryan doesn't ask any questions.");
talkEntry:addResponse("Half-hung Bryan does what he wants.");
talkEntry:addResponse("Half-hung Bryan rents rooms to anyone he likes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Half-hung Bryan stellt keine Fragen.");
talkEntry:addResponse("Half-hung Bryan tut was auch immer Half-hung Brayn tut.");
talkEntry:addResponse("Half-hung Bryan vermietet Zimmer an wen und wie er will.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me dreht langsam seinen Kopf bis ein unheilvolles knackendes Geräusch zu hören ist. Einmal in jede Richtung.", "#me turns his head left and right.");
talkingNPC:addCycleText("#me gibt einen kehligen Laut von sich, es klingt wie ein Keuchen.", "#me makes a strange gasping noise.");
talkingNPC:addCycleText("#me greift sich mit nachdenklicher Miene an die dunkel verfärbte Narbe an seinem Hals..", "#me touches the scar on his neck.");
talkingNPC:addCycleText("Hr-hrm", "Hr-hrm");
talkingNPC:addCycleText("#me reibt sich den Nacken.", "#me rubs his neck.");
talkingNPC:addCycleText("#me legt seine Hand auf den Schwertknauf, an seinem Gürtel und mustert mit finsterem Blick die Umgebung.", "#me's right hand touches his sword pommel at his belt and he glances around with a dirty look.");
talkingNPC:addCycleText("#me leckt sich über die vertockneten Lippen.", "#me licks over dried out lips.");
talkingNPC:addCycleText("#me faltet die Hände vor seiner Brust. 'Ausgezeichnet.'", "#me folds his hands across his chest. 'Excellent!'");
talkingNPC:addCycleText("#me kratzt sich am Hals.", "#me scratches his neck.");
talkingNPC:addCycleText("#me hustet laut und würgend.", "#me coughs loudly, choking a little.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein kräftiger Mann mit schräg verenktem Hals und Hakennase, der mit heiserer Stimme spricht. Eine gerippte, dunkel gefärbte Narbe zieht sich quer über seinen Hals.", "A burly man with a bent neck and a hooked nose who speaks in a gruff voice. A ribbed, dark coloured scar covers his neck.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 458);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 70);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
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