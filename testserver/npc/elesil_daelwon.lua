--------------------------------------------------------------------------------
-- NPC Name: Elesil Daelwon                                          Runewick --
-- NPC Job:  Informant                                                        --
--                                                                            --
-- NPC Race: elf                        NPC Position:  856, 810, 0            --
-- NPC Sex:  female                     NPC Direction: west                   --
--                                                                            --
-- Author:   envi                                                             --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (3, 856, 810, 0, 6, 'Elesil Daelwon', 'npc.elesil_daelwon', 1, 7, 0, 25, 25, 112, 230, 230, 250);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.attribute")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.elesil_daelwon", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Elesil Daelwon the informant. Keywords: Question, information, Runewick, building, mission, faction."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Elesil Daelwon die Auskunftgeberin. Schlüsselwörter: Auskunft, Information, Runewick, Gebäude, Auftrag, Fraktion."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(604, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You can talk with Elesil now. Ask for 'help' if you do not know what to ask! You can also go back to Hummi to collect your reward and come back later."));
talkEntry:addResponse("How can I help you? Do you like to have any information? Or do you like to have a task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(604, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(604, "=", 1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Da kannst nun mit Elesil sprechen. Frage nach 'Hilfe' wenn du nicht weißt nach was du fragen sollst.! Du kannst auch zurück zu Hummi gehen um deine Belohnung abzuholen und später nochmals vorbei kommen."));
talkEntry:addResponse("Wie kann ich euch helfen? Wünscht ihr eine Information? Oder wünscht ihr eine Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(604, "=", 2));
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
talkEntry:addResponse("Hail Elara. *Closes her eyes*");
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
talkEntry:addResponse("Heil Elara. *Schließt ihre Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hail Elara. *Closes her eyes*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Heil Elara. *Schließt ihre Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Au revoir. *Closes her eyes*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Au revoir. *Schließt ihre Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Au revoir. *Closes her eyes*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Au revoir. *Schließt ihre Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Fine, fine. *Closes her eyes*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Fein, fein. *Schließt ihre Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Elesil Daelwon. *Closes her eyes*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Elesil Daelwon. *Schließt ihre Augen*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("If necessary I'm an informant. In this case I will inform you about Runewick, its buildings, locations, events, people, history or gods. If you require even more, at least one task is alos pending.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Wenn notwendig diene ich als Auskunftsgeberin. In diesem Fall würde ich euch über Runewick informieren, seine Gebäude, Orte, Ereignisse, Leute, Geschichte oder Götter. Und wenn erwünscht, wären auch mindestens eine Aufgabe zu lösen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("If necessary I'm an informant. In this case I will inform you about Runewick, its buildings, locations, events, people, history or gods. If you require even more, at least one task is alos pending.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Wenn notwendig diene ich als Auskunftsgeberin. In diesem Fall würde ich euch über Runewick informieren, seine Gebäude, Orte, Ereignisse, Leute, Geschichte oder Götter. Und wenn erwünscht, wären auch mindestens eine Aufgabe zu lösen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] building, locations, event, people, history, god"));
talkEntry:addResponse("I have information about buildings, locations, events, people, history and gods of Runewick for you if you want to know them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gebäude, Orte, Ereignisse, Leute, Geschichte, Götter"));
talkEntry:addResponse("Ich habe Informationen über Gebäude, Orte, Ereignisse, Leute, Geschichte und Götter von Runewick für euch wenn ihr wünscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("question");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] building, locations, event, people, history, god"));
talkEntry:addResponse("I have information about buildings, locations, events, people, history and gods of Runewick for you if you want to know them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Auskunft");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gebäude, Orte, Ereignisse, Leute, Geschichte und Götter"));
talkEntry:addResponse("Ich habe Informationen über Gebäude, Orte, Ereignisse, Leute, Geschichte und Götter von Runewick für euch wenn ihr wünscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("building");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Market, temple, teleport, census office, donkey stable, library, Garden of Eldan, Slums, Tomb, towers, Tower of Air, Tower of Fire, Tower of Water, Tower of Earth"));
talkEntry:addResponse("Which building do you mean? Market, temple, teleport, census office, donkey stable, library, Garden of Eldan, Slums, Tomb, or our towers: Tower of Air, Tower of Fire, Tower of Water or Tower of Earth?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gebäude");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Markt, Tempel, Teleport, Zensusbüro, Eselstall, Bibliothek, Garten des Eldan, Slums, Gruft, Türme, Turm der Luft, Turm des Feuers, Turm des Wassers, Turm der Erde"));
talkEntry:addResponse("Welches Gebäude meint ihr? Markt, Tempel, Teleport, Zensusbüro, Eselstall, Bibliothek, Garten des Eldan, Slums, Gruft, oder unsere Türme, sprich Turm der Luft, Turm des Feuers, Turm des Wassers, Turm der Erde?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("location");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Hinterland, Numila Irunnleh"));
talkEntry:addResponse("Locations? Which locations of the hinterland to you mean? I recommend also to talk with a geographer about them. The one I can recommend can be found in the Library of Earth and is called Numila Irunnleh.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Hinterland, Numila Irunnleh"));
talkEntry:addResponse("Orte? Welche Orte des Hinterland meint ihr? Ich empfehle auch mit einen Geograph darüber zu sprechen. Ich kann euch eine in der Bibliothek der Erde empfehlen. Sie wird Numila Irunnleh genannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(620, "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Numila");
talkEntry:addTrigger("Irunnleh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Try to find Numila Irunnleh and get your reward."));
talkEntry:addResponse("She is geographer and can be found in the Library of Earth. She will tell you information about locations outside of Runewick like Yewdale, Bear cave, Snakehead Bay, Illarion, Shadowland and other places you like to know.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(620, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(620, "<", 1));
talkEntry:addTrigger("Numila");
talkEntry:addTrigger("Irunnleh");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Finde Numila Irunnleh und erhalte deine Belohnung."));
talkEntry:addResponse("Sie ist eine Geographin und kann in der Bibliothek der Erde gefunden werden. Sie wird euch über Orte wie Eibental, Bärenhöhle, Schlangekopfbucht, Illarion, Schattenland und andere Orte die du gerne wissen möchtest.");
talkEntry:addConsequence(npc.base.consequence.quest.quest(620, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Numila");
talkEntry:addTrigger("Irunnleh");
talkEntry:addResponse("She is geographer and can be found in the Library of Earth. She will tell you information about locations outside of Runewick like Yewdale, Bear cave, Snakehead Bay, Tir Draganfod, Shadowland and other places you like to know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Numila");
talkEntry:addTrigger("Irunnleh");
talkEntry:addResponse("Sie ist eine Geographin und kann in der Bibliothek der Erde gefunden werden. Sie wird euch über Orte wie Eibental, Bärenhöhle, Schlangekopfbucht, Tir Draganfod, Schattenland und andere Orte die du gerne wissen möchtest.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("people");
talkEntry:addResponse("People? Whom else do you desire to talk with than our Archmage? I do not think anyone else has more wisedom, therefore do not waste your time witho other and more important: Do not bother me with questions about them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Leute");
talkEntry:addResponse("Leute? Mit wem ausser dem Erzmagier möchtet ihr ansonsten sprechen? Ich kenne niemanden der größere Weisheit als er besitzt. Daher verschwendet nicht eure Zeit und ärgert mich nicht mit Fragen über andere Leute.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("history");
talkEntry:addResponse("I do not think that you have time to listen to all my knowledge about our history. Therefore, I recommend our history book in our libraries.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geschichte");
talkEntry:addResponse("Ich denke nicht, dass ihr die Zeit habt all meinem Wissen über unsere Geschichte euer Gehör zu schenken. Daher empfehle ich unser Geschichtsbuch in unseren Bibliotheken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("events");
talkEntry:addResponse("I do not think that you have time to listen to all my knowledge about several events at this place. Therefore, I recommend our history book in our libraries.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ereignis");
talkEntry:addTrigger("Geschehnis");
talkEntry:addResponse("Ich denke nicht, dass ihr die Zeit habt all meinem Wissen über sämtliche stattgefunde Ereignisse euer Gehör zu schenken. Daher empfehle ich unser Geschichtsbuch in unseren Bibliotheken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("If you can read, I suggest to read our law-book in our libraries. If you cannot read, I suggest to move either to Galmair or Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Wenn ihr des Lesen mächtig seid, dann empfehle ich unser Gesetzesbuch in unseren Bibliotheken. Wenn ihr es nicht seid, dann empfehle ich nach Galmair oder Cadomyr umzuziehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ruler");
talkEntry:addResponse("Our highest advisor is Archmage Elvaine Morgan. He has founded this place of wisedom and might be found either in his champer - the Archmage champer - or in the Hall of Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Herrscher");
talkEntry:addResponse("Unser höchster Ratgeber ist Erzmagier Elvaine Morgan. Er hat diesen Ort der Weisheit erschaffen und entweder in seiner Kammer - der Erzmagier Kammer - oder in den Hallen der Elara gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("market");
talkEntry:addResponse("Through the portal abround the corner and you are there *points southeast*.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Markt");
talkEntry:addResponse("Durch das Portal hier um das Eck und ihr seid dort. *zeigt in dne Südosten*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("temple");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Garden of Eldan, Shrine of Elara, Shrine of Findari, Shrine of Bragon"));
talkEntry:addResponse("Let me think... You can find four here: Garden of Eldan, Shrine of Elara, Shrine of Findari and Shrine of Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Garten des Eldan, Schrein der Elara, Schrein der Findari, Schrein des Bragon"));
talkEntry:addResponse("Lasst mich nachdenken... Ihr findet hier vier: Garten des Eldan, Schrein der Elara, Schrein der Findari und Schrein des Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("teleport");
talkEntry:addResponse("This teleporter here can lead you to Cadomyr, Galmair or to the Hemp Necktie Inn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("teleport");
talkEntry:addResponse("Dieser Teleporter hier vermag euch nach Cadomyr, Galmair oder zum Gasthof zur Hanfschlinge zu bringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Census office");
talkEntry:addResponse("The census office can be found in the Tower of Fire next the Library of Fire. You will find Reret Odohir there. He will help you further.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zensusbüro");
talkEntry:addResponse("Das Zensusbüro kann im Turm des Feuers neben der Bibliothek des Feuers gefunden werden werden. Man findet dort Reret Odohir. Er wird einem weiterhelfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Donkey stable");
talkEntry:addTrigger("stable");
talkEntry:addResponse("Over there. *points south*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eselstall");
talkEntry:addTrigger("Stall");
talkEntry:addResponse("Dort drüben *zeigt in den Süden*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Donkey");
talkEntry:addResponse("You can rent them at the donkey stable.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Esel");
talkEntry:addResponse("Du kannst diese im Eselstall ausleihen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Garden Eldan");
talkEntry:addTrigger("Eldan Garden");
talkEntry:addResponse("Garden of Eldan is a place which inspires us with wisdom. You can find it if you walk through the portal around the corner into the town and take the other, red one then. There you find also a shrine of Eldan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Garten Eldan");
talkEntry:addTrigger("Eldan Garten");
talkEntry:addResponse("Der Garten des Eldan ist ein Ort der uns mit Weisheit inspiriert. Ihr findet ihn wenn ihr in die Stadt durch das Portal um die Ecke reist und dann durch das nächste, rote, Portal tretet. Dort findet ihr auch einen Schrein für Eldan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Slum");
talkEntry:addResponse("The slums are under the market. A Ladder will lead you there. I assume I do not have to explain who lives there. Those who lack on knowledge or have spent to much time on praising Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Slum");
talkEntry:addResponse("Die Slums können unter dem Markt gefunden werden. Eine Leiter wird euch dort hinführen. Ich nehme an, ich muss euch nicht erklären wer dort lebt. Jene, denen es an Weisheit mangelt und jene, die zuviel Zeit mit Huldigungen für Adron verbringen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tomb");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Room of Light, Room of Darkness, Room of  Twilight"));
talkEntry:addResponse("To reach the tomb you have to pass the market first and then the slums. The tomb is devided in three rooms: Room of Light, Room of Darkness, Room of  Twilight.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gruft");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Raum des Lichts, Raum der Finsterniss, Raum des Zwielichts"));
talkEntry:addResponse("Um die Gruft zu erreichen müsst erst zum Markt und dann zu den Slums. Die Gruft ist unterteilt in drei Räume: Raum des Lichts, Raum der Finsterniss, und Raum des Zwielichts.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Room Light");
talkEntry:addResponse("The Room of Light is reservated for those who have reached the top of the god given hierarchy. Eldan as well as Elara had a reason to set it this way. Our Archmage knows that and therefore rules according to this divine law.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raum Lichts");
talkEntry:addResponse("Der Raum des Lichts ist für jene an der Spitze der gottgewollten Hierarchie bestimmt. Eldan wie auch Elara hatten ihre Gründe dafür. Unser Erzmagier ist sich dem durchaus bewusst und regiert deswegen auch entsprechend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Room Darkness");
talkEntry:addResponse("The Room of Darkness is the place for those corpse who lived at the bottom of the god given hierarchy before. Gregor, a human whom you sould find on your way to the tomb, will tell you more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raum Finsternis");
talkEntry:addResponse("Der Raum der Finsternis ist jener Ort an denen die Leichen jener aufgehoben werden, welche zuvor an der Sohle der Gesellschaft gelebt haben. Gregor, ein Mensch dem ihr auf euren Weg zur Gruft begegnen werdet, wird euch mehr darüber erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Room Twilight");
talkEntry:addResponse("The Room of Twilight is the place who were neither at the top nor on the bottom of the god given hierarchy. Gregor, a human whom you sould find on your way to the tomb, will tell you more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Raum Zwielicht");
talkEntry:addResponse("Der Raum des Zwielichts ist der Ort für jene welche weder an der Spitze noch am unteren Ende der Hierarchie gelebt haben. Gregor, ein Mensch dem ihr auf euren Weg zur Gruft begegnen werdet, wird euch mehr darüber erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tower Air");
talkEntry:addTrigger("Air Tower");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Treekitchen, Library of Air, House of Gods, Shrine of Elara, Shrine of Findari"));
talkEntry:addResponse("This is the first southern tower and is mainly made for priests. You can find there following rooms: Treekitchen, Library of Air, House of Gods, Shrine of Findari, and Shrine of Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turm Luft");
talkEntry:addTrigger("Luft turm");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Baumküche, Bibliothek der Luft, Haus der Götter, Schrein der Elara, Schrein der Findari"));
talkEntry:addResponse("Dieser Turm ist der erste südliche Turm und hauptsächlich für Priester. Ihr findet folgende Räume dort: Baumküche, Bibliothek der Luft, Haus der Götter, Schrein der Findari, und Schrein der Elara.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Treekitchen");
talkEntry:addResponse("The Treekitchen is based in the basement of the Tower of Air. You can find their cooks or the possiblity to cook or carpentering.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Baumküche");
talkEntry:addResponse("Die Baumküche ist Keller des Turm der Luft zu finden. Man findet dort Köche beziehungsweise die Möglichkeit zu kochen oder zu schreinern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library Air");
talkEntry:addTrigger("Air Library");
talkEntry:addResponse("The Library of Air can be found in the second floor of the Tower of Air. Do I have to explain what you can do their? I hope not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek Luft");
talkEntry:addTrigger("Luft Biblothek");
talkEntry:addResponse("Die Bibliothek der Luft kann im ersten Stock des Turm der Luft gefunden werden. Muss ich erklären, was man dort tun kann? Ich hoffe nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("House God");
talkEntry:addTrigger("God House");
talkEntry:addResponse("The House of Gods is based in the fourth floor of the Tower of Air. There you can find items which represent the different gods and information about them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Haus Götter");
talkEntry:addTrigger("Götter Haus");
talkEntry:addResponse("Das Haus der Götter ist lokalisiert im dritten Stock des Turm der Luft. Dort findet ihr Gegenstände welche die unterschiedlichen Götter repräsentieren sowie Informationen über sie.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Shrine Elara");
talkEntry:addTrigger("Elara Shrine");
talkEntry:addResponse("The Shrine of Elara can be found in the third floor of the Tower of Air. There you can praise Elara and hope for more wisdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schrein Elara");
talkEntry:addTrigger("Elara Schrein");
talkEntry:addResponse("Der Schrein der Elara kann im zweiten Stock des Turm der Luft gefunden werden. Dort könnt ihr Elara anbeten und auf mehr Weisheit hoffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Shrine Findari");
talkEntry:addTrigger("Findari Shrine");
talkEntry:addResponse("The Shrine of Findari can be found in the sixth floor or rather at the top of the Tower of Air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schrein Findari");
talkEntry:addTrigger("Findari Shrine");
talkEntry:addResponse("Der Schrein der Findari kann im fünften Stock beziehungsweise auf der Spitze des Turm der Luft gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tower Fire");
talkEntry:addTrigger("Fire Tower");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Workshop, Library of Fire, Archmage Champer, Hall of Elara, Bragon Stronghold, Shrine of Bragon"));
talkEntry:addResponse("This is the first northern tower and it is tower is mainly made for mages. You can find there following rooms: Workshop, Library of Fire, Archmage Champer, Hall of Elara, Bragon Stronghold and Shrine of Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turm Feuer");
talkEntry:addTrigger("Feuer Turm");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Werkstatt, Bibliothek des Feuers, Erzmagier Kammer, Hall der Elara, Bragon Bollwerk, Schrein des Bragon"));
talkEntry:addResponse("Dieser Turm ist der erste nördliche Turm und hauptsächlich für Magier. Ihr findet folgende Räume dort: Werkstatt, Bibliothek des Feuers, Erzmagier Kammer, Halle der Elara, Bragon Bollwerk und Schrein des Bragon.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Workshop");
talkEntry:addResponse("The workshop in the basement of the Tower of Fire offers possibilities for tailors, cooks, glasblowers, and so on. Furthermore, due to Adron's Swill is closed currently, our taverne is also located there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Werkstatt");
talkEntry:addResponse("Die Werkstatt im Erdgeschoß des Turm des Feuers ermöglicht Schneidern, Köchen, Glasbläsern und so weiter eine Möglichkeit ihrer Tätigkeit nachzugehen. Zusätzlich ist auch unsere Taverne dort zu finden, da Adrons Gesöff momentan geschlossen ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library Fire");
talkEntry:addTrigger("Fire Library");
talkEntry:addResponse("The Library of Fire can be found in the second floor of the Tower of Fire. Do I have to explain what you can do their? I hope not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek Feuer");
talkEntry:addTrigger("Feuer Bibliothek");
talkEntry:addResponse("Die Bibliothek des Feuer kann im ersten Stock des Turm des Feuers gefunden werden. Muss ich erklären, was man dort tun kann? Ich hoffe nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Archmage Champer");
talkEntry:addTrigger("Champer Archmage");
talkEntry:addResponse("The Archmage Champer can be found in the third floor of the Tower of Fire. It is the private room of our Archmage Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier Kammer");
talkEntry:addTrigger("Kammer Erzmagier");
talkEntry:addResponse("Die Erzmagier Kammer kann im zweiten Stock des Turm des Feuers gefunden werden. Es ist der private Raum unserers Erzmagier Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hall Elara");
talkEntry:addTrigger("Elara Hall");
talkEntry:addResponse("The Hall of Elara can be found in the third floor of the Tower of Fire. It serves an audience champer or conference room to listen and meet our Archmage Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Halle Elara");
talkEntry:addTrigger("Elara Halle");
talkEntry:addResponse("Die Halle der Elara kann im zweiten Stock des Turm des Feuers gefunden werden. Sie dient als ein Audienzsaal oder Konferenzraum zum hören und treffen unseres Erzmagier Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon Stronghold");
talkEntry:addTrigger("Stronghold Bragon");
talkEntry:addResponse("Bragon's Stronghold is in the fourth floor of the Tower of Fire and offers a posibility to improve one's combat skills.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon Bollwerk");
talkEntry:addTrigger("Bollwerk Bragon");
talkEntry:addResponse("Bragon's Bollwerk ist im dritten Stock des Turm des Feuers und ermöglicht jeder Person seine Kampffähigkeiten zu verbessern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Shrine Bragon");
talkEntry:addTrigger("Bragon Shrine");
talkEntry:addResponse("The Shrine of Bragon can be found in the sixth floor or rather at the top of the Tower of Fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schrein Bragon");
talkEntry:addTrigger("Bragon Schrein");
talkEntry:addResponse("Der Schrein des Bragon kann im fünften Stock beziehungsweise auf der Spitze des Turm des Feuers gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tower Water");
talkEntry:addTrigger("Water Tower");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Library of Water, Adron's Swill, Hubbub Champer"));
talkEntry:addResponse("This is the second southern tower and is mainly made for bards. You can find there following rooms: Library of Water, Adron's Swill and Hubbub Champer. Unfortunately, this tower is closed due to an incident as you can read in our history book.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turm Wasser");
talkEntry:addTrigger("Wasser Turm");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Bibliothek des Wassers, Adrons Gesöff, Lärmkammer"));
talkEntry:addResponse("Dieser Turm ist der zweite südliche Turm und hauptsächlich für Barden. Ihr findet folgende Räume dort: Bibliothek des Wassers, Adrons Gesöff und Lärmkammer. Unglücklicherweis ist dieser Turm gesperrt, wie ihr unserem Geschichtsbuch entnehmen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library Water");
talkEntry:addTrigger("Water Library");
talkEntry:addResponse("The Library of Water can be found in the second floor of the Tower of Water. But it is closed as the whole Tower of Water as you can read in our hisorty book.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek Wasser");
talkEntry:addTrigger("Wasser Bibliothek");
talkEntry:addResponse("Die Bibliothek des Wassers kann im ersten Stock des Turm des Wassers gefunden werden. Sie ist aber gesperrt wie der ganze Turm des Wassers, wie ihr unserem Geschichtsbuch entnehmen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron Swill");
talkEntry:addTrigger("Swill Adron");
talkEntry:addResponse("Adron's Swill can be found in the first floor of the Tower of Water and serves as our taverne. But it is closed as the whole Tower of Water as you can read in our hisorty book.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron Gesöff");
talkEntry:addTrigger("Gesöff Adron");
talkEntry:addResponse("Adron's Swill kann im Erdgeschoß des Turm des Wasser gefunden werden und dient als unsere Taverne. Sie ist aber gesperrt wie der ganze Turm des Wasser, wie ihr unserem Geschichtsbuch entnehmen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hubbub Champer");
talkEntry:addTrigger("Champer Hubbub");
talkEntry:addResponse("The Hubbub Champer is in the third floor of the Tower of Water and serves as practice room for our bards. But it is closed as the whole Tower of Water as you can read in our hisorty book.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lärm Kammer");
talkEntry:addTrigger("Kammer Lärm");
talkEntry:addResponse("Die Lärmkammer ist im zweiten Stock des Turm des Wassers und dient als Übungsraum für unsere Barden. Sie ist aber gesperrt wie der ganze Turm des Wassers, wie ihr unserem Geschichtsbuch entnehmen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tower Earth");
talkEntry:addTrigger("Earth Tower");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Library of Earth, Kettle Champer, Root Chamber, Test Champer"));
talkEntry:addResponse("This is the second northern tower and is mainly made for druids. You can find there following rooms: Library of Earth, Kettle Champer, Root Chamber, and Test Champer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turm Erd");
talkEntry:addTrigger("Erd Turm");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Bibliothek der Erde, Kesselkammer, Wurzelkammer, Versuchkammer"));
talkEntry:addResponse("Dieser Turm ist der zweite nördliche Turm und hauptsächlich für Druiden. Ihr findet folgende Räume dort: Bibliothek der Erde, Kesselkammer, Wurzelkammer, und Versuchkammer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library Earth");
talkEntry:addTrigger("Earth Library");
talkEntry:addResponse("The Library of Earth can be found in the second floor of the Tower of Earth. Do I have to explain what you can do their? I hope not.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek Erd");
talkEntry:addTrigger("Erd Bibliothek");
talkEntry:addResponse("Die Bibliothek der Erde kann im ersten Stock des Turm der Erde gefunden werden. Muss ich erklären, was man dort tun kann? Ich hoffe nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kettle Champer");
talkEntry:addTrigger("Champer Kettle");
talkEntry:addResponse("The Kettle Champer in the fourth floor of the Tower of Earth serves as conference and study room for druids and alchemists.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Kessel Kammer");
talkEntry:addTrigger("Kammer Kessel");
talkEntry:addResponse("Die Kesselkammer im dritten Stock im Turm der Erde dient als Konferenz- und Lehrraum für die Druiden und Alchemisten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Root Champer");
talkEntry:addTrigger("Champer Root");
talkEntry:addResponse("In the Root Champer in the third floor of the Tower of Earth, druids and alchemists can share their knowledge with their students.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wurzel Kammer");
talkEntry:addTrigger("Kammer Wurzel");
talkEntry:addResponse("In der Wurzelkammer im zweiten Stock des Turm der Erde können Druiden und Alchemisten ihr Wissen mit ihren Studenten teilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Test Champer");
talkEntry:addTrigger("Champer Test");
talkEntry:addResponse("In the Test Champer in the fist floor of the Tower of Earth, alchemists can work and try their potion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Test Champer");
talkEntry:addTrigger("Kammer Test");
talkEntry:addResponse("In der Testkammer im Grundgeschoß des Turm der Erde können Alchemisten an ihren Tränken arbeiten und testen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Versuch Kammer");
talkEntry:addTrigger("Kammer Versuch");
talkEntry:addResponse("In der Testkammer im Grundgeschoß des Turm der Erde können Alchemisten an ihren Tränken arbeiten und testen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tower");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Tower of Air, Tower of Fire, Tower of Earth, Tower of Water"));
talkEntry:addResponse("There are four towers: Tower of Air, Tower of Fire, Tower of Earth and Tower of Water. You can all leave and enter them at the top as well as at the bottom, after you entered the town through the portal over there. *points southeast*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Turm");
talkEntry:addTrigger("Türme");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Turm der Luft, Turm des Feuers, Turm der Erde, Turm des Wassers"));
talkEntry:addResponse("Es gibt vier Türme: Turm der Luft, Turm des Feuers, Turm der Erde und Turm des Wassers. Ihr könnt jeden Turm am Dach oder Erdgeschoss betretten oder verlassen, nachdem ihr über das Portal dort drüben die Stadt betreten habt. *zeigt südöstlich*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Library of Air, Library of Fire, Library of Earth, Library of Water"));
talkEntry:addResponse("Actually, we have four of them in each of our four towers: Library of Air, Library of Fire, Library of Earth and Library of Water. Each of them is based in the second floor of their tower. About which one do you like to know more?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Bibliothek der Luft, Bibliothek des Feuers, Bibliothek der Erde, Bibliothek des Wassers"));
talkEntry:addResponse("Eigentlich haben wir hier vier Stück. Jeweils eine in unseren vier Türmen: Bibliothek der Luft, Bibliothek des Feuers, Bibliothek der Erde und Bibliothek des Wassers. Jede von ihnen ist im ersten Stock ihres Turm zu finden. Zu welcher wollt ihr mehr wissen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hinterland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Fire of Triumph, Holy Oak, Woodcutter Camp, Twin Eyes Island, Oldra Column, Mermaid, Lurnord bridge"));
talkEntry:addResponse("The Hinterland of Runewick contains following locations: Fire of Triumph, Holy Oak, Woodcutter's Camp, Twin Eyes Island, Oldra's Column, Lurnord bridge and Mermaid");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hinterland");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Feuer des Triumphes, Heilige Eiche, Holzfäller Lager, Zwillingsaugeninsel, Oldras Säule, Meerjungfrau, Lurnord Brücke"));
talkEntry:addResponse("Das Hinterland von Runewick enthält folgende Orte: Feuer des Triumphes, Heilige Eiche, Holzfäller Lager, Zwillingsaugeninseln, Oldras Säule, Lurnord Brücke und Meerjungfrau");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fire Triumph");
talkEntry:addTrigger("Triumph Fire");
talkEntry:addResponse("It can be found north of here, after the Holy Oak. This place reminds on our involvement and victory in a compain between Cadomyr and Galmair. Unfortunately, some actions went wrong.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Feuer Triumph");
talkEntry:addTrigger("Triumph Feuer");
talkEntry:addResponse("Dieser Ort kann nördlich von hier, nach der Heiligen Eiche gefunden werden und erinnert an unsere Einflussnahme und unseren Sieg in einer Auseinandersetzung zwichen Cadomyr und Galmair. Leider ging einiges schief.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Holy Oak");
talkEntry:addResponse("This is a holy and very old tree in the north of here. You will find more information there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Heilige Eiche");
talkEntry:addResponse("Das ist ein heiliger und sehr alter Baum im Norden von hier. Ihr werdet weitere Informationen dort finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Woodcutter Camp");
talkEntry:addResponse("This place can be found in the south of here and is a champ for lumberjacks.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Holzfäller Lager");
talkEntry:addResponse("Dieser Ort kann im Süden von hier aus gefunden werden und ist ein Lager für Holzfäller.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Twin Eyes Islands");
talkEntry:addResponse("This place is the very south of here. Two islands, which... uhh... I forgot, but you will find there what you want to know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zwillingsaugeninseln");
talkEntry:addResponse("Dieser Ort ist ganz im Süden. Zwei Inseln, welche...uhh... ich hab es vergessen, aber ihr werdet herausfinden was ihr zu wissen wünscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra Column");
talkEntry:addResponse("This place can be found in the south of here. Some information about Oldra and what she likes are waiting for you. Look for the column and trees over there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra Säule");
talkEntry:addResponse("Dieser Ort kann im Süden von hier aus gefunden werden. Einige Informationen über Oldra und Dinge die sie mag warten dort auf euch. Haltet Ausschau nach der Säule und den Bäumen dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Mermaid");
talkEntry:addResponse("Just follow the westcost to the south and you will find this place with a statue of a beautiful woman. This place is also used by fishers who are waiting to get in touch with the mermaid.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Meerjungfrau");
talkEntry:addResponse("Folget der Westküste in den Süden und ihr werdet diesen Ort mit einer Statue einer schönen Frau finden. Dieser Ort ist auch von vielen Fischern verwendet, die auf die Meerjungfrau warten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lurnord bridge");
talkEntry:addResponse("This is the bridge between here and Yewdale. *points west* It was destroyed years ago after a war with Galmair and rebuild by a friend of mine who left afterwards. Lunord was his name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Lurnord Brücke");
talkEntry:addResponse("Das ist die Brücke zwischen hier und Eibental. *zeigt in den Westen* Sie war einige Jahre zuvor zerstört durch einen Krieg mit Galmair und wurde von einen Freund von mir wiederaufgebaut, welch nun gegangen ist. Sein Name war Lunord.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faction");
talkEntry:addResponse("There are three factions: Our faction Runewick, ruled by our great leader Elvaine Morgan. Then the two foolish factions of Galmair and Cadomyr, ruled by Don Valerio Guilianni and Queen Rosaline Edwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fratktion");
talkEntry:addResponse("Es gibt drei Fraktionen: Unsere Fraktion Runewick, geführt von unserem Herrscher Elvaine Morgan. Dann diese zwei närrischen Fraktionen Galmair und Cadomyr, geführt von Don Valerio Guilianni und Königin Rosaline Edwards.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Our leader can be found in the Hall of Elara in the Fire Tower if you want to talk with him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Unser Herrscher kann in der Halle der Elara im Turm des Feuers gefunden werden, wenn ihr ihn zu sprechen wünscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Our leader can be found in the Hall of Elara in the Fire Tower if you want to talk with him.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Unser Herrscher kann in der Halle der Elara im Turm des Feuers gefunden werden, wenn ihr ihn zu sprechen wünscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("That is here and if you want to know more about it ask me for further information.");
talkEntry:addResponse("Here at Runewick, we are interested in Alchemists, Candle makers, Carpenters, Lumberjacks, Cooks, Bakers, Farmers, Herb gatherers, or Tailors, Tanners and Dyers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Das ist hier und wenn du mehr darüber wissen möchtest, dann frag mich nach weiterer Information.");
talkEntry:addResponse("Hier in Runewick suchen wir immer nach Alchemisten, Kerzenmacher, Schreiner, Holzfäller, Koch, Bäcker, Bauer, Kräutersammler, Schneider, Gerber oder Färber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I do not want to talk about him but you will find him in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ich will nicht über ihn sprechen, aber er kann in Galmair gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("There are not many reasons to travel there. Exceptions are if you look for Blacksmiths, Brick makers, Masons, Miners, and Brewers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Es gibt nicht viele Gründe dorthin zu reisen. Es sei den ihr sucht nach einen Schmied, Ziegelmacher, Steinmetz, Schürfer oder Brauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("I do not want to talk about her but you will find her in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ich will nicht über ihn sprechen, aber er kann in Galmair gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("I do not want to talk about her but you will find her in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ich will nicht über ihn sprechen, aber er kann in Galmair gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("There are not many reasons to travel there. Exceptions are if you look for Fishermen, Glass blowers, Diggers, Finesmiths, and Gem grinders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Es gibt nicht viele Gründe dorthin zu reisen. Es sei den ihr sucht nach einen Fischer, Glasblässer, Gräber, Goldschmied oder Edelsteinschleifer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("You better try your luck at our marketplace here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ihr versucht besser euer Glück auf unserem Marktplatz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("If necessary I will inform you about Runewick, its buildings, places, events, people, history or gods. If you require even more, at least one task is alos pending.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Falls notwendig würde ich euch über Runewick informieren, seine Gebäude, Orte, Ereignisse, Leute, Geschichte oder Götter. Und wenn erwünscht, wären auch mindestens eine Aufgabe zu lösen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Primarly, we pray to three gods in Runewick. They are Adron, Oldra and Elara of course, my favorite god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bevorzugt betten wir drei Götter in Runewick an. Die wären Adron, Oldra und natürlich Elara, meine bevorzugte Gottheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Adron's followers are mostly tavern keepers or wine growers. Some bards too. They believe that when they die, there will be an orgy that lasts forever, and the really bad or evil ones will be condemned to be servants until they are enlightened.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Seine Anhänger sind meistens Gastwirte oder Weinbauern. Auch einigen Barden. Sie glauben, wenn sie sterben, wird es eine Orgie zu ihren Ehren geben, die niemals enden wird. Solche, die in Sünde gelebt haben, werden verurteilt, als Diener zu leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("One of the elder gods. He is also known as God of Fire. There is a shrine at the top of the Tower of Fire.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Einer der alten Götter. Er ist auch als Gott des Feuers bekannt. Es gibt einen Schrein auf der Spitze des Turm des Feuers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Goddess of Spirits and the Underworld. She likes Balance and justice. She does not care much about the living.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Die Göttin der Geister und der Unterwelt. Sie steht ein für ausgeglichene Gerechtigkeit. Sie gibt nicht viel auf das Leben an sich, der Tod ist Ihr Reich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Her followers believe in the power of wisdom. Some of these people are praying to be told great secrets, or even the sense of life - as legend tells, one holy man has been told it after long prayers and discussions with the Goddess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ihre Anhänger glauben an die Macht der Weisheit. Einige dieser Anhänger beten, um geheimes und altes Wissen zu erlangen oder um den Sinn des Leben zu erfahren. Eine Legende erzählt von einem Mann, der so lange betete, bis sich ihm dies offenbarte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("One of the elder gods. He is also known as God of Spirit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Einer der alten Götter. Er ist auch bekannt als Gott des Geists.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("One of the elder gods. She is also known as Goddess of Air. There is a shrine at the top of the Tower of Air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Eine der alten Götter. Sie ist auch als Göttin der Luft bekannt. Es gibt einen Schrein auf der Spitze des Turm der Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Man kann Anhänger in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Man kann Anhänger in Cadomyr finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me narrows her eyes and takes a blade which she swings immediately without a single word against her opposite.");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 6666));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("#me verengt ihre Augen, zieht ein Schwert und schlägt sogleich ohne ein einzelnes Wort damit herum.");
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "-", 6666));
talkEntry:addConsequence(npc.base.consequence.attribute.attribute("hitpoints", "+", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Man kann Anhänger in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Most of her priests are female, who serve the Goddess into high age. They think that when they die, they will be brought to a big garden gate. If they have been good, they can enjoy the wonders of the never ending garden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Die meisten Ihrer Priester sind weiblich und dienen der Gottheit bis ins hohe Alter. Sie glauben wenn sie sterben, werden sie zu einem prachtvollen Gartentor gebracht, und wenn sie gut waren dürfen sie an diesem wunderbaren Ort leben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Man kann Anhänger in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Eine der unwichtigen, jüngeren Götter. Man kann Anhänger in Cadomyr finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("One of the elder gods. She is also known as Goddess of Water.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Eine der alten Götter. Sie ist auch als Göttin des Wassers bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("One of the elder god. She is also known as Goddess of Earth");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Eine der alten Götter. Sie ist auch als Göttin der Erde bekannt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellows in Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Eine der unwichtigen, jüngeren Götter. Man kann Anhänger in Cadomyr finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hmm...ask someone else if you want know about it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Hmm...fragt jemand anderen bezüglich dieses Ort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Hmm...you want some information? But about what?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Hmm...und ihr wünscht nach Information? Aber welche?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elesil");
talkEntry:addTrigger("Daelwon");
talkEntry:addResponse("Yes, that is my name. About what do you want information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elesil");
talkEntry:addTrigger("Daelwon");
talkEntry:addResponse("Ja, das ist mein Name. Über was wollt ihr Information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("A bit more concrete, please!");
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
talkEntry:addResponse("A bit more concrete, please!");
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
talkingNPC:addCycleText("Willkommen in Runewick!", "Welcome in Runewick!");
talkingNPC:addCycleText("Ich bin die Auskunftsgeberin von Runewick. Fragt mich nach Informationen wenn ihr welche wissen wollt.", "I am the informant of Runewick. Ask me for informations if you want some.");
talkingNPC:addCycleText("Wer etwas über die Orten hier wissen will, soll mich nur nach diesen Orten fragen.", "If someone wants to know something about the locations here, just ask me for these locations.");
talkingNPC:addCycleText("Wer etwas über die Gebäude hier wissen will, soll mich nur nach diesen Gebäuden fragen.", "If someone wants to know something about the buildings here, just ask me for these buildings.");
talkingNPC:addCycleText("Wer etwas über die Geschichte von Runewick wissen will, soll mich nur nach der Geschichte fragen.", "If someone wants to know something about the history of Runewick, just ask me for the history.");
talkingNPC:addCycleText("Wer etwas über die Leute hier wissen will, soll mich nur nach diesen Leuten fragen.", "If someone wants to know something about the people here, just ask me for these people.");
talkingNPC:addCycleText("Wer etwas über die Götter hier wissen will, soll mich nur nach diesen Gottheiten fragen.", "If someone wants to know something about the gods here, just ask me for these gods.");
talkingNPC:addCycleText("Wer etwas über die Ereignisse hier wissen will, soll mich nur nach diesen Ereignissen fragen.", "If someone wants to know something about the events here, just ask me for these events.");
talkingNPC:addCycleText("#me gähnt.", "#me yawns.");
talkingNPC:addCycleText("#me blickt herum mit ihren geschlossenen Augen.", "#me looks around with closed eyes.");
talkingNPC:addCycleText("#me untersucht ihr Kleid.", "#me examines her dress.");
talkingNPC:addCycleText("#me kämmt ihr Haar.", "#me combs her hair.");
talkingNPC:addCycleText("#me isst einen Apfel.", "#me eats an apple.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(3);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Elesil Dael'won die Auskunftgeberin.", "This NPC is Elesil Daelwon the informant.");
mainNPC:setUseMessage("Ihr seid gut damit beraten mich nicht anzufassen.", "I recommend do not touch me.");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 835);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 822);
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