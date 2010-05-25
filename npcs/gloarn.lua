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
    npcs.base.autonpcfunctions.InitTalkLists()
    
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]rüße","Hallo du.."); -- Fügt Triggertext mit Antwort hinzu
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]allo");          -- Fügt zu letztem "npcs.base.autonpcfunctions.AddTraderTrigger" zusätzlichen Triggertext hinzu
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]ruesse");
    npcs.base.autonpcfunctions.AddAdditionalText("Huhu duhu");    -- Fügt zu letztem "npcs.base.autonpcfunctions.AddTraderTrigger" zusätzliche Antwort hinzu
    npcs.base.autonpcfunctions.AddTraderTrigger("[Gg]reetings","Hiya.."); -- Fügt Triggertext mit Antwort hinzu
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Hh]ello");          -- Fügt zu letztem "npcs.base.autonpcfunctions.AddTraderTrigger" zusätzlichen Triggertext hinzu
    npcs.base.autonpcfunctions.AddAdditionalText("Hiho");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ho","Mom says "..thisNPC.name..", everyone else says dumbhead.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]er","Mama sagt "..thisNPC.name..", alle anderen nennen mich Dummkopf.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]om","Mom said, Daddy is a pig, the next day, he didn't return home. Now mom is gone too. I think they both turned into pigs, so I watch over them here.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Mm]ama","Mama hat gesagt, Papa ist ein Schwein. Am nächsten Tag kam er nicht mehr Heim. Jetzt ist auch Mama weg. Ich glaub sie sind jetzt beide Schweine, also passe ich hier auf sie auf.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Nn]o.+pig","Liar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Kk]ein.+[Ss]chwein.*","Lügner.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Pp]ig","These Pigs are my friends.");
    npcs.base.autonpcfunctions.AddAdditionalText("They all have names. This one is Blinky, there is Pinky, this is Inky, and see, here's Clyde."); -- Ich mag kleine dumme Anspielungen, bin neugierig ob wer draufkommt
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]chwein","Die Schweine sind meine Freunde.");
    npcs.base.autonpcfunctions.AddAdditionalText("Sie haben alle Namen. Da ist Blinkie, dort ist Pinkie, das da ist Inkie, und schau, hier ist Clyde.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Cc]loud","Look, another piggie-cloud.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]olke","Schau, eine Schweichenwolke.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]ye.","See ya.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.autonpcfunctions.AddAdditionalText("Piggies say I should say bye to you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Baba");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.autonpcfunctions.AddAdditionalText("Die Schweinchen sagen, ich soll Wiedersehn sagen.");
    
    
    npcs.base.autonpcfunctions.AddCycleText("#me pfeift vor sich hin","#me whistles"); -- Fügt Text der alle paar Min gesagt wird hinzu
    npcs.base.autonpcfunctions.AddCycleText("#me bohrt in der Nase","#me picks his nose");
    npcs.base.autonpcfunctions.AddCycleText("#me flüstert mit einem Schwein","#me whispers with a pig");
    npcs.base.autonpcfunctions.AddCycleText("#me riecht an seinem Finger","#me smells his finger");
    npcs.base.autonpcfunctions.AddCycleText("#me rülpst","#me burps");
    npcs.base.autonpcfunctions.AddCycleText("#me furzt","#me farts");
    npcs.base.autonpcfunctions.AddCycleText("#me kichert","#me giggles");
    npcs.base.autonpcfunctions.AddCycleText("#me starrt eine Wolke an","#me stares at a cloud");
    npcs.base.autonpcfunctions.AddCycleText("Oink, Oink, meine Freunde","Oink, Oink, my friends");
    npcs.base.autonpcfunctions.AddCycleText("#me gähnt","#me yawns");
    npcs.base.autonpcfunctions.AddCycleText("#me steckt fasziniert einen Finger durch ein Loch in seiner Hose","#me finds a hole in his trousers and puts a finger through it");
    npcs.base.autonpcfunctions.AddCycleText("#me macht Spuckeblasen","#me makes spitbubbles");
    
    
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
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npcs.base.autonpcfunctions.SpeakerCycle();
end	

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if (npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            npcs.base.autonpcfunctions.TellSmallTalk(message);
        else
            if (verwirrt==false) then
                gText="#me grinst dich blöde an";
                eText="#me grins stupidly at you";
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function