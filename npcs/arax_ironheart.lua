--Name:        Arax Ironheart 
--Race:        Zwerg
--Town:        Newbie Insel
--Function:    Schmieden beibringen
--Position:    x=-112 y=-128 z=0
--Facing:      south
--Last Update: 13/06/2008
--Update by:   Kadiya


require("npcs.base.autonpcfunctions")

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
    npcs.base.autonpcfunctions.AddTraderTrigger("#me","");
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","G'day stranger! I am "..thisNPC.name..", a retired blacksmith from Silverbrand. I can teach ye' some things' of my craft, smithing, aye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Tag Fremder! Ich bin "..thisNPC.name..", 'n Schmied im Ruhestand aus Silberbrand, der Stadt der Zwerge. Ich kann dir n' paar Sachen von meinem Handwerk beibringn, aye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddTraderTrigger("who you","I am "..thisNPC.name..", a retired blacksmith from Silverbrand. I can teach ye' some things' of my craft, smithing, aye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", 'n Schmied im Ruhestand aus Silberbrand, der Stadt der Zwerge. Ich kann dir n' paar Sachen von meinem Handwerk beibringn, aye!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npcs.base.autonpcfunctions.AddTraderTrigger("dank","Bitte sehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("thank","You're welcome.");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Arr...Bye.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell, until we meet again.");
    npcs.base.autonpcfunctions.AddTraderTrigger("tsch[üu][ßs]","Mach's gut, bis zum nächstn Mal, aye.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tschue[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wiederseh");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("auf bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalText("Tschüss auch.");
    npcs.base.autonpcfunctions.AddAdditionalText("Wiedersehn!.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Hilfe? Ick könnt dir zeigen, wie man schmiedet...Interesse?");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","<",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Help? I could show you how to smith. Interested?");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","<",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("reset","Status reset!");
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: 0 - 1 (start teaching)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("smith","What? You want to learn how to smith? Arr...a pleasure to hear that! Let's start right away, ready?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("craft");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("show");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("schmied","Was? Du willst wissen wie man schmiedet? Arr...das freu mich zu hören! Lass uns gleich anfangen, bereit?");
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

    -- Status: 1 -> 10 (Schmelzzange, Eisen und Kohle geben. Schmelzen erklären.)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","First I show you how to smelt ore. Here you can have a crucible-pincer and a handfull of coal and iron ore. Put the crucible-pincer in your hands and the coal and the ore 'in' your belt. Stand in front of the furnace and 'use' the furnace. Come back, when you have at least 10 iron ingots. If you already know how to smelt ore just say \"continue\".");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);
    npcs.base.autonpcfunctions.AddConsequence("item",21,10,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",22,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Das erste, was ein Schmied lernen muss ist, wie man Erze einschmilzt. Hier hast du eine Tiegelzange und eine handvoll Kohle und Eisenerz. Nimm die Tiegelzange in die Hand und die Kohle und das Eisenerz 'in' den Gürtel. Dann stell dich vor die Esse dort und 'benutze' die Esse. Komm wieder, wenn du 10 Eisenbarren geschmolzen hast. Wenn du schon weißt, wie man Eisenbarren einschmilzt sag \"Weiter\".");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);
    npcs.base.autonpcfunctions.AddConsequence("item",21,10,333,0);
    npcs.base.autonpcfunctions.AddConsequence("item",22,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Arr...Allright. Come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Arr...In Ordnung. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: 1 (eine andere Anwort)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","I asked you whether I should teach you smithing. Just say \"yes\" or \"no\".");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Ich habe dich gefragt, ob ich dir das Schmieden beibringen soll...sag einfach \"ja\", oder \"nein\".");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);

    -- Status: 10 (Weiter)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("continue","Arr...you already know how to smelt ironore? Well, I can give you iron ingots instead, you'll be needing them. Agreed?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",11);
    npcs.base.autonpcfunctions.AddTraderTrigger("weiter","Arr...du weiß also schon, wie man Eisenbarren herstellt? Auch gut, ich geb dir einfach die Eisenbarren, die du für das Schmieden brauchst. Einverstanden?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",11);

    -- Status: 10 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","Arr...doesn't the furnace want to work? Check that you have the crucible-pincer in your hands and the coal and the ore 'in' your belt. Stand directly in front of the furnace and 'use' the furnace to start smelting. If it still doesn't work, I can give you some iron ingots, so that we can continue. Do you want?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",11);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Arr...will die Esse nicht so wie du, mein Freund? Überprüf nochmal, ob du wirklich die Tiegelzange in der Hand und Kohle sowie Eisenerz 'im' Gürtel hast. Dann einfach einmal die Esse 'benutzen' und schon sollte das Einschmelzen wie von selbst gehen. Wenns gar net klappen will, kann ich dir aber auch einfach ein paar Eisenbarren geben. Willste welche haben?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",11);

    -- Status: 11 (Auf Wunsch wird Eisenbarren gegeben)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Here you have some. Well...can we continue then?");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Hier, haste welche. Wollen wir dann weitermachen?");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","It's up to you, try again if you want..");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Wie du willst, versuch es ruhig selbst nochmal.");
    npcs.base.autonpcfunctions.AddCondition("state","=",11);
    npcs.base.autonpcfunctions.AddConsequence("state","=",10);

    -- Status: >=1 (Eine neue Tiegelzange)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("pincer","Did you need another crucible-pincer ? Here you can have one.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("crucible");
    npcs.base.autonpcfunctions.AddCondition("state",">=",10);
    npcs.base.autonpcfunctions.AddCondition("item",2751,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("zange","Brauchst du eine neue Tiegelzange? Hier hast du eine.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tiegel");
    npcs.base.autonpcfunctions.AddCondition("state",">=",10);
    npcs.base.autonpcfunctions.AddCondition("item",2751,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);

    -- Status: 10 Mehr Eisenerz
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("eisen","Du brauchst mehr Eisenerz, richtig? Hier bitte sehr.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("erz");
    npcs.base.autonpcfunctions.AddCondition("state",">=",10);
    npcs.base.autonpcfunctions.AddCondition("item",22,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",22,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("iron","You need more iron ore, right? Here you are.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ore");
    npcs.base.autonpcfunctions.AddCondition("state",">=",10);
    npcs.base.autonpcfunctions.AddCondition("item",22,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",22,10,333,0);

    -- Status: 11 Mehr Kohle
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("kohle","Du brauchst mehr Kohle, richtig? Hier bitte sehr.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",10);
    npcs.base.autonpcfunctions.AddCondition("item",21,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",21,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("coal","You need more coal, right? Here you are.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ore");
    npcs.base.autonpcfunctions.AddCondition("state",">=",10);
    npcs.base.autonpcfunctions.AddCondition("item",21,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",21,10,333,0);

    -- Status: 10 (Noch zu wenig Eisenbarren)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","You still have too few iron ingots. Come back, when you have smelted at least 10 ingots.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",2535,"all","<",10);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Du hast noch zu wenig Eisenbarren. Komm wieder, wenn du mindestens 10 Barren geschmolzen hast.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",2535,"all","<",10);
    
    -- Status: 10 -> 2 (Die Eisenbarren sind da - weitermachen?)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Great! Ye did it! One more hint: It also possible to smelt copper, gold and merinium ingots. But at first you need mostly iron ingots. The next step is to smith the iron ingot. Are ye ready to continue?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",2535,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Du hast's geschafft! Ein Hinweis noch: Es ist auch möglich Kupfer-, Gold- oder Meriniumbarren zu schmelzen. Aber zu Beginn wirst du meistens Eisenbarren brauchen. Als nächstes wird der Eisenbarren geschmiedet, bereit?");
    npcs.base.autonpcfunctions.AddCondition("state","=",10);
    npcs.base.autonpcfunctions.AddCondition("item",2535,"all",">",9);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);

    -- Status: 2 -> 20 (Hammer geben - Nägel schmieden)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Arr, there ye' are. Make 10 pins out of the iron ingots and come back! Stay on front of the anvil and 'use' this hammer. Once you do that, you can choose between several categories. The pins are represented by a hammer! Choose this category and click on the pins. Try it out!");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("state","=",20);
    npcs.base.autonpcfunctions.AddConsequence("item",23,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Jetzt solltest du erstmal zum Amboß gehn. Stell dich davor und 'benutzte' diesen Hammer. Es öffnet sich dann ein Menü, wo du auswähln kannst, in welcher Kategorie du etwas schmieden willst. Wähl den Hammer für die Kategorie 'Werkzeuge' und dann die Nägel aus. Komm wieder wenn du 10 Nägel hast!");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("state","=",20);
    npcs.base.autonpcfunctions.AddConsequence("item",23,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("no","Arr...Allright. Come back whenever you want.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("nein","Arr...In Ordnung. Komm zurück wann immer du willst.");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);

    -- Status: 20 (Hilfe)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("help","moep");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Arr...will der Hammer nicht so wie du, mein Freund? Überprüfe noch einmal, ob du den Hammer auch wirklich in der Hand und die Eisenbarren 'im' Gürtel hast. Dann einmal den Hammer 'benutzen' und in dem Menü, welches sich dann öffnet erst den Hammer für \"Werkzeuge\" und dann die Nägel auswählen. Wenn du noch mehr Eisenbarren brauchst, sag mir einfach Bescheid. Ich hab noch genug.");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);

    -- Status: 20 (Mehr Eisenbarren)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("barren","Du brauchst mehr Eisenbarren, richtig? Hier bitte sehr.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",20);
    npcs.base.autonpcfunctions.AddCondition("item",2535,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("ingots","You need more iron ingots, right? Here you are.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",20);
    npcs.base.autonpcfunctions.AddCondition("item",2535,"all","<",2);
    npcs.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);

    -- Status: 20 (Neuer Hammer)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger("hammer","Ye need another hammer, aye?? Here ye are.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",20);
    npcs.base.autonpcfunctions.AddCondition("item",23,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",23,1,999,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("nadel","Du brauchst 'nen neuen Hammer, aye? Hier haste einen.");
    npcs.base.autonpcfunctions.AddCondition("state",">=",20);
    npcs.base.autonpcfunctions.AddCondition("item",23,"all","=",0);
    npcs.base.autonpcfunctions.AddConsequence("item",23,1,999,0);

    -- Status: 20 (Zu wenig Nägel da)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Come again when ye have smithed at least 10 pins. If you need help or more ingots, ask me!");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("item",2738,"all","<",10);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Komm wieder, wenn du mindestens 10 Nägel geschmiedet hast. Wenn du Hilfe oder mehr Eisenbarren brauchst, dann frag mich!");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("item",2738,"all","<",10);

    -- Status: 52 (Nägel sind fertig)
    --
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Great! Ye' did it! One more hint: More complex items may leave 'unfinished items' , continue the work by 'using' the hammer with the item, having it placed at the belt of course.");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddCondition("item",2738,"all",">=",10);
    npcs.base.autonpcfunctions.AddConsequence("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Jetzt hast du's geschafft! En Hinweis noch: Es kann passiern, dat 'unfertige Sachen' übrigbleiben, du kannst die Arbeit an ihnen fortsetzen, indem du den Hammer mit diesem Gegenstand, den du natürlich am Gürtel trägst, 'benutzt'. Du weiß nun alles Nötige über's Schmieden. Viel Glück und leb wohl!");
    npcs.base.autonpcfunctions.AddCondition("state","=",20);
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCondition("item",2738,"all",">=",10);
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
