-- INSERT INTO npc VALUES (nextval('npc_seq'),0,68,62,100,4,false,'Ward Blankman','npc_ward_blankman.lua',0);

require("npc.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");
module("npc.ward_blankman")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npc.base.autonpcfunctions.AddTraderTrigger("greet","Greetings to you. My name is "..thisNPC.name..". I'm guarding the undead right there.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npc.base.autonpcfunctions.AddTraderTrigger("gr[üu][sß]","Grüß' dich. Mein Name ist "..thisNPC.name..". Ich bewache die Untoten dort drüben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hallo");
    npc.base.autonpcfunctions.AddTraderTrigger("bye","Be well.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npc.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npc.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npc.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npc.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npc.base.autonpcfunctions.AddAdditionalTrigger("leb.+wohl");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tsch[üu][ßs]");
    npc.base.autonpcfunctions.AddAdditionalTrigger("mach.+gut");
    npc.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npc.base.autonpcfunctions.AddAdditionalText("Leb wohl.");
    npc.base.autonpcfunctions.AddAdditionalText("Mach's gut.");
    npc.base.autonpcfunctions.AddTraderTrigger("who you","I'm "..thisNPC.name..", the guard of the undead on this isle.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npc.base.autonpcfunctions.AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", der Wächter der Untoten auf dieser Insel.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npc.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npc.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npc.base.autonpcfunctions.AddTraderTrigger("guardian","I don't know any guardian of the undead. Perhaps you'll meet one on Gobaith. But now hurry up, you've talked long enough. Move on, climb up the ladder and enter Findecano's castle.");
    npc.base.autonpcfunctions.AddTraderTrigger("h[uü]ter","Ich kenne keinen Hüter der Untoten. Aber vielleicht triffst du einen auf Gobaith. Aber jetzt spute dich, du hast schon lange genug geredet. Geh weiter, kletter die Leiter hoch und betrete das Schloss von Findecano.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hueter");
    npc.base.autonpcfunctions.AddTraderTrigger("guard","I am a guard of the undead. It is my duty to ensure that both the living and the undead do not endanger the other group.");
    npc.base.autonpcfunctions.AddTraderTrigger("w[äa]chter","Ich bin ein Wächter der Untoten. Es ist meine Pflicht sicherzustellen, dass sowohl die Lebenden als auch die Untoten nicht die andere Gruppe gefährden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("waechter");
    npc.base.autonpcfunctions.AddTraderTrigger("creature","Those creatures are undead.");
    npc.base.autonpcfunctions.AddTraderTrigger("kreatur","Diese Kreaturen sind Untote.");
    npc.base.autonpcfunctions.AddTraderTrigger("undead","I've trapped the undead in this cave. Mummies and skeletons. May Cherga release their souls.");
    npc.base.autonpcfunctions.AddTraderTrigger("untot","Ich habe die Untoten in diese Höhle gesperrt. Mumien und Skelette. Möge Cherga ihre Seelen freigeben.");
	npc.base.autonpcfunctions.AddTraderTrigger("living","The living should not disturb the undead. They are at a difficult stage on the way to Cherga's realm.");
    npc.base.autonpcfunctions.AddTraderTrigger("lebend","Die Lebenden sollten die Untoten nicht stören. Sie sind in einem schwierigen Abschnitt auf dem Weg zu Chergas Reich.");
    npc.base.autonpcfunctions.AddTraderTrigger("cherga","Cherga is the Goddess of Spirits and the Underworld. Those undead probably still have to fulfill a certain task. Only then their souls will find peace.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("realm");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("cherga","Cherga ist die Göttin der Geister und der Unterwelt. Diese Untoten haben wahrscheinlich noch ein bestimmte Aufgabe zu erfüllen. Erst dann werden ihre Seelen Frieden finden.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("reich");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddTraderTrigger("soul","These souls can only find peace when they have fulfilled their task.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("peace");
    npc.base.autonpcfunctions.AddTraderTrigger("seele","Jene Seelen können nur Frieden finden, wenn sie ihre Aufgabe erledigt haben.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("friede");
    npc.base.autonpcfunctions.AddTraderTrigger("task","I don't know what task they have to do. Usually only the Gods know this. However some chosen ones - the guardians of the undead - are told to help them. They might know more.");
    npc.base.autonpcfunctions.AddTraderTrigger("aufgabe","Ich weiß nicht, was für eine Aufgabe sie erledigen müssen. Normalerweise wissen das nur die Götter. Jedoch sind einige Auserwählte - die Hüter der Untoten - damit beauftragt, ihnen zu helfen. Diese wissen möglicherweise mehr.");
    npc.base.autonpcfunctions.AddTraderTrigger("ladder","Yes, climb up that ladder. Just step on it and you'll be on the other side of the ladder.");
    npc.base.autonpcfunctions.AddTraderTrigger("leiter","Ja, kletter diese Leiter hoch. Tret einfach darauf und du wirst am anderen Ende der leiter sein.");
    npc.base.autonpcfunctions.AddTraderTrigger("findecano","Go to Findecano. He's waiting for you.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("castle");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddTraderTrigger("findecano","Geh zu Findecano. Er wartet auf dich.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("schlo[sß]");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddCycleText("#me reibt sich die Hände.","#me rubs his hands.");
    npc.base.autonpcfunctions.AddCycleText("#me schüttelt den Kopf 'Arme Kreaturen.'","#me shakes his head 'Poor creatures.'");
    -- ********* END DYNAMIC PART ********

    TradSpeakLang={0,1};
    TradStdLang=0;

    npc.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npc.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npc.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npc.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npc.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npc.base.autonpcfunctions.Confused(
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
