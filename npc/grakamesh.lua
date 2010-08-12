--------------------------------------------------------------------------------
-- NPC Name: Grakamesh                                                Cadomyr --
-- NPC Job:  Shaman                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  136, 625, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: August 12, 2010                         easyNPC Parser v1.00 --
--------------------------------------------------------------------------------

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.queststatus")
require("npc.base.consequence.rankpoints")
require("npc.base.talk")
module("npc.grakamesh", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("set 0");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Debugging] Quest status set to 0"));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 22));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Error] Something went wrong, please inform a developer."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Grakamesh the shaman. Keyphrases: Greebas, quest, tomb, spook, Sir Reginald."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schamane Grakamesh. Schlüsselwörter: Greebas, Quest, Gruft, Spuk, Sir Reginald."));
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
talkEntry:addResponse("Greebas. Honour dem dead!");
talkEntry:addResponse("Hurr! Yoos look like yoos can help mes - mes dance fer salvation.");
talkEntry:addResponse("Greebs. Nub hab much time fer yoos, need to dance and sing more to scare away evil spook.");
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
talkEntry:addResponse("Greebas. Ehre die Ahnen!");
talkEntry:addResponse("Hurr! Du sehst aus als kannst helfen mir - mirr tanzt ür Heil von Seele.");
talkEntry:addResponse("Greebs. Grakamesh hat wenig Zeit für dich. Mirr muss tanzen und singt, zu vertreiben bösen Spuk.");
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
talkEntry:addResponse("Greebas. Honour dem dead!");
talkEntry:addResponse("Hurr! Yoos look like yoos can help mes - mes dance fer salvation.");
talkEntry:addResponse("Greebs. Nub hab much time fer yoos, need to dance and sing more to scare away evil spook.");
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
talkEntry:addResponse("Greebas. Ehre die Ahnen!");
talkEntry:addResponse("Hurr! Du sehst aus als kannst helfen mir - mirr tanzt für Heil von Seele.");
talkEntry:addResponse("Greebs. Grakamesh hat wenig Zeit für dich. Mirr muss tanzen und singt, zu vertreiben bösen Spuk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebbas! Pray fer old oomie chief, Reginald, will yoos?");
talkEntry:addResponse("Gud hunt!");
talkEntry:addResponse("Can yoos bring me sum banana when come back? Danks in advance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß¸");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebbas! Du betest für alten Häuptling der Oomies, yubba?");
talkEntry:addResponse("Gute Jagd!");
talkEntry:addResponse("Kannst du mir bringen mit... Bananen? Gedankt sei dir schon jetzig.");
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
talkEntry:addResponse("Farebbas! Pray fer old oomie chief, Reginald, will yoos?");
talkEntry:addResponse("Gud hunt!");
talkEntry:addResponse("Can yoos bring me sum banana when come back? Danks in advance.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebbas! Du betest für alten Häuptling der Oomies, yubba?");
talkEntry:addResponse("Gute Jagd!");
talkEntry:addResponse("Kannst du mir bringen mit... Bananen? Gedankt sei dir schon jetzig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Dem gods, dey will hear mes singin'. Mes gottur dance and sing to scare away spook from old oomie chief tomb.");
talkEntry:addResponse("Mes feel like dancin'.");
talkEntry:addResponse("Danks, but mes feel much better if all spook be smashed and Reginald oomie can rest in dat peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befinden");
talkEntry:addResponse("Die Götta, werden hören meine Gesang! Grakamesh wird singen und tanzen, alle böser Spuk.");
talkEntry:addResponse("Mirr fühlt den Rhytmus!");
talkEntry:addResponse("Danks, aber mirr fühlen besser vieles, wenn alle böser Spuk zerschlagen und zerhauen ist. Dann Reginald-Oomie wir druhen in Ruhe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Me dat shaman Grakamesh. Mes now lotsa about stuff and spook.");
talkEntry:addResponse("Grakamesh, dat shaman, at yoos service... after mes hab dance.");
talkEntry:addResponse("Hurr, Grakamesh mes be!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich binne der Schamane Grakamesh. Er weiß vieles über Sachen und Spuk.");
talkEntry:addResponse("Grakamesh, der Schamane zu deiner Dienste...wenn mir getanzt fertig.");
talkEntry:addResponse("Hurr, Ich binne Grakamesh!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Whub! Mes nub trade, mes dance and pray. Mes be shaman, nub hawker.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Wars? Mirr nix handelt, mir tanzt und betet! Mirr ist Schamane, nicht Höker.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Hab hear dat legend op Reginald oomie? Dat be old chief op Cadomyr. Honourable oomie. Died and now daughter be queen - uncommon, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Du gehört hast Legende von Oomie Reginald? Den alte Häuptling von Cadomyr. Ehrenhafter Oomie. Er gestorben, nun Tochter ist Häuptling - witzig, eh?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Me be Grakamesh, dat shaman op Cadomyr. Mes dance fer fallen ones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich binne Grakamesh, der Schamane von Cadomyr. Ich tanze für die Gestorbenen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Me be Grakamesh, dat shaman op Cadomyr. Mes dance fer fallen ones.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich binne Grakamesh, der Schamane von Cadomyr. Ich tanze für die Gestorbenen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Neva hab hear op dat place, sorries.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hab nie gehört von solche Ort. Nie, nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("I am");
talkEntry:addTrigger("my name");
talkEntry:addResponse("And me be Grakamesh. Mes shaman op tribe op Cadomyr orcis. Dancin' fer fallen, dat mes be doin'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Und mir ist Grakamesh. Der Schamane von Cadomyrs Orks. Tanzen für die Toten, das ist meine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("shaman");
talkEntry:addResponse("Yubba, mes be shaman. Mes be prayin' fer fallen oomies. So dem can rest in peace.");
talkEntry:addResponse("Shaman be important member op orc society. Shaman be religious leader! Me be shaman!");
talkEntry:addResponse("Whub want know about shamans? Mes be shaman. Can answer, mes dink.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tomb");
talkEntry:addResponse("Dat da behind mes, dat be tomb of Reginald Edwards. Mes dance so that spook goes away, but nub avail.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald,english");
talkEntry:addResponse("Old oomie chief dat be. He be buried here, in dat tomb over dere. But dat haunts dere!");
talkEntry:addResponse("Mes was present when dat old oomie chief was buried. Mes gib blessings! But blessings... nub hab work. Dat haunts!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("haunt");
talkEntry:addTrigger("spook");
talkEntry:addTrigger("ghost");
talkEntry:addTrigger("wraith");
talkEntry:addResponse("Tomb op old oomie chief, Reginald, dere dat haunts. Will yoos do task fer mes?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("orc");
talkEntry:addResponse("Orc society complicated. Mes nub dink dat everyone understand. Shaman dance important fer society and afterlife.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dance");
talkEntry:addTrigger("salvation");
talkEntry:addResponse("Dat dance mes be dancin', dat be dance op death. When fallen ones nub can rest in peace, dancin' is all dat helps.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hastings");
talkEntry:addTrigger("Baron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr! Hastings oomie must be responsible fer spook. Dat be illoyal, honourless oomie! Plans evil dings all day long.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schamane");
talkEntry:addResponse("Yubba, michse ist der Schamane. Ich bete für die Toten, damit sie ruhen in Friede.");
talkEntry:addResponse("Der Schamane ist wichtiger Teil von Orkische Gesellschaft. Der Schamane ist religöser Kopf. Ich binne der Schamane!");
talkEntry:addResponse("Was du wissen willst? Ich binne der Schamane. Weiß¸ viel über Vieles.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gruft");
talkEntry:addResponse("Diese hinter mir, ist die Gruft von Reginald Edwards. Ich tanze, so der böß¸e Spuk wird vergehen");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Reginald");
talkEntry:addResponse("Er alte Häuptling der Oomies. Er bergraben ist, in dieser Gruft. Doch böser Spuk dort treibt es.");
talkEntry:addResponse("Ich war dort, als sie den alten Häuptling begrubigten. Mir gab heiligen Segen! Doch es war nicht Nutze. Es Spukt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spuk");
talkEntry:addTrigger("Geist");
talkEntry:addTrigger("Gespenst");
talkEntry:addResponse("Dort issigt ein böser Spuk in der Gruft von alten Häuptling Reginald. Wirst du mir bei einer Aufgabe helfigen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ork");
talkEntry:addResponse("Die Orkische Gesellschaft ist eine Komplizierte. Ich nicht glaube, dass jeder es versteht. So, der Tanz des Schamanen ist von Wichtigkeit für das Nachleben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanz");
talkEntry:addTrigger("Erlösung");
talkEntry:addResponse("Der Tanz, welchen ich tanzige, ist der Tanz der Toten. Wenn die toten nicht liegen in Friede, der Tanz alleine ist jener der Hilfe brignen kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hasting");
talkEntry:addTrigger("Baron");
talkEntry:addResponse("Hurr! Oomie Hastings trägt Schuld an dem Spuk, mit Sicherheit. Er ehrlos! Er unloyal! Er plant den ganzen Tag, boß¸hafte Pläne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yag!");
talkEntry:addResponse("Dat majik treehugger op Runewick nub be gud. Nub honour orcis, nub honour dem gods!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("archmage");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Yag!");
talkEntry:addResponse("Diese magische Baumkuschler von Runewick ist nicht gut. Er nicht ehrt Orks, er nicht ehrt deren Götter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nub hab faith in dat town op Runewick. But impressive big tents dey hab. When nub dance enuff, gods will smash tents, mes dink.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dort ist kein Glaube, in Stadt von Runewick. Aber beeindruckend große Zelt haben sie. Wenn sie nicht genügend tanzen... werden die Götter alles zerschlagen, denke ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Groar!");
talkEntry:addResponse("Grrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Groar!");
talkEntry:addResponse("Grrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dem radur stoopid in Galmair. Dey nub understand how important faith be. Dey just pray to gold, like dem stumpies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("In Galmair, sie wirklich dumm sind. Niemand versteht die Wichtigkeit von Glaube, dort. Sie nur beten zum Gold, so wie es die Stumpfe tun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dat female hab respect fer orcis. Orcis proud and hab honour. Dem orcis loyal to queen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("königin");
talkEntry:addTrigger("queen");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Diese Weib hat respekt für die Orks übrig. Orks sind stolz und haben Ehre. Also Orcs stehen hinter der Königin!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr be gud place fer orc warriors. All hab faith in dem gods and all hab honour. Like dat should be!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist ein guter Ort, für Krieger der Orks. Jeder hat Glaube in die Götter und issigt ehrenhaft. So wie es sein sollte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Many oomies op Cadomyr be from Albar. Nub know whub dat fer place, but if dat like Cadomyr, den dat gud place fer orc warriors. Even though oomies hab tell me dat nub true....");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Viele Oomies in Cadomyr kommen aus Albar. Ich nicht weiß¸, was dies für ein Ort ist, doch ist er so wie Cadomyr, ist er bestimmt ein guter Ort für Orks. Auch wenn sie mir sagen das dies nicht stimmig ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gynk place widout honour! Nub go dere, neva. When sumbody challenge yoos fer duell, den neva can be sure dat udder oomie nub backstab yoos.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("In Gynk findet niemand Ehre. Geh nicht dort hin, nichtmals. Wenn du gefordert wirst zu einem Duell, du  nie in Sicherheit bist, der andere Oomie könnte in deinen Rücken fallen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ah, mes hab hear lotsa about dat Salkamar. Proud realm, dat be. Mes dink also gud hunting dere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ah, mir hat viel gehört aus Salkamar. Stolzes Land, das ist es. Mirr denkt, dort ist gut Jagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Dere be lotsa gods, more den Grakamesh hab fingers. Mes honour dem all, but mes heart beats fer Brágon, god op fire, alone.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Mehr als Grakamesh Finger hat, es Götter gibt. Aber mein Herz schlägt für Brágon alleine, dem Gott der Feuer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Brágon is dat lord and dat everyding. Brágon is creator! Look around, creator of whub yoos see, dat be BrÃ?Â¡gon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Brágon ist der Herr. Der Erschaffer! Blick dich umher, der Erschaffer von alles was sehbar ist. Das ist BrÃ?Â¡gon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mes dance fer pleasin' Cherga, dat mes be doin'. Cherga be lady of afterlife. And yoos and mes, both will go afterlife one day, nub? Nub mess wid Cherga!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich tanze um Cherga zu bittigen, das tuh ich. Cherga ist die Herrin des Nachlebens. Und du und ich, beide wollen wir eines Tages das Nachleben erleben, nicht wahr? Verärgere die eisige Hexe, Cherga nicht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachí­n");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("So, yoos dink dat all orcis dat nub pray to dat Moshran pray to dat MalachÃ?Â­n? Yoos hab lotsa learn, yoos hab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachí­n");
talkEntry:addResponse("So, du denken, dass alle Orks die nicht zu Moshran beten, zu Malachin beten indessen? Viel zu lernen du hast, hast du wirklich...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Yoos dink dem orcis all pray to dat Moshran? Yoos hab lotsa learn, yoos hab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Denkst du, alle Orks folgen Moshran? Viel zu lernen du hast, hast du wirklich...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 0));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Sir Reginald's Tomb I"));
talkEntry:addResponse("So, nub can dance but want help mes? Reginald oomie nub can rest in peace. Scary mummies haunt tomb, dey moan all day long. Hab dis torch and smash as many as mes hab fingers!");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sir Reginalds Gruft I"));
talkEntry:addResponse("So, du kannst nix tanzen willst mir aber helfen? Omie Reginald liegt nicht in Friede. Schreckliche Mumien spuken in seiner Gruft, den ganzen Tag lange. Nehme diese Fackel und zerhau sie zu stücke. Für jeden meiner Finger eine!");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Sir Reginald's Tomb I"));
talkEntry:addResponse("So, nub can dance but want help mes? Reginald oomie nub can rest in peace. Scary mummies haunt tomb, dey moan all day long. Hab dis torch and smash as many as mes hab fingers!");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 0));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sir Reginalds Gruft I"));
talkEntry:addResponse("So, du kannst nix tanzen willst mir aber helfen? Omie Reginald liegt nicht in Friede. Schreckliche Mumien spuken in seiner Gruft, den ganzen Tag lange. Nehme diese Fackel und zerhau sie zu stücke. Für jeden meiner Finger eine!");
talkEntry:addConsequence(npc.base.consequence.item.item(391, 1, 399, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dere be lotsa mummies dat haunt tomb op Reginald oomie. Dat be so respectless! Beat dem up so Reginald oomie can rest in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 11));
talkEntry:addResponse("Viele Mumien spuken in der Gruft von Oomie Reginald. Dass ist respektloß¸! Hau sie in kleine Stücke! So wird Reginald in Frieden liegen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 11));
talkEntry:addResponse("Dere be lotsa mummies dat haunt tomb op Reginald oomie. Dat be so respectless! Beat dem up so Reginald oomie can rest in peace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 0));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 11));
talkEntry:addResponse("Viele Mumien spuken in der Gruft von Oomie Reginald. Dass ist respektloß¸! Hau sie in kleine Stücke! So wird Reginald in Frieden liegen können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Gud! Yoos hab smash hauntin' mummies. Here, hab sum shinies - but mission to let Reginald oomie rest in peace nub completed...");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 11));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins."));
talkEntry:addResponse("Gud! Yoos hab smash hauntin' mummies. Here, hab sum shinies - but mission to let Reginald oomie rest in peace nub completed...");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 11));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Guut! Du hast die Mumien verjageht. Hier, nimmst du dieses Glitza - aber die Mission ist trotz allem noch nicht zu Ende gebracht, nein...");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 12));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 11));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke."));
talkEntry:addResponse("Guut! Du hast die Mumien verjageht. Hier, nimmst du dieses Glitza - aber die Mission ist trotz allem noch nicht zu Ende gebracht, nein...");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Sir Reginald's Tomb II"));
talkEntry:addResponse("Hab seen dem floating skulls in dat tomb? Dey be evil ghosts dat desecrate grave op honourable old oomie chief. Crush one hand op finger op dem!");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sir Reginalds Gruft II"));
talkEntry:addResponse("Sahst du die schwebenden Schädel in der Gruft? Dies sinned böß¸e geister, entheiligen das Grab des ehrenvollen alten Oomie Häuptlings. Brich die Schädel! Eine Hand voll Fingern.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Sir Reginald's Tomb II"));
talkEntry:addResponse("Hab seen dem floating skulls in dat tomb? Dey be evil ghosts dat desecrate grave op honourable old oomie chief. Crush one hand op finger op dem!");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sir Reginalds Gruft II"));
talkEntry:addResponse("Sahst du die schwebenden Schädel in der Gruft? Dies sinned böß¸e geister, entheiligen das Grab des ehrenvollen alten Oomie Häuptlings. Brich die Schädel! Eine Hand voll Fingern.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dem evil skulls still haunt dat tomb op old oomie chief. Dat be... blasphemy! Bring peace to tomb, smash 'em.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 18));
talkEntry:addResponse("Die bösen Schädel spuken weiternoch. Das ist... Ketzerei! Befriede die Gruft, zerhau sie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 18));
talkEntry:addResponse("Dem evil skulls still haunt dat tomb op old oomie chief. Dat be... blasphemy! Bring peace to tomb, smash 'em.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 12));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 18));
talkEntry:addResponse("Die bösen Schädel spuken weiternoch. Das ist... Ketzerei! Befriede die Gruft, zerhau sie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and a skull staff. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Great! Yoos hab split evil skulls, dem nub gonna haunt anymore. Here, hab dis staff fer more skull smashin'!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 19));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 18));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded 100 copper coins and a skull staff."));
talkEntry:addResponse("Great! Yoos hab split evil skulls, dem nub gonna haunt anymore. Here, hab dis staff fer more skull smashin'!");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 18));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und einen Schädelstab. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Großartig! Die Splitter der böß¸en Schädel übersähigen den heiligen Boden! Dein Lohn seis, dieser Stab.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 19));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 18));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst 100 Kupferstücke und einen Schädelstab."));
talkEntry:addResponse("Groß¸artig! Die Splitter der bösen Schädel übersähigen den heiligen Boden! Dein Lohn seis, dieser Stab.");
talkEntry:addConsequence(npc.base.consequence.money.money("+", 100));
talkEntry:addConsequence(npc.base.consequence.item.item(39, 1, 599, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 19));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Sir Reginald's Tomb III"));
talkEntry:addResponse("Cherga hab shown mes origin of all spook while dancin'. Dere be restless ghost op foe op Reginald oomie, hauntin' in tomb, want take revenge or sumding. Banish dat and Reginald hab peace.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sir Reginalds Gruft III"));
talkEntry:addResponse("Cherga ließ mich den Ursprung allen Spukes sehen, während des Tanzes. Yubba. Dort ist ein rastloses Gespenst. Ein alter Feind, des verstorbenen Häuptlings, er nun sucht seine Rache oder sowie. Vertreibe das Ding und Reginald hat Friede.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New quest] Sir Reginald's Tomb III"));
talkEntry:addResponse("Cherga hab shown mes origin of all spook while dancin'. Dere be restless ghost op foe op Reginald oomie, hauntin' in tomb, want take revenge or sumding. Banish dat and Reginald hab peace.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 19));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Sir Reginalds Gruft III"));
talkEntry:addResponse("Cherga ließ¸ mich den Ursprung allen Spukes sehen, während des Tanzes. Yubba. Dort ist ein rastloses Gespenst. Ein alter Feind, des verstorbenen Häuptlings, er nun sucht seine Rache oder sowie. Vertreibe das Ding und Reginald hat Friede.");
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mes still feel evil presence op ghost op foe op old chief op Cadomyr. Expel dat from plane op mortals!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 21));
talkEntry:addResponse("Ich spüre die Anwesenheit des Gespenstes, immernoch. Verstoß¸e es von dem Land der Sterblichen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 21));
talkEntry:addResponse("Mes still feel evil presence op ghost op foe op old chief op Cadomyr. Expel dat from plane op mortals!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, ">", 19));
talkEntry:addCondition(npc.base.condition.quest.quest(78, "<", 21));
talkEntry:addResponse("Ich spüre die Anwesenheit des Gespenstes, immernoch. Verstoß¸e es von dem Land der Sterblichen!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a brown priest robe. You advance in Queen Rosaline Edwards' favour."));
talkEntry:addResponse("Awesome, yoos hab do dat! Now old oomie chief Reginald can rest in peace... fer a time. Mes hab reward fer yoos, robe op ghost buster.");
talkEntry:addConsequence(npc.base.consequence.item.item(2416, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 22));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 21));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest solved] You are awarded a brown priest robe."));
talkEntry:addResponse("Awesome, yoos hab do dat! Now old oomie chief Reginald can rest in peace... fer a time. Mes hab reward fer yoos, robe op ghost buster.");
talkEntry:addConsequence(npc.base.consequence.item.item(2416, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 21));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine braune Priesterrobe. Dein Ansehen bei Königin Rosaline Edwards steigt."));
talkEntry:addResponse("Ausgezeichigt, du hast es geschafft! Nun der alte Häuptling der Oomies Reginals wird in Frieden Liegen... für eine Weile. Dies issigt dein Lohn, die Robe eine Geisterjägers!");
talkEntry:addConsequence(npc.base.consequence.item.item(2416, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 22));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("Cadomyr", "+", 20));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".+");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 21));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest gelöst] Du erhältst eine braune Priesterrobe."));
talkEntry:addResponse("Ausgezeichigt, du hast es geschafft! Nun der alte Häuptling der Oomies Reginals wird in Frieden liegen... für eine Weile. Dies issigt dein Lohn, die Robe eine Geisterjägers!");
talkEntry:addConsequence(npc.base.consequence.item.item(2416, 1, 799, 0));
talkEntry:addConsequence(npc.base.consequence.queststatus.queststatus(78, "=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 22));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Danks fer everyding yoos hab do. Reginald oomie can now rest in peace. Until Hastings oomie does next mischief!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 22));
talkEntry:addResponse("Sei gedankt, für alle deine Taten. Reginald wird liegen in Friede, solange bis Oomie Hastings tut nächste misstat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 22));
talkEntry:addResponse("Danks fer everyding yoos hab do. Reginald oomie can now rest in peace. Until Hastings oomie does next mischief!.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(78, "=", 22));
talkEntry:addResponse("Sei gedankt, für alle deine Taten. Reginald wird liegen in Friede, solange bis Oomie Hastings tut nächste misstat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nvidia");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dem nub like Ati, mes dink!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nvidia");
talkEntry:addResponse("Uh, diese wohl nicht mögen Ati, es mir dünkt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mulder");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Dat be pretty spooky, too.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mulder");
talkEntry:addResponse("Uh... der auch schön gruselig ist!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me starts to dance wildly.");
talkEntry:addResponse("#me grunts: 'Whub?'");
talkEntry:addResponse("Whub?.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me beginnt wild zu tanzen.");
talkEntry:addResponse("#me grunzt: 'Whas?'");
talkEntry:addResponse("Whas?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Whub now?");
talkEntry:addResponse("#me stomps on the ground rhythmically.");
talkEntry:addResponse("Mes gottur dance more fer old oomie chief hab peace again.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Whas jetz'?");
talkEntry:addResponse("#me stampft rhytmisch auf den Boden.");
talkEntry:addResponse("Ich werdige tanzen, weiter für alte Oomie Häuptling.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me schüttelt eine Rassel und beginnt zu singen.", "#me starts to rattle and sings.");
talkingNPC:addCycleText("#me beginnt unrhythmisch zu tanzen.", "#me starts to dance unrhythmically.");
talkingNPC:addCycleText("#me schlägt seine Hände auf eine Trommel und singt: 'Heya, heya! Heya, heya!'", "#me slams his hands on a drum, singing: 'Heya, heya! Heya, heya!'");
talkingNPC:addCycleText("Hurrda, hurrda! Hurrda, hurrda!", "Hurrda, hurrda! Hurrda, hurrda!");
talkingNPC:addCycleText("Waka, waka, eh, eh!", "Waka, waka, eh, eh!");
talkingNPC:addCycleText("Ich will tanzen, tanzen, solange nichts zu mir fällt, was besser wäre.", "Mes feel like dancin', dancin', even if mes find sumding better to do.");
talkingNPC:addCycleText("Ich bin dein Tänzer! Ein Tänzer der Götter, das ist es was sie von mir verlangigen.", "Mes be your faithful dancer, a dancer fer gods, do whub yoos want me to do.");
talkingNPC:addCycleText("Dort ist böser Spuk in der Gruft! Tanzt mit mir und es wird vergehen!", "Dere be spook in tomb! Come, dance wid mes to banish dat!");
talkingNPC:addCycleText("#me atmet laut aus.", "#me exhales loudly.");
talkingNPC:addCycleText("#me tanzt, unverständlich singend, einen wilden unkoordinierten Tanz.", "#me dances a wild, uncoordinated dance, singing unintelligible.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schamane Grakamesh.", "This NPC is Grakamesh the shaman.");
mainNPC:setUseMessage("Hand wech!", "Hands op!");
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