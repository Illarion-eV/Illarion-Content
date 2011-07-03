module("npc.base.functions_RS", package.seeall)

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
end

function increaseLangSkill(NPC,LangList)
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
        if (setLang==true) then NPC:increaseSkill(1,LangSkill,100) end
    end
end

function LangOK(User,LangList)
    --User:inform("LangOK Start")
    local retVal=false;
    for i=1,table.getn(LangList) do
        --User:inform("for run "..i);
        if (User.activeLanguage==LangList[i]) then retVal=true end
    end
    --User:inform("Lang finish");
    return retVal
end

function AddTraderTrigger(Trigger,Answer)
    table.insert(TraderTrig,Trigger);
    table.insert(TraderText,Answer);
end

function AddAdditionalText(Answer)
    local ListCnt=table.getn(TraderText)
    local i=0;
    local done=false;
    repeat
        i=i+1000;
        if (TraderText[ListCnt+i]==nil) then
            TraderText[ListCnt+i]=Answer;
            done=true;
        end
    until done
end

function TellSmallTalk(message)
    local i=1;
    local ready=false;
    local Texts=0;
    local searchfin=false;
    repeat
        if (string.find(message,TraderTrig[i]) ~= nil) then
            repeat
                Addi=Texts*1000;
                if (TraderText[i+Addi]~=nil) then
                    Texts=Texts+1;
                else
                    searchfin=true
                end
            until (searchfin==true);
            TextSel=math.random(0,Texts);
            if (TextSel>0) then TextSel=TextSel-1 end
            NPCTalking(thisNPC,TraderText[i+(TextSel*1000)]);
            ready=true;
        end
        i=i+1;
    until ((i==table.getn(TraderTrig)+1) or ready)
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

