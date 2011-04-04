--------------------------------------------------------------------------------
-- NPC Name: Jonathan Cyrus                                           Cadomyr --
-- NPC Job:  glass goods trader                                               --
--                                                                            --
-- NPC Race: human                      NPC Position:  125, 603, 0            --
-- NPC Sex:  male                       NPC Direction: south                  --
--                                                                            --
-- Author:   Estralis Seborian                                                --
--                                                                            --
-- Last parsing: April 04, 2011                          easyNPC Parser v1.02 --
--------------------------------------------------------------------------------

--[[SQL
INSERT INTO "npc" ("npc_type", "npc_posx", "npc_posy", "npc_posz", "npc_faceto", "npc_name", "npc_script", "npc_sex", "npc_hair", "npc_beard", "npc_hairred", "npc_hairgreen", "npc_hairblue", "npc_skinred", "npc_skingreen", "npc_skinblue") 
VALUES (0, 125, 603, 0, 4, 'Jonathan Cyrus', 'npc.jonathan_cyrus', 0, 2, 6, 192, 107, 5, 183, 130, 88);
---]]

require("npc.base.basic")
require("npc.base.condition.language")
require("npc.base.consequence.inform")
require("npc.base.talk")
module("npc.jonathan_cyrus", package.seeall)

function initNpc()
mainNPC = npc.base.basic.baseNPC();
local talkingNPC = npc.base.talk.talkNPC(mainNPC);
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Help");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Game Help] This NPC is the glass goods trader Jonathan Cyrus. Keyphrases: Hello, glass."));
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hilfe");
talkEntry:addConsequence(npc.base.consequence.inform.inform("[Spielhilfe] Dieser NPC ist Glaswarenhändler Jonathan Cyrus. Schlüsselwörter: Hallo, Glas."));
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
talkEntry:addResponse("Hail, by queen Rosaline! Do you need any glasses, just ask.");
talkEntry:addResponse("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
talkEntry:addResponse("Hello.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Grüß");
talkEntry:addTrigger("Gruß");
talkEntry:addTrigger("Guten Tag");
talkEntry:addTrigger("Guten Abend");
talkEntry:addTrigger("Mahlzeit");
talkEntry:addTrigger("Tach");
talkEntry:addTrigger("Moin");
talkEntry:addResponse("Seid gegrüßt, bei unserer Königin Rosaline.");
talkEntry:addResponse("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
talkEntry:addResponse("Hallo.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Hiho");
talkEntry:addTrigger("Hallo");
talkEntry:addTrigger("Hey");
talkEntry:addTrigger("Greeb");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Hail, by queen Rosaline! Do you need any glasses, just ask.");
talkEntry:addResponse("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
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
talkEntry:addResponse("Go with queensspeed.");
talkEntry:addResponse("Fare thy well, and come back one day.");
talkEntry:addResponse("One advise: Do venture too far. You will nothing like Cadomyr.");
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
talkEntry:addTrigger("Ciao");
talkEntry:addTrigger("Adieu");
talkEntry:addTrigger("Au revoir");
talkEntry:addTrigger("Farebba");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Go with queensspeed.");
talkEntry:addResponse("Fare thy well, and come back one day.");
talkEntry:addResponse("One advise: Do venture too far. You will nothing like Cadomyr.");
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
talkEntry:addTrigger("How feel");
talkEntry:addTrigger("How do you do");
talkEntry:addResponse("Let's not talk about feelings, let's talk about business.");
talkEntry:addResponse("I feel great, I saw the queen yesterday!");
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
talkEntry:addResponse("Jonathan Cyrus. Call me John and you'll regret it.");
talkEntry:addResponse("You're at Cyrus' glass goods store.");
talkEntry:addResponse("For my good customers, I go by Jonathan.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
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
talkEntry:addTrigger("quest");
talkEntry:addTrigger("mission");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
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
talkEntry:addResponse("Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Auftrag");
talkEntry:addTrigger("Aufgabe");
talkEntry:addTrigger("Abenteuer");
talkEntry:addResponse("Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("profession");
talkEntry:addResponse("I trade glass goods.");
talkEntry:addResponse("I trade candles and glass goods.");
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
talkEntry:addTrigger("job");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I trade glass goods.");
talkEntry:addResponse("I trade candles and glass goods.");
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
talkEntry:addTrigger("Gobaith");
talkEntry:addTrigger("Gobiath");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Pardon me? I don't know anything about that island Gobaith, just that some refugees came from there to Cadomyr.");
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
talkEntry:addResponse("Nice to meet you. How about we talk about glass goods?");
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
talkEntry:addTrigger("Rutrus");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I know Rutrus, he's living at the Oasis of Stars.");
talkEntry:addResponse("Rutrus, well, I think his head spent too much time under the burning sun.");
talkEntry:addResponse("In former times, I bought quartz sand from Rutrus, but then he started talking to his shovel.");
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
talkEntry:addResponse("The Oasis of Stars is beyond the town wall. Protect your face from sand when you walk through the desert.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("Sand");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Sand is omnipresent here in Cadomyr. It is blessing and curse at the same time.");
talkEntry:addResponse("You'll need plenty sand for glassblowing. But only fine sand, coarse sand is not pure enough.");
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
talkEntry:addTrigger("glas");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
talkEntry:addResponse("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
talkEntry:addResponse("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
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
talkEntry:addResponse("Need forged goods? Need clothes? You can find anything here at the marketplace of Cadomyr.");
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
talkEntry:addResponse("Oh, please, spare with me with any news from the archmage. He's lying anyway.");
talkEntry:addResponse("Elvaine Morgan, you could have said 'The Big Lier' instead.");
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
talkEntry:addTrigger("Elvaine");
talkEntry:addTrigger("Morgan");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, please, spare with me with any news from the archmage. He's lying anyway.");
talkEntry:addResponse("Elvaine Morgan, you could have said 'The Big Lier' instead.");
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
talkEntry:addTrigger("Runewick");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Runewick is a place of books, boredom and lazyness.");
talkEntry:addResponse("If you ever come to Runewick, sell them some vials of mine, will you?");
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
talkEntry:addTrigger("Valerio");
talkEntry:addTrigger("Guilianni");
talkEntry:addTrigger("Don");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Valerio Guilianni is the Don of Galmair. That is all there is to say.");
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
talkEntry:addTrigger("Galmair");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Never go to Galmair if you want to survice the night.");
talkEntry:addResponse("Galmair is a place of thugs and thieves.");
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
talkEntry:addResponse("Our queen came to power in compliance with the old customs. Who opposes her, opposes the old customs.");
talkEntry:addResponse("Shh, don't you think she is too beautiful to remain unmarried?");
talkEntry:addResponse("My queen is my everything!");
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
talkEntry:addTrigger("rosaline");
talkEntry:addTrigger("edwards");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Our queen came to power in compliance with the old customs. Who opposes her, opposes the old customs.");
talkEntry:addResponse("Shh, don't you think she is too beautiful to remain unmarried?");
talkEntry:addResponse("My queen is my everything!");
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
talkEntry:addTrigger("Cadomyr");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Cadomyr is a land of sand and stone. But we made the best out of it.");
talkEntry:addResponse("Cadomyr, oh, Cadomyr, I like to dwell just here!");
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
talkEntry:addTrigger("albar");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("All of us have ancestors in Albar. However, our fate is in the hand of the queen now.");
talkEntry:addResponse("We honour the customs of Albar. The queen does, especially. Yes, a female sovereign, do not question this, ever.");
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
talkEntry:addTrigger("gynk");
talkEntry:addTrigger("gync");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("I do not bother what is going on in Gynk. Most probably, they slash each others' throat currently.");
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
talkEntry:addTrigger("salkama");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Oh, please, do not talk about this in public. The queen does not like it.");
talkEntry:addResponse("Shh!");
talkEntry:addResponse("Hush!");
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
talkEntry:addResponse("I respect all gods, but those who I truly pray to are Irmorom and Adron.");
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
talkEntry:addTrigger("Irmorom");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Of course I pray to Irmorom before I light the smelting furnace. But who I really adore, that is Adron.");
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
talkEntry:addTrigger("Adron");
talkEntry:addCondition(npc.base.condition.language.language("english"));
talkEntry:addResponse("Alas! Adron is my saviour. Without him, nobody would enjoy a good wine and I'd sell nothing anymore.");
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
talkEntry:addTrigger("what sell");
talkEntry:addTrigger("what buy");
talkEntry:addTrigger("list wares");
talkEntry:addTrigger("price of");
talkEntry:addResponse("I trade any kind of glass goods. You can also obtain candles from me.");
talkEntry:addResponse("I'll gladly show you my offer of glass wares and candles.");
talkEntry:addResponse("You can get here anything you need for a perfect dinner.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("was verkauf");
talkEntry:addTrigger("was kauf");
talkEntry:addTrigger("warenliste");
talkEntry:addTrigger("preis von");
talkEntry:addResponse("Ich handel aller Art Glaswaren. Ebenso könnt ihr Kerzen bei mir erwerben.");
talkEntry:addResponse("Gerne zeige ich euch mein Angebot an Glaswaren und Kerzen.");
talkEntry:addResponse("Hier bekommt ihr alles, was ihr für ein perfektes Abendessen braucht.");
talkingNPC:addTalkingEntry(talkEntry);
end;
if (true) then
local talkEntry = npc.base.talk.talkNPCEntry();
talkEntry:addTrigger("tell something");
talkEntry:addResponse("Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
talkEntry:addResponse("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
talkEntry:addResponse("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
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
talkEntry:addTrigger("Jonathan");
talkEntry:addTrigger("Cyrus");
talkEntry:addCondition(npc.base.condition.language.language("english"));
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
talkEntry:addResponse("The queen's favourite word: 'Yes'.");
talkEntry:addResponse("Fine.");
talkEntry:addResponse("Perhaps you want to take a look at my goods.");
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
talkEntry:addResponse("Well, then, maybe I can interest you in some candles?");
talkEntry:addResponse("No?");
talkEntry:addResponse("How comes you disagree?");
talkEntry:addResponse("You say 'no', as long as you don't face the queen, you may do so.");
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
talkingNPC:addCycleText("Was immer ihr braucht - ich habe es.", "Whatever you need - I have it.");
talkingNPC:addCycleText("Beste Glaswaren!", "Best glass goods!");
talkingNPC:addCycleText("Kommt her, schaut euch an, was ich zu bieten habe.", "Come around, take a look at my offer.");
talkingNPC:addCycleText("Kerzen, helle Kerzen!", "Candles, bright candles!");
talkingNPC:addCycleText("#me wischt einen Glaskelch mit einem seidenen Tuch ab.", "#me polishes a glass goblet with a silk tissue.");
talkingNPC:addCycleText("Glitzernde Glaswaren, nur heute, nur für euch!", "Sparkling glass goods, only today, only for you!");
talkingNPC:addCycleText("#me schnüffelt an einer Kerze: 'Bestes Bienenwachs!'.", "#me sniffes on a candle: 'Best bee way!'.");
talkingNPC:addCycleText("Ich habe beste Kerzen im Angebot. Mögen sie euch ein Leuchtfeuer in der Dunkelheit sein.", "I offer best candles. May they be a beacon of hope in the darkest night.");
talkingNPC:addCycleText("Bierkrüge für Zwergenbier, feinste Kelche für Elfenwein - aus meinen Gütern schmeckt jedes Gebräu.", "Beer mugs for dwarven beer, finest cups for elven wine - with my goods, everything turns out to be tasty.");
talkingNPC:addCycleText("Das transparente Gold Cadomyrs: Glas!", "The transparent gold of Cadomyr: Glass!");
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
mainNPC:setAutoIntroduceMode(true);

mainNPC:initDone();
end;

function receiveText(texttype, message, speaker) mainNPC:receiveText(speaker, message); end;
function nextCycle() mainNPC:nextCycle(); end;
function lookAtNpc(char, mode) mainNPC:lookAt(char, mode); end;
function useNPC(char, counter, param) mainNPC:use(char); end;
initNpc();
initNpc = nil;
-- END