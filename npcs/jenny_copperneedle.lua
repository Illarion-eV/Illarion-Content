--Name:        Jenny Copperneedle
--Race:        Halbling
--Town:        Newbie Insel
--Function:    Schneidern beibringen
--Position:    x=-76 y=-101 z=0
--Facing:      south
--Last Update: 05/07/2008
--Update by:   pharse


require("npcs.base.autonpcfunctions")
module("npcs.jenny_copperneedle")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Bitte nicht anfassen");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Please don't touch.");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);

	-- ********* START DYNAMIC PART ********

    -- Small talk
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Hello my friend! I am "..thisNPC.name..", the best tailor of this island. If you want, I show you how to become a good tailor.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Hallo mein Freund! Ich bin "..thisNPC.name..", die beste Schneiderin auf der Insel. Wenn du möchtest zeige ich dir, wie du ein guter Schneider wirst.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddTraderTrigger("who you","I am "..thisNPC.name..", the best tailor of this island. If you want, I show you how to become a good tailor.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer du","Hallo mein Freund! Ich bin "..thisNPC.name..", die beste Schneiderin auf der Insel. Wenn du möchtest zeige ich dir, wie du ein guter Schneider wirst.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npcs.base.autonpcfunctions.AddTraderTrigger("dank","Bitte sehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("thank","You're welcome");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Bye, bye.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npcs.base.autonpcfunctions.AddAdditionalText("Be well, my friend!");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell, until we meet again.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tsch[üu][ßs]","Auf Wiedersehen, mein Freund!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tschue[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wiederseh");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("auf bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalText("Tschüss auch.");
    npcs.base.autonpcfunctions.AddAdditionalText("Leb wohl, bis zum nächsten Mal.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Wenn du möchtest kann ich dir zeigen, wie man schneidert. Möchtest du?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","<",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","If you want, I can show you how to tailor. Want you?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","<",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("reset","Status reset!");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: 0 - 1 (start teaching)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("tailor","You want to learn how to tailor? I am very pleased to hear that. Want to start right away?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("craft");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("show");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("schneider","Du möchtest also lernen, wie man schneidert? Das freut mich sehr. Wollen wir gleich anfangen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("handwerk");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("zeig");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);

    -- Starthilfe
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Sag \"Hilfe\" wenn du nicht weiter weißt.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Say \"help\" if you don't know, what to do.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);

    -- Status: 1 -> 10 (Schere zum Wolle holen)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Excellent. Firstly, we need some wool. There are some sheeps over there. Stay directly in front of a sheep and 'use' the scissors. Come again when you have have at least 15 pieces of wool.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("item",6,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hervorragend! Als erstes brauchen wir Wolle. Da vorne grasen ein paar Schafe. Du musst dich direkt vor eines der Schafe stellen und die Schere 'benutzen'. Komm wieder wenn du mindestens 15 Einheiten Wolle hast.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("item",6,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: 1 (eine andere Anwort)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I ask you if I should teach you tailoring. Just say \"yes\" or \"no\".");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich habe dich gefragt, ob ich dir das Schneidern beibringen soll...sag einfach \"ja\", oder \"nein\".");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);

    -- Status: 10 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Does it not work? You must stay facing the sheep and then 'use' the scissors. This needs much dexterity from time to time, because the sheeps move, but with a bit training it works fine. Otherwise I can give you some wool. Want you?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",11);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Klappt etwas nicht? Du musst dich direkt neben das Schaf stellen und dann die Schere 'benutzen. Das erfordert manchmal viel geschickt, weil die Schafe sich bewegen, aber mit etwas Übung wirst du es sicher schaffen. Ich kann dir aber auch einfach etwas Wolle geben. Möchtest du das?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",11);

    -- Status: 11 (Auf Wunsch wird Wolle gegeben)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Here you go. This should be enough for now. Should we continue?");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",170,15,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hier, bitte sehr. Das sollte erstmal reichen. Wollen wir dann weitermachen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",170,15,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Yes, retry it. That is the right way.");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Ja, versuch es ruhig selbst nochmal. Das ist der richtige Weg.");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);

    -- Status: >=1 (Eine neue Schere)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("scissors","Did you need a new scissors? Here you have one.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",1);
    npcs.base.autonpcfunctions.AddCondition("item",6,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",6,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("schere","Brauchst du eine neue Schere? Hier hast du eine.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",1);
    npcs.base.autonpcfunctions.AddCondition("item",6,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",6,1,999,0);

    -- Status: >=1 (Keine Schafe mehr da)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("schaf","Es sind keine Schafe mehr da? Warte einfach einen Augenblick, es kommen bestimmt gleich neue.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("sheep","There are no more sheeps arround? Just wait a minute, I'm sure, that they come some new soon.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",1);

    -- Status: 10 (Noch zu wenig Wolle)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","You still have to little wool. Come back, when you have at least 15 pieces of wool.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",170,"all","<",15);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Du hast noch zu wenig Wolle. Komm wieder, wenn du mindestens 15 Einheiten hast.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",170,"all","<",15);

    -- Status: 10 -> 2 (Die Wolle ist da - weitermachen?)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Great! You did it! One more hint: It is possible to get wool when you kill sheep , but it's much more productive when you just shear the living sheep. Well, next I will explain to you how you can work up wool to a ball of wool. Ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",170,"all",">",14);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Du hast's geschafft! Ein Hinweis noch: Du bekommst auch Wolle, wenn du die Schafe angreifst und tötest. Aber es ist viel effektiver das lebende Schaf zu scheren. Gut, als nächstes erkläre ich dir, wie du die Wolle zu einem Wollknäuel verarbeiten kannst. Bereit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",170,"all",">",14);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);

    -- Status: 2 -> 20 (Wolle spinnen)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Fine. The next is to spin the wool. You see that spinning wheel over there? Take the scissors in your hand, the wool at your belt and go in front of it. When you 'use' the spinning weel you start automatically to spin. Come back, when you have spun all your wool to balls.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("state","=",20);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Fein! Als nächstes muss die Wolle gesponnen werden. Siehst du das Spinnrad da vorne? Nimm die Schere in die Hand und die Wolle an den Gürtel und stell dich davor. Wenn du nun das Spinnrad 'benutzt' beginnst du zu spinnen. Komm zurück, wenn du all deine Wolle zu Wollknäulen versponnen hast.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("state","=",20);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);

    -- Status: 20 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Does it not work? You must hold the scissors in your hand and the wool 'in' your belt. Stay directly in front of the spinning weel and 'use' it. Otherwise I can give you some balls of wool. Want you?");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddConsequence("state","=",21);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Klappt etwas nicht? Du must die Schere in der Hand halten und die Wolle 'im' Gürtel haben. Stell dich direkt vor das Spinnrad und 'benute' das Spinnrad. Ich kann dir aber auch einfach etwas Wolle geben. Möchtest du das?");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddConsequence("state","=",21);

    -- Status: 21 (Auf Wunsch werden Wollknäule gegeben)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Here you go. This should be enough for now. Should we continue?");
    npcs.base.autonpcfunctions.AddCondition("state","=",21);
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddConsequence("item",168,15,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hier, bitte sehr. Das sollte erstmal reichen. Wollen wir dann weitermachen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",21);
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddConsequence("item",168,15,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Yes, retry it. That is the right way.");
    npcs.base.autonpcfunctions.AddCondition("state","=",21);
    npcs.base.autonpcfunctions.AddConsequence("state","=",20);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Ja, versuch es ruhig selbst noch einmal. Das ist der richtige Weg.");
    npcs.base.autonpcfunctions.AddCondition("state","=",21);
    npcs.base.autonpcfunctions.AddConsequence("state","=",20);

    -- Status: 20 (Noch zu wenig Wolle)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","You still have to little balls of wool. Come back, when you have at least 15 pieces.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("item",168,"all","<",15);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Du hast noch zu wenig Wollknäule. Komm wieder, wenn du mindestens 15 Stück hast.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("item",168,"all","<",15);

    -- Status: 20 -> 3 (Die Wollknäule ist da - weitermachen?)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Great! Now I show you how to produce cloth with this balls of wool. Ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("item",168,"all",">",14);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Dann zeig ich dir jetzt, wie du aus den Wollknäulen Stoffe herstellen kannst. Bist du soweit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("item",168,"all",">",14);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",3);

    -- Status: 3 -> 30 (Wollknäule weben)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","With a loom you can weave the ball of wools to cloth. For this, stay in front of the loom and 'use' it. You should have the scissors in your hand and the balls of wool 'in' your belt for this. Come back, when you have finished.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",30);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Mit einem Webstuhl kannst du nun die Wollknäule zu Stoff weben. Stell dich einfach vor den Webstuhl und 'benutze' ihn. Du solltest dafür die Schere in der Hand und die Wollknäule 'im' Gürtel haben. Wenn du fertig bist, dann komm wieder.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",30);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",3);

    -- Status: 30 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Does it not work? You must hold the scissors in your hand and the balls of wool 'in' your belt. Stay directly in front of the loom weel and 'use' it. Otherwise I can give you some cloth. Want you?");
    npcs.base.autonpcfunctions.AddCondition("state","=",30);
    npcs.base.autonpcfunctions.AddConsequence("state","=",31);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Klappt etwas nicht? Du must die Schere in der Hand halten und die Wollknäule 'im' Gürtel haben. Stell dich direkt vor den Webstuhl und 'benute' den Webstuhl. Ich kann dir aber auch einfach etwas Stoff geben. Möchtest du das?");
    npcs.base.autonpcfunctions.AddCondition("state","=",30);
    npcs.base.autonpcfunctions.AddConsequence("state","=",31);

    -- Status: 	31 (Auf Wunsch wird grauer Stoff gegeben)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Here you go. This should be enough for now. Should we continue?");
    npcs.base.autonpcfunctions.AddCondition("state","=",31);
    npcs.base.autonpcfunctions.AddConsequence("state","=",4);
    npcs.base.autonpcfunctions.AddConsequence("item",176,5,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hier, bitte sehr. Das sollte erstmal reichen. Wollen wir dann weitermachen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",31);
    npcs.base.autonpcfunctions.AddConsequence("state","=",4);
    npcs.base.autonpcfunctions.AddConsequence("item",176,5,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Yes, retry it. That is the right way.");
    npcs.base.autonpcfunctions.AddCondition("state","=",31);
    npcs.base.autonpcfunctions.AddConsequence("state","=",30);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Ja, versuch es ruhig selbst noch einmal. Das ist der richtige Weg.");
    npcs.base.autonpcfunctions.AddCondition("state","=",31);
    npcs.base.autonpcfunctions.AddConsequence("state","=",30);

    -- Status: 30 (Noch kein Stoff da)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Before we can continue you need some cloth. Tell me, if you need help.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",30);
    npcs.base.autonpcfunctions.AddCondition("item",176,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Bevor wir weitermachen brauchst du erst Stoff. Wenn du hilfe brauchst, dann sag mir einfach bescheid.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",30);
    npcs.base.autonpcfunctions.AddCondition("item",176,"all","=",0);

    -- Status: 30 -> 4 (Grauer Stoff ist da - weitermachen?)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Excellent work! Now we can continue with the next step. Ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",30);
    npcs.base.autonpcfunctions.AddCondition("item",176,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Jetzt können wir mit dem nächsten Schritt weitermachen. Bist du soweit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",30);
    npcs.base.autonpcfunctions.AddCondition("item",176,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",4);

    -- Status: 4 -> 40 (Garn herstellen)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","For tailoring you need among cloth some thread. You can produce it by yourself, when you work up the entrails of animals with a scissors. The best is to try it: Kill one of the animals around, put the entrails 'into' your belt and 'use' the scissors.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddConsequence("state","=",40);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Zum schneidern brauchst du neben Stoff auch noch Garn. Das kannst du einfach selbst herstellen, indem du die Eingeweide von Tieren mit einer Schere bearbeitest. Versuche es doch am besten gleich einmal selbst. Töte eines der Tiere, die hier herumlaufen, lege die Eingeweide 'in' deinen Gürtel und benutze die Schere.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddConsequence("state","=",40);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",4);

    -- Status: 40 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Does it not work? You must hold the scissors in your hand and the entrails in' your belt. Then just 'use' the scissors. Otherwise I can give you some thread. Want you?");
    npcs.base.autonpcfunctions.AddCondition("state","=",40);
    npcs.base.autonpcfunctions.AddConsequence("state","=",41);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Klappt etwas nicht? Du must die Schere in der Hand halten und die Eingeweide 'im' Gürtel haben. Dann einfach die Schere 'benutzen'. Ich kann dir aber auch einfach etwas Stoff geben. Möchtest du das?");
    npcs.base.autonpcfunctions.AddCondition("state","=",40);
    npcs.base.autonpcfunctions.AddConsequence("state","=",41);

  -- Status: 41 (Auf Wunsch wird Garn gegeben)
  --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Here you go. This should be enough for now. Should we continue?");
    npcs.base.autonpcfunctions.AddCondition("state","=",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddConsequence("item",50,5,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hier, bitte sehr. Das sollte erstmal reichen. Wollen wir dann weitermachen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddConsequence("item",50,5,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Yes, retry it. That is the right way.");
    npcs.base.autonpcfunctions.AddCondition("state","=",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",40);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Ja, versuch es ruhig selbst noch einmal. Das ist der richtige Weg.");
    npcs.base.autonpcfunctions.AddCondition("state","=",41);
    npcs.base.autonpcfunctions.AddConsequence("state","=",40);

    -- Status 40 (Noch kein Garn da)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Before we can continue you need some thread. Tell me, if you need help.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",40);
    npcs.base.autonpcfunctions.AddCondition("item",50,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Bevor wir weitermachen brauchst du erst Garn. Wenn du hilfe brauchst, dann sag mir einfach bescheid.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",40);
    npcs.base.autonpcfunctions.AddCondition("item",50,"all","=",0);

    -- Status: 40 (Garn ist da - weitermachen?)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Excellent work! Now we can start with tailoring cloth. Ready?");
    npcs.base.autonpcfunctions.AddCondition("state","=",40);
    npcs.base.autonpcfunctions.AddCondition("item",50,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Jetzt können wir anfangen mit dem nähen von Kleidung. Bist du soweit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",40);
    npcs.base.autonpcfunctions.AddCondition("item",50,"all",">",0);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",5);


    -- Status: 5 -> 50 (Schneidern)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Here, take this needle. You should have all for tailoring you need for tailor your first clothing. If you need more cloth or thread just ask me. I give you more. Take the needle in your hand and the cloth and the thread 'in' your belt. Stay in front of the tailor table and 'use' the scissors. A menu open, where you can choose what do you want tailor. Please choose the \"grey coat\".");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddConsequence("item",47,1,999,0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",50);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hier, nimm diese Nadel. Du solltest nun alles haben, was du brauchst um dein erstes Kleidungsstück zu nähen. Wenn du noch mehr Stoff oder Garn brauchst, dann sag mir einfach bescheid. Ich kann dir auch noch was davon geben. Nimm die Nadel in die Hand und den Stoff und das Garn 'in' den Gürtel. Stell dich dann vor den Schneidertisch und 'benutze' die Nadel. In dem Menü, welches sich dann öffnet kannst du auswählen, was du nähen willst. Wähle bitte den \"grauen Mantel.\"");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddConsequence("item",47,1,999,0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",50);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",5);

    -- Status: 50 (Mehr Garn)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("garn","Du brauchst mehr Garn, richtig? Hier bitte sehr.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("item",50,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",50,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("thread","You need more thread, right? Here you are.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("item",50,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",50,5,333,0);

    -- Status: 50 (Mehr Stoff)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("stoff","Du brauchst mehr grauen Stoff, richtig? Hier bitte sehr.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("item",176,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",176,5,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("cloth","You need more grey cloth, right? Here you are.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("item",176,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",176,5,333,0);

    -- Status: 50 (Neue Nadel)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("needle","Did you need an new needle? Here you have one.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("item",47,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",47,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nadel","Brauchst du eine neue Nadel? Hier hast du eine.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("item",47,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",47,1,999,0);

    -- Status: 50 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Does it not work? You must hold the needle in your hand and the grey cloth and the thread  in' your belt. Then 'use' the needle to open the main menu. The red shirt is the symbol for clothing. Klick on the shirt to open the clothing-menu. In this menu choose the \"grey coat\".");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("state","<",52);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Klappt etwas nicht? Du must die Nadel in der Hand halten und den Stoff und das Garn am Gürtel tragen. Dann 'benutze' die Nadel um das Haupmenü zu öffnen. Das rote Hemd ist das Symbol für Kleidung. Klick darauf um das Kleidungsmenü zu öffnen. In diesem Menü wähle dann \"Grauer Mantel\".");
    npcs.base.autonpcfunctions.AddCondition("state",">=",50);
    npcs.base.autonpcfunctions.AddCondition("state","<",52);

    -- Status: 50 (Kein Mantel da)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Go to the tailor table and produce a grey coat. Come back, when you have finished.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",50);
    npcs.base.autonpcfunctions.AddCondition("item",196,"all","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Geh zum Schneidertisch und nähe einen grauen Mantel. Komm wieder, wenn du fertig bist.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",50);
    npcs.base.autonpcfunctions.AddCondition("item",196,"all","=",0);

    -- Status 51 (Mantel ist unfertig)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Oh...this coat isn't finished. If you want to continue the work on an unfinished article of clothing good, just 'use' the needle with that clothing, having it placed at the belt of course.");
    npcs.base.autonpcfunctions.AddCondition("state","=",51);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",50);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Oh...dieser Mantel ist noch nicht fertig. Wenn du die Arbeit an einem unfertigen Kleidungsstück weiterführen willst, dann 'benutze' die Nadel mit diesem Kleidungsstück, das du natürlich am Gürtel trägst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",51);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",50);

    -- Status: 52 (Mantel ist fertig)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Great! This coat looks fantastic. Now you know all you must to know about tailoring. For some clothings you need dyed clothes. If you want to know how to dye cloth ask my sister Penny. She is over there by the barrel. I wish you good luck. Farewell!");
    npcs.base.autonpcfunctions.AddCondition("state","=",52);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Der Mantel ist wirklich schön geworden. Du weißt nun alles, was man über das Schneidern wissen muss. Für viele Kleidungsstücke wirst du farbige Stoffe brauchen. Wenn du wissen willst, wie man Stoffe färbt, dann frag am besten meine Schwester Penny. Sie steht dort drüben neben dem Fass. Ich wünsche dir viel Erfolg. Leb wohl!");
    npcs.base.autonpcfunctions.AddCondition("state","=",52);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: >10 (Unterricht wurde unterbrochen und wird nun fortgesetzt)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Should we continue? Just say \"yes\" or \"no\".");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","<",10);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Sollen wir weitermachen? Sag einfach \"ja\" oder \"nein\".");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","<",10);





        -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1};
    TradStdLang=0;
    --common language=0
    --human language=1
    --dwarf language=2
    --elf language=3
    --lizard language=4
    --orc language=5
    --halfling language=6
    --fairy language=7
    --gnome language=8
    --goblin language=9
    --ancient language=10


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
             local state = NPCStatus[originator.id];
             if (state == 50) or (state == 51) then
                 if CountItemsWithQuality(originator,196,100,-1) > 0 then
                     NPCStatus[originator.id] = 51;		-- unfinished
                 elseif CountItemsWithQuality(originator,196,99,1) > 0 then
                     NPCStatus[originator.id] = 52;		-- finished
		 else
		     NPCStatus[originator.id] = 50;
                 end
            end
            npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
    	else
            npcs.base.autonpcfunctions.Confused(
            	"#me sieht dich leicht verwirrt an",
            	"#me looks at you a little confused"
            );
        end
    end
end

function CountItemsWithQuality( Character, ItemID, Quality, Compare )
    local count = 0;
    local i;
    local item;
    for i=0,17 do
        item = Character:getItemAt(i);
    	if item.id == ItemID then
    	    if Compare == 0 or Compare == nil then
    	        if item.quality == Quality then
    	            count = count+1;
    	        end
    	    elseif Compare == 1 then
    	        if item.quality > Quality then
    	            count = count+1;
    	        end
    	    elseif Compare == -1 then
    	        if item.quality < Quality then
    	            count = count+1;
    	        end
    	    end
    	end
    end
    local container = nil;
    container = Character:getBackPack();
    if container then
        local worked = false;
        for i=1,100 do
            worked, item = container:viewItemNr(i);
            if worked then
                if item.id == ItemID then
                    if Compare == 0 or Compare == nil then
                        if item.quality == Quality then
                            count = count+1;
                        end
                    elseif Compare == 1 then
                        if item.quality > Quality then
                            count = count+1;
                        end
                    elseif Compare == -1 then
                        if item.quality < Quality then
                            count = count+1;
                        end
                    end
                end
            else
                break;
            end
        end
    end
    return count;
end




