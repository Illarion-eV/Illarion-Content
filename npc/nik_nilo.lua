-- INSERT INTO npc VALUES (nextval('npc_seq'),0,377,266,0,6,false,'Nik Nilo','nik_nilo.lua',0);

dofile("npc_autonpcfunctions.lua");

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    QuestID = 0;
    -- NPC by Drathe
    -- Translation and revision by Estralis Seborian & Faladron
    -- This NPC is supposed to trade (all goods are sold and bought, percentage indicates ratio of price bought/sold): 
    -- 10% Tools (Brick maker): 734 
    -- 10% Tools (Mason): 23, 737 
    -- 10% Tools (Miner): 24, 2763 
    -- 5% Tools (Digger): 24 
    -- 5% Clay: 26 
    -- 10% Bricks: 736, 2588 
    -- 10% Stones: 733, 735, 1266 
    -- 10% Coal, Ores, Nuggets: 21, 22, 234, 2534, 2536 
    -- 10% Raw gems: 251, 252, 253, 254, 255, 256, 257 
    -- 5% Stuff: 310, 374, 390, 391, 1858, 2183, 2184, 2185, 2717, 2719, 2738, 2744, 2760 
    -- Help 
    AddTraderTrigger("Help","");
    AddConsequence("inform","[Game Help] This is 'Big Nik', he is a tool and supply trader. Keyphrases: Hello, profession, laws.");
    AddTraderTrigger("Hilfe","");
    AddConsequence("inform","[Spielhilfe] Dieser NPC ist der Werkzeug- und Rohstoffhändler 'Big Nik'. Schlüsselwörter: Hallo, Beruf, Gesetze.");
    -- General speech 
    AddTraderTrigger("Hello","#me grins as he waves: 'What can I do for you?'");
    AddAdditionalTrigger("Greetings");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Hail");
    AddAdditionalTrigger("Good day");
    AddAdditionalTrigger("Good morning");
    AddAdditionalTrigger("Good evening");
    AddAdditionalText("#me lifts his head: 'Hello there, you here to buy or sell?'");
    AddAdditionalText("Hello, you look like someone who knows a good price for tools, thats why your here, right?");
    AddTraderTrigger("Grüße","#me grinst und winkt: 'Was kann ich für euch tun?'");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Tag");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Mahlzeit");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("#me hebt den Kopf: 'Heda, wollt ihr etwas kaufen oder loswerden?'");
    AddAdditionalText("Hallo, ihr seht aus wie jemand, dem ich einen guten Preis für Werkzeuge machen kann. Deshalb seid ihr doch hier?");
    AddTraderTrigger("Hiho","Yeh, yeh you here to buy or sell?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","english");
    AddAdditionalText("#me scratches his cheek as he looks over: 'Want to see my wares?'");
    AddAdditionalText("Hello and all that, why don't you spend some of that coin you have with me!");
    AddTraderTrigger("Hiho","Jaja, wollt ihr nun etwas kaufen oder loswerden?");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger("Greebs");
    AddCondition("lang","german");
    AddAdditionalText("#me kratzt sich am Kinn und schaut umher: 'Seid ihr wegen meinen Waren hier?'");
    AddAdditionalText("Hallo und so, warum gebt ihr nicht einfach etwas Geld bei mir aus!");
    AddTraderTrigger("Farewell","Aye... another time.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Come back again now!");
    AddAdditionalText("#me chuckles: 'I'll be seeing you again I hope.'");
    AddTraderTrigger("Tschüß","Ja, bis zum nächsten mal.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Kommt schon zurück!");
    AddAdditionalText("#me lacht: 'Wir werden uns wiedersehen, da bin ich mir sicher.");
    AddTraderTrigger("Ciao","Aye... another time.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Come back again now!");
    AddAdditionalText("#me chuckles: 'I'll be seeing you again.'");
    AddTraderTrigger("Ciao","Ja, bis zum nächsten mal.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Kommt schon zurück!");
    AddAdditionalText("#me lacht: 'Wir werden uns wiedersehen, da bin ich mir sicher.");
    AddTraderTrigger("How are you","I do alright, I would do better if you bought something!");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Why do you ask, you wont get a better price for small talk.");
    AddAdditionalText("I'm good, all the better for making a trade with you.");
    AddTraderTrigger("Wie geht","Mir geht es gut und es würde mir noch besser gehen, wenn ihr etwas kaufen würdet.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Warum fragt ihr, denkt ihr, dass ihr durch Geschwätz einen besseren Preis bekommt?");
    AddAdditionalText("Gut, genau richtig, um mit euch zu handeln.");
    AddTraderTrigger("your name","#me chuckles: 'Nik Nilo, but people call me Big Nik.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who art thou");
    AddAdditionalText("Big Nik and don't you forget it!");
    AddAdditionalText("You mean you never heard of me, I'm Big Nik Nilo!");
    AddTraderTrigger("dein name","#me lacht auf: 'Nik Nilo, aber die Leute nennen mich Big Nik.");
    AddAdditionalTrigger("wer bist du");
    AddAdditionalTrigger("wer seid ihr");
    AddAdditionalTrigger("wie heißt");
    AddAdditionalText("Big Nik, vergesst das besser nicht.");
    AddAdditionalText("Ihr habt also noch nie von mir gehört? Ich bin Big Nik Nilo!");
    -- Catching typical NPC phrases 
    AddTraderTrigger("what sell","I trade with rocks and stones that are as hard as my muscles!");
    AddAdditionalTrigger("what buy");
    AddAdditionalTrigger("list wares");
    AddAdditionalTrigger("price of");
    AddTraderTrigger("was verkauf","Ich handel mit Felsen und Steinen, die so hart sind wie meine Muskeln!");
    AddAdditionalTrigger("was kauf");
    AddAdditionalTrigger("warenliste");
    AddAdditionalTrigger("preis von");
    AddTraderTrigger("tell something","#me makes an inviting gesture and lowers his voice: 'I'll tell you something, buy something or go away!'");
    AddTraderTrigger("erzähl was","#me winkt einladend und senkt dann die Stimme: 'Ich sag dir was, kauf was oder verschwinde!'");
    AddAdditionalTrigger("erzähl etwas");
    -- Small talk: The talk here should focus on possible questions. Feel free to add more! 
    AddTraderTrigger("profession","#me grins: 'I buy and sell tools and and building supplies.'");
    AddAdditionalText("I'm a builders merchant.");
    AddAdditionalText("#me smiles: 'Tools, building supplies, coal, ores and wares I've got it all to buy and sell.'");
    AddTraderTrigger("beruf","#me grinst: 'Ich kaufe und verkaufe Werkzeuge und Baumaterial.'");
    AddAdditionalText("Ich bin ein Baustoffhändler");
    AddAdditionalText("#me lächelt: 'Werkzeuge, Baumaterial, Kohle, Erze und andere Waren, ich hab alles im Angebot.'");
    AddTraderTrigger("job","Nun, ich bin ein Händler, so viel steht fest.");
    AddCondition("lang","german");
    AddAdditionalText("Ich kaufe und verkaufe Werkzeuge, Baumaterial und anderes.");
    AddAdditionalText("Ich kaufe ein bisschen und verkaufe eine Menge. Was braucht ihr?");
    AddTraderTrigger("job","Well I'm a trader, can't you tell.");
    AddCondition("lang","english");
    AddAdditionalText("I buy and sell tool, building supplies and other things.");
    AddAdditionalText("I do a little buying, a lot of selling, why what are you after?");
    AddTraderTrigger("location","I'm right in front of you, here in Galmair!");
    AddAdditionalTrigger("town");
    AddAdditionalTrigger("village");
    AddAdditionalText("Galmair, where else!");
    AddAdditionalText("Only the best town around these parts, Galmair!");
    AddTraderTrigger("Ort","Ich bin genau hier, hier in Galmair!");
    AddAdditionalTrigger("Stadt");
    AddAdditionalTrigger("Dorf");
    AddAdditionalText("Galmair, was sonst!");
    AddAdditionalText("Die beste Stadt in diesen Landen, Galmair!");
    AddTraderTrigger("trader","Need anything? Ask around. In Galmair, you can get anything. And when I say 'anything', I mean anything!");
    AddAdditionalTrigger("merchant");
    AddAdditionalTrigger("collegue");
    AddAdditionalTrigger("vendor");
    AddAdditionalTrigger("market");
    AddTraderTrigger("händler","Ihr sucht etwas? Fragt herum. In Galmair bekommt man alles. Und wenn ich 'alles' sage, meine ich alles!");
    AddAdditionalTrigger("kollege");
    AddAdditionalTrigger("höker");
    AddAdditionalTrigger("markt");
    AddTraderTrigger("Gobaith","Wasn't that a little island?");
    AddCondition("lang","english");
    AddAdditionalText("#me looks up in thought: 'I've heard of that place, can't think where it is though.'");
    AddAdditionalText("Gobaith, don't know where it is, I don't care.");
    AddTraderTrigger("Gobaith","War das nicht irgendsoeine Insel?");
    AddCondition("lang","german");
    AddAdditionalText("#me schaut gedankenverloren hoch: 'Ich habe von diesem Ort gehört, aber nicht, wo er ist.");
    AddAdditionalText("Gobaith, wen kümmerts?");
    -- More small talk; add at least five triggers 
    AddTraderTrigger("Laws","Haha, what laws, do as you please, just dont get caught!");
    AddAdditionalText("Treat others as you would be done by, else you will have to pay them compensation.");
    AddTraderTrigger("Gesetz","Haha, Gesetze, macht, was ihr wollt, aber lasst euch nicht erwischen!");
    AddAdditionalText("Behandelt andere so wie sie euch behandeln, sonst müsst ihr nachher noch Schadensersatz bezahlen.");
    AddTraderTrigger("Tool","My tools will help you build whatever you want in no time!");
    AddAdditionalText("Yes for this thing called 'work', have a look at my stock.");
    AddTraderTrigger("Werkzeug","Mein Werkzeug wird dir helfen zu bauen, was immer du möchtest!");
    AddAdditionalText("Ja, Werkzeug für diese Sache, die man 'Arbeit' nennt, schaut sie euch an.");
    AddTraderTrigger("Big Nik","#me scratches his knee casually: 'Well, Big Nik is my maiden's name. If you know what I mean.'");
    AddCondition("lang","english");
    AddTraderTrigger("Big Nik","#me kratzt sich gelassen am Knie 'Nun, Big Nik ist mein Mädchenname. Wenn ihr versteht, was ich meine.'");
    AddAdditionalTrigger("Groß Nik");
    -- Faction stuff 
    AddTraderTrigger("Elvaine","All light and wisdome, load of dung. He is just like any other pompus mage at Runewick.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddCondition("lang","english");
    AddAdditionalText("The archmage of Runewick, thinks the light shines out of his bum!");
    AddAdditionalText("Just another mage at Runwick with a big title, thinks he is something special, pah, same as all the others.");
    AddTraderTrigger("Elvaine","Wissen und Licht, was für ein Unfug. Er ist einfach nur ein Scharlatan aus Runewick.");
    AddAdditionalTrigger("Morgan");
    AddAdditionalTrigger("archmage");
    AddAdditionalTrigger("Erzmagier");
    AddAdditionalText("Der Erzmagier von Runewick, er denkt, das Licht würde aus seinem Hinter strahlen!");
    AddAdditionalText("Nur noch ein Magier in Runewick mit großem Titel, er denkt, er ist etwas besondere. Pah! Genausoein Versager wie die anderen.");
    AddTraderTrigger("Runewick","What a horrible place, full of scribes, mages and learned. Supposed to be a place of wisdom, arrogance more like.");
    AddCondition("lang","english");
    AddAdditionalText("Nice place to look at but wouldn't want to live there.");
    AddAdditionalText("#me grins, motioning a hand to the surrounding area: 'Pah! Runewick, you don't want to know about that place when you've got Galmair!'");
    AddTraderTrigger("Runewick","Was für ein ekliger Ort voll von Schreiberlingen, Magiern und Gelehrten. Eigentlich ein Ort der Weisheit, ist es mehr ein Ort der Hochnäsigkeit.");
    AddAdditionalText("Sieht schick aus, aber ich würde da nicht leben wollen.");
    AddAdditionalText("#me grinst und zeigt mit seiner Hand auf die Umgebung: 'Pah! Runewick, wen interessiert das schon, wenn man Galmair sieht!");
    AddTraderTrigger("Valerio","Aye, he is alright as long as you stay on his good side, he runs this place.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddCondition("lang","english");
    AddAdditionalText("Some people say he killed his father to rule this place, me, I recon it's probably true.");
    AddAdditionalText("#me chuckles: 'He is firm but fair if you stay on his good side, he keeps this town in free order. That is just how I like it, its good for trade.'");
    AddTraderTrigger("Valerio","Er ist in Ordnung, solange man es sich mit ihm nicht verscherzt. Er hat hier das sagen.");
    AddAdditionalTrigger("Guilianni");
    AddAdditionalTrigger("Don");
    AddAdditionalText("Manche sagen, er hätte seinen Vater umgebracht um hier das Kommando zu übernehmen, mag was wahres dran sein.");
    AddAdditionalText("#me lacht: 'Er ist hart aber fair, wenn man es sich nicht mit ihm verscherzt. Er hält die Zügel locker, so mag ich das; ist gut für das Geschäft.");
    AddTraderTrigger("Galmair","#me takes in a deep breath: 'Smell that, no place smells like that. I love this town its all for the free man.'");
    AddCondition("lang","english");
    AddAdditionalText("It can be a little rough around here some nights, but every man and some of the women need to let off a little steam.");
    AddAdditionalText("If you live around here, you are a free man. Around here do as you want just don't upset anyone bigger than you. And I am pretty big.");
    AddTraderTrigger("Galmair","#me atmet tief durch: 'Riecht ihr das, kein Ort riecht so gut. Ich liebe diesen Geruch der Freiheit.'");
    AddAdditionalText("Es kann hier nachts schonmal ruppig zugehen, aber jeder Mann und einige Frauen müssen auch einfach mal Dampf ablassen dürfen.");
    AddAdditionalText("Wenn ihr hier lebt, seid ihr freier Mann. Macht, was ihr wollt, solange ihr niemanden gegen euch aufbringt, der stärker ist als ihr. Und ich bin ziemlich stark.");
    AddTraderTrigger("rosaline","Don't know much about her, ain't she the Queen at Cadomyr?");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddCondition("lang","english");
    AddAdditionalText("I hear she is a right witch, that Queen of Cadomyr.");
    AddAdditionalText("From what I hear she is quite the woman, bit of a witch though but some men like that.");
    AddTraderTrigger("rosaline","Viel weiß ich nicht über sie, ist sie nicht die Königin in Cadomyr?");
    AddAdditionalTrigger("königin");
    AddAdditionalTrigger("queen");
    AddAdditionalTrigger("edwards");
    AddAdditionalText("Ich hab gehört, sie ist ein ziemliches Biest, die Königin von Cadomyr.");
    AddAdditionalText("Von dem, was ich gehört habe, ist sie ein echtes Weibsbild, aber auch ein Biest. Manche Männer mögen das...");
    AddTraderTrigger("Cadomyr","It's a nice place, but too many laws for me, I'm a free man not a slave to laws and Royals.");
    AddCondition("lang","english");
    AddAdditionalText("#me points to the ground: 'See, here a man can be what he wants, in Cadomyr you have a place and that's it for life. You live in the gutter, you die there.");
    AddAdditionalText("Good place, if you get into trouble, you will end up dead or in jail.");
    AddTraderTrigger("Cadomyr","Ein netter Ort, aber zuviele Gesetze für meinen Geschmack. Ich bin ein freier Mann und kein Sklave der Bräuche und Adeligen.");
    AddAdditionalText("#me zeigt auf den Boden: 'Seht, hier kann ein Mann sein, was er will, in Cadomyr kriegt jeder einen Platz zugewiesen und das für das ganze Leben. Wer im Dreck lebt, stirbt dort.");
    AddAdditionalText("Eigentlich ein guter Ort, wer Ärger macht, stirbt oder wird in den Kerker geworfen.");
    -- Main land factions 
    AddTraderTrigger("albar","Ah, good for trade that place, big harbour town is Ann-Korr and the oldest of the Albarian towns.");
    AddCondition("lang","english");
    AddTraderTrigger("albar","Ah, ein guter Platz zum Handeln, ein großer Hafen dort ist Ann-Korr, die älteste albarische Stadt.");
    AddTraderTrigger("gynk","If you're looking for gods, they are the towns to find. It is said the Gynkeesh have a temple for every god you can think of.");
    AddAdditionalTrigger("gync");
    AddCondition("lang","english");
    AddTraderTrigger("gync","Wenn ihr nach den Göttern sucht, schaut bei den Gynkeesh. Sie haben einen Tempel für jeden erdenklichen Gott.");
    AddAdditionalTrigger("gynk");
    AddTraderTrigger("salkama","Ah the town of the sun as it is called. Used to be just a fishing village now its a place of poets, art and a world known academy.");
    AddCondition("lang","english");
    AddTraderTrigger("salkama","Ah, die Stadt an der Sonne, so sagt man. War mal ein Fischerdorf, jetzt soll das ein Ort der Poeten, Künstler und Magier sein.");
    -- Gods; each NPC should react on AT LEAST one god, being a follower of said god 
    AddTraderTrigger("Irmorom","Irmorom be your best bet if you want good business.");
    AddCondition("lang","english");
    AddAdditionalText("Aye I have trust in the gods, Irmorom has always been good to me.");
    AddAdditionalText("Best save a coin and offer it to Irmorom if you want to prosper in this life.");
    AddTraderTrigger("Irmorom","Irmorom, der Gott der Wahl, wenn man ein gutes Geschäft haben will.");
    AddAdditionalText("Ja, ich vertraue den Göttern, Irmorom hat es immer gut mit mir gemeint.");
    AddAdditionalText("Spart einen Groschen und opfert ihn Irmorom, wenn ihr Erfolg haben wollt.");
    -- Catching quest triggers 
    AddTraderTrigger("quest","#me laughs: 'What? I'm a builders merchant, I have tools not quests.");
    AddCondition("lang","english");
    AddTraderTrigger("quest","#me lacht: 'Was? Ich bin ein Baustoffhändler. Ich habe Werkzeuge, keine Abenteuer.'");
    AddCondition("lang","german");
    AddTraderTrigger("task","#me shakes his head as he laughs: 'Look, buy or sell or move on, I don't have time for quests.'");
    AddAdditionalTrigger("adventure");
    AddTraderTrigger("Auftrag","#me schüttelt den Kopf und lacht: 'Schaut, kauft was oder haut ab, ich habe keine Zeit für Abenteuer.");
    AddAdditionalTrigger("Aufgabe");
    AddAdditionalTrigger("Abenteuer");
    -- Last catch: Think about keyphrases the player might say and that are not caught until here 
    AddTraderTrigger("Yes","Aye, now come and buy my wares!");
    AddTraderTrigger("Ja","Richtig, und jetzt kauf meine Waren!");
    AddTraderTrigger("Nein","Na dann nicht. Kauft trotzdem meine Waren.");
    AddTraderTrigger("No","Well, whatever. Want to buy my wares?");
    AddTraderTrigger("obi","What did you say?");
    AddCondition("lang","english");
    AddTraderTrigger("obi","Was habt ihr gesagt?");
    AddTraderTrigger("animal food","No discount on that!");
    AddTraderTrigger("tiernahrung","Darauf gibt es hier keinen Rabatt!");
    -- Cycletext: Please add at least(!) ten cycletext messages. The more, the better. You can use emotes (#me is green), too. 
    AddCycleText("Auf diese Steine können sie bauen!","Build yourself a fortune, buy your bricks here!");
    AddCycleText("Auch mit wenig Kieseln bekommst du deine Steine hier billig!","My prices are cheap as rock, get your stone here!");
    AddCycleText("Wenn ihr anderen eine Grube graben wollt, hier gibt es die Schaufeln dafür!","Don't dig around, get your shovel here!");
    AddCycleText("Mein Erz ist was dein Herz begehrt!","Need some ore? I've got it and more!");
    AddCycleText("Edelsteine so günstig, dass eure Augen funkeln werden.","Raw gems at a price that will make your eyes sparkle!");
    AddCycleText("Meine Spitzhacken gleiten durch den Stein wie durch Butter!","Want a pick, mine cut through stone as if it was butter!");
    AddCycleText("#me winkt aufgeregt mit der Hand: 'Kommt her, kommt alle, hier gibt es Werkzeuge und Baumaterial.'","#me waves his hand up: 'Come on, come all, get your tools and trade supplies here!'");
    AddCycleText("#me wischt sich die Stirn ab.","#me wipes his forehead with the back of an arm.");
    AddCycleText("#me spielt mit einem Goldnugget, er wirft es hoch und fängt es anschließend.","#me plays with a nugget, tossing it up then catching it");
    AddCycleText("#me formt mit seinen Händen einen Trichter und ruft: 'Nur keine Scheu, ich hab Geld wie Heu!'","#me holds a hand to the side of his mouth as he calls: 'Don't be shy, come and buy!'");
    AddCycleText("Wir geben ihrer Zukunft ein Zuhause!","We give your future a home!");
    AddCycleText("Wie, wo, was, weiß... Big Nik!","How, where, what, knows... Big Nik!");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if LangOK(originator,TradSpeakLang) then
            TellSmallTalk(message,originator);
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end