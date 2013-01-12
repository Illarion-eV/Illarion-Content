--Name:        Gloarn
--Race:        Human
--Town:        ???
--Function:    Schweinehirte/Dorfdepp

require("npc.base.functions")
require("npc.base.trader_functions")
module("npc.testgnome", package.seeall)

function useNPC(user)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(Character.say, "He, nicht kitzeln!") end
    if (lang==1) then thisNPC:talk(Character.say, "Hey, don't tickle me!") end
end

function initializeNpc()
    npc.base.functions.InitTalkLists()
    
    npc.base.functions.AddTraderTrigger("[Gg]rüße","Hallo du.."); -- Fügt Triggertext mit Antwort hinzu
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");          -- Fügt zu letztem "npc.base.functions.AddTraderTrigger" zusätzlichen Triggertext hinzu
    npc.base.functions.AddAdditionalTrigger("[Gg]ruesse");

    
    
    npc.base.functions.AddCycleText("#me scheppert mit einem Ledersäckchen","#me clangs with a small leather bag"); -- Fügt Text der alle paar Min gesagt wird hinzu
    npc.base.functions.AddCycleText("Psst, Lust auf ein kleines Spielchen?","Psst, do you want to gamble a bit?");
    
    
    TradSpeakLang={0,1,4};  -- Sprache die der NPC spricht
    TradStdLang=0;          -- Sprache die der NPC normalerweise spricht
    stoneSum={};
    npcStatus={};
    npcTalksTo=0;
    lastTime=0;
    hasDrawn={0};
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

function getRandomElement(list)      -- returns a random element of a list
    return list[math.random(1,table.getn(list))];
end

function setZero()
    npcTalksTo=0;
    lastTime=0;
    hasDrawn={0};
end

function notIn(num, lst, usr)        -- returns true if num (integer) is not in lst (list)    
    --usr:inform("drin");
    retVal=true
    for index, element in pairs(lst) do
        --usr:inform("trying "..num.." == "..element)
        if num==element then 
            retVal=false 
            --usr:inform("schon drin")
        end
    end
    return retVal
end

function GetServerSeconds()     -- return "Illarion" time stamp, like unix timestamp
    local retVal=0;
    retVal=retVal+world:getTime("second");
    retVal=retVal+world:getTime("minute")*60;
    retVal=retVal+world:getTime("hour")*60*60;
    retVal=retVal+world:getTime("day")*24*60*60;
    local month=world:getTime("month");
    if (month==16) then
        retVal=retVal+month*6*24*60*60;
    else
        retVal=retVal+month*24*24*60*60;
    end
    retVal=retVal+world:getTime("year")*366*24*60*60;
    return math.floor(retVal/4)
end

function doGamble(user)         -- does all the gambling actions
    
    if stoneSum[user.id]==nil then
        stoneSum[user.id]=0;
    end
    if npcStatus[user.id]==2 then        -- spiel zugestimmt
        sayText=npc.base.functions.GetNLS(user,"Komm schon, zieh einen Stein!", "Come on, draw a stone!");
        thisNPC:talk(Character.say,sayText);
        
        repeat
            drawnStone=math.random(1,10);
        until notIn(drawnStone,hasDrawn,user) 
        table.insert(hasDrawn, drawnStone);
        
        stoneSum[user.id]=stoneSum[user.id]+drawnStone;
        user:talkLanguage(Character.say,Player.german,"#me zieht einen Stein mit der Nummer "..drawnStone);
        user:talkLanguage(Character.say,Player.english,"#me draws a stone with the number "..drawnStone);
        --user:inform("1");
        talkString=npc.base.functions.GetNLS(user,"Damit hast du jetzt "..stoneSum[user.id]..". ","So you have "..stoneSum[user.id].." now. ");
        --user:inform("2");
        if (stoneSum[user.id]>11) then
            talkString=talkString.. npc.base.functions.GetNLS(user,"Du hast mehr als 11 gezogen! Haha, du hast verloren!","You've drawn more than 11! Haha, you lost!");
            npcStatus[user.id]=0; -- 0= spielt nicht.
            stoneSum[user.id]=0;
            npcTalksTo=0;
            hasDrawn={0};
            lastTime=0;
        elseif (stoneSum[user.id]==11) then
            sayGerm={"Genau 11. Mist, du hast gewonnen. Hier, 15 Kupferstücke, verschwinde jetzt!", "Oh, 11... Damit hast du gewonnen. Hier, 15 Kupferstücke", "Du hast verdammtes Glück. Genau 11. Hier, 15 Kupfer, verzieh dich!", "*Grummel* 11. Hier, dein Gewinn."};
            sayEngl={"Exactly 11. Damn, you won. Here you are, 15 copper coins. And now: get lost!", "Oh, 11... That means that you won. Here you are, 15 copper pieces.", "Damn, you're lucky. Exactly 11. Here, your 15 copper, get lost.", "*Grumble* 11. Here is your reward." };
            talkString=npc.base.functions.GetNLS(user,getRandomElement(sayGerm),getRandomElement(sayEngl));
            user:createItem(3076,15,333,0);
            stoneSum[user.id]=0;
            npcStatus[user.id]=0;    -- 0= spielt nicht mehr
            npcTalksTo=0;
            hasDrawn={0};
            lastTime=0;
        else
            talkString=talkString.. npc.base.functions.GetNLS(user,"Willst du noch einmal ziehen?","Do you want to draw another stone?");
            npcStatus[user.id]=2;    -- wartet auf weiteres ziehen
            lastTime=GetServerSeconds();
            --user:inform("set lasttime to "..lastTime);
        end
        thisNPC:talk(Character.say, talkString);
    end
    if npcStatus[user.id]==3 then    -- npc muss ziehen
        finished=false;
        hasDrawn={0};
        stoneSumNPC=0;  
        repeat
            repeat
                drawnStone=math.random(1,10);
            until notIn(drawnStone,hasDrawn,user)  
            table.insert(hasDrawn, drawnStone);
            stoneSumNPC=stoneSumNPC+drawnStone;
            sayText=npc.base.functions.GetNLS(user,"Ich habe "..drawnStone.." gezogen und insgesamt jetzt "..stoneSumNPC,"I have drawn "..drawnStone.." and summed up that makes "..stoneSumNPC);
            thisNPC:talk(Character.say,sayText);
            if stoneSumNPC>11 then 
                finished=true;
                npcStatus[user.id]=0;
                sayText=npc.base.functions.GetNLS(user,"Oh, ich habe verloren. Hier, dein Gewinn, 10 Kupferstücke.","Oh, I lost. Here's your reward: 10 copper coins.");
                thisNPC:talk(Character.say, sayText);
                user:createItem(3076,10,333,0);
                stoneSumNPC=0;
                stoneSum[user.id]=0;
                npcTalksTo=0;
                hasDrawn={0};
            elseif stoneSumNPC>stoneSum[user.id] then
                finished=true;
                npcStatus[user.id]=0;
                sayText=npc.base.functions.GetNLS(user,"Ich habe gewonnen!","I won!");
                thisNPC:talk(Character.say, sayText);
                stoneSum[user.id]=0;
                npcTalksTo=0;
                stoneSumNPC=0;
                hasDrawn={0};
            end
        until finished==true
        
        npcStatus[user.id]=0;
    end
    --return npcState[user.id];
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
            if npcStatus[originator.id]==nil then       -- der hat noch nie mit dem NPC geredet
                npcStatus[originator.id]=0;
                --lastTime[originator.id]=GetServerSeconds();
            end
            --originator:inform("Testing "..GetServerSeconds()-lastTime);
            if lastTime~=0 and (GetServerSeconds()-lastTime>30) then        -- timeout?
                originator:inform("time now "..GetServerSeconds()-lastTime);
                --originator:inform("1");
                npcStatus[npcTalksTo]=0;
                --originator:inform("2");
                npcTalksTo=0;
                stoneSum[npcTalksTo]=0;
                --originator:inform("3");
                hasDrawn={0};
                lastTime=0;
                thisNPC:talk(Character.say, "Timeout error");
            end
            
            originator:inform("status: "..npcStatus[originator.id].." talks to: "..npcTalksTo);
            if (string.find(message,"[Ss]piel") or string.find(message,"[Pp]lay")) and npcStatus[originator.id]==0 and npcTalksTo==0 then
                npcTalksTo=originator.id;
                thisNPC:talk(Character.say, npc.base.functions.GetNLS(originator,"Willst du mit mir spielen?","Do you want to play a game with me?"));
                npcStatus[originator.id]=1;
            end        
            if string.find(message,"[Rr]egel") or string.find(message,"[Rr]ule") then
                thisNPC:talk(Character.say, npc.base.functions.GetNLS(originator,"Ach so, ja. Die Regeln. Ein Spiel kostet dich 5 Kupfer. In diesem Säckchen sind Steine mit einer Nummer von 1 bis 10. Du ziehst sooft du möchtest.", 
                    "Oh yes, the rules. A game costs you 5 copper. I have 10 stones in this bag, labeled with numbers from 1 to 10. You draw one as often as you want to."));
                thisNPC:talk(Character.say, npc.base.functions.GetNLS(originator,"Erreichst du zusammengerechnet genau 11, bekommst du 15 Kupfer, kommst du über 11, verlierst du sofort. Bleibst du darunter und ziehst nicht weiter,",
                    "If the numbers add up to 11, you get 15 copper coins, if they add up to more that, you lose. If they add up to less than 11 and you don't want to draw anymore,"));
                thisNPC:talk(Character.say, npc.base.functions.GetNLS(originator,"versuche ich dich zu überbieten, ohne über 11 zu kommen. Schaffe ich das nicht, gewinnst du 10 Kupfer.",
                    "I will try to get more than you without drawing more than 11. If I am not able to do that, you win 10."));
                if npcStatus[originator.id]==2 then
                    thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,"Na, willst du jetzt noch einen Stein ziehen oder nicht?",
                        "So, do you want to draw another stone or not?"));
                elseif npcStatus[originator.id]==0 and npcTalksTo==0 then
                    thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,"Na, Lust auf ein Spielchen?",
                        "Hey, wanna play a game?"));
                    npcStatus[originator.id]=1;
                    npcTalksTo=originator.id;
                end
            end
            -- Willst du noch einmal ziehen?
            if (string.find(message,"[Jj]a") or string.find(message,"[Yy]es")) and npcStatus[originator.id]==2 and npcTalksTo==originator.id then
                sayText=npc.base.functions.GetNLS(originator,"Gut, versuch nochmal dein Glück!","Well, try again!");
                thisNPC:talk(Character.say,sayText);
                doGamble(originator);
                lastTime=GetServerSeconds();
                --originator:inform("set lasttime to "..lastTime);
            end
            if (string.find(message,"[Nn]ein") or string.find(message,"[Nn]o")) and npcStatus[originator.id]==2 and npcTalksTo==originator.id then
                npcStatus[originator.id]=3;      -- spieler beendet, NPC zieht noch
                sayText=npc.base.functions.GetNLS(originator,"Na gut, wirf deine Steine wieder rein, jetzt bin ich dran!","Well, throw back the stones, it's my turn now!");
                thisNPC:talk(Character.say,sayText);
                doGamble(originator);
                npcTalksTo=0;
                lastTime=0;
            end
            
            -- Willst du spielen?
            if ((string.find(message,"[Jj]a") or string.find(message,"[Yy]es")) and npcStatus[originator.id]==1 and npcTalksTo==originator.id) then
                --ßoriginator:inform("er will spielen");
                
                if npc.base.trader_functions.CheckMoney(originator,0,0,5) then    -- hat user das geld?
                    npc.base.trader_functions.Pay(originator,0,0,5);
                    npcStatus[originator.id]=2;
                    lastTime=GetServerSeconds();
                    --originator:inform("set lasttime to "..lastTime);
                    doGamble(originator);
                    
                else
                    sayText=npc.base.functions.GetNLS(originator,"Du hast nicht genug Geld.","You don't have enough money.");
                    thisNPC:talk(Character.say,sayText );
                    npcTalksTo=0;
                    npcStatus[originator.id]=0;
                end
            end
            if (string.find(message,"[Nn]ein") or string.find(message,"[Nn]o")) and npcStatus[originator.id]==1 and npcTalksTo==originator.id then
                npcStatus[originator.id]=0;
                npcTalksTo=0;
                sayText=npc.base.functions.GetNLS(originator,"Na gut, dann spielen wir eben nicht.", "Well then, we're not going to play.");
                thisNPC:talk(Character.say, sayText);
            end
            
        else
            if (verwirrt==false) then
                gText="#me grinst dich blöde an";
                eText="#me grins stupidly at you";
                outText=npc.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(Character.say,outText);
                verwirrt=true;
            end
        end
    end
end--function
