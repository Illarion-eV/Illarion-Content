--Name:        Arax Ironheart 
--Race:        Zwerg
--Town:        Newbie Insel
--Function:    Schmieden beibringen
--Position:    x=-112 y=-128 z=0
--Facing:      south
--Last Update: 13/06/2008
--Update by:   Kadiya


require("npc.base.autonpcfunctions")
module("npc.arax_ironheart", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Bitte nicht anfassen");
    thisNPC:talkLanguage(Character.say, Player.english, "Please don't touch.");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end
 
    npc.base.autonpcfunctions.InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);

	-- ********* START DYNAMIC PART ********

    -- Small talk
    --
    npc.base.autonpcfunctions.AddTraderTrigger("#me","");
    npc.base.autonpcfunctions.AddTraderTrigger("hello","G'day stranger! I am "..thisNPC.name..", a retired blacksmith from Silverbrand. I can teach ye' some things' of my craft, smithing, aye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Tag Fremder! Ich bin "..thisNPC.name..", 'n Schmied im Ruhestand aus Silberbrand, der Stadt der Zwerge. Ich kann dir n' paar Sachen von meinem Handwerk beibringn, aye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npc.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npc.base.autonpcfunctions.AddTraderTrigger("who you","I am "..thisNPC.name..", a retired blacksmith from Silverbrand. I can teach ye' some things' of my craft, smithing, aye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npc.base.autonpcfunctions.AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", 'n Schmied im Ruhestand aus Silberbrand, der Stadt der Zwerge. Ich kann dir n' paar Sachen von meinem Handwerk beibringn, aye!");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npc.base.autonpcfunctions.AddTraderTrigger("dank","Bitte sehr.");
    npc.base.autonpcfunctions.AddTraderTrigger("thank","You're welcome.");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Arr...Bye.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell, until we meet again.");
    npc.base.autonpcfunctions.AddTraderTrigger("tsch[üu][ßs]","Mach's gut, bis zum nächstn Mal, aye.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tschue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leb wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wiederseh");
    npc.base.autonpcfunctions.AddAdditionalTrigger("auf bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalText("Tschüss auch.");
    npc.base.autonpcfunctions.AddAdditionalText("Wiedersehn!.");
    npc.base.autonpcfunctions.AddTraderTrigger("hilf","Hilfe? Ick könnt dir zeigen, wie man schmiedet...Interesse?");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("help","Help? I could show you how to smith. Interested?");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("reset","Status reset!");
    npc.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: 0 - 1 (start teaching)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("smith","What? You want to learn how to smith? Arr...a pleasure to hear that! Let's start right away, ready?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("craft");
    npc.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npc.base.autonpcfunctions.AddAdditionalTrigger("show");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("schmied","Was? Du willst wissen wie man schmiedet? Arr...das freu mich zu hören! Lass uns gleich anfangen, bereit?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("handwerk");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npc.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("zeig");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);

    -- Starthilfe
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Sag \"Hilfe\" wenn du nicht weiter weißt.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Say \"help\" if you don't know, what to do.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",0);

    -- Status: 1 -> 10 (Schmelzzange, Eisen und Kohle geben. Schmelzen erklären.)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("yes","First I show you how to smelt ore. Here you can have a crucible-pincer and a handfull of coal and iron ore. Put the crucible-pincer in your hands and the coal and the ore 'in' your belt. Stand in front of the furnace and 'use' the furnace. Come back, when you have at least 10 iron ingots. If you already know how to smelt ore just say \"continue\".");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);
    npc.base.autonpcfunctions.AddConsequence("item",21,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",22,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Das erste, was ein Schmied lernen muss ist, wie man Erze einschmilzt. Hier hast du eine Tiegelzange und eine handvoll Kohle und Eisenerz. Nimm die Tiegelzange in die Hand und die Kohle und das Eisenerz 'in' den Gürtel. Dann stell dich vor die Esse dort und 'benutze' die Esse. Komm wieder, wenn du 10 Eisenbarren geschmolzen hast. Wenn du schon weißt, wie man Eisenbarren einschmilzt sag \"Weiter\".");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);
    npc.base.autonpcfunctions.AddConsequence("item",21,10,333,0);
    npc.base.autonpcfunctions.AddConsequence("item",22,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Arr...Allright. Come back whenever you want.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Arr...In Ordnung. Komm zurück wann immer du willst.");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: 1 (eine andere Anwort)
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","I asked you whether I should teach you smithing. Just say \"yes\" or \"no\".");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Ich habe dich gefragt, ob ich dir das Schmieden beibringen soll...sag einfach \"ja\", oder \"nein\".");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",1);

    -- Status: 10 (Weiter)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("continue","Arr...you already know how to smelt ironore? Well, I can give you iron ingots instead, you'll be needing them. Agreed?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("weiter","Arr...du weiß also schon, wie man Eisenbarren herstellt? Auch gut, ich geb dir einfach die Eisenbarren, die du für das Schmieden brauchst. Einverstanden?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",11);

    -- Status: 10 (Hilfe)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("help","Arr...doesn't the furnace want to work? Check that you have the crucible-pincer in your hands and the coal and the ore 'in' your belt. Stand directly in front of the furnace and 'use' the furnace to start smelting. If it still doesn't work, I can give you some iron ingots, so that we can continue. Do you want?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",11);
    npc.base.autonpcfunctions.AddTraderTrigger("hilf","Arr...will die Esse nicht so wie du, mein Freund? Überprüf nochmal, ob du wirklich die Tiegelzange in der Hand und Kohle sowie Eisenerz 'im' Gürtel hast. Dann einfach einmal die Esse 'benutzen' und schon sollte das Einschmelzen wie von selbst gehen. Wenns gar net klappen will, kann ich dir aber auch einfach ein paar Eisenbarren geben. Willste welche haben?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",11);

    -- Status: 11 (Auf Wunsch wird Eisenbarren gegeben)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Here you have some. Well...can we continue then?");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Hier, haste welche. Wollen wir dann weitermachen?");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","It's up to you, try again if you want..");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddConsequence("state","=",10);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Wie du willst, versuch es ruhig selbst nochmal.");
    npc.base.autonpcfunctions.AddCondition("state","=",11);
    npc.base.autonpcfunctions.AddConsequence("state","=",10);

    -- Status: >=1 (Eine neue Tiegelzange)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("pincer","Did you need another crucible-pincer ? Here you can have one.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("crucible");
    npc.base.autonpcfunctions.AddCondition("state",">=",10);
    npc.base.autonpcfunctions.AddCondition("item",2751,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("zange","Brauchst du eine neue Tiegelzange? Hier hast du eine.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tiegel");
    npc.base.autonpcfunctions.AddCondition("state",">=",10);
    npc.base.autonpcfunctions.AddCondition("item",2751,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",2751,1,999,0);

    -- Status: 10 Mehr Eisenerz
    --
    npc.base.autonpcfunctions.AddTraderTrigger("eisen","Du brauchst mehr Eisenerz, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("erz");
    npc.base.autonpcfunctions.AddCondition("state",">=",10);
    npc.base.autonpcfunctions.AddCondition("item",22,"all","<",2);
    npc.base.autonpcfunctions.AddConsequence("item",22,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("iron","You need more iron ore, right? Here you are.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ore");
    npc.base.autonpcfunctions.AddCondition("state",">=",10);
    npc.base.autonpcfunctions.AddCondition("item",22,"all","<",2);
    npc.base.autonpcfunctions.AddConsequence("item",22,10,333,0);

    -- Status: 11 Mehr Kohle
    --
    npc.base.autonpcfunctions.AddTraderTrigger("kohle","Du brauchst mehr Kohle, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddCondition("state",">=",10);
    npc.base.autonpcfunctions.AddCondition("item",21,"all","<",2);
    npc.base.autonpcfunctions.AddConsequence("item",21,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("coal","You need more coal, right? Here you are.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ore");
    npc.base.autonpcfunctions.AddCondition("state",">=",10);
    npc.base.autonpcfunctions.AddCondition("item",21,"all","<",2);
    npc.base.autonpcfunctions.AddConsequence("item",21,10,333,0);

    -- Status: 10 (Noch zu wenig Eisenbarren)
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","You still have too few iron ingots. Come back, when you have smelted at least 10 ingots.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddCondition("item",2535,"all","<",10);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Du hast noch zu wenig Eisenbarren. Komm wieder, wenn du mindestens 10 Barren geschmolzen hast.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddCondition("item",2535,"all","<",10);
    
    -- Status: 10 -> 2 (Die Eisenbarren sind da - weitermachen?)
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Great! Ye did it! One more hint: It also possible to smelt copper, gold and merinium ingots. But at first you need mostly iron ingots. The next step is to smith the iron ingot. Are ye ready to continue?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddCondition("item",2535,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Du hast's geschafft! Ein Hinweis noch: Es ist auch möglich Kupfer-, Gold- oder Meriniumbarren zu schmelzen. Aber zu Beginn wirst du meistens Eisenbarren brauchen. Als nächstes wird der Eisenbarren geschmiedet, bereit?");
    npc.base.autonpcfunctions.AddCondition("state","=",10);
    npc.base.autonpcfunctions.AddCondition("item",2535,"all",">",9);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",2);

    -- Status: 2 -> 20 (Hammer geben - Nägel schmieden)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Arr, there ye' are. Make 10 pins out of the iron ingots and come back! Stay on front of the anvil and 'use' this hammer. Once you do that, you can choose between several categories. The pins are represented by a hammer! Choose this category and click on the pins. Try it out!");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state","=",20);
    npc.base.autonpcfunctions.AddConsequence("item",23,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Jetzt solltest du erstmal zum Amboß gehn. Stell dich davor und 'benutzte' diesen Hammer. Es öffnet sich dann ein Menü, wo du auswähln kannst, in welcher Kategorie du etwas schmieden willst. Wähl den Hammer für die Kategorie 'Werkzeuge' und dann die Nägel aus. Komm wieder wenn du 10 Nägel hast!");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("state","=",20);
    npc.base.autonpcfunctions.AddConsequence("item",23,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("no","Arr...Allright. Come back whenever you want.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("nein","Arr...In Ordnung. Komm zurück wann immer du willst.");
    npc.base.autonpcfunctions.AddCondition("state","=",2);

    -- Status: 20 (Hilfe)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("help","moep");
    npc.base.autonpcfunctions.AddCondition("state","=",20);
    npc.base.autonpcfunctions.AddTraderTrigger("hilf","Arr...will der Hammer nicht so wie du, mein Freund? Überprüfe noch einmal, ob du den Hammer auch wirklich in der Hand und die Eisenbarren 'im' Gürtel hast. Dann einmal den Hammer 'benutzen' und in dem Menü, welches sich dann öffnet erst den Hammer für \"Werkzeuge\" und dann die Nägel auswählen. Wenn du noch mehr Eisenbarren brauchst, sag mir einfach Bescheid. Ich hab noch genug.");
    npc.base.autonpcfunctions.AddCondition("state","=",20);

    -- Status: 20 (Mehr Eisenbarren)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("barren","Du brauchst mehr Eisenbarren, richtig? Hier bitte sehr.");
    npc.base.autonpcfunctions.AddCondition("state",">=",20);
    npc.base.autonpcfunctions.AddCondition("item",2535,"all","<",2);
    npc.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);
    npc.base.autonpcfunctions.AddTraderTrigger("ingots","You need more iron ingots, right? Here you are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",20);
    npc.base.autonpcfunctions.AddCondition("item",2535,"all","<",2);
    npc.base.autonpcfunctions.AddConsequence("item",2535,10,333,0);

    -- Status: 20 (Neuer Hammer)
    --
    npc.base.autonpcfunctions.AddTraderTrigger("hammer","Ye need another hammer, aye?? Here ye are.");
    npc.base.autonpcfunctions.AddCondition("state",">=",20);
    npc.base.autonpcfunctions.AddCondition("item",23,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",23,1,999,0);
    npc.base.autonpcfunctions.AddTraderTrigger("nadel","Du brauchst 'nen neuen Hammer, aye? Hier haste einen.");
    npc.base.autonpcfunctions.AddCondition("state",">=",20);
    npc.base.autonpcfunctions.AddCondition("item",23,"all","=",0);
    npc.base.autonpcfunctions.AddConsequence("item",23,1,999,0);

    -- Status: 20 (Zu wenig Nägel da)
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Come again when ye have smithed at least 10 pins. If you need help or more ingots, ask me!");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","=",20);
    npc.base.autonpcfunctions.AddCondition("item",2738,"all","<",10);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Komm wieder, wenn du mindestens 10 Nägel geschmiedet hast. Wenn du Hilfe oder mehr Eisenbarren brauchst, dann frag mich!");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","=",20);
    npc.base.autonpcfunctions.AddCondition("item",2738,"all","<",10);

    -- Status: 52 (Nägel sind fertig)
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Great! Ye' did it! One more hint: More complex items may leave 'unfinished items' , continue the work by 'using' the hammer with the item, having it placed at the belt of course.");
    npc.base.autonpcfunctions.AddCondition("state","=",20);
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("item",2738,"all",">=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Großartig! Jetzt hast du's geschafft! En Hinweis noch: Es kann passiern, dat 'unfertige Sachen' übrigbleiben, du kannst die Arbeit an ihnen fortsetzen, indem du den Hammer mit diesem Gegenstand, den du natürlich am Gürtel trägst, 'benutzt'. Du weiß nun alles Nötige über's Schmieden. Viel Glück und leb wohl!");
    npc.base.autonpcfunctions.AddCondition("state","=",20);
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("item",2738,"all",">=",10);
    npc.base.autonpcfunctions.AddConsequence("state","=",0);

    -- Status: >10 (Unterricht wurde unterbrochen und wird nun fortgesetzt)
    --
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Should we continue? Just say \"yes\" or \"no\".");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddCondition("state","<",10);
    npc.base.autonpcfunctions.AddTraderTrigger(".+","Sollen wir weitermachen? Sag einfach \"ja\" oder \"nein\".");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCondition("state","<",10);




	
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
            local state = NPCStatus[originator.id];


            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
    	else
            npc.base.autonpcfunctions.Confused(
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
