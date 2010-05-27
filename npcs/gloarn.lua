--Name:        Gloarn
--Race:        Human
--Town:        ???
--Function:    Schweinehirte/Dorfdepp

require("npcs.base.functions")
module("npcs.gloarn")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "He, nicht kitzeln!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Hey, don't tickle me!") end
end

function initializeNpc()
    npcs.base.functions.InitTalkLists()
    
    npcs.base.functions.AddTraderTrigger("[Gg]rüße","Hallo du.."); -- Fügt Triggertext mit Antwort hinzu
    npcs.base.functions.AddAdditionalTrigger("[Hh]allo");          -- Fügt zu letztem "npcs.base.functions.AddTraderTrigger" zusätzlichen Triggertext hinzu
    npcs.base.functions.AddAdditionalTrigger("[Gg]ruesse");
    npcs.base.functions.AddAdditionalText("Huhu duhu");    -- Fügt zu letztem "npcs.base.functions.AddTraderTrigger" zusätzliche Antwort hinzu
    npcs.base.functions.AddTraderTrigger("[Gg]reetings","Hiya.."); -- Fügt Triggertext mit Antwort hinzu
    npcs.base.functions.AddAdditionalTrigger("[Hh]ello");          -- Fügt zu letztem "npcs.base.functions.AddTraderTrigger" zusätzlichen Triggertext hinzu
    npcs.base.functions.AddAdditionalText("Hiho");
    npcs.base.functions.AddTraderTrigger("[Ww]ho","Mom says "..thisNPC.name..", everyone else says dumbhead.");
    npcs.base.functions.AddTraderTrigger("[Ww]er","Mama sagt "..thisNPC.name..", alle anderen nennen mich Dummkopf.");
    npcs.base.functions.AddTraderTrigger("[Mm]om","Mom said, Daddy is a pig, the next day, he didn't return home. Now mom is gone too. I think they both turned into pigs, so I watch over them here.");
    npcs.base.functions.AddTraderTrigger("[Mm]ama","Mama hat gesagt, Papa ist ein Schwein. Am nächsten Tag kam er nicht mehr Heim. Jetzt ist auch Mama weg. Ich glaub sie sind jetzt beide Schweine, also passe ich hier auf sie auf.");
    npcs.base.functions.AddTraderTrigger("[Nn]o.+pig","Liar.");
    npcs.base.functions.AddTraderTrigger("[Kk]ein.+[Ss]chwein.*","Lügner.");
    npcs.base.functions.AddTraderTrigger("[Pp]ig","These Pigs are my friends.");
    npcs.base.functions.AddAdditionalText("They all have names. This one is Blinky, there is Pinky, this is Inky, and see, here's Clyde."); -- Ich mag kleine dumme Anspielungen, bin neugierig ob wer draufkommt
    npcs.base.functions.AddTraderTrigger("[Ss]chwein","Die Schweine sind meine Freunde.");
    npcs.base.functions.AddAdditionalText("Sie haben alle Namen. Da ist Blinkie, dort ist Pinkie, das da ist Inkie, und schau, hier ist Clyde.");
    npcs.base.functions.AddTraderTrigger("[Cc]loud","Look, another piggie-cloud.");
    npcs.base.functions.AddTraderTrigger("[Ww]olke","Schau, eine Schweichenwolke.");
    npcs.base.functions.AddTraderTrigger("[Bb]ye.","See ya.");
    npcs.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.functions.AddAdditionalText("Piggies say I should say bye to you.");
    npcs.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Baba");
    npcs.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.functions.AddAdditionalText("Die Schweinchen sagen, ich soll Wiedersehn sagen.");
    
    
    npcs.base.functions.AddCycleText("#me pfeift vor sich hin","#me whistles"); -- Fügt Text der alle paar Min gesagt wird hinzu
    npcs.base.functions.AddCycleText("#me bohrt in der Nase","#me picks his nose");
    npcs.base.functions.AddCycleText("#me flüstert mit einem Schwein","#me whispers with a pig");
    npcs.base.functions.AddCycleText("#me riecht an seinem Finger","#me smells his finger");
    npcs.base.functions.AddCycleText("#me rülpst","#me burps");
    npcs.base.functions.AddCycleText("#me furzt","#me farts");
    npcs.base.functions.AddCycleText("#me kichert","#me giggles");
    npcs.base.functions.AddCycleText("#me starrt eine Wolke an","#me stares at a cloud");
    npcs.base.functions.AddCycleText("Oink, Oink, meine Freunde","Oink, Oink, my friends");
    npcs.base.functions.AddCycleText("#me gähnt","#me yawns");
    npcs.base.functions.AddCycleText("#me steckt fasziniert einen Finger durch ein Loch in seiner Hose","#me finds a hole in his trousers and puts a finger through it");
    npcs.base.functions.AddCycleText("#me macht Spuckeblasen","#me makes spitbubbles");
    
    
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
        npcs.base.functions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npcs.base.functions.SpeakerCycle();
end	

function receiveText(texttype, message, originator)
    if npcs.base.functions.BasicNPCChecks(originator,2) then
        if (npcs.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            npcs.base.functions.TellSmallTalk(message);
        else
            if (verwirrt==false) then
                gText="#me grinst dich blöde an";
                eText="#me grins stupidly at you";
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function