--Name:        Eltareon
--Race:        Human
--Town:        Trolls Bane
--Function:    Libarian
--Position:    x=-92 y=-127 z=0
--Facing:      South
--Last Update: 04/16/2006
--Update by:   Nitram

dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    InitTalkLists()
    --    HistTextD={};
    --    HistTextE={};

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------


    AddTraderTrigger("[Hh]ello","Greetings. Nice to meet you.");
    AddAdditionalTrigger("[Gg]reetings");
    AddAdditionalTrigger("[Hh]i");
    AddTraderTrigger("[Hh]allo","Grüße. Freut mich euch zu treffen.");
    AddAdditionalTrigger("[Gg]r[uü][sß]+");
    AddTraderTrigger("[Ww]ho","I am "..thisNPC.name.."");
    AddTraderTrigger("[Ww]er","Ich bin "..thisNPC.name..".");
    AddTraderTrigger("[Bb]ye.","Be well");
    AddAdditionalTrigger("[Ff]arewell");
    AddAdditionalText("Farewell");
    AddTraderTrigger("[Aa]uf.+[Bb]ald","Bis Bald");
    AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    AddAdditionalText("Auf bald");
    AddAdditionalText("Auf balde");

    AddCycleText("#me blättert in einem Buch herum","#me browses through a book");
    AddCycleText("#me gähnt verhalten","#me yawns restrained");

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
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                NPCTalking(thisNPC,outText);
                verwirrt=true;
            end
        end
    end
end--function

--function AddHistTextD(Text)
--    table.insert(HistTextD,Text);
--end
--
--function AddHistTextE(Text)
--    table.insert(HistTextE,Text);
--end
--
--function TellHistText(originator,message)
--    if (string.find(message,"[Cc]hronic") ~= nil) or (string.find(message,"[Hh]istory") ~= nil) or
--    (string.find(message,"[Gg]eschicht") ~= nil) then
--        if (originator:getPlayerLanguage()==0) then
--            TextNumb=math.random(table.getn(HistTextD));
--            return 1,HistTextD[TextNumb]
--        else
--            TextNumb=math.random(table.getn(HistTextE));
--            return 1,HistTextE[TextNumb]
--        end
--    else
--        return 0
--    end
--end