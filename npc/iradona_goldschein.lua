--------------------------------------------------------------------------------
-- NPC Name: Iradona Goldschein                                       Galmair --
-- NPC Job:  Informant                                                        --
--                                                                            --
-- NPC Race: dwarf                      NPC Position:  428, 248, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   envi                                                             --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (1, 428, 248, 0, 6, 'Iradona Goldschein', 'npc.iradona_goldschein', 1, 9, 0, 255, 215, 0, 238, 203, 173);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.consequence.trade")
require("npc.base.talk")
module("npc.iradona_goldschein", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Iradona Goldschein the informant. Keywords: Question, information, Galmair, building, game, mission, faction."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Iradona Goldschein die Auskunftgeberin. Schlüsselwörter: Auskunft, Information, Galmair, Gebäude, Spiel, Auftrag, Fraktion."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(606, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You can talk with Iradona now. Ask for 'help' if you do not know what to ask! You can also go back to Hummi to collect your reward and come back later."));
talkEntry:addResponse("How can I help you? Do you like to have any information? Or do you like to have a task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(606, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(606, "=", 1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Da kannst nun mit Iradona sprechen. Frage nach 'Hilfe' wenn du nicht weißt nach was du fragen sollst.! Du kannst auch zurück zu Hummi gehen um deine Belohnung abzuholen und später nochmals vorbei kommen."));
talkEntry:addResponse("Wie kann ich der Herrschaft helfen? Wird eine Information erwünscht? Oder eine Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(606, "=", 2));
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
talkEntry:addResponse("Good day, my dear. Can I help you with some information?");
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
talkEntry:addResponse("Tach, die Herrschaft, darf ich behilflich sein mit einer Auskunft?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Good day, my dear. Can I help you with some information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Tach, die Herrschaft, darf ich behilflich sein mit einer Auskunft?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("See ya soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Und servus, bis bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("See ya soon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Und servus, bis bald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("My head hurts, because of these thousand of questions of the people of Galmair here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Mein Kopf schmerzt von der vielen Fragerei der Leute von Galmair hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Iradona Goldschein, the informant of Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Iradona Goldschein, die Auskunftgeberin von Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Informant. I can tell you many things about Galmair. Just ask me about buildings, locations, events, people, history or gods of Galmair. Additionaly, I have a little task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Auskunftgeberin. Ich kann dir viele Dinge über Galmair erzählen. Frag nur nach Gebäude, Orte, Ereignisse, Leute, Geschichte oder Götter von Galmair. Zusätzlich hätte ich noch eine kleine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Informant. I can tell you many things about Galmair. Just ask me about buildings, locations, events, people, history or gods of Galmair. Additionaly, I have a little task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Auskunftgeberin. Ich kann dir viele Dinge über Galmair erzählen. Frag nur nach Gebäude, Orte, Ereignisse, Leute, Geschichte oder Götter von Galmair. Zusätzlich hätte ich noch eine kleine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] building, locations, event, people, history, god"));
talkEntry:addResponse("I can give you information about buildings, locations, events, people, history and gods of Galmair. Just ask me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gebäude, Orte, Ereignisse, Leute, Geschichte, Götter"));
talkEntry:addResponse("Ich kann dir Informationen über Gebäude, Orte, Ereignisse, Leute, Geschichte und Götter von Galmair geben. Frag einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("question");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] building, locations, event, people, history, god"));
talkEntry:addResponse("I can give you information about buildings, locations, events, people, history and gods of Galmair. Just ask me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Auskunft");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gebäude, Orte, Ereignisse, Leute, Geschichte, Götter"));
talkEntry:addResponse("Ich kann dir Informationen über Gebäude, Orte, Ereignisse, Leute, Geschichte und Götter von Galmair geben. Frag einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("building");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Market, temple, teleport, donkey stable, library, Well of Dreams, Villa Goldvein, workshop, guardroom, Dark Ally, Galmair Crest, Scoria Mine"));
talkEntry:addResponse("Argh, be more precisely! Market, temple, teleport, donkey stable, library, Well of Dreams, Villa Goldvein, workshop, guardroom, Dark Ally, Galmair's Crest or the Scoria Mine?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gebäude");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Markt, Tempel, Teleport, Eselstall, Bibliothek, Quelle der Träume, Villa Goldader, Werkstatt, Wachstube, Dunkle Gasse, Galmairs Krone, Schlackengrube"));
talkEntry:addResponse("Argh, etwas genauer! Markt, Tempel, Teleport, Eselstall, Bibliothek, Quelle der Träume, Villa Goldader, Werkstatt, Wachstube, Dunkle Gasse, Galmairs Krone oder die Schlackengrube?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("location");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Hinterland, Lotta Medborgar"));
talkEntry:addResponse("I suggest you look for Lotta Medborgar if you want to know more than the Hinterlands. She is hunter and has explored several locations. Better to ask her. You can find her down at the Winged Sow Tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Hinterland, Lotta Medborgar"));
talkEntry:addResponse("Ich empfehle du suchst nach Lotta Medborgar, wenn du mehr als die Hinterlande kennen lernen möchtest. Sie ist Jägerin und hat etliche Orte erkundet. Frag sie daher besser. Du kannst sie unten in der Taverne zur Geflügelten Sau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(630, "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lotta");
talkEntry:addTrigger("Medborgar");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Try to find Lotta Medborgar and get your reward."));
talkEntry:addResponse("Is a hunter that has explored several locations. Among those are the Swamp, Northern Woods, Nagrun's Plain, Hemp Necktie Inn, Bounding Stream, Malachite creek, Tir Draganfod and many others. You can find her down at the Winged Sow Tavern.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(630, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(630, "<", 1));
talkEntry:addTrigger("Lotta");
talkEntry:addTrigger("Medborgar");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Finde Lotta Medborgar und erhalte deine Belohnung."));
talkEntry:addResponse("Ist ne Jägerin und hat etliche Orte erkundet. Unteranderem den Sumpf, Nördliche Wälder, Nagrun Ebene, Gasthof zur Hanfschlinge, Grenzstrom, Tir Draganfod, Malachit Bach und so weiter. Du kannst sie unten in der Taverne zur Geflügelten Sau.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(630, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lotta");
talkEntry:addTrigger("Medborgar");
talkEntry:addResponse("Is a hunter that has explored several locations. Among those are the Swamp, Northern Woods, Nagrun's Plain, Hemp Necktie Inn, Bounding Stream, Malachite creek, Tir Draganfod and many others. You can find her down at the Winged Sow Tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lotta");
talkEntry:addTrigger("Medborgar");
talkEntry:addResponse("Ist ne Jägerin und hat etliche Orte erkundet. Unteranderem den Sumpf, Nördliche Wälder, Nagrun Ebene, Gasthof zur Hanfschlinge, Grenzstrom, Tir Draganfod, Malachit Bach und so weiter. Du kannst sie unten in der Taverne zur Geflügelten Sau.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("people");
talkEntry:addResponse("Argh, there were only dwarves here in the past. But nowadays we have all kind of folks here. Even orcs, which you can find in the Flicker Swale... Or do you like to meet Lotta? *grins*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Leute");
talkEntry:addResponse("Argh, früher waren wir nur Zwerge, aber heutzutage haben wir alle möglichen Leute hier. Selbst Orks, welche du unten in der Schimmersenke finden kannst... Oder willst du Lotta treffen? *grinst*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("history");
talkEntry:addResponse("The history of our faction can be read in our library. Unfortunately, we lost our actual history book. But our Don so kindly to provide his personal notes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geschichte");
talkEntry:addResponse("Die Geschichte unserer Fraktion kannst du in unserer Bibliothek nachlesen. Leider wurde das eigentliche Geschichtsbuch verloren. Aber der Don war so nett und hat uns seine persönlichen Notizen zur Verfügung gestellt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("events");
talkEntry:addResponse("Several events regarding our faction can be read in our library. Unfortunately, we lost our actual history book. But our Don so kindly to provide his personal notes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ereignis");
talkEntry:addTrigger("Geschehnis");
talkEntry:addResponse("Sämtliche Ereignisse betreffend unserer Fraktion kannst du in unserer Bibliothek nachlesen. Leider wurde das eigentliche Geschichtsbuch verloren. Aber der Don war so nett und hat uns seine persönlichen Notizen zur Verfügung gestellt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("Actually, we have only one rule. You just have to know, the Don rules and you have to obey him. But you wil more advices how you should act down in the Scoria Mine at some columns around Hog Dens and Cameo Pit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Wir haben eigentlich keine Gesetze. Du musst nur wissen, der Don herrscht und du hast zu befolgen. Aber du kannst mehr Hinweise unten in der Schlackengrube bei den Schweinebaue und dem Gemmenschacht finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ruler");
talkEntry:addResponse("We have had only tow rulers so far. Our Don Valerio Guilianni and his father Tommaso Guilianni. You can find more information about the latter in the notes of the Don, our new history book. Information ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Herrscher");
talkEntry:addResponse("Wir hatten lediglich zwei Herrscher bisher. Unseren Don Valerio Guilianni und seinen Vater Tommaso Guilianni. Informationen über letzteren findest du in den Aufzeichnungen des Don, unserem neuem Geschichtsbuch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("market");
talkEntry:addResponse("Argh, everything has to be explained to you. Just run through the town to the Well of Dreams and you will see it. You cannot miss it. *points the towngate*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Markt");
talkEntry:addResponse("Argh, alles muss man dir erklären. Lauf einfach durch die Stadt zur Quelle der Träume und du wirst ihn sehen. Du kannst ihn nicht verfehlen. *zeigt auf das Stadttor*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("temple");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Tempel of Irmorom, Tempel of Ronagan, Temple of Nagrun"));
talkEntry:addResponse("We have temples for each of our three gods here: Tempel of Irmorom, Tempel of Ronagan and Temple of Nagrun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Irmoromtempel, Ronagantempel, Nagruntempel"));
talkEntry:addResponse("Wir haben je einen Tempel für unsere drei Götter hier. Irmoromtempel, Ronagantempel und Nagruntempel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("teleport");
talkEntry:addResponse("With this teleporter here you can travel save and quick to Runewick, Cadomyr or the Hemp Necktie Inn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("teleport");
talkEntry:addResponse("Mit diesen Teleporter hier kannst du sicher und schnell nach Runewick, Cadomyr oder zum Gasthof zur Hanfschlinge reisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Donkey stable");
talkEntry:addTrigger("stable");
talkEntry:addResponse("Through the towngate and right then. *nods*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eselstall");
talkEntry:addTrigger("Stall");
talkEntry:addResponse("Auf der rechten Seite nach dem Stadtor. *nickt*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Donkey");
talkEntry:addResponse("Weak people must and reach people can rent one at the donkey stable here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Esel");
talkEntry:addResponse("Schwache müssen und reiche Leute können sich einen hier im Eselstall ausleihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Well Dreams");
talkEntry:addResponse("The Well of Dreams is at the other side of the town. Therefore, enter the town, pass the market and Villa Goldvein and you are there. But usually, people avoid this place. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Quelle Träume");
talkEntry:addResponse("Die Quelle der Träume ist an der anderen Seite der Stadt. Daher rein mit dir, passiere den Markt und die Villa Goldader und du bist dort. Aber Leute vermeiden diesen Ort normal. *grinst*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Villa Goldvein");
talkEntry:addResponse("The Villa Goldvein is at the other side of the town, close to the Well of Dreams. It is a place for the richer ones among us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Villa Goldader");
talkEntry:addResponse("Die Villa Goldader ist an der anderen Seite der Stadt, nahe der Quelle der Träume. Sie ist ein Ort für die reicheren unter uns.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Workshop");
talkEntry:addResponse("The Workshop is on the left side behind the road to the Malachite Mine. It is a place for smiths and other crafters. You find also a slave inside there who will help you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Werkstatt");
talkEntry:addResponse("Die Werkstatt is auf der linken Seite nach der Straße zur Malachitmine. Sie ist ein Ort für Schmiede und andere Handwerker. Du findest auch einen Sklaven drinen der dir helfen wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Guardroom");
talkEntry:addResponse("The Guardroom is close to the townwall on the right side after the Dark Ally. You will also find someone inside who will help you to remember things. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wachstube");
talkEntry:addResponse("Die Wachstube ist nache der Stadtmauer auf der rechten Seite nach der Dunklen Gasse. Du wirst dort auch jemand finden der dir helfen wird Dinge in Erinnerung zu halten. *grinst*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dark Alley");
talkEntry:addResponse("The Dark Ally is behind the Donkey stable. Do I really have to explain you what you can do there? *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dunkle Gasse");
talkEntry:addResponse("Die Dunkle Gasse ist hinter dem Eselstall. Muss ich dir wirklich erklären was du da hinten alles machen kannst? *grinst*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Temple Irmorom");
talkEntry:addTrigger("Irmorom Temple");
talkEntry:addResponse("The Temple of Irmorom is close to Villa Goldvein. You can pray to Irmorom there and hope that you become a rich person.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel Irmorom");
talkEntry:addTrigger("Irmorom Tempel");
talkEntry:addResponse("Der Tempel des Irmorom ist nahe der Villa Goldader. Du kannst dort zu Irmorom beten und hoffen, dass du reich wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair's Crest");
talkEntry:addTrigger("Galmair Crest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Guilianni Residence, Council Chamber, Golden Dreams, Treasury, Library"));
talkEntry:addResponse("Galmair's Crest is the heart of Galmair and the residence of our Don. It is close to the market and you find there: Guilianni Residence, Don's Council Chamber, Golden Dreams, Treasury and Library.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair Krone");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Guilianni Residenz, Konzil Kammer, Goldträume, Schatzkammer, Bibliothek"));
talkEntry:addResponse("Galmairs Krone ist das Herz von Galmair und die Residenz unseres Don. Es ist nahe dem Markt und findest dort: Guilianni Residenz, Don's Konzil Kammer, Goldträume, Schatzkammer, Bibliothek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library");
talkEntry:addResponse("Our library in Galmair's Crest contains all our books. Among those are our history book, books about locations, gods, factions and so on. Just take a look there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek");
talkEntry:addResponse("Unsere Bibliothek in Galmairs Krone enthällt all unsere Bücher. Unter diesen findest du unser Geschichtebuch, Bücher über Orte, Götter, Fraktionen und so weiter. Sieh einfach nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Guilianni Residence");
talkEntry:addResponse("In this place in Galmair's Crest you will find and meet our Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Guilianni Residenz");
talkEntry:addResponse("An diesem Ort in Galmairs Krone findest und triffst du unseren Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Council Chamber");
talkEntry:addResponse("This is a conference room in Galmair's Crest to discuss how to improve our treasury for example.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Konzil Kammer");
talkEntry:addResponse("Dies ist ein Konferenezraum in Galmairs Krone zum diskutieren wie man die Schatzkammer verbessern könnte zum Beispiel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Golden Dreams");
talkEntry:addResponse("The room Golden dreams in Galmair's Crest is the private room of the Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Goldträume");
talkEntry:addResponse("Der Raum Goldträume in Galmairs Krone ist der private Raum des Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Treasury");
talkEntry:addResponse("Ha, ha... of course you like to know more about this room in Galmair's Crest. Stop dreaming! I do not think that you will ever be in this room. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schatzkammer");
talkEntry:addResponse("Ha, ha... klar würdest du gerne mehr über diesen Raum in Galmairs Krone wissen. Denkste! Ich glaub kaum, dass du den je von innen sehen wirst. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Scoria Mine");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] The Winged Sow Tavern, Flicker Swale, Hog Dens, Cameo Pit, Sewers."));
talkEntry:addResponse("The Scoria Mine is after the market on the right side. You have to take the elevator to get down and you will find following shafts there: The Winged Sow Tavern, Flicker Swale, Hog Dens, Cameo Pit and Sewers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schlackengrube");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Taverne zur Geflügelten Sau, Schimmersenke, Schweinebaue, Gemmenschacht, Abwasserschächte"));
talkEntry:addResponse("Die Schlackengrube ist nach dem Markt auf der rechten Seite. Du musst den Aufzug verwenden um hinunter zu kommen. Du findest folgende Schächte dort: Taverne zur Geflügelten Sau, Schimmersenke, Schweinebaue, Gemmenschacht und Abwasserschächte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("elevator");
talkEntry:addResponse("The elevator will help you to get down into the Scoria Mine. From there you have access to all shafts in the Scoria Mine. You will find the elevator on the other side of the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Aufzug");
talkEntry:addResponse("Der Aufzug wird dir helfen hinunter in die Schlackengrube zu kommen. Von dort hast du Zugang zu allen Schächten in der Schlackengrube. Du kannst den Aufzug auf der anderen Seite der Stadt finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Winged Sow Tavern");
talkEntry:addResponse("This place in the Scoria Mine has two entrances. The main entrance is over the Scoria Mine elevator and the second one is over a ladder close before the elevator. Follow the signposts. However, you will find good beer and entertainment there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Taverne Geflügelten Sau");
talkEntry:addResponse("Dieser Ort in der Schlackengrube hat zwei Eingänge. Den Haupteingang über die Schlackengrube Aufzug und den zweiten über eine Leiter knapp vor dem Aufzug. Folge den Wegweisern. Wie dem auch sei, du wirst gutes Bier und Unterhaltung dort finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tavern");
talkEntry:addResponse("This place in the Scoria Mine has two entrances. The main entrance is over the Scoria Mine elevator and the second one is over a ladder close before the elevator. Follow the signposts. However, you will find good beer and entertainment there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tavern");
talkEntry:addResponse("Dieser Ort in der Schlackengrube hat zwei Eingänge. Den Haupteingang über die Schlackengrube Aufzug und den zweiten über eine Leiter knapp vor dem Aufzug. Folge den Wegweisern. Wie dem auch sei, du wirst gutes Bier und Unterhaltung dort finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Temple Ronagan");
talkEntry:addTrigger("Ronagan Temple");
talkEntry:addResponse("The Temple of Ronagan can be found in the Scoria Mine. Just follow the signposts, but keep in mind that it is flooded currently.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel Ronagan");
talkEntry:addTrigger("Ronagan Tempel");
talkEntry:addResponse("Der Tempel von Ronagan kann in der Schlackengrube gefunden werde. Folge einfach den Wegweisern, aber beachte, dass er momentan überflutet ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Flicker Swale");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keyword]Gameroom, Temple of Nagrun"));
talkEntry:addResponse("The Flicker Swale can be found in the Scoria Mine. Just follow the signposts. There you also find the Gameroom and the Temple of Nagrun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schimmersenke");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwort]Spielruam, Tempel des Nagrun"));
talkEntry:addResponse("Die Schimmersenke kann in der Schlackengrube gefunden werde. Folge einfach den Wegweisern. Dort findest du auch den Spielraum und den Tempel des Nagrun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gameroom");
talkEntry:addResponse("The Gameroom in the Flicker Swale offers you a great opportunity to get the money of others... or to lose your own! *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spielraum");
talkEntry:addResponse("Der Spielraum in der Schlimmersenke ermöglicht dir das Geld anderer abzuknüpfen...oder dein eigenes zu verlieren. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Temple Nagrun");
talkEntry:addTrigger("Nagrun Temple");
talkEntry:addResponse("The Temple of Nagrun in the Flicker Swale is a place for all those who follow Nagrun. Obvious, isn't it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel Nagrun");
talkEntry:addTrigger("Nagrun Tempel");
talkEntry:addResponse("Der Temepl des Nagrun in der Schimmersenke ist ein Ort für jene die Nagrun folgen. Klar, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hog Dens");
talkEntry:addResponse("The Hog Dens can be found in the Scoria Mine. Just follow the signposts. This place is manly used by our green friends - the orcs.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schweinebaue");
talkEntry:addResponse("Die Schweinebaue kann in der Schlackengrube gefunden werde. Folge einfach den Wegweisern. Dieser Ort wird hauptsächlich von unseren grünen Freunden verwendet - den Orks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cameo Pit");
talkEntry:addResponse("The Cameo Pit can be found in the Scoria Mine. Just follow the signposts. It contains the flats of those who have not enough money to live at Villa Goldvein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gemmenschacht");
talkEntry:addResponse("Der Gemmenschacht kann in der Schlackengrube gefunden werde. Folge einfach den Wegweisern. Er beinhaltet die Wohnungen jener, welche nicht genügend Geld haben um in der Villa Goldader zu wohnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sewers");
talkEntry:addResponse("The Sewers can be found in the Scoria Mine. Just follow the signposts. At this place are leaving some ratemen and other creatures. You can try it there. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Abwassersch");
talkEntry:addResponse("Die Abwasserschächte kann in der Schlackengrube gefunden werde. Folge einfach den Wegweisern. Dort findest du Rattenmänner und andere Kreaturen. Versuchs einfach. *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hinterland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Sleepy Bujhaar Inn, Census office, Sport Hole, Malachite Mine, Miner's club, Miner's spring, Woodcorner, Stinky Fisherman, The Platform, Black Hole Mine, Farmland, Copperbridge, Blackbridge"));
talkEntry:addResponse("In the so called Hinterlands you can find: Sleepy Bujhaar Inn, Census office, Sport Hole, Malachite Mine, Miner's club, Miner's spring, Woodcorner, Stinky Fisherman, The Platform, Black Hole Mine, Farmland, Copperbridge and Blackbridge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hinterland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gasthof zum schläfrigen Bujhaar, Zensusbüro, Tollloch, Malachitmine, Schürfer Club, Schürfer Quelle, Waldeck, Stinkender Fischer, Plattform, Dunkellochmine, Ackerland, Kupferbrücke, Schwarzbrücke."));
talkEntry:addResponse("In dem sogenannten Hinterland findest du: Gasthof zum schläfrigen Bujhaar, Zensusbüro, Tollloch, Malachitmine, Schüfer Club, Schüfer Quelle, Waldeck, Stinkender Fischer, Plattform, Dunkellochmine, Ackerland, Kupferbrücke and Schwarzbrücke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sleepy Bujhaar Inn");
talkEntry:addResponse("The Sleepy Bjhaar Inn can be found on the road to the Malachite Mine after the Census office. Just look for signposts. You can rest and eat there if you want.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gasthof Bujhaar");
talkEntry:addResponse("Das Gasthaus zum Schlafenden Bujhaar kann an der Straße zur Malachitmine nach dem Zensusbüro gefunden werden. Folge einfach den Wegschildern. Du kannst dort essen oder rasten wenn du möchtest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Census office");
talkEntry:addResponse("The Census office can be found south on the way to the Malachite Mine close to the Sleepy Bujhaar Inn. You can register there to increase the treasury of the Don. *smirks*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zensusbüro");
talkEntry:addResponse("Das Zensusbüro kann südlich auf den Weg zu Malachitmine gefunden werden, nahe dem Gasthof zum schläfrigen Bujhaar. Du kannst dich dort anmelden und somit helfen die Schatzkammer des Don bereichern *kichert*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sport Hole");
talkEntry:addResponse("The Sport Hole is used for those people who think they can betray the Don. It is on the road to the Malachite mine close to the bridge over the Malachite creek there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tollloch");
talkEntry:addResponse("Das Tolloch wird für jene Leute verwendet, die der Meinung sind den Don betrügen zu können. Es ist an der Straße zur Malachitmine kurz vor der Brücke über den Malachit Bach dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachite Mine");
talkEntry:addResponse("The Malachite mine is in the south of Galmair. Just enter the town and walk south while you follow the signposts. You can get iron, copper and gold there. It has also an entrance to the Shadowland.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachitmine");
talkEntry:addResponse("Die Malachitmine ist im Süden von Galmair. Gehe in die Stadt und folge den Wegweisern in den Süden. Du wirst dort Eisen, Kupfer und Gold finden. Es hat auch einen Eingang zum Schattenland.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miner Club");
talkEntry:addResponse("The Miner's Club is a place to rest for the miners in the Malachite mine, which is very close. The club was founded by the Father of the Don, Don Tommaso Guilianni and he spent a lot of time there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schürfer Club");
talkEntry:addResponse("Der Schürfer Club ist ein Ort zum Rasten für die Schürfer in der Malachitmine, welche sehr nahe ist. Der Club wurde errichtet vom Vater des Don, Don Tommaso Guilianni und er hat dort viel Zeit verbracht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Miner spring");
talkEntry:addResponse("The Miner's spring is next to the Miner's Club, and rumors tell that people who rest there become better miners.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schürfer Quelle");
talkEntry:addResponse("Die Schürfer Quelle ist neben dem Schürfer Club, und Gerüchten zufolge werden Leute die dort rasten bessere Schürfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Woodcorner");
talkEntry:addResponse("That is a camp for lumberjacks and it is very close. Just behind the teleporter *points northe*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Waldeck");
talkEntry:addResponse("Das ist ein Lager für Holzfäller und es ist sehr nahe. Gleich hinter dem Teleporter *zeigt in den Norden");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stinky Fisherman");
talkEntry:addResponse("The Stinky Fisherman is a place for fisher and it is south from here at the north bank of the Malachite creek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stinkende Fischer");
talkEntry:addResponse("Der Stinkende Fischer ist ein Ort für Fischer und ist südlich von hier am Nordufer des Malachit Bach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Platform");
talkEntry:addResponse("The Platform is a place for fishers close at the Copperbridge. *points east* It was also used by lizards to rise and pray their in the past. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Plattform");
talkEntry:addResponse("Die Plattform ist ein Ort für Fischer nahe der Kupferbrücke. *zeigt in den Osten* Sie wurde früher auch von Echsen genutzt zum Entspringen und Beten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Black Hole Mine");
talkEntry:addResponse("The Black Hole Mine is far in the north. You have walk east, over the Copperbridge, the north to Blackbridge, pass the harbour and then you are there. You can find coal there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dunkellochmine");
talkEntry:addResponse("Die Dunkellochmine ist weit im Norden. Du musst in den Osten gehen, über die Kupferbrücke, dann in den Norden über die Schwarzbrücke, beim Hafen vorbei und dann bist du dort. Du wirst Kohle dort finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farmland");
talkEntry:addResponse("The Farmland is just here. *points south*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ackerland");
talkEntry:addResponse("Das Ackerland ist gleich hier. *zeigt in den Süden*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Copperbridge");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keyword] location"));
talkEntry:addResponse("The Copperbridge in the east leads you over the Malachite creek to Nagrun's Plain fist and then to the Hemp Necktie Inn, if you like to go to this location.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kupferbrücke");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwort] Ort"));
talkEntry:addResponse("Die Kupferbrücke im Osten führt dich über den Malachit Bach zur Nagrun Ebene zuerst und dann zum Gasthof zur Hanfschlinge, falls du zu diesen Ort gehen möchtest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blackbridge");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keyword] location"));
talkEntry:addResponse("The Blackbridge in the northeast leads you over the Bounding Stream to the Swamp and Northern Woods, if you like to go to this location.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schwarzbrücke");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwort] Ort"));
talkEntry:addResponse("Die Schwarzbrücke im Nordosten von hier führt dich über den Grenzstrom zum Sumpf und den Nördlichen Wäldern, falls du zu diesen Orten gehen möchtest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Shadowland");
talkEntry:addResponse("A dangerous place at the south end of the Malachite mine. Do not go alone there. For more information ask someone else.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schattenland");
talkEntry:addResponse("Ein gefährlicher Ort am südlichen Ende der Malachit Mine. Geh nicht alleine dort hin. Für mehr Information frage jemanden anderen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faction");
talkEntry:addResponse("There are three factions: Our faction Galmair, ruled by our rich leader Don Valerio Guilianni. Then the two poor factions of Runewick and Cadomyr, ruled by Archmage Elvaine Morgan and Queen Rosaline Edwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fraktion");
talkEntry:addResponse("Es gibt drei Fraktionen: Unsere Fraktion Galmair, geführt von unserem reichen Herrscher Don Valerio Guilianni. Dann diese zwei armen Fraktionen Runewick und Cadomyr, geführt von Erzmagier Elvaine Morgan und Königin Rosaline Edwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Arrgh! The ruler of Runewick and I do not care about him! Just bring his head to the Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Arrgh! Der Herrscher von Runewick und der interessiert mich auch nicht. Bring einfach seinen Kopf dem Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Arrgh! The ruler of Runewick and I do not care about him! Just bring his head to the Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Arrgh! Der Herrscher von Runewick und der interessiert mich auch nicht. Bring einfach seinen Kopf dem Don.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Don't waste your time there, but if you look for Alchemists, Candle makers, Carpenters, Lumberjacks, Cooks, Bakers, Farmers, Herb gatherers, or Tailors, Tanners and Dyers you will find some there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Verschwende deine Zeit dort nicht, aber wenn du Alchemisten, Kerzenmacher, Schreiner, Holzfäller, Koch, Bäcker, Bauer, Kräutersammler, Schneider, Gerber oder Färber suchst, kannst du dort welche finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Our ruler. You can find him at his residence in the Galmair's Crest. Just follow the road to the Well of Dreams. *points the towngate*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Unser Herrscher. Du findest ihn in seiner Residenz in Galmairs Krone. Folge einfach der Straße zur Quelle der Träume. *deutet auf das Stadttor");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Here at Galmair, we are interested in Blacksmiths, Brick makers, Masons, Miners, and Brewers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Hier in Galmair suchen wir immer nach einen Schmied, Ziegelmacher, Steinmetz, Schürfer oder Brauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("#me shudders 'This ugly face is rules Cadomyr. If you bring her hair to the Don he will probably like that.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("#me schaudert 'Dieses hässliche Gesicht regiert Cadomyr. Wenn du ihr Haar dem Don bringst wird er das viellecht mögen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("#me shudders 'This ugly face is rules Cadomyr. If you bring her hair to the Don he will probably like that.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("#me schaudert 'Dieses hässliche Gesicht regiert Cadomyr. Wenn du ihr Haar dem Don bringst wird er das viellecht mögen.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Don't waste your time there, but if you look for Fishermen, Glass blowers, Diggers, Finesmiths, and Gem grinders you will find some there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Verschwende deine Zeit dort nicht, aber wenn du Fischer, Glasblässer, Gräber, Goldschmied oder Edelsteinschleifer suchst, kannst du dort welche finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't sell or buy anything. But we have a marketplace. You can try your luck there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe oder kaufe gar nichts. Aber wir haben einen Marktplatz. Versuch dein Glück doch dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I can tell you many things about Galmair. Just ask me about buildings, locations, events, people, history or gods of Galmair. Additionaly, I have a little task.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich kann dir viele Dinge über Galmair erzählen. Frag nur nach Gebäude, Orte, Ereignisse, Leute, Geschichte oder Götter von Galmair. Zusätzlich hätte ich noch eine kleine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Primarly, we pray to three gods in Galmair. They are Ronagan, Nargun and Irmorom of course, my favorite god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bevorzugt betten wir drei Götter in Galmair an. Die wären Ronagan, Nargun und Irmorom, meine bevorzugte Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("One of the weak younger gods. You can find fellows in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Einer der schwachen, jüngeren Götter. Du kann Anhänger in Runewick finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("One of the elder gods, but we do not care about this god here. So, better do not waste your time with this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Einer der alten Götter, aber wir kümmern uns hier nicht um diese Gottheit. Daher verschwende besser deine Zeit nicht mit dieser Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Goddess of Spirits and the Underworld. She appears as a black dressed ageless woman with gray skin colour and gray hairs. Her face appears as life would disgust her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Die Göttin der Geister und der Unterwelt. Sie erscheint als schwar gekleidete alterlose Frau mit grauer Hautfarbe und grauen Haaren. Ihr Gesicht wirkt als würde sie das Leben sie anwidern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("One of the weak younger gods. You can find fellows in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Eine der schwachen, jüngeren Götter. Du kann Anhänger in Runewick finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("One of the elder gods, but we do not care about this god here. So, better do not waste your time with this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Einer der alten Götter, aber wir kümmern uns hier nicht um diese Gottheit. Daher verschwende besser deine Zeit nicht mit dieser Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("One of the elder gods, but we do not care about this god here. So, better do not waste your time with this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Eine der alten Götter, aber wir kümmern uns hier nicht um diese Gottheit. Daher verschwende besser deine Zeit nicht mit dieser Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Most dwarves, businessmen and crafters, i.e. blacksmiths, pray to Irmorom. They believe that in life, they will be rewarded for their doings with wealth, and they pray for enchantment of crafted things, for a goodriches, and things like this.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Die meisten seiner Anhänger sind Zwerge, Händler, Handwerker und Schmiede. Sie glauben, wenn sie Irmoron anbeten, gelangen sie zu Wohlstand und Reichtum. Angeblich gewährt er auch Kräfte, um Waffen und Gegenstände zu verzaubern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("One of the weak younger gods. You can find fellows in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Einer der schwachen, jüngeren Götter. Du kann Anhänger in Cadomyr finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("What do you want with the bloodgod? I don't like him, we don't like him and you should also avoid him!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Was willst du mit dem Blutgott? Ich mag ihn nicht, wir mögen ihn nicht und du solltest ihn besser auch nicht mögen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("His followers are few, and most people simply do not mention his name not to attract his attention. They believe that everything happens accidentally, and to make a fortune, one must play with high risk to have fun.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Seine Gefolgsleute sind nur gering an der Zahl und die meisten Leute sprechen seinen Namen nicht aus, um nicht seine Aufmerksamkeit zu erregen. Sie glauben, dass alles zufällig geschieht, und dass das Glück nur Jenen winkt, die mit Risiko spielen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("One of the weak younger gods. You can find fellows in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Eine der schwachen, jüngeren Götter. Du kann Anhänger in Runewick finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan's followers are mostly poor people who grow up on the streets, and most become thieves, spies or assassins. They believe that perhaps Ronagan will help them to steal and to protect them from the protectors of the rich, the authorities.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ronagan's Anhänger sind zumeist arme Leute aus denen häufig Diebe, Spione oder gedungene Mörder werden. Sie glauben daran, dass Ronagan ihnen bei der Ausführung ihrer Taten helfen wird oder sie vor dem Zugriff der Justiz bewahrt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("One of the weak younger gods. You can find fellows in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Eine der schwachen, jüngeren Götter. Du kann Anhänger in Cadomyr finden");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("One of the elder gods, but we do not care about this god here. So, better do not waste your time with this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Eine der alten Götter, aber wir kümmern uns hier nicht um diese Gottheit. Daher verschwende besser deine Zeit nicht mit dieser Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("One of the elder gods, but we do not care about this god here. So, better do not waste your time with this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Eine der alten Götter, aber wir kümmern uns hier nicht um diese Gottheit. Daher verschwende besser deine Zeit nicht mit dieser Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("One of the weak younger gods. You can find fellows in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Einer der schwachen, jüngeren Götter. Du kann Anhänger in Cadomyr finden");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Arrr, what shall that be?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Arrr, was soll das sein?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("My name sounds better! I hope your questions sound better!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Mein Name klingt besser! Ich hoffe deine Fragen klingen besser!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Iradona");
talkEntry:addTrigger("Goldschein");
talkEntry:addResponse("Yes, that is my name. About what do you want information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Iradona");
talkEntry:addTrigger("Goldschein");
talkEntry:addResponse("Ja, das ist mein Name. Über was wollt ihr Information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("As I see, you can say one word, but what about a whole sentence?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Wie ich merke, kannst du schon ein Wort sagen. Aber wie sieht es mit einem ganzen Satz aus?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("As I see, you can say one word, but what about a whole sentence?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Wie ich merke, kannst du schon ein Wort sagen. Aber wie sieht es mit einem ganzen Satz aus?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, about what shall I give you information? Do you mind just to ask for help as a first step?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, über was wünscht ihr Information? Vielleicht begnügt ihr euch erstmal nach Hilfe zu fragen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in Galmair!", "Welcome in Galmair!");
talkingNPC:addCycleText("Ich bin die Auskunftsgeberin von Galmair. Fragt mich nach Informationen wenn ihr welche wissen wollt.", "I am the informant of Galmair. Ask me for informations if you want some.");
talkingNPC:addCycleText("Wer etwas über die Orte hier wissen will, soll mich nur nach diesen Orten fragen.", "If someone wants to know something about the locations here, just ask me for these locations.");
talkingNPC:addCycleText("Wer etwas über die Gebäude hier wissen will, soll mich nur nach diesen Gebäuden fragen.", "If someone wants to know something about the buildings here, just ask me for these buildings.");
talkingNPC:addCycleText("Wer etwas über die Geschichte von Galmair wissen will, soll mich nur nach der Geschichte fragen.", "If someone wants to know something about the history of Galmair, just ask me for the history.");
talkingNPC:addCycleText("Wer etwas über die Leute hier wissen will, soll mich nur nach diesen Leuten fragen.", "If someone wants to know something about the people here, just ask me for these people.");
talkingNPC:addCycleText("Wer etwas über die Götter hier wissen will, soll mich nur nach diesen Gottheiten fragen.", "If someone wants to know something about the gods here, just ask me for these gods.");
talkingNPC:addCycleText("Wer etwas über die Ereignisse hier wissen will, soll mich nur nach diesen Ereignissen fragen.", "If someone wants to know something about the events here, just ask me for these events.");
talkingNPC:addCycleText("#me kratzt sich im Gesicht.", "#me paddles her face.");
talkingNPC:addCycleText("#me blickt herum mit ihren weit geöffneten Augen.", "#me looks around with wide opened eyes.");
talkingNPC:addCycleText("#me untersucht ihr Kleid.", "#me examines her dress.");
talkingNPC:addCycleText("#me streichelt ihren Bauch.", "#me pets her belly.");
talkingNPC:addCycleText("#me isst eine Wurst.", "#me eats a sausage.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(2);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Iradona Goldschein die Auskunftgeberin.", "This NPC is Iradona Goldschein the informant.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 800);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 826);
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