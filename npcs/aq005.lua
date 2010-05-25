--Name:        Sylvester
--Race:        Halfling
--Town:        East of Trollsbane
--Function:    AQ005 (The Thief)
--Position:    x=-23 y=-122 z=0
--Facing:      South
--Last Update: 04/24/2006
--Update by:   vilarion

dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Fassst mich nicht an!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    InitTalkLists()
    
	AddTraderTrigger("[Gg]reetings", "Um... hello. And who the hell are you?");
	AddAdditionalTrigger("[Hh]ello");
	AddAdditionalTrigger("[Hh]iho");
	AddTraderTrigger("[Gg]rüße", "Uhm... hallo. Und wer zum Teufel bist du?");
	AddAdditionalTrigger("[Hh]allo");
	AddAdditionalTrigger("[Hh]uhu");
	
	AddTraderTrigger("[Ii]'m", "Oh. Are you the one Weasel sent?");
	AddAdditionalTrigger("[Ii] am");
	AddAdditionalTrigger("[Mm]y name is");
	AddTraderTrigger("[Ii]ch bin", "Oh. Hat Wiesel dich geschickt?");
	AddAdditionalTrigger("[Mm]ein Name ist");
	AddAdditionalTrigger("[Ii]ch heisse");
	AddAdditionalTrigger("[Ii]ch heiße");
	
	AddTraderTrigger("[Ww]ho.+you?", "Shh! I'm Sylvester. Weasel sent you, didn't he?");
	AddTraderTrigger("[Ww]er.+du?", "Psst! Ich bin Sylvester. Wiesel hat dich geschickt, richtig?");
	
	AddTraderTrigger("[Nn]o", "What?? You ain't the one he sent? Bahh, buzz off!");
	AddTraderTrigger("[Nn]ein", "Was?? Du bist nicht der den er geschickt hat? Bah, zisch ab!");
	
	AddTraderTrigger("[Yy]es", "Yeah, I thought so. Hey, it's in the same spot, same brick, a'right? Just 'put yer back to the setting sun,' like they always tell you.");
	AddTraderTrigger("[Jj]a", "Jap, dachte ich's mir doch.. Hey, es ist am selben Platz, der selbe Ziegel, 'n Ordnung? 'Wende deinen Rücken dem Sonnenuntergang zu', wie es immer heisst.");
	
	AddTraderTrigger("[Ww]aren", "Ich kriege bessere Preise bei Schwarzhand, Wie kommst du auf die Idee dass ich dir meine Beute verkaufe?");
	AddTraderTrigger("[Ww]ares", "I get better prices off Blackhand, who thinks I'll sell my loot to you?");
	
	AddTraderTrigger("[Ww]hat.+buy?", "Folks like me don't BUY, stupid...");
	AddTraderTrigger("[Ww]as.+kauf.+?", "Leute wie ich KAUFEN nicht, Dummkopf...");
	
	AddTraderTrigger("[Ww]hat.+sell.+?", "I ain't sellin' any of it to you.");
	AddTraderTrigger("[Ww]elche.+verkauf.+?", "Ich werde dir überhaupt nichts verkaufen, klar?");

    AddCycleText("#me schaut sich um und pfeift unschuldig","#me looks around and whistles innocently");
    
    TradSpeakLang={0,6};  -- Sprache die der NPC spricht
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
            if (originator:getQuestProgress(5) <= 1) then
                TellSmallTalk(message);
                if ( ((string.find(message,"[Jj]a") ~= nil)or(string.find(message,"[Yy]es") ~= nil)) and (originator:getQuestProgress(5)==0) ) then
                    originator:setQuestProgress(5,1);
                end;
            else
                thisNPC:talk(CCharacter.say,GetNLS(originator,"Du hast's bereits geholt, richtig? Husch, verschwinde.","You's done already, ain't you? Shoo, go 'way."));
            end;
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein kleiner Mann, der ein Kopftuch trägt, dass ihm tief ins Gesicht rutscht. Seine Bewegungen sind ein wenig nervös und es scheint nicht, dass ihm deine Blicke sehr angenehm sind.";
        output[1]="A small person wearing a bandana that always slides down partly hiding his face. His movements seem a little nervous and he obviously does not like you watching him.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end