--Name:        Penny Copperneedle 
--Race:        Halbling
--Town:        Newbie Insel
--Function:    Färben beibringen
--Position:    x=-74 y=-104 z=0
--Facing:      south
--Last Update: 14/06/2008
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


    AddTraderTrigger("hello","Hello my friend! I am "..thisNPC.name..", I dye the most beautyful clothes here. If you want, I show you how to dye cloth.");
    AddAdditionalTrigger("greet");
    AddCondition("state","=",0);
    AddTraderTrigger("hallo","Hallo mein Freund! Ich bin "..thisNPC.name..", ich färbe die schönsten Stoffe hier. Wenn du möchtest zeige ich dir, wie man Stoffe färbt.");
    AddAdditionalTrigger("gr[üu][sß]");
    AddCondition("state","=",0);
    AddAdditionalTrigger("greet");
    AddAdditionalTrigger("gr[üu][sß]");
    AddTraderTrigger("who you","I am "..thisNPC.name..", I dye the most beautyful clothes here. If you want, I show you how to dye cloth.");
    AddAdditionalTrigger("what you");
    AddTraderTrigger("wer du","Hallo mein Freund! Ich bin "..thisNPC.name..", ich färbe die schönsten Stoffe hier. Wenn du möchtest zeige ich dir, wie man Stoffe färbt.");
    AddAdditionalTrigger("wer ihr");
    AddAdditionalTrigger("was du");
    AddAdditionalTrigger("was ihr");
    AddTraderTrigger("dank","Bitte sehr.");
    AddTraderTrigger("thank","You're welcome");
    AddTraderTrigger("bye","Bye, bye.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Be well, my friend!");
    AddAdditionalText("Farewell, until we meet again.");
    AddTraderTrigger("tsch[üu][ßs]","Auf Wiedersehen, mein Freund!");
    AddAdditionalTrigger("tschue[sß]");
    AddAdditionalTrigger("leb wohl");
    AddAdditionalTrigger("wiederseh");
    AddAdditionalTrigger("auf bald");
    AddAdditionalTrigger("bis bald");
    AddAdditionalText("Tschüss auch.");
    AddAdditionalText("Leb wohl, bis zum nächsten Mal.");
    AddTraderTrigger("hilf","Wenn du möchtest kann ich dir zeigen, wie man Stoffe färbt. Möchtest du?");
    AddCondition("lang","german");
    AddCondition("state","<",10);
    AddConsequence("state","=",1);
    AddTraderTrigger("help","If you want, I can show you how to dye cloth. Do you want to?");
    AddCondition("lang","english");
    AddCondition("state","<",10);
    AddConsequence("state","=",1);
    AddTraderTrigger("reset","Status reset!");
    AddConsequence("state","=",0);

    -- Status: 0 - 1 (start teaching)
    --
    AddTraderTrigger("dye","You want to learn how to dye cloth? Excellent! I would say lets start right away, or?");
    AddAdditionalTrigger("cloth");
    AddAdditionalTrigger("craft");
    AddAdditionalTrigger("teach");
    AddAdditionalTrigger("learn");
    AddAdditionalTrigger("show");
    AddCondition("state","=",0);
    AddCondition("lang","english");
    AddConsequence("state","=",1);
    AddTraderTrigger("färb","Du möchtest also lernen, wie man Stoffe färbt? Wunderbar! Ich würde sagen dann fangen wir am besten gleich an, oder?");
    AddAdditionalTrigger("stoff");
    AddAdditionalTrigger("handwerk");
    AddAdditionalTrigger("lern");
    AddAdditionalTrigger("lehr");
    AddAdditionalTrigger("zeig");
    AddCondition("state","=",0);
    AddCondition("lang","german");
    AddConsequence("state","=",1);

    -- Status: 0 (Starthilfe)
    --
    AddTraderTrigger(".+","Sag \"Hilfe\" wenn du nicht weiter weißt.");
    AddCondition("lang","german");
    AddCondition("state","=",0);
    AddTraderTrigger(".+","Say \"help\" if you don't know, what to do.");
    AddCondition("lang","english");
    AddCondition("state","=",0);

    -- Status: 1 -> 10 (Grauen Stoff in weißen verwandeln)
    --
    AddTraderTrigger("yes","Well, firstly we need some cloth. Here you have some, but it's grey and ugly cloth. You must bleach the cloth, before you can dye it, but this is easy. Just lay the cloth on the ground next to you and wait. The sun bleaches it automatically after a time. Come back to me, when you have some white cloth");
    AddCondition("state","=",1);
    AddConsequence("state","=",10);
    AddConsequence("item",176,5,999,0);
    AddTraderTrigger("ja","Fein fein! Als erstes brauchst du Stoff. Hier hast du welchen. Er ist noch grau und unsansehnlich. Leg ihn auf den Boden neben dich und warte bis er sich aufgehellt hat. Wenn der Stoff weiß geworden ist, dann komm zurück zu mir.");
    AddCondition("state","=",1);
    AddConsequence("state","=",10);
    AddConsequence("item",176,5,999,0);
    AddTraderTrigger("no","Not? It's a pity, but you can come back to continue whenever you want.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);
    AddTraderTrigger("nein","Nicht? Schade, aber du kansnt zurückkommen wann immer du willst, dann machen wir weiter.");
    AddCondition("state","=",1);
    AddConsequence("state","=",0);

    -- Status: 1 (eine andere Anwort)
    --
    AddTraderTrigger(".+","A simple \"yes\" or \"no\" is enough for me as an answer. So, do you want to learn how to dye clothes or not?");
    AddCondition("lang","english");
    AddCondition("state","=",1);
    AddTraderTrigger(".+","Ein einfaches \"ja\", oder \"nein\" reicht mir als Antwort. Also...willst du nun lernen wie man Stoffe färbt, oder nicht?.");
    AddCondition("lang","german");
    AddCondition("state","=",1);

    -- Status: 10 (Hilfe)
    --
    AddTraderTrigger("help","Still have some problems? There is not really much, you must do. Just lay the cloth on the ground and wait, until it becomes white. This takes possibly some time. But if you don't want to wait this time, I can give you some white cloth. Want you?");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);
    AddTraderTrigger("hilf","Gibt es noch Probleme? Eigentlich musst du gar nichts tun. Leg einfach den grauen Stoff neben dich auf den Boden und warte, bis er weiß geworden ist. Dann kann unter Umständen ein paar Minuten dauern. Aber wenn du nicht so lange warten willst, kann ich dir auch gerne weißen Stoff geben, dann können wir weitermachen. Möchtest du das?");
    AddCondition("state","=",10);
    AddConsequence("state","=",11);

    -- Status: 11 (Auf Wunsch wird weißer Stoff gegeben)
    --
    AddTraderTrigger("yes","Here you go. When you are ready, we can continue. Ready?");
    AddCondition("state","=",11);
    AddConsequence("state","=",2);
    AddConsequence("item",178,5,999,0);
    AddTraderTrigger("ja","Hier hast du welchen. Wenn du dann soweit bist können wir gleich weitermachen. Bereit?");
    AddCondition("state","=",11);
    AddConsequence("state","=",2);
    AddConsequence("item",178,5,999,0);
    AddTraderTrigger("no","Right, try it as often, as you want.");
    AddCondition("state","=",11);
    AddConsequence("state","=",10);
    AddTraderTrigger("nein","In Ordnung, versuch es ruhig, so oft du magst.");
    AddCondition("state","=",11);
    AddConsequence("state","=",10);

    -- Status: >=1 (Mehr grauer Stoff)
    --
    AddTraderTrigger("cloth","Ah...you need more grey cloth, or? Here you have some.");
    AddCondition("state","=",10);
    AddCondition("item",176,"all","=",0);
    AddConsequence("item",176,5,333,0);
    AddTraderTrigger("stoff","Ah...du brauchst mehr grauen Stoff, oder? Hier hast du noch welchen.");
    AddCondition("state","=",10);
    AddCondition("item",176,"all","=",0);
    AddConsequence("item",176,5,333,0);

    -- Status: 10 (Stoff ist noch grau...weißen Stoff geben?)
    --
    AddTraderTrigger(".+","Your cloth is still not white enough. Patience my friend! Just lay it a bit more longer into the sun. If you don't want to wait, I can give you optional some white cloth. Want you?");
    AddCondition("lang","english");
    AddCondition("state","=",10);
    AddCondition("item",176,"all",">=",0);
    AddCondition("item",178,"all","=",0);
    AddConsequence("state","=",11);
    AddTraderTrigger(".+","Dein Stoff ist noch nicht weiß genug. Nur Geduld mein Freund! Leg ihn einfach noch eine Weile in die Sonne. Wenn du nicht warten möchtest kann ich dir aber auch gleich weißen Stoff geben. Möchtest du das?.");
    AddCondition("lang","german");
    AddCondition("state","=",10);
    AddCondition("item",176,"all",">=",0);
    AddCondition("item",178,"all","=",0);
    AddConsequence("state","=",11);

    -- Status: 10 -> 2 (weißer Stoff ist da - weitermachen?)
    --
    AddTraderTrigger(".+","Very nice, you did it! Now I show you how to produce the dye you need to dye your white cloth later. Are you ready?");
    AddCondition("state","=",10);
    AddCondition("item",178,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("state","=",2);
    AddTraderTrigger(".+","Sehr gut, du hast es geschafft! Als nächstes zeige ich dir, wie du die Farbe herstellst, mit der du den weißen Stoff dann färben kannst. Bist du soweit?");
    AddCondition("state","=",10);
    AddCondition("item",178,"all",">",0);
    AddCondition("lang","german");
    AddConsequence("state","=",2);

    -- Status: 2 -> 20 (grüne Farbe herstellen)
    --
    AddTraderTrigger("yes","I would propose, we try green dye first, because it's the easiest to produce. You need buckets with water, some cabbage a mortar to produce the dye. Take the mortar in your hands, the cabbage and the buckets with water in your belt and stay in front of the fire. 'Use' the mortar and a menue will open, where you can choose the green dye. Come back if you have make a bucket with green dye.");
    AddCondition("state","=",2);
    AddConsequence("state","=",20);
    AddConsequence("item",290,15,333,0);
    AddConsequence("item",52,5,333,0);
    AddConsequence("item",58,1,999,0);
    AddTraderTrigger("ja","Ich würde sagen, wir versuchen es zuerst mit grüner Farbe, denn die ist am einfachsten herzustellen. Dafür brauchen wir Eimer mit Wasser, Kohl und Mörser. Stell dich vor das Feuer hier, nimm den Mörser in die Hand und den Kohl sowie die Wassereimer 'in' deinen Gürtel. Wenn du nun den Mörser benutzt öffnet sich ein Menü, wo du die grüne Farbe auswählen kannst. Komm wieder, wenn du einen Eimer mit grüner Farbe hast.");
    AddCondition("state","=",2);
    AddConsequence("state","=",20);
    AddConsequence("item",290,15,333,0);
    AddConsequence("item",52,5,333,0);
    AddConsequence("item",58,1,999,0);
    AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    AddCondition("state","=",2);
    AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    AddCondition("state","=",2);

    -- Status: 20 (Hilfe)
    --
    AddTraderTrigger("help","Still have some problems? You must hold the mortar in your hand and the cabbage and the buckets with water in your belt. If the work fails you can refill the buckets with water when you take the bucket in your hand and 'use' it with the well over there. Or you ask me for new buckets with water. Anyway, if you want to continue, I can give you some green dye. Want you?");
    AddCondition("state","=",20);
    AddConsequence("state","=",21);
    AddTraderTrigger("hilf","Gibt's noch Probleme? Du musst den Mörser in der Hand halten und die Wassereimer und den Kohl 'im' Gürtel. Wenn deine Arbeit fehlschlägt kannst du die Eimer neu mit Wasser füllen, wenn du sie in die Hand nimmst und  mit dem Brunnen dort 'benutzt'. Oder du fragst mich einfach nach neuen Wassereimern. Ich kann dir aber auch gleich die grüne Farbe geben, wenn du erstmal weitermachen willst. Möchtest du das?");
    AddCondition("state","=",20);
    AddConsequence("state","=",21);

    -- Status: 21 (Auf Wunsch wird gleich die grüne Farbe gegeben)
    --
    AddTraderTrigger("yes","Alright, here is some green dye. Would you like to continue?");
    AddCondition("state","=",21);
    AddConsequence("state","=",3);
    AddConsequence("item",2679,5,333,0);
    AddTraderTrigger("ja","In Ordnung, hier sind ein paar Eimer mit grüner Farbe. Wollen wir dann weitermachen?");
    AddCondition("state","=",21);
    AddConsequence("state","=",3);
    AddConsequence("item",2679,5,333,0);
    AddTraderTrigger("no","Alright, try it as often, as you want.");
    AddCondition("state","=",21);
    AddConsequence("state","=",20);
    AddTraderTrigger("nein","In Ordnung, versuch es ruhig, so oft du magst.");
    AddCondition("state","=",21);
    AddConsequence("state","=",20);

    -- Status: 20 (Mehr Wassereimer)
    --
    AddTraderTrigger("water","Ah...you need more buckets with water, or? Here you have some. You can throw the empty buckets away.");
    AddCondition("state",">",20);
    AddCondition("item",52,"all","=",0);
    AddConsequence("deleteitem",51,5);
    AddConsequence("item",52,5,333,0);
    AddTraderTrigger("wasser","Ah...du brauchst mehr Eimer mit Wasser, oder? Hier hast du noch welche. Die leeren Eimer kannst du fortwerfen.");
    AddCondition("state",">",20);
    AddCondition("item",52,"all","=",0);
    AddConsequence("deleteitem",51,5);
    AddConsequence("item",52,5,333,0);

    -- Status: 20 (Mehr Kohl)
    --     
    AddTraderTrigger("cabbage","Ah...you need more cabbage, or? Here you have some.");
    AddCondition("state",">",20);
    AddCondition("item",290,"all","<",3);
    AddConsequence("item",290,10,333,0);
    AddTraderTrigger("kohl","Ah...du brauchst mehr Kohl, oder? Hier hast du noch welchen.");
    AddCondition("state",">",20);
    AddCondition("item",290,"all","<",3);
    AddConsequence("item",290,10,333,0);

    -- Status: 20 (Neuer Mörser)
    --     
    AddTraderTrigger("scissor","Did you need a new mortar? Here you have one.");
    AddCondition("state",">",20);
    AddCondition("item",58,"all","=",0);
    AddConsequence("item",58,1,999,0);
    AddTraderTrigger("schere","Brauchst du einen neuen Mörser? Hier hast du einen.");
    AddCondition("state",">",20);
    AddCondition("item",58,"all","=",0);
    AddConsequence("item",58,1,999,0);

    -- Status: 20 (Grüne Farbe nicht da)
    --     
    AddTraderTrigger(".+","You still have no green dye. Come back, when you have filled one bucket with green dye.");
    AddCondition("lang","english");
    AddCondition("state","=",20);
    AddCondition("item",2679,"all","=",0);
    AddTraderTrigger(".+","Du hast noch keine grüne Farbe. Komm wieder, wenn du mindestens Eimer mit grüner Farbe hast.");
    AddCondition("lang","german");
    AddCondition("state","=",20);
    AddCondition("item",2679,"all","=",0);

    -- Status: 20 (Grüne Farbe unvollständig)
    --
    AddTraderTrigger(".+","Oh... this dye isn't finished. If you want to continue the work on an unfinished bucket of dye, just 'use' the mortar with that bucket, having it placed 'in' the belt of course.");
    AddCondition("state","=",22);
    AddCondition("lang","english");
    AddConsequence("state","=",20);
    AddTraderTrigger(".+","Oh... diese Farbe ist noch nicht fertig. Wenn du die Arbeit an einem unfertigen Eimer mit Farbe weiterführen willst, dann 'benutze' den Mörser mit diesem Eimer, den du natürlich am Gürtel trägst.");
    AddCondition("state","=",22);
    AddCondition("lang","german");
    AddConsequence("state","=",20);

    -- Status: 20 -> 3 (Grüne Farbe ist da - weitermachen?)
    --
    AddTraderTrigger(".+","Ah...you finished with the green dye. Perfect. The next is to dye the white cloth with the dye. Ready to continue?");
    AddCondition("state","=",23);
    AddCondition("lang","english");
    AddConsequence("state","=",3);
    AddTraderTrigger(".+","Ah...du bist fertig mit der grünen Farbe. Perfekt. Als nächstes zeige ich dir, wie du den weißen Stoff mit der grünen Farbe färbst. Wollen wir gleich weitermachen?");
    AddCondition("state","=",23);
    AddCondition("lang","german");
    AddConsequence("state","=",3);

    -- Status: 3 -> 30 (Stoff färben)
    --
    AddTraderTrigger("yes","Take this dying rod and stay in front of that barrel next to the well there. You must have the green dye as well as the white cloth 'in' your belt, or it doesn't works. Just 'use' the barrel now and you will start automatically to dye the cloth. If you need anymore, just ask me for that. Come back to me, when you have make green cloth.");
    AddCondition("state","=",3);
    AddCondition("lang","english");
    AddConsequence("item",2781,1,999,0);
    AddConsequence("state","=",30);
    AddTraderTrigger("ja","Nimm diesen Rühstab und stell dich vor das Fass dort neben dem Brunnen. Du musst sowohl die grüne Farbe, als auch den weißen Stoff 'im' Gürtel haben damit es funktioniert. 'Benutze' nun das Färbefass und du fängst automatisch an den Stoff zu färben. Falls du noch irgendwas brauchst, frag mich einfach danach. Komm wieder, wenn du es geschafft hast grünen Stoff herzustellen.");
    AddCondition("state","=",3);
    AddCondition("lang","german");
    AddConsequence("item",2781,1,999,0);
    AddConsequence("state","=",30);
    AddTraderTrigger("no","It's a pity, but maybe later. You can come back whenever you want.");
    AddCondition("state","=",3);
    AddTraderTrigger("nein","Schade, aber vielleicht später. Komm zurück wann immer du willst.");
    AddCondition("state","=",3);

    -- Status: 30 (Mehr grüne Farbe)
    --
    AddTraderTrigger("green","Ah...you need more green color, or? Here you have some buckets.");
    AddAdditionalTrigger("dye");
    AddCondition("state",">",30);
    AddCondition("item",2679,"all","=",0);
    AddConsequence("item",2679,5,333,0);
    AddTraderTrigger("gr[uü][en]","Ah...du brauchst mehr grüne Farbe, richtig? Hier hast du noch ein paar Eimer.");
    AddAdditionalTrigger("farbe");
    AddCondition("state",">",30);
    AddCondition("item",2679,"all","=",0);
    AddConsequence("item",2679,5,333,0);

    -- Status: 30 (Mehr grauen Stoff)
    --
    AddTraderTrigger("grey","Ah...you need more grey cloth, right? Here you have some.");
    AddCondition("state",">",30);
    AddCondition("item",176,"all","=",0);
    AddConsequence("item",176,5,333,0);
    AddTraderTrigger("grau","Ah...du brauchst mehr grauen Stoff, richtig? Hier hast du noch welchen.");
    AddCondition("state",">",30);
    AddCondition("item",176,"all","=",0);
    AddConsequence("item",176,5,333,0);

    -- Status: 30 (Mehr weißer Stoff)
    --
    AddTraderTrigger("cloth","Ah...you need more cloth, or? Here you have some.");
    AddAdditionalTrigger("white");
    AddCondition("state",">",30);
    AddCondition("item",178,"all","=",0);
    AddConsequence("item",178,5,333,0);
    AddTraderTrigger("wei[sß]","Ah...du brauchst mehr Stoff, richtig? Hier hast du noch welchen.");
    AddAdditionalTrigger("stoff");
    AddCondition("state",">",30);
    AddCondition("item",178,"all","=",0);
    AddConsequence("item",178,5,333,0);

    -- Status: 30 (Neuer Rührstab)
    --
    AddTraderTrigger("rod","Did you need a new dying rod? Here you have one.");
    AddCondition("state",">",30);
    AddCondition("item",2781,"all","=",0);
    AddConsequence("item",2781,1,999,0);
    AddTraderTrigger("stab","Brauchst du einen neuen Rührstab? Hier hast du einen.");
    AddAdditionalTrigger("r[uü][eh][hr]");
    AddCondition("state",">",30);
    AddCondition("item",2781,"all","=",0);
    AddConsequence("item",2781,1,999,0);

    -- Status: 30 (Hilfe)
    --
    AddTraderTrigger("help","Does it not work? You must hold the dying rod in both hands. Put all other things, you hold in your hands, away first. The dye and the white cloth must be 'in' your belt. Just 'use' the barrel and you will start to dye.");
    AddCondition("state","=",30);
    AddTraderTrigger("hilf","Klappt etwas nicht? Du must den Rühstab in beide Hände nehmen. Leg dafür zuerst alle anderen Sachen aus der Hand. Die Farbe und der weiße Stoff muss 'im' Gürtel sein. Dann das Fass 'benutzen' und schon fängst du an zu färben.");
    AddCondition("state","=",30);

    -- Status: 30 (Noch kein grüner Stoff da)
    --
    AddTraderTrigger(".+","Use the barrel next to the well to make some green dye. Tell me, if you need help.");
    AddCondition("lang","english");
    AddCondition("state","=",30);
    AddCondition("item",54,"all","=",0);
    AddTraderTrigger(".+","Benutz das Fass neben dem Brunnen um grüne Farbe herzustellen. Wenn du hilfe brauchst, dann sag mir einfach bescheid.");
    AddCondition("lang","german");
    AddCondition("state","=",30);
    AddCondition("item",54,"all","=",0);
  
    -- Status: 30 -> 4 (Grüner Stoff ist da - Ende!)
    --
    AddTraderTrigger(".+","Excellent work! You did it! Now you know how to dye clothes. Except for green dye some other colors are possible of course. With more experience, you can make more colors. If you want to know, how to tailor anything just ask my sister Jenny. She stays over there next to the sheeps. Farewell and good luck!");
    AddCondition("state","=",30);
    AddCondition("item",54,"all",">",0);
    AddCondition("lang","english");
    AddConsequence("state","=",0);
    AddTraderTrigger(".+","Großartig! Du hast es geschafft. Du weißt nun, wie man Stoffe färbt. Außer grün gibt es natürlich noch viele andere Farben mit denen man Stoffe färben kann. Je mehr Erfahrung du im Färben hast, desto mehr Farben kannst du herstellen. Wenn du nun noch wissen willst, wie man aus Stoffen etwas schneidern kann, dann frag am besten meine Schwester Jenny. Sie steht dort drüben bei den Schafen. Leb wohl und viel Erfolg!");
    AddCondition("state","=",30);
    AddCondition("item",54,"all",">",0);
    AddCondition("lang","german");
    AddConsequence("state","=",0);

    -- Status:  <10 und >0 (Unterricht wurde unterbrochen und wird nun fortgesetzt)
    --
    AddTraderTrigger(".+","Should we continue? Just say \"yes\" or \"no\".");
    AddCondition("lang","english");
    AddCondition("state","<=",10);
    AddCondition("state",">",0);
    AddTraderTrigger(".+","Sollen wir weitermachen? Sag einfach \"ja\" oder \"nein\".");
    AddCondition("lang","german");
    AddCondition("state","<=",10);
    AddCondition("state",">",0);
    
	
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
	     if (state == 20) or (state == 22) then
                 if CountItemsWithQuality(originator,2679,100,-1) > 0 then
                     NPCStatus[originator.id] = 22;		-- unfinished
                 elseif CountItemsWithQuality(originator,2679,99,1) > 0 then
                     NPCStatus[originator.id] = 23;		-- finished
		 else
		     NPCStatus[originator.id] = 20;
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




