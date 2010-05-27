--Name:        Elina Doron
--Race:        Female Human
--Town:        Northern Woods
--Function:    AutoQuest 1 (Holy Water Quest)
--Position:    x=-257 y=-292 z=0
--Facing:      South
--Last Update: 04/16/2006
--Update by:   Nitram

require("npcs.base.functions")
module("npcs.elinadoron")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Fasst mich nicht an!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.functions.InitTalkLists()
    
    npcs.base.functions.AddTraderTrigger("[Gg]rüß","Scht! Ihr verscheucht die Tiere.");
    npcs.base.functions.AddAdditionalTrigger("[Hh]allo");
    npcs.base.functions.AddAdditionalText("Bleibt doch ruhig! Sonst verscheucht ihr die Tiere.");
    
    npcs.base.functions.AddTraderTrigger("[Gg]reetings","Hush! You scare the animals.");
    npcs.base.functions.AddAdditionalTrigger("[Hh]ello");
    npcs.base.functions.AddAdditionalTrigger("[Hh]i");
    npcs.base.functions.AddAdditionalText("Be quiet! You scare the animals.");
    
    npcs.base.functions.AddCycleText("#me blick still in den Wald hinaus","#me quietly peers into the forest");
    npcs.base.functions.AddCycleText("#me scheint zu horchen","#me seems to hark");
    
    TradSpeakLang={0,1,4};
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
        npcs.base.functions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npcs.base.functions.SpeakerCycle();
end		

function receiveText(texttype, message, originator)
    if npcs.base.functions.BasicNPCChecks(originator,2) then
        if (npcs.base.functions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status=IrundarInfo(originator, message);
            if (Status==0) then Status=Arrows(originator, message) end
            if (Status==0) then npcs.base.functions.TellSmallTalk(message) end
            
            -----------------------------------------------------EDIT BELOW HERE------------------------------------------------------------            
            
            if (Status==1) then
                gText="Ich habe von der Höhle von Irundar gehört. Bringt mir ein paar neue Pfeile und ich erzähle Euch was ich weiß Eine Hand voll wird gengen denke ich. Und nun seid still.";
                eText="I have heard about the Cave of Irundar. Bring me some new arrows and I will tell you what I know. A handful will suffice, I think. And now be quiet.";
            elseif (Status==2) then
                gText="Also gut...Ich erzähle: Meine Großeltern haben mir von der Höhle von Irundar erzählt. Sie ist auf dieser Insel, ich meine im Süden. Es gibt da einen alten Reim: Die reinsten Tränen der Fee, das reinste Blut eines Trolls, immer nach vorne nur seh, betrete die Kammer voll Stolz. Dies ist alles was ich weiß aber einst traf ich einen kleinen Halbling in den Wäldern, Timo, denke ich. Er wusste wie die Höhle selbst betreten werden kann. Fragt mich nicht wo er nun steckt, fragt einfach herum. Und jetzt lasst mich bitte alleine.";
                eText="Alright...I guess I have to talk: My grandparents told me about the Cave of Irundar. It is somewhere on this island, it is in the south I guess. There was a little verse: The purest tears of a fairy, The purest blood of a troll, still you have to be wary, and into the chamber you stroll. This is all I know, but once I met a little halfling in the forrests, Timo, I think. He knew how to enter the cave itself. Don't ask me where he is now, just ask around. And now leave me alone please.";
            elseif (Status==3) then
                gText="Versucht nicht mich zu betrügen! Ihr habt nicht gengend Pfeile dabei!";
                eText="Don't try to cheat me! You don't have enough arrows!";
            end
            if (Status~=0) then
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
                npcs.base.functions.NPCTalking(thisNPC,outText);
            end
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npcs.base.functions.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end
end--function

function IrundarInfo(originator, message)
    if (string.find(message,"[Ii]rundar")~=nil) then
        return 1;
    else
        return 0;
    end
end

function Arrows(originator, message)
    if (string.find(message,"[Pp]feil")~=nil or string.find(message,"[Aa]rrow")~=nil) then
        if (originator:countItem(64) >= 5) then
            originator:eraseItem(64, 5);
            return 2;
        else
            return 3;
        end
    else
        return 0;
    end
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Eine junge, hübsche Frau, die sich der Umgebung angemessen in Grün und Braun gekleidet hat. Um ihre Schulter hängt ein Bogen, sie scheint jedoch sehr versunken in den Anblick des sie umgebenen Waldes.";
        output[1]="A young, pretty woman that is wearing green and brown clothes fitting into her surrounding. She got a bow shouldered but is obviously absent observating the wood and its ainmals.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end