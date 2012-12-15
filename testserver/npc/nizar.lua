--------------------------------------------------------------------------------
-- NPC Name: Nizar                                                   Runewick --
-- NPC Job:  magical blacksmith                                               --
--                                                                            --
-- NPC Race: human                      NPC Position:  910, 800, 1            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Miriam                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 910, 800, 1, 4, 'Nizar', 'npc.nizar', 0, 3, 0, 3, 5, 20, 150, 79, 0);
---]]

require("npc.base.basic")
require("npc.base.condition.chance")
require("npc.base.condition.language")
require("npc.base.consequence.gemcraft")
require("npc.base.consequence.inform")
require("npc.base.talk")
require("npc.base.trade")
module("npc.nizar", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Nizar the magical blacksmith. Keywords: gems, smithing, magical smithing, profession, Serinjah, Greetings."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Nizar der magische Schmied. Schlüsselwörter: Edelsteine, Schmieden, magisches Schmieden, Beruf, Serinjah, Grüße."));
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
talkEntry:addResponse("Greetings. Shall I smith something for you out of gems?.");
talkEntry:addResponse("Be greeted. Do you want to combine magical gems? This is the right place for that!");
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
talkEntry:addResponse("Grüße. Soll ich Euch was magisches aus Edelsteinen zusammenschmieden?");
talkEntry:addResponse("Seid Gegrüßt. Wollt Ihr Eure magischen Edelsteine kombinieren lassen? Dann seid Ihr hier richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings. Shall I smith something for you out of gems?.");
talkEntry:addResponse("Be greeted. Do you want to combine magical gems? This is the right place for that!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Grüße. Soll ich Euch was magisches aus Edelsteinen zusammenschmieden?");
talkEntry:addResponse("Seid Gegrüßt. Wollt Ihr Eure magischen Edelsteine kombinieren lassen? Dann seid Ihr hier richtig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Fare well and do not forget to comre back to Nizar!");
talkEntry:addResponse("#me bows: 'May Findari be with you, my friend'");
talkEntry:addResponse("May Finadari be with you, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Lebt wohl und vergesst nicht bnoch einmal zurück zu Nizar zu kommen.");
talkEntry:addResponse("#me verbeugt sich: 'Mögte Finadri mit Euich sein, mein Freund.'");
talkEntry:addResponse("Möge Finadri über Euch wachen, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Fare well and do not forget to comre back to Nizar!");
talkEntry:addResponse("#me bows: 'May Findari be with you, my friend'");
talkEntry:addResponse("May Finadari be with you, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Lebt wohl und vergesst nicht bnoch einmal zurück zu Nizar zu kommen.");
talkEntry:addResponse("#me verbeugt sich: 'Mögte Finadri mit Euich sein, mein Freund.'");
talkEntry:addResponse("Möge Finadri über Euch wachen, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("#me smiles.'Thank you very much for you concern, my friend. I am fine as I do not leave the save town. But what about you?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("#me lächelt: 'Danke für Eure Sorge, mein Freund. Mir geht es gut, da ich die sichere Stadt nicht verlasse. Wie ist es Euch ergangen?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("#me bows 'Nazir, from the serin desert. Would you tell me your name, my friend?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("#me verneigt sich. 'Nizar aus der Serin Wüste. Es würde mich freuen, wenn ihr mir Euchen Namen verratet mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gem");
talkEntry:addTrigger("magical smithing");
talkEntry:addTrigger("smithing");
talkEntry:addResponse("Ah. I like to work for you. Well ...");
talkEntry:addResponse("Of course I will help you with thoses magical gems.");
talkEntry:addConsequence(npc.base.consequence.gemcraft.gemcraft(craftNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Edelstein");
talkEntry:addTrigger("magisches Schmieden");
talkEntry:addTrigger("Schmieden");
talkEntry:addResponse("Ah. Ich arbeite gern für Euch. Nun denn ...");
talkEntry:addResponse("Natürlich helfe ich Euch was diese magischen Edelsteinen betrifft!");
talkEntry:addConsequence(npc.base.consequence.gemcraft.gemcraft(craftNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I'd love to make you happy by giving you a task, but I fear I can not help you. I'd sugggest asking someone else.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Es würde mich freuen Euch mit einer Aufgabe glücklich zu machen, aber leider kann ich da nicht helfen, mein Freund. Ich schlage vor, ihr fragt jemand anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I'd love to make you happy by giving you a task, but I fear I can not help you. I'd sugggest asking someone else.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Es würde mich freuen Euch mit einer Aufgabe glücklich zu machen, aber leider kann ich da nicht helfen, mein Freund. Ich schlage vor, ihr fragt jemand anders.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am what is called a magical blacksmith, but my work has merely something in commen with the work of a blacksmith.");
talkEntry:addResponse("A magical blacksmith works with magical gemstones, and not with fire and iron. But the rest must be kept secret, please forgive me, I can not say more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin das, was man einen magischen Schmied nennt. Dabei hat mein Handwerk kaum etwas mit dem eines Schmiedes gemein.");
talkEntry:addResponse("Ein magischer Schmied arbeitewt mit magischen Edelsteinen und nicht mit Eisen und Hammer. Mehr darf ich Euch jedoch nicht verraten, bitte verzeiht mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am what is called a magical blacksmith, but my work has merely something in commen with the work of a blacksmith.");
talkEntry:addResponse("A magical blacksmith works with magical gemstones, and not with fire and iron. But the rest must be kept secret, please forgive me, I can not say more.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin das, was man einen magischen Schmied nennt. Dabei hat mein Handwerk kaum etwas mit dem eines Schmiedes gemein.");
talkEntry:addResponse("Ein magischer Schmied arbeitewt mit magischen Edelsteinen und nicht mit Eisen und Hammer. Mehr darf ich Euch jedoch nicht verraten, bitte verzeiht mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Not everything they tell you is ture, my friend.");
talkEntry:addResponse("Somethings are better not told. Trust me.");
talkEntry:addResponse("I always like a dood conversation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Nicht alles, was man hört ist wahr, mein Freund.");
talkEntry:addResponse(" Vertraut mir, wenn ich sage, dass es Dinge gibt, die besser ungesprochen bleiben.");
talkEntry:addResponse("Ich mag seit jeher gute Gespräche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Serin");
talkEntry:addResponse("There is the River Serin, the forst of Serin and the plains of Serin. It there my ancestors, the Serinjah.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Serin");
talkEntry:addResponse("Es gibt den Fluss Serin, den Wald Serin und die Ebene Serin. Dort lebten meine Vorfahren, die Serinjah.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("serinjah");
talkEntry:addTrigger("Serinjah");
talkEntry:addResponse("That's what my folk is called. What is yours called? Where does it live?");
talkEntry:addResponse("Every Serinjah knows how to ride a horse. If you don't, then you can't be a Serinjah.");
talkEntry:addResponse("Many Serinjah pray to Findari, the godess of air.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("serinjah");
talkEntry:addTrigger("Serinjah");
talkEntry:addResponse("So nennt man Leute aus meinem Volk. Wie heißt Euer Volk? Wo lebt es?");
talkEntry:addResponse("Jeder Serinjah weiß auf einem Pferd zu reiten. Könnt Ihr es nicht, so seid ihr kein Serinjah.");
talkEntry:addResponse("Viele Serinjah beten zu Findari, der Göttin der Luft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ama-shoon");
talkEntry:addResponse("The Ama-shoon are the warriors of our folk. There are many tales told about those brave women.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ama-shoon");
talkEntry:addResponse("Die Ama-shoon sind die Kriger unsere Volkes. Es gibt viele Geschichten über diese mutigen Frauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Secret");
talkEntry:addResponse("Exactly! It is a secret, this meanns it is secret.");
talkEntry:addResponse("I can not tell you the secet of my profession. Some things you really do better not tell.");
talkEntry:addResponse("To become a magical blacksmith one has to scrifice a lot... do not try , my friend!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Geheimnis");
talkEntry:addResponse("Ganz genau! Es ist ein Geheimnis, das heißt, es ist geheim.");
talkEntry:addResponse("Ich kann Euch das Geheimniss meines Berufe nicht verraten, einge Dinge bleiben besser unausgesprochen.");
talkEntry:addResponse("Um ein magischer Schmied zu werden muss man große Opfer bringen..., versucht es nicht, mein Freund!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("Differen people pray to diffent gods. What do you think?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Verschiedene Leute geben zu verschieden Göttern. Wie denkt Ihr darüber?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("religion");
talkEntry:addResponse("Differen people pray to diffent gods. What do you think?");
talkEntry:addResponse("Serinjah often pray to Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("religion");
talkEntry:addResponse("Verschiedene Leute geben zu verschieden Göttern. Wie denkt Ihr darüber?");
talkEntry:addResponse("Serinjah beten oft zu Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("faith");
talkEntry:addResponse("Differen people pray to diffent gods. What do you think?");
talkEntry:addResponse("Serinjah often pray to Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Glaube");
talkEntry:addResponse("Verschiedene Leute geben zu verschieden Göttern. Wie denkt Ihr darüber?");
talkEntry:addResponse("Serinjah beten oft zu Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bragon");
talkEntry:addTrigger("Brágon");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cherga");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Serinjah often pray to Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Findari");
talkEntry:addResponse("Serinjah beten oft zu Findari.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Moshran");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nargun");
talkEntry:addTrigger("Nargún");
talkEntry:addTrigger("Nargùn");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oldra");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ronagan");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sirani");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tanora");
talkEntry:addTrigger("Zelphia");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ushara");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("I do not know much about this god, my friend.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Zhambra");
talkEntry:addResponse("Ich weiß nicht viel über diese Gottheit, mein Freund.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("He is a wise man. I guess He das been reading lots of books.");
talkEntry:addResponse("He is a mage, a mage is not a magical blacksmith thoug... Are you also a mage?");
talkEntry:addResponse("I admire his wisdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Es ist ein weiser Mann. Er muss viele Bücher gelesen haben.");
talkEntry:addResponse("Er ist ein Magier, ein Magier ist allerdings kein magischer Schmied... Seid Ihr Magier?");
talkEntry:addResponse("Ich bewundere seine Weisheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("He is a wise man. I guess He das been reading lots of books.");
talkEntry:addResponse("He is a mage, a mage is not a magical blacksmith thoug... Are you also a mage?");
talkEntry:addResponse("I admire his wisdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Es ist ein weiser Mann. Er muss viele Bücher gelesen haben.");
talkEntry:addResponse("Er ist ein Magier, ein Magier ist allerdings kein magischer Schmied... Seid Ihr Magier?");
talkEntry:addResponse("Ich bewundere seine Weisheit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is my home. Do not ask why, for I will not tell you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist meine Heimat. Fragt nicht warum, denn ich werde ich Euch nicht sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Talking a bit about politics is good, but talking to much about it ...well, it can get nasty, don't you agree?");
talkEntry:addResponse("You have to know that facts before you can change them, they say, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ein wenig über Politik zu reden ist gut, doch zu viel davon zu sprechen,... nun, mein Freund das kann unschön werden. Meint Ihr nicht auch?");
talkEntry:addResponse("Man muss die Tatsachen kennen um sie verdrehen zu können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Talking a bit about politics is good, but talking to much about it ...well, it can get nasty, don't you agree?");
talkEntry:addResponse("You have to know that facts before you can change them, they say, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ein wenig über Politik zu reden ist gut, doch zu viel davon zu sprechen,... nun, mein Freund das kann unschön werden. Meint Ihr nicht auch?");
talkEntry:addResponse("Man muss die Tatsachen kennen um sie verdrehen zu können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Talking a bit about politics is good, but talking to much about it ...well, it can get nasty, don't you agree?");
talkEntry:addResponse("You have to know that facts before you can change them, they say, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ein wenig über Politik zu reden ist gut, doch zu viel davon zu sprechen,... nun, mein Freund das kann unschön werden. Meint Ihr nicht auch?");
talkEntry:addResponse("Man muss die Tatsachen kennen um sie verdrehen zu können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Talking a bit about politics is good, but talking to much about it ...well, it can get nasty, don't you agree?");
talkEntry:addResponse("You have to know that facts before you can change them, they say, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ein wenig über Politik zu reden ist gut, doch zu viel davon zu sprechen,... nun, mein Freund das kann unschön werden. Meint Ihr nicht auch?");
talkEntry:addResponse("Man muss die Tatsachen kennen um sie verdrehen zu können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Talking a bit about politics is good, but talking to much about it ...well, it can get nasty, don't you agree?");
talkEntry:addResponse("You have to know that facts before you can change them, they say, right?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ein wenig über Politik zu reden ist gut, doch zu viel davon zu sprechen,... nun, mein Freund das kann unschön werden. Meint Ihr nicht auch?");
talkEntry:addResponse("Man muss die Tatsachen kennen um sie verdrehen zu können.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("I am very sorry. I do not know this place.");
talkEntry:addResponse("Sounds like the name for a very rare magical stone. Don't you think so, my friend? ");
talkEntry:addResponse("#me shakes his head lightly.'Please tell me more about this, my friend'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Es tut mir aufrichtig Leid. Ich kenne diesen Ort nicht.");
talkEntry:addResponse("Es klingt nach dem Namen eines sehr seltenen magischen Steins. Findet Ihr das nicht auch, mein Freund?");
talkEntry:addResponse("#me schüttelt leicht den Kopf. 'Bitte erzählt mir mehr davon, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I am very sorry. I do not know this place.");
talkEntry:addResponse("Sounds like the name for a very rare magical stone. Don't you think so, my friend? ");
talkEntry:addResponse("#me shakes his head lightly.'Please tell me more about this, my friend'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Es tut mir aufrichtig Leid. Ich kenne diesen Ort nicht.");
talkEntry:addResponse("Es klingt nach dem Namen eines sehr seltenen magischen Steins. Findet Ihr das nicht auch, mein Freund?");
talkEntry:addResponse("#me schüttelt leicht den Kopf. 'Bitte erzählt mir mehr davon, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I am very sorry. I do not know this place.");
talkEntry:addResponse("Sounds like the name for a very rare magical stone. Don't you think so, my friend? ");
talkEntry:addResponse("#me shakes his head lightly.'Please tell me more about this, my friend'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Es tut mir aufrichtig Leid. Ich kenne diesen Ort nicht.");
talkEntry:addResponse("Es klingt nach dem Namen eines sehr seltenen magischen Steins. Findet Ihr das nicht auch, mein Freund?");
talkEntry:addResponse("#me schüttelt leicht den Kopf. 'Bitte erzählt mir mehr davon, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I am very sorry. I do not know this place.");
talkEntry:addResponse("Sounds like the name for a very rare magical stone. Don't you think so, my friend? ");
talkEntry:addResponse("#me shakes his head lightly.'Please tell me more about this, my friend'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Es tut mir aufrichtig Leid. Ich kenne diesen Ort nicht.");
talkEntry:addResponse("Es klingt nach dem Namen eines sehr seltenen magischen Steins. Findet Ihr das nicht auch, mein Freund?");
talkEntry:addResponse("#me schüttelt leicht den Kopf. 'Bitte erzählt mir mehr davon, mein Freund.'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("#me bows 'Nazir, from the serin desert. I am pleasured to meet you'.");
talkEntry:addResponse("It is a honour meeting you, espacialy on such a wounderfull day.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("#me verneigt sich. 'Nizar aus der Serin Wüste. Es freut mich ungemein Eure Bekanntschaft zu machen.'");
talkEntry:addResponse("Es ist eine Ehre Euch zu treffen, besonders an diesem schönen Tag.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Nizar");
talkEntry:addResponse("#me grins.'That would be me! How can I help you?'");
talkEntry:addResponse("Yes? You want to talk? I always like a good discussion.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nizar");
talkEntry:addResponse("#me grinst. 'Das bin ich! Wie kann ich Euch helfen?");
talkEntry:addResponse("Ja? Ihr möchtet reden? Ich bin immer für ein gutes Gespräch zu haben.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("#me nods. 'I see...'");
talkEntry:addResponse("#me smiles brightly and nods.");
talkEntry:addResponse("If I may say so my friend, this is indeed a wise decision...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("#me nickt 'Ich verstehe...'");
talkEntry:addResponse("#me lächelt freundlich und nickt.");
talkEntry:addResponse("Wenn ich das so sagen darf, mein Freund, dies ist in der Tat eine weise Entscheidung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("#me nods. 'I see...'");
talkEntry:addResponse("You know, there I come from if you do not say 'No' three times it will count as a 'Yes'.");
talkEntry:addResponse("Just take you time to consider you answer, while we talk.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("#me nickt. 'Ich verstehe...'");
talkEntry:addResponse("Ihr wisst, das man dort wo ich herkomme drei mal 'Nein' sagen muss, denn sonst heißt es 'Ja'.");
talkEntry:addResponse("Nehmt Euch Zeit eure Antwort zu bedenken während wir reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("no no no");
talkEntry:addResponse("Ah, I understand, but your answer fills my heart with sadness.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("nein nein nein");
talkEntry:addResponse("Nun, I verstehe, doch Eure Antwort füllt mein Herz mit Trauer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me smiles.");
talkEntry:addResponse("#me listens attentively.");
talkEntry:addResponse("I see.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("german"));
talkEntry:addCondition(npc.base.condition.chance.chance(20.0));
talkEntry:addTrigger(".*");
talkEntry:addResponse("#me lächelt.");
talkEntry:addResponse("#me hört aufmerksam zu.");
talkEntry:addResponse("Ich verstehe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me smiles.", "#me lächelt.");
talkingNPC:addCycleText("#me leht sich gegen eine Säule.", "#me leans agains a pillar.");
talkingNPC:addCycleText("#me scheint in die Sonne zu starren.", "#me seems to stare into the sun.");
talkingNPC:addCycleText("Kommt zu Nizar, wenn Ihr etwas über magische Steine wissen wollt!", "Talk to Nizar if you want to know about magical gems!");
talkingNPC:addCycleText("Magische Steine: Je magischer desto besser! Ich mache sie besser!", "Magical stones: More magic is better! I make them better!");
talkingNPC:addCycleText("#me schließt seine Augen.", "#me closes his eyes.");
talkingNPC:addCycleText("Ihr möchtet Eure magischen Steine aufwerten? Nazir kann Euch Helfen.", "You want to upgrade you magical gems? Nazir can help you!");
talkingNPC:addCycleText("#w Ich vermisse dich Serinjah-Steppe...", "#w I miss the serin plains...");
talkingNPC:addCycleText("Lasst mich Eure magischen Edelsteine aufbessern!", "Let me upgrade your magical gem stones!");
talkingNPC:addCycleText("#me breitet die Arme aus.'Egal welche Farbe und welche Qualität Eure magischen Edelsteine sind bei Nizar in guten Händen.'", "#me spreads his arms: 'No matter the colour or the quality Nizar will take care of your magical gems!'.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(3,"buySecondary"));
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Nizar der magische Schmied.", "This NPC is Nizar the magical blacksmith.");
mainNPC:setUseMessage("Fasst mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut kurz verwirrt und lächelt dann.", "#me looks around confused, then he smiles.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 365);
mainNPC:setEquipment(11, 0);
mainNPC:setEquipment(5, 398);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 527);
mainNPC:setEquipment(9, 366);
mainNPC:setEquipment(10, 698);
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