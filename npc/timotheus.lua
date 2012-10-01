--------------------------------------------------------------------------------
-- NPC Name: Timotheus                                               Runewick --
-- NPC Job:  Tailor                                                           --
--                                                                            --
-- NPC Race: halfling                   NPC Position:  912, 813, 1            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Authors:  Estralis Seborian                                                --
--           Mesha                                                            --
--                                                                            --
-- Last parsing: September 30, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (2, 912, 813, 1, 4, 'Timotheus', 'npc.timotheus', 0, 1, 0, 208, 125, 4, 231, 186, 144);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.timotheus", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
local tradingNPC = npc.base.trade.tradeNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("sell");
talkEntry:addTrigger("buy");
talkEntry:addTrigger("wares");
talkEntry:addTrigger("price");
talkEntry:addTrigger("trade");
talkEntry:addTrigger("purchase");
talkEntry:addResponse("Ah, so you are interested in my wares.");
talkEntry:addResponse("Take your time to look around.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("kauf");
talkEntry:addTrigger("waren");
talkEntry:addTrigger("preis");
talkEntry:addTrigger("Handel");
talkEntry:addTrigger("veräußer");
talkEntry:addTrigger("erwerb");
talkEntry:addResponse("Ah, dann interessiert Ihr Euch also für meine Waren.");
talkEntry:addResponse("Schaut Euch ruhig in Ruhe um.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the tailor Timotheus. Keywords: sell, buy, trade, Hello, tailor."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schneider Timotheus. Schlüsselwörter: kaufe, verkaufe, Handel, Hallo, Schneider."));
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
talkEntry:addResponse("Welcome wise one.");
talkEntry:addResponse("Why greetings to you!");
talkEntry:addResponse("Greetings elevated one.");
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
talkEntry:addResponse("Willkommen, mein weiser Freund.");
talkEntry:addResponse("Wie jetzt, seid gegrüßt!");
talkEntry:addResponse("Grüße, mein Großer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Not so informal!");
talkEntry:addResponse("Well... Greetings.");
talkEntry:addResponse("Is that the way they talk on the street nowadays?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Na, nicht so schnodderig.");
talkEntry:addResponse("Nun... seid gegrüßt.");
talkEntry:addResponse("Redet man heutzutage so auf der Straße?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("May Elara protect your knowledge!");
talkEntry:addResponse("Insightful journey to you!");
talkEntry:addResponse("Farewell now!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Möge Elara eure Weisheit bewahren.");
talkEntry:addResponse("Eine aufschlussreiche Reise wünsche ich.");
talkEntry:addResponse("Gehabt euch wohl.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Charming me huh? Farewell then!");
talkEntry:addResponse("The courtesies certainly haven't left you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Ihr wollt mir wohl schmeicheln. Gute Reise!");
talkEntry:addResponse("Eure Anstandsformen haben euch offensichtlich noch nicht verlassen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I'm feeling wonderful, thank you.");
talkEntry:addResponse("Great! Did you know the library has books about famous tailors? Amazing literature.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Mir geht es wunderbar, danke.");
talkEntry:addResponse("Großartig! Wußtet ihr, dass es in der Bibliothek Bücher über berühmte Schneider gibt? Spannende Lektüre, muss ich sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("I am Timotheus.");
talkEntry:addResponse("Why, Timotheus of course!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Ich bin Timotheus.");
talkEntry:addResponse("Wie jetzt, Timotheus natürlich!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addResponse("I only sell goods, my apologies. Quests are for the courageous and the air-heads.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addResponse("Ich bin nur ein Händler, entschuldigt. Abenteuer sind für die mutigen und törichten.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Adventures? I'm pretty happy with my robes thank you.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Abenteuer? Ich bin ziemlich glücklich mit meinen Roben, danke.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I am a tailor. I sell tailor goods, and even make some myself!");
talkEntry:addResponse("Profession, my life, whatever you prefer, it's tailoring!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
talkEntry:addResponse("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I am a tailor. I sell tailor goods, and even make some myself!");
talkEntry:addResponse("Profession, my life, whatever you prefer, it's tailoring!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin ein Schneider. Ich verkaufe Schneiderwaren und mache auch welche für mich selbst.");
talkEntry:addResponse("Mein Beruf, ja, mein Leben, das ist die Schneiderei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? No one goes there anymore man! It's a shadow of it's former glory.");
talkEntry:addResponse("Ah that's right! All these Gobaithian refugees...");
talkEntry:addResponse("That good old island isn't much anymore is it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Gobaith? Da wagt sich niemand mehr hin. Es ist nur noch ein Schatten längst vergangenen Ruhmes.");
talkEntry:addResponse("Ja, genau! All diese Flüchtlinge aus Gobaith...");
talkEntry:addResponse("Die gute alte Insel gibt es nicht mehr, richtig?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("And I am Timotheus. Ti-mo-the-us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Und ich bin Timotheus. Ti-mo-the-us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tailor");
talkEntry:addResponse("Tailoring is an underestimated craft. A robe can tell a tale, of great adventures and wisdom.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schneider");
talkEntry:addResponse("Die Schneiderei ist ein unterschätztes Handwerk. Eine Robe kann eine ganze Geschichte von Abenteuern und Weisheit erzählen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("location");
talkEntry:addResponse("Why, you are in Runewick of course, where else.");
talkEntry:addResponse("The place to be in Runewick, at the tailor!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ort");
talkEntry:addResponse("Wie jetzt, ihr seid natürlich in Runewick.");
talkEntry:addResponse("Der Platz schlechthin, Runewick beim Schneider.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("Well of course there is Francois. He sells the goods all the farmers have been working for on the fields.");
talkEntry:addResponse("Wise old William, he sells all the goods for your studies late at night.");
talkEntry:addResponse("Alysa over there is the finest cook there has been in a long time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Nun, da gibt es Francois. Er handelt mit all dem, was Bauern auf den Feldern bestellt haben.");
talkEntry:addResponse("Der alte, weise William wird euch alles verkaufen, was ihr bei nächtlichen Studien benötigt.");
talkEntry:addResponse("Alysa dort drüben ist der beste Köchin weit und breit.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Timmy");
talkEntry:addResponse("I am not living a lie!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Timmy");
talkEntry:addResponse("Ich lebe keine Lüge!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Archmage");
talkEntry:addResponse("He is a brilliant, BRILLIANT man.");
talkEntry:addResponse("If he wasn't here... I just wouldn't know what would happen with Runewick. Runewick wouldn't flourish like it does today.");
talkEntry:addResponse("Rather restrained, isn't he?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Er ist ein brillianter, ich sage, brillianter Mann.");
talkEntry:addResponse("Wenn es ihn nicht gäbe... Ich kann mir gar nicht ausmalen, was dann aus Runewick werden würde. Es würde nicht so florieren wie heute, so viel ist sicher.");
talkEntry:addResponse("Er wirkt ziemlich reserviert, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("He is a brilliant, BRILLIANT man.");
talkEntry:addResponse("If he wasn't here... I just wouldn't know what would happen with Runewick. Runewick wouldn't flourish like it does today.");
talkEntry:addResponse("Rather restrained, isn't he?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Er ist ein brillianter, ich sage, brillianter Mann.");
talkEntry:addResponse("Wenn es ihn nicht gäbe... Ich kann mir gar nicht ausmalen, was dann aus Runewick werden würde. Es würde nicht so florieren wie heute, so viel ist sicher.");
talkEntry:addResponse("Er wirkt ziemlich reserviert, nicht wahr?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("The finest city in the land, that's for sure.");
talkEntry:addResponse("Power through knowledge, that's the motto!");
talkEntry:addResponse("The south-eastern jewel, that's what it is.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Die beste Stadt weit und weit, so viel steht fest.");
talkEntry:addResponse("Wissen ist Macht, das ist das Motto!");
talkEntry:addResponse("Das Juwel des Südwesten, das ist es.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addResponse("I'm not sure what to think of him. His morals are certainly on the wrong side of a pig.");
talkEntry:addResponse("Money money money, that's all I hear in my head when I hear that name.");
talkEntry:addResponse("Valerio Pighead is his name if you ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Don");
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addResponse("Ich weiß nicht recht, was ich von ihm halten soll. Seine Moralvorstellungen ähneln dem Hinterteil eines Schweines.");
talkEntry:addResponse("Geld, Geld, Geld, das ist alles, was mir bei dem Namen in den Kopf kommt.");
talkEntry:addResponse("Valerio Schweinskopf ist sein Name, wenn ihr mich fragt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("About as bad as it's rules I guess.");
talkEntry:addResponse("Built upon the corpses of those with fewer financial reserves.");
talkEntry:addResponse("I heard Galmair is ruled by merchants. I say: Ruled by pigs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Es ist genauso schlecht dort wie die dortigen Regeln.");
talkEntry:addResponse("Gebaut auf den Leichen derer, die über kein ausreichendes Finanzpolster verfügen.");
talkEntry:addResponse("Ich habe gehört, Galmair wird von Händlern dominiert. Ich sage: Es wird von Schweinen beherrscht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("queen");
talkEntry:addResponse("Queen Rosaline, queen Rosaline. Honourable woman, but not the smartest in her class.");
talkEntry:addResponse("She should spend more time reading books instead of boasting.");
talkEntry:addResponse("The archmage is right to distrust her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Queen Rosaline, queen Rosaline. Honourable woman, but not the smartest in her class.");
talkEntry:addResponse("She should spend more time reading books instead of boasting.");
talkEntry:addResponse("The archmage is right to distrust her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rosaline");
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Queen Rosaline, queen Rosaline. Honourable woman, but not the smartest in her class.");
talkEntry:addResponse("She should spend more time reading books instead of boasting.");
talkEntry:addResponse("The archmage is right to distrust her.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rosaline");
talkEntry:addTrigger("Edwards");
talkEntry:addResponse("Königin Rosaline, Königin Rosaline. Eine ehrbare Frau, aber nicht gerade die schlauste ihrer Art.");
talkEntry:addResponse("Sie sollte mal mehr Zeit mit Büchern als mit ihren Prahlereien verbringen.");
talkEntry:addResponse("Ich denke, der Erzmagier tut gut daran, ihr nicht zu trauen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Beautiful city I guess, too bad the inhabitants are airheads.");
talkEntry:addResponse("I bet they have awfully empty libraries.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Eine schöne Stadt, so denke ich, aber ihre Einwohner sind hirnverbrannt.");
talkEntry:addResponse("Ich schätze, sie haben dort eine schrecklich leere Bibliothek.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Sir Reginald of Cadomyr owned land in Albar I believe.");
talkEntry:addResponse("Strange customs, those albarians.");
talkEntry:addResponse("Isn't that somewhere at the end of the Aramon mountains?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Ich glaube zu wissen, dass Sir Reginald von Cadomyr Land in Albar besessen hat.");
talkEntry:addResponse("Merkwürdige Sitten haben sie, die Albarier.");
talkEntry:addResponse("Ist das nicht irgendwo am Ende der Aramonberge?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("Lawless pigs, that's what they are.");
talkEntry:addResponse("Surrounded by pirate islands. Doesn't surprise me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ruchlose Schweine, das sind sie.");
talkEntry:addResponse("Umgeben von Pirateninseln, mich überrascht gar nichts mehr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Above the Middle Mountains. Beautiful city, truely it is!");
talkEntry:addResponse("Archmage Morgan came from Salkamar, did you know that?");
talkEntry:addResponse("Oh how I long for it's streets.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Oberhalb der Mittelberge - eine schöne Stadt, das ist es wahrhaftig.");
talkEntry:addResponse("Erzmagier Morgan stammt aus Salkamar, wußtet ihr das?");
talkEntry:addResponse("Oh, wie ich mich nach den Gassen von Salkamar sehne.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I worship Irmorom and Elara - two gods are enough for one halfling!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich bete zu Irmorom und Elara - zwei Götter müssen für einen Halbling reichen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara brings us all knowledge. At least, that is what I believe.");
talkEntry:addResponse("Elara's blessings elevated one.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elara");
talkEntry:addResponse("Elara gewährt uns all unser Wissen - daran glaube ich fest.");
talkEntry:addResponse("Elaras Segen, mein Großer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Only dwarves really pray to Irmorom. Everyone else takes what he grants for granted, as it seems.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Nur Zwerge beten wirklich zu Irmorom. Anscheinend nimmt Jedermann seine Gaben als selbstverständlich hin.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Did you know only we from Runewick have such marvelous clothing? I wonder what rags the people of Galmair wear.");
talkEntry:addResponse("My robes are the finest in the land!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Wußtet ihr, dass nur wir in Runewick hier so feine Kleidung haben? Ich frage mich, in was für Lumpen die Leute in Galmair rumrennen.");
talkEntry:addResponse("Meine Roben sind die besten im ganzen Land.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Timotheus");
talkEntry:addResponse("Yes, I am Timotheus. Ti-mo-the-us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Timotheus");
talkEntry:addResponse("Ja, ich bin Timotheus. Ti-mo-the-us.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Yes? Yes to what?");
talkEntry:addResponse("Yes? I'm happy you agree...");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Ja? Wozu ja?");
talkEntry:addResponse("Ja? Freut mich, dass ihr zustimmt.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("No to what?");
talkEntry:addResponse("No? You don't like my robes?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nein zu was?");
talkEntry:addResponse("Nein? Ihr mögt meine Roben nicht?");
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
talkingNPC:addCycleText("Die feinsten Roben, Westen und Hemden! Niemals mehr wie ein Landstreicher herumlaufen!", "The finest robes, vests, shirts! Do not ever walk around like a bum again.");
talkingNPC:addCycleText("#me streicht seine blaue Satinrobe glatt. Orangene Stickereien zieren die Ärmel.", "#me straightens his blue satin robes. They are adorned with orange filigree on the sleeves.");
talkingNPC:addCycleText("#me schaut sich kurz um und wendet sich dann wieder einem Buch zu.", "#me looks around for a moment before returning to his book.");
talkingNPC:addCycleText("#me blättert die Seiten eines Buches um.", "#me turns the page of his book.");
talkingNPC:addCycleText("#me kichert auf einmal: 'Oh, entschuldigt. Der Mann, der dies hier schrieb, ist einfach brilliant.", "#me suddenly giggles: 'Oh, my apologies. The man who wrote this is simply brilliant.'");
talkingNPC:addCycleText("#me murmelt vor sich hin: '...und so verließ Mesha Gobblesworth den Rat nach seinem Wutanfall. Er würde nicht mehr sehen, wie...'. Er verstummt anschließend.", "#me begins to mumble: '...and so Mesha Gobblesworth left the council after an outburst of aggression. He wouldn't see...'. He turns silent again.");
talkingNPC:addCycleText("Heda! Eure Kleidung sieht schäbig aus, ich hätte da was passendes.", "Lo! Your clothes look ugly. I have something fitting for you.");
talkingNPC:addCycleText("Ich habe die besten Umhänge weit und breit. Kauft oder seht häßlich aus.", "I have the best cloaks around. Buy or look ugly, your decision.");
talkingNPC:addCycleText("Satin! Brokat! Seide! Leinen!", "Satin! Brocade! Silk! Linen!");
talkingNPC:addCycleText("Ihr da! Ein Hut würde eurem Kopf gut tun. Schlimmer kanns ja nicht mehr werden...", "You! A hat would suit your head well. Can't become any worse...");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(6,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(47,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(58,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2659,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2746,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2781,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(384,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2295,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(54,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(174,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(175,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(176,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(177,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(178,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(179,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(807,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(808,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(809,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(810,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(811,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(812,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(813,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(385,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(800,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(801,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(802,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(803,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(804,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(805,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(806,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(833,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(834,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(835,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(836,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(837,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(838,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(845,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(846,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(847,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(848,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(849,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(850,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(851,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(852,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2678,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2679,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2680,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2681,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2682,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2683,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(180,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(181,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(182,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(457,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(458,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(839,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(841,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(842,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(843,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(50,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(63,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(168,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(170,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(34,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(183,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(459,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(460,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(461,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(821,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(822,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(823,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(824,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(825,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(826,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(827,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(814,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(815,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(816,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(817,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(818,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(819,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(820,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(55,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(193,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(194,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(195,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(196,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(368,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(547,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(548,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(558,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2377,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2378,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2380,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2384,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2416,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2418,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2419,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2420,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2421,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(357,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(358,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(370,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(371,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(828,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(829,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(830,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(831,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(832,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(48,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(53,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(97,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(356,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(362,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(363,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(364,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(365,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(366,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(367,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(369,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(526,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(527,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(697,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(698,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2113,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2114,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(6,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(47,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(58,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2659,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2746,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2781,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(384,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2295,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(54,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(174,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(175,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(176,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(177,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(178,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(179,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(807,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(808,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(809,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(810,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(811,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(812,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(813,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(385,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(800,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(801,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(802,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(803,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(804,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(805,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(806,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(833,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(834,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(835,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(836,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(837,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(838,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(845,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(846,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(847,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(848,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(849,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(850,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(851,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(852,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2678,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2679,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2680,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2681,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2682,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2683,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(180,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(181,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(182,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(457,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(458,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(839,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(840,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(841,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(842,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(843,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(50,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(63,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(168,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(170,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(34,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(183,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(459,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(460,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(461,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(821,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(822,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(823,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(824,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(825,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(826,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(827,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(814,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(815,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(816,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(817,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(818,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(819,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(820,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(55,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(193,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(194,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(195,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(196,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(368,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(547,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(548,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(558,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2377,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2378,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2380,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2384,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2416,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2418,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2419,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2420,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2421,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(357,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(358,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(370,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(371,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(828,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(829,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(830,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(831,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(832,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(48,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(53,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(97,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(356,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(362,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(363,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(364,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(365,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(366,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(367,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(369,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(526,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(527,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(697,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(698,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2113,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2114,"buyPrimary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(5);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schneider Timotheus.", "This NPC is the tailor Timotheus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 811);
mainNPC:setEquipment(11, 193);
mainNPC:setEquipment(5, 47);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 367);
mainNPC:setEquipment(10, 369);
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
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