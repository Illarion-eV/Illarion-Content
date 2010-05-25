--Name:        Jarmal
--Race:        Human
--Town:        Harbour
--Function:    Speaker
--Position:    x=-286 y=45 z=0
--Facing:      South
--Last Update: 04/26/2005
--Update by:   Nitram

dofile("npc_functions.lua")

function useNPC(user,counter,param)
    local lang=user:getPlayerLanguage();
    thisNPC:increaseSkill(1,"common language",100);
    if (lang==0) then thisNPC:talk(CCharacter.say, "Finger weg!") end
    if (lang==1) then thisNPC:talk(CCharacter.say, "Don't you touch me!") end
end

function initializeNpc()
    npcs.base.autonpcfunctions.InitTalkLists()

    thisNPC:increaseSkill(1,"common language",100);
    --------------------------------------------- *** EDIT BELOW HERE ***--------------------------------------

    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ello","Greetings Traveler, I hope you had a pleasant voyage.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]reetings");
    npcs.base.autonpcfunctions.AddAdditionalText("Ah, Greetings Landrat. Was the journey rough?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]allo","Grüße Reisender, ich hoff du hattest ne angenehme Reise.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Gg]r[uü][sß]+");
    npcs.base.autonpcfunctions.AddAdditionalText("Ah, Grüße Landratte. War die Reise rau?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]ho","I am "..thisNPC.name..", shipboy.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]er","Ich bin "..thisNPC.name..", Schiffsjunge.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]here.+a[mr]e*","This is the harbour, where else did you expect a ship to bring you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]o.+[sb]ind*","Das ist der Hafen. Wo sonst dachtest du brinst dich 'n Schiff hin?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]arbour","Not as big as one would expect, right? But it does the job still.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]afen","Nicht so groß wie du dachtest, richtig? Aber er dient seinem Zweck.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Tt]own","The next big Town is Trollsbane, to the northeast. Or the village Greenbriar to the west.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]t[aä]dt","Die nächste große Stadt ist Trollsbane im Nordosten. Oder das Dorf Greenbriar im Westen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+sell","I aint selling anything, landrat.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+verkauf","I verkauf nix, Landratte.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]hat.+buy","Do I look like some filthy rich trader, landrat?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ww]as.+%skauf","Seh ich aus wie'n reicher Händler, Landratte?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]elp","Best advice I can give you, go somewhere else.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Hh]ilfe","Der beste Tipp, den ich dir geben kann, ist woanders hin zu gehen");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ss]somewhere.+else","Like Trollsbane, or Greenbriar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]nders","Wie Trolls Bane oder Greenbriar.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Nn]ew.+here","I thought so the first time I saw you. Well, welcome on this little godforsaken island, landrat.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Nn]eu.+hier","Das wusst ich schon als ich dich das erste Mal gesehen hab. Naja...willkommen auf dieser kleinen Insel, Landratte.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ii]sland","Yes, welcome on the island of ... of ... arr, forget it. Have some ale with you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Ii]nsel","Ja. Willkommen auf der Insel...ähm...arr, ich habs vergessen. Hast du Bier dabei?");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Bb]ye.","Aye, Landrat.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Ff]arewell");
    npcs.base.autonpcfunctions.AddAdditionalText("Aye aye.");
    npcs.base.autonpcfunctions.AddTraderTrigger("[Aa]uf.+[Bb]ald","Aye, Landratte");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("[Bb]is.+[Bb]ald");
    npcs.base.autonpcfunctions.AddAdditionalText("Aye aye");

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

--------------------------------------------- *** DON'T EDIT BELOW HERE ***--------------------------------------

function nextCycle()  -- ~10 times per second
    if (TraderFirst == nil) then
        initializeNpc();
        npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang)
        thisNPC.activeLanguage=TradStdLang;
    end
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if (npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang)==true) then
            thisNPC.activeLanguage=originator.activeLanguage;
            Status=TownTexts(message);
            if (Status==0) then npcs.base.autonpcfunctions.TellSmallTalk(message) end

            if (Status==1) then
                gText="Aye, Trollsbane im Nordosten. Du kannst eigentlich alles doch finden.";
                eText="Aye, Trollsbane in the Northeast. You can find practicly everything there.";
            elseif (Status==2) then
                gText="Früher war es mal ein Halblingsdorf, jetzt sollen dort aber nur noch Elfen leben.";
                eText="This used to be a Halfling village, now only some elves live here.";
            end

            if (Status~=0) then
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC.talk(CCharacter.say,outText);
            end
        else
            if (verwirrt==false) then
                gText="#me sieht dich leicht verwirrt an";
                eText="#me looks at you a little confused";
                outText=npcs.base.npcautofunction.GetNLS(originator,gText,eText);
                thisNPC:talk(CCharacter.say,outText);
                verwirrt=true;
            end
        end
    end --id
end--function

function TownTexts(message)
    local retVal=0;
    if (string.find(message,"[Tt]roll'*s.*[Bb]ane")~=nil) then
        retVal=1;
    elseif (string.find(message,"[Gg]reen.*[Bb]riar")~=nil) then
        retVal=2;
    end
    return retVal
end
