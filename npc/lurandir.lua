--Name:        Lurandir
--Race:        Elf
--Town:        West of Trolls Bane (Lake Adron)
--Function:    AutoQuest 1 (Legends of Irundar)
--Position:    x=-166 y=-107 z=0
--Facing:      South
--Last Update: 05/16/2006
--Update by:   vilarion

module("npc.lurandir", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talk(Character.say, "Don't touch me!");
end

function nextCycle()
    -- nothing
end

function receiveText(texttype, message, originator)
    -- printerr("from"..originator.name.."to"..thisNPC.name);

    if (NPCfirst == nil) then
        NPCText={}; -- 1 == De, 2 == En
        NPCText[1]={};
        NPCText[2]={};
        NPCTrig={};
        NPCTrig[1]={};
        NPCTrig[2]={};
        NPCTrig[2][1]="[Gg]reetings";
        NPCText[2][1]="Hello, my friend, stay a while and listen! I need your service.";
        NPCTrig[2][2]="[Hh]ello";
        NPCText[2][2]="Hello, my friend, stay a while and listen! I need your service.";
        NPCTrig[2][3]="service";
        NPCText[2][3]="Let me introduce myself. I am Lurandir, a wanderer and alchemist. Far have I travelled to find the last ingredient for a ... special recipe. I need the blessed water of Irundar... *sigh*";
        NPCTrig[2][4]="help";
        NPCText[2][4]="Let me introduce myself. I am Lurandir, a wanderer and alchemist. Far have I travelled to find the last ingredient for a ... special recipe. I need the blessed water of Irundar... *sigh*";
        NPCTrig[2][5]="[Rr]ecipe";
        NPCText[2][5]="The recipe itself it not of your concern my friend. Bring me the water and I might let you know more about it.";
        NPCTrig[2][6]="[Ww]ater";
        NPCText[2][6]="The blessed water of Irundar can be found in in the cave of Irundar. I don't know where this cave is, nor how to enter it. But I have heard of a ranger in the Northern woods who might know more. Her name is Elina Doron.";
        NPCTrig[2][7]="[Ii]rundar";
        NPCText[2][7]="The blessed water of Irundar can be found in in the cave of Irundar. I don't know where this cave is, nor how to enter it. But I have heard of a ranger in the Northern woods who might know more. Her name is Elina Doron.";

        NPCTrig[1][1]="[Gg]rüß";
        NPCText[1][1]="Hallo, mein Freund, bleibt eine Weile und hört zu! Ich benötige Eure Dienste.";
        NPCTrig[1][2]="[Hh]allo";
        NPCText[1][2]="Hallo, mein Freund, bleibt eine Weile und hört zu! Ich benötige Eure Dienste.";
        NPCTrig[1][3]="[Dd]ienste";
        NPCText[1][3]="Lasst mich Euch meinen Namen nennen. Ich bin Lurandir, ein Wanderer und Alchemist. Weit bin ich gereist um die letzte Zutat zu finden für ein... spezielles Rezept. Ich benötige das gesegnete Wasser von Irundar... *seufz*";
        NPCTrig[1][4]="[Hh]ilfe";
        NPCText[1][4]="Lasst mich Euch meinen Namen nennen. Ich bin Lurandir, ein Wanderer und Alchemist. Weit bin ich gereist um die letzte Zutat zu finden für ein... spezielles Rezept. Ich benötige das gesegnete Wasser von Irundar... *seufz*";
        NPCTrig[1][5]="[Rr]ezept";
        NPCText[1][5]="Das Rezept selbst soll nicht Eure Sorge sein mein Freund. Bringt mir das Wasser und vielleicht erzähle ich euch mehr darber.";
        NPCTrig[1][6]="[Ww]asser";
        NPCText[1][6]="Das gesegnete Wasser von Irundar kann in der Höhle von Irundar gefunden werden. Ich weiß weder, wo diese Höhle ist, noch wie man sie betritt. Doch hörte ich von einer Waldläuferin in den Nördlichen Wäldern, welche mehr wissen mag. Ihr Name ist Elina Doron.";
        NPCTrig[1][7]="[Ii]rundar";
        NPCText[1][7]="Das gesegnete Wasser von Irundar kann in der Höhle von Irundar gefunden werden. Ich weiß weder, wo diese Höhle ist, noch wie man sie betritt. Doch hörte ich von einer Waldläuferin in den Nördlichen Wäldern, welche mehr wissen mag. Ihr Name ist Elina Doron.";

        thisNPC:increaseSkill(1,"common language",100);
        NPCfirst=1;
    end

    if (originator.id ~= thisNPC.id) and (thisNPC:isInRange(originator,3)) then
        i=1;
        ready=false;
        -- lang = originator:getPlayerLanguage() + 1;
        for lang=1, 2 do
            repeat
                if (string.find(message,NPCTrig[3-lang][i]) ~= nil) then
                    if ( (i==6) and (LuaAnd( originator:getQuestProgress(1), 65 ) ~= 0) and (LuaAnd( originator:getQuestProgress(1), 65536 ) == 0) ) then
                        local litem = originator:getItemAt(5);
                        local ritem = originator:getItemAt(6);
                        if ( ( (litem.id == 2496) and (litem.data == 3) ) or ( (ritem.id == 2496) and (ritem.data == 3) ) ) then
                            thisNPC:talkLanguage(Character.say,Player.german ,"Habt Dank mein Freund. Ich benötige nur einige Tropfen, den Rest könnt Ihr behalten. Aber seid gewarnt: Eine übermäßige Anwendung könnte schädlich sein. Verwendet es weise! Kommt später wieder, vielleicht weiß ich dann mehr...");
                            thisNPC:talkLanguage(Character.say,Player.english,"Be thanked my friend. I need just a few drops, you can keep the rest for yourself. But be warned: Do not use it too often, it might be harmful. Use it wisely. Come back later and I might have found out more...");
                            originator:setQuestProgress(1, LuaOr( originator:getQuestProgress(1), 65536 ) );
                        else
                            thisNPC:talkLanguage(Character.say,Player.german ,"Ihr habt also das gesegnete Wasser von Irundar gefunden, mein Freund? So lasst es mich denn sehen!");
                            thisNPC:talkLanguage(Character.say,Player.english,"So you have found the blessed water of Irundar, my friend. Please, let me see it!");
                        end;
                    else
            			thisNPC:talk(Character.say,NPCText[3-lang][i]);
            			if (i==3 or i==4) then
            				originator:introduce(thisNPC);
            				originator:setQuestProgress(1, LuaOr( originator:getQuestProgress(1), 1 ) );
            			end
            			ready=true;
                    end;
                end
                i=i+1;
            until ((i==table.getn(NPCTrig[3-lang])+1) or ready)
        end
        if (not ready) then
            --special behaviour
        end
    end
end
