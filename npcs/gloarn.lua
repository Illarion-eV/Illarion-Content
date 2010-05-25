--Name:        Gloarn
--Race:        Human
--Town:        ???
--Function:    Schweinehirte/Dorfdepp

dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "He, nicht kitzeln!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Hey, don't tickle me!") end
end

function initializeNpc()
    InitTalkLists()
    
    AddTraderTrigger("[Gg]rüße","Hallo du.."); -- Fügt Triggertext mit Antwort hinzu
    AddAdditionalTrigger("[Hh]allo");          -- Fügt zu letztem "AddTraderTrigger" zusätzlichen Triggertext hinzu
    AddAdditionalTrigger("[Gg]ruesse");
    AddAdditionalText("Huhu duhu");    -- Fügt zu letztem "AddTraderTrigger" zusätzliche Antwort hinzu
    AddTraderTrigger("[Gg]reetings","Hiya.."); -- Fügt Triggertext mit Antwort hinzu
    AddAdditionalTrigger("[Hh]ello");          -- Fügt zu letztem "AddTraderTrigger" zusätzlichen Triggertext hinzu
    AddAdditionalText("Hiho");
    AddTraderTrigger("[Ww]ho","Mom says "..thisNPC.name..", everyone else says dumbhead.");
    AddTraderTrigger("[Ww]er","Mama sagt "..thisNPC.name..", alle anderen nennen mich Dummkopf.");
    AddTraderTrigger("[Mm]om","Mom said, Daddy is a pig, the next day, he didn't return home. Now mom is gone too. I think they both turned into pigs, so I watch over them here.");
    AddTraderTrigger("[Mm]ama","Mama hat gesagt, Papa ist ein Schwein. Am nächsten Tag kam er nicht mehr Heim. Jetzt ist auch Mama weg. Ich glaub sie sind jetzt beide Schweine, also passe ich hier auf sie auf.");
    AddTraderTrigger("[Nn]o.+pig","Liar.");
    AddTraderTrigger("[Kk]ein.+[Ss]chwein.*","Lügner.");
    AddTraderTrigger("[Pp]ig","These Pigs are my friends.");
    AddAdditionalText("They all have names. This one is Blinky, there is Pinky, this is Inky, and see, here's Clyde."); -- Ich mag kleine dumme Anspielungen, bin neugierig ob wer draufkommt
    AddTraderTrigger("[Ss]chwein","Die Schweine sind meine Freunde.");
    AddAdditionalText("Sie haben alle Namen. Da ist Blinkie, dort ist Pinkie, das da ist Inkie, und schau, hier ist Clyde.");
    AddTraderTrigger("[Cc]loud","Look, another piggie-cloud.");
    AddTraderTrigger("[Ww]olke","Schau, eine Schweichenwolke.");
    AddTraderTrigger("[Bb]ye.","See ya.");
    AddAdditionalTrigger("[Ff]arewell");
    AddAdditionalText("Piggies say I should say bye to you.");
    AddTraderTrigger("[Aa]uf.+[Bb]ald","Baba");
    AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    AddAdditionalText("Die Schweinchen sagen, ich soll Wiedersehn sagen.");
    
    
    AddCycleText("#me pfeift vor sich hin","#me whistles"); -- Fügt Text der alle paar Min gesagt wird hinzu
    AddCycleText("#me bohrt in der Nase","#me picks his nose");
    AddCycleText("#me flüstert mit einem Schwein","#me whispers with a pig");
    AddCycleText("#me riecht an seinem Finger","#me smells his finger");
    AddCycleText("#me rülpst","#me burps");
    AddCycleText("#me furzt","#me farts");
    AddCycleText("#me kichert","#me giggles");
    AddCycleText("#me starrt eine Wolke an","#me stares at a cloud");
    AddCycleText("Oink, Oink, meine Freunde","Oink, Oink, my friends");
    AddCycleText("#me gähnt","#me yawns");
    AddCycleText("#me steckt fasziniert einen Finger durch ein Loch in seiner Hose","#me finds a hole in his trousers and puts a finger through it");
    AddCycleText("#me macht Spuckeblasen","#me makes spitbubbles");
    
    
    TradSpeakLang={0,1,4};  -- Sprache die der NPC spricht
    TradStdLang=0;          -- Sprache die der NPC normalerweise spricht
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
end
    
function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    SpeakerCycle();
end	

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if (LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            TellSmallTalk(message);
        else
            if (verwirrt==false) then
                gText="#me grinst dich blöde an";
                eText="#me grins stupidly at you";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function