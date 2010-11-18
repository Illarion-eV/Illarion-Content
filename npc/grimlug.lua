--------------------------------------------------------------------------------
-- NPC Name: Grimlug                                                     None --
-- NPC Job:  ambiente shaman                                                  --
--                                                                            --
-- NPC Race: orc                        NPC Position:  385, 176, -6           --
-- NPC Sex:  male                       NPC Direction: southwest              --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: October 10, 2010                        easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 385, 176, -6, 5, 'Grimlug', 'npc.grimlug', 0, 3, 0, 23, 6, 3, 137, 123, 60);
---]]

require("npc.base.basic")
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
talkEntry:addTrigger("stop");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hrm, Grimlug soll erzähligen etwas anderes?");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
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
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("Wich tale mes should tell?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 0));
talkEntry:addResponse("welche Geschichte Grimlug, soll erzählen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell Creation");
talkEntry:addTrigger("talk Creation");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Long tiem ago, dha gods become bored. So Bragon, dha older broddher ob Moshran our Faddha walked to him and let cut obb dha Bragons arm. Bodh collectad Bragons blood and modeled dha sun....");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("...Dha arm droped down, and become land. Wibh dha hand ob Bragon dhat beh left, Bragon took H’ref, the sun, and whipped it ober dha Arm, G’rak like it beh child...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("...Furthermore dha odha gods took parts of dham and creatad dha folk. Dheh dhrew dham on G’rak to see, ib dheh beh worthe to be. The folk beh cold and lifeless beh. Like G’rak...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("...But dha Faddha hub some of Bragons blood left. So he spilled all ob it ober G’rak. Dhen dha folk become warm in dhea bodehs. But some folk he forgat, so dheh beh still cold...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("...When dha Faddha slept his former female Cherga, dha iceh witch, she bewitched G’rak. Whub Moshran alwahs took whib him. G’rak budges and strains. Dha iceh witch received him. So dha spirit infest dha folk.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erz[aäe]l Sch[oöe]pfung");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Vor lange Zeit, den Göttern die Zeit zu lang wurde. Bragon, der ältere Bruder Moshrans gegangen zu ihm und ließ sich seinen Arm abhacken. Sie sammelten das Blut und geformten die Sonne...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addResponse("...Der Arm fiel runter und gewurde zum Land. Mit der verbleibenden Hand nahmigte Bragon sie Sonne, H‘ref und schaukelt sie, als gewäse sie sein Kind, über seinen Arm, G’rak...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 2));
talkEntry:addResponse("...Darauf hin gingigen die anderen Götter her und nahmen Dinge von ihren Körpern um die Völker zu schaffen. Sie wurfen sie auf G‘rak um zu besehen ob sie auch würding sind da zu sein...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 3));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 3));
talkEntry:addResponse("...Die Völker waren kalt und lebloßig. Wie G’rak. Aber Moshran behatte noch ein wenig von Bragons Blut übrig. Er verschüttete alles über G’rak. Darauf hinig wurde den Völkern wohlwarm in den Körpern...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 4));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 4));
talkEntry:addResponse("...Aber manche Völker vergaßet er. Sie sind kalt gebliebigt. Als Moshran, seinem damaligen Weib Cherga dazulag, der eisigen Hexe, verzauberte sie G’rak. Den Moshran immerstets mit sich trug...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 5));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 5));
talkEntry:addResponse("...G’rak regte sich und reckte sich. Und die eisige Hexe empfing ihn. So wurden die Völker vom Geist befallen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell Grak");
talkEntry:addTrigger("tell Href");
talkEntry:addTrigger("talk Grak");
talkEntry:addTrigger("talk Href");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("G’rak beh beauteful and strong. And H’ref chooses him. She became dha female ob him. Dheh neba leave each other. And in dha night, when H’ref beh nub able to see her male...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("continue");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addResponse("...she huse shineh mirror ob ore to hub a eye at G’rak. Dhat beh dha Moon. It rains when H’ref and G’rak lie dogetha. Ofta you hear dham gasp and yell. Dhat beh dha dhunda...");
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
talkEntry:addTrigger("erz[aäe]l Grak");
talkEntry:addTrigger("erz[aäe]l Href");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("G’rak warig sehr schön und stark. Und H’ref aussuchte ihn. Sie wurdigte sein Weib. Nie gehen sie weg von einander. Und in der Nacht, wenn H’ref ihren Mann nicht ansehen kann...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 7));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 7));
talkEntry:addResponse("...hielt sie einen glänzigen Spiegel aus Erz so das sie nicht von ihm lassen muss. Das ist der Mond. Es regnet wenn G’rak und H’ref zusammenliegen. Oft hört man sie keuchen und rufen...");
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
talkEntry:addTrigger("tell spirit");
talkEntry:addTrigger("talk spirit");
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
talkEntry:addResponse("...Ib broddha or sistah dies, dha spirit beh brought ober dha eternal rift between G’rak and dha land ob dha ancestors. Dha Faddhas spirit beh leaved at G’rak, as long dha descendant praise dhea ancestors...");
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
talkEntry:addTrigger("erz[aäe]l Geist");
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
talkEntry:addResponse("...Geist wird gebracht durch ewige Kluft zwischen G’rak und Land der Ahnen. Moshrans Geist verbleibt aber auf G’rak, solange er von seinen Erben bedacht wird. Und so das Seil verknüpfigt ist...");
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
talkEntry:addTrigger("tell shaman");
talkEntry:addTrigger("talk shaman");
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
talkEntry:addTrigger("erz[aäe]l Schaman");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Der Schamane, weiß über die Geister im Ork. Und nutzt sie. Sein Geist ist groß und stark. Die Ahnen hören die Stimme von ihren Erben. Aber nur Schamanen werdigen, mächtige fremde Geister um Hilfe bittigen...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 15));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 15));
talkEntry:addResponse("...Und so, er hilft kranke Orks. Und tut sein Wirken als Schamane.  So ist es wichtig, das die Stärke des Orkes Geist, ist groß. Er wird gesund und stark sein....");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 16));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("weiter");
talkEntry:addCondition(npc.base.condition.state.state("=", 16));
talkEntry:addResponse("...Ehrt Ork seine Ahnen und die Geister um ihn im herum.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell god");
talkEntry:addTrigger("talk Creation");
talkEntry:addResponse("Grimlug talk about 'Cherga' and 'Moshran' and 'Bragon'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erz[aäe]l G[oöe]ter");
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
talkEntry:addTrigger("eic witch");
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
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Cherga, die eisige Hexe, bringlicht die Geister durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf anbesiegt hat...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 18));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eis Hex");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Cherga, die eisige Hexe, bringlicht die Geister durch das Nichts, die ewige Kluft zwischen den Welten, in das Land der Ahnen. Wenn ein Ork viele Gegner im Kampf anbesiegt hat...");
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
talkEntry:addResponse("...Er bekommt viele Diener und Sklaven. Die Weibs werden ihn lieben.  Wenn er schwach und feige war, wird er dort selbst dienen.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mosharn");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Say 'continue' to progress the tale or 'stop'."));
talkEntry:addResponse("Moshran. He beh dha war bringer. Dha bone crusher. Dha blood lord. He beh dha Faddher ob ebbreh Orc...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("bonecrush");
talkEntry:addTrigger("warbring");
talkEntry:addTrigger("bloodlord");
talkEntry:addTrigger("fat[hera]");
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
talkEntry:addTrigger("erz[aäe]l Moshran");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("Sage 'weiter' um die Erzählung fortzusetzen oder 'Stop'."));
talkEntry:addResponse("Moshran. Er ist der Schlachtenwüterich. Der Knochenbrecher. Der Blutgott. Er ist der Vater von jedem Ork, gleich wie der Ork der die Mutter belegen hat...");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 21));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erz[aäe]l Knochbrech");
talkEntry:addTrigger("erz[aäe]l Schlachtwut");
talkEntry:addTrigger("erz[aäe]l Blutgot");
talkEntry:addTrigger("erz[aäe]l Vat[era]");
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
talkEntry:addResponse("... Bragon beh god of holeh flames. His child’s beh dha dragons. Dragons standing whib green skin. Or burst and burn the cureless on dhea bodies.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addCondition(npc.base.condition.language.language("german"));
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
talkEntry:addTrigger("erz[aäe]l");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Beispiel: 'Erzähle die Geschichte der Schöpfung.'"));
talkEntry:addResponse("Frage Grimlug nach 'erzählen von' + 'Geschichte der Schöpfung','G'rak und H'ref','Geister','Schamanen' oder 'Göttern'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell");
talkEntry:addTrigger("about");
talkEntry:addTrigger("talk");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Example: 'Tell me about the Tale of Creation.'"));
talkEntry:addResponse("Ask Grimlug to 'tell about' + 'Tale of Creation', 'G'rak and H'ref', 'Spirits', 'Shaman' or 'gods'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hallo");
talkEntry:addTrigger("gr[üue]+[sß]+e");
talkEntry:addTrigger("guten tag");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Seid gegrüßt");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addTrigger("Greb");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("good day");
talkEntry:addTrigger("greetings");
talkEntry:addTrigger("greets");
talkEntry:addTrigger("hail");
talkEntry:addTrigger("hello");
talkEntry:addTrigger("Be greeted");
talkEntry:addTrigger("Good morning");
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
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
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
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
talkEntry:addResponse("Greebas!");
talkEntry:addResponse("Hurr!");
talkEntry:addResponse("Hullo!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wie hei[sß]+t du");
talkEntry:addTrigger("wie hei[sß]+t ihr");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer seid");
talkEntry:addTrigger("wer bist");
talkEntry:addResponse("Ich binne Grimlug. Wer seist du?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Good bye");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare thee well");
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Blessings to youb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehabt euch wohl");
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Segen über dir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Blessings to youb.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Fareba");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Farebas!");
talkEntry:addResponse("Segen über dir.");
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
talkEntry:addResponse("#me nickt langsam. 'Ich binne bestens. Hast du heute die Götter geehret?");
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
talkEntry:addTrigger("I am");
talkEntry:addTrigger("I'm");
talkEntry:addResponse("The gods warmly pleasured to welcome youb here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ich bin");
talkEntry:addResponse("Die Götter warmlich geerht, dich willkommen zu heißen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr! Jag mächtig ist viel! Nahe bei Chief 'nd Warlord!");
talkEntry:addResponse("Hurr... Jag seine mächtige Redskull! Und Kampfmeista von derr Klan. Wenn du lerne wolle, zerhauen Zeug? Gehe zu Jag!");
talkEntry:addResponse("Jag zermatscht alle Oomies bei große Turnier, wie Würma. hehe!");
talkEntry:addResponse("Bruddha Jag? Hurr... Mirr erinnere Tag von Green-Growl! Uh! Vatha gemocht das hat! Wirr sollte feiern diese Tag.");
talkEntry:addResponse("#me hält sich den Kopf: 'Du nix hammern dein Schädl gegen Jags Keule!'");
talkEntry:addResponse("Jag hart lustig Sammlung. Har-har! Du fragst Jag.");
talkEntry:addResponse("Jag mag Fleisch. Er imma hunger. hehe!");
talkEntry:addResponse("Jag schnelle, strak Kriega! Für Vatha, für Klan!");
talkEntry:addResponse("Jag? Hurr! Mir denkt er suchen neue Spitzohren tut.");
talkEntry:addResponse("Jag? Hurr! Du nix spreche schlecht uber Murgo, wenn er hört. Sonst er zermatsch dein Fresse! Har.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("jag");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr! Jag berreh mighte beh! Almost like dah Chiefeh and dah Warlord!");
talkEntry:addResponse("Hurr... Jag be mighte Red Skull and Drillmasta ob dha Clan! Ib yoo want learn smashing stuff, ask Jag!");
talkEntry:addResponse("Jag smashed all dah Ommies in dah big tournamant, dhus Jag beh First Smasha!");
talkEntry:addResponse("Broddha Jag? Hurr... Meh get dah Day ob Green Growl in mind. Dhat beh slaughta beh! Hurr! Dha Faddha like dhat! Yoo should celebrate dhat day!");
talkEntry:addResponse("#me holds his head: 'Avoid to feel Jag's maces at yoor head!'");
talkEntry:addResponse("Jag hub berreh nice collection, hurr!");
talkEntry:addResponse("Look for meat and bring dhat Jag! Jag beh alwaehs hungreh.");
talkEntry:addResponse("Jag beh proud and honorfull redskull, hurr!");
talkEntry:addResponse("Jag beh fast and strong warrior for dah Fadha and dha Clan!");
talkEntry:addResponse("Jag? Hurr! Mee thinks Jag beh looking for nuw Longears!");
talkEntry:addResponse("Jag? Hurr! Nub speak bad about dah Lok'uhm Murgo in front ob Jag. Jag smash yoor fais odhawise!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr, Krazen nix klügster Ork ist. 'r geschmissn aus alte Stamm, alsgezündet Mantel von Chief, mit Feua!");
talkEntry:addResponse("Krazen? Er diese dumme Feua-macha, yubba?");
talkEntry:addResponse("Hur hur... du gehört? Krazen nix darf in Borgates Taverne mehr gehn. Er Verbot.");
talkEntry:addResponse("Yubba, Krazen EIN Freund hat. Ist Grimghor.");
talkEntry:addResponse("Du sollten Fragn, Krazen tanzt furr dirr. Ist große Spass, sehen dars!");
talkEntry:addResponse("Yub.. er gross, tragen verdammtes gutt Helm, schmutzig grün Robe. Uh? yubba.. er stinken.");
talkEntry:addResponse("Krazen nie gewesen gutte Kriega. Aba Kopf imma stecken überall drin...");
talkEntry:addResponse("Krazen gutte Ork ist, mir galubt. Du nur nix blicken in seine Augen. NIx starren ihn an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krazen");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Krazen nub da smartest orc meh see...'e was kick'd frum his own tribe-set the chiefess clothes on fire!");
talkEntry:addResponse("Krazen? He beh dat stoopid firestarter, yubba?");
talkEntry:addResponse("Hur hur...y'hear? Krazen nub allowed in Borgate's tavern no more...");
talkEntry:addResponse("Yubba, Krazen hab a friend named Grimghor. Meh fink it's his only one.");
talkEntry:addResponse("Yub! You shuld ask Krazen to do a dance fer ya! Funny as hell!");
talkEntry:addResponse("Yub...he's tall, wears dis damn awful metal hat, dirty green robe...Yar, dat's right, he smells too.");
talkEntry:addResponse("Krazen neber be gud warrior...always getting his head stuck in beehives...");
talkEntry:addResponse("Krazen friendly enough, meh fink. Jus' don't make eye contact.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Yubba, Murgo viel Stolz auf seine Töchta ist. Er'hja 'nd Ol'hja. Stark klugg Weibs sind.");
talkEntry:addResponse(" Murgo mit Krudash ist. Sie sein Weibs sein. Sie Mama von Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Uh, mir glauben Murgo schwer hatt manch mal. Mit drei Weibs! Krudash. 'nd da Töchta Er'hja 'nd Ol'hja. Aba alle drei hübsche Weibs sind. Yubba.");
talkEntry:addResponse("Murgo beste freund ist Jag.");
talkEntry:addResponse("Mancha Orks witzig, sagen Murgo sein Blumens. Vleicht war. Aber jetzt er stampft zer alle Blumens!");
talkEntry:addResponse("Murrgo - dar Name von grosse Kriega, mit grosse Axt. Aber er nix bester in denken. er Blumenork war. Aber jetzt er zerstampfen all Blumens! Harr, harrrr!");
talkEntry:addResponse("Hurr, Murgo gehohlt mirr. Sagen mirr, kommen nach hirr. Wie meiste andere Orks hirr. Ganze lange Weg von Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! Er Ork mit meißte Ehre ist. erster gewesen, der Trommel hatt.");
talkEntry:addResponse("Murgo verdammte Ass ist. Jede orc wolle sein wie er sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("murgo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Murgo hired mes. Like most ob tha othas 'ere. All way from Kroch'gurak!");
talkEntry:addResponse("Murgo, hurr hurr! 'eh honrorables Orc is. Was first played drum. Yubba.");
talkEntry:addResponse(" Murgo 's damn ace is! Ebbry orc wanna like he be.");
talkEntry:addResponse("Yubba. Murgo very proud ob 'is doughtas is... Er'hja 'nd Ol'hja. Be stong 'n smart females are.");
talkEntry:addResponse("Murgo be with Krudash. She 'is female. She be mum ob Er'hja 'nd Ol'hja.");
talkEntry:addResponse("Uh, me guess Murgo hab sumtime hard, with 'is three females. Krudash. 'nd tha doughtas Er'hja 'nd Ol'hja. But all three pretty, yubba!");
talkEntry:addResponse("Murgo best friend be Jag.");
talkEntry:addResponse("Sum Orc joke Murgo, be Flower. Maybe was. But nuw 'eh stump all flowas!");
talkEntry:addResponse(" Murrrgo - dis beh name ob great warriar with great axe! But mes think he nub well in thinking. He be flowery flower orc was! Hurr! But nuw he stomps ob flowry! Harr, harrrr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mirr mögen Er'hjas Nase. Ist Art von hübsch, wie mir gefallen. Ist gleich wie ihre Mama hatt.");
talkEntry:addResponse("Er'hja glücklich sich schätzen kann. Hatt sein klugg von Mama. Sein Ass von Papa. Krudash 'nd Murgo sind.");
talkEntry:addResponse("Er'hja gelernt hat bei MO'rurt. Und Jag. Tapfere, mutig Mädchen. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwesta sind. Yubba, auseehn beinahe wie gleich.");
talkEntry:addResponse("Jede Mann hoffen bekomm Er'hja oda Ol'hja zu Weibs. Sie gutte Weibs sind! Yubba.");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Welpen wie Er'hja 'nd Ol'hja machen vieles Sorge für Mama 'nd Papa.'");
talkEntry:addResponse("#me lacht heiser: 'Ha-hr. Mirr kenne sie seit sie war winzig kleinig. Mirr konnte halten in eine Hand!'");
talkEntry:addResponse("Lustig geschicht... Er'hjas Papa Murgo züchtn Hounds. Aba Er'hja fürchten diese wie Hasal!");
talkEntry:addResponse("Uh, nix mirr frag. Er'hja, sie lieben Rabe! Sagen sie klugg sind. wasimma, mir sagt. Rabn Vogl sind. Vogl dummig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mes like Er'hjas nose. Is kinda ob cute. Is like her mum have.");
talkEntry:addResponse("Er'hja could lucky be. Got tha smart ob 'er mom 'nd ace ob papy. Krudash 'nd Murgo are.");
talkEntry:addResponse("Er'hja was trained by Mo'rurt. And Jag. Brave girl. Yubba!");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkEntry:addResponse("Each Male hope to get Er'hja or Ol'hja as'n female! They good females! Yubba.");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Whelps like Er'hja 'nd Ol'hja cuase musch trouble for tha mum and papy.'");
talkEntry:addResponse("#me chukles hoarsely: 'Ha-hr. Mes know 'er since she was such puny, mes could hol'er with un hand!");
talkEntry:addResponse("Funny tale... Er'hjas papy Murgo breeds hounds. But she fear those like rabbitz!");
talkEntry:addResponse("Uh, nub ask mes. Er'hja, she love corbie! Mean they smart. Whubebba, mes say. Corbie be bird. Bird stupid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Alize, Gnarh. Sie jammernd Kind bei Schmieda. Sie Krudashs Sklave ist. Sie schmelzn Erz, muss.");
talkEntry:addResponse("Du nix sein schwuach mit diesa jammernde Slkave. Sie lernen muss, zu sein STARK! Machen den Besitza Ehre. Yubba.");
talkEntry:addResponse("Har! Krudash gefangen auf eine Harfen. jetzt ALize, Sklave ist. Aber Jammern viel tut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ali[czs]");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alize, Gnarh. This bis thus weepy girl at forge. She be Krudash slave is. She hav to smelt you ore.");
talkEntry:addResponse("Nub be weak with those weepy slave. She hab to learn, be strong! Bring tha owner honor! Yubba.");
talkEntry:addResponse("Har! Krudash sacked her 'n sum harbour. Now she be her slave is. But weak weepy one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Krudash, hurr! Sie klugg. Hat vieles Münz. hat vieles Sklave. Hat gute Mann. Hat tapfere Tochtas.");
talkEntry:addResponse("Hurr, sie hatt Alize 'nd diese tükke Halbling als Skalve. Sklaven gutt! Machen viel Ehre.");
talkEntry:addResponse("Sie Weibs von Murgo ist. Hurr. Er glucklich sein kann. Krudash hübsch 'nd klugg!");
talkEntry:addResponse("Hurr, mirr mag ihre Nase! Sein süß. He-he. Aber nix  sagst Murgo!");
talkEntry:addResponse("Krudash verkauft alle sachn, du brauchst zum raubn 'nd plündarn. Guttgutt. Sie Besitza von  Hack'n Sack Laden.");
talkEntry:addResponse("Fruha, sie gewesen Wache furr Bootschaft. In Trolls'Bane. Wie sie geworden Murgos Weibs, sie erbaut hat Laden. - Hack'n Sack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("krudash");
talkEntry:addTrigger("Hacksack");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Krudash, hurr! She be smart. Got many coin. Got many slave. Got good male. Got brave doughters.");
talkEntry:addResponse(" Hurr. She hold Alize 'nd thos dastardly halfer 's slave. Slave good! Bring 'onor!");
talkEntry:addResponse("She be female ob Murgo. Hurr. He could lucky be about that. Krudash pretty 'nd smart is.");
talkEntry:addResponse("Hurr. Me like 'er nose! Is damn cute. He-he. But nub tell Murgo!");
talkEntry:addResponse("Krudash sell all stuff you need to hack'nd sack. Wellwell. She be owner ob tha Hack'n Sack Shop.");
talkEntry:addResponse("Former she was guard at Embassy to Troll's Bane. She became Murgos female 'nd found Shop - Hack'n Sack.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Mo'rurt. Er bester Jäga von KLan ist. erimma draußn ist. Jagt.");
talkEntry:addResponse("Mo'rurt schießt Pfeile, schnell wie wind. Stark wie Meer.");
talkEntry:addResponse("Mo'rurt Besitza von Stout ist. Stout sehr ehrenhaftiga Sklave ist. Yubba. Hat bekommen Armbrust und geht jagen mit Mo'rurt.");
talkEntry:addResponse("Har-ar. Mo'rurt stur wie Esel. Abar mirr sagt, is gutt. Alle in alles, er gerechter Meister ist.");
talkEntry:addResponse("Mo'rurt kommen von einsam Land. Wenig gelebt dort. Murgo ihn gefunden hatt als Mo' nach Kroch'gurak gekommen für den Winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("morurt");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Mo'rurt. Hurr he be best archer of Clan be. He allway out ob cave huntin!");
talkEntry:addResponse("Mo'rurt shoot 'is arrow fast like wind. Strong like Sea.");
talkEntry:addResponse("Mo'rurt be owner ob Stout. Stout be honorable slave is. Yubba. Got crossbow and joins Mo'rurt on hunting.");
talkEntry:addResponse("Har-ar. Mo'rurt is mulish. But 'e say he's just right. But all'nall he fair master is.");
talkEntry:addResponse("Mo'rurt come frome sum lonly lands. Nub much lived there. Was picked up by Murgo, wehn he walked to Kroch'gurak for winta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olokwa");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("uh, Olokwa! Er alte blind Ork ist. Aba viel klugg. Viel Weiß.");
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
talkEntry:addTrigger("sogg");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Sogg Beermug! Guttgutt. Er ass ork ist. Imma geben aus, runde von Booze. Imma gibt Bier zu tapfere Kriegas.");
talkEntry:addResponse("#me lacht: 'Sogg, Fässawächta is. Aba meißte Zeit er saufn alles bewachte Booze allein aus! Har-har!'");
talkEntry:addResponse("Sogg auch heißt Beermug. Sogg Beermug! Du ratest, warum...");
talkEntry:addResponse("Mirr gehört Murgo gefundn Sogg in eine dreckig Taverne. Abgefüllt mit Bohnen-Booze. Als er aufgewacht... er unser neue Fässawächta war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sogg");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sogg Beermug! Wellwell. He be ace orc is. Allway pay a round ob booze. Allway give Bear for brave warrior.");
talkEntry:addResponse("#me laughs: 'Sogg be tha barrel guard. But most ob time he drink tha guarded booze by him own! Har-har!'");
talkEntry:addResponse("Sogg name also be Beermug. Sogg Beermug!  Make a guess, why for...");
talkEntry:addResponse("Mes hered Murgo picked Sogg up, in some scummy tavern, filled up with beans booze. As he waked up... he was us new barrelguard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Stout Sklave ist von Mo'rurt. Er gutte Sklave. Bringt besitza viele Ehre.");
talkEntry:addResponse("Auch wenn Stout ist OOmie,er allrichtig ist. Er tapfere Sklave. Mo'rurt sehr stolz issigt.");
talkEntry:addResponse("Hurr, Stout stark Sklave ist. Nix wie diese jammernde Mädchen 'nd diese listig Halbling. Stout bekommen Ehre. Die andere Zwei, bekomme Strafe.");
talkEntry:addResponse("Stout gekommn mit Mo'rurt zusamme. Mir denken, er seit lange Zeit Sklave ist.");
talkEntry:addResponse("Mirr sicha sein, Mo'rurt mehr ist, als Meister von Stout. Sucha beide sowas wie Freunde sind.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("stout");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Stout be slave ob Mo'rurt. He good slave. Make tha owner much honor.");
talkEntry:addResponse("Altough he Oomie is, he be allrighty. Stout brave slave. Mo'rurt be proud ob 'hm.");
talkEntry:addResponse("Hurr, Stout strong slave. Nub like thus weepy girl 'nd tha dastardly halfer. Stout 'll earn great honor. Tha otha both earn punsihment.");
talkEntry:addResponse("Stout arrived togetha with Mo'rurt. Me guess Stout be slave since long time.");
talkEntry:addResponse("Me sur Mo'rurt be more to Stout than Masta. Sure both be weird kind ob friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er vermischt Glasscherbn mit Krudashs fressen.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Einmal er geflohen durch Berge. Aber unsre Hounds ihn erlegt danieder! Jezt er muss kloppen Steins.");
talkEntry:addResponse("Garh! Disa hintalistig Halbling! Thoma' Berryar'! Du im Auge hast sein kleine Fäuste. ergerne haut dirr zwischen Beine!");
talkEntry:addResponse(" Sie gesagt, Thoma' Berryar'. er Grund ist, Murgo 'nd Krudas nix haben mehr Welpen. wassimma das heißen.");
talkEntry:addResponse("Murgo geschnappt diese Halbling irgendwohig nahe von Briar Dorf. SCheint es nix erstemal, für Thoma' war.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tom");
talkEntry:addTrigger("berry");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to mix cullet with Krudash's food.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Once he tried to escape tha mountains. But us hounds hunt 'hm down. Now 'e hab to batter stones.");
talkEntry:addResponse("Garh! Thus dastardly halfer! Thoma' Berryar'! Watch 'hs tiny fists. He like to smash you beetween legs.");
talkEntry:addResponse("They say, Thoma' Berryar'. He be reason, Murgo'n Krudash nub got more whelps. Whubabba thut mean.");
talkEntry:addResponse("Murgo sacked thus Halfer sumwhere close tha Briar hamlet. Seems it wasn't tha first time for Thoma' Berryar'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr hurr. Thud sammeln Trophäe. Auch wenn er ist nix klügsta, er gutte Ork!");
talkEntry:addResponse("Thud genannt Thud. *lacht kichernd* Weil er mag verkloppen Leutz.");
talkEntry:addResponse("Hurr, Thud dumm wie Dreck ist. Aber wer braucht Denkmuskel, wenn hatt rießig Muskels sowieso? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("thud");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr hurr. Thud collect trophy. Altough some clumsy. He good Orc.");
talkEntry:addResponse("Thud, is named Thud. *chukles* Cause 'e like to thud people.");
talkEntry:addResponse("Hurr. Thud be dump like mudd. Bud who need brainmuscle, ib you hab huge muscle anyway? Hu!?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Brute Booze! Ist name von meißt berühmte Orkabenteura! er großße REisenda. Jäga von viels schrecklich Bestien!");
talkEntry:addResponse("Brute Booze, gesoffen Booze in jeda taverne von Illarion, er versprechen! Her erschlagen gigantisch Schlange von Gynk zwei malig. Un' genommen Prinzess von Khensarra zu Weibs!");
talkEntry:addResponse("'llgutt. Brute sein eine von alte Helden. Mit Respekt furr Tradition. Und dramatische Geschichte.");
talkEntry:addResponse("Uh, mirr wünschen mirr könnte sein wie Brute Booze. Wenn mir wollen hören Geschicht von fremde Land, mir frägt Brute.");
talkEntry:addResponse("Sie gesagt, Brute Booze wissen viels über fremde Lända. Sicha er gezogen durch alle von ihnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("brute");
talkEntry:addTrigger("boze");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Bute Booze! Is name ob most famous orc adventurer! He big Travela. Hunta ob several cruel biests!");
talkEntry:addResponse("Brute Booze, drunk Booze in each tavern ob Illarion, he promise! He slay tha giant Snake ob Gynk twice. An' took tha princess ob Khensarra as female!");
talkEntry:addResponse(" 'llrigthy. Brute 's one ob old heros. With feeling for tradition. An' dramatic ob tale!");
talkEntry:addResponse("Uh, I wish I cuold be like Brute Booze. Ib mes wanna 'ere tale ob strange land, mes allways ask 'hm.");
talkEntry:addResponse("They say Brute Booze know lot about strange lands. Surely he traveled trough all ob them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nork");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Nork Soldat ist. Von Ogretoe. er bekümmern Güta und Versorgung dort.");
talkEntry:addResponse("Uh, d' Kriega von Lager Ogretoe wirklich sind tapfer! Mirr gehört, Oger ist mächtig Gegner.");
talkEntry:addResponse("Uh, Ist Nork diese hässliche Ork, in Lager von Ogerland?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nork");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Nork be soldier ob Ogretoe. He take care ob Supply there.");
talkEntry:addResponse("Uh, tha soldiers at Camp Ogretoe such brave! Mes 'ered tha Ogres be stong enemie.");
talkEntry:addResponse("Uh, is Nork thus ugly one, at tha ogreland-camp?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vigo");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Captain Viggo! Mir so viel glück, er und tapfere kriega, beschütze unser Erz von verdammte Ogers.");
talkEntry:addResponse("Captain Viggo ist Kommandierer von Lager Ogretoe. er imma braucht Kriega!");
talkEntry:addResponse("Hurr. Ohne Viggo und 's Kriega, wirr nix würde bekommen Erz. Mir froh, Murgo gefunden ihn hatt!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("vigo");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Captain Viggo! Mes such glad, he 'nd s brave soldiers defend us ore from tha damn Ogres.");
talkEntry:addResponse("Captain Viggo is commanda ob Camp Ogretoe. He allway hire soldiers!");
talkEntry:addResponse("Hurr. Without Viggo 'nd his soldiers wes wouldn't abe to get ore. Mes glad Murgo pick'ed' hm up.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("budva");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Budvar Buddler ist. er graben nach Erz. In Lager, Ogretoe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("budva");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr, Budvar be digger is. He digg for ore at tha Ogretoe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Ol'hja ist Tochta von Murgo. Sie Kundschafta in laga von Ogretoe. Hurr Hurr.");
talkEntry:addResponse("Ol'hja ist eine von beste Kundschafta von Captain Viggos Kriegas.");
talkEntry:addResponse("Er'hja 'nd Ol'hja Schwestas sind. Yubba, sie gleich aussehen. Nahezu.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("olhja");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Ol'hja's tha doughta ob Murgo. She be scout in tha ogretoe-camp. Hurr Hurr.");
talkEntry:addResponse("Ol'hja s one ob most skilled scouts under Captain viggos soldiers.");
talkEntry:addResponse("Er'hja 'nd Ol'hja be Sistahs. Yubba, almost look tha same.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yago");
talkEntry:addTrigger("helgi");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Yago 'nd Helgi sind tapfere Kriega! Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yago");
talkEntry:addTrigger("helgi");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Yago 'nd Helgi be brave soldier. Yubba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Kroch'gruak! Ist, wo meiße Orks von uns komme her von.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("where com");
talkEntry:addTrigger("krochgurak");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Kroch'gurak! Is where most ob us orcs come from.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addResponse("Hurr. Captain Viggo, 'nd seine Kriega kämpfn dort furr unsa Erz!");
talkEntry:addResponse("Hurr, ist Ort wo Erz ist. Aba alles voll mit wütende Ogers ist. Du gehst mit Kriega nur dorthin.");
talkEntry:addResponse("Ogretoe sein Lager von Captain Viggo. Er beschützt Miene gegen Oger!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ogetoe");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hurr. Captain Viggo, 'nd his soldiers fight there for our ore!");
talkEntry:addResponse("Hurr. Is Place where ore was found. But full ob angry ogre is. Take warrior with youb, to walk there.");
talkEntry:addResponse("Ogretoe be tha camp ob Captain Viggo. It defend ore mine agins ogres!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Beispiel: 'Erzähle die Geschichte der Schöpfung.'"));
talkEntry:addResponse("Frage Grimlug nach 'erzählen von' + 'Geschichte der Schöpfung','G'rak und H'ref','Geister','Schamanen' oder 'Göttern'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("helfen");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Beispiel: 'Erzähle die Geschichte der Schöpfung.'"));
talkEntry:addResponse("Frage Grimlug nach 'erzählen von' + 'Geschichte der Schöpfung','G'rak und H'ref','Geister','Schamanen' oder 'Göttern'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Example: 'Tell me about the Tale of Creation.'"));
talkEntry:addResponse("Ask Grimlug to 'tell about' + 'Tale of Creation', 'G'rak and H'ref', 'Spirits', 'Shaman' or 'gods'.");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 0));
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
mainNPC:setLookat("Dies ist ein NPC blabalblab...", "This is a NPC who's developer was too lazy to type in a description.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(3, 811);
mainNPC:setEquipment(9, 366);
mainNPC:setEquipment(10, 369);
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