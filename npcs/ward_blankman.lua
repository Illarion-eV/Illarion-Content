-- INSERT INTO npc VALUES (nextval('npc_seq'),0,68,62,100,4,false,'Ward Blankman','npc_ward_blankman.lua',0);

require("npcs.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    AddTraderTrigger("greet","Greetings to you. My name is "..thisNPC.name..". I'm guarding the undead right there.");
    AddAdditionalTrigger("hello");
    AddTraderTrigger("gr[üu][sß]","Grüß' dich. Mein Name ist "..thisNPC.name..". Ich bewache die Untoten dort drüben.");
    AddAdditionalTrigger("grue[sß]");
    AddAdditionalTrigger("hallo");
    AddTraderTrigger("bye","Be well.");
    AddAdditionalTrigger("farewell");
    AddAdditionalTrigger("be well");
    AddAdditionalText("Farewell.");
    AddAdditionalText("Good bye.");
    AddTraderTrigger("auf bald","Auf bald.");
    AddAdditionalTrigger("bis bald");
    AddAdditionalTrigger("leb.+wohl");
    AddAdditionalTrigger("tsch[üu][ßs]");
    AddAdditionalTrigger("mach.+gut");
    AddAdditionalText("Bis bald.");
    AddAdditionalText("Leb wohl.");
    AddAdditionalText("Mach's gut.");
    AddTraderTrigger("who you","I'm "..thisNPC.name..", the guard of the undead on this isle.");
    AddAdditionalTrigger("what you");
    AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", der Wächter der Untoten auf dieser Insel.");
    AddAdditionalTrigger("was du");
    AddAdditionalTrigger("wer ihr");
    AddAdditionalTrigger("was ihr");
    AddTraderTrigger("guardian","I don't know any guardian of the undead. Perhaps you'll meet one on Gobaith. But now hurry up, you've talked long enough. Move on, climb up the ladder and enter Findecano's castle.");
    AddTraderTrigger("h[uü]ter","Ich kenne keinen Hüter der Untoten. Aber vielleicht triffst du einen auf Gobaith. Aber jetzt spute dich, du hast schon lange genug geredet. Geh weiter, kletter die Leiter hoch und betrete das Schloss von Findecano.");
    AddAdditionalTrigger("hueter");
    AddTraderTrigger("guard","I am a guard of the undead. It is my duty to ensure that both the living and the undead do not endanger the other group.");
    AddTraderTrigger("w[äa]chter","Ich bin ein Wächter der Untoten. Es ist meine Pflicht sicherzustellen, dass sowohl die Lebenden als auch die Untoten nicht die andere Gruppe gefährden.");
    AddAdditionalTrigger("waechter");
    AddTraderTrigger("creature","Those creatures are undead.");
    AddTraderTrigger("kreatur","Diese Kreaturen sind Untote.");
    AddTraderTrigger("undead","I've trapped the undead in this cave. Mummies and skeletons. May Cherga release their souls.");
    AddTraderTrigger("untot","Ich habe die Untoten in diese Höhle gesperrt. Mumien und Skelette. Möge Cherga ihre Seelen freigeben.");
	AddTraderTrigger("living","The living should not disturb the undead. They are at a difficult stage on the way to Cherga's realm.");
    AddTraderTrigger("lebend","Die Lebenden sollten die Untoten nicht stören. Sie sind in einem schwierigen Abschnitt auf dem Weg zu Chergas Reich.");
    AddTraderTrigger("cherga","Cherga is the Goddess of Spirits and the Underworld. Those undead probably still have to fulfill a certain task. Only then their souls will find peace.");
    AddAdditionalTrigger("realm");
    AddCondition("lang","english");
    AddTraderTrigger("cherga","Cherga ist die Göttin der Geister und der Unterwelt. Diese Untoten haben wahrscheinlich noch ein bestimmte Aufgabe zu erfüllen. Erst dann werden ihre Seelen Frieden finden.");
    AddAdditionalTrigger("reich");
    AddCondition("lang","german");
    AddTraderTrigger("soul","These souls can only find peace when they have fulfilled their task.");
    AddAdditionalTrigger("peace");
    AddTraderTrigger("seele","Jene Seelen können nur Frieden finden, wenn sie ihre Aufgabe erledigt haben.");
    AddAdditionalTrigger("friede");
    AddTraderTrigger("task","I don't know what task they have to do. Usually only the Gods know this. However some chosen ones - the guardians of the undead - are told to help them. They might know more.");
    AddTraderTrigger("aufgabe","Ich weiß nicht, was für eine Aufgabe sie erledigen müssen. Normalerweise wissen das nur die Götter. Jedoch sind einige Auserwählte - die Hüter der Untoten - damit beauftragt, ihnen zu helfen. Diese wissen möglicherweise mehr.");
    AddTraderTrigger("ladder","Yes, climb up that ladder. Just step on it and you'll be on the other side of the ladder.");
    AddTraderTrigger("leiter","Ja, kletter diese Leiter hoch. Tret einfach darauf und du wirst am anderen Ende der leiter sein.");
    AddTraderTrigger("findecano","Go to Findecano. He's waiting for you.");
    AddAdditionalTrigger("castle");
    AddCondition("lang","english");
    AddTraderTrigger("findecano","Geh zu Findecano. Er wartet auf dich.");
    AddAdditionalTrigger("schlo[sß]");
    AddCondition("lang","german");
    AddCycleText("#me reibt sich die Hände.","#me rubs his hands.");
    AddCycleText("#me schüttelt den Kopf 'Arme Kreaturen.'","#me shakes his head 'Poor creatures.'");
    -- ********* END DYNAMIC PART ********

    TradSpeakLang={0,1};
    TradStdLang=0;

    increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if BasicNPCChecks(originator,2) then
        if LangOK(originator,TradSpeakLang) then
            TellSmallTalk(message,originator);
        else
            Confused(
               "#me sieht dich leicht verwirrt an",
               "#me looks at you a little confused"
            );
        end
    end
end

function lookAtNpc(Char, mode)
    if initLook==nil then
        output={};
        output[0]="Ein recht alter Mann, gehüllt in einen dunklen Mantel mit Kapuze, der mit trüben Augen zu den Kreaturen auf der anderen Seite der Höhle hinübersieht.";
        output[1]="A quite old man, covered in a dark hooded cloak, who looks with bleary eyes to the creatures on the other side of the cave.";
        initLook=1;
    end
    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
