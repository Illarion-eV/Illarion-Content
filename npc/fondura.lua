--------------------------------------------------------------------------------
-- NPC Name: Fondura                                                 Runewick --
-- NPC Job:  Firesage                                                         --
--                                                                            --
-- NPC Race: orc                        NPC Position:  798, 820, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Authors:  Regallo                                                          --
--           ...with a little help of Estralis Seborian                       --
--                                                                            --
-- Last parsing: October 27, 2012                        easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (4, 798, 820, 0, 4, 'Fondura', 'npc.fondura', 1, 2, 5, 123, 62, 9, 245, 180, 137);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.fondura", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Fondura the Flamesage. Keyphrases: Waresage, Fire, Apple, Gods."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Fondura die Feuermagierin. Schlüsselwörter: Kampfmagier, Feuer, Apfel, Götter."));
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
talkEntry:addResponse("Please make your business known.");
talkEntry:addResponse("Yes?");
talkEntry:addResponse("What?");
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
talkEntry:addResponse("Wie kann ich euch helfen?");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Was?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Please make your business known.");
talkEntry:addResponse("Yes?");
talkEntry:addResponse("What?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Wie kann ich euch helfen?");
talkEntry:addResponse("Ja?");
talkEntry:addResponse("Was?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Please leave in haste.");
talkEntry:addResponse("Goodbye.");
talkEntry:addResponse("Fondura stares at you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Sputet euch!");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Fondura beobachtet euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Please leave in haste.");
talkEntry:addResponse("Goodbye.");
talkEntry:addResponse("Fondura stares at you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Sputet euch!");
talkEntry:addResponse("Auf bald.");
talkEntry:addResponse("Fondura beobachtet euch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am me.");
talkEntry:addResponse("I am well.");
talkEntry:addResponse("That's none of your business.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich bin ich.");
talkEntry:addResponse("Mir geht es gut");
talkEntry:addResponse("Das geht euch nichts an.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Fondura.");
talkEntry:addResponse("The Sage of Flame.");
talkEntry:addResponse("I am one of the seven Warsages.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Fondura.");
talkEntry:addResponse("Der Magier der Flamme");
talkEntry:addResponse("Ich bin einer der sieben Kampfmagier");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Warsage, that is what I am.");
talkEntry:addResponse("I work for Runewick.");
talkEntry:addResponse("I live in the service of Archmage Elvaine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Kampfmagier, das ist mein Beruf.");
talkEntry:addResponse("Ich arbeite für Runewick.");
talkEntry:addResponse("Ich stehe im Dienste von Erzmagier Elvaine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Warsage, that is what I am.");
talkEntry:addResponse("I work for Runewick.");
talkEntry:addResponse("I live in the service of Archmage Elvaine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Kampfmagier, das ist mein Beruf.");
talkEntry:addResponse("Ich arbeite für Runewick.");
talkEntry:addResponse("Ich stehe im Dienste von Erzmagier Elvaine.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Warsage");
talkEntry:addResponse("We are the emergency fighting force for Runewick, though this city is so well defended we are not generally needed.");
talkEntry:addResponse("We use both magic and fighting skills to form a polished warrior.");
talkEntry:addResponse("If you wish to know more about us a book could give you more information than I can.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fire");
talkEntry:addTrigger("Flame");
talkEntry:addResponse("In my belly is an oil that can make a very hot flame.");
talkEntry:addResponse("Fire is litereally inside of me.");
talkEntry:addResponse("Fire and Naginata are my form of self defence.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addTrigger("Elves");
talkEntry:addResponse("The world was better when I was in my little village and did not know what an elf was.");
talkEntry:addResponse("They are so damn arrogant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("Archmage");
talkEntry:addResponse("He is the wise rular of this land.");
talkEntry:addResponse("He is stronger than I.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Apple.");
talkEntry:addResponse("He saved me from a life of servitude.");
talkEntry:addResponse("He rescued me from the circus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kampfmagier");
talkEntry:addResponse("Wir sind die Notbrigade von Runewick, allerdings ist diese Stadt so gut geschützt, dass wir kaum benötigt werden.");
talkEntry:addResponse("Wir nutzen beides, sowohl unsere magisches als auch unser kämpferisches Können um geeignete Krieger auszubilden.");
talkEntry:addResponse("Wenn ihr mehr über uns wissen wollt, dann lest ein Buch, dort findet ihr mehr Informationen als ich euch geben kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Feuer");
talkEntry:addTrigger("Flamme");
talkEntry:addResponse("In meinem Bauch befindet sich ein Öl, welches eine sehr heiße Flamme erzeugen kann.");
talkEntry:addResponse("Feuer ist wortwörtlich in mir.");
talkEntry:addResponse("Ich nutze das Feuer und mein Naginata zur Selbsverteidigung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elf");
talkEntry:addTrigger("Elfen");
talkEntry:addResponse("Die Welt war besser als ich in meinem kleinen Dorft lebte und noch nicht wusste was ein Elf ist.");
talkEntry:addResponse("Sie sind so verdammt arrogant.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er ist der weise Anführer dieses Landes.");
talkEntry:addResponse("Er ist stärker als ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Apfel.");
talkEntry:addResponse("Er hat mich aus einem Leben in Knechtschaft gerettet.");
talkEntry:addResponse("Er hat mich aus dem Zirkus befreit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addTrigger("gods");
talkEntry:addResponse("Magic was created by the Gods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Magie wurde von den Göttern erschaffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Fondura Duh Rah.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Fondura Duh Rah.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Fondura");
talkEntry:addTrigger("Duh Rah");
talkEntry:addResponse("That is me, please state your business.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fondura");
talkEntry:addTrigger("Duh Rah");
talkEntry:addResponse("Das bin ich, wie kann ich euch helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Runewick ist ein recht warmer Ort.", "Runewick is too warm of a place.");
talkingNPC:addCycleText("Ich wünschte diese dreckigen Elfen würden mich in ruhe lassen.", "I wish those dirty elves would leave me alone.");
talkingNPC:addCycleText("Der Windmagier wird wiedermal vermisst.", "The Windsage is missing again.");
talkingNPC:addCycleText("Bitte seid ruhig an diesem Ort.", "Please keep this place quiet.");
talkingNPC:addCycleText("Ja ich kann Feuer spucken und nein, ich werde dies nicht zur eurer Unterhaltung tun.", "Yes I can breath fire and no I will not do it for your entertainment.");
talkingNPC:addCycleText("Bitte verlasst diesen Ort, solltet ihr hier fertig sein.", "Please leave this place when you are done with your business.");
talkingNPC:addCycleText("Ich habe nicht vor einen Studenten derzeit aufzunehmen. Bitte lasst mich in Frieden.", "I do not wish to take on a student at this time. Please leave.");
talkingNPC:addCycleText("Was wollt ihr?", "What do you want?");
talkingNPC:addCycleText("Ich hab keine Zeit mich lange mit euch zu unterhalten.", "I do not have time to speak long.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Fondura die Feuermagierin.", "This NPC is Fondura the firesage.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 181);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
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