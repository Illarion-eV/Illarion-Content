--Name:        Eltareon
--Race:        Human
--Town:        Trolls Bane
--Function:    Libarian
--Position:    x=-92 y=-127 z=0
--Facing:      South
--Last Update: 04/16/2006
--Update by:   Nitram

require("npc.base.functions")
module("npc.eltareon", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    --    HistTextD={};
    --    HistTextE={};

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------


    npc.base.functions.AddTraderTrigger("[Hh]ello","Greetings. Nice to meet you.");
    npc.base.functions.AddAdditionalTrigger("[Gg]reetings");
    npc.base.functions.AddAdditionalTrigger("[Hh]i");
    npc.base.functions.AddTraderTrigger("[Hh]allo","Grüße. Freut mich euch zu treffen.");
    npc.base.functions.AddAdditionalTrigger("[Gg]r[uü][sß]+");
    npc.base.functions.AddTraderTrigger("[Ww]ho","I am "..thisNPC.name.."");
    npc.base.functions.AddTraderTrigger("[Ww]er","Ich bin "..thisNPC.name..".");
    npc.base.functions.AddTraderTrigger("[Bb]ye.","Be well");
    npc.base.functions.AddAdditionalTrigger("[Ff]arewell");
    npc.base.functions.AddAdditionalText("Farewell");
    npc.base.functions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Bis Bald");
    npc.base.functions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npc.base.functions.AddAdditionalText("Auf bald");
    npc.base.functions.AddAdditionalText("Auf balde");

    npc.base.functions.AddCycleText("#me blättert in einem Buch herum","#me browses through a book");
    npc.base.functions.AddCycleText("#me gähnt verhalten","#me yawns restrained");

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
        npc.base.functions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npc.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;

            npc.base.functions.TellSmallTalk(message);
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                npc.base.functions.NPCTalking(thisNPC,outText);
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
