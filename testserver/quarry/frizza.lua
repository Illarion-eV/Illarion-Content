--------------------------------------------------------------------------------
-- NPC Name: Frizza                                                   Cadomyr --
-- NPC Job:  Informant                                                        --
--                                                                            --
-- NPC Race: lizardman                  NPC Position:  121, 643, 0            --
-- NPC Sex:  female                     NPC Direction: south                  --
--                                                                            --
-- Author:   envi                                                             --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (5, 121, 643, 0, 4, 'Frizza', 'npc.frizza', 1, 3, 0, 34, 139, 34, 154, 205, 50);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.condition.quest")
require("npc.base.consequence.inform")
require("npc.base.consequence.quest")
require("npc.base.talk")
module("npc.frizza", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Frizza the informant. Keywords: Question, information, Cadomyr, building, game, mission, faction."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Frizza die Auskunftgeberin. Schlüsselwörter: Auskunft, Information, Cadomyr, Gebäude, Spiel, Auftrag, Fraktion."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(605, "=", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("You can speak with Frizza now. Ask for 'help' if you do not know what to say! You can also go back to Hummi to collect your reward and come back later."));
talkEntry:addResponse("How can I help you? Are you looking for any information? Or would you like to be given a task?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(605, "=", 2));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(605, "=", 1));
talkEntry:addTrigger(".*");
talkEntry:addConsequence(npc.base.consequence.inform.inform("Da kannst nun mit Frizza sprechen. Frage nach 'Hilfe' wenn du nicht weißt nach was du fragen sollst.! Du kannst auch zurück zu Hummi gehen um deine Belohnung abzuholen und später nochmals vorbei kommen."));
talkEntry:addResponse("Wie kann ich helfen? Wird eine Information erwünssscht? Oder eine Aufgabe?");
talkEntry:addConsequence(npc.base.consequence.quest.quest(605, "=", 2));
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
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Sssee you again, when you need more information.");
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
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Sssee you again, when you need more information.");
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
talkEntry:addResponse("Frizza, the informant of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Frizza, die Informantin von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't sssell or buy anything. But we have a marketplace. You can try your luck there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe oder kaufe gar nichtsss. Aber wir haben einen Marktplatz. Versuch dein Glück doch dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I can tell you many things about Cadomyr. Just asssk me about buildingsss, locationsss, eventsss, people, history or gods of Cadomyr. Additionaly, I have a little tasssk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich kann dir viele Dinge über Cadomyr erzählen. Frag nur nach Gebäude, Orte, Ereignissse, Leute, Gessschichte oder Götter von Cadomyr. Zusssätzlich hätte ich noch eine kleine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] building, locations, event, people, history, god"));
talkEntry:addResponse("I have information about buildingsss, locationsss, eventsss, people, hissstory, lawsss and godsss of Cadomyr. Just asssk me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("inform");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gebäude, Orte, Ereignisse, Leute, Geschichte, Götter"));
talkEntry:addResponse("Ich habe Informationen über Gebäude, Orte, Ereignissse, Leute, Geschichte, Gesetze und Götter von Cadomyr geben. Frag einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("question");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] building, locations, event, people, history, god"));
talkEntry:addResponse("I have information about buildings, locationsss, eventsss, people, hissstory and godsss of Cadomyr. Just asssk me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frage");
talkEntry:addTrigger("Auskunft");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Gebäude, Orte, Ereignisse, Leute, Geschichte, Götter"));
talkEntry:addResponse("Ich habe Informationen über Gebäude, Orte, Ereignissse, Leute, Geschichte und Götter von Cadomyr geben. Frag einfach!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("building");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Palace, Tavern Unicorn Lion, Inn Lakeshore, Town wall, Villa, Quartermaster Store, Flat quarter, Sir Reginald Tomb, market, library, temple, census office, teleport, donkey stable"));
talkEntry:addResponse("We have following buildingsss: Palace, Tavern Unicorn Lion, Inn Lakeshore, Town wall, Villa, Quartermaster's Store, Flat quarter and Sir Reginald Tomb. We have alssso a market, library, temple, census office, teleport and donkey stable.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gebäude");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Palast, Taverne Einhörniger Löwe, Gasthaus Seeufer, Stadtmauer, Villa, Quartiermeister Laden, Wohnungsquartier, Sir Reginald Gruft, Markt, Bibliothek, Tempel, Zensusbüro, Teleporter, Eselstall"));
talkEntry:addResponse("Wir haben folgende Gebäude: Palast, Taverne Einhörniger Löwe, Gasthaus Seeufer, Stadtmauer, Villa, Quartiermeister Laden, Wohnungsquartier und Sir Reginald Gruft, sowie Markt, Bibliothek, Tempel, Zensusbüro, Teleporter und Eselstall.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("location");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Ruzusss"));
talkEntry:addResponse("If you like to know anything about locationsss outssside, like Katanbi Desert, Western Katanbi Desert, Katanbi Delta, Illarion or Shadowland just asssk Ruzusss behind the towngate.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ort");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwort] Ruzusss"));
talkEntry:addResponse("Wenn du etwas über die Orte außerhalb wie Katanbi Wüste, Westliche Katanbi Wüste, Katanbi Delta, Illarion oder Schattenland wisssen möchtessst, dann frage Ruzusss hinter dem Stadttor.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(640, "<", 1));
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ruzusss");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[New Quest] Try to find Ruzusss and get your reward."));
talkEntry:addResponse("You are looking for Ruzusss? Well, Ruzusss staysss behind the gate. *points at the towngate in the North.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(640, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.quest.quest(640, "<", 1));
talkEntry:addTrigger("Ruzusss");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Neues Quest] Finde Ruzusss und erhalte deine Belohnung."));
talkEntry:addResponse("Ruzusss wird gesucht? Nun, Ruzuss steht hinterm Tor. *zeigt auf das Stadttor im Norden.*");
talkEntry:addConsequence(npc.base.consequence.quest.quest(640, "=", 1));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ruzusss");
talkEntry:addResponse("You are looking for Ruzusss? Well, Ruzusss staysss behind the gate. *points at the towngate in the North.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ruzusss");
talkEntry:addResponse("Ruzusss wird gesucht? Nun, Ruzuss steht hinterm Tor. *zeigt auf das Stadttor im Norden.*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("people");
talkEntry:addResponse("Many people leaving here. Many people from different placesss. Most are jussst passsing me when the travel. It ssseemsss they are in thoughtsss of a god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Leute");
talkEntry:addResponse("Viele Leute wohnen hier. Viele Leute von verssschiedenen Orten. Viele gehen wortlosss an mir vorbei wenn herumreisen. Esss ssscheint die sssind in Gedanken an irgendwelche Götter. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("history");
talkEntry:addResponse("We have a glory hissstory here and you can find more information about it at ssseveral picturesss here in our town. There you can find illustrationsss of the actionsss of our rulersss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geschichte");
talkEntry:addResponse("Wir haben eine glorreiche Gessschichte hier und man kann Information darüber an verssschiedenen Bildern hier finden. Dort findet man Illustrationen der Handlungen unserer Herrscher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("events");
talkEntry:addResponse("Many eventsss have happened sssince the foundation of your town. You can more information about them at ssseveral picturesss here in our town. There you can find illustrationsss of the actionsss of our rulersss. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ereignis");
talkEntry:addTrigger("Geschehnis");
talkEntry:addResponse("Viele Ereignisse haben hier standgefunden ssseit der Gründung. Man kann Information darüber an verssschiedenen Bildern hier finden. Dort findet man Illustrationen der Handlungen unserer Herrscher.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("law");
talkEntry:addResponse("We do not have really lawsss. We have rather a codex which can be found at a rider-ssstatue in front of the palace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gesetz");
talkEntry:addResponse("Wir haben nicht wirklich Gesetze hier. Wir haben eher einen Kodex der an einer Reiterssstatue vor dem Palast gefunden werden kann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ruler");
talkEntry:addResponse("Our current ruler isss our wonderful queen Rosaline Edwards. You find her in our palace. The namesss of our former rulesss can be found at a rider-ssstatue in front of the palace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Herrscher");
talkEntry:addResponse("Unsere aktuelle Herrscherin ist unsssere wunderbare Königin Rosaline Edwards. Man findet sssie in unserem Palast. Die Namen unserer früheren Herrscher können auf einer Reiterssstatue vor dem Palast gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("market");
talkEntry:addResponse("The market isss behind thisss town wall. Jussst passs the towngate and the Quartermaster's store. You can buy a lot of thingsss there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Markt");
talkEntry:addResponse("Der Markt ist hinter dieser Ssstadtmauer hier. Einfach das Stadttor und den Quartiermeister Laden durchqueren. Du kannst dort viele Dinge kaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("temple");
talkEntry:addResponse("We have one temple here. The temple of Zambra. Other temples are outside of Cadomyr, but I have no idea where. However, the temple of Zambra is on the right ssside between palace and market.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tempel");
talkEntry:addResponse("Wir haben einen Tempel hier und dasss issst der Zambratempel. Andere Tempeln sssind außerhalb von Cadomyr, aber ich weiß nicht wo. Egal auch, den Zambratempel findessst du auf der rechten Ssseite zwischen Palassst und Markt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("teleport");
talkEntry:addResponse("A possiblity to teleport to Runewick, Galmair or the Hemp Necktie Inn isss here asss yoo ssshould sssee. *points the teleporter*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("teleport");
talkEntry:addResponse("Eine Möglichkeit sich nach Runewick, Galmair oder zum Gasthof zur Hanfschlinge zu teleportieren findet man hier wie du sssehen sssolltessst. *Zeigt auf den Teleporter*");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Census office");
talkEntry:addResponse("The Census office can be found in front of the palace on the left ssside. There you register yourssself and become one of usss ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zensusbüro");
talkEntry:addResponse("Dasss Zensusbüro kann vor dem Palassst auf der linken Ssseite gefunden werden. Dort kann man sssich registrieren lasssen und einer von unsss werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Donkey stable");
talkEntry:addTrigger("stable");
talkEntry:addResponse("Our donkey stable isss close to the Quartermaster's Store. Jussst go inssside town.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eselstall");
talkEntry:addTrigger("Stall");
talkEntry:addResponse("Unser Essselssstall ist den Quartiermeister Laden. Geh einfach in die Ssstad rein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Donkey");
talkEntry:addResponse("A donkey can be rent at the Donkey stable. In Galmair and Runewick are running ssseveral around and they are free for hunt. Sss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Esel");
talkEntry:addResponse("Ein Esssel kann im Eselstall geliehen werden. In Galmair und Runewick laufen viele herum und die sssind auch zur Jagd frei gegeben. Sss!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Palace");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] queen, Royal Champer, Treasureroom, library"));
talkEntry:addResponse("Our palace isss on the other ssside of the town. Just go inssside and run through. You can find there our wonderful queen, the Royal Champer, her Treasureroom and the library.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Palast");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Königin, Königliche Kammer, Schatzraum, Bibliothek"));
talkEntry:addResponse("Unssser Palassst issst auf der anderen Ssseite der Ssstadt. Geh einfach rein und lauf durch die Ssstadt. Dort findet man unsssere wunderbare Königin, die Königliche Kammer, ihren Schatzraum und die Bibliothek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Royal Champer");
talkEntry:addResponse("The Royal Champer in the palace isss the private room of our queen Rosaline.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königliche Kammer");
talkEntry:addResponse("Die Königliche Kammer im Palast issst der private Raum unsssserer Königin Rosaline.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Treasureroom");
talkEntry:addResponse("The Treasureroom in the palace isss the place where all our wealth isss sssaved. We have to protect againssst any threat, in particular from Runewick and Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schatzraum");
talkEntry:addResponse("Der Schatzraum in unserem Palast issst jener Ort in welchem wir unssser Reichtum lagern. Wir müsssen ihn ssschützen gegen jede Bedrohung. Insssbesssondere vor Runewick und Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Library");
talkEntry:addResponse("Our library with all our booksss can be found in the palace.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek");
talkEntry:addResponse("Unsssere Bibliothek mit all unssseren Büchern kann im Palast gefunden werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tavern Unicorn Lion");
talkEntry:addResponse("Our tavern Uniconr Lion isss right after the market on the left side. You cannot missss it.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Taverne Einhörniger Löwe");
talkEntry:addResponse("Unsssere Taverne Einhörniger Löwe issst genau hinter dem Markt. Du kannssst sssie nicht versssäumen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Inn Lakeshore");
talkEntry:addResponse("Our Inn Lakeshore isss in the northwest of our town, left from our tavern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gasthaus Seeufer");
talkEntry:addResponse("Unssser Gasthaus Seeufer issst im Nordwesten unssserer Ssstadt, linksss von unssserer Taverne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Townwall");
talkEntry:addResponse("In the townwall *points at the North behind her* can be found the guardroom and the civic hall.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadtmauer");
talkEntry:addResponse("In der Stadtmauer *zeigt in den Norden hinter ihr* kann man die Wachstube und den Stadtsaal finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Guardroom");
talkEntry:addResponse("Our Guardroom isss on the left side of the townwall. Ssso, enter the townwall and go left.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wachstube");
talkEntry:addResponse("Unsssere Wachstube issst an linken Ssseite unssserer Ssstadtmauer. Ssso, geh in die Ssstadtmauer und dann linksss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Civic Hall");
talkEntry:addResponse("Our Civic Hall is above the Quartermaster's Store. Enter the town and climb up the firssst ladder.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stadtsaal");
talkEntry:addResponse("Unssser Stadtsaal issst über Quartiermeister Laden. Rein in die Ssstadt und die erssste Leiter hoch.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Villa Edward");
talkEntry:addResponse("The Villa Edward isss the sssecond building left to the market. It isss behind Villa Rosaline. It isss an object for honourable memberss of our sssociety.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Villa Edward");
talkEntry:addResponse("Die Villa Edward issst dasss zweite Gebäude linksss vom Markt. Esss issst hinter der Villa Rosaline. Esss issst gedacht für die ehrenhaften in unssserer Gesssellssschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Villa Rosaline");
talkEntry:addResponse("The Villa Rosaline isss the firssst buidling left to the market. It isss infront of Villa Edward. It isss an object for honourable memberss of our sssociety.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Villa Rosaline");
talkEntry:addResponse("Die Villa Rosaline issst dasss erssste Gebäude linksss vom Markt. Esss issst vor der Villa Edward. Esss issst gedacht für die ehrenhaften in unssserer Gesssellssschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Villa Reginald");
talkEntry:addResponse("The Villa Reginald isss the building next to the census office. It isss an object for honourable memberss of our sssociety.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Villa Reginald");
talkEntry:addResponse("Die Villa Reginald issst dasss Gebäude neben dem Zensusbüro. Esss issst gedacht für die ehrenhaften in unssserer Gesssellssschaft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Villa");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Keywords] Villa Edward, Villa Rosaline, Villa Reginald"));
talkEntry:addResponse("Which villa you mean? We have three of them: Villa Edward, Villa Rosaline and Villa Reginald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Villa");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Schlüsselwörter] Villa Edward, Villa Rosaline, Villa Reginald"));
talkEntry:addResponse("Welche issst gemeint? Wir haben drei von ihnen: Villa Edward, Villa Rosaline und Villa Reginald.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Quartermaster's Store");
talkEntry:addResponse("The Quartermaster's Store isss right of the town entrance and you can asssk for sssome misssions there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Quartiermeister Laden");
talkEntry:addResponse("Der Quartiermeister Laden issst rechtsss vom Ssstadteingang und du kannssst dort nach Befehlen fragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Flat quarter");
talkEntry:addResponse("The Flat quarter isss the part eassst of our town. These are they placesss for thossse on the bottom of the hierarchy.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wohnungsquartier");
talkEntry:addResponse("Das Wohnungsquartier issst im Osssten unssserer Ssstadt. Sssie ssstellen das Heim der ssschlechter gessstelteren unter unsss dar.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sir Reginald Tomb");
talkEntry:addResponse("The Sir Reginald Tomb issss right in front of the entrance to the townwall to honour one of our former kingsss.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sir Reginald Gruft");
talkEntry:addResponse("Die Sir Regniald Gruft issst rechtsss vor dem Eingang zur Ssstadtmauer zu Ehren einesss unssserer früheren Könige.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faction");
talkEntry:addResponse("There are three factions: Our faction Cadomyr, ruled by our brave Queen Rosaline Edwards. Then the two cowardly factions of Galmair and Runewick, ruled by Don Valerio Guilianni and Archmage Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Fraktion");
talkEntry:addResponse("Es gibt drei Fraktionen: Unsere Fraktion Cadomyr, geführt von unserer tapferen Königin Rosaline Edwards. Dann diese zwei feigen Fraktionen Galmair und Runewick, geführt von Don Valerio Guilianni und Erzmagier Elvaine Morgan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Morgan? Zzzz. That isss an evil sorcerer in Runewick and rulesss there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Morgan? Zzzz. Dasss issst ein bössser Zauberer in Runewick der auch dort herrssscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Morgan? Zzzz. That isss an evil sorcerer in Runewick and rulesss there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Morgan? Zzzz. Dasss issst ein bössser Zauberer in Runewick der auch dort herrssscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("That isss a wired place, but if you look for Alchemists, Candle makers, Carpenters, Lumberjacks, Cooks, Bakers, Farmers, Herb gatherers, or Tailors, Tanners and Dyers you will find sssome there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Dasss issst ein verrückter Ort, aber wenn man Alchemisten, Kerzenmacher, Schreiner, Holzfäller, Koch, Bäcker, Bauer, Kräutersammler, Schneider, Gerber oder Färber suchst, kannst man dort welche finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don? Zzzz. That thief rulesss in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Don? Zzzz. Diessser Dieb herrssscht in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("That isss a sssneaky place, but if you look for Blacksmiths, Brick makers, Masons, Miners, and Brewers you will find sssome there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Dasss issst ein hinterhältiger Ort, aber wenn man einen Schmied, Ziegelmacher, Steinmetz, Schürfer oder Brauer sssuchst, findessst man den dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Our nice Queen Rosaline Edwards hasss been ruling for many years now. Ssshe is brave and smart and beautiful. Ssss. You find her in her palace on the other ssside of the town. Jussst go in.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Unsere nette Königin Rosaline Edwards herrssscht nun ssschon ssseit einigen Jahren. Sssie ist mutig, ssschlau und ssschön. Man findet sssie in ihrem Palassst auf der anderen Ssseite der Ssstadt. Einfach rein gehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Our nice Queen Rosaline Edwards has been ruling for many years now. Ssshe is brave and smart and beautiful. Ssss. You find her in her palace on the other ssside of the town. Jussst go in.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Unsere nette Königin Rosaline Edwards herrssscht nun ssschon ssseit einigen Jahren. Sssie ist mutig, ssschlau und ssschön. Man findet sssie in ihrem Palassst auf der anderen Ssseite der Ssstadt. Einfach rein gehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Here at Cadomyr, we are interesssted in Fishermen, Glass blowers, Diggers, Finesmiths, and Gem grinders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Hier in Cadomyr sssuchen wir immer nach Fischer, Glasblässer, Gräber, Goldschmied oder Edelsteinschleifer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I don't sssell or buy anything. But we have a marketplace. You can try your luck there.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe oder kaufe gar nichtsss. Aber wir haben einen Marktplatz. Versuch dein Glück doch dort.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I can tell you many things about Galmair. Just ask me about buildingsss, locationsss, eventsss, people, hissstory or godsss of Cadomyr. Additionaly, I have a little tasssk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich kann dir viele Dinge über Galmair erzählen. Frag nur nach Gebäude, Orte, Ereignissse, Leute, Geschichte oder Götter von Cadomyr. Zusssätzlich hätte ich noch eine kleine Aufgabe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Primarly, we pray to three godsss in Cadomyr. They are Malachin, Zhambra and Sirani. But I pray to Zelphia, mother of my race");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Bevorzugt betten wir drei Götter in Cadomyr an. Die wären Malachin, Zhambra und Sirani. Aber ich bette zu Zelphia, der Mutter meiner Rassse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("One of the unimportant, younger godsss. You can find fellowsss in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Du kann Anhänger in Runewick finden.");
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
talkEntry:addResponse("Goddess of Spirits and the Underworld. Cherga is the one who collects the dead ones, and brings them to the realms they belong to.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Die Göttin der Geister und der Unterwelt. Sie ist jene, welche die Toten begleitet und in ihre vorbestimmten Reiche führt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Eine der  unwichtigen, jüngeren Götter. Du kann Anhänger in Runewick finden.");
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
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellowsss in Galmair.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Du kann Anhänger in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Many follow the honourable Malachín. Soldiers and knights pray for protection in battles, hunters for a good hunt and protection while hunting, paladins for protection and a powerful fist against the evil.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Viele folgen dem ehrenwerten Malachin. Soldaten und Ritter beten zu ihm, um Schutz in schweren Kämpfen zu erhalten; Jäger, um den erfolgreichen Ausgang einer Jagd; Paladine allgemein für den Schutz im Kampf gegen das Böse.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Sssss, I do not like thisss God. Yoo better avoid thisss name. People should kill you for usssing thisss name!");
talkEntry:addResponse("#s Helpsss! We have potential fellow of the bloodgod here! Head up!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Sssss, I do not like thisss God. Yoo better avoid thisss name. People should kill you for usssing thisss name!");
talkEntry:addResponse("#s Hilfe! Wir haben einen potentiellen Anhänger desss Blutgott hier! Kopf ab!");
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
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Du kann Anhänger in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("One of the unimportant, younger gods. You can find fellows in Runewick.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Eine der unwichtigen, jüngeren Götter. Du kann Anhänger in Runewick finden.");
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
talkEntry:addResponse("Einer der unwichtigen, jüngeren Götter. Du kann Anhänger in Galmair finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Many young females pray to her for advice in love or simple beauty tips. Most Sirani priests are good healers. Her followers believe in peace and harmony, and most of them don't like weapons or violence.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Viele junge Frauen beten zu Ihr, der Liebe wegen oder um Schönheit zu erlangen. Die meisten Priester Siranis sind gute Heiler und glauben wie alle Ihre Anhänger an ein Leben in Friede und Harmonie. Sie verabscheuen Gewalt und Waffen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("One of the elder gods, but except of me and my race noone cares about this god here. So, better do not waste your time with this god.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Eine der alten Götter, aber ausgenohmen von mir und meiner Rasse niemand kümmert sich hier nicht um diese Gottheit. Daher verschwende besser deine Zeit nicht mit dieser Gottheit.");
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
talkEntry:addResponse("The followers of Zhambra are righteous and loyal ones who believe in honour and law. They often try to rescue others, and fight against the evil. Zhambra is worshipped by nobles and knights, paladins, and many soldiers.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Die Anhänger Zhambras sind geradlinig und ergebene Gefolgsleute, die an Ehre und Recht glauben. Sie versuchen häufig, Andere zu retten und stehen im Kampf gegen das Böse. Zhambra wird gehuldigt von Adligen, Rittern, Höflingen und von vielen Kriegern.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I have never heard that name.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich habe diesssen Namen nie gehört.");
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
talkEntry:addTrigger("Frizza");
talkEntry:addResponse("Yes, that isss my name. About what do you want information?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Frizza");
talkEntry:addResponse("Ja, dasss ist mein Name. Über wasss wollt ihr Information?");
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
talkEntry:addResponse("Huh, about what ssshall I give you information? Do you mind just to asssk for help asss a firssst ssstep?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("Huh, über wasss wünssscht ihr Information? Vielleicht begnügt ihr euch erstmal nach Hilfe zu fragen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("Willkommen in Cadomyr!", "Welcome in Cadomyr!");
talkingNPC:addCycleText("Ich bin die Auskunftsgeberin von Cadomyr. Fragt mich nach Informationen wenn ihr welche wissen wollt.", "I am the informant of Cadomyr. Ask me for informations if you want some.");
talkingNPC:addCycleText("Wer etwas über die Orte hier wissen will, soll mich nur nach diesen Orten fragen.", "If someone wants to know something about the locationsss here, just ask me for these locationsss.");
talkingNPC:addCycleText("Wer etwas über die Gebäude hier wissen will, soll mich nur nach diesen Gebäuden fragen.", "If someone wants to know something about the buildings here, just ask me for these buildings.");
talkingNPC:addCycleText("Wer etwas über die Geschichte hier wissen will, soll mich nur nach die Geschichte fragen.", "If someone wants to know something about the history of Cadomyr, just ask me for the history.");
talkingNPC:addCycleText("Wer etwas über die Leute hier wissen will, soll mich nur nach diesen Leuten fragen.", "If someone wants to know something about the people here, just ask me for these people.");
talkingNPC:addCycleText("Wer etwas über die Götter hier wissen will, soll mich nur nach diesen Gottheiten fragen.", "If someone wants to know something about the gods here, just ask me for these gods.");
talkingNPC:addCycleText("Wer etwas über die Ereignisse hier wissen will, soll mich nur nach diesen Ereignissen fragen.", "If someone wants to know something about the events here, just ask me for these events.");
talkingNPC:addCycleText("#me wedelt mit ihrem Schwanz.", "#me wages her tail.");
talkingNPC:addCycleText("#me blickt herum mit ihren weit geöffneten Augen.", "#me looks around with wide opened eyes.");
talkingNPC:addCycleText("#me untersucht ihr Kleid.", "#me examines her dress.");
talkingNPC:addCycleText("#me streichelt ihren Schwanz.", "#me pets her tail.");
talkingNPC:addCycleText("#me isst einen Fisch.", "#me eats a fish.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(4);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Frizza die Auskunftgeberin.", "This NPC is Frizza the informant.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 827);
mainNPC:setEquipment(10, 369);
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(npcChar, texttype, message, speaker) mainNPC:receiveText(npcChar, speaker, message); end;
function nextCycle(npcChar) mainNPC:nextCycle(npcChar); end;
function lookAtNpc(npcChar, char, mode) mainNPC:lookAt(npcChar, char, mode); end;
function useNPC(npcChar, char) mainNPC:use(npcChar, char); end;
initNpc();
initNpc = nil;
-- END