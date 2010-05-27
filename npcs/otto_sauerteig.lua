-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-19,0,0,4,false,'Otto Sauerteig','npc_otto_sauerteig.lua',0);

--name="Otto Sauerteig"
--position=-19,0,0
--sex=male
--race=halfling
--direction=south
-- last updated by Ardian on 25.11.2009

require("npcs.base.autonpcfunctions")
module("npcs.otto_sauerteig")

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
    npcs.base.autonpcfunctions.AddTraderTrigger("geschichte","Ich bin Otto Sauerteig. Ich und mein Bruder Martin haben diesen kleinen Hof hier. Es ist so wunderbar! Bis auf dieses kleine Problem.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto hat ein Problem! Vielleicht solltest du ihn danach fragen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("story","I am Otto Sauerteig. Me and my brother Martin own this small farmyard. It's marvellous, except for one small problem.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tale");
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto seems to have a problem! Maybe you should ask him about that.");
    npcs.base.autonpcfunctions.AddTraderTrigger("verkauf","Ich verkaufe leider nichts, allerdings hätte ich da ein Problem, bei dem du mir helfen könntest.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kauft");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was kaufst");
    npcs.base.autonpcfunctions.AddCondition("state","<",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto hat ein Problem! Vielleicht solltest du ihn dannach fragen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("sell","I unfortunately don't sell anything, but I have a problem you could help me with.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what buy");
    npcs.base.autonpcfunctions.AddCondition("state","<",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto seems to have a problem! Maybe you should ask him about that.");
    npcs.base.autonpcfunctions.AddTraderTrigger("verdienen","Ja natürlich, dieser Fuchs, der macht mich wahnsinnig. Immerzu streift er hinterm Haus rum! Dann verjage ich ihn mit Steinen. Du könntest aber mit einem anderen Problem helfen. Bist du tapfer?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("aufgabe");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("abenteuer");
    npcs.base.autonpcfunctions.AddCondition("state","<",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Ja natürlich, dieser Fuchs, der macht mich wahnsinnig. Immerzu streift er hinterm Haus rum! Dann verjage ich ihn mit Steinen. Du könntest aber mit einem anderen Problem helfen. Bist du tapfer?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("job");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("problem");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","<",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("quest","Yes of course, there is this fox which drives me crazy. All the time, it gazes around my house. Then I usually chase it away with stones. But you could help me with another problem. Are you brave?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("job");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("problem");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","<",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",6);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Yes of course, there is this fox which drives me crazy. All the time, it gazes around my house. Then I usually chase it away with stones. But you could help me with another problem. Are you brave?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("money");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("earn");
    npcs.base.autonpcfunctions.AddCondition("state","<",2);
    npcs.base.autonpcfunctions.AddCondition("qpg","<=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",6);
    -- -
    -- =============================================================
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Fantastisch. Ich hab's dir angesehen sonst hätte ich nicht gefragt. In unserem Keller, wo unsere Vorräte gelagert sind. Da ist so eine lästige Sache. Das Ding frisst alles auf. Kannst du es verjagen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Fantastic. I wouldn't have asked if i wouldn't have noticed when looking at you. There is a nasty thing in our cellar where we store our supplies. It's eating everything. Maybe you can chase it away?");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",7);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Oh! Keine Sache. Ich bin ja auch nicht so mutig. Ich frage jemand anderes.");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Oh! No problem. I'm not that brave either. I'll ask someone else.");
    npcs.base.autonpcfunctions.AddCondition("state","=",6);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","I'm so glad that you wanna give it a try. Take the key for the cellar and chase the nasty thing away. Ask me for 'Informations' when i shall repeat the details.");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",2161,1,333,20);
    npcs.base.autonpcfunctions.AddConsequence("inform","The halfling slides the key of the cellar between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Ich bin so froh, das du das machen willst. Nimm diesen Kellerschlüssel und verjag das Ding. Frage mich nach 'Informationen' wenn ich die Details wiederholen soll.");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",2161,1,333,20);
    npcs.base.autonpcfunctions.AddConsequence("inform","Der Halbling steckt dir den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Oh! No problem. I'm not that brave either. I'll ask someone else.");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Oh! Keine Sache. Ich bin ja auch nicht so mutig. Ich frage jemand anderes.");
    npcs.base.autonpcfunctions.AddCondition("state","=",7);
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("info","Open the door of the cellar with the key which i have given you. Try to chase the thing inside away. It's eating all the supplies!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("job");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("detail");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",2161,"all",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Open the door of the cellar with the key which i have given you. Try to chase the thing inside away. It's eating all the supplies!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("key");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",2161,"all",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("aufgabe","Öffne mit dem Schlüssel den ich dir gegeben habe die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schl[uü]ssel");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",2161,"all",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    npcs.base.autonpcfunctions.AddTraderTrigger("info","Öffne mit dem Schlüssel den ich dir gegeben habe die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("job");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("detail");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddCondition("item",2161,"all",">=",1);
    npcs.base.autonpcfunctions.AddConsequence("inform","Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    npcs.base.autonpcfunctions.AddTraderTrigger("info","Hm? You have the lost the key? Take my replacement key then. And do not lose it again! Open the door to the cellar with this key. Try to chase the thing inside away. It's eating all our supplies!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("job");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("detail");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("inform","The halfling slides the key of the cellar of the house between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    npcs.base.autonpcfunctions.AddConsequence("item",2161,1,333,20);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Hm? You have the lost the key? Take my replacement key then. And do not lose it again! Open the door to the cellar with this key. Try to chase the thing inside away. It's eating all our supplies!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("key");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("inform","The halfling slides the key of the cellar of the house between your fingers. You better put on some good shoes before you go downstairs. Who knows what is waiting down there for you?");
    npcs.base.autonpcfunctions.AddConsequence("item",2161,1,333,20);
    npcs.base.autonpcfunctions.AddTraderTrigger("aufgabe","Hm? Hast du den Schlüssel verloren? Dann nimm eben meinen Ersatzschlüssel. Und verlier ihn nicht wieder! Öffne mit diesem Schlüssel die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schl[uü]ssel");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("inform","Der Halbling steckt die den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    npcs.base.autonpcfunctions.AddConsequence("item",2161,1,333,20);
    npcs.base.autonpcfunctions.AddTraderTrigger("info","Hm? Hast du den Schlüssel verloren? Dann nimm eben meinen Ersatzschlüssel. Und verlier ihn nicht wieder! Öffne mit diesem Schlüssel die Kellertür. Versuch das Ding, darin zu verjagen. Es frisst unsere Vorräte auf!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("job");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("detail");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("inform","Der Halbling steckt die den Schlüssel zum Keller des Hauses zwischen die Finger. Am besten ziehst du gute Schuhe an, bevor du nach unten gehst, wer weiß was auf dich wartet?");
    npcs.base.autonpcfunctions.AddConsequence("item",2161,1,333,20);
    -- töte jetzt die bugs im celler. SObald alle tot sind setze queststatus=3 !!!
    -- Belohnung und Fraction+ festlegen!
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ha! You did it! How awesome! A real heroic deed! Martin and Otto Sauerteig are in your debt forever! I'm so thankful, i'll give you something!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2161,1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("inform","XXXInfo welche belohnungXXX");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Ha! Du hast es Gschafft! Wie großartig! Eine wahre Heldentat! Martin und Otto Sauerteig stehen für immer in deiner Schuld! Komm lass dir etwas geben, ich bin dir so Dankbar!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2161,1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("inform","XXXInfo welche belohnungXXX");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Ha! You did it! How awesome! A real heroic deed! Martin and Otto Sauerteig are in your debt forever! I'm so thankful, i'll give you something!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("celler");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("stock");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("thing");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2161,1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("inform","XXXInfo welche belohnungXXX");
    npcs.base.autonpcfunctions.AddTraderTrigger("aufgabe","Ha! Du hast es Gschafft! Wie großartig! Eine wahre Heldentat! Martin und Otto Sauerteig stehen für immer in deiner Schuld! Komm lass dir etwas geben, ich bin dir so Dankbar!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ding");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sache");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("keller");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vorr[aeä]te");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",3);
    npcs.base.autonpcfunctions.AddConsequence("deleteitem",2161,1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("inform","XXXInfo welche belohnungXXX");
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Thank you so much, once more. When there are 'things' in the cellar again then i'll tell you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("job","Nocheinmal Danke für deine Hilfe. Wenn wieder 'Dinge' im Keller sind sag ich's dir.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("quest");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("task","Thank you so much, once more. When there are 'things' in the cellar again then i'll tell you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("adventure");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mission");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("celler");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("stock");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("thing");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("aufgabe","Nocheinmal Danke für deine Hilfe. Wenn wieder 'Dinge' im Keller sind sag ich's dir.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("abenteuer");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ding");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sache");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("keller");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vorr[aeä]te");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("geschichte","Wir hatten einmal die Türe offen gelassen und dan war plötzlich das 'Ding' im Keller. Hihi. Gut das du uns geholfen hast. Jetzt passen Martin und ich aber besser auf. Ehrlich!");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("story","Once, we left the door open and then we suddenly had that 'thing' in our cellar. Hihi. What a luck that you helped. Martin and I will pay better attention from now on. Promised!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tale");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("geschichte","Es ist haarig und schwarz. Ich habe viel zu viel Angst um  selbst in den Keller zu gehen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ding");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sache");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("keller");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("vorr[aeä]te");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("story","It is hairy and black. I'm too afraid to go down into the cellar.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tale");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("stock");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("celler");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("thing");
    npcs.base.autonpcfunctions.AddCondition("qpg",">=",1);
    -- ===================================================================================
    npcs.base.autonpcfunctions.AddTraderTrigger("Sauerteig","Das ist mein Sippenname. Der von mir und Martin.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Martin Sauerteig","Martin ist mein Bruder. Wir haben gemeinsam diesem kleinen Hof erbaut. Ist er nicht heimelig?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Buch","Martin und ich haben ein Buch geschrieben! Kennst du's? Ich glaube es war irgendwo in Greenbriar.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Otto Sauerteig","Hiho. So heiß ich.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Sauerteig","That's a tribe name. The tribe name of me and Martin.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Martin Sauerteig","Martin is my brother. We built this small farmyard here together. Isn't it haimish?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Buch","Martin and me wrote a book together! Do you know it? It was somewhere in Greenbriar.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Otto Sauerteig","Hiho. That's me.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    -- -
    -- generall
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üue]+[sß]+e");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("guten tag");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gruß");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Seid gegrüßt");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Guten Abend");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Moin");
    npcs.base.autonpcfunctions.AddAdditionalText("Huhu!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallöchen!");
    npcs.base.autonpcfunctions.AddTraderTrigger("good day","Huhu!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greets");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hail");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Be greeted");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good morning");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hi ya!");
    npcs.base.autonpcfunctions.AddAdditionalText("Howdy-Ho!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Huhu!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger(",english");
    npcs.base.autonpcfunctions.AddAdditionalText("Hello!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hi ya!");
    npcs.base.autonpcfunctions.AddAdditionalText("Howdy-Ho!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hiho","Hallo.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hallo");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Hey");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Greebas");
    npcs.base.autonpcfunctions.AddAdditionalTrigger(",german");
    npcs.base.autonpcfunctions.AddAdditionalText("Huhu!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho!");
    npcs.base.autonpcfunctions.AddAdditionalText("Hallöchen!");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie hei[sß]+t du","Ich bin %NPCNAME.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie hei[sß]+t ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("dein name");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer seid");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer bist");
    npcs.base.autonpcfunctions.AddTraderTrigger("Farewell","Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Good bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Bye");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Fare thy well");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddAdditionalText(",Ciao");
    npcs.base.autonpcfunctions.AddAdditionalText("Adieu!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüß","Tschüß.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Tschüss");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wiedersehen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Gehabt euch wohl");
    npcs.base.autonpcfunctions.AddAdditionalText("Wiedersehen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Adieu!");
    npcs.base.autonpcfunctions.AddAdditionalText("Baba!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddAdditionalText(",Ciao");
    npcs.base.autonpcfunctions.AddAdditionalText("Adieu!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ciao","Tschüß.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Adieu");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Au revoir");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("Tschüss.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wiedersehen.");
    npcs.base.autonpcfunctions.AddAdditionalText("Auf bald!");
    npcs.base.autonpcfunctions.AddAdditionalText("Adieu!");
    npcs.base.autonpcfunctions.AddAdditionalText("Au revoir!");
    npcs.base.autonpcfunctions.AddAdditionalText("Baba!");
    npcs.base.autonpcfunctions.AddTraderTrigger("How are you","Well! Just great! Hihi.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How feel");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("How do you do");
    npcs.base.autonpcfunctions.AddAdditionalText("Great! Glorious!, And you?");
    npcs.base.autonpcfunctions.AddAdditionalText("Hui! Hihi!");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wie geht","Gut Gut! Wirklich fein! Hihi.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie fühlst");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("Wie ist es ergangen");
    npcs.base.autonpcfunctions.AddAdditionalText("Fantastisch, und du?");
    npcs.base.autonpcfunctions.AddAdditionalText("Hui! Hihi!");
    npcs.base.autonpcfunctions.AddTraderTrigger("your name","I'm %NPCNAME.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are you");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("who are thou");
    npcs.base.autonpcfunctions.AddTraderTrigger("I am","Nice to meet you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("I'm");
    npcs.base.autonpcfunctions.AddTraderTrigger("Ich bin","Schön dich kennen zu lernen.");
    -- Help
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Hihi! Wenn du Hilfe brauchst solltest du in einer Siedlung dannach suchen! Ich bin nur ein Bauer.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","Hihi! Wenn du Hilfe brauchst solltest du in einer Siedlung dannach suchen! Ich bin nur ein Bauer.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Hihi! If you need help you should search at a sttlement for it! I'm just a framer.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",4);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Frage mich nach 'Abenteuern' oder 'Problemen'. Wenn du andere Dinge brauchst gehts du besser zu einer Siedlung, deswegen.");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","Frage mich nach 'Abenteuern' oder 'Problemen'. Wenn du andere Dinge brauchst gehts du besser zu einer Siedlung, deswegen.");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Ask me for a 'quest' or 'problems'. If you need other things, its better to search a settlement and ask there.");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    -- smalltalk
    npcs.base.autonpcfunctions.AddTraderTrigger("murgo","Ihh! Go away with you milkspillerfriends! Gschu!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.orc);
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto Sauerteig narrwos his eyes, looking angry. He winks with the flail and fizzles at you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("murgo","Ihh! Verschwinde du Milchversauererfreund! Gschu!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.orc);
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto Sauerteig kneift die Augen zusammen und guckt böse. Er winkt mit seinem Dreschflegel und zischt dir zu.");
    npcs.base.autonpcfunctions.AddTraderTrigger("murgo","Where, where? Is he comming again? I will talk to Martin! You infrom the others! BEWARE! They're comming again! Ahhh!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto Sauerteig starts to yell out orders in panic, he takes his flail in both hands and shivers.");
    npcs.base.autonpcfunctions.AddTraderTrigger("murgo","Wo, wo? Kommt er schon wieder? Ich sag's Martin. Du infromierst die Anderen! ACHTUNG! Sie, kommen wieder! Ahhh!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("talk","begin");
    npcs.base.autonpcfunctions.AddTraderTrigger("rose","Rose, nein ich kenn sie nicht! Hihi. Wirklich nicht.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto Sauerteig's gesicht wird rot wie eine Tomate. Er grinst über beide Ohren.");
    npcs.base.autonpcfunctions.AddTraderTrigger("rose","Rose, no I never met. Hihi! Trust me!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("inform","Otto Sauerteig's face tunrs red like a tomato. He grinses broadly.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gibb","Gibb Gibberson. Hihi! Er geht immer ein bisschen buckelig, damit er sich den Kopf nicht an den Wolken stößt. Für einen echten Salkamarer ist er viel zu lang, wenn du mich fragst. Ich denke er lebt in diesem Troll's Bane.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gibberson","Gibb Gibberson. Hihi! Er geht immer ein bisschen buckelig, damit er sich den Kopf nicht an den Wolken stößt. Für einen echten Salkamarer ist er viel zu lang, wenn du mich fragst. Ich denke er lebt in diesem Troll's Bane.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gibb","Gibb Gibberson. Hihi! He npcs.base.autonpcfunctions.walks humpy! So he don't bang his head into the clouds. For a salkamarish he is much too long, if you ask me. He lives somweher in this Troll's Bane.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("Gibberson","Gibb Gibberson. Hihi! He npcs.base.autonpcfunctions.walks humpy! So he don't bang his head into the clouds. For a salkamarish he is much too long, if you ask me. He lives somweher in this Troll's Bane.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCycleText("#me bohrt in der Nase","#me drills with a finger into his nose.");
    npcs.base.autonpcfunctions.AddCycleText("#me schultert seinen Dreschflegel und atmet tief durch.","#me shoulders his flail and takes a deep breath.");
    npcs.base.autonpcfunctions.AddCycleText("#me wischt seine Nase am Hemdärmel ab.","#me sneezes into his shirtsleeve.");
    npcs.base.autonpcfunctions.AddCycleText("#me kratzt sich kurz zwischen den Beinen.","#me has a quick scratch between his legs.");
    npcs.base.autonpcfunctions.AddCycleText("#me pfeift eine lustige Melodie","#me whistles a amusing melody");
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
		
		if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npcs.base.autonpcfunctions.Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end