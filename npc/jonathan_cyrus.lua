--------------------------------------------------------------------------------
-- NPC Name: Jonathan Cyrus                                           Cadomyr --
-- NPC Job:  glass goods trader                                               --
--                                                                            --
-- NPC Race: human                      NPC Position:  125, 603, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: September 30, 2012                      easyNPC Parser v1.21 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 125, 603, 0, 4, 'Jonathan Cyrus', 'npc.jonathan_cyrus', 0, 2, 6, 192, 107, 5, 183, 130, 88);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.consequence.trade")
require("npc.base.talk")
require("npc.base.trade")
module("npc.jonathan_cyrus", package.seeall)

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
talkEntry:addResponse("I buy any kind of glass goods. You can also obtain candles from me.");
talkEntry:addResponse("I'll gladly show you my offer of glass wares and candles.");
talkEntry:addResponse("You can get here anything you need for a perfect dinner.");
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
talkEntry:addResponse("Ich handel aller Art Glaswaren. Ebenso könnt ihr Kerzen bei mir erwerben.");
talkEntry:addResponse("Gerne zeige ich euch mein Angebot an Glaswaren und Kerzen.");
talkEntry:addResponse("Hier bekommt ihr alles, was ihr für ein perfektes Abendessen braucht.");
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
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the glass goods trader Jonathan Cyrus. Keywords: buy, sell, trade, Hello, glass."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Glaswarenhändler Jonathan Cyrus. Schlüsselwörter: kaufe, verkaufe, Handel, Hallo, Glas."));
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
talkEntry:addResponse("Greetings, in the name of our Queen Rosaline! Do you need any glasses, just ask.");
talkEntry:addResponse("It is a wonderful day in Cadomyr, governed by our magnificient - and beautiful - queen.");
talkEntry:addResponse("Hello.");
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
talkEntry:addResponse("Seid gegrüßt, bei unserer Königin Rosaline.");
talkEntry:addResponse("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
talkEntry:addResponse("Hallo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Greetings, in the name of our Queen Rosaline! Do you need any glasses, just ask.");
talkEntry:addResponse("It is a wonderful day in Cadomyr, governed by our magnificient - and beautiful - queen.");
talkEntry:addResponse("Hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addResponse("Seid gegrüßt, bei unserer Königin Rosaline.");
talkEntry:addResponse("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
talkEntry:addResponse("Hallo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Farewell");
talkEntry:addTrigger("Bye");
talkEntry:addTrigger("Fare well");
talkEntry:addTrigger("See you");
talkEntry:addResponse("Go with the blessing of the Queen.");
talkEntry:addResponse("Fare thy well, and come back one day.");
talkEntry:addResponse("One advises: Do not venture too far away, you will not find anything comparable with Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Tschüß");
talkEntry:addTrigger("Tschüss");
talkEntry:addTrigger("Wiedersehen");
talkEntry:addTrigger("Gehab wohl");
talkEntry:addResponse("Geht mit dem Segen der Königin.");
talkEntry:addResponse("Gehabt euch wohl und kommt eines Tages wieder.");
talkEntry:addResponse("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Go with the blessing of the Queen.");
talkEntry:addResponse("Fare thy well, and come back one day.");
talkEntry:addResponse("One advises: Do not venture too far away, you will not find anything comparable with Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addResponse("Geht mit dem Segen der Königin.");
talkEntry:addResponse("Gehabt euch wohl und kommt eines Tages wieder.");
talkEntry:addResponse("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("How are you");
talkEntry:addTrigger("How do you feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Let us not talk about feelings but about business.");
talkEntry:addResponse("I am doing well, just yesterday I saw the queen!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Wie geht");
talkEntry:addTrigger("Wie fühlst");
talkEntry:addTrigger("Wie ist es ergangen");
talkEntry:addResponse("Lasst uns nicht über Gefühle sondern übers Geschäft reden.");
talkEntry:addResponse("Mir geht es bestens, gestern gerade habe ich die Königin gesehen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("your name");
talkEntry:addTrigger("who are you");
talkEntry:addTrigger("who art thou");
talkEntry:addResponse("Jonathan Cyrus. Call me John and you will regret it.");
talkEntry:addResponse("You are in the glassware shop of Cyrus.");
talkEntry:addResponse("For my good customers, I go by the name of Jonathan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("ihr name");
talkEntry:addTrigger("dein name");
talkEntry:addTrigger("wer bist du");
talkEntry:addTrigger("wer seid ihr");
talkEntry:addTrigger("wie heißt");
talkEntry:addResponse("Jonathan Cyrus. Nennt mich John und ihr werdet es bereuen.");
talkEntry:addResponse("Ihr seid im Glaswarenladen Cyrus.");
talkEntry:addResponse("Für meine guten Kunden heiße ich Jonathan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Adventures? Now, glassblowing is truly a learning adventure in itself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addResponse("Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("task");
talkEntry:addTrigger("adventure");
talkEntry:addTrigger("order");
talkEntry:addResponse("Adventures? Now, glassblowing is truly a learning adventure in itself.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addTrigger("Befehl");
talkEntry:addResponse("Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("Iglassware.");
talkEntry:addResponse("Icandles and glassware.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("beruf");
talkEntry:addResponse("Ich handel mit Glaswaren");
talkEntry:addResponse("Ich handel mit Kerzen und Glaswaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("job");
talkEntry:addResponse("Iglassware.");
talkEntry:addResponse("Icandles and glassware.");
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkEntry:addConsequence(npc.base.consequence.trade.trade(tradingNPC));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("job");
talkEntry:addResponse("Ich handel mit Glaswaren");
talkEntry:addResponse("Ich handel mit Kerzen und Glaswaren.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Apologies I do not know much about that island Gobaith, only that some refugees once came from there to Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addResponse("Entschuldigt, aber ich weiß nicht viel über diese Insel Gobaith, lediglich, dass einige Flüchtling von dort nach Cadomyr einst kamen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("my name");
talkEntry:addResponse("Very pleased to meet you. How about we talk about glassware?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("mein Name");
talkEntry:addResponse("Sehr erfreut. Wollen wir vielleicht über Glaswaren reden?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Rutrus");
talkEntry:addResponse("I know Rutrus, he lives at the Oasis of Stars.");
talkEntry:addResponse("Rutrus, well, I think his head was exposed too long to the scorching sun.");
talkEntry:addResponse("I used quartz sand from time to time purchased from Rutrus, until he started talking to his shovel.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Rutrus");
talkEntry:addResponse("Ich kenne Rutrus, er lebt bei der Sternenoase.");
talkEntry:addResponse("Rutrus, nun, ich glaube, sein Kopf war zulange der brennenden Sonne ausgesetzt.");
talkEntry:addResponse("Früher habe ich von Zeit zu Zeit Quarzsand von Rutrus gekauft, bis er angefangen hat, mit seiner Schaufel zu reden.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oase");
talkEntry:addResponse("Die Sternenoase ist außerhalb der Stadtmauern. Schützt euer Gesicht vor Flugsand, wenn ihr durch die Wüste wandert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Oasis");
talkEntry:addResponse("The Oasis of Stars is outside the city walls. Protect your face from blowing sand when you walk through the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Sand");
talkEntry:addResponse("The sand is everywhere here in Cadomyr. It is both a blessing and curse .");
talkEntry:addResponse("You will need a lot of sand for glass blowing. Only fine sand is suitable for the coarse sand is not pure enough.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sand");
talkEntry:addResponse("Der Sand ist allgegenwärtig hier in Cadomyr. Er ist Segen und Fluch zugleich.");
talkEntry:addResponse("Ihr werdet viel Sand zum Glasblasen benötigen. Nur feiner Sand ist geeignet, grober Sand ist zu unrein.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("glas");
talkEntry:addResponse("Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
talkEntry:addResponse("The art of glassblowing is very demanding, but I will make sure it is never forgotten.");
talkEntry:addResponse("It was reported to me once you could concentrate the rays of the sun with a glass into a lethal weapon. What a humbug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("glas");
talkEntry:addResponse("Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
talkEntry:addResponse("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
talkEntry:addResponse("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("trader");
talkEntry:addTrigger("merchant");
talkEntry:addTrigger("collegue");
talkEntry:addTrigger("vendor");
talkEntry:addTrigger("market");
talkEntry:addResponse("Need some forged goods? Clothing? You can find anything here at the marketplace of Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("händler");
talkEntry:addTrigger("kollege");
talkEntry:addTrigger("höker");
talkEntry:addTrigger("markt");
talkEntry:addResponse("Braucht ihr Schmiedewaren? Kleidung? Ihr findet alles hier auf dem Marktplatz von Cadomyr.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("archmage");
talkEntry:addResponse("Oh, please, spare with me with any news from the archmage. He always lies anyway.");
talkEntry:addResponse("Elvaine Morgan, you could too easily have said 'The Lying Baron' instead.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Erzmagier");
talkEntry:addResponse("Oh bitte, erspart mir irgendwelche Neuigkeiten vom Erzmagier. Der lügt wie gedruckt.");
talkEntry:addResponse("Elvaine Morgan, ihr hättet auch einfach sagen können, 'Der Lügenbaron'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Oh, please, spare with me with any news from the archmage. He always lies anyway.");
talkEntry:addResponse("Elvaine Morgan, you could too easily have said 'The Lying Baron' instead.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addResponse("Oh bitte, erspart mir irgendwelche Neuigkeiten vom Erzmagier. Der lügt wie gedruckt.");
talkEntry:addResponse("Elvaine Morgan, ihr hättet auch einfach sagen können, 'Der Lügenbaron'.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick is a place of books, boredom and laziness.");
talkEntry:addResponse("If you ever get to Runewick, will you sell the people there some of my vials please?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Runewick");
talkEntry:addResponse("Runewick ist ein Ort der Bücher, der Langeweile und der Faulheit.");
talkEntry:addResponse("Wenn ihr jemals nach Runewick kommt, verkauft ihr den Leuten dort ein paar meiner Phiolen, bitte?");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Valerio Guilianni is the Don of Galmair. There is nothing more to say.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addResponse("Valerio Guilianni ist der Don von Galmair. Mehr gibt es da nicht zu sagen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Never go to Galmair if you want to experience tomorrow.");
talkEntry:addResponse("Galmair is a place of thieves and scoundrels.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Galmair");
talkEntry:addResponse("Geht niemals nach Galmair, wenn ihr den Morgen erleben wollt.");
talkEntry:addResponse("Galmair ist ein Ort der Diebe und Halunken.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Queen");
talkEntry:addResponse("Our Queen came to power by way of the old customs. Who acts against it, acts against our old customs.");
talkEntry:addResponse("Psst, don't you think it is already too longto remain unmarried?");
talkEntry:addResponse("My Queen is everything to me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Königin");
talkEntry:addResponse("Unsere Königin kam an die Macht, ganz nach den alten Sitten. Wer also gegen sie handelt, handelt gegen unsere alten Gebräuche.");
talkEntry:addResponse("Psst, denkt ihr nicht auch, sie ist zu schön, um allzulange unverheiratet zu sein?");
talkEntry:addResponse("Die Königin bedeutet mir alles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Our Queen came to power by way of the old customs. Who acts against it, acts against our old customs.");
talkEntry:addResponse("Psst, don't you think it is already too longto remain unmarried?");
talkEntry:addResponse("My Queen is everything to me!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addResponse("Unsere Königin kam an die Macht, ganz nach den alten Sitten. Wer also gegen sie handelt, handelt gegen unsere alten Gebräuche.");
talkEntry:addResponse("Psst, denkt ihr nicht auch, sie ist zu schön, um allzulange unverheiratet zu sein?");
talkEntry:addResponse("Die Königin bedeutet mir alles!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr is a land of sand and stone, but we have made the best out of it.");
talkEntry:addResponse("Cadomyr, oh, Cadomyr, how much I like to dwell here!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Cadomyr");
talkEntry:addResponse("Cadomyr ist ein Land aus Sand und Stein. Aber wir haben das beste daraus gemacht.");
talkEntry:addResponse("Cadomyr, oh Cadomyr, wie gerne wohn' ich hier!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("albar");
talkEntry:addResponse("We all have ancestors from Albar. But now our fate lies in the hands of the Queen.");
talkEntry:addResponse("We honour the traditions of Albar. The Queen does as well, yes, a female sovereign. This is never in question!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("albar");
talkEntry:addResponse("Wir alle haben Vorfahren aus Albar. Nun aber liegt unser Schicksal in der Hand der Königin.");
talkEntry:addResponse("Wir ehren die Gebräuche Albars. Die Königin tut dies ebenso, ja, ein weiblicher Souverän. Stellt dies niemals in Frage!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addResponse("It is all the same to me, what is going on in Gynk. Most probably, the people there just slit each other's throats.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("gync");
talkEntry:addTrigger("gynk");
talkEntry:addResponse("Es ist mir einerlei, was in Gynk vor sich geht. Wahrscheinlich schlitzen sich die Leute dort gerade gegenseitig die Kehlen auf.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Oh, please, do not talk about them in public. The queen does not like it.");
talkEntry:addResponse("Shh!");
talkEntry:addResponse("Quiet!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("salkama");
talkEntry:addResponse("Oh, bitte sprecht darüber nicht in aller Öffentlichkeit. Die Königin mag das nicht.");
talkEntry:addResponse("Psst!");
talkEntry:addResponse("Still!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("god");
talkEntry:addResponse("I respect all gods, but those who I worship are Irmorom and Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Gott");
talkEntry:addTrigger("Götter");
talkEntry:addResponse("Ich respektiere alle Götter, aber die, die ich anbete, sind Irmorom und Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Of course I always pray to Irmorom before I fire up the furnace, but I really do adore Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Irmorom");
talkEntry:addResponse("Natürlich betet ich stets zu Irmorom, bevor ich den Schmelzofen anfeuere. Aber wirklich verehren tu ich Adron.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Truly, Adron is my saviour. Without him, nobody would enjoy a good wine and I would no longer be able to sell anything.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Adron");
talkEntry:addResponse("Fürwahr, Adron ist mein Heiland. Ohne ihn würde niemand mehr einen guten Tropfen Wein genießen und ich würde nichts mehr verkaufen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
talkEntry:addResponse("The art of glassblowing is very demanding, but I will make sure it is never forgotten.");
talkEntry:addResponse("It was reported to me once you could concentrate the rays of the sun with a glass into a lethal weapon. What a humbug!");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("erzähl was");
talkEntry:addTrigger("erzähl etwas");
talkEntry:addResponse("Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
talkEntry:addResponse("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
talkEntry:addResponse("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addTrigger("Jonathan");
talkEntry:addTrigger("Cyrus");
talkEntry:addResponse("No, my daughter is not called Miley.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Jonathan");
talkEntry:addTrigger("Cyrus");
talkEntry:addResponse("Nein, meine Tochter heißt nicht Miley.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Yes");
talkEntry:addResponse("The Queen's favourite word: 'Yes'.");
talkEntry:addResponse("Fine.");
talkEntry:addResponse("You may want to take a look at my goods.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Ja");
talkEntry:addResponse("Das Lieblingswort der Königin: 'Ja'.");
talkEntry:addResponse("Fein.");
talkEntry:addResponse("Vielleicht wollt ihr einen Blick auf meine Waren werfen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("No");
talkEntry:addResponse("Well, maybe I can delight you with some candles instead?");
talkEntry:addResponse("No?");
talkEntry:addResponse("Why do you resist?");
talkEntry:addResponse("You can say 'no', until you meet the Queen.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Nein");
talkEntry:addResponse("Nun, kann ich euch stattdessen mit einigen Kerzen beglücken?");
talkEntry:addResponse("Nein?");
talkEntry:addResponse("Wieso widersprecht ihr?");
talkEntry:addResponse("Ihr könnt solange 'Nein' sagen, bis ihr der Königin gegenübersteht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
talkingNPC:addCycleText("Was immer ihr braucht - ich habe es.", "Whatever you need - I have it.");
talkingNPC:addCycleText("Beste Glaswaren!", "Best glassware!");
talkingNPC:addCycleText("Kommt her, schaut euch an, was ich zu bieten habe.", "Come, you look at what I have to offer.");
talkingNPC:addCycleText("Kerzen, helle Kerzen!", "Candles, bright candles!");
talkingNPC:addCycleText("#me wischt einen Glaskelch mit einem seidenen Tuch ab.", "#me polishes a glass goblet with a silk cloth.");
talkingNPC:addCycleText("Glitzernde Glaswaren, nur heute, nur für euch!", "Sparkling glassware, just today, just for you!");
talkingNPC:addCycleText("#me schnüffelt an einer Kerze: 'Bestes Bienenwachs!'.", "#me sniffs a candle: 'Best bees wax!'.");
talkingNPC:addCycleText("Ich habe beste Kerzen im Angebot. Mögen sie euch ein Leuchtfeuer in der Dunkelheit sein.", "I have the best candles on sale. May they be a beacon of light in the darkest night.");
talkingNPC:addCycleText("Bierkrüge für Zwergenbier, feinste Kelche für Elfenwein - aus meinen Gütern schmeckt jedes Gebräu.", "Beer mugs for dwarven beer, fine goblets for elven wine - out of my goods any brew is tastier.");
talkingNPC:addCycleText("Das transparente Gold Cadomyrs: Glas!", "The transparent gold of Cadomyr: Glass!");
tradingNPC:addItem(npc.base.trade.tradeNPCItem(311,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(312,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(315,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2457,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(41,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(314,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(316,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(726,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(429,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(43,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(391,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(431,"sell"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(311,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(312,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(164,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(315,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1317,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(1908,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2055,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2457,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(2498,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(41,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(314,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(316,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(726,"buyPrimary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(429,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(43,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(391,"buySecondary"));
tradingNPC:addItem(npc.base.trade.tradeNPCItem(431,"buySecondary"));
tradingNPC:addNotEnoughMoneyMsg("Oh, ich fürchte Ihr könnt Euch das nicht leisten.", "Oh, I fear, you can not afford that.");
tradingNPC:addDialogClosedMsg("Vielen Dank, beehrt mich bald wieder!", "Thank you, please come again!");
tradingNPC:addDialogClosedNoTradeMsg("Auf Bald!", "Farewell!");
tradingNPC:addWrongItemMsg("Das kaufe ich nicht.", "I'm not buying this.");
mainNPC:addLanguage(0);
mainNPC:addLanguage(1);
mainNPC:setDefaultLanguage(0);
mainNPC:setLookat("Dieser NPC ist Glaswarenhändler Jonathan Cyrus.", "This NPC is the glass goods trader Jonathan Cyrus.");
mainNPC:setUseMessage("Fass mich nicht an!", "Do not touch me!");
mainNPC:setConfusedMessage("#me schaut dich verwirrt an.", "#me looks at you confused.");
mainNPC:setEquipment(1, 0);
mainNPC:setEquipment(3, 180);
mainNPC:setEquipment(11, 2416);
mainNPC:setEquipment(5, 0);
mainNPC:setEquipment(6, 0);
mainNPC:setEquipment(4, 48);
mainNPC:setEquipment(9, 827);
mainNPC:setEquipment(10, 770);
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