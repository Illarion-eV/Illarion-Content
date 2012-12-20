--------------------------------------------------------------------------------
-- NPC Name: Arimedus Dalahorn                                       Runewick --
-- NPC Job:  Librarian                                                        --
--                                                                            --
-- NPC Race: human                      NPC Position:  951, 830, 1            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Estralis Seborian                                                --
--           Kadiya                                                           --
--                                                       easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 951, 830, 1, 4, 'Arimedus Dalahorn', 'npc.arimedus_dalahorn', 0, 3, 1, 192, 107, 5, 169, 113, 71);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.arimedus_dalahorn", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is Arimedus Dalahorn the librarian. Keywords: Hello, Runes, Magic, Library, Archmage Morgan."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Arimedus Dalahorn der Bibliothekar. Schlüsselwörter: Hallo, Runen, Magie, Bibliothek, Erzmagier Morgan."));
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
talkEntry:addResponse("Greetings in the name of Elara. Can I help you?");
talkEntry:addResponse("Hush! This is a library, not a tavern.");
talkEntry:addResponse("Please do not adress me informally.");
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
talkEntry:addResponse("Elara zum Gruße. Kann ich euch behilflich sein?");
talkEntry:addResponse("Scht! Dies ist eine Bücherei, keine Taverne.");
talkEntry:addResponse("Ich möchte euch bitten mich nicht so unformell anzusprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings in the name of Elara. Can I help you?");
talkEntry:addResponse("Hush! This is a library, not a tavern.");
talkEntry:addResponse("Please do not adress me informally.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Elara zum Gruße. Kann ich euch behilflich sein?");
talkEntry:addResponse("Scht! Dies ist eine Bücherei, keine Taverne.");
talkEntry:addResponse("Ich möchte euch bitten mich nicht so unformell anzusprechen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May Elara guide your way.");
talkEntry:addResponse("Farewell and best of luck for your further studies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Möge euch Elara den Weg weisen.");
talkEntry:addResponse("Gehabt euch wohl und noch viel Erfolg bei euren weiteren Nachforschungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("May Elara guide your way.");
talkEntry:addResponse("Farewell and best of luck for your further studies.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Möge euch Elara den Weg weisen.");
talkEntry:addResponse("Gehabt euch wohl und noch viel Erfolg bei euren weiteren Nachforschungen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am busy. I study the runes of magic, so do not distract me too long.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addTrigger("Wie Befind");
talkEntry:addResponse("Ich bin beschäftigt. Ich erforsche die magischen Runen, also lenkt mich nicht allzu lange ab.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Arimedus Dalahorn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Arimedus Dalahorn.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("I am not here to entertain you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Es ist nicht meine Aufgabe, euch zu beschäftigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("I am not here to entertain you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Es ist nicht meine Aufgabe, euch zu beschäftigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("You see, I work on some papers. I write on a elaboration about the meaning of all runes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Wie ihr sicher seht, arbeite ich an einigen schriftlichen Ausarbeitungen. Ich arbeite an einer Zusammenfassung der Bedeutung aller Runen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("You see, I work on some papers. I write on a elaboration about the meaning of all runes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Wie ihr sicher seht, arbeite ich an einigen schriftlichen Ausarbeitungen. Ich arbeite an einer Zusammenfassung der Bedeutung aller Runen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("I am happy that archmage Morgan gave me the opportunity to continue my studies after the... events of Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Ich bin Erzmagier Morgan sehr dankbar, dass er es mir ermöglicht hat, meine Studien fortzusetzen nach den... Ereignissen auf Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("It's a pleasure to meet you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Es freut mich euch kennenzulernen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Interesting");
talkEntry:addResponse("Indeed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rune");
talkEntry:addResponse("Of which rune would you like to learn the meaning?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("magic");
talkEntry:addResponse("If you want to learn anything about magic, you first have to learn about runes. I can tell you all I know.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("library");
talkEntry:addResponse("This library is rather old, not as old as archmage Morgan, though. His wisdom is beyond what is written in these books.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("book");
talkEntry:addResponse("You can find many books in this library but no book will replace the guidance of a master - who tells you what to read.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Interessant");
talkEntry:addResponse("Das ist es in der Tat.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rune");
talkEntry:addResponse("Von welcher Rune möchtet ihr die Bedeutung wissen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Magie");
talkEntry:addResponse("Wer die Magie studieren möchte muss zunächst die Runen studieren. Ich bin bereit, mein Wissen jederzeit zu teilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Bibliothek");
talkEntry:addResponse("Diese Bibliothek ist schon sehr alt, aber nicht so alt wie Erzmagier Morgan. Seine Weisheit geht über den Inhalt all dieser Bücher weit hinaus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Buch");
talkEntry:addTrigger("Bücher");
talkEntry:addResponse("Man kann viele Bücher in dieser Bibliothek finden, aber kein Buch kann die Ratschläge eines Meisters ersetzen, der einem sagt, was man lesen sollte.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("HEPT");
talkEntry:addResponse("HEPT is the rune of ice. It can be used for offensive icespells and icebolts, create and put out iceflames.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("HEPT");
talkEntry:addResponse("HEPT ist die Rune des Eises. Sie kann für offensive Eiszauber genutzt werden, sowie zum Entfachen und Auslöschen von Eisflammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("PEN");
talkEntry:addResponse("PEN is the rune of spirit and a elemental rune. It can be used to cast healing spells, both weak, strong, and over an area.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("PEN");
talkEntry:addResponse("PEN ist die Rune des des Geistes und eine Elementarrune. Sie kann für starke und schwache Heilzauber benutzt werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("MES");
talkEntry:addResponse("MES is the rune of light. It can be used to cast healing spells, both weak, strong, and over an area.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("MES");
talkEntry:addResponse("MES ist die Rune des Lichts. Sie kann für starke und schwache Heilzauber benutzt werden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ORL");
talkEntry:addResponse("ORL is the rune of creating and materialisation. It can be used to create walls, relieve hunger and created thunderstorms. ");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ORL");
talkEntry:addResponse("ORL ist die Rune der Materialisierung. Sie kann genutzt werden um Steinwände zu erschaffen, Hunger zu stillen und Gewitterstürme heraufzubeschwören.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("CUN");
talkEntry:addResponse("CUN is the rune of water and a elemental rune. It can be used to put out campfires.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("CUN");
talkEntry:addResponse("CUN ist die Rune des Wassers und eine Elementarrune. Sie kann benutzt werden um Lagerfeuer auszulöschen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("SAV");
talkEntry:addResponse("SAV is the rune of protection. It can be used to create flames and walls around you, which can protect you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("SAV");
talkEntry:addResponse("SAV ist die Rune des Schutzes. Sie kann benutzt werden um Flammen und Steinwälle um dich herum entstehen zu lassen, die dich schützen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("SOLH");
talkEntry:addResponse("SOLH is the rune of earth and a elemental rune. It can be used in paralysis, storms and wall creation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("SOLH");
talkEntry:addResponse("MES ist die Rune der Erde und eine Elementarrune. Sie kann genutzt werden um Steinwände zu erschaffen, Stürme heraufzubeschwören und den Gegner zu paralysieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("FHEN");
talkEntry:addResponse("FHEN is the rune of fetching. It can be used to bring small and large objects towards you. Some say it has another use...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("FHEN");
talkEntry:addResponse("FHEN steht als Rune für das Holen. Sie kann benutzt werden, um kleine und größere Objekte zu dir zu holen. Es gibt jedoch Gerüchte, es gäbe noch eine andere Verwendung für sie...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("KAH");
talkEntry:addResponse("KAH is the rune of nourishment and food. It can be used to relieve hunger, both minorly and thoroughly.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("KAH");
talkEntry:addResponse("KAH ist die Rune der Nahrung und Ernährung. Sie kann sie benutzen um sich selbst leicht, oder auch ausreichend zu sättigen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("LHOR");
talkEntry:addResponse("LHOR is the rune of illusion. It can be used to create illusionary objects like fireballs, flames, iceballs, ice flames and such things.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("LHOR");
talkEntry:addResponse("LHOR ist die Rune der Illusion. Sie kann benutzt werden um illusionäre Objekte zu erschaffen, wie Feuerbälle, Feuerflammen, Eisbälle und solche Dinge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("KEL");
talkEntry:addResponse("KEL is the rune of moving. It can be used to cast motion-related spells and has many uses. For instance, fireballs, iceballs, bringing things to you, remedying paralysis and operating doors.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("KEL");
talkEntry:addResponse("KEL ist die Rune der Bewegung. Sie kann genutzt werden für bewegungsgebundene Zauber wie zum Beispiel Feuerbälle, Eisbälle und Teleportation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("TAH");
talkEntry:addResponse("TAH is the rune of inverse. It can be used to remove things, such as walls, flames, iceflames, portals, poison clouds and illusions.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("TAH");
talkEntry:addResponse("TAH ist die Rune der Umkehrung. Sie kann genutzt um erschaffene Dinge wieder aufzulösen, zum Beispiel Flammen, Portale, Giftwolken und Illusionen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("TAUR");
talkEntry:addResponse("TAUR is the rune of creatures. It can be used in summoning and teleportation.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("TAUR");
talkEntry:addResponse("Die Rune TAUR steht für alle Kreaturen. Sie kann bei der Teleportation genutt werden und bei der Beschwörung von Wesenheiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("URA");
talkEntry:addResponse("URA is the rune of nature. It can be used to summon natural creatures.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("URA");
talkEntry:addResponse("URA ist die Rune des Natürlichen. Sie kann benutzt werden um natürliche Kreaturen herbeizubeschwören.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("IRA");
talkEntry:addResponse("IRA is the rune of unnaturality. It can be used to summon unnatural creatures and also to create flames, iceflames and poison clouds.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("IRA");
talkEntry:addResponse("IRA ist die Rune des Unnatürlichen. Sie wird benutzt um unnatürliche Kreaturen herbeizubeschwören, aber auch um Flammen und Giftwolken zu beschwören.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("YEG");
talkEntry:addResponse("YEG is the rune of poison. It can be used to cast offensive poison spells, create and put out poison clouds, as well as curing poison.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("YEG");
talkEntry:addResponse("YEG ist die Rune des Giftes. Sie wird für offensive Giftsprüche benutzt, um Giftwolken zu erschaffen oder auszulöschen aber auch um Vergiftungen zu heilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("JUS");
talkEntry:addResponse("JUS is the rune of wind and a elemental rune. It can be used for offensive and defensive wind-spells, to bring objects towards you, teleportation, as well as remedying paralysis.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("JUS");
talkEntry:addResponse("JUS ist die Rune des Windes und eine Elementarrune. Sie wird genutzt für defensive und offensive Windsprüche, um Objekte zu bewegen, für die Teleportation und um zu paralysieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("SIH");
talkEntry:addResponse("SIH is the rune of healing. It can be used in strong healing spells and to heal poison.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("SIH");
talkEntry:addResponse("SIH die Rune der Heilung. Sie wird für starke Heilzauber genutzt und um Vergiftungen zu heilen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("ANTH");
talkEntry:addResponse("ANTH is the rune of objects. It can be used to summon flames, iceflames, poison clouds, to operate doors and to bring objects towards you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ANTH");
talkEntry:addResponse("ANTH ist die Rune des Objekts. Sie wird benutzt um Flammen und Giftwolken zu beschwören, um Türen zu öffnen und Objekte zu bewegen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("SUL");
talkEntry:addResponse("SUL is the rune of standing and slowness. It can be used to paralyse people for a short time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("SUL");
talkEntry:addResponse("SUL ist die Rune der Unbeweglichkeit. Sie wird genutzt um Personen für eine kurze Dauer zu paralysieren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("QWAN");
talkEntry:addResponse("QWAN is the rune of strength. It can be used to step up spells and make them more effective.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("QWAN");
talkEntry:addResponse("QWAN ist die Rune der Stärke. Sie wurd benutzt um Sprüche zu verstärken und macht sie so wirkungsvoller.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("DUN");
talkEntry:addResponse("DUN is the rune of area. It can be used to create area effects.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("DUN");
talkEntry:addResponse("DUN ist die Rune der Fläche. Sie wird benutzt um den Effekt von anderen Sprüchen auszuweiten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("PHERC");
talkEntry:addResponse("PHERC is the rune of harm. It can be used to create lightning and for effective poison people.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("PHERC");
talkEntry:addResponse("PHERC ist die Rune der Verletzung. Sie wird genutzt um Blitze herbeizubeschwören und um effektiv jemanden zu vergiften.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("FHAN");
talkEntry:addResponse("FHAN is the rune of sending. FHAN is a mysterios Rune. I haven't found any spell for this rune, but maybe you found one....");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("FHAN");
talkEntry:addResponse("FHAN ist die Rune des Bringens. FHEN ist eine sehr mysteriöse Rune, ich habe bisher noch keine Anwendung dafür gefunden, aber vielleicht findet ihr ja eine...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("LUK");
talkEntry:addResponse("LUK is the rune of evil. It is used to summon hostile creatures.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("LUK");
talkEntry:addResponse("LUK ist die Rune des Böse. Sie kann benutzt werden um aggressive Kreaturen herbeizubeschwören.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("LEV");
talkEntry:addResponse("LEV is the rune of change. I know a few people who are able to cast teleport spells into a scroll with this rune, but I heard that this is very difficult.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("LEV");
talkEntry:addResponse("LEV ist die Rune der Veränderung. Ich habe von ein paar Personen gehört, die fähig sein sollen Teleportsprüche damit in Schriftrollen zu bannen, aber es soll sehr schwer sein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("BHONA");
talkEntry:addResponse("BHONA is the rune of teaching. It is used to teach another person runes. Only teachers can get this rune.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("BHONA");
talkEntry:addResponse("BHONA ist die Rune des Lehrens. Sie wird benutzt um anderen Personen Runen zu lehren. Nur Lehrer können diese Rune bekommen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("RA");
talkEntry:addResponse("RA is the rune of fire and an elemental rune. It can be used for offensive firespells and explosions, create and put out fireflames.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("RA");
talkEntry:addResponse("RA ist die Rune des Feuers und eine Elementarrune. Sie kann für offensive Feuerzauber genutzt werden, sowie zum Entfachen und Auslöschen von Feuerflammen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("I am happy that archmage Morgan gave me the opportunity to continue my studies after the... events of Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ich bin Erzmagier Morgan sehr dankbar, dass er es mir ermöglicht hat, meine Studien fortzusetzen nach den... Ereignissen auf Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("I am happy that archmage Morgan gave me the opportunity to continue my studies after the... events of Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ich bin Erzmagier Morgan sehr dankbar, dass er es mir ermöglicht hat, meine Studien fortzusetzen nach den... Ereignissen auf Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick became my home, but before that, I had an important position at the magic academy of Gobaith.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist nun meine Heimat, zuvor hatte ich eine wichtige Position bei der magischen Akademie Gobaiths inne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("I do not care about fat, greedy dwarves, sorry.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Dicke und geizige Zwerge interessieren mich nicht wirklich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("It is hopeless to bring books to Galmair. The citizens would most probably burn or eat them.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Bücher nach Galmair zu bringen ist recht sinnfrei. Die Bürger würden sie entweder verbrennen oder essen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Her majesty has an impressive charisma, but she lacks education.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Ihre Majestät hat ein beeindruckendes Charisma, aber es mangelt ihr an guter Bildung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Her majesty has an impressive charisma, but she lacks education.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Ihre Majestät hat ein beeindruckendes Charisma, aber es mangelt ihr an guter Bildung.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, Cadomyr... Can't we talk about something more relevant? Like runes?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr, Cadomyr... können wir nicht über etwas wichtiges reden? Runen zum Beispiel?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("#me awns: 'Albar? That backward country of ignorance? Do you want to bore me?'");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("#me gähnt: 'Albar? Dieses rückständige Land der Ignoranz? Wollt ihr mich zu Tode langweilen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Gynk is an important centre of trade and goods. And corruption.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Gynk ist ein wichtiges Zentrum des Handels und des Kommerz. Und der Korruption.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("I studied in Lor Angur, not Salkamar. But isn't that obvious?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Ich habe in Lor Angur studiert, nicht in Salkamar. Aber das ist doch klar, oder?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I am a researcher! Of course I have a strong faith in the gods, as soon as you start investigating on anything in the world, you realise the importance of the gods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bin ein Forscher! Natürlich bin ich streng gläubig. Sobald man ernsthaft die einen umgebende Welt untersucht, stellt man fest, wie groß der Einfluss der Götter ist.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("He's drunk I guess.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Ist der besoffen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara is my patron and the patron of Runewick. Her way is my way. And I do it my way!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara ist meine Patronin und die Patronin Runewicks. Ihr Weg ist der meinige. Und ich gehe meinen Weg!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("I respect Eldan, but a smart mind alone does not learn by itself. Intensive studies are necessary.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Eldan");
talkEntry:addResponse("Ich verehre Eldan, aber ein schlauer Kopf lernt nicht von alleine. Ein intensives Studium ist nötig.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I'm sorry, but I don't need anything at the moment.");
talkEntry:addResponse("I'm sorry, but I have nothing to sell.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Es tut mir leid, aber ich brauche gerade nichts.");
talkEntry:addResponse("Es tut mir leid, aber ich habe nichts zu verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("I can tell you something about the meaning of the runes, if you like.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Ich kann euch etwas über die Bedeutung von Runen erzählen, wenn ihr mögt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Arimedus");
talkEntry:addTrigger("Dalahorn");
talkEntry:addResponse("I study the runes of magic. State your business.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Arimedus");
talkEntry:addTrigger("Dalahorn");
talkEntry:addResponse("Ich studiere die magischen Runen. Was begehrt ihr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("YES? I do not know that rune.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("JA? Die Rune kenne ich nicht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("'No' is one of the most powerful, non magical words. Think about that.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("'Nein' ist eines der machtvollsten, nichtmagischen Worte. Denkt mal drüber nach.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("STFU");
talkEntry:addTrigger("WTF");
talkEntry:addTrigger("GTFO");
talkEntry:addResponse("That's also quite a powerful rune.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("STFU");
talkEntry:addTrigger("WTF");
talkEntry:addTrigger("GTFO");
talkEntry:addResponse("Das ist auch eine mächtige Rune.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#me nimmt eine andere Schriftrolle vom Stapel.", "#me takes another scoll from the stack.");
talkingNPC:addCycleText("#me hebt kurz den Kopf an und blickt über den Rand seiner Brille durch den Raum.", "#me raises his head slightly and looks over the edge of his glassen through the room.");
talkingNPC:addCycleText("#me seufzt.", "#me sighs.");
talkingNPC:addCycleText("#me macht eine Notiz mit einem Federkiel.", "#me takes a note with a quill.");
talkingNPC:addCycleText("Ich sollte dies Erzmagier Morgan melden.", "I should report this to archmage Morgan.");
talkingNPC:addCycleText("Interessant.", "Interesting.");
talkingNPC:addCycleText("Es muss noch mehr Runen geben... wenigstens vier.", "There have to be more runes... at least four.");
talkingNPC:addCycleText("Runen alleine sind noch keine Magie, erst ihre Kombination erweckt Wunder.", "Runes themselves aren't magic. Only their combination can result in miracles.");
talkingNPC:addCycleText("Shh!", "Hush!");
talkingNPC:addCycleText("Willkommen in der Bibliothek.", "Welcome to the library.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Arimedus Dalahorn der Bibliothekar.", "This NPC is Arimedus Dalahorn the librarian.");
mainNPC:setUseMessage("Ich würde es bevorzugen, wenn ihr mich nicht anfasst.", "I would prefer that you don't touch me.");
mainNPC:setConfusedMessage("#me schaut verwirrt.", "#me looks around confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 818);
mainNPC:setEquipment(11, 548);
mainNPC:setEquipment(5, 2785);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 823);
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