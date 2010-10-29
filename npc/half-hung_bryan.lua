--------------------------------------------------------------------------------
-- NPC Name: Half-hung Bryan                                             None --
-- NPC Job:  Inn-keeper                                                       --
--                                                                            --
-- NPC Race: human                      NPC Position:  674, 314, 0            --
-- NPC Sex:  male                       NPC Direction: southwest              --
--                                                                            --
-- Author:   not set                                                          --
--                                                                            --
-- Last parsing: October 09, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 674, 314, 0, 5, 'Half-hung Bryan', 'npc.half-hung_bryan', 0, 2, 0, 185, 73, 25, 178, 163, 156);
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Half-hung Bryan the innkeeper of The Hemp Necktie Inn . Keyphrases: Inn, Necktie, Law, Farmer"));
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
talkEntry:addTrigger("Greetings");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Greet");
talkEntry:addTrigger("Hail");
talkEntry:addTrigger("Good day");
talkEntry:addTrigger("Good morning");
talkEntry:addTrigger("Good evening");
talkEntry:addResponse("ENGLISH");
talkEntry:addResponse("ENGLISH");
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
talkEntry:addResponse("Seid Willkommen in meinem Gasthof.");
talkEntry:addResponse("Grüße, wie kann ich Euch helfen?");
talkEntry:addResponse("#me blickt dich mit steifem Nacken an. 'Grüße'.");
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
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("Seid Willkommen in meinem Gasthof.");
talkEntry:addResponse("Grüße, wie kann ich Euch helfen?");
talkEntry:addResponse("#me nickt grüßend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("ENGLISH1.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Au revoir. Und vergeßt nicht, mein Gasthof steht Euch immer offen.");
talkEntry:addResponse("Macht's gut.");
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
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Au revoir. Und vergeßt nicht, mein Gasthof steht Euch immer offen.");
talkEntry:addResponse("Macht's gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("ENGLISH");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("ENGLISH");
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
talkEntry:addResponse("ENGLISH");
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
talkEntry:addTrigger("profession");
talkEntry:addResponse("ENGLISH1.");
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
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Gut. Was wollt Ihr von mir?");
talkEntry:addResponse("#me krächzt lachend: 'Und ich bin Bryan. Man hat mich zwei Mal gehängt und trotzdem steh ich vor Euch.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("barkeeper");
talkEntry:addTrigger("innkeeper");
talkEntry:addTrigger("Northoff");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("inn");
talkEntry:addTrigger("guesthouse");
talkEntry:addTrigger("tavern");
talkEntry:addTrigger("necktie");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hang");
talkEntry:addTrigger("hung");
talkEntry:addTrigger("hemp");
talkEntry:addTrigger("neck");
talkEntry:addTrigger("gibbet");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gowan");
talkEntry:addTrigger("Sam");
talkEntry:addTrigger("brute");
talkEntry:addTrigger("Booze");
talkEntry:addTrigger("hook");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knecht");
talkEntry:addTrigger("bauer");
talkEntry:addTrigger("farmer");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bryan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Borgate");
talkEntry:addTrigger("wirt");
talkEntry:addTrigger("Northoff");
talkEntry:addCondition(npc.base.condition.language.language("german"));
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hier im Gasthof zum Hanfstrick stellt man keine Fragen. So sagt's mein Gesetz. Und das ist das Einzige das hier, so weit außerhalb der Städte zählt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("knecht");
talkEntry:addTrigger("bauer");
talkEntry:addTrigger("farmer");
talkEntry:addCondition(npc.base.condition.language.language("german"));
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
talkEntry:addTrigger("Bryan");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("#me krächzt kehlig. 'Hrm?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
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
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Wer ist auf dieser Seite? wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
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
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
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
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
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
talkEntry:addResponse("Wer ist auf dieser Seite? wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
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
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
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
talkEntry:addResponse("Wer ist auf dieser Seite? Wer ist auf jener Seite? Half-hung Bryan ist auf seiner eigenen Seite. So wars schon immer und so wirds immer sein. Davon lebt der Gasthof und alle wissen woran sie mit mir sind.");
talkEntry:addResponse("Hier in mitten der Wildnis, ist mein Hof unabhängig von allen politischen Intrigen. Das ist fast ein Segen, aber man muss selbst sehen wo man bleibt wenn die Wilden hier einfallen.");
talkEntry:addResponse("Auf meinem Gasthof werden keine Fragen gestellt. Ich will nicht wissen wo Ihr herkommt, was ihr macht und was ihr vorhabt schon gar nicht.");
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Albar - Meine Heimat. Es gibt Tage an denen vermisse ich es mir den Rücken krum zu schuften, die harte Erde des Ackers zu Pflügen... Wenn ein Mann seine Finger tief im Dreck hat, weiß er, dass er eine gute Arbeit tut.");
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Was soll man über Gynk schon sagen? Die Erde dort ist voller Schlangen, die Bauern ernten Sibanac anstelle von ordentlichem Gemüse und das Wetter ist schrecklich.");
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Als mein alter Lehnsherr in den Krieg gegen Salkamar zog, befahl er auch den tapferen Bryan zum Soldaten. Aber ich versuchte zu fliehen, darauf hin ließ er mich hängen, zwei Mal. Je einmal für Fahnenflucht und für Verrat am König.");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
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
talkEntry:addResponse("#me räuspert sich mit schief gelegtem Kopf. 'Über die Götter spreche ich nur mit zwei Personen dieser Welt. Und keine davon seid Ihr.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Half-hung Bryan hat keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Half-hung Bryan hat keine Arbeit für Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("Half-hung Bryan stellt keine Fragen.");
talkEntry:addResponse("Half-hung Bryan tut was auch immer Half-hung Brayn tut.");
talkEntry:addResponse("Half-hung Bryan vermietet Zimmer an wen und wie er will.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me dreht langsam seinen Kopf bis ein unheilvolles knackendes Geräusch zu hören ist. Einmal in jede Richtung.", "ENGLISH");
talkingNPC:addCycleText("#me gibt einen kehligen Laut von sich, es klingt wie ein Keuchen.", "ENGLISH");
talkingNPC:addCycleText("#me greift sich mit nachdenklicher Miene an die dunkel verfärbte Narbe an seinem Hals..", "ENGLISH");
talkingNPC:addCycleText("Hr-hrm", "Hr-hrm");
talkingNPC:addCycleText("#me reibt sich den Nacken.", "ENGLISH");
talkingNPC:addCycleText("#me legt seine Hand auf den Schertknauf, an seinem Gürtel und mustert mit finsterem Blick die Umgebung.", "ENGLISH");
talkingNPC:addCycleText("#me leckt sich über die vertockneten Lippen.", "ENGLISH");
talkingNPC:addCycleText("#me faltet die Hände vor seiner Brust. 'Ausgezeichnet.'", "ENGLISH");
talkingNPC:addCycleText("#me kratzt sich am Hals.", "ENGLISH.");
talkingNPC:addCycleText("#me hustet laut und würgend.", "ENGLISH.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein kräftiger Mann mit schräg verenktem Hals und Hakennase, der mit heißerer Stimme spricht. Eine gerippte, dunkel gefärbte Narbe zieht sich quer über seinen Hals.", "ENGLISH");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(3, 458);
mainNPC:setEquipment(5, 70);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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