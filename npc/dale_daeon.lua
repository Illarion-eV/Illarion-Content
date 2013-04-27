--------------------------------------------------------------------------------
-- NPC Name: Dale Daeon                                               Cadomyr --
-- NPC Job:  Arena Master                                                     --
--                                                                            --
-- NPC Race: human                      NPC Position:  258, 663, 0             --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Lillian                                                          --
--                                                     easyNPC Parser v1.23.1 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 258, 663, 0, 4, 'Dale Daeon', 'npc.dale_daeon', 0, 2, 3, 192, 107, 5, 191, 139, 97);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.condition.town")
require("npc.base.consequence.inform")
require("npc.base.consequence.arena")
require("npc.base.talk")
module("npc.dale_daeon", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the arena master Dale Daeon Keywords: Hello, monster, fight, ranklist, points."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Arenameister Dale Daeon. Schlüsselwörter: Hallo, Monster, Kämpfen, Rangliste, Punkte."));
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
talkEntry:addResponse("Hail! Time to prove yourself in the arena of Cadomyr!");
talkEntry:addResponse("Greetings! Just get your sword and prove your strenght against my beasts!");
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
talkEntry:addResponse("Seid gegrüßt! Es ist Zeit das ihr euch in der Arena von Cadoymr beweist!");
talkEntry:addResponse("Grüße! Nehmt einfach euer Schwert und beweist euch gegen meine Biester!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Hail! Time to prove yourself in the arena of Cadomyr!");
talkEntry:addResponse("Greetings! Just get your sword and prove your strenght against my beasts!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid gegrüßt! Es ist Zeit das ihr euch in der Arena von Cadoymr beweist!");
talkEntry:addResponse("Grüße! Nehmt einfach euer Schwert und beweist euch gegen meine Biester!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Go with pridein your heart, soldier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehet mit Stolz im Herzen, Soldat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Go with pridein your heart, soldier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Gehet mit Stolz im Herzen, Soldat!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I am fine. The sun is shining and the sand tickles in my beard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich fühle mich gut. Die Sonne scheint und der Sand kitzelt in meinem Bard.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Dale. I'm the arena master here. Are you strong enough to beat my beasts?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Dale. Ich bin der Arenameister hier. Seid ihr stark genug um gegen meine Biester zu gewinnen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("That old, wand waving wimp. Has no guts, that man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Der alte, stabschwingende Feigling. Der hat einfach kein Courage, dieser Mann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("That old, wand waving wimp. Has no guts, that man.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Der alte, stabschwingende Feigling. Der hat einfach kein Courage, dieser Mann.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("The town of wimps and fishwifes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die Stadt der Feiglinge und Waschweiber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Ruthless old geezer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Skrupelloser alter Knacker.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Money, money, money... but where is the honour?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Geld, geld, geld... aber wo bleibt die Ehre?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("She's my queen and I obey her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("königin");
talkEntry:addResponse("Sie ist meine Königin und ich folge ihr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("She's my queen and I obey her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Sie ist meine Königin und ich folge ihr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is the only town I like to spent my time. People get me here.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist die einzige Stadt in der ich meine Zeit verbringen will. Die Leute verstehen mich hier.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I only sell my beasts to fighters that are worthy and want to prove themselves.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich verkaufe nur meine Biester an Kämpfer die es Wert sind und sich beweisen sollen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tale");
talkEntry:addTrigger("story");
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Start to write your own story by fighting in my arena.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("geschichte");
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Schreibt eure eigene Geschichte indem ihr in meiner Arena kämpft.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("fight");
talkEntry:addResponse("What beast would you like to fight against today?");
talkEntry:addConsequence(npc.base.consequence.arena.arena("request"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("kämpfen");
talkEntry:addResponse("Gegen welches Biest wollt ihr heute kämpfen?");
talkEntry:addConsequence(npc.base.consequence.arena.arena("request"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("points");
talkEntry:addResponse("#me looks at his list.");
talkEntry:addConsequence(npc.base.consequence.arena.arena("points"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.town.town(1));
talkEntry:addTrigger("punkte");
talkEntry:addResponse("#me schaut auf seine Liste.");
talkEntry:addConsequence(npc.base.consequence.arena.arena("points"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("fight");
talkEntry:addResponse("Only citizen of Cadomyr are allowed to fight here and prove their strenght.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kämpfen");
talkEntry:addResponse("Nur Bürger Cadomyrs dürfen hier kämpfen und ihre Kraft beweisen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("points");
talkEntry:addResponse("As I see it, you do not belong to Cadomyr. I will not find you on my list then.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("punkte");
talkEntry:addResponse("Ihr gehört nicht zu Cadomyr wie ich sehe. Ihr werdet also auch nicht auf meiner Liste stehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ranklist");
talkEntry:addResponse("#me hands your a piece of parchment: 'Well, well...'");
talkEntry:addConsequence(npc.base.consequence.arena.arena("list"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rangliste");
talkEntry:addResponse("#me gibt dir ein Stück Papier: 'So, so...'");
talkEntry:addConsequence(npc.base.consequence.arena.arena("list"));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("beast");
talkEntry:addTrigger("monster");
talkEntry:addResponse("There are several beasts roaming the lands as you might now. I found and captured a few for you to fight against.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("biest");
talkEntry:addTrigger("monster");
talkEntry:addResponse("Es gibt viele Biester die das Land durchstreifen, wie ihr sicher wisst. Ich habe ein paar gefunden und gefangen, damit ihr gegen sie kämpfen könnt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("dog");
talkEntry:addTrigger("wolves");
talkEntry:addTrigger("wolf");
talkEntry:addResponse("Those fourlegged, furry creatures are quite easy to defeat with a sharp sword.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("hund");
talkEntry:addTrigger("wolf");
talkEntry:addTrigger("wölfe");
talkEntry:addResponse("Diese vierbeinigen, pelzigen Kreaturen sind recht einfach zu beziegen mit einem scharfen Schwert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dragon");
talkEntry:addResponse("Beware of the dragons! They are mean and strong and only a very skilled swordsman can defeat it. There are fire dragons, ice dragons, undead ones and one is meaner then the other.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("drache");
talkEntry:addResponse("Nehmt euch vor Drachen in Acht! Sie sind gemein und stark und nur ein sehr guter Kämpfer kann ihn schlagen. Es gibt Feuerdrachen, Eisdrachen und untote und jeder ist gemeiner als der andere.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("imp");
talkEntry:addResponse("Mean and tricky little creatures. But not too hard to defeat for a skilled fighter.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("wichtel");
talkEntry:addTrigger("kobold");
talkEntry:addResponse("Gemeine und trickreiche kleine Kreaturen, aber nicht zu schwer zu besiegen für geübte Kämpfer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
talkingNPC:addCycleText("#mes prunkvolle Rüstung zeigt das Wappen von Cadomyr.", "#me's shining armour shows the coat of arms of Cadomyr.");
talkingNPC:addCycleText("Nieder mit den Feiglingen aus Galmair und Runewick!", "Down with the cowards of Galmair and Runewick!");
talkingNPC:addCycleText("Für die Ehre des Ordens der Silberdragon und die alten Sitten streite ich.", "I fight for the honour of the Order of the Silver Dragon and the old customs.");
talkingNPC:addCycleText("Es ist nicht die Zeit der Worte, sondern die der Taten. Beweist euch gegen meine Biester!", "It is not the time for speech, but for deeds. Prove yourself against my beasts!");
talkingNPC:addCycleText("#me hält sein reich verziehrtes Schwert fest in der Hand und schwingt es durch die Luft.", "#me holds his ornate sword firmly with one hand, swinging it idly into the air.");
talkingNPC:addCycleText("#me schreibt einige Worte ein in Leder einbebundenes Buch.", "#me writes some words into a leather covered book.");
talkingNPC:addCycleText("Wir leben in merkwürdigen Zeiten...", "Strange times we live in...");
talkingNPC:addCycleText("Bei Brágons heiligem Blut!", "By the holy blood of Brágon!");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Arenameister Dale Daeon.", "This NPC is the arena master Dale Daeon.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 101);
mainNPC:setEquipment(11, 2419);
mainNPC:setEquipment(5, 231);
mainNPC:setEquipment(6, 2284);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 34);
mainNPC:setEquipment(10, 53);
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