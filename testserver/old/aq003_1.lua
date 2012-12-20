--Name:        Progor Flowerpride
--Race:        Halfling
--Town:        Greenbriar
--Function:    QuestNPC
--Position:    x=-404 y=82 z=0
--Facing:      West
--Last Update: 12/14/2005
--Update by:   Markous

require("npc.base.functions")
module("npc.aq003_1", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    StudentStats={};

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    npc.base.functions.AddTraderTrigger("[Gg]reetings","Greetings.");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddTraderTrigger("[Gg]r[uü][sß]+","Hallo!");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddTraderTrigger("[Ww]ho.+you","I am Progor! I am living here, and enjoy life.");
    npc.base.functions.AddTraderTrigger("[Ww]er.+du","Ich bin Progor, ich leb' hier und geniesse mein Leben.");
    npc.base.functions.AddAdditionalTrigger("[Ww]er.+ihr");

    TradSpeakLang={0,6};
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
        npc.base.functions.increaseLangSkill(TradSpeakLang);
        thisNPC.activeLanguage=TradStdLang;
    end
    npc.base.functions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.functions.BasicNPCChecks(originator,2) then
        if (npc.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status=NachrichtGeben(originator,message);
            if (Status==0) then npc.base.functions.TellSmallTalk(message) end

            -------------------------------------------------------------------------

            if (Status==1) then
                gText="#me nimmt ein Stück Papier, schreibt die Nachricht für Clarissa drauf und gibt sie dir.";
                eText="#me takes a piece of parchment, writes a message for Clarissa and gives it to you.";
            elseif (Status==2) then
                gText="Du hast doch schon meine Nachricht!";
                eText="You already got my message!";
            end
            if (Status~=0) then
                thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,gText,eText));
            end
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function

function NachrichtGeben(originator,message)
    local retVal=0;
    if (string.find(message,"[Nn]achricht") ~= nil) or (string.find(message,"[Mm]essage") ~= nil) then
        if (originator:countItem(2745) == 0) then
            originator:createItem(2745,1,333,1); -- parchment, data: 1
            retVal=1;
        else
            retVal=2; -- no parchment
        end
    else
        --retVal=0;
    end
    return retVal
end
