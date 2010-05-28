-- INSERT INTO npc VALUES (nextval('npc_seq'),0,113,599,0,4,false,'Jonathan Cyrus','npc_jonathan_cyrus.lua',0);

require("npc.base.autonpcfunctions")
require("quest_mineth"); --addition for the Tailor Quest
module("npc.jonathan_cyrus")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 0;
    -- NPC by Estralis Seborian
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bough/sold):
    -- 5% Tools (Candle maker): 429
    -- 10% Tools (Glass blower): 311, 312
    -- 10% Glass products: 75, 164, 292, 315, 1317, 1908, 2055, 2457, 2498
    -- 10% Glass resources: 41, 314, 316, 726
    -- 5% Candles, torches: 43, 391
    -- 5% Wax: 431
    -- Help 
    npc.base.autonpcfunctions.AddTraderTrigger("Help","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the glass goods trader Jonathan Cyrus. Keyphrases: Hello, glass.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist Glaswarenhändler Jonathan Cyrus. Schlüsselwörter: Hallo, Glas.");
    -- General speech
    npc.base.autonpcfunctions.AddTraderTrigger("Hello","Hail, by queen Rosaline! Do you need any glasses, just ask.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npc.base.autonpcfunctions.AddAdditionalText("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello.");
    npc.base.autonpcfunctions.AddTraderTrigger("Grüße","Seid gegrüßt, bei unserer Königin Rosaline.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npc.base.autonpcfunctions.AddAdditionalText("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Hail, by queen Rosaline! Do you need any glasses, just ask.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
    npc.base.autonpcfunctions.AddAdditionalText("Hello.");
    npc.base.autonpcfunctions.AddTraderTrigger("Hiho","Seid gegrüßt, bei unserer Königin Rosaline.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
    npc.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npc.base.autonpcfunctions.AddTraderTrigger("Farewell","Go with queensspeed.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npc.base.autonpcfunctions.AddAdditionalText("Fare thy well, and come back one day.");
    npc.base.autonpcfunctions.AddAdditionalText("One advise: Do venture too far. You will nothing like Cadomyr.");
    npc.base.autonpcfunctions.AddTraderTrigger("Tschüß","Geht mit dem Segen der Königin.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npc.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl und kommt eines Tages wieder.");
    npc.base.autonpcfunctions.AddAdditionalText("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Go with queensspeed.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Fare thy well, and come back one day.");
    npc.base.autonpcfunctions.AddAdditionalText("One advise: Do venture too far. You will nothing like Cadomyr.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ciao","Geht mit dem Segen der Königin.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl und kommt eines Tages wieder.");
    npc.base.autonpcfunctions.AddAdditionalText("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
    npc.base.autonpcfunctions.AddTraderTrigger("How are you","Let's not talk about feelings, let's talk about business.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npc.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npc.base.autonpcfunctions.AddAdditionalText("I feel great, I saw the queen yesterday!");
    npc.base.autonpcfunctions.AddTraderTrigger("Wie geht","Lasst uns nicht über Gefühle sondern übers Geschäft reden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npc.base.autonpcfunctions.AddAdditionalText("Mir geht es bestens, gestern gerade habe ich die Königin gesehen.");
    npc.base.autonpcfunctions.AddTraderTrigger("your name","Jonathan Cyrus. Call me John and you'll regret it.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npc.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npc.base.autonpcfunctions.AddAdditionalText("You're at Cyrus' glass goods store.");
    npc.base.autonpcfunctions.AddAdditionalText("For my good customers, I go by Jonathan.");
    npc.base.autonpcfunctions.AddTraderTrigger("dein name","Jonathan Cyrus. Nennt mich John und ihr werdet es bereuen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npc.base.autonpcfunctions.AddAdditionalText("Ihr seid im Glaswarenladen Cyrus.");
    npc.base.autonpcfunctions.AddAdditionalText("Für meine guten Kunden heiße ich Jonathan.");
    -- Catching typical NPC phrases 
    npc.base.autonpcfunctions.AddTraderTrigger("what sell","I trade any kind of glass goods. You can also obtain candles from me.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npc.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npc.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npc.base.autonpcfunctions.AddAdditionalText("I'll gladly show you my offer of glass wares and candles.");
    npc.base.autonpcfunctions.AddAdditionalText("You can get here anything you need for a perfect dinner.");
    npc.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich handel aller Art Glaswaren. Ebenso könnt ihr Kerzen bei mir erwerben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npc.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npc.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npc.base.autonpcfunctions.AddAdditionalText("Gerne zeige ich euch mein Angebot an Glaswaren und Kerzen.");
    npc.base.autonpcfunctions.AddAdditionalText("Hier bekommt ihr alles, was ihr für ein perfektes Abendessen braucht.");
    npc.base.autonpcfunctions.AddTraderTrigger("tell something","Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
    npc.base.autonpcfunctions.AddAdditionalText("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
    npc.base.autonpcfunctions.AddAdditionalText("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
    npc.base.autonpcfunctions.AddTraderTrigger("erzähl was","Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npc.base.autonpcfunctions.AddAdditionalText("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
    npc.base.autonpcfunctions.AddAdditionalText("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npc.base.autonpcfunctions.AddTraderTrigger("profession","I trade glass goods.");
    npc.base.autonpcfunctions.AddAdditionalText("I trade candles and glass goods.");
    npc.base.autonpcfunctions.AddTraderTrigger("beruf","Ich handel mit Glaswaren");
    npc.base.autonpcfunctions.AddAdditionalText("Ich handel mit Kerzen und Glaswaren.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","Ich handel mit Glaswaren");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ich handel mit Kerzen und Glaswaren.");
    npc.base.autonpcfunctions.AddTraderTrigger("job","I trade glass goods.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("I trade candles and glass goods.");
    npc.base.autonpcfunctions.AddTraderTrigger("glas","Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
    npc.base.autonpcfunctions.AddAdditionalText("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
    npc.base.autonpcfunctions.AddTraderTrigger("glas","Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
    npc.base.autonpcfunctions.AddAdditionalText("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
    npc.base.autonpcfunctions.AddTraderTrigger("trader","Need forged goods? Need clothes? You can find anything here at the marketplace of Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npc.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npc.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npc.base.autonpcfunctions.AddAdditionalTrigger("market");
    npc.base.autonpcfunctions.AddTraderTrigger("händler","Braucht ihr Schmiedewaren? Kleidung? Ihr findet alles hier auf dem Marktplatz von Cadomyr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npc.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npc.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npc.base.autonpcfunctions.AddTraderTrigger("Rutrus","I know Rutrus, he's living at the Oasis of Stars.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Rutrus, well, I think his head spent too much time under the burning sun.");
    npc.base.autonpcfunctions.AddAdditionalText("In former times, I bought quartz sand from Rutrus, but then he started talking to his shovel.");
    npc.base.autonpcfunctions.AddTraderTrigger("Rutrus","Ich kenne Rutrus, er lebt bei der Sternenoase.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Rutrus, nun, ich glaube, sein Kopf war zulange der brennenden Sonne ausgesetzt.");
    npc.base.autonpcfunctions.AddAdditionalText("Früher habe ich von Zeit zu Zeit Quarzsand von Rutrus gekauft, bis er angefangen hat, mit seiner Schaufel zu reden.");
    npc.base.autonpcfunctions.AddTraderTrigger("Oase","Die Sternenoase ist außerhalb der Stadtmauern. Schützt euer Gesicht vor Flugsand, wenn ihr durch die Wüste wandert.");
    npc.base.autonpcfunctions.AddTraderTrigger("Oasis","The Oasis of Stars is beyond the town wall. Protect your face from sand when you npc.base.autonpcfunctions.walk through the desert.");
    npc.base.autonpcfunctions.AddTraderTrigger("Sand","Sand is omnipresent here in Cadomyr. It is blessing and curse at the same time.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("You'll need plenty sand for glassblowing. But only fine sand, coarse sand is not pure enough.");
    npc.base.autonpcfunctions.AddTraderTrigger("Sand","Der Sand ist allgegenwärtig hier in Cadomyr. Er ist Segen und Fluch zugleich.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Ihr werdet viel Sand zum Glasblasen benötigen. Nur feiner Sand ist geeignet, grober Sand ist zu unrein.");
    -- Faction stuff
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Oh, please, spare with me with any news from the archmage. He's lying anyway.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Elvaine Morgan, you could have said 'The Big Lier' instead.");
    npc.base.autonpcfunctions.AddTraderTrigger("Elvaine","Oh bitte, erspart mir irgendwelche Neuigkeiten vom Erzmagier. Der lügt wie gedruckt.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npc.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Elvaine Morgan, ihr hättet auch einfach sagen können, 'Der Lügenbaron'.");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick is a place of books, boredom and lazyness.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("If you ever come to Runewick, sell them some vials of mine, will you?");
    npc.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick ist ein Ort der Bücher, der Langeweile und der Faulheit.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Wenn ihr jemals nach Runewick kommt, verkauft ihr den Leuten dort ein paar meiner Phiolen, bitte?");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Valerio Guilianni is the Don of Galmair. That is all there is to say.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Valerio","Valerio Guilianni ist der Don von Galmair. Mehr gibt es da nicht zu sagen.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Never go to Galmair if you want to survice the night.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Galmair is a place of thugs and thieves.");
    npc.base.autonpcfunctions.AddTraderTrigger("Galmair","Geht niemals nach Galmair, wenn ihr den Morgen erleben wollt.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Galmair ist ein Ort der Diebe und Halunken.");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Our queen came to power in compliance with the old customs. Who opposes her, opposes the old customs.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Shh, don't you think she is too beautiful to remain unmarried?");
    npc.base.autonpcfunctions.AddAdditionalText("My queen is my everything!");
    npc.base.autonpcfunctions.AddTraderTrigger("rosaline","Unsere Königin kam an die Macht, ganz nach den alten Sitten. Wer also gegen sie handelt, handelt gegen unsere alten Gebräuche.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npc.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Psst, denkt ihr nicht auch, sie ist zu schön, um allzulange unverheiratet zu sein?");
    npc.base.autonpcfunctions.AddAdditionalText("Die Königin bedeutet mir alles!");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is a land of sand and stone. But we made the best out of it.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Cadomyr, oh, Cadomyr, I like to dwell just here!");
    npc.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist ein Land aus Sand und Stein. Aber wir haben das beste daraus gemacht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Cadomyr, oh Cadomyr, wie gerne wohn' ich hier!");
    -- Main land factions
    npc.base.autonpcfunctions.AddTraderTrigger("albar","All of us have ancestors in Albar. However, our fate is in the hand of the queen now.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("We honour the customs of Albar. The queen does, especially. Yes, a female sovereign, do not question this, ever.");
    npc.base.autonpcfunctions.AddTraderTrigger("albar","Wir alle haben Vorfahren aus Albar. Nun aber liegt unser Schicksal in der Hand der Königin.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Wir ehren die Gebräuche Albars. Die Königin tut dies ebenso, ja, ein weiblicher Souverän. Stellt dies niemals in Frage!");
    npc.base.autonpcfunctions.AddTraderTrigger("gynk","I do not bother what is going on in Gynk. Most probably, they slash each others' throat currently.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("gync","Es ist mir einerlei, was in Gynk vor sich geht. Wahrscheinlich schlitzen sich die Leute dort gerade gegenseitig die Kehlen auf.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Oh, please, do not talk about this in public. The queen does not like it.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("Shh!");
    npc.base.autonpcfunctions.AddAdditionalText("Hush!");
    npc.base.autonpcfunctions.AddTraderTrigger("salkama","Oh, bitte sprecht darüber nicht in aller Öffentlichkeit. Die Königin mag das nicht.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("Psst!");
    npc.base.autonpcfunctions.AddAdditionalText("Still!");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Of course I pray to Irmorom before I light the smelting furnace. But who I really adore, that is Adron.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Irmorom","Natürlich betet ich stets zu Irmorom, bevor ich den Schmelzofen anfeuere. Aber wirklich verehren tu ich Adron.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("Adron","Alas! Adron is my saviour. Without him, nobody would enjoy a good wine and I'd sell nothing anymore.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("Adron","Fürwahr, Adron ist mein Heiland. Ohne ihn würde niemand mehr einen guten Tropfen Wein genießen und ich würde nichts mehr verkaufen.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("quest","Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("task","Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npc.base.autonpcfunctions.AddTraderTrigger("Auftrag","Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npc.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npc.base.autonpcfunctions.AddTraderTrigger("Yes","The queen's favourite word: 'Yes'.");
    npc.base.autonpcfunctions.AddAdditionalText("Fine.");
    npc.base.autonpcfunctions.AddAdditionalText("Perhaps you want to take a look at my goods.");
    npc.base.autonpcfunctions.AddTraderTrigger("Ja","Das Lieblingswort der Königin: 'Ja'.");
    npc.base.autonpcfunctions.AddAdditionalText("Fein.");
    npc.base.autonpcfunctions.AddAdditionalText("Vielleicht wollt ihr einen Blick auf meine Waren werfen.");
    npc.base.autonpcfunctions.AddTraderTrigger("No","Well, then, maybe I can interest you in some candles?");
    npc.base.autonpcfunctions.AddAdditionalText("No?");
    npc.base.autonpcfunctions.AddAdditionalText("How comes you disagree?");
    npc.base.autonpcfunctions.AddAdditionalText("You say 'no', as long as you don't face the queen, you may do so.");
    npc.base.autonpcfunctions.AddTraderTrigger("Nein","Nun, kann ich euch stattdessen mit einigen Kerzen beglücken?");
    npc.base.autonpcfunctions.AddAdditionalText("Nein?");
    npc.base.autonpcfunctions.AddAdditionalText("Wieso widersprecht ihr?");
    npc.base.autonpcfunctions.AddAdditionalText("Ihr könnt solange 'Nein' sagen, bis ihr der Königin gegenübersteht.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npc.base.autonpcfunctions.AddCycleText("Was immer ihr braucht - ich habe es.","Whatever you need - I have it.");
    npc.base.autonpcfunctions.AddCycleText("Beste Glaswaren!","Best glass goods!");
    npc.base.autonpcfunctions.AddCycleText("Kommt her, schaut euch an, was ich zu bieten habe.","Come around, take a look at my offer.");
    npc.base.autonpcfunctions.AddCycleText("Kerzen, helle Kerzen!","Candles, bright candles!");
    npc.base.autonpcfunctions.AddCycleText("#me wischt einen Glaskelch mit einem seidenen Tuch ab.","#me polishes a glass goblet with a silk tissue.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
        	if (originator:getQuestProgress(62) >= 10000 and originator:getQuestProgress(62) < 19999) then -- check if he is doing the mineth quest
				 if string.find(message,"[Mm]itglied")~=nil or string.find(message,"[Mm]ember")~=nil or
				    string.find(message,"[Tt]rader.+[Cc]ompany")~=nil then
					gText = "Ähm... der Händler in Runewick nennt sich <Name Händler Runewick>. Und den Namen des Händlers aus Galmair habe ich vergessen, er ist neu bei uns, aber ich weiß, dass er Metallgegenstände verkauft.";
					eText = "Uhm... the name of the trader in Runewick is <Name Händler Runewick>. And the name of the other trader from Galmair I already forgot, he is new in our guild, but I know that he sells metal stuff.";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText); npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					
				 elseif string.find(message,"[Mm]ineth")~=nil or string.find(message,"[Rr]ätsel")~=nil or
		             string.find(message,"[Rr]iddle")~=nil or string.find(message,"[Ww]appen")~=nil or
					 string.find(message,"[Bb]anner")~=nil or string.find(message,"[Cc]oat")~=nil or
					 string.find(message,"[Gg]ilde")~=nil or string.find(message,"[Gg]uild")~=nil or
					 string.find(message,"[Ww]hat.+you.+like")~=nil or
					 string.find(message,"[Ww]hat.+you.+want")~=nil or string.find(message,"[Ww]as.+magst.+du")~=nil then
					 
					gText = "Da euch Mineth schickt, habe ich folgendes Rätsel was wir auf dem Banner wollen:";
					eText = "Because Mineth sends you, I have the following riddle for the coat of arms for you:";
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText); npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					
                    gText,eText = quest_mineth.chooseSentence(originator,1);                    -- tell Riddle Text
					outText=base.common.npc.base.npcautofunction.GetNLS(originator,gText,eText); npc.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					 
					gText = "Es könnte hilfreich sein ihn zu fragen wer die anderen beiden 'Mitglieder' der Trader Company-Gilde sind.";
					eText = "It could be helpful to ask him who the other two 'members' of the Trader Company are.";
					base.common.TempInformNLS(originator,gText,eText);
				 else
       				npc.base.autonpcfunctions.TellSmallTalk(message,originator);
				 end
			else
            	npc.base.autonpcfunctions.TellSmallTalk(message,originator);
			end
        else
            npc.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an.",
               "#me looks at you a little confused."
            );
        end
    end
end