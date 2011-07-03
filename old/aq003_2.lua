--Name:        Clarissa Bigglefoot
--Race:        Halfling
--Town:        Trolls Bane
--Function:    QuestNPC
--Position:    x=-87 y=-103 z=1
--Facing:      South
--Last Update: 12/14/2005
--Update by:   Markous

require("npc.base.functions_RS")
module("npc.aq003_2", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    InitTalkLists()
    StudentStats={};

    --originator:inform("Init()");
    thisNPC:increaseSkill(1,"common language",100);
    TraderFirst=1;
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    npc.base.functions_RS.AddTraderTrigger("[Gg]reetings","Hello! Can you help me?");
    npc.base.functions_RS.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions_RS.AddAdditionalText("Greetings.");
    npc.base.functions_RS.AddTraderTrigger("[Gg]r[uü][sß]+","Hallo, ich brauche deine Hilfe!");
    npc.base.functions_RS.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions_RS.AddAdditionalText("Hallo!");
    npc.base.functions_RS.AddTraderTrigger("[Ww]ho.+you","My name is Clarissa, and I have a problem. Can you help me?");
    npc.base.functions_RS.AddTraderTrigger("[Ww]er.+du","Ich bin Clarissa, und ich hab' ein Problem, bei dem du mir helfen könntest.");
    npc.base.functions_RS.AddAdditionalTrigger("[Ww]er.+ihr");
    npc.base.functions_RS.AddTraderTrigger("[Ww]hat.+problem","For ages I haven't heard anything from my friend Progor in Greenbriar. Could you go there and ask him to write me a message?");
    npc.base.functions_RS.AddAdditionalTrigger("[Ww]hat.+help");
    npc.base.functions_RS.AddAdditionalTrigger("[Hh]ow.+help");
    npc.base.functions_RS.AddTraderTrigger("[Ww]as.+[Pp]roblem","Ich hab' seit Ewigkeiten nichts mehr von meinem Freund Progor aus Greenbriar gehört. Kannst du dort hingehen und ihn daran erinnern, dass er mir eine Nachricht schreiben sollte?");
    npc.base.functions_RS.AddAdditionalTrigger("[Ww]as.+[Hh]ilfe");
    npc.base.functions_RS.AddAdditionalTrigger("[Ww]ie.+[Hh]elfen");

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
        npc.base.functions_RS.increaseLangSkill(TradSpeakLang);
        thisNPC.activeLanguage=TradStdLang;
    end
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if (LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status=NachrichtGeben(originator,message);
            if (Status==0) then npc.base.functions_RS.TellSmallTalk(message) end

            -------------------------------------------------------------------------

            if (Status==1) then
                gText="Ooh! Wundervoll! Hach, vielen Dank für deine Hilfe. Hier, nimm diese Münze als Geschenk!";
                eText="Ooh! How wonderful! Thank you very much for your help! Here, take this coin as a reward for your help.";
            elseif (Status==2) then
                gText="Hmm. Ach, was soll's. Danke nochmal für deine Hilfe, hier hast du einen Apfel als Belohnung.";
                eText="Hmm. Oh well. Anyway, thank you for your help. Take this apple for your help.";
            elseif (Status==3) then
                gText="Manchmal hasse ich diesen Kerl! Danke für deine Hilfe, und jetzt lass mich bitte alleine.";
                eText="Sometimes I hate this guy! Arg. Thank you for your help, but now please leave me alone.";
            elseif (Status==4) then
                gText="Du hast die Nachricht doch garnicht bei dir!";
                eText="You don't have the message with you yet!";
            end
            if (Status~=0) then
                thisNPC:talk(Character.say,GetNLS(originator,gText,eText));
            end
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function

function NachrichtGeben(originator,message)
    mess = math.random(3);
    local retVal=0;
    if (string.find(message,"[Ii]ch.+[Nn]achricht") ~= nil) or (string.find(message,"[Ii].+[Mm]essage") ~= nil) then
        if (originator:countItem(2745) ~= 0) then
            if (mess==1) then
                originator:createItem(3077,1,333,0);
                retVal=1;
            end
            if (mess==2) then
                originator:createItem(15,1,333,0);
                retVal=2;
            end
            if (mess==3) then
                retVal=3;
            end
            originator:eraseItem(2745,1);
        else
            retVal=4;
        end
    end
    return retVal
end
