--------------------------------------------------------------------------------
-- NPC Name: Elvaine Morgan                                          Runewick --
-- NPC Job:  Archmage                                                         --
--                                                                            --
-- NPC Race: elf                        NPC Position:  898, 775, 2            --
-- NPC Sex:  male                       NPC Direction: east                   --
--                                                                            --
-- Author:   Rincewind                                                        --
--                                                                            --
-- Last parsing: February 07, 2011                       easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 898, 775, 2, 2, 'Elvaine Morgan', 'npc.elvaine_morgan', 0, 1, 0, 209, 197, 199, 250, 239, 237);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.elvaine_morgan", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Archmage Elvaine Morgan the ruler of Runewick. Keyphrases: Runewick, quest, gods, tower, magic."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Erzmagier Elvaine Morgan, der Herrscher über Runewick. Schlüsselwörter: Runewick, Quest, Götter, Türme, Magie."));
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
talkEntry:addResponse("ENGLISH1");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("Elara sei mit Euch. Habt ihr ein Anliegen das Ihr vortragen wollt?");
talkEntry:addResponse("Seid gegrüßt. Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Guten Tag. Wozu, wollt Ihr mit mir sprechen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
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
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Elara sei mit Euch. Habt ihr ein Anliegen das Ihr vortragen wollt?");
talkEntry:addResponse("Seid gegrüßt. Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Guten Tag. Wozu, wollt Ihr mit mir sprechen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt Euch wohl. Ich hoffe, Ihr befandet diese Unterhaltung für zufrieden stellend.");
talkEntry:addResponse("Elara geleite Euch auf Euren Weg. Möge er von Weisheit erleuchtet sein.");
talkEntry:addResponse("Bis bald, denn gewiss haben die Götter unsere Schicksale miteinander verwoben. - Auch wenn es nur ein geringer und kleiner Faden ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
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
talkEntry:addResponse("Gehabt Euch wohl. Ich hoffe, Ihr befandet diese Unterhaltung für zufrieden stellend.");
talkEntry:addResponse("Elara geleite Euch auf Euren Weg. Möge er von Weisheit erleuchtet sein.");
talkEntry:addResponse("Bis bald, denn gewiss haben die Götter unsere Schicksale miteinander verwoben. - Auch wenn es nur ein geringer und kleiner Faden ist.");
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
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Im Großen und Ganzen gesehen, ist Eure Frage sehr höflich aber nicht besonders wichtig.");
talkEntry:addResponse("Ich freue mich zu sehen, das ihr Euch um mein Wohlergehen sorgt. Dennoch möchte ich Euch versichern, es gibt nur wenige Probleme die ein Mann meiner Fähigkeiten nicht zu überwinden vermag.");
talkEntry:addResponse("#me breitet in einer dramatischen Geste die Arme aus. 'Runewick ist mein Kind und es bereitet mir Sorge, so wie alle Kinder ihren Eltern Sorgen bereiten.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("ENGLISH1.");
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
talkEntry:addResponse("Mein Name ist so alt wie die Sagen aus vergangenen Zeiten und in manchen wird er wohl auch genannt werden. 'Elvaine Morgan', Gründer und Herr dieser Stadt.");
talkEntry:addResponse("Morgan... Elvaine Morgen. Erzmagier der vier Türme von Runewick. Worüber wollt Ihr mit mir sprechen?");
talkEntry:addResponse("Ich bin Erzmagier Morgan. - Ich hoffe Euer Anliegen ist es tatsächlich Wert beredet zu werden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("message");
talkEntry:addTrigger("news");
talkEntry:addTrigger("letter");
talkEntry:addTrigger("scroll");
talkEntry:addTrigger("parchment");
talkEntry:addTrigger("despatch");
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail V: You deliver the message from Hector Valerion to Archmage Elvaine Morgan."));
talkEntry:addResponse("#me opens the seal of the despatch and reads it: 'Interesting, Rosaline always surprises me. I guess I will decline, though.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nachricht");
talkEntry:addTrigger("brief");
talkEntry:addTrigger("Botschaft");
talkEntry:addTrigger("Schriftrolle");
talkEntry:addTrigger("Pergament");
talkEntry:addTrigger("depesche");
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post V: Du überbringst Erzmagier Elvaine Morgan die Nachricht von Hector Valerion."));
talkEntry:addResponse("#me öffnet das Siegel der Depesche und ließt sie: 'Interessant, Rosaline überrascht mich ein ums andere mal. Ich muss aber wohl ablehnen.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest status] Delayed Mail V: You deliver the message from Hector Valerion to Archmage Elvaine Morgan."));
talkEntry:addResponse("#me opens the seal of the despatch and reads it: 'Interesting, Rosaline always surprises me. I guess I will decline, though.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hector");
talkEntry:addTrigger("Valerion");
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.quest.quest(108, "=", 12));
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Queststatus] Späte Post V: Du überbringst Erzmagier Elvaine Morgan die Nachricht von Hector Valerion."));
talkEntry:addResponse("#me öffnet das Siegel der Depesche und ließt sie: 'Interessant, Rosaline überrascht mich ein ums andere mal. Ich muss aber wohl ablehnen.'");
talkEntry:addConsequence(npc.base.consequence.quest.quest(108, "=", 13));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich bedaure, zur Zeit möchte ich keine meiner Aufgaben Euch anvertrauen.");
talkEntry:addResponse("Gewiss muss viel erledigt werden, aber an Euch werde ich im Moment nichts delegieren.");
talkEntry:addResponse("Selbstverständlich habe ich eine Reihe an Aufgaben zu vergeben, aber zweifellos würdet Ihr an jeder einzellnen scheitern. Also muss ich mich persönlich damit befassen.");
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
talkEntry:addResponse("Ich bedaure, zur Zeit möchte ich keine meiner Aufgaben Euch anvertrauen.");
talkEntry:addResponse("Gewiss muss viel erledigt werden, aber an Euch werde ich im Moment nichts delegieren.");
talkEntry:addResponse("Selbstverständlich habe ich eine Reihe an Aufgaben zu vergeben, aber zweifellos würdet Ihr an jeder einzellnen scheitern. Also muss ich mich persönlich damit befassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin der Erzmagier. Also obliegt mir die Verantwortung über die Türme Runewicks und deren Wirken. Nicht mehr, aber auch nicht weniger.");
talkEntry:addResponse("Es ist meine selbst auferlegte Pflicht, Runwick mit meinem bestem Rat und der einen oder anderen Tat zur Seite zu stehen.");
talkEntry:addResponse("Ich bin der Erzmagier hier, demnach sehr sehr beschäftigt. Am Besten lasst ihr Euch das von einem Novizen erklären.");
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
talkEntry:addResponse("Ich bin der Erzmagier. Also obliegt mir die Verantwortung über die Türme Runewicks und deren Wirken. Nicht mehr, aber auch nicht weniger.");
talkEntry:addResponse("Es ist meine selbst auferlegte Pflicht, Runwick mit meinem bestem Rat und der einen oder anderen Tat zur Seite zu stehen.");
talkEntry:addResponse("Ich bin der Erzmagier hier, demnach sehr sehr beschäftigt. Am Besten lasst ihr Euch das von einem Novizen erklären.");
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
talkEntry:addResponse("In der Tat ist mir Gobaith nicht unbekannt. Aber lasst uns keine Worte darüber verlieren, denn sie sind wohl kaum von Wert.");
talkEntry:addResponse("Natürlich weiß ich von Gobaith. Eine kleinere Inselgruppe, weit entfert vom Festland. Aber sicher versteht ihr, dass es kaum von Interesse für mich ist.");
talkEntry:addResponse("Ich ließ mir sagen es gibt Leute hier, die einst auf Gobaith lebten. Ihr solltet sie suchen und befragen, wenn ihr so bemüht seid mehr zu erfahren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("#me nickt etwas steif. 'Sehr erfreut. Wie kann ich Euch helfen?'");
talkEntry:addResponse("Ausgezeichnet. Ich dachte mir bereits das ihr Euch vorstellen wolltet.");
talkEntry:addResponse("#me schmunzelt: 'Das weiß ich natürlich, schließlich bin ich hier der Erzmagier.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("holy");
talkEntry:addTrigger("ancestors");
talkEntry:addTrigger("path");
talkEntry:addTrigger("seeker");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tower");
talkEntry:addTrigger("four");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mage");
talkEntry:addTrigger("magic");
talkEntry:addTrigger("wizard");
talkEntry:addTrigger("theurgy");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor Angur");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
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
talkEntry:addResponse("Dies ist Runewick. Jeder der vier Türme steht für ein Element. Erde. Wasser. Feuer. Luft. Hier ist die Weisheit der Leute Gut.");
talkEntry:addResponse("Runewick ist nicht nur eine Stadt, müsst Ihr wissen. Runewick's Name steht für Weisheit und die Kraft des Geistes.");
talkEntry:addResponse("Ich danke Elara jeden Tag für die starke geistige Kraft die sie den Bürgern der vier Türme verleiht. Denn die Weisheit selbst ist unser höchstes Gut.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lor Angur");
talkEntry:addResponse("Ja, ihr habt Euch wohl bereits umgehört, nicht wahr? Ich zog einst aus Lor Angur hier her und legte den Grundstein der vier Türme.");
talkEntry:addResponse("In der Tat, vor langer Zeit lebte ich in Lor Angur. Aber diese Zeit ist fern und es gibt wenig Gründe meine Zeit damit zu vertun, darüber zu sinnieren.");
talkEntry:addResponse("Einst lebte ich in Lor Angur, ihr seid gut unterichtet. Aber es liegt mir fern mich mit Euch darüber zu unterhalten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magie");
talkEntry:addTrigger("zauber");
talkEntry:addResponse("Nun, Runewick ist durchwirkt von Magie und viele Gelehrte meinen sie könnten das Prickeln in den Fingerspitzen fühlen. *zwinkert*");
talkEntry:addResponse("Magie und Zauberei, darauf hat sich Runewick seit je her besonnen. Nun schließlich leitet nicht umsonst ein Erzmagier das Geschick der vier Türme.");
talkEntry:addResponse("Magie ist hier in den Türmen Runewicks allgegenwärtig. Fasst nicht die falschen Dinge an, oder es mag sein, dass Ihr Euch eines Tages in einen Frosch verwandelt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("turm");
talkEntry:addTrigger("türme");
talkEntry:addTrigger("vier");
talkEntry:addResponse("Die vier Türme Runewicks. Der Turm der Erde. Der Turm des Wassers. Der Turm des Feuers und der Turm der Lüfte. Gemeinsam bilden sie eine mächtige arkane Struktur und sind außerdem auch noch sehr hübsch anzusehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("heilig");
talkEntry:addTrigger("Urahnen");
talkEntry:addTrigger("suchenden");
talkEntry:addTrigger("pfad");
talkEntry:addResponse("Der traditionelle Glaube der Elfengemeinschaft. - Der Pfad der Suchenden.");
talkEntry:addResponse("Durch meditationsbedingter geistiger Klarheit und einem Leben das über viele Lebensspannen der Menschen hinaus geht sehen wir Elfen die Dinge und Geschehnisse oft aus einer anderen Sichtweiße.");
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
talkEntry:addResponse("Es macht keinen Sinn vorzugeben ich hätte keine Differenzen mit Valerio, aber näheres geht Euch jetzt wirklich nicht's an.");
talkEntry:addResponse("Nun... ich denke, wenn ihr von diesen Dingen wissen solltet wüsstet Ihr es bereits. Also bin ich nicht bereit Auskünfte hierüber zu verteilen.");
talkEntry:addResponse("Sicherlich seid Ihr Euch im klaren darüber, dass meine Meinung über Don Guilianni eine Sache ist, die ausschließlich mich und Don Guilianni selbst betrifft.");
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
talkEntry:addResponse("Das Metall und die Kohlen in den Böden Galmairs nähren die Habgier seiner Bürger. Doch wenn die Minen erschöpft sind wird man erkennen müssen, dass Weisheit das einzige erstrebenswerte Gut ist.");
talkEntry:addResponse("Galmair trachtet seit jäh her nach Wohlstand und Reichtum. Vernunft und Gemäßigtheit sind ihnen fremd. Zügellosigkeit und gierige Entscheidungen werden diese Stadt einmal zu Grunde richten.");
talkEntry:addResponse("Ich halte die Bürger Galmairs keinesweges für besinnungloße Leichtgeistige. Doch ihre Ziele und Pläne die stehts von Gier dominiert werden, sind nur wenig undurchschaubar.");
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
talkEntry:addResponse("Königin Rosaline, nun sie ist... eine Sphinx ohne Geheimnisse. Dabei ist es erstaunlich wie wenig diese Blutslinie aus den Fehlern ihrer Vorfahren gelernt hat.");
talkEntry:addResponse("Die kurzlebigkeit der Menschen mag ihre Welt beschränken. Allerdings finde ich es doch immer wieder erstaunlich wozu sie denoch fähig sind.");
talkEntry:addResponse("Nun, ich errinere mich noch gut an Rosalines Großvater. Ein bemerkenswerter Mensch in mancherlei Hinsicht. So wie sein Sohn. Und nun, soll sich zeigen ob dessen Tochter ein ähnliches Schicksal erwartet.");
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
talkEntry:addResponse("Königin Rosaline, nun sie ist... eine Sphinx ohne Geheimnisse. Dabei ist es erstaunlich wie wenig diese Blutslinie aus den Fehlern ihrer Vorfahren gelernt hat.");
talkEntry:addResponse("Die kurzlebigkeit der Menschen mag ihre Welt beschränken. Allerdings finde ich es doch immer wieder erstaunlich wozu sie denoch fähig sind.");
talkEntry:addResponse("Nun, ich errinere mich noch gut an Rosalines Großvater. Ein bemerkenswerter Mensch in mancherlei Hinsicht. So wie sein Sohn. Und nun, soll sich zeigen ob dessen Tochter ein ähnliches Schicksal erwartet.");
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
talkEntry:addResponse("Wenn ein Feind um jemandens ehrenhaften Kodex weiß, mag sich das für den dem die Ehre ein göttliches Gut ist, eventuell als gefährliches Hinderniss erweisen.");
talkEntry:addResponse("Cadomyrs Kodex der Ehre, macht es langsam und träge - vorhersehbar. Stets, könnte ein kluger Mann die Pläne der Stadt ersinnen. Veränderung ereignen sich nur langsam, wenn sie nicht so und so versickern.");
talkEntry:addResponse("Cadomyr mag standhafte Streiter haben. Doch viel zu nah liegt der Unterschied zwischen Tapferkeit und Torheit. Der Adel Cadomyrs spaltet sich an der Weiblichkeit von Rosaline Edwards und Uneinigkeit schwächt die Stadt.");
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
talkEntry:addResponse("Albar stand seit jeher gegen mich und meine Überzeugungen. Schon damals, als ich noch ein Magier Lor Angurs war.");
talkEntry:addResponse("Alles woran ich Glaube und all meine Überzeugungen scheinen in Albar mit Füßen getreten zu werden. Denkt Ihr nicht?");
talkEntry:addResponse("Albar regiert gegen sein eigenes Volk. Nun der jetzige Hochkönig scheint weniger strikt zu sein, aber Menschen sind Wankelmütit und nichteinmal ich vermag zu sagen wie er sich entscheiden mag.");
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
talkEntry:addResponse("Über ein heterogenes Volk wie das Gynks ist es schwer eine pregnante Aussage zu machen. Doch gerade aus diesem Grund bin ich der Meinung das in Gynk eine organisiertere Regierung nicht von Nachteil währe.");
talkEntry:addResponse("Auf Ersten Blick mag einem Gynk als chaotisches Unsystem erscheinen. Näher betrachtet - komplex. Ausführlich studiert - als ein sich slebst frei entwickelndes und unreguliertes System.");
talkEntry:addResponse("Die Unvernunft und Triebhaftigkeit welche in Gynk überwiegend vorherrscht, ist mir zu wider. Unaustehlich ist mir der Gedanke, dort zu leben.");
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
talkEntry:addResponse("Beinahe will ich so weit gehen und Salkamar als das erleuchtete Reich der Menschen zu bezeichnen. Es dürfte Euch nicht überraschen das Runewick einige Beziehungen zu jenen Landen pflegt.");
talkEntry:addResponse("Der Lichtblick unter den Reichen der Menschen. Die Werte Salkamars spiegeln zu vielen Teilen jene wieder die ich mir seit vielen Jarhunderten zu eigen gemacht habe.");
talkEntry:addResponse("Habt ihr die Möglichkeit eines Tages in die Stadt Salkamar selbst zu reisen, besucht die hießige Bibliothek. Sie ist weltbekannt und beherbergt ungezählte Schränke mit wertvollen Büchern.");
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
talkEntry:addResponse("Die Götter der vier Türme lassen sich schnell benennen. Elara schenkt uns stets Weisheit und so mancher findet Erleuchtung bei Siranis Altaren. Aber natürlich geben viele Halblinge Oldra den Vorzug.");
talkEntry:addResponse("Vielleicht werdet Ihr bemerken das die Älteren unter uns Elfen die jungen Götter nicht als solche bezeichnen. Viel eher sind sie unsereins Heilige Urahnen.");
talkEntry:addResponse("Der Pfad der Suchenden ist ein Weg der Meditation, Spiritualität, geistiger Klarheit und Geduld.");
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
talkEntry:addResponse("Adron, fast schon die Hausgottheit aller Tavernen und Gaststätten. Vor allem junge Leute lassen sich von seiner Art begeistern.");
talkEntry:addResponse("Viele junge Leute begeistern sich für Bragon und auch einige Barden. Aber viele ändern ihre Meinung und ihren Glauben als Erwachsene.");
talkEntry:addResponse("Nun fragt euch selbst, liegt im Wein die Warheit?");
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
talkEntry:addResponse("Man sagt Brágon sei der erste der Götter gewesen die Illarion verlassen haben. Aber ovn zeit zu Zeit soll er dennoch unerkannt unter den Sterblichen wandeln.");
talkEntry:addResponse("Brágon ist der Gott des Feuers. Manche Zwerge und Orks richten ihr Leben ihm zur Ehre. Dabei versuchen sie ihrem Gott in Stärke und Weisheit nach zu eifern.");
talkEntry:addResponse("Als Brágon Illarion verlies übergab er Malachín die Macht über seine Anhänger. Aber das ist mehr als drei Lebensspannen her und nun möget ihr sodar es Euch bestimmt ist, wieder auf Anhänger Brágons begegnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addTrigger("Cheerga");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addTrigger("Cheerga");
talkEntry:addResponse("Einst schrieb man ihren Namen 'Cheerga', doch die Zeit vergeht und Illarion wandelt sich. Sie ist die Göttin der Nachwelten und Toten.");
talkEntry:addResponse("Cherga hat nicht viele Anhänger. Sie ist jene, welche die Toten begleitet und in ihre vorbestimmten Reiche führt. Manche beten zu ihr, um den ruhelosen Geistern den ewigen Frieden zu bringen.");
talkEntry:addResponse("Viele Nekromanten sind Chergas Anhänger und auch einige Wahrsager. Cherga selbst kümmert es nicht, was die Sterblichen mit dem von ihr verliehenen Wissen anfangen, doch ihr Beistand hat einen hohen Preis...");
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
talkEntry:addResponse("Elara ist die Göttin des Wissens und der Weisheit. Viele der Scholare innerhalb der vier Türme beten zu ihr um zu lernen und um Wissen zu erlangen.");
talkEntry:addResponse("Die drei großen Fragen: Den Grund für die Gier, den Grund für Gewalt und den Grund für das Leiden. Es heißt Gelehrte die der Antwort nahe kommen sind sehr friedvolle, rechtsschaffende und nachdenkliche Personen.");
talkEntry:addResponse("Wir Anhänger Elaras glauben an die Macht der Weisheit. Alles folgt einem großen Plan und die göttin hilft uns all dies zu verstehen und zu lernen.");
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
talkEntry:addResponse("Eldan ist der Gott des Geistes. Seine Anhänger sind meist Einsiedler oder Leute, die nicht nein zu einem Schluck Wein und einem langen, philosophischen Gespräch sagen.");
talkEntry:addResponse("Eldan einer der fünf 'älteren' Götter. Nur wenig ist über deren Ursprung in Erfahrung zu bringen. Sie selbst erzählen nur wenig und die meißten haben Illarion verlassen. Niemand mag sagen an welchen Tagen sie dennoch hier wandern.");
talkEntry:addResponse("Eldan hat sich nie persönlich um die Sterblichen gekümmert und nur wenige beten zu ihm. Alle behaupten, ihn schon einmal persönlich getroffenen zu haben, doch in Wirklichkeit haben sie sich einer Illusion hingegeben.");
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
talkEntry:addResponse("Findaris Anhänger waren immer wenige, da sie nicht viel Wert auf Tempel oder die Anbetung legt.");
talkEntry:addResponse("Ich ließ mir sagen manche Wahrsager und wandernde Prophetendie es zu Bekanntschaft brachten wurden von Findari ausgewählt.");
talkEntry:addResponse("Findari eine der fünf 'älteren' Göttheiten. Nur wenig ist über deren Ursprung in Erfahrung zu bringen. Sie selbst erzählen nur wenig und die meißten haben Illarion verlassen. Niemand mag sagen an welchen Tagen sie dennoch hier wandern.");
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
talkEntry:addResponse("Irmorom ist der Gott des Handwerks und des Handels. Sehr gesprächig und gesellig, so wie die Mannen dieser Zünfte.");
talkEntry:addResponse("Nicht nur Zwerge beten zu ihm. Händler, Handwerker im selben Maße. Doch strebt man stehts nach materiellen Wohlstand. - Im Leben wie dannach.");
talkEntry:addResponse("Mit Sicherheit werdet ihr hinter Galmairs Toren, eingeschlagen in den Berg einen Tempel Irmoroms finden.");
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
talkEntry:addResponse("Malachín ist der Gott der Jagd. Und das Volk bittet ihn stets um Erfolg bei der Jagd.");
talkEntry:addResponse("Der Schutzpatron der Krieger und Söldner. Oftmals hört man einen von ihnen Malachín als den Schwarzen Wolf rufen, bevor ein schwerer Kampf ausbricht.");
talkEntry:addResponse("Viele folgen dem ehrenwerten Malachín, Soldaten und Ritter beten zu ihm. Paladine und Kriegskleriker ziehen in seinen Namen aus um die dämonische Brut des Ungesagten zu bekämpfen....");
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
talkEntry:addResponse("Die Weltordnung des Blutgottes ist geprägt von Gewalt und Schmerz. Er ist gewalttätig, mächtig, blutrüstig und kriegsliebend.");
talkEntry:addResponse("Er ist der 'Blutgott' vieler wilder, blutrünstiger Orkkriegsstämme, die ihm zu Ehren Sterbliche opfern. Diese Altare sind blutgetränkte Zeugnisse seines Charakters und seine Anhänger sind abgrundtief böse Kreaturen.");
talkEntry:addResponse("Der Blutgott verfügt über ungeahntes, verborgenes Wissen und hat eine eigene, sehr rauhe Art von Humor. Wenn Ihr geneigt seid das Humor zu nennen...");
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
talkEntry:addResponse("Intrigen, gemeine oder vermeintlich lustige Tricks sind Nargùns Metier. Manchmal ist er hilfsbereit, manchmal zerstörerisch, stets aber verursacht sein Verhalten großes Aufsehen.");
talkEntry:addResponse("Verrückte Propheten und Einsiedler, oder brabbelnde Idioten... dies sind diejenigen die Nargùn folgen. Glückspieler... Verrückte - und so weiter.");
talkEntry:addResponse("Die Glaubensansichten von Nargùns Anhängern sind völlig uneinheitlich und verworren. Aber anders wäre es dem Gott des Chaos wohl nicht recht zu machen.");
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
talkEntry:addResponse("Für eine gute Ernte oder für den Segen eines Neugeborenen. - Viele Halblinge beten zu Oldra, der Göttin der Fruchtbarkeit und des Lebens.");
talkEntry:addResponse("Oldra verabscheut gierige und selbstsüchtige Leute. sViel mehr schätzt sie gutes Essen, liebt Gärten und Haustiere. Da wundert es nicht das viele Halblinge zu ihr beten.");
talkEntry:addResponse("Oldra - eine eher mütterliche Gottheit. Und sehr weise. Alle Arten des Lebens liegen ihr am Herzen.");
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
talkEntry:addResponse("Ronagan ist der Schutzpatron all jener die im Schatten der menschlichen Gesellschaften leben. Diebe, Bettler, Dirnen... Landstreicher.");
talkEntry:addResponse("Ich kenne Händler die beten und opfern Ronagan Geld, um zu verhindern das sie ausgeraubt werden.");
talkEntry:addResponse("Auch wenn Ronagan so manche Obrikeit zum Narren hält, verabscheut er doch Vertrauensbruch oder Verrat im selben Maße wie staatliche Autoritäten und Gesetze.");
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
talkEntry:addResponse("Oh, viele junge Frauen beten zu Sirani. Der Liebe wegen. - Und wegen anderer junger Männer, versteht sich.");
talkEntry:addResponse("Die meisten Priester Siranis sind gute Heiler und glauben wie alle Ihre Anhänger an ein Leben in Friede und Harmonie. In den Tempeln der Göttin findet man stets Obdach.");
talkEntry:addResponse("Sirani mag rauschende Feste, Liebe, Spaß und das Leben selbst. Sie hasst die Missachtung von Frauen und kann sehr aufbrausend und wütend werden, wenn ihnen nicht die nötige Wertschätzung zuteil wird.");
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
talkEntry:addResponse("Tanora mag die unberührte Schönheit der Natur, deshalb ist sie auch die einzige der ältern Götter, welche nicht selten auf Illarion umherwandert.");
talkEntry:addResponse("Die Gesellschaft der Echsenmenschen wird sehr stark von den glauben an Tenora geprägt. Allerdings nennen sie Tanora, Zelphia.");
talkEntry:addResponse("Echsenmenschen, Fischer, Heiler, Seeleute. Das sind die Anhänger Tanoras, der Göttin des Wassers.");
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
talkEntry:addResponse("Als Ushara Illarion verließ, ernannte sie Oldra zu ihrer Verteterin und so wird sie nun an Ihrer statt in neuen Tempeln verehrt.");
talkEntry:addResponse("Ushara, die Mutter - die Erde, auf der die vier Türme Runewicks erbaut wurde. Wie mir selbst ist ihr die Vergänglichkeit der Dinge besonders bewusst.");
talkEntry:addResponse("Ushara hat besonders wenige Anhänger, die meisten sind weibliche alte Druiden oder Elfen. Und einige wenige von ihnen scheinen Ushara persönlich begegnet zu sein.");
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
talkEntry:addResponse("Zhambra der Brudergott. Freundschaft und Treue sind ihm das höchste Gut. Die Ehre eines Mannes ist ihm teuer, niemals würde er hinterlistige Tricks gut heißen.");
talkEntry:addResponse("Der Gott der Freundschaft und Treue - Zhambra. Mit sicherheit findet ihr einen seiner Tempel in Cadomyr.");
talkEntry:addResponse("Zhambras Anhänger sind eher, nun - geradlinig. Ritter, Höflinge und Krieger. In der Schlacht ist die Freundschaft der Mitstreiter eine ungleich wertvolle Kraftquelle.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Bitte verzeiht, aber ich handle nicht mit Euch.");
talkEntry:addResponse("Eines Erzmagiers Geschäfte sind, nun ja - Geschäfte die nur für den Erzmagier von Revelanz sind.");
talkEntry:addResponse("Der Marktplatz befindet sich gleich vor den Portalen zur Stadt. Es sollte unmöglich sein daran vorbei zu laufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("ENGLISH1.");
talkEntry:addResponse("ENGLISH2.");
talkEntry:addResponse("ENGLISH3.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Die Zeichen, die ich bemerkte sind eindeutig und schon bald werden sie auch weithin zu sehen sein.");
talkEntry:addResponse("Nur der Narr ignoriert die unwahrscheinlichsten Möglichkeiten und versteift sich auf das was offensichtlich ist.");
talkEntry:addResponse("An manchen Tagen denke ich... - Könnte das Menschenvolk Regenbögen in einen Käfig sperren, würden sie es vermutlich tun.");
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
talkEntry:addResponse("Auf ein Wort?");
talkEntry:addResponse("Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Bitte fasst Euch kurz.");
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
talkEntry:addResponse("Auf ein Wort?");
talkEntry:addResponse("Welches Anliegen führt Euch zu mir?");
talkEntry:addResponse("Bitte fasst Euch kurz.");
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
talkEntry:addResponse("#me nickt sanft aber bestimmt.");
talkEntry:addResponse("War das alles?");
talkEntry:addResponse("Elaras Weisheit möge Euch erleuchten.");
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
talkEntry:addResponse("#me lächelt ein wenig und schweigt.");
talkEntry:addResponse("Jene Dinge von denen einer glauben mag, er wolle sie, sind oft nicht die die einer braucht.");
talkEntry:addResponse("Warum nicht?");
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
talkEntry:addResponse("Wesshalb? Was ist der Grund dafür?");
talkEntry:addResponse("Ich verstehe.");
talkEntry:addResponse("Wenn Ihr das auf diese Art ausdrücken wollt...");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me's leuchtend graue Augen mustern achtsam die Umgebung.", "ENGLISH.");
talkingNPC:addCycleText("#me atmet langsam und leise aus, für einen Moment scheint er einem Gedanken nachzuhängen.", "ENGLISH.");
talkingNPC:addCycleText("#me streicht mit den Fingern über die Seiten seines Buches.", "ENGLISH.");
talkingNPC:addCycleText("#me's Augen überfliegen einige Zeilen des Textes innerhalb seines Buches.", "ENGLISH.");
talkingNPC:addCycleText("#me fährt mit der Fingerspitze an eine bestimmte Stelle der Buchseiten und schlägt diese auf.", "ENGLISH.");
talkingNPC:addCycleText("#me nickt sachte. Dann wirft er einen Blick zur Seite.", "ENGLISH.");
talkingNPC:addCycleText("#me greift sich kruz an den Kopf und seine Stirn legt sich in sanften Falten.", "ENGLISH.");
talkingNPC:addCycleText("#me reibt sich mit dem Zeigefigner an der Nase. Im nächsten Moment schnippst er mit den Fingern und ruft 'Ich habs!'.", "ENGLISH.");
talkingNPC:addCycleText("#me's graue Augen scheinen für einen Moment hell auf zu leuchten.", "ENGLISH.");
talkingNPC:addCycleText("#me's lächelt gutmütig und für einen Augenblick ist ein merkwürdiges Glitzern in seinen Pupillen zu sehen.", "ENGLISH.");
talkingNPC:addCycleText("#me dreht seinen Kopf ein wenig und für kurze Zeit scheinen seine Gedanken in der Ferne zu verweilen.", "ENGLISH.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:addLanguage(10);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Ein galanter Elf, mit langem geflochtenen Haar und leuchtenden grauen Augen. Ihn umgibt eine Aura von Klarheit und Einsicht die jedem in seiner Nähe mit zu reißen scheint.  Sein Gesicht wirkt gelassen und gewandt erscheinen seine Bewegungen.", "translate!");
mainNPC:setUseMessage("Macht Euch doch keine Mühe, ihr verletzt Euch noch selbst.", "TRANSLATE");
mainNPC:setConfusedMessage("#me schaut dich ausdruckslos an. 'Wie bitte?'", "#me looks at you motionless. 'Excuse me?'");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 807);
mainNPC:setEquipment(11, 558);
mainNPC:setEquipment(5, 209);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 0);
mainNPC:setEquipment(9, 823);
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
