--------------------------------------------------------------------------------
-- NPC Name: Grimlug                                                  Galmair --
-- NPC Job:  Shaman                                                           --
--                                                                            --
-- NPC Race: orc                        NPC Position:  385, 176, -6           --
-- NPC Sex:  male                       NPC Direction: southwest              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: August 18, 2012                          easyNPC Parser v1.2 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 385, 176, -6, 5, 'Grimlug', 'npc.grimlug', 0, 2, 5, 23, 6, 3, 137, 123, 60);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.state")
require("npc.base.consequence.inform")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.grimlug", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Grimlug the Shaman. Keywords: tell something, Olokwa, creation, gods."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Grimlug der Schamane. Schlüsselwörter: erzähl was, Olokwa, Schöpfung, Götter."));
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
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
talkEntry:addResponse("Greebas! How, the shaman 's able to help you?");
talkEntry:addResponse("Hurr! What's your desire?");
talkEntry:addResponse("Hullo! - Greets to you.");
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
talkEntry:addResponse("Greebas! Wie kann dir der Schamane helfigen?");
talkEntry:addResponse("Hurr! Was issigt dein Begehr?");
talkEntry:addResponse("Hullo! - Sei gegrüßigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Greebas! How, the shaman 's able to help you?");
talkEntry:addResponse("Hurr! What's your desire?");
talkEntry:addResponse("Hullo! - Greets to you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greebas! Wie kann dir der Schamane helfigen?");
talkEntry:addResponse("Hurr! Was issigt dein Begehr?");
talkEntry:addResponse("Hullo! - Sei gegrüßigt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Blessings to youb.");
talkEntry:addResponse("Good spirits shall guide your ways.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Segen über dich.");
talkEntry:addResponse("Gute Geister soll'n über deine Wege wachigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Blessings to youb.");
talkEntry:addResponse("Good spirits shall guide your ways.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Segen über dich.");
talkEntry:addResponse("Gute Geister soll'n über deine Wege wachigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#me nods slowly. 'I'm fienest. Yubba honored the gods today?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("#me nickt langsam. 'Ich binne bestens. Hast du heute die Götter geehret?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am' Grimlug. Who be you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich binne Grimlug. Wer seist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The shaman has no quests for you, right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Der Schamane hat keinige Aufgaben für dich - im Moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addResponse("The shaman has no quests for you, right now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Der Schamane hat keinige Aufgaben für dich - im Moment.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Gobaith! Hurr, the isle made the gods angry, now it have to bear it's desteny. Tagtha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith! Hurr, die Insel hat erzürnt die Götter. Nun es sein Schicksal tragen muß. Tagtha.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("The gods warmly pleasured to welcome youb here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Die Götter warmlich geerht, dich willkommen zu heißen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stop");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hrm, Grimlug should tell anoter tale?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stop");
talkEntry:addResponse("Hrm, Grimlug soll erzähligen etwas anderes?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("Wich tale mes should tell?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("Welche Geschichte Grimlug, soll erzählen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Creation");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Long tiem ago, dha gods become bored. So Bragon, dha older broddher ob Moshran our Faddha walked to him and let cut obb dha Bragons arm. Bodh collectad Bragons blood and modeled dha sun....");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("...Dha arm droped down, and become land. Wibh dha hand ob Bragon dhat beh left, Bragon took H'ref, the sun, and whipped it ober dha Arm, G'rak like it beh child...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("...Furthermore dha odha gods took parts of dham and creatad dha folk. Dheh dhrew dham on G'rak to see, ib dheh beh worthe to be. The folk beh cold and lifeless beh. Like G'rak...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("...But dha Faddha hub some of Bragons blood left. So he spilled all ob it ober G'rak. Dhen dha folk become warm in dhea bodehs. But some folk he forgat, so dheh beh still cold...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("...When dha Faddha slept his former female Cherga, dha iceh witch, she bewitched G'rak. Whub Moshran alwahs took whib him. G'rak budges and strains. Dha iceh witch received him. So dha spirit infest dha folk.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schoepfung");
talkEntry:addTrigger("Schöpfung");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Vor lange Zeit, den Göttern die Zeit zu lang wurde. Bragon, der ältere Bruder Moshrans gegangen zu ihm und ließ sich seinen Arm abhacken. Sie sammelten das Blut und geformten die Sonne...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("...Der Arm fiel runter und gewurde zum Land. Mit der verbleibenden Hand nahmigte Bragon sie Sonne, H'ref und schaukelt sie, als gewäse sie sein Kind, über seinen Arm, G'rak...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("...Darauf hin gingigen die anderen Götter her und nahmen Dinge von ihren Körpern um die Völker zu schaffen. Sie wurfen sie auf G'rak um zu besehen ob sie auch würding sind da zu sein...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("...Die Völker waren kalt und lebloßig. Wie G'rak. Aber Moshran behatte noch ein wenig von Bragons Blut übrig. Er verschüttete alles über G'rak. Darauf hinig wurde den Völkern wohlwarm in den Körpern...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("...Aber manche Völker vergaßet er. Sie sind kalt gebliebigt. Als Moshran, seinem damaligen Weib Cherga dazulag, der eisigen Hexe, verzauberte sie G'rak. Den Moshran immerstets mit sich trug...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("...G'rak regte sich und reckte sich. Und die eisige Hexe empfing ihn. So wurden die Völker vom Geist befallen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grak");
talkEntry:addTrigger("Href");
talkEntry:addTrigger("G'rak");
talkEntry:addTrigger("H'ref");
talkEntry:addTrigger("G rak");
talkEntry:addTrigger("H ref");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("G'rak beh beauteful and strong. And H'ref chooses him. She became dha female ob him. Dheh neba leave each other. And in dha night, when H'ref beh nub able to see her male...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addResponse("...she huse shineh mirror ob ore to hub a eye at G'rak. Dhat beh dha Moon. It rains when H'ref and G'rak lie dogetha. Ofta you hear dham gasp and yell. Dhat beh dha dhunda...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 8));
talkEntry:addResponse("...In dhat way dheh beget spirits. Whub beh here, from now on. Dhat beh dha bolts. And bolts beh dhea, whea dha power ob dha spirits beh bereh mighte.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grak");
talkEntry:addTrigger("Href");
talkEntry:addTrigger("G'rak");
talkEntry:addTrigger("H'ref");
talkEntry:addTrigger("G rak");
talkEntry:addTrigger("H ref");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("G'rak warig sehr schön und stark. Und H'ref aussuchte ihn. Sie wurdigte sein Weib. Nie gehen sie weg von einander. Und in der Nacht, wenn H'ref ihren Mann nicht ansehen kann...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addResponse("...hielt sie einen glänzigen Spiegel aus Erz so das sie nicht von ihm lassen muss. Das ist der Mond. Es regnet wenn G'rak und H'ref zusammenliegen. Oft hört man sie keuchen und rufen...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 8));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 8));
talkEntry:addResponse("...Das issigt der Donner. Und dabei zeugen sie Geister, die von nun an da sinnid. Das sind die Blitze. Und Blitze immer dort sind, wo die Kraft von Geistern besonders groß ist.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("spirit");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Nub all spirit be dha same. Most beh mixed. In Orc, dhea beh spirit of his ancestor. It is Moshrans spirit. It helps and protects broddhas and sistahs. It beh mighte, ib our skin honor and...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addResponse("...worship thea ancestors and dha Faddha. Ib it beh weak as Ommies, green skin earn resentment and bad luck. Furtha, in dha Orcs beh dha spirit ob Bragon. He makes dha bodeh warm...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 11));
talkEntry:addResponse("...Ib broddha or sistah dies, dha spirit beh brought ober dha eternal rift between G'rak and dha land ob dha ancestors. Dha Faddhas spirit beh leaved at G'rak, as long dha descendant praise dhea ancestors...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 12));
talkEntry:addResponse("...And in dhat waeh dha tie beh bind. Beh broddha or sistha calling ancestors, dham beh able to hear and help. Broddhas and sisthas also hub dha Chergas spirit. It beh dha voices yoo hear whispering in yoo...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 13));
talkEntry:addResponse("...Ib it beh berreh strong, dha broddha become shaman.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geist");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Nicht alle Geister gleich sinnid. Viele sind vermischt. Im Ork ist der Geist von seinem Ahnen. Es ist Moshrans Geist. Er hilft, und beschützt den Ork. Stets ist er stark, wenn...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 10));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 10));
talkEntry:addResponse("...die Ahnen und Moshran geehrt werden. Ist er schwach, werden dem Ork Unglück und Missgunst erfahren. Im Ork ist auch der Geist von Bragon. Er macht die Wärme im Körper. Wenn ein Ork stibt, dieser...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 11));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 11));
talkEntry:addResponse("...Geist wird gebracht durch ewige Kluft zwischen G'rak und Land der Ahnen. Moshrans Geist verbleibt aber auf G'rak, solange er von seinen Erben bedacht wird. Und so das Seil verknüpfigt ist...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 12));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 12));
talkEntry:addResponse("...Ruft ein Ork nach seinen Ahnen können sie ihn so hören und zuseite sein. Im Ork ist auch der Geist von Cherga. Es der Geist du hörst flüstern in dir. Ist er besonders stark, der Ork wird zum Schamane.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("shaman");
talkEntry:addTrigger("profession");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Dha shaman knows about dha spirit in green skin. And use it. Shamans spirit beh huge and mighte. Dha ancestors listen to dha voice ob descendant...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Dha shaman knows about dha spirit in green skin. And use it. Shamans spirit beh huge and mighte. Dha ancestors listen to dha voice ob descendant...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addResponse("...But onleh shamans beh able contact mighte and unkonwn spirits. So he helps ill broddhas and sisthas. And dheafore shamans beh fulfill his predestiantion...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addResponse("...It beh important, dhat dha green skin spirit beh strong, big. And dha green skin will beh healthe and strong ib he praise dha ancestors and spirits beh surround.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schaman");
talkEntry:addTrigger("beruf");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Der Schamane, weiß über die Geister im Ork. Und nutzt sie. Sein Geist ist groß und stark. Die Ahnen hören die Stimme von ihren Erben. Aber nur Schamanen werdigen, mächtige fremde Geister um Hilfe bittigen...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Der Schamane, weiß über die Geister im Ork. Und nutzt sie. Sein Geist ist groß und stark. Die Ahnen hören die Stimme von ihren Erben. Aber nur Schamanen werdigen, mächtige fremde Geister um Hilfe bittigen...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addResponse("...Und so, er hilft kranke Orks. Und tut sein Wirken als Schamane.  So ist es wichtig, das die Stärke des Orkes Geist, ist groß. Er wird gesund und stark sein wenn....");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addResponse("...Ork ehrt seine Ahnen und die Geister um ihn im herum.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Uh, Olokwa! Er alte blind Ork ist. Aba viel klugg. Viel Weiß.");
talkEntry:addResponse("Olokwa Seher ist. Yubba. Is beeindruckend... aba imma bisschen gruselig.");
talkEntry:addResponse("Wenn mir getroffen Olokwa, erstes mal, er erraten mein Name! Er gesehen hat. Ahnen, es ihm geflüstert haben.");
talkEntry:addResponse("Olokwa große Kraft von Wissenheit hatt. Von geistiges Aug. Er blindt. Aber sehen mehr als viele andere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Uh, Olokwa! He be old blind orc is. Very smart 'nd prudent.");
talkEntry:addResponse("Olokwa be a seer. Yubba. As impressive is... it still kind ob scary.");
talkEntry:addResponse("First tjem mes met Olokwa, 'e guessed mes Name. He saw it...Tha ancestors told 'im.");
talkEntry:addResponse("Olokwa hab great powa ob wisdom. Ob ghostly eye. Altough he blind, he see more than most othas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("He's this wizard, this elf... Hurr! Me feel his powers from far away. Gâsh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er dieser Zauberer ist, von den Elfen... Hurr! Ich spühre seine Kräfte von weit weg, noch. Gâsh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He's this wizard, this elf... Hurr! Me feel his powers from far away. Gâsh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er dieser Zauberer ist, von den Elfen... Hurr! Ich spühre seine Kräfte von weit weg, noch. Gâsh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Châ, in Runewick there's no good spirit. It's mashed by bad magjic and foolish things. Avoid travelin there. Is not good for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Châ, in Runewick, dort sind keine guten Geister. Verseucht es ist, von bößer Magie und dummen Sachen. Geh dort nicht hin, nein. - Ist nicht gut für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("He iss the Don. That means he's the mightiest dwarf arround. Grockthâ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Er issigt der Don. Dass meint, er ist der mächtigste Zwerg hier. Grockthâ.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Galmair! Actually it's the buildings above us heads, in fresh air. This - down here is just'n old mine. Named Scoria Mine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair! Eign'tlich das die Häuser ober uns sind, an der frischigen Luft. Dies - hier unten einfach nur eine alte Miene ist. Die Schlackengrube.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The humanz and thier kingens. Scheschnacks! The strongest one should be the chief! Nub just inherit privileges to decide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Die Menschenz und ihre Königens. Scheschnacks! Der stärkste sollt der Häuptling sein! Nich einfach das Recht erben, nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("The humanz and thier kingens. Scheschnacks! The strongest one should be the chief! Nub just inherit privileges to decide.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Die Menschenz und ihre Königens. Scheschnacks! Der stärkste sollt der Häuptling sein! Nich einfach das Recht erben, nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("There're Orks in Cadomyr. But hurr, they are weaklings! They nub worth to be called Ork. Mes hate them. Gôsch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Es gibt Orks in Cadomyr. Aber sie Schwächlinge sind! Sie es nicht Wert sind, genannt werden - Ork. Ich hassen sie alle, gôsch!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This is land of Oomies... -humanz. Orcs don't have to care about such stuff. Better ask mes about Kroch'Gurak! Where Orcs come frome!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Das is Menschnzland... Orks sich nicht kümmern darum. Du besser fragst nach Kroch'Gurak! Wo Orks herkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Scheschnacks! They say there are Orks in Gynk as well! But mes say those monkeys arn't orcs when they never seen the Norbuk Plateau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Scheschnacks! S' heißt dort sind Orkse in Gynk. Aber ich sag, diese Affen sind keine echten Orks, solang sie nichtmal das Norbuk Plateau gesehn habn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("This is land of Oomies... -humanz. Orcs don't have to care about such stuff. Better ask mes about Kroch'Gurak! Where Orcs come frome!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Das is Menschnzland... Orks sich nicht kümmern darum. Du besser fragst nach Kroch'Gurak! Wo Orks herkommen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wo her");
talkEntry:addTrigger("kroch gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Kroch'gurak! Is where most ob us orcs come from. This be the big wintercamp at Norbuk Plateau be!");
talkEntry:addResponse("Kroch'Gurak is located in the West of the Plateau and in winter a lot of tribes gather there to camp. It's a big town of natural and diged caves, filled with many flocks and ressources.");
talkEntry:addResponse("The winter's good time for the young orclings. They do pigshunt and wrestling and choose females! He-he!");
talkEntry:addResponse("Kroch'Gurak! This is THE Ork twon! Filled with orcs and orcs and goats and pigs and much more orcs! You should here the 'Bragg-Thu' And the drums!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("kroch gurak");
talkEntry:addTrigger("Kroch'Gurak");
talkEntry:addResponse("Kroch'gruak! Ist, wo meißte Orks von uns komme her von. Es das große Winterlager vom Norbuk Plateau ist!");
talkEntry:addResponse("Kroch'Gurak ist im Westen von der Hochebene und im Winter viele Stämme versammeln sich dort. Es ist ne große Stadt aus gegrabenen Höhln und natürlichn, befüllt mit vieln Vorätn.");
talkEntry:addResponse("D'Winter is ne gute Zeit für junge Orklinge. Sie machn Scheinshatz und Ringkampf und suchn sich Weiber! Hä-hä!");
talkEntry:addResponse("Kroch'Gurak! Das's DIE Orkstadt! Überfüllt mit Orksen und Orkse und Ziegn und Schweine und noch viel mehr Orks! Du solltest hören wie die Trommln zum 'Bragg-Thu' schlagn!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Norbuk");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, long time gone, orcs traveling to Norbuk, the 'Strong Land'. It's big Plateau, splitted by the Black Current. - Cause his water is black in spring.");
talkEntry:addResponse("Once a falcon appeard and led Grubuk Thunderhand, seer of the Bloody Skull Clan down the path to a the 'Strong Land'. Since these days, this land is orc land.");
talkEntry:addResponse("After spans of life of crusader, the old orc tribes found a big strong land. It's surrounded by Armon's Mountains. There's Kroch'Gurak the big winter camp.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Norbuk");
talkEntry:addResponse("Hurr, es lange her gewesen, da Ork wandern nach Norbuk das 'Starke Land'. Es ein große Ebene ist, und es durschnitten vom Schwarzstrom. - Weil seine Wasser sind schwarz im Frühjahr.");
talkEntry:addResponse("Einst ein Falke ist erschienen und er wieß Grubuk Donnerhand, Seher des Bloody-Skull-Clans den Weg, hurr. Den Weg zum Starken Land. Seit diesen Tagen, das Land ein Orkland ist.");
talkEntry:addResponse("Nach Lebensspannen auf Wanderschaft, die alten Orkstämme gefunden haben ein großes strakes Land. Es umkreist ist von Armon's Bergen. Dort liegt Kroch'Gurak, das große Winterlager.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragg-Thu");
talkEntry:addTrigger("Bragg Thu");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("In winter orks do the poetry! Growling tales about their ancestors! In rythm to drums, the poet, following plenty of comlipcated rules. This be called the Bragg-Thuu!");
talkEntry:addResponse("Bragg-Thuu is about rythm of words, not about melody or rhyme. It's done according to heavy slow drums and tells about tales and legends of the ancestors.");
talkEntry:addResponse("Bragg-Thuu sounds easy to you. But mes never saw a non-ork doin it right. There's plenty of rules you have to follow. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragg-Thu");
talkEntry:addTrigger("Bragg Thu");
talkEntry:addResponse("Im Winter Orks, widemen sich der Dichtung! Sie Lobgesänge gröhlen auf ihre Vorfahren. Im Rythmus von Trommeln, d' Dichter folgt viele komplizierte Regeln. Das ist das Bragg-Thuu!");
talkEntry:addResponse("Bragg-Thuu, es geht um Rythmus von Wörter, nicht um Melodie und Reim. Es wird begeleited von großen schweren Trommeln und erzählt von Legenden und Taten der Ahnen.");
talkEntry:addResponse("Bragg-Thuu leicht aussehn mag, aber es gibt ungezählt viele regeln die man foglen muss. Yubba, hab noch nie nen nicht-Ork gesehn der's richtig hingekriegt hat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Grimlug talks about 'Cherga' and 'Moshran' and 'Bragon'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Grimlug erzählt von 'Cherga' und 'Moshran' und 'Bragon'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Cherga, dha iceh witch, escorts dha ghost drough dha nubbing, the eternal rift between dha worlds, into dha land ob dha ancestors...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ice witch");
talkEntry:addTrigger("icy witch");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Cherga, dha iceh witch, escorts dha ghost drough dha nubbing, the eternal rift between dha worlds, into dha land ob dha ancestors...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 18));
talkEntry:addResponse("...Ib a broddha or sistha hub smashed maneh enemies in dha battle and beh strong in his lifetime, his reputation dhea will be vast. And his ancestors will honor him...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 19));
talkEntry:addResponse("...Like he honored dham before. He will hub maneh servants and slaves, and dha women will love him. Ib broddha or sistah beh weak and cowardly, dha broddha or sistha will serve.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Cherga, die eisige Hexe, bringlicht die Geister durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf anbesiegt hat...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eis Hex");
talkEntry:addTrigger("eisige Hexe");
talkEntry:addTrigger("eishex");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Cherga, die eisige Hexe, bringlicht die Geister durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf besiegt hat...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 18));
talkEntry:addResponse("...Und in seinem Leben stark war, ist sein Ansehen dort groß. Seine Ahnen werden ihn ehren, wie er gehrt sie zuvorig...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 19));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 19));
talkEntry:addResponse("...Er bekommt viele Diener und Sklaven. Die Weiber werden ihn lieben.  Wenn er schwach und feige war, wird er dort selbst dienen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Moshran. He beh dha war bringer. Dha bone crusher. Dha blood lord. He beh dha Faddher ob ebbreh Orc...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bone crusher");
talkEntry:addTrigger("war bringer");
talkEntry:addTrigger("blood lord");
talkEntry:addTrigger("father");
talkEntry:addTrigger("Faddha");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Moshran. He beh dha war bringer. Dha bone crusher. Dha blood lord. He beh dha Faddher ob ebbreh Orc...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 21));
talkEntry:addResponse("...Cause it beh dha Faddhas blood, inherited, which strengthen dha Orc and fortify dha spirit. His spirit beh in dha Orc, dha tie to ancestor...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 22));
talkEntry:addResponse("...He will provide untamable blood frenzy in battle. But he become also quick angreh. Dhat for onle Shamans use his name.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Moshran. Er ist der Schlachtenwüterich. Der Knochenbrecher. Der Blutgott. Er ist der Vater von jedem Ork, gleich wie der Ork der die Mutter belegen hat...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Knochbrecher");
talkEntry:addTrigger("Schlachtenwüter");
talkEntry:addTrigger("Blutgott");
talkEntry:addTrigger("Vater");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Moshran. Er ist der Schlachtenwüterich. Der Knochenbrecher. Der Blutgott. Er ist der Vater von jedem Ork, gleich wie der Ork der die Mutter belegen hat...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 21));
talkEntry:addResponse("...Denn es issigt Moshrans Blut, das ererbt, dem Ork stärkt und den Geist kräftiget. Sein Geist ist im Ork. Er, ist das Seil zu den Ahnen...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 22));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 22));
talkEntry:addResponse("...Er bringigt dem Krieger den Blutrausch, in der Schlacht, doch ist er auch schnell erzürnt. Dies der Grund ist,  nur Schamanen sprechen seinen Namen");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Bragon, beh dha sun bringer, dha life provida. He Stong-in-Summer beh. He rules ober dha strong and weak, he provide dha beautiful and precious...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 24));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 24));
talkEntry:addResponse("... Bragon beh god of holeh flames. His childdren beh dha dragons. Dragons standing whib green skin. Or burst and burn the cureless on dhea bodies.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Bragon, ist der Sonnenbringer, der Lebenspender. Er ist Stark-im-Sommer.  Er gebietet über die Starken und Schwachen, er bringigt das Schöne und Edle...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 24));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 24));
talkEntry:addResponse("...Bragon ist Gott der heiligen Flammen. Seine Kinder sind die Drachen. Drachen die dem Ork zur Seite stehen, oder ihnen das Unheilbare auf den Leib brennen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("Mes don't sell anything, knucklehead!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich nix verkauf irgendwas, Schwachkopf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Grimlug wissigt viele Geschichtens! Von der Schöpfung, von G'rak und H'ref, von Geistern, von Schamanen oder den Göttern.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Ask Grimlug to tell about the Creation', G'rak and H'ref, the Spirits, Shamans or the gods.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC first name>");
talkEntry:addTrigger("<NPC last name>");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("How, the shaman 's able to help you?");
talkEntry:addResponse("Hurr! What's your desire?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("<NPC-Vorname>");
talkEntry:addTrigger("<NPC-Nachname>");
talkEntry:addResponse("Wie kann dir der Schamane helfigen?");
talkEntry:addResponse("Hurr! Was issigt dein Begehr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("So shall it beings.");
talkEntry:addResponse("Well then...");
talkEntry:addResponse("Good - Mes feel the spirits arround you are kin of happy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("So es sein solle.");
talkEntry:addResponse("Gut....");
talkEntry:addResponse("Ich spüre die Geister um dich herum... sie heiter sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Hrmpf. Maybes you change your mind, eh?");
talkEntry:addResponse("Is that' so?");
talkEntry:addResponse("I don't think so.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Hrmpf. Vielleicht du änderst deine Meinung, eh?");
talkEntry:addResponse("Ist das so'?");
talkEntry:addResponse("Das glaub ich nicht, nein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Châ. What you said?");
talkEntry:addResponse("#me grunts and nods. 'Mh-hm.'");
talkEntry:addResponse("Tagtha. - Tell mes more about that. Will you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger(".*");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addResponse("Châ. Was du gesagt hast?");
talkEntry:addResponse("#me grunzt und nickt. 'Mh-hm'");
talkEntry:addResponse("Tagtha. - Erzähl mehr davon, tja-ha?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me streicht mit vernarbten Fingern über die Klinge seines Dolches.", "#me fondles his dagger with scared fingers.");
talkingNPC:addCycleText("#me steckt seine Hand in einen Beutel voll Asche. Er lässt ein wenig Asche in den schwachen Luftzug der Höhle davon riseln.", "#me puts his hand inot a bag with ash. Next he allowes weak draft inside of the cave to blow a little bit ash out of his hand.");
talkingNPC:addCycleText("#me nimmt einen Schluck aus einer kleinen schmuddeligen Flasche. Scharfer alkoholischer Dunst steigt in die Luft.", "#me takes a gulp from a grubby little bottle. A strong stench of alcohol fills the air.");
talkingNPC:addCycleText("#me steckt sich etwas Krraut zwischen die Zähne und kaut darauf herum.", "#me puts some herb into his mouth and champs it.");
talkingNPC:addCycleText("#me fummelt etwas trockenes Baumharz aus seiner Manteltasche. Er reibt es zwischen den Fingern un dfür einen Moment ist dir als würde eine Flamme lodern. Dann macht sich ein wohliger, benebelnder Geruch breit.", "#me fumbles some dried tree gum out of his robe. He rubs it beetwen his fingers and for a moment you think you saw a flame there. Then a welfare dazing odour appears.");
talkingNPC:addCycleText("#me rückt seine Kutte zurecht.", "#me adjusts his cowl.");
talkingNPC:addCycleText("#me bleckt seine Zähne und leckt sich schmatzend über die Lippen.", "#me bares his teeth and licks with a smack his lips.");
talkingNPC:addCycleText("Ehre die Götter. Ehre den Vatha.", "Honor the gods. Honor the father.");
talkingNPC:addCycleText("#me streckt die Hand aus:'Ich fühlige mächtige Geister... um uns herum.'.", "#me holds his hand out:'I feel migthy spirits...surrounding us.'");
talkingNPC:addCycleText("#me hält seine Hand über die Opferschale am Altar, diese beginnt augenblicklich merkwürdig zu leuchten.", "#me places his hand upon the sacrificial. In the next moment it starts to glow in a strange way.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Grimlug der Schamane.", "This NPC is Grimlug the shaman.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 811);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 366);
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