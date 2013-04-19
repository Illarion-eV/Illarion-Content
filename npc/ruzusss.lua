--------------------------------------------------------------------------------
-- NPC Name: Ruzusss                                                  Cadomyr --
-- NPC Job:  hunter                                                           --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  126, 630, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 126, 630, 0, 4, 'Ruzusss', 'npc.ruzusss', 0, 3, 5, 34, 139, 34, 154, 205, 50);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.condition.state")
require("npc.base.condition.town")
require("npc.base.consequence.attribute")
require("npc.base.consequence.inform")
require("npc.base.consequence.item")
require("npc.base.consequence.money")
require("npc.base.consequence.quest")
require("npc.base.consequence.rankpoints")
require("npc.base.consequence.state")
require("npc.base.talk")
module("npc.ruzusss", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Ruzusss the hunter. Keywords: Question, information, Cadomyr, places."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Ruzusss der Jäger. Schlüsselwörter: Auskunft, Information, Cadomyr, Orte."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(640, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest End 'Find Ruzusss'] You receive 10 silver coins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(640, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Greetingsss. Finally you have found me! Frizza hasss already informed me about your visit. There, you can have sssome sssilver coinsss for finding me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(640, "=", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Ende 'Finde Ruzusss'] Du hast 10 Silberstücke erhalten."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(640, "=", 2));
talkEntry:addConsequence(npc.base.consequence.rankpoints.rankpoints("+", 5));
talkEntry:addResponse("Grüsssse. Endlich habssst du mich gefunden. Frizza hat mich bereitsss informiert über deinen Besssuch. Hier hassst du deine wohlverdienten Münzen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(640, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest End 'Find Ruzusss'] You receive 10 silvercoins."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(640, "=", 2));
talkEntry:addResponse("Greetingsss. Finally you have found me! Frizza hasss already informed me about your visit. There, you can have sssome sssilver coinsss for finding me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(640, "=", 1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Quest Ende 'Finde Ruzusss'] Du hast 10 Silberstücke erhalten."));
talkEntry:addConsequence(npc.base.consequence.money.money("+", 1000));
talkEntry:addConsequence(npc.base.consequence.quest.quest(640, "=", 2));
talkEntry:addResponse("Grüsssse. Endlich habssst du mich gefunden. Frizza hat mich bereitsss informiert über deinen Besssuch. Hier hassst du deine wohlverdienten Münzen.");
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
talkEntry:addResponse("Greetingsss, can I help you?");
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
talkEntry:addResponse("Grüsssse, kann ich helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetingsss, can I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüsssse, kann ich helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Sssee you again if you need more information.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Wir sssehen unsss wenn mehr Information benötigt wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Very good, jussst won another game.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Sssehr gut, gerade wieder ein Ssspiel gewonnen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Ruzusss the hunter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ruzusss der Jäger.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Hunter. I can tell you many thingsss about the landsss around Cadomyr. Just asssk me about locationsss around Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Jäger. Ich kann viele Dinge über Cadomyr erzählen. Frag nur nach Orten in der Nähe von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Hunter. I can tell you many thingsss about the landsss around Cadomyr. Just asssk me about locationsss around Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Jäger. Ich kann viele Dinge über Cadomyr erzählen. Frag nur nach Orten in der Nähe von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Illarion, northeast, northwest, southwest, southeast"));
talkEntry:addResponse("I have information about placesss clossse to Cadomyr. Just asssk me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Illarion, Nordosten, Nordwesten, Südwesten, Südosten"));
talkEntry:addResponse("Ich habe Informationen zu den Orten in der Nähe von Cadomyr geben. Frag einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("question");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Illarion, northeast, northwest, southwest, southeast"));
talkEntry:addResponse("I have information about placesss clossse to Cadomyr. Just asssk me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Auskunft");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Illarion, Nordosten, Nordwesten, Südwesten, Südosten"));
talkEntry:addResponse("Ich habe Informationen zu den Orten in der Nähe von Cadomyr geben. Frag einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Frizza");
talkEntry:addResponse("You can find her outssside of the town, clossse to the teleporter. Sssshe hasss a lot of information and sssome tasksss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frizza");
talkEntry:addResponse("Du findest sssie draußen vor der Stadt, nahe am Teleporter. Sssie hat eine Menge Informationen und Aufträge für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Illarion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] northeast, northwest, southwest, southeast"));
talkEntry:addResponse("This land is called Illarion and I divide it into the northeast, northwest, southwest and southeast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Illarion");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Nordosten, Nordwesten, Südwesten, Südosten"));
talkEntry:addResponse("Dieses Land wird Illarion genannt und ich unterteile es in in Nordost, Nordwest, Südwest und Südost.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("northeast");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Elstree Forest, Elstree Plain, Eastland, Pauldron Isle, Dead Marsh, Spider's Mouth, Hemp Necktie Inn, Bounding Stream, Glowing River, Plains of Silence, Northern Woods, Insurmountable Limes, Evilrock, Three Fingertips, Wulfgorda."));
talkEntry:addResponse("I know of the following placesss: Elstree Forest, Elstree Plain, Eastland, Pauldron Isle, The Dead Marsh, Spider's Mouth, Hemp Necktie Inn, Bounding Stream, Glowing River, Plains of Silence, Northern Woods, The Insurmountable Limes, Evilrock, Three Fingertips. For more detailed information though, ask Wulfgorda at the Hemp Necktie Inn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordost");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Elstree Wald, Elstree Ebene, Ostland, Schulterplatte Insel, Todes Sumpf, Spinnen Maul, Gasthof zur Hanfschlinge, Grenzstrom, Glühender Fluss, Ebenen der Stille, Nördliche Wälder, Unüberwindbarer Limes, Böser Fels, Dreifingerspitzen, Wulfgorda."));
talkEntry:addResponse("Dort gibt es: Elstree Wald, Elstree Ebene, Ostland, Schulterplatte Insel, Todes Sumpf, Spinnen Maul, Gasthof zur Hanfschlinge, Grenzstrom, Glühender Fluss, Ebenen der Stille, Nördliche Wälder, Unüberwindbarer Limes, Böser Fels, Dreifingerspitzen. Aber für ausführlichere Informationen frage Wulfgorda beim Gasthof zur Hanfschlinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("northwest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Lake Syrita, Nargun's Plain, The Swamp, Temple of the Five, Lonely Mountains, Galmair Plateau, Lotta Medborgar."));
talkEntry:addResponse("I know of the following placesss: Lake Syrita, Nargun's Plain, The Swamp, Temple of the Five, Lonely Mountains, Galmair Plateau. For more detailed information though, ask Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nordwest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] See Syrita, Narguns Ebene, Der Sumpf, Tempel der Fünf, Einsame Berge, Galmair Hochebene, Lotta Medborgar."));
talkEntry:addResponse("Ich habe Informationen zu folgenden Orten: See Syrita, Narguns Ebene, Der Sumpf, Tempel der Fünf, Einsame Berge, Galmair Hochebene. Aber für ausführlichere Informationen frage Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("southwest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Shadowland, Wight Canal, Sentry Forest, Great Ocean, Border Mountains, Katanbi Desert, Katanbi Delta, Western Katanbi Desert"));
talkEntry:addResponse("I know of the following placesss: Shadowland, Wight Canal, Sentry Forest, Great Ocean, Border Mountains, Katanbi Desert, Katanbi Delta, Western Katanbi Desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Südwest");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Schattenland, Wichtkanal, Wachwald, Großer Ozean, Grenzberge, Katanbi Wüste, Katanbi Delta, Westliche Katanbi Wüste"));
talkEntry:addResponse("Ich habe Informationen zu folgenden Orten: Schattenland, Wichtkanal, Wachwald, Großer Ozean, Grenzberge, Katanbi Wüste, Katanbi Delta, Westliche Katanbi Wüste");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("southeast");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Snakehead Bay, Lonely Islands, Death's Stench, Dragon's Lair, Dewy Swamps Yewdale, Numila Irunnleh."));
talkEntry:addResponse("I know of the following placesss: Snakehead Bay, Lonely Islands, Death's Stench, Dragon's Lair, Dewy Swamps, Yewdale. For more detailed information though ask Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Südost");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Schlangenkopfbucht, Einsame Inseln, Todes Gestank, Drachenhöhle, Frische Sümpfe, Eibental, Numila Irunnleh."));
talkEntry:addResponse("Ich habe Informationen zu folgenden Orten: Schlangenkopfbucht, Einsame Inseln, Todes Gestank, Drachenhöhle, Frische Sümpfe, Eibental.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elstree Forest");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elstree Wald");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elstree Plain");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elstree Ebene");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eastland");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ostland");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pauldron");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schulterplatte");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dead Marsh");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Todes Sumpf");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spider Mouth");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Spinnen Maul");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hemp Necktie Inn");
talkEntry:addResponse("The Hemp Necktie Inn is a neutral tavern in the Spider's Mouth and many adventurer restsss there. Amongst othersss, is Wulfgorda. You can ussse the teleporter to get there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gasthof Hanfschlinge");
talkEntry:addResponse("Der Gasthof zur Hanfschlinge ist eine neutrale Taverne im Spinnen Mund und viele Abenteuerer rasten dort. Unteranderem Wulfgorda. Du kannst den Teleporter verwenden um dort hinzukommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(650, "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Wulfgorda");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest 'Find Wulfgorda' started] Try to find Wulfgorda and take her the sibanac leaves to get your reward."));
talkEntry:addConsequence(npc.base.consequence.item.item(155, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(650, "=", 1));
talkEntry:addResponse("Wulfgorda is a hunter who knowsss almossst every place in the northeast. You can find her in front of the Hemp Necktie Inn. Furthermore, you should take her thessse leavesss here. *hands over some sibanac leaves*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(650, "<", 1));
talkEntry:addTrigger("Wulfgorda");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest 'Finde Wulfgorda' gestartet] Finde Wulfgorda und bringe ihr die Sibanacblätter um deine Belohnung zur erhalten."));
talkEntry:addConsequence(npc.base.consequence.item.item(155, 10, 333, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(650, "=", 1));
talkEntry:addResponse("Wulfgorda ist eine Jägerin, welche beinahe jeden Platz im Nordosten kennt. Du findest sie vor dem Gasthaus zur Hanfschlinge. Des weiteren kannst du ihr auch gleich diese Blätter hier bringen. *überreicht Sibanac Blätter*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Wulfgorda");
talkEntry:addResponse("Wulfgorda is a hunter who knowsss almossst every place in the northeast. You can find her in front of the Hemp Necktie Inn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wulfgorda");
talkEntry:addResponse("Wulfgorda ist eine Jägerin, welche beinahe jeden Platz im Nordosten kennt. Du findest sie vor dem Gasthaus zur Hanfschlinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bounding Stream");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grenzstrom");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glowing River");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glühender Fluss");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Plains Silence");
talkEntry:addResponse("Well, as I said, they are in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ebenen Stille");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Northern Woods");
talkEntry:addResponse("Well, as I said, they are in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nördliche Wälder");
talkEntry:addTrigger("Nördlichen Wälder");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Insurmountable Limes");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Unüberwindbarer Limes");
talkEntry:addTrigger("Unüberwindbare Limes");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Evilrock");
talkEntry:addResponse("Well, as I said, it is in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Böse Fels");
talkEntry:addTrigger("Böser Fels");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Three Fingertips");
talkEntry:addResponse("Well, as I said, they are in the northeast and you had better ask someone who lives there, for example, Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dreifingerspitzen");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Wulfgorda.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Snakehead Bay");
talkEntry:addResponse("Well, as I said, it is in the southeast and you had better ask someone who lives there, for example, Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schlangenkopfbucht");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Südosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lonely Islands");
talkEntry:addResponse("Well, as I said, they are in the southeast and you had better ask someone who lives there, for example, Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Einsame Inseln");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Südosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Death's Stench");
talkEntry:addTrigger("deaths stench");
talkEntry:addResponse("Well, as I said, it is in the southeast and you had better ask someone who lives there, for example, Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Todes Gestank");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Südosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dragon's Lair");
talkEntry:addTrigger("dragons lair");
talkEntry:addResponse("Well, as I said, it is in the southeast and you had better ask someone who lives there, for example, Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Drachenhöhle");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Südosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Dewy Swamps");
talkEntry:addResponse("Well, as I said, they are in the southeast and you had better ask someone who lives there, for example, Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frische Sümpfe");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Südosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yewdale");
talkEntry:addResponse("Well, as I said, it is in the southeast and you had better ask someone who lives there, for example, Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eibental");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Südosten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Numila Irunnleh in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Numila");
talkEntry:addTrigger("Irunnleh");
talkEntry:addResponse("You can find her in Runewick and ssshe knowsss ssseveral placesss in the southeast, thusss around Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Numila");
talkEntry:addTrigger("Irunnleh");
talkEntry:addResponse("Die findet man in Runewick und die kennt sämtliche Orte im Südosten, sprich um Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lake Syrita");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("See Syrita");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun's Plain");
talkEntry:addTrigger("narguns plain");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Narguns Ebene");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Swamp");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sumpf");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Temple five");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel Fünf");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lonely Mountains");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Einsame Berge");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair Plateau");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair Hochebene");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fortress Hammerfall");
talkEntry:addResponse("Well, as I said, it is in the northwest and you had better ask someone who lives there, for example, Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Festung Hammerfall");
talkEntry:addResponse("Nun, wie ich schon sagte, dieser Ort ist im Nordwesten zu finden. Bezüglich mehr Details bietet es sich an jemanden dort wohnhaften zu fragen. Zum Beispiel Lotta Medborgar in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lotta");
talkEntry:addTrigger("Medborgar");
talkEntry:addResponse("You can find her in Galmair and ssshe knowsss ssseveral placesss in the northwest, thusss around Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lotta");
talkEntry:addTrigger("Medborgar");
talkEntry:addResponse("Die findet man in Galmair und die kennt sämtliche Orte im Nordwesten, sprich um Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Shadowland");
talkEntry:addResponse("It has two entrances. One in the Malachite Mine and one to the southwest of the Border Mountains. No one has ever passed it. It is very dangerous there. The gate, therefore, is locked and only the three rulers know how to enter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schattenland");
talkEntry:addResponse("Es hat zwei Eingänge. Einen bei der Malachitmine und einen südwestlich der Grenzberge. Niemand hat es je durchquert. Viel zu gefährlich! Die Tore sind daher verschlossen und nur die drei Herrscher wissen wie man sie öffnet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wight Canal");
talkEntry:addResponse("The Wight Canal can be found at the east side of the Border Mountains, where it connects these Mountains with the Snakehead Bay. You can find Sssumroz's Home, the Firelimes, the Lighthouse Ruins, the Fisherhouse and the Cemetery very close to it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wichtkanal");
talkEntry:addResponse("Der Wichtkanal kann an der Ostseite der Grenzberge gefunden werden, wo er dieses Gebierge mit der Schlangenkopf Bucht verbindet. Du findes dort Sssumrozs Heim, den Feuerlimes, die Leuchthaus Ruinen, die Fischerhütte und den Friedhof in der Nähe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sentry Forest");
talkEntry:addResponse("The Sentry Forest can be found to the southeast of the Border Mountains. You will find Ushara's Spire, Sentry Outpost, Oldra's Corner, Gnuremground and Harrowed Mount there and around.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wachwald");
talkEntry:addResponse("Der Wachwald kann im Südosten der Grenzberge gefunden werden. Du wird dort und herum den Ushara Schrein, den Wachaußenposten, Oldras Ecke, Gnuremgrund und den Gequälten Berg finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Great Ocean");
talkEntry:addResponse("The Great Ocean is the water in the south, which is ruled by our ships. The Katanbi River flows into this ocean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Großer Ozean");
talkEntry:addResponse("Der Große Ozean ist das Gewässer im Süden, welches von unseren Schiffen beherrscht wird. Der Katanbi Fluss mündet in diesen Ozean.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Border Mountains");
talkEntry:addResponse("The Border Mountain form the eastern border of the Katanbi Desert and are the southeast part of the Lonely Mountains.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grenzberge");
talkEntry:addResponse("Die Grenzberge sind die östliche Grenze der Katanbi Wüste und der südöstliche Teil der Einsamen Berge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Western Katanbi Desert");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Mount Siba, Milkhouse, Cornerstone Candour, Rosaline Cube, Cube Camp, Faber's Guardhouse, Remote Dwelling, Pirate cove, Cape Farewell, Katanbi River, Liberty Quarry, Grugmutz's cave, Creek Settlement"));
talkEntry:addResponse("Which place there do you mean? I know about: Mount Siba, Milkhouse, Cornerstone of Candour, Rosaline Cube, Cube Camp, Faber's Guardhouse, Remote Dwelling, Pirate cove, Cape Farewell, Katanbi River, Liberty Quarry, Grugmutz's cave, Creek Settlement.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Westliche Katanbi Wüste");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Berg Siba, Milchhaus, Grundstein Aufrichtigkeit, Rosaline Würfel, Würfel Lager, Fabers Wachhaus, Entfernte Wohnstätte, Piratenbucht, Kap Abschied, Katanbi Fluss, Freiheitsbruch, Grugmutz Höhle, Bach Siedlung."));
talkEntry:addResponse("Welchen Platz meinst du? Berg Siba, Milchhaus, Grundstein der Aufrichtigkeit, Rosaline Würfel, Würfel Lager, Fabers Wachhaus, Entfernte Wohnstätte, Piratenbucht, Kap des Abschieds, Katanbi Fluss, Freiheitsbruch, Grugmutz Höhle, Bach Siedlung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mount Siba");
talkEntry:addResponse("A mountain in the south of Cadomyr. It is very close to the town. It is more or less next to the Cornerstone of Candour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Berg Siba");
talkEntry:addResponse("Ein Berg im Süden von Cadomyr. Er ist sehr nahe an der Stadt. Er liegt mehr oder weniger neben dem Grundstein der Aufrichtigkeit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milkhouse");
talkEntry:addResponse("That is the name of a shop for foreigners. It is in the east from here, before you cross the Katanbi Bridge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Milchhaus");
talkEntry:addResponse("Das ist der Name eines Laden der von fremden Händlern verwendet wird. Er kann im Osten von hier bevor man die Katanbi Brücke überquert gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cornerstone Candour");
talkEntry:addResponse("This coal mine is south of us. Just walk south, cross the street which leads to either east or west, and you will find it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grundstein Aufrichtigkeit");
talkEntry:addResponse("Diese Kohlemine ist südlich von uns. Geh einfach in den Süden, überquere die Straße welche dich entweder in den Westen oder Osten führt, und schon bist du dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosaline Cube");
talkEntry:addResponse("The Rosaline Cube will become our Queen's grave in the future. We are building it right now and Robertus is responsible for it. The cube is south of Mount Siba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosaline Würfel");
talkEntry:addResponse("Der Rosaline Würfel wird das Grab unserer Königin irgendwann mal werden. Wir bauen es gerade und Robertus ist veranwortlich dafür. Der Würfel ist südlich von Berg Siba.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cube Camp");
talkEntry:addResponse("The Cube Camp is a place to rest for those who are working on the Rosaline Cube and therefore it is close to that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Würfel Lager");
talkEntry:addResponse("Das Würfel Lager ist ein Rastplatz für jene die am Rosaline Würfel arbeiten und ist daher nahe diesen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Faber's Guardhouse");
talkEntry:addTrigger("Fabers Guardhouse");
talkEntry:addResponse("Faber's Guardhouse is on the west coast and was destroyed when pirates attacked us in the year 23, after the sorcerer and Faber were able to stop them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fabers Wachhaus");
talkEntry:addResponse("Fabers Wachhaus ist an der Westküste und wurde zerstört als Piraten uns attackierten im Jahre 23 nach dem Hexenmeister und Faber war es möglich sie aufzuhalten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Remote Dwelling");
talkEntry:addResponse("This building is the last before you enter the pirate cove in the northwest. It contains some riddles to solve.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Entfernte Wohnstätte");
talkEntry:addResponse("Dieses Gebäude ist das letzte bevor du die Piraten Bucht im Nordwesten betreten wirst und beinhaltet einige Rätseln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pirate cove");
talkEntry:addResponse("The Pirate cove in the northwest is a place of potential threat. We have had several conflicts with them so far.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Piratenbucht");
talkEntry:addResponse("Die Piratenbucht im Nordwesten ist ein Platz mit potentialer Gefahr. Wir hatten immer wieder Konflikte mit den soweit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cape Farewell");
talkEntry:addResponse("Cape Farewell can be found on the west coast, close to Faber's Guardhouse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kap Abschied");
talkEntry:addResponse("Das Kap des Abschiedes kann an der Westküste gefunden werden nahe Faber's Guardhouse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katanbi River");
talkEntry:addResponse("The Katanbi River, in the east from here, originates from the Lonely Mountains and separates the Western Katanbi Desert from the Katanbi Desert; it finds a way to the Great Ocean at the Katanbi Delta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katanbi Fluss");
talkEntry:addResponse("Der Katanbi Fluss im Osten von hier hat seinen Ursprung in den Einsamen Bergen, trennt die Westliche Katanbi Wüste von der Katanbi Wüste und findet seinen Weg in den Großen Ozean am Katanbi Delta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Liberty Quarry");
talkEntry:addResponse("The Liberty Quarry is in the northeast on the west shore of the Katanbi River. You can find iron, gold and copper there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Freiheitsbruch");
talkEntry:addResponse("Der Freiheitsbruch ist im Nordosten am westlichen Ufer des Katanbi Flusses. Du kannst dort Eisen, Gold oder Kupfer finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grugmutz's cave");
talkEntry:addTrigger("Grugmutzs cave");
talkEntry:addResponse("Grugmutz's cave is the north of the Liberty Quarry. Grugmutz and his ogre clan have tried to raid us several times. Be careful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grugmutz Höhle");
talkEntry:addResponse("Grugmutzs Höhle ist nördlich des Freiheitsbruch. Grugmutz und sein Oger Klan haben immer wieder versucht uns zu plündern. Sei vorsicht!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Creek Settlement");
talkEntry:addResponse("The Creek Settlement was once one of our richest places. It was at the northern end of the Katanbi River. It was destroyed by either dwarves from Fortress Hammerfall, buccaneers or Grugmutz's ogres. We don't know yet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bach Siedlung");
talkEntry:addResponse("Die Bach Siedlung war einst einer unserer reichsten Orte. Es war am nördlichen Ende des Katanbi Flusses. Es wurde zerstört entweder von den Zwergen der Festung Hammerfall, von Seeräubern oder von Grugmutzs Ogers zerstört. Wir wissen es nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katanbi Desert");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Prison, Druid's Tear, Royal places, Desert Hole, Pyramid Discord, Pearl Sirani, Frontus Farm, Queen's Corner, Irundar, Zumbrass Tomb, Mount Zotmore, Buccaneer's Lurk, Envy Creek, Weary Inn, eastern parts"));
talkEntry:addResponse("Which place there do you mean? I can tell you about: Prison, Druid's Tear, Royal places, Desert Hole, Pyramid of Discord, Pearl of Sirani, Frontus Farm, Queen's Corner, Irundar, Zumbrass Tomb, Mount Zotmore, Buccaneers Lurk, Envy Creek, Weary Inn or its eastern parts of Katanbi desert?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katanbi Wüste");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gefängnis, Druiden Träne, Königliche Orte, Wüstenloch, Pyramide Zwietracht, Perle Sirani, Frontus Hof, Königins Eck, Irundar, Zumbrass Grab, Berg Zotmore, Seeräuber Lauer, Neidbach, Matter Gasthof, östlichen Teile"));
talkEntry:addResponse("Welchen Platz? Gefängnis, Druiden Träne, Königliche Orte, Wüstenloch, Pyramide der Zwietracht, Perle der Sirani, Frontus Hof, Königins Eck, Irundar, Zumbrass Grab, Berg Zotmore, Seeräuber Lauer, Neidbach, Matter Gasthof oder die östlichen Teile der Katanbi Wüste?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Prison");
talkEntry:addResponse("The Prison can be found south of the Royal Academy of Gladiators. You do not want to end up there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gefängnis");
talkEntry:addResponse("Das Gefängnis kann südlich der Königlichen Akademie der Gladiatioren gefunden werden. Du möchtest dort nicht enden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Druid's Tear");
talkEntry:addTrigger("Druids Tear");
talkEntry:addResponse("The Druid's Tear can be found southeast of the Royal Academy of Gladiators. Ask a druid for further information.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Druiden Träne");
talkEntry:addResponse("Die Druiden Träne kann südöstlich der Königlichen Akademie der Gladiatioren gefunden werden. Frage einen Druiden für weitere Information.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Royal places");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Royal Academy, Academy Gladiators, Blood Circle Arena, Royal Slave Market"));
talkEntry:addResponse("There is the Royal Academy of Gladiators, the Blood Circle Arena and the Royal Slave Market.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königliche Orte");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Königliche Akademie, Akademie Gladiatoren, Blurtkreisarena, Königlicher Sklaven Markt"));
talkEntry:addResponse("Da wären die Königliche Akademie der Gladiatoren, die Blurtkreisarena und der Königliche Sklaven Markt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Royal Academy");
talkEntry:addTrigger("Academy Gladiators");
talkEntry:addResponse("Our Royal Academy of Gladiators is to the south on the road heading east. It is a place where participants in the Blood Circle Arena can train.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königliche Akademie");
talkEntry:addTrigger("Akademie Gladiatoren");
talkEntry:addResponse("Unsere Königliche Akademie der Gladiatoren ist südlich an der Straße in den Osten. Sie dient als Trainingsstätte für jene die sich in der Blurtkreisarena beweisen wollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blood Circle Arena");
talkEntry:addResponse("The Blood Circle Arena was built by Sir Reginald in the year 6. It is a place for warriors and it is to the north on the road heading east");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Blutkreisarena");
talkEntry:addResponse("Die Blutkreisarena wurde von Sir Reginald im Jahre 6 erbaut. Sie dient als Platz für Krieger und kann nördlich an der Straße in den Osten gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Royal Slave Market");
talkEntry:addResponse("The Royal Slave Market can be found northeast of the Blood Circle Arena. For some coins you will find some productive slaves there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königlicher Sklaven Markt");
talkEntry:addResponse("Der Königliche Sklaven Markt kann nordöstlich der Blutkreisarena gefundne werden. Für wenige Münzen findest du dort produktive Sklaven.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Desert Hole");
talkEntry:addResponse("The Desert Hole southeast of the Blood Circle Arena is a former mine but is used by creatures like worms now.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wüstenloch");
talkEntry:addResponse("Das Wüstenloch südöstlich der Blutkreisarena war einst eine Mine und wird nun von Kreaturen wie Würmern behaust.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pyramid Discord");
talkEntry:addResponse("The Pyramid of Discord, north of the Blood Circle Arena, was probably a temple of a former civilisation, but we are not sure about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pyramide Zwietracht");
talkEntry:addResponse("Die Pyramide der Zwietracht nördlich der Blutkreisarena war wahrscheinlich ein Templer einer alten Zivilisation. Wir sind uns darüber aber nicht sicher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Pearl Sirani");
talkEntry:addResponse("This place north of the Pyramid of Discord was used for royal weddings, but also by other members of the aristocracy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Perle Sirani");
talkEntry:addResponse("Dieser Platz nördlich der Pyramide der Zwietracht wurde für Königliche Hochzeiten, aber auch von den Aristokraten verwendet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frontus Farm");
talkEntry:addResponse("A Farmer called Frontus had a farm north of the Royal Slave Market until it was destroyed by worms.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frontus Hof");
talkEntry:addResponse("Ein Bauer mit den Namen Frontus hatte nördlich vom Königlichen Sklaven Markt einen Hof bis dieser zerstört wurde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen's Corner");
talkEntry:addTrigger("Queens Corner");
talkEntry:addResponse("There are some rumours about this place that I do not want discuss with you, but you can find this place close to the Weary Inn in the north.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königins Eck");
talkEntry:addResponse("Es gibt dazu einige Gerüchte, die ich nicht mit dir teilen möchte. Aber du kannst diesen Platz beim Matter Gasthof im Norden finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zumbrass Tomb");
talkEntry:addResponse("Poor Zumbrass! She died there but I have no idea who killed her. However, you can find her tomb north of Mount Zotmore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zumbrass Grab");
talkEntry:addResponse("Arme Zumbrass! Sie wurde dort getötet aber ich habe keine Ahnung von wem. Wie dem auch sei, du findest ihr Grab nördlich von Berg Zotmore.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mount Zotmore");
talkEntry:addResponse("Mount Zotmore is probably the most dangerous place in the desert. Don't even think of going there! If you still want to know where it is, it is in the very north.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Berg Zotmore");
talkEntry:addResponse("Berg Zotmore ist wahrscheinlich der gefährlichste Platz in der Wüste. Denk gar nicht daran dort hinzugehen. Wenn du aber denoch willst, du findest ihn ganz im Norden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Envy Creek");
talkEntry:addResponse("You will find the Envy Creek if you follow the eastern shore of the Katanbi River.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Neidbach");
talkEntry:addResponse("Du wirst den Neidbach finden in dem du dem östlichen Ufer des Katanbi Flusses folgst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buccaneer");
talkEntry:addTrigger("Lurk");
talkEntry:addResponse("The Buccaneer's Lurk is a dangerous place between the Katanbi River and Envy Creek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Seeräuber");
talkEntry:addTrigger("Lauer");
talkEntry:addResponse("Die Seeräuber Lauer ist ein gefährlicher Platz zwischen Katanbi Fluss und Neidbach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Weary Inn");
talkEntry:addResponse("The Weary Inn was once a place for travellers until it got destroyed. You can find it east of the Envy Creek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Matter Gasthof");
talkEntry:addResponse("Der Matter Gasthof war einst ein Platz für Reisende bis er zerstört wurde. Du findest ihn östlich des Neidbaches.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irundar");
talkEntry:addResponse("Irundar? Somewhere in the desert, but where?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irundar");
talkEntry:addResponse("Irundar? Irgendwo in der Wüste, aber wo?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("eastern part");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Chapel Five, Lumpskrump's Band, Moshran's Brood, Oasis Star, Raptor Hole, Sarakas' Home, Khesra, Akaltut's Chamber, Cursed Place, Wizard Bane."));
talkEntry:addResponse("The eastern part of the Katanbi Desert contains: Chapel of the Five, Lumpskrump's Band, Moshran's Brood, Oasis of Stars, Raptor Hole, Sarakas' Home, Khesra, Akaltut's Chamber, Cursed Place, Wizard Bane.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("östlichen teile");
talkEntry:addTrigger("östliche teile");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Kapelle Fünf, Lumpskrump Band, Moshran Brut, Oasis Stern, Raptoren Loch, Sarakas Heim, Khesra, Akaltut Kammer, Verfluchte Platz, Hexer Fluch."));
talkEntry:addResponse("Der östliche Teil der Katanbi Wüste beinhaltet: Kapelle der Fünf, Lumpskrumps Bande, Moshrans Brut, Oasis der Sterne, Raptoren Loch, Sarakas Heim, Khesra, Akaltuts Kammer, Verfluchte Platz, Hexer Fluch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Chapel Five");
talkEntry:addResponse("The Chapel of the Five is to the southern end of the Border Mountains and at the eastern border of the Katanbi Desert. Just follow the street to the southeast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kapelle Fünf");
talkEntry:addResponse("Die Kapelle der Fünf ist am südlichen Ende der Grenzberge und an der östlichen Grenze der Katanbi Wüste. Folge einfach der Straße in den Südosten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Chapel");
talkEntry:addResponse("The Chapel of the Five is on the southern end of the Border Mountains and at the eastern border of Katanbi Desert. Just follow the street to the southeast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kapelle");
talkEntry:addResponse("Die Kapelle der Fünf ist am südlichen Ende der Grenzberge und an der östlichen Grenze der Katanbi Wüste. Folge einfach der Straße in den Südosten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lumpskrump's Band");
talkEntry:addResponse("This bandit camp is on the road to the east, after the Desert Hole.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Lumpskrumps Band");
talkEntry:addTrigger("Lumpskrump");
talkEntry:addResponse("This bandit camp on the road to the east after the Desert Hole.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lumpskrumps Band");
talkEntry:addTrigger("Lumpskrump");
talkEntry:addResponse("Dieser Platz mit Banditen ist an der Straße in den Osten kurz nach dem Wüstenloch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran's Brood");
talkEntry:addResponse("Moshran's Brood, an orc clan, can be found east of Lumpskrump's Band.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshrans Brut");
talkEntry:addResponse("Die Moshran Brut, ein Orkklan, kann östlich von Lumpskrump Bande gefunden werden");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oasis Star");
talkEntry:addResponse("The Oasis of Stars is a place east of the Blood Circle Arena. You can dig for sand there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oasis Stern");
talkEntry:addResponse("Die Oasis der Sterne ist ein Platz östlich der Blutzirkelarena. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raptor Hole");
talkEntry:addResponse("The Raptor Hole is a cave in the south of the Border Mountains, north of Akaltut's Chamber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raptoren Loch");
talkEntry:addResponse("Das Raptoren Loch ist eine Höhle im Süden der Grenzberge nördlich von Akaltuts Kammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sarakas' Home");
talkEntry:addResponse("The home of this old murderer can be found in the Border Mountains, between the entrance to the Shadowland and the Raptor Hole.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sarakas Heim");
talkEntry:addResponse("Das Heim dieses alten Mörder kann in den Grenzbergen zwischen den Eingängen zum Schattenland und des Raptoren Loches gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Khesra");
talkEntry:addResponse("Khesra's Dungeon can be found close to the cursed place. You will not find anything other than hate there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Khesra");
talkEntry:addResponse("Keshras Verlies kann in der Nähe des Verfluchten Platz gefunden werden. Du wirst dort nichts anderes finden als Hass.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cursed Place");
talkEntry:addResponse("The Cursed Place is east of Frontus Farm. Be careful that you don't get poisoned.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Verfluchte Platz");
talkEntry:addResponse("Der Verfluchte Platz ist östlich von Frontus Hof. Sei vorsichtig, dass du dort nicht vergiftet wirst.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Akaltut's Chamber");
talkEntry:addTrigger("Akaltuts Chamber");
talkEntry:addResponse("Akaltut's Chamber can be found at the very south end of the Border Mountains. I hope you can run fast if you dare to show up there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Akaltut Kammer");
talkEntry:addResponse("Akaltuts Kammer kann ganz am südlichen Ende der Grenzberge gefunden werden. Ich hoffe du kannst schnell laufen falls du tatsächlich dort hingehen möchtest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wizard Bane");
talkEntry:addResponse("This place can be found in the very northeast of the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hexer Fluch");
talkEntry:addResponse("Dieser Platz kann ganz im Nordosten der Wüste gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katanbi Delta");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Merchants Folly, Cadomyr Harbour, Harp Pain, Lost Harbour, Tear Sirani, Kata Island, Mount Letma"));
talkEntry:addResponse("Which place there do you mean? I can tell you about: Merchants' Folly, Cadomyr Harbour, Harp of Pain, Lost Harbour, Tear of Sirani, Kata Island, Mount Letma");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Katanbi Delta");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Händlers Unsinn, Cadomyr, Hafen, Schmerzvolle Harfe, Verlorener Hafen, Träne Sirani, Kata Insel, Berg Letma"));
talkEntry:addResponse("Welchen Platz dort meinst du? Händlers Unsinn, Cadomyr, Hafen, Schmerzvolle Harfe, Verlorener Hafen, Träne der Sirani, Kata Insel, Berg Letma?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Merchants Folly");
talkEntry:addTrigger("Merchants' Folly");
talkEntry:addResponse("It can be found close to Cadomyr Harbour.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Händlers Unsinn");
talkEntry:addResponse("Es kann nahe des Cadomyr Hafen gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr Harbour");
talkEntry:addTrigger("Cadomyr Harbor");
talkEntry:addResponse("Our harbour is to the very south at the Great Ocean, after you have passed through the Western Katanbi Desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr Hafen");
talkEntry:addResponse("Unser Hafen ist ganz im Süden am Großen Ozean nachdem du die Westliche Katanbi Wüste durchquerrt hast.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Harp Pain");
talkEntry:addResponse("The Harp of Pain can be found on one of the islands in the Katanbi Delta. You'd better not play it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schmerzvolle Harfe");
talkEntry:addResponse("Die Schmerzvolle Harfe kann auf einer der Inseln im Katanbi Delta gefunden werden. Du spielst sie besser nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lost Harbour");
talkEntry:addResponse("The Lost Harbour was destroyed in an attack by Runewick's forces in the year 10 after the sorcerer. Some ruins are left at the southern point of the Katanbi Delta.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Verlorener Hafen");
talkEntry:addTrigger("Verlorene Hafen");
talkEntry:addResponse("Der Verlorene Hafen wurde durch einen Angriff von Runewick Streitkräften im Jahre 10 nach dem Hexenmeister zerstört. Einige Ruinen können am südlichsten Punkt im Katanbi Delta gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tear Sirani");
talkEntry:addResponse("This place is used for the weddings of common or lower ranked people. It is in the northern part of the Katanbi Delta and accessible from the eastern shore of the Katanbi River.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Träne Sirani");
talkEntry:addResponse("Dieser Platz wird für Hochzeiten für gewöhnliche und unangesehnere Leute verwendet. Er ist am nördlichen Teil im Katanbi Delta zu finden und über das Ostufer des Katanbi Fluss erreichbar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kata Island");
talkEntry:addResponse("This island is in the southern part of the Katanbi Delta and is used by pirates.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kata Insel");
talkEntry:addResponse("Diese Insel ist im südlichen Teil vom Katanbi Delta und wird von Piraten verwendet.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mount Letma");
talkEntry:addResponse("This place in the east of the Katanbi Delta can be accessed over the eastern shore of the Katanbi River, but be careful, it is crowded with golems. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Berg Letma");
talkEntry:addResponse("Dieser Platz im Osten vom Katanbi Delta kann über das östliche Ufer des Katanbi Fluss erreicht werden. Aber sei vorsichtig, er ist überfüllt mit Golems!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest 'Find Queen Rosaline Edwards' started] Find Queen Rosaline Edwards and take her your gift."));
talkEntry:addConsequence(npc.base.consequence.item.item(144, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(642, "=", 1));
talkEntry:addResponse("Have you already met our Queen? If not, you could introduce yourself and take a gift for her. She will appreciate this gift here, since she loves beautiful things. *hands over a flower*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, "<", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest 'Finde Königin Rosaline Edwards' gestartet] Finde Königin Rosaline Edwards und bringe ihr dein Geschenk."));
talkEntry:addConsequence(npc.base.consequence.item.item(144, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(642, "=", 1));
talkEntry:addResponse("Hast du bereits die Königin kennengelernt? Falls nicht, dann solltest du dich bei ihr mit einem Geschenk vorstellen. Sie wird dieses Geschenk hier bestimmt mögen, da sie ein Auge für das Schöne hat. *überreicht eine Blume*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, "<", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest 'Find Queen Rosaline Edwards' started] Find Queen Rosaline Edwards and take her your gift."));
talkEntry:addConsequence(npc.base.consequence.item.item(144, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(642, "=", 1));
talkEntry:addResponse("Have you already met our Queen? If not, you could introduce yourself and take a gift for her. She will appreciate this gift here, since she loves beautiful things. *hands over a flower*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(642, "<", 1));
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest 'Finde Königin Rosaline Edwards' gestartet] Finde Königin Rosaline Edwards und bringe ihr dein Geschenk."));
talkEntry:addConsequence(npc.base.consequence.item.item(144, 1, 777, nil));
talkEntry:addConsequence(npc.base.consequence.quest.quest(642, "=", 1));
talkEntry:addResponse("Hast du bereits die Königin kennengelernt? Falls nicht, dann solltest du dich bei ihr mit einem Geschenk vorstellen. Sie wird dieses Geschenk hier bestimmt mögen, da sie ein Auge für das Schöne hat. *überreicht eine Blume*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Nothing for you to do yet, but sssoon I will have plenty of tasksss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Ich habe nichts für dich zu tun momentan aber bald habe ich einige Aufgaben für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Nothing for you to do yet, but sssoon I will have plenty of tasksss for you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Ich habe nichts für dich zu tun momentan aber bald habe ich einige Aufgaben für dich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("The Archmage ownsss two ssstonesss of power, thessse are an emerald and a ruby. They protect Runewick against being beaten by our forcesss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der Erzmagier besssitzt zwei Sssteine der Macht. Einen Smaragd und einen Rubin. Die bessschützen Runewick vor der Übernahme durch unsssere Streitkräfte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("The Archmage ownsss two ssstonesss of power, thessse are an emerald and a ruby. They protect them against being beaten by our forcesss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der Erzmagier besssitzt zwei Sssteine der Macht. Einen Smaragd und einen Rubin. Die bessschützen Runewick vor der Übernahme durch unsssere Streitkräfte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? It isss in the eassst. Crosss the Katanbi Desert, get behind the Border Mountainsss to the other ssside of the Snakehead Bay. Look for sssignposts, but be careful. It's a dangerousss way, you would be better usssing the teleporter outssside the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick? Dasss issst im Osssten. Durchquäre die Katanbi Wüste, gehe hinter dasss Grenzberge zu der anderen Ssseite der Ssschlangenkopf Bucht. Ssschau nach Wegssschildern. Issst aber ein gefährlicher Weg. Verwende bessser den Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The Don ownsss two ssstonesss of power, thessse are a sssapphire and an obsssidian. They protect Galmair against being beaten by our forcesss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Don besssitzt zwei Sssteine der Macht. Einen Saphir und einen Obsidian. Die bessschützen Galmair vor der Übernahme durch unsere Ssstreitkräfte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair? It isss in the north. Crosss the Katanbi Desert, get behind Border Mountainsss, and then walk to the north. Look for sssignposts, but be careful. It's a dangerousss way, you would be better usssing the teleporter outssside the town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Galmair? Dasss issst im Norden. Durchquäre die Katanbi Wüste, gehe hinter dasss Grenzberge und dann in den Norden. Ssschau nach Wegssschildern. Issst aber ein gefährlicher Weg. Verwende bessser den Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("The Queen ownsss two ssstonesss of power, thessse are a topazzz and an amethyssst. They protect usss againssst Runewick and Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Der Königin besitzt zwei Sssteine der Macht. Einen Topas und einen Amethyst. Die beschützen unsss vor Runewick und Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("The Queen ownsss two ssstonesss of power, thessse are a topazzz and an amethyssst. They protect usss againssst Runewick and Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Der Königin besitzt zwei Steine der Macht. Einen Topas und einen Amethyst. Die beschützen uns vor Runewick und Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("That isss here and if you want to know more about it asssk Frizza at the teleporter outside for further information.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Das issst hier und wenn du mehr darüber wisssen möchtest, dann frag Frizza beim Teleporter draußen nach weiterer Information.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Primarly, we pray to three godsss in Cadomyr. They are Sirani, Zhambra and Malachin. I pray to Zelphia, though, mother of my race");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bevorzugt betten wir drei Götter in Cadomyr an. Die wären Sirani, Zhambra und Malachin. Aber ich bette zu Zelphia, der Mutter meiner Rassse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("You can find a temple dedicated to him in the sssouth. Go to the mine 'Cornerstone of Candour', and you will find the temple above it. Jussst follow the sssignpostsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Du kannst den Tempel im Süden. Gehe einfach zur Mine 'Grundstein der Aufrichtigkeit', und du wirst den Tempel darüber finden. Folge einfach den Wegschildern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 9999));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkEntry:addResponse("#me draws two swords and hisses: 'I warned you, but you did not lisssten. Face the consssequencesss now!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.state.state("=", 1));
talkEntry:addTrigger("Moshran");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 9999));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkEntry:addResponse("#me zieht zwei Schwerter und zischt: 'Wer nicht hören will muss fühlen!'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("One more word about him and you will have to visssit the crosss! *hisses with his tongue*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addConsequence(npc.base.consequence.state.state("=", 1));
talkEntry:addResponse("Ein weiteres Wort über ihn und du wirst das Kreuz aufsuchen müssen! *zischt mit seiner Zunge*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("You can find a temple dedicated to her in the sssoutheassst. Go eassst firssst, and then sssouth after you crosss the Katanbi River. Jussst follow the sssignpostsss, but be careful!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Du kannst den Tempel von ihr im Sssüdosten finden. Gehe einfach in den Osssten, und dann in den Sssüden nachdem du den Katanbi-Fluss überquert hast. Folge einfach den Wegschildern, aber sei vorsichtig!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("If you would like to know more about thisss god asssk sssomone elssse, for example, Frizza outssside at the teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Wenn du mehr über diessse Gottheit zu wissen möchtessst, dann fragt jemand anderen. Zum Beissspiel Frizza drausssen beim Teleporter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("You can find a temple dedicated to him in our town. Jussst go through into the town, passs the marketplace and then you will find it on the right after the workssshop.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Du kannst den Tempel von in unserer Ssstadt finden. Gehe einfach durch die Ssstadtmauer, überquere den Marktplatz und dann findest du ihn auch schon an der rechten Ssseite hinter der Werkstatt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Nice to meet you. How can I help you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Ssschön dich zu kennenzulernen. Wie kann ich dir helfen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ruzusss");
talkEntry:addResponse("Yes, that isss my name. What placesss do you want information about?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ruzusss");
talkEntry:addResponse("Ja, dasss ist mein Name. Über welche Orte wollt ihr Information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("A bit more concrete, pleassse!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Etwas konkreter wenn ich bitten darf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("A bit more concrete, pleassse!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Etwas konkreter wenn ich bitten darf!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, what placesss ssshall I give you information about? Do you mind just asssking for help asss a firssst ssstep?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, über welche Orte wünssscht ihr Information? Vielleicht begnügt ihr euch erstmal nach Hilfe zu fragen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Sssee you again if you need more information.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Wir sssehen unsss wenn mehr Information benötigt wird.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("place");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Illarion, northeast, northwest, southwest, southeast"));
talkEntry:addResponse("Placesss? Which placesss to you mean? These could be in the northeast, northwest, southwest or southeast of Illarion?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Orte");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Illarion, Nordosten, Nordwesten, Südwesten, Südosten"));
talkEntry:addResponse("Orte? Welche Orte meinst du? Diese könnten sein im Nordosten, Nordwesten, Südwesten oder Südosten von Illarion?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Wer etwas über die Orte hier in der Umgebung wissen will, soll mich nur nach diesen Orten fragen.", "If sssomeone wants to know sssomething about the placesss here, jussst ask me about thessse placesss.");
talkingNPC:addCycleText("#me wedelt mit seinem Schwanz.", "#me wags his tail.");
talkingNPC:addCycleText("#me blickt herum mit seinen weit geöffneten Augen.", "#me looks around with wide opened eyes.");
talkingNPC:addCycleText("#me untersucht seinen Dolch.", "#me examines his dagger.");
talkingNPC:addCycleText("#me streichelt seinen Schwanz.", "#me pets his tail.");
talkingNPC:addCycleText("#me isst einen Fisch.", "#me eats a fish.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Ruzusss der Jäger.", "This NPC is Ruzusss the hunter.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 2287);
mainNPC:setEquipment(3, 364);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 366);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, texttype, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char, counter, param) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END