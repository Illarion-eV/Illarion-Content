-- INSERT INTO npc VALUES (nextval('npc_seq'),0,68,62,100,4,false,'Ward Blankman','npc_ward_blankman.lua',0);

require("npcs.base.autonpcfunctions")
-- dofile("/usr/share/servers/illarionserver/scripts/npc_autonpcfunctions.lua");
module("npcs.ward_blankman")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Dont you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npcs.base.autonpcfunctions.AddTraderTrigger("greet","Greetings to you. My name is "..thisNPC.name..". I'm guarding the undead right there.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hello");
    npcs.base.autonpcfunctions.AddTraderTrigger("gr[üu][sß]","Grüß' dich. Mein Name ist "..thisNPC.name..". Ich bewache die Untoten dort drüben.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hallo");
    npcs.base.autonpcfunctions.AddTraderTrigger("bye","Be well.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("farewell");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("be well");
    npcs.base.autonpcfunctions.AddAdditionalText("Farewell.");
    npcs.base.autonpcfunctions.AddAdditionalText("Good bye.");
    npcs.base.autonpcfunctions.AddTraderTrigger("auf bald","Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("leb.+wohl");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tsch[üu][ßs]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("mach.+gut");
    npcs.base.autonpcfunctions.AddAdditionalText("Bis bald.");
    npcs.base.autonpcfunctions.AddAdditionalText("Leb wohl.");
    npcs.base.autonpcfunctions.AddAdditionalText("Mach's gut.");
    npcs.base.autonpcfunctions.AddTraderTrigger("who you","I'm "..thisNPC.name..", the guard of the undead on this isle.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npcs.base.autonpcfunctions.AddTraderTrigger("wer du","Ich bin "..thisNPC.name..", der Wächter der Untoten auf dieser Insel.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was ihr");
    npcs.base.autonpcfunctions.AddTraderTrigger("guardian","I don't know any guardian of the undead. Perhaps you'll meet one on Gobaith. But now hurry up, you've talked long enough. Move on, climb up the ladder and enter Findecano's castle.");
    npcs.base.autonpcfunctions.AddTraderTrigger("h[uü]ter","Ich kenne keinen Hüter der Untoten. Aber vielleicht triffst du einen auf Gobaith. Aber jetzt spute dich, du hast schon lange genug geredet. Geh weiter, kletter die Leiter hoch und betrete das Schloss von Findecano.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hueter");
    npcs.base.autonpcfunctions.AddTraderTrigger("guard","I am a guard of the undead. It is my duty to ensure that both the living and the undead do not endanger the other group.");
    npcs.base.autonpcfunctions.AddTraderTrigger("w[äa]chter","Ich bin ein Wächter der Untoten. Es ist meine Pflicht sicherzustellen, dass sowohl die Lebenden als auch die Untoten nicht die andere Gruppe gefährden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("waechter");
    npcs.base.autonpcfunctions.AddTraderTrigger("creature","Those creatures are undead.");
    npcs.base.autonpcfunctions.AddTraderTrigger("kreatur","Diese Kreaturen sind Untote.");
    npcs.base.autonpcfunctions.AddTraderTrigger("undead","I've trapped the undead in this cave. Mummies and skeletons. May Cherga release their souls.");
    npcs.base.autonpcfunctions.AddTraderTrigger("untot","Ich habe die Untoten in diese Höhle gesperrt. Mumien und Skelette. Möge Cherga ihre Seelen freigeben.");
	npcs.base.autonpcfunctions.AddTraderTrigger("living","The living should not disturb the undead. They are at a difficult stage on the way to Cherga's realm.");
    npcs.base.autonpcfunctions.AddTraderTrigger("lebend","Die Lebenden sollten die Untoten nicht stören. Sie sind in einem schwierigen Abschnitt auf dem Weg zu Chergas Reich.");
    npcs.base.autonpcfunctions.AddTraderTrigger("cherga","Cherga is the Goddess of Spirits and the Underworld. Those undead probably still have to fulfill a certain task. Only then their souls will find peace.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("realm");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("cherga","Cherga ist die Göttin der Geister und der Unterwelt. Diese Untoten haben wahrscheinlich noch ein bestimmte Aufgabe zu erfüllen. Erst dann werden ihre Seelen Frieden finden.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("reich");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddTraderTrigger("soul","These souls can only find peace when they have fulfilled their task.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("peace");
    npcs.base.autonpcfunctions.AddTraderTrigger("seele","Jene Seelen können nur Frieden finden, wenn sie ihre Aufgabe erledigt haben.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("friede");
    npcs.base.autonpcfunctions.AddTraderTrigger("task","I don't know what task they have to do. Usually only the Gods know this. However some chosen ones - the guardians of the undead - are told to help them. They might know more.");
    npcs.base.autonpcfunctions.AddTraderTrigger("aufgabe","Ich weiß nicht, was für eine Aufgabe sie erledigen müssen. Normalerweise wissen das nur die Götter. Jedoch sind einige Auserwählte - die Hüter der Untoten - damit beauftragt, ihnen zu helfen. Diese wissen möglicherweise mehr.");
    npcs.base.autonpcfunctions.AddTraderTrigger("ladder","Yes, climb up that ladder. Just step on it and you'll be on the other side of the ladder.");
    npcs.base.autonpcfunctions.AddTraderTrigger("leiter","Ja, kletter diese Leiter hoch. Tret einfach darauf und du wirst am anderen Ende der leiter sein.");
    npcs.base.autonpcfunctions.AddTraderTrigger("findecano","Go to Findecano. He's waiting for you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("castle");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddTraderTrigger("findecano","Geh zu Findecano. Er wartet auf dich.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("schlo[sß]");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddCycleText("#me reibt sich die Hände.","#me rubs his hands.");
    npcs.base.autonpcfunctions.AddCycleText("#me schüttelt den Kopf 'Arme Kreaturen.'","#me shakes his head 'Poor creatures.'");
    -- ********* END DYNAMIC PART ********

    TradSpeakLang={0,1};
    TradStdLang=0;

    npcs.base.autonpcfunctions.increaseLangSkill(TradSpeakLang);
    thisNPC.activeLanguage=TradStdLang;

end

function nextCycle()  -- ~10 times per second
    initializeNpc();
    npcs.base.autonpcfunctions.SpeakerCycle();
end

function receiveText(texttype, message, originator)
    if npcs.base.autonpcfunctions.BasicNPCChecks(originator,2) then
        if npcs.base.autonpcfunctions.LangOK(originator,TradSpeakLang) then
            npcs.base.autonpcfunctions.TellSmallTalk(message,originator);
        else
            npcs.base.autonpcfunctions.Confused(
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
