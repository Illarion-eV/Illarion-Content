--Name:        Tihgorac
--Race:        Orc
--Town:        Somewhere near Varshikar
--Function:    Fighting Teacher
--Position:    x=235 y=-324 z=0
--Facing:      North
--Last Update: 04/26/2006
--Update by:   Nitram

require("npc.base.functions")
module("npc.tihgorac", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fast mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    StudentStats={};

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    npc.base.functions.AddTraderTrigger("[Gg]reetings","Greebs, how be yoo? I is " ..thisNPC.name.. ", the warrior.");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalTrigger("[Oo]rc");
    npc.base.functions.AddAdditionalText("Whub? Wut yoo wunt? Mes "..thisNPC.name..", strung warrior. Yubba!");
    npc.base.functions.AddTraderTrigger("[Mm]ummies","Yuh. Yoo comes back wid innards of mummies tuh prove yerself and meh will teach yoo some tricks yoo can use tuh knock down big critters!");
    npc.base.functions.AddAdditionalTrigger("[Mm]ummy");
    npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Gruß, wies dir geht? Ich "..thisNPC.name..", großer Krieger.");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalTrigger("[Oo]rk");
    npc.base.functions.AddAdditionalText("Wus? Wus willst? Ich "..thisNPC.name..", starker Krieger! Har");
    npc.base.functions.AddTraderTrigger("[Mm]umie","Ja. Komm her mit Innereinen um dich zu beweisen, dann "..thisNPC.name.." zeigen dir ein paar Tricks um große Viecher tot zu haun!");


    TradSpeakLang={0,5};
    TradStdLang = 0;
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
            Status=StartLearning(originator,message);
            if (Status==0) then Status=AcceptLearning(originator,message) end
            if (Status==0) then Status=EingeweideGeben(originator,message) end
            if (Status==0) then Status=AxtGeben(originator,message) end
            if (Status==0) then npc.base.functions.TellSmallTalk(message) end

            -------------------------------------------------------------------------

            if (Status==1) then
                gText="Ja. "..thisNPC.name.." stark Krieger. Du willst Krieger werden?";
                eText="Yes. "..thisNPC.name.." strong warrior. You want become warrior?";
            elseif (Status==2) then
                gText=thisNPC.name.." weis nicht ob du stark genug. Bringt nix, Krieger sein zu wollen und die verfluchten Tempel Mummien nicht morschen zu können.";
                eText=thisNPC.name.." nub knows if yoo is strong enuf, yets. No use even tryins to beh warrior, if yoo can'ts beat cursed temple mummies even.";
            elseif (Status==3) then
                gText="Har. Hast "..thisNPC.name.." überzeugt, aber ich hab Probleme. "..thisNPC.name.." war in Sümpfen, große Viecher tot kloppen, als ich meine Axt verlorn hab. "..thisNPC.name.." konnt sie nicht wieder finden - Ich musste die Mistvicher mit meinen Händen verhaun. Find meine Axt und "..thisNPC.name.." bring dir was bei!";
                eText="Yubba. Yoo has proven yerself, but "..thisNPC.name.." has troubles. Meh was in de swamps fightin' big critters when "..thisNPC.name.." dropped meh axe. "..thisNPC.name.." nub could finds it - had tuh fight big critters wid fists! Hur hur! Find meh axe and "..thisNPC.name.." will teach yoos.";
            elseif (Status==4) then
                gText="Ugh! Hast Innereinen? Oder bist du schwächlich?";
                eText="Ugh! You have innards, yet? Or is you weakling?";
            elseif (Status==5) then
                gText="Hast "..thisNPC.name.." schon Innerein gegeben.";
                eText="Yoo allready give inners to "..thisNPC.name..".";
            elseif (Status==6) then
                gText="Innerein? Haben die verfluchten Tempel Mumien.";
                eText="Inners?! The cursed temple mummies have them.";
            elseif (Status==7) then
                gText="#me zeigt ein Manöver mit der Axt";
                eText="#me displays a maneuver with his axe";
                thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,gText,eText));
                gText="Jetzt du!";
                eText="Now you try!";
            elseif (Status==8) then
                gText="#me zeigt ein einfaches Manöver";
                eText="#me displays a simple maneuver";
                thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,gText,eText));
                gText="Jetzt du!";
                eText="Now you try!";
            elseif (Status==9) then
                gText=thisNPC.name.." brauch immernoch Axt! Kann nicht trainieren ohne Axt!";
                eText=thisNPC.name.." still need axe. Me can not train with no axe!";
            elseif (Status==10) then
                gText="Axt gute Waffe. "..thisNPC.name.." gute Axt habe. Har.";
                eText="Axe good weapon. "..thisNPC.name.." good axe has. Har.";
            elseif (Status==11) then
                gText="Hab dir schon was begebracht. Mehr zeig ich nix.";
                eText="I show you already. More i don't show you.";
            end

            if (Status~=0) then
                thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,gText,eText));
                if (Status==7) then
                    if (lang==0) then
                        originator:inform("Du denkst du das vielleicht etwas gelernt hast, dadurch das du ihm zugesehen hast.");
                    else
                        originator:inform("You think you may have learned something from watching him.");
                    end
                elseif (Status==8) then
                    if (lang==0) then
                        originator:inform("Du kennst dieses Manöver schon lange.");
                    else
                        originator:inform("You knew of these kinds of moves long ago.");
                    end
                end
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

function StartLearning(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if not StudentStats[originator.id][4] then
        if (string.find(message,"[Ww]arrior") ~= nil) or (string.find(message,"[Ff]ighter") ~= nil) or
        (string.find(message,"[Ss]oldier") ~= nil) or (string.find(message,"[Kk]rieger") ~= nil) or
        (string.find(message,"[Ss]oldat") ~= nil) or (string.find(message,"[Kk]ämpfer") ~= nil) then
            retVal=1;
            StudentStats[originator.id][1]=true;
        end
    else
        retVal=11;
    end
    return retVal
end

function AcceptLearning(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if (string.find(message,"[Yy]es") ~= nil) or (string.find(message,"[Jj]a") ~= nil) then
        if StudentStats[originator.id][1] then
            if (StudentStats[originator.id][2]~=true) then
                retVal=2;
                StudentStats[originator.id][2]=true;
            end
        end
    end
    return retVal
end

function EingeweideGeben(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if (string.find(message,"[Ii]nners") ~= nil) or (string.find(message,"[Ee]ntrails") ~= nil) or
    (string.find(message,"[Ee]ingeweid") ~= nil) then
        if StudentStats[originator.id][1] and StudentStats[originator.id][2] then
            if (StudentStats[originator.id][3]~=true) then
                if (originator:countItem(63)>0) then
                    retVal=3;
                    StudentStats[originator.id][3]=true;
                    originator:eraseItem(63,1);
                else
                    retVal=4;
                end
            else
                retVal=5;
            end
        else
            retVal=6;
        end
    end
    return retVal
end

function AxtGeben(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if (string.find(message,"[Aa]x[et]") ~= nil) then
        if StudentStats[originator.id][1] and StudentStats[originator.id][2] and StudentStats[originator.id][3] then
            AxeID=CheckAxt(originator)
            if (AxeID~=0) then
                retVal=Teach(originator)
                originator:eraseItem(AxeID,1);
                StudentStats[originator.id][4]=true;
            else
                retVal=9;
            end
        else
            retVal=10;
        end
    end
    return retVal
end

function CheckAxt(User)
    if (ListofAxe==nil) then
        ListofAxe={74, 88, 188, 205, 383, 2625, 2626, 2627, 2628, 2629, 2630, 2631, 2634, 2635, 2636, 2637, 2639, 2640, 2641, 2642, 2643, 2644, 2645, 2946};
    end
    local found=0;
    for i=1,table.getn(ListofAxe) do
        if (User:countItem(ListofAxe[i])>0) then
            found=ListofAxe[i]
        end
    end
    return found
end

function Teach(User)
    local retVal=0;
    Skill=User:getSkill(Character.concussionWeapons);
    if (Skill<=25) then
        User:increaseSkill(Character.concussionWeapons,5);
        retVal=7;
    else
        retVal=8;
    end
    return retVal
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein Hüne von einem Ork, der bedrohlich seine Hauer fletscht. Sein Blick wirkt dennoch etwas unsicher, wenn er an seinen Gürtel greift, wo allerdings nur eine leere Öse zu sehen ist. Etwas scheint zu fehlen.";
        output[1]="A giant of an orc who keeps baring his tusks. His gaze is a little unsecure though when he reaches for his belt where you see nothing but an empty scabbard. Something seems to be missing.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
