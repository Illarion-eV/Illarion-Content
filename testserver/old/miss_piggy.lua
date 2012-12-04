-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-98,-82,0,4,false,'Miss Piggy','npc_miss_piggy.lua',1);

require("npc.base.autonpcfunctions")
module("npc.miss_piggy", package.seeall)

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    thisNPC:talkLanguage(Character.say, Player.english, "#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- race shall be pig!
    npc.base.autonpcfunctions.SetRadius(2);
    -- This pig wears the crown of SB on its butt! See the library book for backgroundstory.

    npc.base.autonpcfunctions.AddTraderTrigger("krone","#me trägt, wie du plötzlich begreifst die Krone des Königs von Silberbrand auf der Pobacke mit sich umher!");
    npc.base.autonpcfunctions.AddCondition("race", Character.dwarf);
    npc.base.autonpcfunctions.AddAdditionalText("#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    npc.base.autonpcfunctions.AddAdditionalText("#me legt sich in ein Schlammloch. Würde jemand nach der goldenen Krone schnappen, viele auf, das sie wohl magisch angebracht wurde.");
    npc.base.autonpcfunctions.AddConsequence("inform","Spielt dir dein Kopf einen Streich, oder hast du tatsächlich über dieses Schwein etwas in der Bibliothek gelesen?");
    npc.base.autonpcfunctions.AddTraderTrigger("crown","#me wears, you realize now, the crown of the king from Silverbrand on its buttock!");
    npc.base.autonpcfunctions.AddCondition("race", Character.dwarf);
    npc.base.autonpcfunctions.AddAdditionalText("#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
    npc.base.autonpcfunctions.AddAdditionalText("#me lays down into the mud. If someone would trie to grab it, those will notice that it seem to be fixed in a magical way.");
    npc.base.autonpcfunctions.AddConsequence("inform","Is your head kidding you? Or do you read about this pig at the library?");
    npc.base.autonpcfunctions.AddTraderTrigger("krone","#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    npc.base.autonpcfunctions.AddAdditionalText("#me legt sich in ein Schlammloch. Würde jemand nach der goldenen Krone schnappen, viele auf, das sie wohl magisch angebracht wurde.");
    npc.base.autonpcfunctions.AddConsequence("inform","Spielt dir dein Kopf einen Streich, oder hast du tatsächlich über dieses Schwein etwas in der Bibliothek gelesen?");
    npc.base.autonpcfunctions.AddTraderTrigger("crown","#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
    npc.base.autonpcfunctions.AddAdditionalText("#me lays down into the mud. If someone would trie to grab it, those will notice that it seem to be fixed in a magical way.");
    npc.base.autonpcfunctions.AddConsequence("inform","Is your head kidding you? Or do you read about this pig at the library?");
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","");
    npc.base.autonpcfunctions.AddConsequence("inform","Eine Sau die eine Krone auf ihrem Po trägt. Was es wohl damit aufsich hat?");
    npc.base.autonpcfunctions.AddTraderTrigger("helfen","");
    npc.base.autonpcfunctions.AddConsequence("inform","Eine Sau die eine Krone auf ihrem Po trägt. Was es wohl damit aufsich hat?");
    npc.base.autonpcfunctions.AddTraderTrigger("help","");
    npc.base.autonpcfunctions.AddConsequence("inform","A sow, waering a crown on her buttock. What could be the reason for that?");

	npc.base.autonpcfunctions.AddTraderTrigger("?","#me scheint dir interessiert zu zu hören. Mit einer Art nicken stimmt sie der Frage zu.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("#me grunzt glücklich und begutachtet interessiert den Schlamm zu ihren Hufen.");
    npc.base.autonpcfunctions.AddAdditionalText("#me scheint dich verwirrt anzusehen.");
    npc.base.autonpcfunctions.AddAdditionalText("#me scheint dir interessiert zu zu höhren. Dann scheint sie ihren Kopf kräftig zu schütteln.");

	npc.base.autonpcfunctions.AddTraderTrigger("!","#me scheint ihre Augen zusammen zu kneifen. Fragender Weise in deine Augen blickend.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("#me grunzt mehrere Male. Es erinnert an ein lachen.");
    npc.base.autonpcfunctions.AddAdditionalText("#me dreht herum und lässt sich in das nächste Schlammloch sinken.");

	npc.base.autonpcfunctions.AddTraderTrigger("?","#me seems watching you interested. Giving you a kind of nod, in agreement to your question.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("#me grunts happyly and looks interested at the mud on the ground.");
    npc.base.autonpcfunctions.AddAdditionalText("#me seems like giving you a confused looking face.");
    npc.base.autonpcfunctions.AddAdditionalText("#me seems watching you interested. Then frequently shaking it's head.");

	npc.base.autonpcfunctions.AddTraderTrigger("!","#me seems like narrow it's eyes. Looking up to your face, in a askening way.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("#me grunts several times. It sound a little bit similar to a laughter.");
    npc.base.autonpcfunctions.AddAdditionalText("#me turns around to get sunk into the next mud hole.");


	npc.base.autonpcfunctions.AddTraderTrigger(".","#me leckt ihre Nase mit der Zunge ab.");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddAdditionalText("#me scheint dich anzusehen, dann grunzt sie einige Male in deine Richtung als würde sie mit dir sprechen.");
    npc.base.autonpcfunctions.AddAdditionalText("#me scheint ihren Kopf langsam zu schütteln. Sie blickt dich mit seltsamen Blick an.");
    
	npc.base.autonpcfunctions.AddTraderTrigger(".","#me licks it's own nose with the tounge.");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddAdditionalText("#me seems watching you and starts to grunt several times into your direction, like talking to you.");
    npc.base.autonpcfunctions.AddAdditionalText("#me seems to shake its big head a little. Looking at you with a weird gaze.");
    
	npc.base.autonpcfunctions.AddCycleText("#me grunzt glücklich und steckt ihren Rüssel in den schlammigen Boden.","#me grunts happyly and pokes its trunk into the muddy ground.");
    npc.base.autonpcfunctions.AddCycleText("#me quiekt aufgeregt.","#me squeals with glee.");
    npc.base.autonpcfunctions.AddCycleText("#me scharrt mit dem Vorderhuf im Boden.","#me scrabbles with it's foot on the ground.");
    npc.base.autonpcfunctions.AddCycleText("#me lässt sich mit einem langezogenen grunzen in den Schlamm fallen.","#me drops its body with a lucky grunt into the mud.");
    npc.base.autonpcfunctions.AddCycleText("#me wälzt sich voller Freude im Schlamm."," #me wallows amused in the mud.");
    npc.base.autonpcfunctions.AddCycleText("#me ist eine große schwere, glücklich schnüffelnde und grunzende Sau. Sie trägt eine goldene Krone auf ihrer linken Pobacke.","#me is a big heavy, lucky sniffling and gruntig sow. Wearing a golden crown on the left buttock.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
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
        output[0]="Eine große schwere, glücklich schnüffelnde und grunzende Sau. Sie trägt eine goldene Krone auf ihrer linken Pobacke.";
        output[1]="It's a big heavy, lucky sniffling and gruntig sow. Wearing a golden crown on the left buttock.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
