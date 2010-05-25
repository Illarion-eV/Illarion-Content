-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-19,0,0,4,false,'Otto Sauerteig','npc_otto_sauerteig.lua',0);

--name="Otto Sauerteig"
--position=-19,0,0
--sex=male
--race=halfling
--direction=south
-- last updated by Ardian on 25.11.2009
require("npcs.base.autonpcfunctions")

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

    QuestID = 27;
    -- last updated by Ardian on 25.11.2009
    -- The farmer Otto Sauerteig have probelms with some bugs in his celler
    -- Queststatus Overview
    -- 1:No Quest taken, but offered
    -- 2:Quest "stomp the bugs" taken
    -- 3: ~the bugs are dead
    -- 4:Quest 'stomp the bugs' solved.
    -- Quest: stomp the bugs
    -- DATAWERT FÜR SCHLÜSSEL AN DIE TÜR NOCH ANPASSEN(20?)
    -- BELOHNUNG NOCH EINFÜGEN
    -- Englische übersetzung. Achte auf Triggerhints! zB.: "XXXtriggercatch-'thing',"celler'. Verwende also bei der übersetzung unbedingt die wörter thing und celler.
    -- -
    AddTraderTrigger("geschichte","Ich bin Otto Sauerteig. Ich und mein Bruder Martin haben diesen kleinen Hof hier. Es ist so wunderbar! Bis auf dieses kleine Problem.");
    AddConsequence("inform","Otto hat ein Problem! Vielleicht solltest du ihn danach fragen.");
    AddTraderTrigger("story","I am Otto Sauerteig. Me and my brother Martin own this small farmyard. It's marvellous, except for one small problem.");
    AddAdditionalTrigger("tale");
    AddConsequence("inform","Otto seems to have a problem! Maybe you should ask him about that.");
    AddTraderTrigger("verkauf","Ich verkaufe leider nichts, allerdings hätte ich da ein Problem, bei dem du mir helfen könntest.");
    AddAdditionalTrigger("was kauft");
    AddAdditionalTrigger("was kaufst");
    AddCondition("state","<",2);
    AddCondition("qpg","<=",1);
    AddConsequence("inform","Otto hat ein Problem! Vielleicht solltest du ihn dannach fragen.");
    AddTraderTrigger("sell","I unfortunately don't sell anything, but I have a problem you could help me with.");
    AddAdditionalTrigger("what buy");
    AddCondition("state","<",2);
    AddCondition("qpg","<=",1);
    AddConsequence("inform","Otto seems to have a problem! Maybe you should ask him about that.");
    AddTraderTrigger("verdienen","Ja natürlich, dieser Fuchs, der macht mich wahnsinnig. Immerzu streift er hinterm Haus rum! Dann verjage ich ihn mit Steinen. Du könntest aber mit einem anderen Problem helfen. Bist du tapfer?");
    AddAdditionalTrigger("aufgabe");
    AddAdditionalTrigger("abenteuer");
    AddCondition("state","<",2);
    AddCondition("qpg","<=",1);
    AddConsequence("qpg","=",1);
    AddConsequence("state","=",6);
    AddTraderTrigger("quest","Ja natürlich, dieser Fuchs, der macht mich wahnsinnig. Immerzu streift er hinterm Haus rum! Dann verjage ich ihn mit Steinen. Du könntest aber mit einem anderen Problem helfen. Bist du tapfer?");
    AddAdditionalTrigger("job");
    AddAdditionalTrigger("problem");
    AddCondition("lang","german");
    AddCondition("state","<",2);
    AddCondition("qpg","<=",1);
    AddConsequence("qpg","=",1);
    AddConsequence("state","=",6);
    AddTraderTrigger("quest","Yes of course, there is this fox which drives me crazy. All the time, it gazes around my house. Then I usually chase it away with stones. But you could help me with another problem. Are you brave?");
    AddAdditionalTrigger("job");
    AddAdditionalTrigger("problem");
    AddCondition("lang","english");
    AddCondition("state","<",2);
    AddCondition("qpg","<=",1);
    AddConsequence("qpg","=",1);
    AddConsequence("state","=",6);
    AddTraderTrigger("task","Yes of course, there is this fox which drives me crazy. All the time, it gazes around my house. Then I usually chase it away with stones. But you could help me with another problem. Are you brave?");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("mission");
    AddAdditionalTrigger("money");
    AddAdditionalTrigger("earn");
    AddCondition("state","<",2);
    AddCondition("qpg","<=",1);
    AddConsequence("qpg","=",1);
    AddConsequence("state","=",6);
    -- -
    -- =============================================================
    AddTraderTrigger("ja","Fantastisch. Ich hab's dir angesehen sonst hätte ich nicht gefragt. In unserem Keller, wo unsere Vorräte gelagert sind. Da ist so eine lästige Sache. Das Ding frisst alles auf. Kannst du es verjagen?");
    AddCondition("state","=",6);
    AddCondition("qpg","=",1);
    AddConsequence("state","=",7);
    AddTraderTrigger("yes","Fantastic. I wouldn't have asked if i wouldn't have noticed when looking at you. There is a nasty thing in our cellar where we store our supplies. It's eating everything. Maybe you can chase it away?");
    AddCondition("state","=",6);
    AddCondition("qpg","=",1);
    AddConsequence("state","=",7);
    AddTraderTrigger("nein","Oh! Keine Sache. Ich bin ja auch nicht so mutig. Ich frage jemand anderes.");
    AddCondition("state","=",6);
    AddCondition("qpg","=",1);
    AddConsequence("state","=",1);
    AddTraderTrigger("no","Oh! No problem. I'm not that brave either. I'll ask someone else.");
    AddCondition("state","=",6);
    AddCondition("qpg","=",1);
    AddConsequence("state","=",1);
    AddTraderTrigger("yes","I'm so glad that you wanna give it a try. Take the key for the cellar and chase the nasty thing away. Ask me for 'Informations' when i shall repeat the details.");
    AddCondition("state","=",7);
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddConsequence("item",2161,1,333,20);
    AddConsequence("inform","The halfling slides the key of the cellar between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    AddTraderTrigger("ja","Ich bin so froh, das du das machen willst. Nimm diesen Kellerschlüssel und verjag das Ding. Frage mich nach 'Informationen' wenn ich die Details wiederholen soll.");
    AddCondition("state","=",7);
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddConsequence("item",2161,1,333,20);
    AddConsequence("inform","Der Halbling steckt dir den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    AddTraderTrigger("no","Oh! No problem. I'm not that brave either. I'll ask someone else.");
    AddCondition("state","=",7);
    AddCondition("qpg","=",1);
    AddConsequence("state","=",1);
    AddTraderTrigger("nein","Oh! Keine Sache. Ich bin ja auch nicht so mutig. Ich frage jemand anderes.");
    AddCondition("state","=",7);
    AddCondition("qpg","=",1);
    AddConsequence("state","=",1);
    AddTraderTrigger("info","Open the door of the cellar with the key which i have given you. Try to chase the thing inside away. It's eating all the supplies!");
    AddAdditionalTrigger("quest");
    AddAdditionalTrigger("job");
    AddAdditionalTrigger("detail");
    AddCondition("lang","english");
    AddCondition("qpg","=",2);
    AddCondition("item",2161,"all",">=",1);
    AddConsequence("inform","You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    AddTraderTrigger("task","Open the door of the cellar with the key which i have given you. Try to chase the thing inside away. It's eating all the supplies!");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("mission");
    AddAdditionalTrigger("key");
    AddCondition("qpg","=",2);
    AddCondition("item",2161,"all",">=",1);
    AddConsequence("inform","You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    AddTraderTrigger("aufgabe","Öffne mit dem Schlüssel den ich dir gegeben habe die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    AddAdditionalTrigger("abenteuer");
    AddAdditionalTrigger("schl[uü]ssel");
    AddCondition("qpg","=",2);
    AddCondition("item",2161,"all",">=",1);
    AddConsequence("inform","Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    AddTraderTrigger("info","Öffne mit dem Schlüssel den ich dir gegeben habe die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    AddAdditionalTrigger("quest");
    AddAdditionalTrigger("job");
    AddAdditionalTrigger("detail");
    AddCondition("lang","german");
    AddCondition("qpg","=",2);
    AddCondition("item",2161,"all",">=",1);
    AddConsequence("inform","Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    AddTraderTrigger("info","Hm? You have the lost the key? Take my replacement key then. And do not lose it again! Open the door to the cellar with this key. Try to chase the thing inside away. It's eating all our supplies!");
    AddAdditionalTrigger("quest");
    AddAdditionalTrigger("job");
    AddAdditionalTrigger("detail");
    AddCondition("lang","english");
    AddCondition("qpg","=",2);
    AddConsequence("inform","The halfling slides the key of the cellar of the house between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    AddConsequence("item",2161,1,333,20);
    AddTraderTrigger("task","Hm? You have the lost the key? Take my replacement key then. And do not lose it again! Open the door to the cellar with this key. Try to chase the thing inside away. It's eating all our supplies!");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("mission");
    AddAdditionalTrigger("key");
    AddCondition("qpg","=",2);
    AddConsequence("inform","The halfling slides the key of the cellar of the house between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    AddConsequence("item",2161,1,333,20);
    AddTraderTrigger("aufgabe","Hm? Hast du den Schlüssel verloren? Dann nimm eben meinen Ersatzschlüssel. Und verlier ihn nicht wieder! Öffne mit diesem Schlüssel die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    AddAdditionalTrigger("abenteuer");
    AddAdditionalTrigger("schl[uü]ssel");
    AddCondition("qpg","=",2);
    AddConsequence("inform","Der Halbling steckt die den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    AddConsequence("item",2161,1,333,20);
    AddTraderTrigger("info","Hm? Hast du den Schlüssel verloren? Dann nimm eben meinen Ersatzschlüssel. Und verlier ihn nicht wieder! Öffne mit diesem Schlüssel die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    AddAdditionalTrigger("quest");
    AddAdditionalTrigger("job");
    AddAdditionalTrigger("detail");
    AddCondition("lang","german");
    AddCondition("qpg","=",2);
    AddConsequence("inform","Der Halbling steckt die den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    AddConsequence("item",2161,1,333,20);
    -- töte jetzt die bugs im celler. SObald alle tot sind setze queststatus=3 !!!
    -- Belohnung und Fraction+ festlegen!
    AddTraderTrigger("job","Ha! You did it! How awesome! A real heroic deed! Martin and Otto Sauerteig are in your debt forever! I'm so thankful, i'll give you something!");
    AddAdditionalTrigger("quest");
    AddCondition("lang","english");
    AddCondition("qpg","=",3);
    AddConsequence("deleteitem",2161,1);
    AddConsequence("qpg","=",4);
    AddConsequence("inform","XXXInfo welche belohnungXXX");
    AddTraderTrigger("job","Ha! Du hast es Gschafft! Wie großartig! Eine wahre Heldentat! Martin und Otto Sauerteig stehen für immer in deiner Schuld! Komm lass dir etwas geben, ich bin dir so Dankbar!");
    AddAdditionalTrigger("quest");
    AddCondition("lang","german");
    AddCondition("qpg","=",3);
    AddConsequence("deleteitem",2161,1);
    AddConsequence("qpg","=",4);
    AddConsequence("inform","XXXInfo welche belohnungXXX");
    AddTraderTrigger("task","Ha! You did it! How awesome! A real heroic deed! Martin and Otto Sauerteig are in your debt forever! I'm so thankful, i'll give you something!");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("mission");
    AddAdditionalTrigger("celler");
    AddAdditionalTrigger("stock");
    AddAdditionalTrigger("thing");
    AddCondition("qpg","=",3);
    AddConsequence("deleteitem",2161,1);
    AddConsequence("qpg","=",4);
    AddConsequence("inform","XXXInfo welche belohnungXXX");
    AddTraderTrigger("aufgabe","Ha! Du hast es Gschafft! Wie großartig! Eine wahre Heldentat! Martin und Otto Sauerteig stehen für immer in deiner Schuld! Komm lass dir etwas geben, ich bin dir so Dankbar!");
    AddAdditionalTrigger("abenteuer");
    AddAdditionalTrigger("ding");
    AddAdditionalTrigger("sache");
    AddAdditionalTrigger("keller");
    AddAdditionalTrigger("vorr[aeä]te");
    AddCondition("qpg","=",3);
    AddConsequence("deleteitem",2161,1);
    AddConsequence("qpg","=",4);
    AddConsequence("inform","XXXInfo welche belohnungXXX");
    AddTraderTrigger("job","Thank you so much, once more. When there are 'things' in the cellar again then i'll tell you.");
    AddAdditionalTrigger("quest");
    AddCondition("lang","english");
    AddCondition("qpg","=",4);
    AddTraderTrigger("job","Nocheinmal Danke für deine Hilfe. Wenn wieder 'Dinge' im Keller sind sag ich's dir.");
    AddAdditionalTrigger("quest");
    AddCondition("lang","german");
    AddCondition("qpg","=",4);
    AddTraderTrigger("task","Thank you so much, once more. When there are 'things' in the cellar again then i'll tell you.");
    AddAdditionalTrigger("adventure");
    AddAdditionalTrigger("mission");
    AddAdditionalTrigger("celler");
    AddAdditionalTrigger("stock");
    AddAdditionalTrigger("thing");
    AddCondition("qpg","=",4);
    AddTraderTrigger("aufgabe","Nocheinmal Danke für deine Hilfe. Wenn wieder 'Dinge' im Keller sind sag ich's dir.");
    AddAdditionalTrigger("abenteuer");
    AddAdditionalTrigger("ding");
    AddAdditionalTrigger("sache");
    AddAdditionalTrigger("keller");
    AddAdditionalTrigger("vorr[aeä]te");
    AddCondition("qpg","=",4);
    AddTraderTrigger("geschichte","Wir hatten einmal die Türe offen gelassen und dan war plötzlich das 'Ding' im Keller. Hihi. Gut das du uns geholfen hast. Jetzt passen Martin und ich aber besser auf. Ehrlich!");
    AddCondition("qpg","=",4);
    AddTraderTrigger("story","Once, we left the door open and then we suddenly had that 'thing' in our cellar. Hihi. What a luck that you helped. Martin and I will pay better attention from now on. Promised!");
    AddAdditionalTrigger("tale");
    AddCondition("qpg","=",4);
    AddTraderTrigger("geschichte","Es ist haarig und schwarz. Ich habe viel zu viel Angst um  selbst in den Keller zu gehen.");
    AddAdditionalTrigger("ding");
    AddAdditionalTrigger("sache");
    AddAdditionalTrigger("keller");
    AddAdditionalTrigger("vorr[aeä]te");
    AddCondition("qpg",">=",1);
    AddTraderTrigger("story","It is hairy and black. I'm too afraid to go down into the cellar.");
    AddAdditionalTrigger("tale");
    AddAdditionalTrigger("stock");
    AddAdditionalTrigger("celler");
    AddAdditionalTrigger("thing");
    AddCondition("qpg",">=",1);
    -- ===================================================================================
    AddTraderTrigger("Sauerteig","Das ist mein Sippenname. Der von mir und Martin.");
    AddCondition("lang","german");
    AddTraderTrigger("Martin Sauerteig","Martin ist mein Bruder. Wir haben gemeinsam diesem kleinen Hof erbaut. Ist er nicht heimelig?");
    AddCondition("lang","german");
    AddTraderTrigger("Buch","Martin und ich haben ein Buch geschrieben! Kennst du's? Ich glaube es war irgendwo in Greenbriar.");
    AddCondition("lang","german");
    AddTraderTrigger("Otto Sauerteig","Hiho. So heiß ich.");
    AddCondition("lang","german");
    AddTraderTrigger("Sauerteig","That's a tribe name. The tribe name of me and Martin.");
    AddCondition("lang","english");
    AddTraderTrigger("Martin Sauerteig","Martin is my brother. We built this small farmyard here together. Isn't it haimish?");
    AddCondition("lang","english");
    AddTraderTrigger("Buch","Martin and me wrote a book together! Do you know it? It was somewhere in Greenbriar.");
    AddCondition("lang","english");
    AddTraderTrigger("Otto Sauerteig","Hiho. That's me.");
    AddCondition("lang","english");
    -- -
    -- generall
    AddTraderTrigger("hallo","Hallo.");
    AddAdditionalTrigger("gr[üue]+[sß]+e");
    AddAdditionalTrigger("guten tag");
    AddAdditionalTrigger("Gruß");
    AddAdditionalTrigger("Seid gegrüßt");
    AddAdditionalTrigger("Guten Abend");
    AddAdditionalTrigger("Tach");
    AddAdditionalTrigger("Moin");
    AddAdditionalText("Huhu!");
    AddAdditionalText("Hiho!");
    AddAdditionalText("Hallöchen!");
    AddTraderTrigger("good day","Huhu!");
    AddAdditionalTrigger("greetings");
    AddAdditionalTrigger("greets");
    AddAdditionalTrigger("hail");
    AddAdditionalTrigger("hello");
    AddAdditionalTrigger("Be greeted");
    AddAdditionalTrigger("Good morning");
    AddAdditionalText("Hello!");
    AddAdditionalText("Hiho!");
    AddAdditionalText("Hi ya!");
    AddAdditionalText("Howdy-Ho!");
    AddTraderTrigger("Hiho","Huhu!");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger(",english");
    AddAdditionalText("Hello!");
    AddAdditionalText("Hiho!");
    AddAdditionalText("Hi ya!");
    AddAdditionalText("Howdy-Ho!");
    AddTraderTrigger("Hiho","Hallo.");
    AddAdditionalTrigger("Hallo");
    AddAdditionalTrigger("Hey");
    AddAdditionalTrigger("Greebas");
    AddAdditionalTrigger(",german");
    AddAdditionalText("Huhu!");
    AddAdditionalText("Hiho!");
    AddAdditionalText("Hallöchen!");
    AddTraderTrigger("wie hei[sß]+t du","Ich bin %NPCNAME.");
    AddAdditionalTrigger("wie hei[sß]+t ihr");
    AddAdditionalTrigger("dein name");
    AddAdditionalTrigger("wer seid");
    AddAdditionalTrigger("wer bist");
    AddTraderTrigger("Farewell","Farewell.");
    AddAdditionalTrigger("Good bye");
    AddAdditionalTrigger("Bye");
    AddAdditionalTrigger("Fare thy well");
    AddAdditionalText("Good bye.");
    AddAdditionalText(",Ciao");
    AddAdditionalText("Adieu!");
    AddTraderTrigger("Tschüß","Tschüß.");
    AddAdditionalTrigger("Tschüss");
    AddAdditionalTrigger("Wiedersehen");
    AddAdditionalTrigger("Gehabt euch wohl");
    AddAdditionalText("Wiedersehen.");
    AddAdditionalText("Adieu!");
    AddAdditionalText("Baba!");
    AddTraderTrigger("Ciao","Farewell.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","english");
    AddAdditionalText("Good bye.");
    AddAdditionalText(",Ciao");
    AddAdditionalText("Adieu!");
    AddTraderTrigger("Ciao","Tschüß.");
    AddAdditionalTrigger("Adieu");
    AddAdditionalTrigger("Au revoir");
    AddCondition("lang","german");
    AddAdditionalText("Tschüss.");
    AddAdditionalText("Wiedersehen.");
    AddAdditionalText("Auf bald!");
    AddAdditionalText("Adieu!");
    AddAdditionalText("Au revoir!");
    AddAdditionalText("Baba!");
    AddTraderTrigger("How are you","Well! Just great! Hihi.");
    AddAdditionalTrigger("How feel");
    AddAdditionalTrigger("How do you do");
    AddAdditionalText("Great! Glorious!, And you?");
    AddAdditionalText("Hui! Hihi!");
    AddTraderTrigger("Wie geht","Gut Gut! Wirklich fein! Hihi.");
    AddAdditionalTrigger("Wie fühlst");
    AddAdditionalTrigger("Wie ist es ergangen");
    AddAdditionalText("Fantastisch, und du?");
    AddAdditionalText("Hui! Hihi!");
    AddTraderTrigger("your name","I'm %NPCNAME.");
    AddAdditionalTrigger("who are you");
    AddAdditionalTrigger("who are thou");
    AddTraderTrigger("I am","Nice to meet you.");
    AddAdditionalTrigger("I'm");
    AddTraderTrigger("Ich bin","Schön dich kennen zu lernen.");
    -- Help
    AddTraderTrigger("hilfe","Hihi! Wenn du Hilfe brauchst solltest du in einer Siedlung dannach suchen! Ich bin nur ein Bauer.");
    AddCondition("qpg","=",4);
    AddConsequence("state","=",0);
    AddTraderTrigger("helfen","Hihi! Wenn du Hilfe brauchst solltest du in einer Siedlung dannach suchen! Ich bin nur ein Bauer.");
    AddCondition("qpg","=",4);
    AddConsequence("state","=",0);
    AddTraderTrigger("help","Hihi! If you need help you should search at a sttlement for it! I'm just a framer.");
    AddCondition("qpg","=",4);
    AddConsequence("state","=",0);
    AddTraderTrigger("hilfe","Frage mich nach 'Abenteuern' oder 'Problemen'. Wenn du andere Dinge brauchst gehts du besser zu einer Siedlung, deswegen.");
    AddConsequence("state","=",0);
    AddTraderTrigger("helfen","Frage mich nach 'Abenteuern' oder 'Problemen'. Wenn du andere Dinge brauchst gehts du besser zu einer Siedlung, deswegen.");
    AddConsequence("state","=",0);
    AddTraderTrigger("help","Ask me for a 'quest' or 'problems'. If you need other things, its better to search a settlement and ask there.");
    AddConsequence("state","=",0);
    -- smalltalk
    AddTraderTrigger("murgo","Ihh! Go away with you milkspillerfriends! Gschu!");
    AddCondition("lang","english");
    AddCondition("race", CCharacter.orc);
    AddConsequence("inform","Otto Sauerteig narrwos his eyes, looking angry. He winks with the flail and fizzles at you.");
    AddTraderTrigger("murgo","Ihh! Verschwinde du Milchversauererfreund! Gschu!");
    AddCondition("lang","german");
    AddCondition("race", CCharacter.orc);
    AddConsequence("inform","Otto Sauerteig kneift die Augen zusammen und guckt böse. Er winkt mit seinem Dreschflegel und zischt dir zu.");
    AddTraderTrigger("murgo","Where, where? Is he comming again? I will talk to Martin! You infrom the others! BEWARE! They're comming again! Ahhh!");
    AddCondition("lang","english");
    AddConsequence("inform","Otto Sauerteig starts to yell out orders in panic, he takes his flail in both hands and shivers.");
    AddTraderTrigger("murgo","Wo, wo? Kommt er schon wieder? Ich sag's Martin. Du infromierst die Anderen! ACHTUNG! Sie, kommen wieder! Ahhh!");
    AddCondition("lang","german");
    AddConsequence("talk","begin");
    AddTraderTrigger("rose","Rose, nein ich kenn sie nicht! Hihi. Wirklich nicht.");
    AddCondition("lang","german");
    AddConsequence("inform","Otto Sauerteig's gesicht wird rot wie eine Tomate. Er grinst über beide Ohren.");
    AddTraderTrigger("rose","Rose, no I never met. Hihi! Trust me!");
    AddCondition("lang","english");
    AddConsequence("inform","Otto Sauerteig's face tunrs red like a tomato. He grinses broadly.");
    AddTraderTrigger("Gibb","Gibb Gibberson. Hihi! Er geht immer ein bisschen buckelig, damit er sich den Kopf nicht an den Wolken stößt. Für einen echten Salkamarer ist er viel zu lang, wenn du mich fragst. Ich denke er lebt in diesem Troll's Bane.");
    AddCondition("lang","german");
    AddTraderTrigger("Gibberson","Gibb Gibberson. Hihi! Er geht immer ein bisschen buckelig, damit er sich den Kopf nicht an den Wolken stößt. Für einen echten Salkamarer ist er viel zu lang, wenn du mich fragst. Ich denke er lebt in diesem Troll's Bane.");
    AddCondition("lang","german");
    AddTraderTrigger("Gibb","Gibb Gibberson. Hihi! He walks humpy! So he don't bang his head into the clouds. For a salkamarish he is much too long, if you ask me. He lives somweher in this Troll's Bane.");
    AddCondition("lang","english");
    AddTraderTrigger("Gibberson","Gibb Gibberson. Hihi! He walks humpy! So he don't bang his head into the clouds. For a salkamarish he is much too long, if you ask me. He lives somweher in this Troll's Bane.");
    AddCondition("lang","english");
    AddCycleText("#me bohrt in der Nase","#me drills with a finger into his nose.");
    AddCycleText("#me schultert seinen Dreschflegel und atmet tief durch.","#me shoulders his flail and takes a deep breath.");
    AddCycleText("#me wischt seine Nase am Hemdärmel ab.","#me sneezes into his shirtsleeve.");
    AddCycleText("#me kratzt sich kurz zwischen den Beinen.","#me has a quick scratch between his legs.");
    AddCycleText("#me pfeift eine lustige Melodie","#me whistles a amusing melody");
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
		if string.find(message,"set 1")~=nil then   --debug
        	originator:setQuestProgress(27,1);
		elseif string.find(message,"set 2")~=nil then   --debug
        	originator:setQuestProgress(27,2);
		elseif string.find(message,"set 3")~=nil then   --debug
        	originator:setQuestProgress(27,3);
		elseif string.find(message,"set 4")~=nil then   --debug
        	originator:setQuestProgress(27,4);
  		elseif string.find(message,"get qpg")~=nil then   --debug
			originator:inform("Queststatus für 27: "..originator:getQuestProgress(27));
		end
		
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