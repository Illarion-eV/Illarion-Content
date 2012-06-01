--------------------------------------------------------------------------------
-- NPC Name: Brute Booze                                                 None --
-- NPC Job:  Adventurer                                                       --
--                                                                            --
-- NPC Race: orc                        NPC Position:  674, 320, 0            --
-- NPC Sex:  male                       NPC Direction: southwest              --
--                                                                            --
-- Authors:  Rincewind                                                        --
--           Attempt of an translation by Estralis Seborian                   --
--                                                                            --
-- Last parsing: June 01, 2012                           easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 674, 320, 0, 5, 'Brute Booze', 'npc.brute_booze', 0, 0, 2, 6, 18, 8, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.brute_booze", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Brute Booze an famous orcish adventurer. Keyphrases: Hello, towns, heroic deeds, tell something."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Brute Booze, ein berühmter orkischer Glücksritter. Schlüsselwörter: Hallo, Städte, Heldentaten, erzähl etwas."));
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
talkEntry:addResponse("Be greeted! Are you travelish?");
talkEntry:addResponse("A good day. Are you prowlish?");
talkEntry:addResponse("Be welcomed.");
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
talkEntry:addResponse("Seid mir gegrüßet! Ihr seid wohl auch auf Reise?");
talkEntry:addResponse("Guten Tag, wünsche iche. Befindigt Ihr Euch auf grosser Fahrt?");
talkEntry:addResponse("Seid mir willkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Be greeted! Are you travelish?");
talkEntry:addResponse("A good day. Are you prowlish?");
talkEntry:addResponse("Be welcomed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid mir gegrüßet! Ihr seid wohl auch auf Reise?");
talkEntry:addResponse("Guten Tag, wünsche iche. Befindigt Ihr Euch auf grosser Fahrt?");
talkEntry:addResponse("Seid mir willkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Save travel!");
talkEntry:addResponse("...or like the southern lizards say: 'May your path be purely waterish!'");
talkEntry:addResponse("May your boots be good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Sicheres Reisen!");
talkEntry:addResponse("...oder wie die südlichen Echsenmenschen sprechen: 'Mögt ihr von reinem Wasser umgebigt sein.'");
talkEntry:addResponse("Iche will Euch gute Stiefel an die Füße wünsch-higen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Save travel!");
talkEntry:addResponse("...or like the southern lizards say: 'May your path be purely waterish!'");
talkEntry:addResponse("May your boots be good.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Sichere Reise!");
talkEntry:addResponse("... oder wie die südlichen Echsenmenschen sprechen: 'Mögt ihr von reinem Wasser umgebigt sein.'");
talkEntry:addResponse("Iche will Euch gute Stiefel an die Füße wünsch-higen...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Yeah. Good old Brute is feeling fine. I will set out one day for new adventures.");
talkEntry:addResponse("That is not important. How about you?");
talkEntry:addResponse("Big days, these are indeed big days. I feel like a cub!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Ja-h! Dem alten Brute geht's prächtigens. Irgendwann werde iche wohl zu einem neuen Abenteuer aufbrechen.");
talkEntry:addResponse("Ach, das iset doch nicht wichti-hig, wie's mir geht! Sagt mir, wie gehthigt's Euch?");
talkEntry:addResponse("Es geht mir wie an großen Tagen. Einst als iche noch Orkling war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am the famous Brute Booze! Living legend and known everywhere. You heard about my deeds, didn't you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Iche binne der berühmte Brute Booze! Lebendihige Legende und Berühmtheit! Sicherheitlich habt ihr von meinen Taten gehöright.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, well. People keep being questionish about work and task. Do so and you will be one day be as heroish as me. I am not hireish, though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Hach, ja-ja! Fraget immerhig alle Leute nach Arbeit und Aufgaben. Dann werdet auch Ihr eines Tagiges ein ebenso großer Held sein, wie iche es bin. Allerdings habe iche im Moment keine Arbeit fü-hür Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Ah, well. People keep being questionish about work and task. Do so and you will be one day be as heroish as me. I am not hireish, though.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Hach, ja-ja! Fraget immerhig alle Leute nach Arbeit und Aufgaben. Dann werdet auch Ihr eines Tagiges ein ebenso großer Held sein, wie iche es bin. Allerdings habe iche im Moment keine Arbeit fü-hür Euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Ain't no king, ain't no smith, ain't no peasant. My life is adventurish!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Binne kein König. Binne kein Schmied. Binne kein Bauer. Mein Leben iset das Abenteuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ain't no king, ain't no smith, ain't no peasant. My life is adventurish!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Binne kein König. Binne kein Schmied. Binne kein Bauer. Mein Leben iset das Abenteuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Indeedish, even on Gobaith I drank a stale beer. Some say it should be called Gobiath but this was misspellish on a common map. It is Gobaith!");
talkEntry:addResponse("Indeedish, even on Gobaith I drank a stale beer. An unimportant island but something exciting happened every day.");
talkEntry:addResponse("Indeedish, even on Gobaith I drank a stale beer. A small smut on the map but full of tall men that were prideish and braveryish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Sicherlin, selbst auf Gobaith drank iche ein schales Bier. Viele meinen es hieße Gobiath, doch tatsächlich wurde der Name in der oft abgezeichneten Karte falsch geschriebigt. Es heißt Gobaith.");
talkEntry:addResponse("Sicherlin, selbst auf Gobaith drank iche ein schales Bier. Es war eine kleine unscheinbare Insel, dennoche gab es immer viel Spannendes zu erlebigen.");
talkEntry:addResponse("Sicherlin, selbst auf Gobaith drank iche ein schales Bier. Ein unscheinbarer Flecken, doch befüllt mit großigen Männern voll Ehre und Mut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Sounds good.");
talkEntry:addResponse("Great!");
talkEntry:addResponse("Fine thing!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Das klinghigt sehr wohl in meinen Ohren.");
talkEntry:addResponse("Grossartig!");
talkEntry:addResponse("Eine sehr feine Sache iset das.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heoric");
talkEntry:addTrigger("deed");
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Heldentate");
talkEntry:addResponse("Vor drei Wintern, erschlug Brute Booze die Schlangenbestie, Myr Tobars! Ihr Leib wahr-higte so dick wie der einer Eiche und ungezähligte Mann lang. Zum dank gab der Hochpriester, Brute Booze seine Tochter zum Weib!");
talkEntry:addResponse("Sieben Winter iset es her, da erlegte iche den Fluch Kang-Arr's. Ein Bär groß für drei Norodaj-Krieger, übersähet mit armlangen Stacheln. An jenem Tag ernannte mich Fürst Aramar Ingelfsen von Kathun zum fahrigenden Ritter seines Hofes.");
talkEntry:addResponse("Einst, als ich im eisigen Karras war, bedrohhigte ein dämonischer Wyrm das Land. Viele Krieger mussten sterben, doch endlich spießte man das Untier mit geeinigter Kraft auf. Seit da an genoß iche Ansehen und Ehre unter Karras' Norodaj.");
talkEntry:addResponse("Vor vier Wintern, gelang es den Hofmagiern des Triumvirats in Falmarha, mit meiniger Hilfe Lad'Nothratar den Metzger zu pfählen. Ein altertühmlicher Vampir, dessen Tot, iche den Ehrentitel 'Ehrenhafter Magier Falmarhas' verdankige.");
talkEntry:addResponse("Hossa! Seit einem Jahr besitze iche, Brute Booze das kupferige Fell des Löwen Azzors, der einst dutzende mutige Krieger Nubris' verschlang. Mich zu Ehre steht ein kupferiges Abbild des Kampfes vor einem dem Tempel Malachins.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("town");
talkEntry:addTrigger("village");
talkEntry:addTrigger("city");
talkEntry:addTrigger("cities");
talkEntry:addResponse("[RINCE: PLEASE WRITE DOWN SOME SORT OF LIST OF THE TOWNS!]");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadt");
talkEntry:addTrigger("Städte");
talkEntry:addTrigger("Dorf");
talkEntry:addTrigger("Dörfer");
talkEntry:addResponse("[RINCE: AND TRANSLATE IT!]");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kroch");
talkEntry:addTrigger("Gurak");
talkEntry:addResponse("Kroch'Gurak! Das Winterlager, der wilden Klans. Ein kolossales Höhlengebilde, druchdrungen vom rythmischen Klang der Trommeln. Alles iset voll mit Orklingen die Vieh herumtreiben und es riecht nach Bohnenschnaps!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fireshine");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fireshine");
talkEntry:addResponse("Fireshine! Die Drachenburg der Flammenorks. Aus schwarzem Lava-Stein herausgehauen, werden die Orks von Khor-Anthalatosh, Träger der Inneren Flamme, großer Drache des Nordens, geleitet. Diese Festung iset im wahren Sinn des Worts, erleuchtigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Judgement");
talkEntry:addTrigger("Flame");
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Flamme");
talkEntry:addTrigger("Gerechtigkeit");
talkEntry:addResponse("Die Flamme der Gerechtigkeit iset eine Klosterburg der Flammenorks. Dreimal täglich rufen laute, tief schallende Hörner in den Tempeln, die Paladine und Mönche zum Gebet. Allerdings verschließt man den Reisenden den Inneren Teil der Stadt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khaari");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khaari");
talkEntry:addResponse("Iche will Euch sagen, das Licht von Khaari iset eine Stadt der Flammenorks. Und über der Stadt thront der Tempel der Flamme dessen Drachenfeuer so hell leuchtet, das die Stadt niemals im Dunkeln liegt. Selbst in der Nacht nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sevenhill");
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Siebenberg");
talkEntry:addResponse("Tja, nichtmal Menschen lass-hen die Zwerge nach Siebenberg hinein. Also kann iche Euch nur sagigen, was man hört. Es soll eine Miene sein, und die ausgegrabigten Schätze unermässlich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Storm");
talkEntry:addTrigger("Keep");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Storm");
talkEntry:addTrigger("Keep");
talkEntry:addResponse("Es war wirklich schwierig nach Storm's Keeo zu gelangen. Sehr weit im Norden und nur wenig Fremde dort. Die Schmiedekunst dort, iset jedoch weithin legendär.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Arn");
talkEntry:addTrigger("Gharrach");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Arn");
talkEntry:addTrigger("Gharrach");
talkEntry:addResponse("Arn-Gharrach, wohl das älteste Zwergenreich. Es iset die Stadt des Handels und auch 'Oberwelter' wie man dort sagt, haben Zutritt. Vor allem möchte iche das Bier der Zwerge lobend erwähnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Firnismill");
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Firnismühle");
talkEntry:addResponse("Firnismühle iset für seine Gastfreundschaft berühmt. Als Ork, iset man aber trotzdem nicht gern gesehen. Jedenfalls iset es dort sehr Grün und voll mit Gärten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pennymill");
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pfennigmühle");
talkEntry:addResponse("In Pfennigmühle iset das Gemüse für gewöhnlich doppelt so groß wie anders wo. Mir war's dort allerdings zu ruhig und iche blieb nicht besonders lange.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldwillows");
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Altweiden");
talkEntry:addResponse("Ach, in Altweiden war iche nie. Aber iche glaub kaum, dass es die Reise wert iset.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irulaith");
talkEntry:addTrigger("Quenn");
talkEntry:addTrigger("Arah");
talkEntry:addTrigger("Shir");
talkEntry:addTrigger("Assiri");
talkEntry:addTrigger("Sor");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irulaith");
talkEntry:addTrigger("Quenn");
talkEntry:addTrigger("Arah");
talkEntry:addTrigger("Shir");
talkEntry:addTrigger("Assiri");
talkEntry:addTrigger("Sor");
talkEntry:addResponse("Das iset so eine Gnom-Stadt nicht wahr? Iche kann mir nicht vorstellen das die in der Wüste gutes Bier brauen, also war iche dort auch nie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kjelt");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kjelt");
talkEntry:addResponse("Die Sturmumtoste Stadt! Kjelt. Nachdem man Monate lang durch kalte trostlose Steppe reist, findet man eine anschauliche Festung. Die Menschen dort sind uns Orks teils ähnlich und dann doch wieder ganz anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Karras");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Karras");
talkEntry:addResponse("Karras die Stadt aus Eis. Es iset selbst im Sommer nicht warm genug um die Mauern zu schmelzen, ließ iche mir sagen. Man bekommt heißes Bier zum saufen und würzigen Wein. Die Reise war mir jede abgefrorigte Zehe wert!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ann");
talkEntry:addTrigger("Korr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ann");
talkEntry:addTrigger("Korr");
talkEntry:addResponse("Ann'Korr iset eine besonders alte Hafenstadt. Man hat sie in verschiedene Viertel geteilt, und je wohlhabender man iset hat man sein Haus wo anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fennsworth");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fennsworth");
talkEntry:addResponse("Wenn man n' Ork iset, darf man Fennsworth nur als Sklave betrethigen. Also war iche dort nie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kang");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kang");
talkEntry:addResponse("Kang-Arr iset wohl die bekömmlichste Stadt für einen Reisenden im ganzen Albarischen Reich. Gi-hibt eine Menge Menschen aus dem Norden dort. Schätze das hat einen nützlichen Einfluss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldford");
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Altfurten");
talkEntry:addResponse("Altfurten iset ein Dorf, wird man sagen, wenn man so viele große Städte beschaut hat wie iche. Aber der Gasthof 'The Grumbler's Head' iset berüchtigend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Myr");
talkEntry:addTrigger("Tobar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Myr");
talkEntry:addTrigger("Tobar");
talkEntry:addResponse("Myr-Tobar, die Jadestadt, das grüne Herz des Dschungels. Die sieben großen Tempel gehören angesehen. Und überhaupt möchten diese Menschen die Zahl Sieben sehr gern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khenserra");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khenserra");
talkEntry:addResponse("Khenserra iset eine staubige Mienenstadt. Sogar'n Oger hab iche dort gesehen. Eine gute Stadt wenn ein Ork schnell Geld braucht. Es riecht zwar nicht schön, iset aber Elfenfrei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Falmarha");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Falmarha");
talkEntry:addResponse("Falmarha iset eine Art Festung im Meer. Die Gasthöfe sind günstig und die Menschen bedienen einen wie Sklaven. Iche will sagen, so viele Schiffe sah iche dort zum Ersten Mal.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Laris");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Laris");
talkEntry:addResponse("Laris iset auch eine Festung, wenn man das so sagen will. Man hat sogar einen Fluss gezähmhigt und umgegraben. Das wichtigste iset aber der Wein. DER WEIN!...sollte man getrunken haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nubris");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nubris");
talkEntry:addResponse("Lassigt Euch sagen, die Menschen in Nubris, haben schwarze Haut, wie meine Grün iset. Ihre Stadt nennen sie das goldene Juwel des Südens und es giehebt unzählige Gewürze und anderen Kram zu kaufigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mitsobar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mitsobar");
talkEntry:addResponse("In Mitsobar gibt es kräftiges Bier und starkigen , braunen Schnaps. Und davon saufen die Menschen beachtlicher Menge. Außerdem fressen die Menschen dorte Fische als wären sie Echsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Koldamar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Koldamar");
talkEntry:addResponse("Koldamar iset eine langweilige windige Stadt. Alle denken viel nach und sprechen wene-hig. Wenn ihr den Dschungel nicht mögt, könnt ihr dort Echsenmenschen sehigen... - Sodar die Götter es wollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor");
talkEntry:addTrigger("Angur");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("xxx");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor");
talkEntry:addTrigger("Angur");
talkEntry:addResponse("In Lor-Angur iset's voll mit Elfen die meinen sie sind besonderig klug. Und die Menschen sind nichtig besser. Allesamte fröhnen sie der Zauberei und solch gefährlichen Sachen.");
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
talkEntry:addResponse("Iche hab mir sagen lassen, der Erzmagier Runewicks, Elvaine Morgan iset ein Elf aus Lor-Angur.");
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
talkEntry:addResponse("Iche hab mir sagen lassen, der Erzmagier Runewicks, Elvaine Morgan iset ein Elf aus Lor-Angur.");
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
talkEntry:addResponse("In Runewick hält mich nichts. Meine Nackenhaare sträubigen sich wenn Zauberei in der Nähe iset.");
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
talkEntry:addResponse("Ein Zwerg aus Gynk. Don Valerio Guilianni. Ein Skrupeloser Händler, alles im alligen.");
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
talkEntry:addResponse("Das Bier in Galmair iset gut. Aber wenn man nicht aufpassigt klauen sie einem den Geldbeutel, noch bevor man die Zeche begleichen kann.");
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
talkEntry:addResponse("Eine Königin der Menschen. Wohl von den Göttern erwählt. - Iche bevorzuge ja eher Prinzessinen in verinsamten Türmsen.");
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
talkEntry:addResponse("Eine Königin der Menschen. Wohl von den Göttern erwählt. - Iche bevorzuge ja eher Prinzessinen in verinsamten Türmsen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("It is too dry in Cadomyr. And there ain't no beer good enough that will make me stayish!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Es iset mir zu trocken in Cadomyr. Und kein Bier dort iset gut genug um lange dort zu bleibigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Albar");
talkEntry:addResponse("Iche muss Euch gestehen, um Albar hab iche einen weiten Bogen gemacht. 's heißt dort sperrt man Leute ohne Arbeit in die Minen. Von Orks will iche gar nicht sprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Lasst Euch sagen, wenn ihr was verbotenes machen wollt, macht es in Gynk. Stechkraut und Sibanac wird einem überall feilgeboten. Und die Sklaven sind reicher als die Arbeiter.");
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
talkEntry:addResponse("Salkamar - Die Stadt der Sonne. Dort steht der größte Tempel der bekannten Welt, der Tempel des Rades und Bücher hortet man wie Schätze in großen Hallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("My forefathers are always with me while being travelish.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Meine Vorahnen si-hind auf meinen Reisen immer beihe mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I am sorry, nothing to sell I am possesionish and none of your goods is valueish for me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Iche bedauerige sehr, nichts habe iche zu verkaufen und keine Eurer Sachen sind mir von Wertlichkeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("When is was cubish, someone asked me what I wanted to achieve before I am deadish. And I said that I want to drink a beer in every town of Illarion. The next day, I was travelish.");
talkEntry:addResponse("Since I left the Norbug plateau I visited many towns. If you want to be knowledgeish, ask me. I love to tell about foreign towns!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Als iche noch ein Orkling war, fragte mich einer was iche getan haben wollte, sei iche erst tot. Und iche sagte, iche wollte in jeder Stadt Illarions ein Bier getrunken haben. Tags darauf war iche scho-hon aufgebrochen.");
talkEntry:addResponse("Seit iche damals das Norbug-Plateau verließ, binne iche in viele der bekannten Städte gereist. Wenn Ihr also etwas zu Wissen versucht, fragt mich ruhig aus. Iche erzähle gernig von allersamt fremden Städten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brute");
talkEntry:addTrigger("Booze");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("That's me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Brute");
talkEntry:addTrigger("Booze");
talkEntry:addResponse("Das iche binne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Truly bigly!");
talkEntry:addResponse("I am honourish.");
talkEntry:addResponse("Enjoyish, I am.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Wahrlich, von Größe!");
talkEntry:addResponse("Iche binne geehrt.");
talkEntry:addResponse("Es iset mir ein Vergnü-higen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Is dat so?");
talkEntry:addResponse("Indeedish?");
talkEntry:addResponse("Hm-hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Iset das so?");
talkEntry:addResponse("Tatsächlich?");
talkEntry:addResponse("Hm-hm.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(40));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(40));
talkEntry:addResponse("Aber, sahegt mir, was wollt ihr alles getan haben, seid ihr erst einmalig tot?");
talkEntry:addResponse("Ja-ha. Das ist gleich wie damalsig. Als iche den Stachelbären Kang-Arr's zur strecke danieder brachte.");
talkEntry:addResponse("Hurr - wenn iche das hörige muss ich an meine Heldentaten denkigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me grunzt vergnügt und nimmt einen Schluck aus seinem Tonkrug.", "ENGLISH.");
talkingNPC:addCycleText("#me nickt sich selbst zu und wirft einen Blick in seine Tasche. Dann holt er eine halbe Wurst hervor und beißt davon ab.", "ENGLISH.");
talkingNPC:addCycleText("#me kratzt sich an der Nase.", "#me scratches his nose.");
talkingNPC:addCycleText("#me streckt seine Zunge heraus und grinst.", "ENGLISH.");
talkingNPC:addCycleText("#me spannt seine muskulösen Arme an und streckt sich demonstrativ.", "ENGLISH.");
talkingNPC:addCycleText("#me lächelt und lässt dabei abwechselnd seinen linken Brustmuskel hüpfen und dann den Rechten.", "ENGLISH.");
talkingNPC:addCycleText("#me nimmt seinen Trinkschlauch vom Gürtel und nimmt einen Schluck daraus.", "ENGLISH.");
talkingNPC:addCycleText("#me fährt sich mit der Hand über seinen kahlen Kopf und zeigt dabei, gewinnend lächelnd, seine blendend weißen Zähne.", "ENGLISH.");
talkingNPC:addCycleText("#me zupft mit seinen gepflegten Händen am Spitzbart.", "ENGLISH.");
talkingNPC:addCycleText("#me stemmt die Arme in die Seiten und streckt den Oberkörper durch.", "ENGLISH.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein stattlicher Ork, mit selbstbewusstem Lächeln. Er trägt nichts am Oberkörper und spricht mit seltsamem Akzent.", "An impressive orc, smiling with confidence. His chest is bare and he speaks with a strange accent.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 0);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 2642);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 2113);
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