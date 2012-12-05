--Name:        Teophus
--Race:        Human
--Town:        Somewhere
--Function:    Hermit
--Position:    x=-8 y=6 z=0
--Facing:      West
--Last Update: 12/19/2005
--Update by:   Markous

require("npc.base.functions_RS")
module("npc.aq004_1", package.seeall)

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(Character.say, "Don't you touch me!") end
end

function initializeNpc()
    InitTalkLists()

    --originator:inform("Init()");
    thisNPC:increaseSkill(1,"common language",100);
    TraderFirst=1;
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------
    npc.base.functions_RS.AddTraderTrigger("[Gg]reetings","Greetings! Finally, someone came here to help me!");
    npc.base.functions_RS.AddTraderTrigger("[Gg]r[uü][sß]+","Hallo! Endlich jemand, der hierherkommt, um mir zu helfen!");
    npc.base.functions_RS.AddTraderTrigger("[Hh]ello","Greetings! Finally, someone came here to help me!");
    npc.base.functions_RS.AddTraderTrigger("[Hh]allo","Hallo! Endlich jemand, der hierherkommt, um mir zu helfen!");
    npc.base.functions_RS.AddTraderTrigger("[Ww]ho.+you","My Name? That doesn't matter. I'm a hermit, and I need your help!");
    npc.base.functions_RS.AddTraderTrigger("[Ww]er.+du","Mein Name? Der ist egal. Ich lebe hier als Eremit, und ich brauche deine Hilfe!");
    npc.base.functions_RS.AddTraderTrigger("[Ww]er.+ihr","Mein Name? Der ist egal. Ich lebe hier als Eremit, und ich brauche deine Hilfe!");
    npc.base.functions_RS.AddTraderTrigger("[Hh]ermit","Yes, I'm a hermit. I came here long ago, but I'm sick of apples and cherries all day. You need to help me!");
    npc.base.functions_RS.AddTraderTrigger("[Ee]remit","Ja, ich bin ein Eremit. Ich kam vor langer Zeit hierher, aber jetzt bin ich es leid, immer nur Äpfel und Kirschen zu essen. Hilf mir!");
    npc.base.functions_RS.AddTraderTrigger("[Pp]roblem","Well, all I can eat here are apples and cherries! I'm sick of that! Please bring me some aid! I need conifer wood, raw meat and a nice trout! If you're nice, and help, I'll tell you a secret.");
    npc.base.functions_RS.AddTraderTrigger("[Hh]elp","Well, all I can eat here are apples and cherries! I'm sick of that! Please bring me some aid! I need conifer wood, raw meat and a nice trout! If you're nice, and help, I'll tell you a secret.");
    npc.base.functions_RS.AddTraderTrigger("[Pp]roblem","Nun, alles, was es hier zu essen gibt, sind diese verdammten Äpfel und Kirschen. Das macht mich krank! Bitte bring mit ein paar Hilfsmittel! Ich brauche Nadelholz, rohes Fleisch und eine leckere Forelle. Wenn du mir hilfst, erzähl' ich dir ein Geheimnis.");
    npc.base.functions_RS.AddTraderTrigger("[Hh]ilfe","Nun, alles, was es hier zu essen gibt, sind diese verdammten Äpfel und Kirschen. Das macht mich krank! Bitte bring mit ein paar Hilfsmittel! Ich brauche Nadelholz, rohes Fleisch und eine leckere Forelle. Wenn du mir hilfst, erzähl' ich dir ein Geheimnis.");
    npc.base.functions_RS.AddTraderTrigger("[Hh]elfen","Nun, alles, was es hier zu essen gibt, sind diese verdammten Äpfel und Kirschen. Das macht mich krank! Bitte bring mit ein paar Hilfsmittel! Ich brauche Nadelholz, rohes Fleisch und eine leckere Forelle. Wenn du mir hilfst, erzähl' ich dir ein Geheimnis.");
    npc.base.functions_RS.AddTraderTrigger("[Aa]pple+","Bah! I hate apples!");
    npc.base.functions_RS.AddTraderTrigger("[Cc]herrie+","Bah! I hate cherries!");
    npc.base.functions_RS.AddTraderTrigger("[ÄäAa]pfel","Igitt! Ich hasse Äpfel!");
    npc.base.functions_RS.AddTraderTrigger("[Kk]irsche+","Igitt! Ich hasse Kirschen!");
    npc.base.functions_RS.AddTraderTrigger("[Tt]rout","A trout would help me for sure.");
    npc.base.functions_RS.AddTraderTrigger("[Mm]eat","Mmm. Some nice meat would be fine.");
    npc.base.functions_RS.AddTraderTrigger("[Ww]ood","I need some wood to make a nice fire. So bring me some!");
    npc.base.functions_RS.AddTraderTrigger("[Ff]orelle","Eine gute Forelle würde mich sicher satt machen.");
    npc.base.functions_RS.AddTraderTrigger("[Ss]chweinefleisch","Rohes Schweinefleisch ist genau das, was ich jetzt brauche!");
    npc.base.functions_RS.AddTraderTrigger("[Ff]leisch","Rohes Schweinefleisch ist genau das, was ich jetzt brauche!");
    npc.base.functions_RS.AddTraderTrigger("[Nn]adelholz","Ich brauche Holz, damit mir warm wird. Also bring mir welches!");
    npc.base.functions_RS.AddTraderTrigger("[Hh]olz","Ich brauche Holz, damit mir warm wird. Also bring mir welches!");
      
    TradSpeakLang={0,1};
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
    if (cycCount==nil) then
        cycCount=1;
        nextDelivery=math.random(10000,40000);
        thisNPC:increaseSkill(1,"common language",100);
        --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery);
    else
        cycCount=cycCount+1;
        --printerr("In Circle "..cycCount.. "With "..nextDelivery);
        if (math.floor(cycCount/600)==(cycCount/600)) then verwirrt=false end
        if (cycCount+1>nextDelivery+1) then
            --thisNPC:talk(Character.say, "Next");
            nextDelivery=math.random(10000,40000);
            cycCount=1;
            --thisNPC:talk(Character.say, "Next delivery in "..nextDelivery.." CycCount: "..cycCount);
        end
    end
end

function receiveText(texttype, message, originator)
    local lang=originator:getPlayerLanguage();
    --originator:introduce(thisNPC);
    if (TraderFirst == nil) then
        --------------------------------------------- *** DON'T EDIT BELOW HERE ***--------------------------------------
        initializeNpc();
        TraderFirst=1;
        --TalkToId=originator.id;
        npc.base.functions_RS.increaseLangSkill(thisNPC,TradSpeakLang)
    end
    local gText="";
    local eText="";
    local outText="";
    if (thisNPC:isInRange(originator,2)) then
        if (originator.id ~= thisNPC.id) then
            if (LangOK(originator,TradSpeakLang)==true) then
                thisNPC.activeLanguage=originator.activeLanguage;
                Status=Abgeben(originator,message);
                if (Status==0) then npc.base.functions_RS.TellSmallTalk(message) end

                -------------------------------------------------------------------------

                if (Status==1) then
                    gText="#me nimmt dir die Hilfsmittel ab und räuspert sich.";
                    eText="#me takes the things and clears his throat.";
                    originator:introduce(thisNPC);
                    thisNPC:talk(Character.say,GetNLS(originator,gText,eText));
                    gText="Danke für deine Hilfe, ich bin Teophus. Mein Leben lang suche ich nach dieser verdammten Schatzkarte, die mir einst verloren ging. Damals war ich auf der Suche nach dem alten Schatz, man sagte, er wäre auf dieser kleinen Insel versteckt.";
                    eText="Thank you for your help, I am Teophus. All my life I was searching for this treasuremap that I once lost here. That days, I was searching for an old treasure that was said to be on this small island.";
                    thisNPC:talk(Character.say,GetNLS(originator,gText,eText));
                    gText="Nun, ich war dort, und die Karte wurde mir aus der Hand gerissen von solchen verdammten Gnomen, die mir eigentlich helfen sollten, aber auch ihren Teil wollten.";
                    eText="Well, I was here but the map was stolen by those stupid gnomes. They wanted to help me in the first place, but then they wanted everything just for themself.";
                    thisNPC:talk(Character.say,GetNLS(originator,gText,eText));
                    gText="Bei diesem Missgeschick wurde sie zerrissen, und ich hielt nurnoch einen kleinen Teil in der Hand. Im nächsten Moment waren diese Bastarde auch schon verschwunden. Du musst mir helfen!";
                    eText="The map was ripped into pieces, and all I got left was one of them. Those bastards disappeared. You must help me!";
                    thisNPC:talk(Character.say,GetNLS(originator,gText,eText));
                    gText="Hier hast du den kleinen Teil, den ich habe. Finde die Gnomenhöhle, finde die Schatzkarte. Viel Glück!";
                    eText="Here you have the last piece, that I have. Find the gnomish cave, find the treasuremap. Good Luck!";
                elseif (Status==2) then
                    gText="Du hast noch nicht alle Hilfsmittel beisammen! Ich will rohes Schweinefleisch, Nadelholz und eine Forelle.";
                    eText="You don't have all the aid with you! I want raw pork, conifer wood and a trout.";
                elseif (Status==3) then
                    gText="Du hast meine Karte doch schon bekommen! Ich kann nichts mehr für dich tun.";
                    eText="You already have my map. There's nothing more I can do for you.";
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
    end-- range
end--function

function Abgeben(originator,message)
    local retVal=0;
    if (string.find(message,"[Hh]ilfsmittel") ~= nil) or (string.find(message,"[Aa]id") ~= nil) then
    if (originator:countItem(3109) == 0) then
     if (originator:countItem(307) ~= 0) and (originator:countItem(3) ~= 0) and (originator:countItem(73) ~= 0) then
      originator:eraseItem(307,1);
      originator:eraseItem(3,1);
      originator:eraseItem(73,1);
      originator:createItem(3109,1,333,1); -- map
      retVal=1;
     else
      retVal=2;
     end
   else
      retVal=3;
   end
   else
   end
   return retVal
end
