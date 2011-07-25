--Name:        Yastahl
--Race:        Elf
--Town:        Far in the North
--Function:    Elvish Teacher
--Position:    x=-281 y=-436 z=0
--Facing:      South
--Last Update: 04/26/2006
--Update by:   Nitram

require("npc.base.functions")
module("npc.yastahl", package.seeall)

function useNPC(user,counter,param)
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
    npc.base.functions.AddTraderTrigger("[Gg]reetings","Greetings. I fear I am not-so good at speaking the Common Tongue. Please forgive me. Can you speak Elvish?");
    npc.base.functions.AddAdditionalTrigger("[Hh]ello");
    npc.base.functions.AddAdditionalText("Greetings. I fear I am not-so good at speaking the Common Tongue. Please forgive me. Can you speak Elvish?");
    npc.base.functions.AddTraderTrigger("[Gg]r[uü][sß]+","Zum Gruße. Ich muss zu meinem Bedauern sagen, das ich der Allgemeinen Sprache nicht zur Gänze mächtig bin. Könnt ihr die Sprache der Elfen sprechen?");
    npc.base.functions.AddAdditionalTrigger("[Hh]allo");
    npc.base.functions.AddAdditionalText("Zum Gruße. Ich muss zu meinem Bedauern sagen, das ich der Allgemeinen Sprache nicht zur Gänze mächtig bin. Könnt ihr die Sprache der Elfen sprechen?");
    npc.base.functions.AddTraderTrigger("[Ss]ir [Ee]lf","Greetings. I fear I am not-so good at speaking the Common Tongue. Please forgive me. Can you speak Elvish?");
    npc.base.functions.AddTraderTrigger("[Hh]err [Ee]lf","Zum Gruße. Ich muss zu meinem Bedauern sagen, das ich der Allgemeinen Sprache nicht zur Gänze mächtig bin. Könnt ihr die Sprache der Elfen sprechen?");
    npc.base.functions.AddTraderTrigger("[Cc]ommon","'Tis a dreadful language, I fear. It's horribley blunt and unpoetic. It lacks the fluidity and poetic qualities of my people's language.");
    npc.base.functions.AddTraderTrigger("[Aa]llgemein","Das ist eine grässliche Sprache, fürchte ich. Sie ist furchtbar plump und unpoetisch. Ihr fehlt der Fluss und die Poetischen Qualitäten der Sprache meines Volkes.");
    npc.base.functions.AddTraderTrigger("[Tt]each.*[Ee]lven","Not so fast. It is not that I am greedy, but it is customary among Elves that a student provide a tribute to his/her teacher.");
    npc.base.functions.AddTraderTrigger("[Ee]lvish","Are you interested in learning the Elven Tongue? I assure you that you would find new pathways of thought with the tools that the Elven language provides for the expression of those that understand it.");
    npc.base.functions.AddAdditionalTrigger("[Ee]lven [Ll]anguage");
    npc.base.functions.AddAdditionalTrigger("[Ee]lven [Tt]ongue");
    npc.base.functions.AddTraderTrigger("[Ee]lfisch","Seit ihr daran interessiert die Hohe Sprache der Elfen zu erlernen? Es besteht kein Zweifel, das ihr neue Pfade des Denkens dank der Sprache der Elfen begehen könntet.");
    npc.base.functions.AddAdditionalTrigger("[Ee]lfen [Ss]prache");
    npc.base.functions.AddAdditionalTrigger("[Ss]prache.+[Ee]lfen");
    npc.base.functions.AddTraderTrigger("[Tt]ribute","A Tribute...Now what shall be my tribute? There is no greater tribute than that which is found in nature. Perhaps you could provide me with a Night Angel's Blossom and a Firnis Blossom for starters. Come back with them an i will teach you the language.");
    npc.base.functions.AddTraderTrigger("[Gg]abe","Eine Gabe..was soll es sein? Es gibt keine größere Gabe als die die in der Natur gefunden werden kann. Vielleicht könntest du mir eine Nacht Engels Blüte und eine Firnis Blüte bringen. Bring mir diese ich werde dir die Sprache beibringen.");

    TradSpeakLang={0,3};
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
            Status=StartLearning(originator,message);
            if (Status==0) then Status=FirnisGeben(originator,message) end
            if (Status==0) then Status=NachtGeben(originator,message) end
            if (Status==0) then Status=SibanacGeben(originator,message) end
            if (Status==0) then npc.base.functions.TellSmallTalk(message) end

            -------------------------------------------------------------------------

            if (Status==1) then
                gText="Nicht so schnell. Es ist nicht so das ich gierig bin, aber es ist normal für Elfen, das die Studenten eine kleine Gabe an ihren Lehrer übergeben";
                eText="Not so fast. It is not that I am greedy, but it is customary among Elves that a student provide a tribute to his/her teacher.";
            elseif (Status==2) then
                gText="Ah. Ihr habt eine Firnis Blüte. Ich danke euch.";
                eText="Oh. You have a firnis blossom. Thank you.";
            elseif (Status==3) then
                gText="Firnis...ja. Dies schöne Gebirgsblume möchte ich, wenn ich euch die Sprache der Elfen beibringen soll.";
                eText="Firnis...yes. This nice Mountainflower i want to have, if i shall teach you the elven language.";
            elseif (Status==4) then
                gText="Ihr habt mir doch bereits eine Firnisblüte gegeben.";
                eText="You give already a firnis blossom to me.";
            elseif (Status==5) then
                gText="Firnis ist eine Pflanze die im Gebirge wächst.";
                eText="Firnis is a plant, growing in the mountains.";
            elseif (Status==6) then
                gText="Ah. Ihr habt eine Nacht Engels Blüte. Vielen Dank";
                eText="Oh. You have a night angels blossom. Thank you";
            elseif (Status==7) then
                gText="Die wunderschöne Nacht Engels Blüte, hätte ich gern von euch. Ich komme so selten in den Wald.";
                eText="The wonderful night angels blossom, i want to have from you. I'm to seldom the forest...";
            elseif (Status==8) then
                gText="Ihr habt mir doch bereits eine Nacht Engels Blüte gegeben";
                eText="You give already a night angels blossom to me.";
            elseif (Status==9) then
                gText="Die Nacht Engels Blüte kann in den Wäldern gefunden werden";
                eText="The night angels blossom can be founded in the forests";
            elseif (Status==10 or Status==11) then
                gText="#me stopft seine Pfeife mit den Sibanacblättern und zündet sie an. Bald beginnt er dünne Rauchringe wegzublasen";
                eText="#me puts the Sibanac leaves in a pipe and lights it. He soon begins to puff away at the pipe"
                thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,gText,eText));
                gText="Ahh...so. Wo waren wir? Ahja. Ich war dabei euch die Grundlagen der schönen Sprache der Elfen beizubringen.";
                eText="Ah. Now where were we? Ah, yes. I was to teach you the basics of the Elven Tongue.";
            elseif (Status==12) then
                gText="Ein Blatt gutes Sibanac...das wäre was feines. Ein warer Genuss es zu rauchen. Nur will ich dafür nicht in die Wüste gehen.";
                eText="A leave of good sibanac...this would be fine. A real pleasure to smoke it. But i don't want to go into the desert to get one leave.";
            elseif (Status==13) then
                gText="Sibanac. Ja. Es kommt nur in der Wüste vor. Schwer zu finden.";
                eText="Sibanac. Yes. It only grows in the desert. Hard to get such a leave.";
            elseif (Status==14) then
                gText="Ah. Sehr gut. Nun da ihr mir alles gebracht habt, verlange ich nur noch ein Sibanac Blatt und wir können mit dem Unterricht beginnen.";
                eText="Ah. Very good. Now you give every thing to me, i just want to have one thing more. A Sibanac leaf. Then we can start the lesson.";
            elseif (Status==15) then
                gText="Ihr als Elf müsst wohl kaum etwas über die Sprache unseres Volkes lernen";
                eText="I sure, you as a elf, don't have to learn anything about our language.";
            end

            if (Status~=0) then
                thisNPC:talk(Character.say,npc.base.functions.GetNLS(originator,gText,eText));
                if (Status==10) then
                    if (lang==0) then
                        originator:inform("Seine Ausführungen lassen die Sprache recht leicht erscheinen und du denkst das du schnell lernst.");
                        originator:inform("Du erkennst das du nun viele Wörter schon kennst und die Sprache schon etwas anwenden kannst.");
                    else
                        originator:inform("His discourses make the language seem quite simple as compared to the common tongue, and you find yourself learning fast.");
                        originator:inform("You begin to realize that many words you already know have a common heritage with many of the words you are learning.");
                    end
                elseif (Status==11) then
                    if (lang==0) then
                        originator:inform("Yastahl fängt mit den Grundlagen der Sprache der Elfen an, aber du kennst die Wörter schon seit einiger Zeit, wie auch immer, Yastahl nimmt es nicht wohlwollend hin, wenn sein Unterricht unterbrochen wird.");
                        originator:inform("Nach einiger Zeit fängt er an von den Komplexeren Teilen der Sprache zu sprechen, doch dann beginnt das Sibanac sein denken zu beeinflussen und so kannst du nicht mehr lernen.");
                    else
                        originator:inform("Yastahl begins with the basics of the Elven Tongue, but you already have known these words for some time; however, Yastahl does not take kindly to being interrupted during lessons.");
                        originator:inform("By the time he begins to get to the more advanced rules of the language, the sibanac has started to effect his thinking, and he is no longer of any use to you.");
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
    if (string.find(message,"[Ee]lf.+[Ll]ernen") ~= nil) or (string.find(message,"[Tt]each.*[Ee]lvish") ~= nil) then
        retVal=1;
        if (originator:getRace()~=3) then
            StudentStats[originator.id][1]=true;
        else
            retVal=15;
        end
    end
    return retVal
end

function FirnisGeben(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if (string.find(message,"[Ff]irnis") ~= nil) then
        if StudentStats[originator.id][1] then
            if (StudentStats[originator.id][2]~=true) then
                if (originator:countItem(148)>0) then
                    retVal=2;
                    StudentStats[originator.id][2]=true;
                    originator:eraseItem(148,1);
                    if StudentStats[originator.id][3] then
                        retVal=14;
                    end
                else
                    retVal=3;
                end
            else
                retVal=4;
            end
        else
            retVal=5;
        end
    end
    return retVal
end

function NachtGeben(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if (string.find(message,"[Nn]ight.*[Aa]ngel") ~= nil) or (string.find(message,"[Nn]acht.*[Ee]ngel") ~= nil) then
        if StudentStats[originator.id][1] then
            if (StudentStats[originator.id][3]~=true) then
                if (originator:countItem(138)>0) then
                    retVal=6;
                    StudentStats[originator.id][3]=true;
                    originator:eraseItem(138,1);
                    if StudentStats[originator.id][2] then
                        retVal=14;
                    end
                else
                    retVal=7;
                end
            else
                retVal=8;
            end
        else
            retVal=9;
        end
    end
    return retVal
end

function SibanacGeben(originator,message)
    local retVal=0;
    if (StudentStats[originator.id]==nil) then
        StudentStats[originator.id]={};
    end
    if (string.find(message,"[Ss]ibanac") ~= nil) then
        if StudentStats[originator.id][1] and StudentStats[originator.id][2] and StudentStats[originator.id][3] then
            if (originator:countItem(155)>0) then
                retVal=GenLangSkill(originator);
                originator:eraseItem(155,1);
            else
                retVal=12;
            end
        else
            retVal=13;
        end
    end
    return retVal
end

function GenLangSkill(User)
    local retVal=10;
    if (firstLearn==nil) then
        ListOfRaces={0 ,1 ,2 ,3  ,4,5,6,7 ,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36};
        ListOfSkill={40,10,20,100,5,5,5,60,5,0,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 };
    end
    Skill=User:getSkill("elf language");
    Int=User:increaseAttrib("intelligence",0);
    Race=User:getRace();
    if (Race==3) then
        User:increaseSkill(1,"elf language",100-Skill);
        retVal=11;
    else
        for i=1,table.getn(ListOfRaces) do
            if (ListOfRaces[i]==Race) then
                maxSkill=math.floor(ListOfSkill[i]*(Int/18));
                if (Skill>=maxSkill) then
                    retVal=11;
                else
                    User:increaseSkill(1,"elf language",maxSkill-Skill);
                    retVal=10;
                end
            end
        end
    end
    return retVal
end
