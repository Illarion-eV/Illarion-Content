module("npc.base.functions", package.seeall)

function GetNLS( User, textInDe, textInEn )
    local textNLS = "";
    if User:getPlayerLanguage()==0 then
        textNLS = textInDe;
    else
        textNLS = textInEn;
    end
    return textNLS;
end

function InitTalkLists()
    TraderTrig={};
    TraderText={};
    CycleText={};
    talkCondition={};
    talkState={};
    TraderFirst=true;
end

function AddCycleText(gText,eText)
    table.insert(CycleText,{gText,eText});
end

function increaseLangSkill(LangList)
    for i=1,table.getn(LangList) do
        setLang=true;
        if (LangList[i]==0) then LangSkill="common language";
        elseif (LangList[i]==1) then LangSkill="human language";
        elseif (LangList[i]==2) then LangSkill="dwarf language";
        elseif (LangList[i]==3) then LangSkill="elf language";
        elseif (LangList[i]==4) then LangSkill="lizard language";
        elseif (LangList[i]==5) then LangSkill="orc language";
        elseif (LangList[i]==6) then LangSkill="halfling language";
        elseif (LangList[i]==7) then LangSkill="fairy language";
        elseif (LangList[i]==8) then LangSkill="gnome language";
        elseif (LangList[i]==9) then LangSkill="goblin language";
        elseif (LangList[i]==10) then LangSkill="ancient language";
        else setLang=false;
        end
        if (setLang==true) then thisNPC:increaseSkill(1,LangSkill,100) end
    end
end

function LangOK(User,LangList)
    --User:inform("LangOK Start")
    local retVal=false;
    for i=1,table.getn(LangList) do
        -- User:inform("for run "..i);
        if (User.activeLanguage==LangList[i]) then retVal=true end
    end
    --User:inform("Lang finish");
    return retVal
end

function AddTraderTrigger(Trigger,Answer,newState, stateCondition)
    --thisNPC:talk(Character.say,"Adding new trigger");
    table.insert(TraderTrig,{string.gsub(string.lower(Trigger)," ",".+")});
    table.insert(TraderText,{Answer});
    --thisNPC:talk(Character.say,"inside new trigger");
    if (newState~=nil) then     
        table.insert(talkState,newState);     -- for a little more complex NPCs with states
    else
        table.insert(talkState,nil);          -- nil means: dont change state!
    end
    --thisNPC:talk(Character.say,"done nearly new trigger");
    if (stateCondition~=nil) then
        talkCondition[table.getn(TraderTrig)]=stateCondition;
    end
    --thisNPC:talk(Character.say,"through new trigger");
end


function AddAdditionalText(Answer)
    table.insert(TraderText[table.getn(TraderText)],Answer)
end

function AddAdditionalTrigger(Trigger)
    --thisNPC:talk(Character.say,"Adding add trigger"..table.getn(TraderTrig));
    --for i, j in TraderTrig[table.getn(TraderTrig)] do
         --thisNPC:talk(Character.say,"Adding add trigger  here "..j);
    --end
    --thisNPC:talk(Character.say,"Adding "..string.gsub(string.lower(Trigger)," ",".+").." into table");
    myString=string.gsub(string.lower(Trigger)," ",".+")
    table.insert(TraderTrig[table.getn(TraderTrig)],myString)
    --thisNPC:talk(Character.say,"through add trigger");
end

function TellSmallTalk(message,userID)     -- searches for fitting answer to "message"...
    local i=1;
    local ready=false;
    local Texts=0;
    local searchfin=false;
    repeat
        if CheckForTrigger(message,i) then      -- "message" found?
            if (table.getn(TraderText[i])>1) then       -- more than one possible answers?
                TextSel=math.random(1,table.getn(TraderText[i]));
            else
                TextSel=1;
            end
            if ((userID~=nil) and ((talkCondition[i]==NPCStatus[userID] or talkCondition[i]==nil))) then  -- if userID was passed and the condition==actual state of npc, speak
                NPCTalking(thisNPC,TraderText[i][TextSel]); -- speak it out, you fool!
                if talkState[i]~=nil then               -- dont change state if condition==nil
                    NPCStatus[userID]=talkState[i];
                end
            elseif userID==nil then
                NPCTalking(thisNPC,TraderText[i][TextSel]); -- speak it out, you fool!
                if talkState[i]~=nil then               -- dont change state if condition==nil
                    NPCStatus[userID]=talkState[i];
                end
            end         -- if userID~=nil
            ready=true;
        end
        i=i+1;
    until ((i==table.getn(TraderTrig)+1) or ready)
end

function CheckForTrigger(message,ListIndex)
    local k=0;
    local done=false;
    local retVal=false;
    --thisNPC:talk(Character.say, "checking for triggers");
    repeat
        k=k+1;
        if (TraderTrig[ListIndex][k]~=nil) then
            if (string.find(string.lower(message),TraderTrig[ListIndex][k])~=nil) then
                retVal=true;
                done=true;
            end
        else
            done=true;
        end
    until done
    return retVal;
end

function NPCTalking(NPC,Text)
    local done=false;
    local outputted=false;
    repeat
        Len=string.len(Text)
        if (Len>240) then
            i=241;
            outputted=false;
            repeat
                i=i-1;
                Char=string.sub(Text,i,i);
                if (Char==" ") then
                    outText=string.sub(Text,1,i-1);
                    Text=string.sub(Text,i+1,Len);
                    NPC:talk(Character.say,outText);
                    outputted=true;
                end
            until i==0 or outputted;
            if (Len==string.len(Text)) then
                outText=string.sub(Text,1,240);
                Text=string.sub(Text,241,Len);
                NPC:talk(Character.say,outText);
            end
        else
            done=true;
            NPC:talk(Character.say,Text);
        end
    until done
end

function SpeakerCycle()
    if (speakCount==nil) then
        speakCount=1;
        verwirrt=false;
    else
        speakCount=speakCount+1;
        if (math.floor(speakCount/600)==(speakCount/600)) then verwirrt=false end
        --printerr("In Circle "..cycCount.. "With "..nextDelivery);
        if (table.getn(CycleText)>0) then
            if (speakTime==nil) then speakTime=2 end
            if (speakCount>=speakTime) then
                speakCount=1;
                TextNr=math.random(1,table.getn(CycleText))
                thisNPC:talkLanguage(Character.say, Player.german,CycleText[TextNr][1]);
                thisNPC:talkLanguage(Character.say, Player.english,CycleText[TextNr][2]);
                speakTime=math.random(900,3000);
            end
        end
    end
end

-- Fügt einer Zahl das Englische Anhängsel an
function EnglDigit(Zahl)
    local retVal="th";
    local calcZahl=Zahl;
    if (calcZahl>19) then
        calcZahl=calcZahl-(math.floor(calcZahl/10)*10);
    end
    if (calcZahl==1) then retVal="st" end
    if (calcZahl==2) then retVal="nd" end
    if (calcZahl==3) then retVal="rd" end
    return Zahl..retVal
end

-- Ausgabe des Aktuellen Datums
-- Return 1: Status Value (Int)
-- Return 2: Zusätzliche Variablen (List)

-- Status:
--  0 - keine Aktion
--  18 - Datum ausgeben

-- Zusätzliche Variablen
--  Bei Status 18:
--   Liste {Tag (Int),Monatsnamen (Str), Jahr (Int)}
--  Bei Status 0:
--   Liste {nil}
function TellDate(originator,message,monthnames)
    local retStatus=0;
    local retValues={};
    if (string.find(message,"[Ww]hat.+day.+today.+") ~= nil or string.find(message,"[Ww]hat.+[Tt]oday.+[Dd]ay.+")~=nil or
    string.find(message,"[Ww]hat.+[Dd]ate.+")~=nil or string.find(message,"[Ww]elch.+[Tt]ag.+[Hh]eute.+")~=nil or
    string.find(message,"[Ww]as.+[Tt]ag.+[Hh]eute.+")~=nil or string.find(message,"[Ww]as.+[Dd]atum.+")~=nil or
    string.find(message,"[Ww]elch.+[Dd]atum.+")~=nil) then
        retStatus=18;
        local day=world:getTime("day");
        local month=world:getTime("month");
        local year=world:getTime("year");
        retValues={day,monthnames[month],year};
    end
    return retStatus,retValues
end

-- Funktion zur Rückgabe eines eingegebenen Wertes anhand des Genus des Items
-- Return 1: Wort (Str)
function GenusSel(ItemID,mWord,fWord,nWord)
    Gen=GenusData(ItemID)
    if (Gen==0) then
        return mWord
    elseif (Gen==2) then
        return nWord
    else
        return fWord
    end
end

function BasicNPCChecks(originator,NPCRange)
    local retVal=false;
    if (thisNPC:isInRange(originator,NPCRange)) then
        if (originator.id ~= thisNPC.id) then
            originator:introduce(thisNPC);
            retVal=true;
        end
    end
    return retVal
end
