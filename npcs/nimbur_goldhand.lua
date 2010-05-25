--Name:        Nimbur Goldhand 
--Race:        Zwerg
--Town:        Newbie Insel
--Function:    Schmieden beibringen
--Position:    x=-107 y=-126 z=0
--Facing:      swest
--Last Update: 16/06/2008
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
 
    InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);

	-- ********* START DYNAMIC PART ********

    -- Small talk
    --
    AddTraderTrigger("#me","");
    AddTraderTrigger("hello","Hey ho! I'm "..thisNPC.name..". The 'Goldhands' are the best goldsmiths, because runs in our family...hehe. You can count yourself lucky to meet the best one...me! But if you want, I can show you some things of my craft.");
    AddAdditionalTrigger("greet");
    AddCondition("state","=",0);
    AddTraderTrigger("hallo","Hey ho! Ich bin "..thisNPC.name..". Wußtest du, dass aus der Familie Goldhand seit Generationen die besten Goldschmiede stammen? Aber der Allerbeste von ihnen bin ich! Wenn du willst zeige ich dir ein wenig über mein Handwerk.");
    AddAdditionalTrigger("gr[üu][sß]");
    AddCondition("state","=",0);
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("gr[üu][sß]");
    AddTraderTrigger("who you","I'm "..thisNPC.name..". The 'Goldhands' are the best goldsmiths arround, it runs in our family...hehe. And you can count yourself lucky to meet the best one...me! But if you want, I can show you some things of my craft.");
    AddAdditionalTrigger("what you");
    AddTraderTrigger("wer du","Ich bin "..thisNPC.name..". Wußtest du, dass aus der Familie Goldhand seit Generationen die besten Goldschmiede stammen? Und ich bin der Allerbeste von ihnen! Wenn du willst zeige ich dir ein wenig über mein Handwerk.");
    AddAdditionalTrigger("wer ihr");
    AddAdditionalTrigger("was du");
    AddAdditionalTrigger("was ihr");
    AddTraderTrigger("dank","Bitte sehr.");
    AddTraderTrigger("thank","You're welcome.");
    AddTraderTrigger("bye","Arr...Bye.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Farewell");
    AddAdditionalText("Farewell, until we meet again.");
    AddTraderTrigger("tsch[üu][ßs]","Mach's gut, bis zum nächstn Mal.");
    AddAdditionalTrigger("tschue[sß]");
    AddAdditionalTrigger("leb wohl");
    AddAdditionalTrigger("wiederseh");
    AddAdditionalTrigger("auf bald");
    AddAdditionalTrigger("bis bald");
    AddAdditionalText("Tschüss auch.");
    AddAdditionalText("Wiedersehn!");
    AddTraderTrigger("hilf","Aye! Ick kann dir die Grundlagen des Goldschmiedens beibringen...wat sagste?");
    AddCondition("lang","german");
    AddCondition("state","<",10);
    AddConsequence("state","=",1);
    AddTraderTrigger("help","I can teach ye the basics of goldsmithing. What did ye' say??");
    AddCondition("lang","english");
    AddCondition("state","<",10);
    AddConsequence("state","=",1);
    AddTraderTrigger("reset","Status reset!");
    AddConsequence("state","=",0);

    -- Status: 0 - 1 (start teaching)
    --
    AddTraderTrigger("smith","Arr...right. Listen to me, I tell you all about goldsmithing you must know. Are you ready?");
    AddAdditionalTrigger("craft");
    AddAdditionalTrigger("teach");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("show");
    AddCondition("state","=",0);
    AddCondition("lang","english");
    AddConsequence("state","=",1);
    AddTraderTrigger("schmied","Arr...in Ordnung. Hör mich genau zu, ich kann dir alles über das goldschmieden beibringen, was du wissen must. Bist du bereit?");
    AddAdditionalTrigger("handwerk");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddAdditionalTrigger("zeig");
    AddCondition("state","=",0);
    AddCondition("lang","german");
    AddConsequence("state","=",1);

    -- Starthilfe
    --
    AddTraderTrigger(".+","Sag \"Hilfe\" wenn du nicht weiter weißt.");
    AddCondition("lang","german");
    AddCondition("state","=",0);
    AddTraderTrigger(".+","Say \"help\" if you don't know, what to do.");
    AddCondition("lang","english");
    AddCondition("state","=",0);

    -- Status: 1 -> 10 (Schmelzzange, Eisen und Kohle geben. Schmelzen erklären.)
    --
    AddTraderTrigger("yes","Firstly I show you, how to smelt ore. Here you have a crucible-pincer and a hand full of coal and iron ore. Put the crucible-pincer in your hands and the coal and the ore 'in' your belt. Stay in front of the furnace and 'use' the furnace. Come back, wenn you have at least 10 iron ingots. If you already know how to smelt ore just say \"continue\".");
    AddCondition("state","=",1);
    AddConsequence("state","=",10);
    AddConsequence("item",2751,1,999,0);
    AddConsequence("item",21,10,333,0);
    AddConsequence("item",22,10,333,0);
    AddTraderTrigger("ja","Als erstes zeig ich dir, wie man Erze einschmilzt. Hier hast du eine Tiegelzange und eine handvoll Kohle und Eisenerz. Nimm die Tiegelzange in die Hand und die Kohle und das Eisenerz 'in' den Gürtel. Dann stell dich vor die Esse dort und 'benutze' die Esse. Komm wieder, wenn du 10 Eisenbarren geschmolzen hast. Wenn du schon weißt, wie man Eisenbarren einschmilzt sag \"Weiter\".");
    AddCondition("state","=",1);
    AddConsequence("state","=",10);
    AddConsequence("item",2751,1,999,0);
    AddConsequence("item",21,10,333,0);
    AddConsequence("item",22,10,333,0);
    AddTraderTrigger("no","Arr...Allright. Come back whenever you want.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("nein","Arr...In Ordnung. Komm zurück wann immer du willst.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);

    -- Status: 1 (eine andere Anwort)
    --
    AddTraderTrigger(".+","I ask you if I should teach you smithing. Just say \"yes\" or \"no\".");
    AddCondition("lang","english");
    AddCondition("state","=",1);
    AddTraderTrigger(".+","Ich habe dich gefragt, ob ich dir das Goldschmieden beibringen soll...sag einfach \"ja\", oder \"nein\".");
    AddCondition("lang","german");
    AddCondition("state","=",1);

    -- Status: 10 (Weiter)
    --
    AddTraderTrigger("continue","Arr...you know how to smelt ironore? Well, I can give you the iron ingots you need if you want. Agreed?");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);
    AddTraderTrigger("weiter","Arr...du weiß also schon, wie man Eisenbarren herstellt? Auch gut, ich geb dir einfach die Eisenbarren, die du für das Goldschmieden brauchst. Einverstanden?");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);

    -- Status: 10 (Hilfe)
    --
    AddTraderTrigger("help","Arr...does the furnace don't want like you want? Check, if you have the crucible-pincer really in your hands and the coal and the ore 'in' your belt. Stay directly in front of the furnace and 'use' the furnace to start smelting. If it still don't work, I can give you some iron ingots, so that we can continue. Did you want?");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);
    AddTraderTrigger("hilf","Arr...will die Esse nicht so wie du, mein Freund? Überprüf nochmal, ob du wirklich die Tiegelzange in der Hand und Kohle sowie Eisenerz 'im' Gürtel hast. Dann einfach einmal die Esse 'benutzen' und schon sollte das Einschmelzen wie von selbst gehen. Wenns gar net klappen will, kann ich dir aber auch einfach ein paar Eisenbarren geben. Willste welche haben?");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);

    -- Status: 11 (Auf Wunsch wird Eisenbarren gegeben)
    --
    AddTraderTrigger("yes","Here you have some. Well...can we continue then?");
    AddCondition("state","=",11);
    AddConsequence("state","=",2);
    AddConsequence("item",2535,10,333,0);
    AddTraderTrigger("ja","Hier, haste welche. Wie sieht's aus...wollen wir dann weitermachen?");
    AddCondition("state","=",11);
    AddConsequence("state","=",2);
    AddConsequence("item",2535,10,333,0);
    AddTraderTrigger("no","Yes, retry it. That is the right way.");
    AddCondition("state","=",11);
    AddConsequence("state","=",10);
    AddTraderTrigger("nein","Ja, versuch es ruhig selbst nochmal. Das ist der richtige Weg.");
    AddCondition("state","=",11);
    AddConsequence("state","=",10);

    -- Status: >=1 (Eine neue Tiegelzange)
    --
    AddTraderTrigger("pincer","Did you need a new crucible-pincer ? Here you have one.");
    AddAdditionalTrigger("crucible");
    AddCondition("state",">=",10);
    AddCondition("item",2751,"all","=",0);
    AddConsequence("item",2751,1,999,0);
    AddTraderTrigger("zange","Brauchst du eine neue Tiegelzange? Hier hast du eine.");
    AddAdditionalTrigger("tiegel");
    AddCondition("state",">=",10);
    AddCondition("item",2751,"all","=",0);
    AddConsequence("item",2751,1,999,0);

    -- Status: 10 Mehr Eisenerz
    --
    AddTraderTrigger("eisen","Du brauchst mehr Eisenerz, richtig? Hier bitte sehr.");
    AddAdditionalTrigger("erz");
    AddCondition("state",">=",10);
    AddCondition("item",22,"all","<",2);
    AddConsequence("item",22,10,333,0);
    AddTraderTrigger("iron","You need more iron ore, right? Here you are.");
    AddAdditionalTrigger("ore");
    AddCondition("state",">=",10);
    AddCondition("item",22,"all","<",2);
    AddConsequence("item",22,10,333,0);

    -- Status: 11 Mehr Kohle
    --
    AddTraderTrigger("kohle","Du brauchst mehr Kohle, richtig? Hier bitte sehr.");
    AddCondition("state",">=",10);
    AddCondition("item",21,"all","<",2);
    AddConsequence("item",21,10,333,0);
    AddTraderTrigger("coal","You need more coal, right? Here you are.");
    AddAdditionalTrigger("ore");
    AddCondition("state",">=",10);
    AddCondition("item",21,"all","<",2);
    AddConsequence("item",21,10,333,0);

    -- Status: 10 (Noch zu wenig Eisenbarren)
    --
    AddTraderTrigger(".+","You still have to little iron ingots. Come back, when you have smelt at least 10 ingots.");
    AddCondition("lang","english");
    AddCondition("state","=",10);
    AddCondition("item",2535,"all","<",10);
    AddTraderTrigger(".+","Du hast noch zu wenig Eisenbarren. Komm wieder, wenn du mindestens 10 Barren geschmolzen hast.");
    AddCondition("lang","german");
    AddCondition("state","=",10);
    AddCondition("item",2535,"all","<",10);
    
    -- Status: 10 -> 2 (Die Eisenbarren sind da - weitermachen?)
    --
    AddTraderTrigger(".+","Great! Ye' did it! One more hint: It also possible to copper, gold and merinium ingots. But at first you need mostly iron ingots. The next step now is to smith the iron ingot. Are ye' ready to continue?");
    AddCondition("state","=",10);
    AddCondition("item",2535,"all",">",9);
    AddCondition("lang","english");
    AddConsequence("state","=",2);
    AddTraderTrigger(".+","Großartig! Du hast's geschafft! Ein Hinweis noch: Es ist auch möglich Kupfer-, Gold- oder Meriniumbarren zu schmelzen. Aber zu Beginn wirst du meistens Eisenbarren brauchen. Als nächstes wird der Eisenbarren geschmiedet, bereit?");
    AddCondition("state","=",10);
    AddCondition("item",2535,"all",">",9);
    AddCondition("lang","german");
    AddConsequence("state","=",2);

    -- Status: 2 -> 20 (Feinschmiedehammer geben - Kelch schmieden)
    --
    AddTraderTrigger("yes","Arr, there ye' are. Smith out of this iron ingots a goblet and come back! Stay on front of the anvil and 'use' this finesmithing hammer. If you used the hammer, you can choose between several categories. The goblets are represented by a iron goblet! Choose this category and click on the goblet. Just try it out!");
    AddCondition("state","=",2);
    AddConsequence("state","=",20);
    AddConsequence("item",122,1,999,0);
    AddTraderTrigger("ja","Jetzt solltest du erstmal zum Amboß gehn. Stell dich davor und 'benutzte' diesen Feinschmiedehammer. Es öffnet sich dann ein Menü, wo du auswähln kannst, in welcher Kategorie du etwas schmieden willst. Die Kelche werden durch den Eisenkelch representiert. Wähle diese Kategorie und dann anschließend den Kelch aus. Komm wieder wenn du einen Kelch geschmiedet hast!");
    AddCondition("state","=",2);
    AddConsequence("state","=",20);
    AddConsequence("item",122,1,999,0);
    AddTraderTrigger("no","Arr...Allright. Come back whenever you want.");
    AddCondition("state","=",2);
    AddTraderTrigger("nein","Arr...In Ordnung. Komm zurück wann immer du willst.");
    AddCondition("state","=",2);

    -- Status: 20 (Hilfe)
    --
    AddTraderTrigger("help","Arr...does the hammer don't want like you want? Check, if you have the finesmithing hammer really in your hands and the iron ingots 'in' your belt. Stay directly in front of the anvil and 'use' the hammer. Choose first the iron goblet and then the goblet to start smithing. If you need more iron ingots, just tell me.");
    AddCondition("state","=",20);
    AddTraderTrigger("hilf","Arr...will der Hammer nicht so wie du, mein Freund? Überprüfe noch einmal, ob du den Hammer auch wirklich in der Hand und die Eisenbarren 'im' Gürtel hast. Stell dich direkt vor den Amboss und 'benutzen' den Hammer. Wähle in dem Menü zuerst den Eisenkelch und dann den Kelch aus. Wenn du noch mehr Eisenbarren brauchst, sag mir einfach Bescheid. Ich hab noch genug.");
    AddCondition("state","=",20);

    -- Status: 20 (Mehr Eisenbarren)
    --
    AddTraderTrigger("barren","Du brauchst mehr Eisenbarren, richtig? Hier bitte sehr.");
    AddCondition("state",">=",20);
    AddCondition("item",2535,"all","<",2);
    AddConsequence("item",2535,10,333,0);
    AddTraderTrigger("ingots","You need more iron ingots, right? Here you are.");
    AddCondition("state",">=",20);
    AddCondition("item",2535,"all","<",2);
    AddConsequence("item",2535,10,333,0);

    -- Status: 20 (Neuer Hammer)
    --
    AddTraderTrigger("hammer","Ye' need another hammer, aye?? Here ye' are.");
    AddCondition("state",">=",20);
    AddCondition("item",122,"all","=",0);
    AddConsequence("item",122,1,999,0);
    AddTraderTrigger("nadel","Du brauchst 'nen neuen Hammer, aye? Hier haste einen.");
    AddCondition("state",">=",20);
    AddCondition("item",122,"all","=",0);
    AddConsequence("item",122,1,999,0);

    -- Status: 20 (Zu wenig Nägel da)
    --
    AddTraderTrigger(".+","Come again when ye have smithed at least 10 nails. If you need help or more ingots, ask me!");
    AddCondition("lang","english");
    AddCondition("state","=",20);
    AddCondition("item",1858,"all","=",0);
    AddTraderTrigger(".+","Komm wieder, wenn du mindestens 10 Nägel geschmiedet hast. Wenn du Hilfe oder mehr Eisenbarren brauchst, dann frag mich!");
    AddCondition("lang","german");
    AddCondition("state","=",20);
    AddCondition("item",1858,"all","=",0);

    -- Status: 52 (Nägel sind fertig)
    --
    AddTraderTrigger(".+","Great! Ye' did it! One more hint: It may happen on other things that there are 'unfinished things' left, continue the work by 'using' the hammer with that 'things', having it placed at the belt of course. Now you know all about goldsmithing you must know. Farewell and good luck!");
    AddCondition("state","=",20);
    AddCondition("lang","english");
    AddCondition("item",1858,"all",">",0);
    AddConsequence("state","=",0);
    AddTraderTrigger(".+","Großartig! Du hast es geschafft! Ein Hinweis noch: Es kann passiern, dass 'unfertige Sachen' übrigbleiben, du kannst die Arbeit an ihnen fortsetzen, indem du den Hammer mit diesem Gegenstand, den du natürlich am Gürtel trägst, 'benutzt'. Du weiß nun alles, was man über das Goldschmieden wissen muss. Leb wohl und viel Erfolg!");
    AddCondition("state","=",20);
    AddCondition("lang","german");
    AddCondition("item",1858,"all",">",0);
    AddConsequence("state","=",0);

    -- Status: >10 (Unterricht wurde unterbrochen und wird nun fortgesetzt)
    --
    AddTraderTrigger(".+","Should we continue? Just say \"yes\" or \"no\".");
    AddCondition("lang","english");
    AddCondition("state","<",10);
    AddTraderTrigger(".+","Sollen wir weitermachen? Sag einfach \"ja\" oder \"nein\".");
    AddCondition("lang","german");
    AddCondition("state","<",10);




	
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
            local state = NPCStatus[originator.id];


            TellSmallTalk(message,originator);
    	else
            Confused(
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




