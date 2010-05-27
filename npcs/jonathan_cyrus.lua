-- INSERT INTO npc VALUES (nextval('npc_seq'),0,113,599,0,4,false,'Jonathan Cyrus','npc_jonathan_cyrus.lua',0);

require("npcs.base.autonpcfunctions")
require("quest_mineth"); --addition for the Tailor Quest
module("npcs.jonathan_cyrus")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

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
    npcs.base.autonpcfunctions.AddTraderTrigger("Help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Game Help] This NPC is the glass goods trader Jonathan Cyrus. Keyphrases: Hello, glass.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","[Spielhilfe] Dieser NPC ist Glaswarenhändler Jonathan Cyrus. Schlüsselwörter: Hallo, Glas.");
    -- General speech
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Hail, by queen Rosaline! Do you need any glasses, just ask.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good day");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good evening");
    npcs.base.autonpcfunctions.AddAdditionalText("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Seid gegrüßt, bei unserer Königin Rosaline.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Mahlzeit");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hail, by queen Rosaline! Do you need any glasses, just ask.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("It is a wonderful day in Cadomyr, reigned by our magnificient - and beautiful - queen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Seid gegrüßt, bei unserer Königin Rosaline.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebs");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Es ist ein wundervoller Tag in Cadomyr, regiert von unserer glorreichen - und wunderschönen - Königin.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallo.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Go with queensspeed.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Fare thy well, and come back one day.");
    npcs.base.autonpcfunctions.AddAdditionalText("One advise: Do venture too far. You will nothing like Cadomyr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Geht mit dem Segen der Königin.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl und kommt eines Tages wieder.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Go with queensspeed.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Fare thy well, and come back one day.");
    npcs.base.autonpcfunctions.AddAdditionalText("One advise: Do venture too far. You will nothing like Cadomyr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Geht mit dem Segen der Königin.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Gehabt euch wohl und kommt eines Tages wieder.");
    npcs.base.autonpcfunctions.AddAdditionalText("Ein Rat: Geht nicht zu weit fort, ihr werdet nichts mit Cadomyr vergleichbares finden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Let's not talk about feelings, let's talk about business.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("I feel great, I saw the queen yesterday!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Lasst uns nicht über Gefühle sondern übers Geschäft reden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Mir geht es bestens, gestern gerade habe ich die Königin gesehen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","Jonathan Cyrus. Call me John and you'll regret it.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who art thou");
    npcs.base.autonpcfunctions.AddAdditionalText("You're at Cyrus' glass goods store.");
    npcs.base.autonpcfunctions.AddAdditionalText("For my good customers, I go by Jonathan.");
    npcs.base.autonpcfunctions.AddTraderTrigger("dein name","Jonathan Cyrus. Nennt mich John und ihr werdet es bereuen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie heißt");
    npcs.base.autonpcfunctions.AddAdditionalText("Ihr seid im Glaswarenladen Cyrus.");
    npcs.base.autonpcfunctions.AddAdditionalText("Für meine guten Kunden heiße ich Jonathan.");
    -- Catching typical NPC phrases 
    npcs.base.autonpcfunctions.AddTraderTrigger("what sell","I trade any kind of glass goods. You can also obtain candles from me.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("list wares");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("price of");
    npcs.base.autonpcfunctions.AddAdditionalText("I'll gladly show you my offer of glass wares and candles.");
    npcs.base.autonpcfunctions.AddAdditionalText("You can get here anything you need for a perfect dinner.");
    npcs.base.autonpcfunctions.AddTraderTrigger("was verkauf","Ich handel aller Art Glaswaren. Ebenso könnt ihr Kerzen bei mir erwerben.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauf");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("warenliste");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("preis von");
    npcs.base.autonpcfunctions.AddAdditionalText("Gerne zeige ich euch mein Angebot an Glaswaren und Kerzen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Hier bekommt ihr alles, was ihr für ein perfektes Abendessen braucht.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tell something","Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
    npcs.base.autonpcfunctions.AddAdditionalText("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
    npcs.base.autonpcfunctions.AddAdditionalText("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
    npcs.base.autonpcfunctions.AddTraderTrigger("erzähl was","Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erzähl etwas");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
    npcs.base.autonpcfunctions.AddAdditionalText("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more!
    npcs.base.autonpcfunctions.AddTraderTrigger("profession","I trade glass goods.");
    npcs.base.autonpcfunctions.AddAdditionalText("I trade candles and glass goods.");
    npcs.base.autonpcfunctions.AddTraderTrigger("beruf","Ich handel mit Glaswaren");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich handel mit Kerzen und Glaswaren.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ich handel mit Glaswaren");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Ich handel mit Kerzen und Glaswaren.");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","I trade glass goods.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("I trade candles and glass goods.");
    npcs.base.autonpcfunctions.AddTraderTrigger("glas","Glass is fascinating. It looks like ice, sparkles like diamonds and is as hard as stone.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("The art of smelting glas is complicated, but I will make sure it will never be forgotten.");
    npcs.base.autonpcfunctions.AddAdditionalText("I once was told that one can turn the rays of sun into a deathly weapon with glass. I seriously doubt this!");
    npcs.base.autonpcfunctions.AddTraderTrigger("glas","Glas ist faszinierend. Es sieht aus wie Eis, funkelt wie ein Diamant und ist so hart wie Stein.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Kunst der Glasbläserei ist sehr anspruchsvoll, aber ich werde sicherstellen, dass sie nicht in Vergessenheit gerät.");
    npcs.base.autonpcfunctions.AddAdditionalText("Man hat mir mal berichtet, dass man die Strahlen der Sonne mit Glas zu einer tödlichen Waffe bündeln könnte. Was für ein Humbug.");
    npcs.base.autonpcfunctions.AddTraderTrigger("trader","Need forged goods? Need clothes? You can find anything here at the marketplace of Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("merchant");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("collegue");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vendor");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("market");
    npcs.base.autonpcfunctions.AddTraderTrigger("händler","Braucht ihr Schmiedewaren? Kleidung? Ihr findet alles hier auf dem Marktplatz von Cadomyr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kollege");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("höker");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("markt");
    -- More small talk; add at least five triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("Rutrus","I know Rutrus, he's living at the Oasis of Stars.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Rutrus, well, I think his head spent too much time under the burning sun.");
    npcs.base.autonpcfunctions.AddAdditionalText("In former times, I bought quartz sand from Rutrus, but then he started talking to his shovel.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Rutrus","Ich kenne Rutrus, er lebt bei der Sternenoase.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Rutrus, nun, ich glaube, sein Kopf war zulange der brennenden Sonne ausgesetzt.");
    npcs.base.autonpcfunctions.AddAdditionalText("Früher habe ich von Zeit zu Zeit Quarzsand von Rutrus gekauft, bis er angefangen hat, mit seiner Schaufel zu reden.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Oase","Die Sternenoase ist außerhalb der Stadtmauern. Schützt euer Gesicht vor Flugsand, wenn ihr durch die Wüste wandert.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Oasis","The Oasis of Stars is beyond the town wall. Protect your face from sand when you npcs.base.autonpcfunctions.walk through the desert.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Sand","Sand is omnipresent here in Cadomyr. It is blessing and curse at the same time.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("You'll need plenty sand for glassblowing. But only fine sand, coarse sand is not pure enough.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Sand","Der Sand ist allgegenwärtig hier in Cadomyr. Er ist Segen und Fluch zugleich.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Ihr werdet viel Sand zum Glasblasen benötigen. Nur feiner Sand ist geeignet, grober Sand ist zu unrein.");
    -- Faction stuff
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Oh, please, spare with me with any news from the archmage. He's lying anyway.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Elvaine Morgan, you could have said 'The Big Lier' instead.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Elvaine","Oh bitte, erspart mir irgendwelche Neuigkeiten vom Erzmagier. Der lügt wie gedruckt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Morgan");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("archmage");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Erzmagier");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Elvaine Morgan, ihr hättet auch einfach sagen können, 'Der Lügenbaron'.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick is a place of books, boredom and lazyness.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("If you ever come to Runewick, sell them some vials of mine, will you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Runewick","Runewick ist ein Ort der Bücher, der Langeweile und der Faulheit.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Wenn ihr jemals nach Runewick kommt, verkauft ihr den Leuten dort ein paar meiner Phiolen, bitte?");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Valerio Guilianni is the Don of Galmair. That is all there is to say.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Valerio","Valerio Guilianni ist der Don von Galmair. Mehr gibt es da nicht zu sagen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guilianni");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Don");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Never go to Galmair if you want to survice the night.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Galmair is a place of thugs and thieves.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Galmair","Geht niemals nach Galmair, wenn ihr den Morgen erleben wollt.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Galmair ist ein Ort der Diebe und Halunken.");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Our queen came to power in compliance with the old customs. Who opposes her, opposes the old customs.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Shh, don't you think she is too beautiful to remain unmarried?");
    npcs.base.autonpcfunctions.AddAdditionalText("My queen is my everything!");
    npcs.base.autonpcfunctions.AddTraderTrigger("rosaline","Unsere Königin kam an die Macht, ganz nach den alten Sitten. Wer also gegen sie handelt, handelt gegen unsere alten Gebräuche.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("königin");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("queen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("edwards");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Psst, denkt ihr nicht auch, sie ist zu schön, um allzulange unverheiratet zu sein?");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Königin bedeutet mir alles!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr is a land of sand and stone. But we made the best out of it.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Cadomyr, oh, Cadomyr, I like to dwell just here!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Cadomyr","Cadomyr ist ein Land aus Sand und Stein. Aber wir haben das beste daraus gemacht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Cadomyr, oh Cadomyr, wie gerne wohn' ich hier!");
    -- Main land factions
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","All of us have ancestors in Albar. However, our fate is in the hand of the queen now.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("We honour the customs of Albar. The queen does, especially. Yes, a female sovereign, do not question this, ever.");
    npcs.base.autonpcfunctions.AddTraderTrigger("albar","Wir alle haben Vorfahren aus Albar. Nun aber liegt unser Schicksal in der Hand der Königin.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Wir ehren die Gebräuche Albars. Die Königin tut dies ebenso, ja, ein weiblicher Souverän. Stellt dies niemals in Frage!");
    npcs.base.autonpcfunctions.AddTraderTrigger("gynk","I do not bother what is going on in Gynk. Most probably, they slash each others' throat currently.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gync");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("gync","Es ist mir einerlei, was in Gynk vor sich geht. Wahrscheinlich schlitzen sich die Leute dort gerade gegenseitig die Kehlen auf.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gynk");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Oh, please, do not talk about this in public. The queen does not like it.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Shh!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hush!");
    npcs.base.autonpcfunctions.AddTraderTrigger("salkama","Oh, bitte sprecht darüber nicht in aller Öffentlichkeit. Die Königin mag das nicht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Psst!");
    npcs.base.autonpcfunctions.AddAdditionalText("Still!");
    -- Gods; each NPC should at react on at least one god, being a follower of said god
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Of course I pray to Irmorom before I light the smelting furnace. But who I really adore, that is Adron.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Irmorom","Natürlich betet ich stets zu Irmorom, bevor ich den Schmelzofen anfeuere. Aber wirklich verehren tu ich Adron.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Adron","Alas! Adron is my saviour. Without him, nobody would enjoy a good wine and I'd sell nothing anymore.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Adron","Fürwahr, Adron ist mein Heiland. Ohne ihn würde niemand mehr einen guten Tropfen Wein genießen und ich würde nichts mehr verkaufen.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    -- Catching quest triggers
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Quests? Well, learn glassblowing, that is a quest that will keep you busy for some years.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddTraderTrigger("Auftrag","Abenteuer? Nun, Glasblasen zu erlernen ist wirklich ein Abenteuer für sich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here
    npcs.base.autonpcfunctions.AddTraderTrigger("Yes","The queen's favourite word: 'Yes'.");
    npcs.base.autonpcfunctions.AddAdditionalText("Fine.");
    npcs.base.autonpcfunctions.AddAdditionalText("Perhaps you want to take a look at my goods.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ja","Das Lieblingswort der Königin: 'Ja'.");
    npcs.base.autonpcfunctions.AddAdditionalText("Fein.");
    npcs.base.autonpcfunctions.AddAdditionalText("Vielleicht wollt ihr einen Blick auf meine Waren werfen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("No","Well, then, maybe I can interest you in some candles?");
    npcs.base.autonpcfunctions.AddAdditionalText("No?");
    npcs.base.autonpcfunctions.AddAdditionalText("How comes you disagree?");
    npcs.base.autonpcfunctions.AddAdditionalText("You say 'no', as long as you don't face the queen, you may do so.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Nein","Nun, kann ich euch stattdessen mit einigen Kerzen beglücken?");
    npcs.base.autonpcfunctions.AddAdditionalText("Nein?");
    npcs.base.autonpcfunctions.AddAdditionalText("Wieso widersprecht ihr?");
    npcs.base.autonpcfunctions.AddAdditionalText("Ihr könnt solange 'Nein' sagen, bis ihr der Königin gegenübersteht.");
    -- Cycletext: Please add at least(!) five cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    npcs.base.autonpcfunctions.AddCycleText("Was immer ihr braucht - ich habe es.","Whatever you need - I have it.");
    npcs.base.autonpcfunctions.AddCycleText("Beste Glaswaren!","Best glass goods!");
    npcs.base.autonpcfunctions.AddCycleText("Kommt her, schaut euch an, was ich zu bieten habe.","Come around, take a look at my offer.");
    npcs.base.autonpcfunctions.AddCycleText("Kerzen, helle Kerzen!","Candles, bright candles!");
    npcs.base.autonpcfunctions.AddCycleText("#me wischt einen Glaskelch mit einem seidenen Tuch ab.","#me polishes a glass goblet with a silk tissue.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
        	if (originator:getQuestProgress(62) >= 10000 and originator:getQuestProgress(62) < 19999) then -- check if he is doing the mineth quest
				 if string.find(message,"[Mm]itglied")~=nil or string.find(message,"[Mm]ember")~=nil or
				    string.find(message,"[Tt]rader.+[Cc]ompany")~=nil then
					gText = "Ähm... der Händler in Runewick nennt sich <Name Händler Runewick>. Und den Namen des Händlers aus Galmair habe ich vergessen, er ist neu bei uns, aber ich weiß, dass er Metallgegenstände verkauft.";
					eText = "Uhm... the name of the trader in Runewick is <Name Händler Runewick>. And the name of the other trader from Galmair I already forgot, he is new in our guild, but I know that he sells metal stuff.";
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					
				 elseif string.find(message,"[Mm]ineth")~=nil or string.find(message,"[Rr]ätsel")~=nil or
		             string.find(message,"[Rr]iddle")~=nil or string.find(message,"[Ww]appen")~=nil or
					 string.find(message,"[Bb]anner")~=nil or string.find(message,"[Cc]oat")~=nil or
					 string.find(message,"[Gg]ilde")~=nil or string.find(message,"[Gg]uild")~=nil or
					 string.find(message,"[Ww]hat.+you.+like")~=nil or
					 string.find(message,"[Ww]hat.+you.+want")~=nil or string.find(message,"[Ww]as.+magst.+du")~=nil then
					 
					gText = "Da euch Mineth schickt, habe ich folgendes Rätsel was wir auf dem Banner wollen:";
					eText = "Because Mineth sends you, I have the following riddle for the coat of arms for you:";
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					
                    gText,eText = quest_mineth.chooseSentence(originator,1);                    -- tell Riddle Text
					outText=base.common.npcs.base.npcautofunction.GetNLS(originator,gText,eText); npcs.base.autonpcfunctions.NPCTalking(thisNPC,outText);
					 
					gText = "Es könnte hilfreich sein ihn zu fragen wer die anderen beiden 'Mitglieder' der Trader Company-Gilde sind.";
					eText = "It could be helpful to ask him who the other two 'members' of the Trader Company are.";
					base.common.TempInformNLS(originator,gText,eText);
				 else
       				npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
				 end
			else
            	npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
			end
        else
            npcs.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an.",
               "#me looks at you a little confused."
            );
        end
    end
end