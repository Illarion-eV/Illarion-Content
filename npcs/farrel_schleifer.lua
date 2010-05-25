--Name:        Farrel Schleifer
--Race:        Mensch
--Town:        Newbie Insel
--Function:    Edelsteinschleifen beibringen
--Position:    x=? y=? z=?
--Facing:      south
--Last Update: 18/06/08
--Update by:   Silverwolf


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
    AddTraderTrigger("hello","Be greeted stranger! I'm "..thisNPC.name..", the gem-cutter of this island. If you want, I show you how to become a gem-tailer.");
    AddAdditionalTrigger("greet");
    AddCondition("state","=",0);
    AddTraderTrigger("hallo","Sei gegrüßt Fremder! Ich bin "..thisNPC.name..", der beste Edelsteinschleifer auf der Insel. Wenn du möchtest, zeige ich dir, wie du ein guter Edelsteinschleifer wirst.");
    AddAdditionalTrigger("gr[üu][sß]");
    AddCondition("state","=",0);
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("gr[üu][sß]");
    AddTraderTrigger("who you","I am "..thisNPC.name..", the best gem-cutter of this island. If you want, I show you how to become a good gem-trailer.");
    AddAdditionalTrigger("what you");
    AddTraderTrigger("wer du","Sei gegrüßt Fremder! Ich bin "..thisNPC.name..", der beste Edelstenerscheifer auf der Insel. Wenn du möchtest, zeige ich dir, wie du ein guter Edelsteinschleifer wirst.");
    AddAdditionalTrigger("wer ihr");
    AddAdditionalTrigger("was du");
    AddAdditionalTrigger("was ihr");
    AddTraderTrigger("bye","Bye, bye.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Be well!");
    AddAdditionalText("Farewell, until we meet again.");
    AddTraderTrigger("tsch[üu][ßs]","Auf Wiedersehen.");
    AddAdditionalTrigger("tschue[sß]");
    AddAdditionalTrigger("leb wohl");
    AddAdditionalTrigger("wiederseh");
    AddAdditionalTrigger("auf bald");
    AddAdditionalTrigger("bis bald");
    AddAdditionalText("Tschüss auch.");
    AddAdditionalText("Leb wohl, bis zum nächsten Mal.");
    AddTraderTrigger("hilf","Wenn du möchtest kann ich dir zeigen, wie man Edelsteine schleift. Möchtest du das?");
    AddCondition("lang","german");
    AddCondition("state","<",10);
    AddConsequence("state","=",1);
    AddTraderTrigger("help","If you want, I can show you how to cut gems. D'you want that?");
    AddCondition("lang","english");
    AddCondition("state","<",10);
    AddConsequence("state","=",1);
    AddTraderTrigger("reset","Status reset!");
    AddConsequence("state","=",0);

    -- Status: 0 - 1 (start teaching)
    --
    AddTraderTrigger("trail(?)","You want to learn how to cut gems? I am very pleased to hear that. Want to start right away?");
    AddAdditionalTrigger("craft");
    AddAdditionalTrigger("teach");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("show");
    AddCondition("state","=",0);
    AddCondition("lang","english");
    AddConsequence("state","=",1);
    AddTraderTrigger("schleifer","Du möchtest also lernen, wie man Edelsteine schleift? Das freut mich sehr. Wollen wir gleich anfangen?");
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

    -- Status: 1 -> 10 (Zange zumm Edelstein schleifen)
    --
    AddTraderTrigger("yes","Excellent. Firstly, we need tongs to hold the gems into and for sure gems. Stay directly in front of a gem-cutter and 'use' the tongs. Just try it! Come again when you have at least 10 cutted gems.");
    AddCondition("state","=",1);
    AddConsequence("state","=",10);
    AddConsequence("item",2140);
    AddConsequence("item",197);
    AddTraderTrigger("ja","Hervorragend! Als erstes brauchen wir eine Zange, um die Edelsteine darin zu halten und nätürlich rohe Edelsteine. Stell dich einfach direkt vor den Edelsteinschleifer und 'benutze' die Zange. Komm wieder wenn du mindestens 10 geschiffene Edelsteine hast.");
    AddCondition("state","=",1);
    AddConsequence("state","=",10);
    AddConsequence("item",2140);
    AddConsequence("item",197);
    AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);

    -- Status: 1 (eine andere Anwort)
    --
    AddTraderTrigger(".+","I ask you if I should teach you to cut gems. Just say \"yes\" or \"no\".");
    AddCondition("lang","english");
    AddCondition("state","=",1);
    AddTraderTrigger(".+","Ich habe dich gefragt, ob ich dir das Edelsteinschleifen beibringen soll...sag einfach \"ja\", oder \"nein\".");
    AddCondition("lang","german");
    AddCondition("state","=",1);

    -- Status: 10 (Hilfe)
    --
    AddTraderTrigger("help","Does it not work? You must stay directly in front of the gem-cutter and then 'use' the tongs. With a bit training it would work fine.");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);
    AddTraderTrigger("hilf","Klappt etwas nicht? Du musst dich direkt vor den Edelsteinschleifer stellen und dann die Zange 'benutzen'. Mit etwas Übung wirst du es sicher schaffen.");
    AddCondition("state","=",1);
    AddConsequence("state","=",11);

    -- Status: 11 (Auf Wunsch wirden Edelsteine gegeben)
    --
    AddTraderTrigger("yes","Here you go. This should be enough for now. If you want to learn the melt ore and coal to ingots, just go to my friend the blacksmith. His name is Arax Ironheart. You'll friend him in his blacksmith over there.");
    AddCondition("state","=",11);
    AddConsequence("state","=",2);
    AddConsequence("item",22);
    AddConsequence("item",21);
    AddTraderTrigger("ja","Hier, bitte sehr. Das sollte erstmal reichen. Wenn du lernen willst, das Erz und die Kohle zu Eisenbarren zu schmelzen, geh einfach zu meinem Freund dem Schmied. Sein Name ist Arax Ironheart. Du wirstt ihn in seiner Schmiede dort drüben finden.");
    AddCondition("state","=",11);
    AddConsequence("state","=",2);
    AddConsequence("item",22);
    AddConsequence("item",21);
    AddTraderTrigger("no","Yes, retry it. That is the right way.");
    AddCondition("state","=",11);
    AddConsequence("state","=",10);
    AddTraderTrigger("nein","Ja, versuch es ruhig selbst nochmal. Das ist der richtige Weg.");
    AddCondition("state","=",11);
    AddConsequence("state","=",10);
	
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
             if (state == 50) or (state == 51) then
                 if CountItemsWithQuality(originator,196,100,-1) > 0 then
                     NPCStatus[originator.id] = 51;		-- unfinished
                 elseif CountItemsWithQuality(originator,196,99,1) > 0 then
                     NPCStatus[originator.id] = 52;		-- finished
		 else
		     NPCStatus[originator.id] = 50;
                 end
            end
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
