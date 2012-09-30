--------------------------------------------------------------------------------
-- NPC Name: Thomas Dalenus                                           Cadomyr --
-- NPC Job:  Tailor                                                           --
--                                                                            --
-- NPC Race: human                      NPC Position:  113, 611, 0            --
-- NPC Sex:  male                       NPC Direction: north                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: September 30, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 113, 611, 0, 0, 'Thomas Dalenus', 'npc.thomas_dalenus', 0, 3, 0, 242, 182, 0, 184, 131, 89);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.thomas_dalenus", package.seeall)

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
talkEntry:addResponse("Robes, dresses, capes, shirts, trousers... what do you need, I have everything.");
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
talkEntry:addResponse("Roben, Kleider, Umhänge, Hemden, Hosen,... was braucht ihr, ich habe alles.");
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the tailor Thomas Dalenus. Keywords: buy, sell, trade, Hello, tailor, Cadomyr, needle, dye."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist der Schneider Thomas Dalenus. Schlüsselwörter: kaufe, verkaufe, Handel, Hallo, Schneider, Cadomyr, Nadel, Färben."));
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
talkEntry:addResponse("Good day. Do you need a coat?");
talkEntry:addResponse("Greetings. How are you?");
talkEntry:addResponse("Hello. I have all kinds of clothes.");
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
talkEntry:addResponse("Guten Tag. Braucht ihr einen Umhang?");
talkEntry:addResponse("Seid gegrüßt. Wie geht es euch?");
talkEntry:addResponse("Hallo. Ich habe vielerlei Stoffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Good day. Do you need a coat?");
talkEntry:addResponse("Greetings. How are you?");
talkEntry:addResponse("Hello. I have all kinds of clothes.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Guten Tag. Braucht ihr einen Umhang?");
talkEntry:addResponse("Seid gegrüßt. Wie geht es euch?");
talkEntry:addResponse("Hallo. Ich habe vielerlei Stoffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Farewell, go with the gods.");
talkEntry:addResponse("Good bye, my customer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Gehabt euch wohl, geht mit den Göttern.");
talkEntry:addResponse("Auf wiedersehen, mein Kunde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Farewell, go with the gods.");
talkEntry:addResponse("Good bye, my customer.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addResponse("Gehabt euch wohl, geht mit den Göttern.");
talkEntry:addResponse("Auf wiedersehen, mein Kunde.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("I just finished this robe. Maybe you want to take a look at it?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Ich habe gerade diese Robe fertiggestellt. Wollt ihr sie euch ansehen?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("My name is Thomas, Thomas Dalenus. I'm a tailor.");
talkEntry:addResponse("Dalenus' tailored goods - that is my business.");
talkEntry:addResponse("Thomas Dalenus. And do not call me Tom or I'll sting my needle into your eye.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Mein Name ist Thomas, Thomas Dalenus. Ich bin ein Schneider.");
talkEntry:addResponse("Dalenus Schneiderwaren - das ist mein Geschäft.");
talkEntry:addResponse("Thomas Dalenus. Und nennt mich nicht Tom, sonst stech ich euch die Augen mit meiner Nadel aus.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("If you are searching for a quest, go to Cape Farewell or the Oasis of Stars. There are persons who need your help.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Wenn ihr nach einem Abenteuer sucht, geht zum Kap des Abschiedes oder der Sternenoase. Dort wird eure Hilfe gebraucht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I'm a tailor, I even made a dress for the queen once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("I'm a tailor, I even made a dress for the queen once.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich bin Schneider, einst habe ich sogar ein Kleid für die Königin geschneidert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Let's not talk about sad things, please.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Lasst uns doch bitte nicht von traurigen Dingen reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("And I am Thomas Dalenus; you could use a new coat if you ask me.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Und ich bin Thomas Dalenus; ihr könntet einen neuen Mantel vertragen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tailor");
talkEntry:addResponse("When I made the dress of queen Rosaline, I worked all day and night. It was such a honour! Is there anything I can tailor for you?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Schneider");
talkEntry:addResponse("Als ich das Kleid der Königin Rosaline gefertigt habe, hab ich den ganzen Tag und die ganze Nacht gearbeitet. Es war so eine Ehre! Gibt es etwas, was ich für dich schneidern kann?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("The amount of goods,d on this marketplace, is magnificient. We're not a people ofrs, but everyone needs something sometimes.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Die Menge an Waren, die auf diesem Markt gehandelt werden, sind schon beeindruckend. Wir sind zwar kein Volk von Händlern, aber jeder braucht mal etwas.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("dye");
talkEntry:addResponse("To dye clothes is tricky. You need various ingredients like herbs. Better buy dyed clothes from me instead of wasting your time.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("färbe");
talkEntry:addTrigger("farbe");
talkEntry:addResponse("Stoffe zu Färben ist aufwändig. Man braucht eine Reihe von Wirkstoffen, so wie Kräuter. Kauft besser gefärbte Stoffe direkt bei mir.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("needle");
talkEntry:addResponse("I can sell you a needle, but be careful, they are pointed.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nadel");
talkEntry:addResponse("Ich kann euch eine Nadel verkaufen, aber vorsichtig, sie ist spitz.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("cloth");
talkEntry:addResponse("I sell any kind of cloth.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Stoff");
talkEntry:addResponse("Ich verkaufe vielerei Stoffe.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("You are talking about Elvaine Morgan, the archmage of Runewick? I keep forgetting his name.");
talkEntry:addResponse("Who is that again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Ihr redet von Elvaine Morgan, dem Erzmagier von Runewick? Ich vergesse immer wieder seinen Namen.");
talkEntry:addResponse("Wer war das nochmal?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("You are talking about Elvaine Morgan, the archmage of Runewick? I keep forgetting his name.");
talkEntry:addResponse("Who is that again?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Ihr redet von Elvaine Morgan, dem Erzmagier von Runewick? Ich vergesse immer wieder seinen Namen.");
talkEntry:addResponse("Wer war das nochmal?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("I was told they prefer silk in Runewick.");
talkEntry:addResponse("Runewick, well, trading with Runewick takes too long, all this talking.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Mir wurde erzählt, dass man in Runewick Seide bevorzugt.");
talkEntry:addResponse("Runewick, nun, ein Handel mit Runewick dauert immer so lange, immer dieses Gelaber.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("The Don once ordered trousers for his ruffians from me. I refused, of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Der Don hat einst Hosen für seine Schlägertrupps bei mir bestellt. Ich hab abgelehnt, wie sich von selbst versteht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("I am honest; I do not like Galmair. I prefer towith honourable men.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Ich bin ganz ehrlich; ich mag Galmair nicht. Ich ziehe es vor, mit ehrbahren Leuten zu handeln.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Did you notice the blue dress the queen wears from time to mine? My work!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Habt ihr das blaue Kleid bemerkt, welches die Königin manchmal trägt? Mein Meisterwerk!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Did you notice the blue dress the queen wears from time to mine? My work!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Habt ihr das blaue Kleid bemerkt, welches die Königin manchmal trägt? Mein Meisterwerk!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("I tailor for the queen, I tailor for every noble man of Cadomyr. And for every woman, of course.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Ich schneidere für die Königin, ich schneider für jeden Edelmann von Cadomyr. Und für jede Dame, wie sich von selbst versteht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("Once, the lords of Albar ordered a shipment of clothes. But somehow, they never payed me. I suspect Galmairian thugs are behind this!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Einst bestellten die Herren von Albar eine Ladung Stoffe. Aber irgendwie wurde ich nie entlohnt. Ich vermute, dass Halunken aus Galmair dahinterstecken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("I will neverwith anyone from Gynk. They never fulfill a contract.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Ich werde niemals mit jemanden aus Gynk handeln. Die halten sich nicht an geschlossene Verträge.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("The women of Salkamar are too thin, I was told. Who can tailor a dress for a dash?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Die Damen aus Salkamar sind alle zu dünn, sagt man. Wie soll man für einen Strich in der Landschaft ein Kleid schneidern?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("When I don't work, I sometimes pray to Irmorom; but with little effects as it seems.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Wenn ich mal nicht arbeite, bete ich manchmal zu Irmorom; viel hats bis jetzt nicht gebracht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom guides my hands while stitching. I wonder why I sting myself that often with the needle!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Irmorom führt meine Hand, wenn ich sticke. Ich frag mich, warum ich mich trotzdem so oft mit der Nadel steche.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachin is the god of battles and hunting. I'd like to fight and hunt, too, but I'm better at tailoring.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Malachin");
talkEntry:addTrigger("Malachín");
talkEntry:addResponse("Malachin ist der Gott der Schlachten und der Jagd. Ich würde auch gerne Kämpfen und Jagen, aber ich bin besser in der Schneiderei.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Never trade with Galmair. Just saying.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Handelt niemals mit Galmair, sage ich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("I don't understand you.");
talkEntry:addResponse("Sorry?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Pardon?");
talkEntry:addResponse("Ich hab das nicht verstanden.");
talkEntry:addResponse("Entschuldigt?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("What?");
talkEntry:addResponse("How...");
talkEntry:addResponse("Could you rephrase that?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Was?");
talkEntry:addResponse("Wie jetzt...");
talkEntry:addResponse("Könntet ihr das anders beschreiben?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Thomas");
talkEntry:addTrigger("Dalenus");
talkEntry:addResponse("There are many by the name of Thomas, but few of the name Dalenus. And only one Thomas Dalenus, best tailor of Cadomyr!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Thomas");
talkEntry:addTrigger("Dalenus");
talkEntry:addResponse("Es gibt viele, die Thomas heißen, aber nur wenige namens Dalenus. Und nur einen Thomas Dalenus, den besten Schneider Cadomyrs!");
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
talkingNPC:addCycleText("Autsch!", "Ouch!");
talkingNPC:addCycleText("#me zerschneidet einige Stoffbahnen.", "#me cuts some clothes.");
talkingNPC:addCycleText("#me stickt ein Muster in ein Stoffstück.", "#me stitches a pattern into a piece of cloth.");
talkingNPC:addCycleText("Maßgeschneiderte Kleider für die Frau, Hüte für euch und Röcke für die Töchter!", "Tailored dresses for you wife, hats for you and a skirt for your daughter!");
talkingNPC:addCycleText("Kommt herein und findet heraus... was ich anzubieten habe!", "Come in and find out... what I have!");
talkingNPC:addCycleText("Kundschaft!", "Customers!");
talkingNPC:addCycleText("Einmal gekleidet sein wie Königin Rosaline - beste Kleider im Angebot.", "Once dressed like Queen Rosaline - I offer best dresses.");
talkingNPC:addCycleText("Thomas Dalenus ist euer Mann, wenn es um Stickereien geht!", "Thomas Dalenus is your man for stitching!");
talkingNPC:addCycleText("Eine Frau ohne Kleid ist meist nur halb so schön.", "A woman without a dress is commonly half as beautiful.");
talkingNPC:addCycleText("#me streicht ein fein gewobenes Kleid glatt.", "#me smoothes down a finely woven dress.");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(6,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(47,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(58,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2659,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2746,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2781,"sell"));
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
tradingNPC:addItem(npc.base.trade.tradeNPCItem(839,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(840,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(841,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(842,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(843,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(180,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(181,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(182,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(457,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(458,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(50,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(63,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(168,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(170,"sell"));
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
tradingNPC:addItem(npc.base.trade.tradeNPCItem(357,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(358,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(370,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(371,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(828,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(829,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(830,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(831,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(832,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(6,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(47,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(51,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(58,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2659,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2746,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2781,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(34,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(183,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(459,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(460,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(461,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(821,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(822,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(823,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(824,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(825,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(826,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(827,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(814,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(815,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(816,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(817,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(818,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(819,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(820,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(384,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2295,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(54,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(174,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(175,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(176,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(177,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(178,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(179,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(807,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(808,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(809,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(810,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(811,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(812,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(813,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(385,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(800,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(801,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(802,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(803,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(804,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(805,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(806,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(833,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(834,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(835,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(836,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(837,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(838,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(845,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(846,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(847,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(848,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(849,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(850,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(851,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(852,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2678,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2679,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2680,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2681,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2682,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2683,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(55,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(193,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(194,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(195,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(196,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(368,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(547,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(548,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(558,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2377,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2378,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2380,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2384,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2416,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2418,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2419,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2420,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2421,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(839,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(840,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(841,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(842,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(843,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(180,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(181,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(182,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(457,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(458,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(50,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(63,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(168,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(170,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(48,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(53,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(89,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(97,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(356,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(362,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(363,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(364,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(365,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(366,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(367,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(369,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(526,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(527,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(697,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(698,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2113,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2114,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(357,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(358,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(370,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(371,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(828,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(829,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(830,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(831,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(832,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist der Schneider Thomas Dalenus.", "This NPC is the tailor Thomas Dalenus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 458);
mainNPC:setEquipment(11, 2421);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 2295);
mainNPC:setEquipment(9, 823);
mainNPC:setEquipment(10, 53);
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