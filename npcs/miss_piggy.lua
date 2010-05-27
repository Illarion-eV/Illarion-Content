-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-98,-82,0,4,false,'Miss Piggy','npc_miss_piggy.lua',1);

require("npcs.base.autonpcfunctions")
module("npcs.miss_piggy")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- race shall be pig!
    npcs.base.autonpcfunctions.SetRadius(2);
    -- This pig wears the crown of SB on its butt! See the library book for backgroundstory.

    npcs.base.autonpcfunctions.AddTraderTrigger("krone","#me trägt, wie du plötzlich begreifst die Krone des Königs von Silberbrand auf der Pobacke mit sich umher!");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.dwarf);
    npcs.base.autonpcfunctions.AddAdditionalText("#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me legt sich in ein Schlammloch. Würde jemand nach der goldenen Krone schnappen, viele auf, das sie wohl magisch angebracht wurde.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Spielt dir dein Kopf einen Streich, oder hast du tatsächlich über dieses Schwein etwas in der Bibliothek gelesen?");
    npcs.base.autonpcfunctions.AddTraderTrigger("crown","#me wears, you realize now, the crown of the king from Silverbrand on its buttock!");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.dwarf);
    npcs.base.autonpcfunctions.AddAdditionalText("#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me lays down into the mud. If someone would trie to grab it, those will notice that it seem to be fixed in a magical way.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Is your head kidding you? Or do you read about this pig at the library?");
    npcs.base.autonpcfunctions.AddTraderTrigger("krone","#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me legt sich in ein Schlammloch. Würde jemand nach der goldenen Krone schnappen, viele auf, das sie wohl magisch angebracht wurde.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Spielt dir dein Kopf einen Streich, oder hast du tatsächlich über dieses Schwein etwas in der Bibliothek gelesen?");
    npcs.base.autonpcfunctions.AddTraderTrigger("crown","#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me lays down into the mud. If someone would trie to grab it, those will notice that it seem to be fixed in a magical way.");
    npcs.base.autonpcfunctions.AddConsequence("inform","Is your head kidding you? Or do you read about this pig at the library?");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","");
    npcs.base.autonpcfunctions.AddConsequence("inform","Eine Sau die eine Krone auf ihrem Po trägt. Was es wohl damit aufsich hat?");
    npcs.base.autonpcfunctions.AddTraderTrigger("helfen","");
    npcs.base.autonpcfunctions.AddConsequence("inform","Eine Sau die eine Krone auf ihrem Po trägt. Was es wohl damit aufsich hat?");
    npcs.base.autonpcfunctions.AddTraderTrigger("help","");
    npcs.base.autonpcfunctions.AddConsequence("inform","A sow, waering a crown on her buttock. What could be the reason for that?");

	npcs.base.autonpcfunctions.AddTraderTrigger("?","#me scheint dir interessiert zu zu hören. Mit einer Art nicken stimmt sie der Frage zu.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("#me grunzt glücklich und begutachtet interessiert den Schlamm zu ihren Hufen.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me scheint dich verwirrt anzusehen.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me scheint dir interessiert zu zu höhren. Dann scheint sie ihren Kopf kräftig zu schütteln.");

	npcs.base.autonpcfunctions.AddTraderTrigger("!","#me scheint ihre Augen zusammen zu kneifen. Fragender Weise in deine Augen blickend.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("#me grunzt mehrere Male. Es erinnert an ein lachen.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me dreht herum und lässt sich in das nächste Schlammloch sinken.");

	npcs.base.autonpcfunctions.AddTraderTrigger("?","#me seems watching you interested. Giving you a kind of nod, in agreement to your question.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("#me grunts happyly and looks interested at the mud on the ground.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me seems like giving you a confused looking face.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me seems watching you interested. Then frequently shaking it's head.");

	npcs.base.autonpcfunctions.AddTraderTrigger("!","#me seems like narrow it's eyes. Looking up to your face, in a askening way.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("#me grunts several times. It sound a little bit similar to a laughter.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me turns around to get sunk into the next mud hole.");


	npcs.base.autonpcfunctions.AddTraderTrigger(".","#me leckt ihre Nase mit der Zunge ab.");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddAdditionalText("#me scheint dich anzusehen, dann grunzt sie einige Male in deine Richtung als würde sie mit dir sprechen.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me scheint ihren Kopf langsam zu schütteln. Sie blickt dich mit seltsamen Blick an.");
    
	npcs.base.autonpcfunctions.AddTraderTrigger(".","#me licks it's own nose with the tounge.");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddAdditionalText("#me seems watching you and starts to grunt several times into your direction, like talking to you.");
    npcs.base.autonpcfunctions.AddAdditionalText("#me seems to shake its big head a little. Looking at you with a weird gaze.");
    
	npcs.base.autonpcfunctions.AddCycleText("#me grunzt glücklich und steckt ihren Rüssel in den schlammigen Boden.","#me grunts happyly and pokes its trunk into the muddy ground.");
    npcs.base.autonpcfunctions.AddCycleText("#me quiekt aufgeregt.","#me squeals with glee.");
    npcs.base.autonpcfunctions.AddCycleText("#me scharrt mit dem Vorderhuf im Boden.","#me scrabbles with it's foot on the ground.");
    npcs.base.autonpcfunctions.AddCycleText("#me lässt sich mit einem langezogenen grunzen in den Schlamm fallen.","#me drops its body with a lucky grunt into the mud.");
    npcs.base.autonpcfunctions.AddCycleText("#me wälzt sich voller Freude im Schlamm."," #me wallows amused in the mud.");
    npcs.base.autonpcfunctions.AddCycleText("#me ist eine große schwere, glücklich schnüffelnde und grunzende Sau. Sie trägt eine goldene Krone auf ihrer linken Pobacke.","#me is a big heavy, lucky sniffling and gruntig sow. Wearing a golden crown on the left buttock.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
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
        output[0]="Eine große schwere, glücklich schnüffelnde und grunzende Sau. Sie trägt eine goldene Krone auf ihrer linken Pobacke.";
        output[1]="It's a big heavy, lucky sniffling and gruntig sow. Wearing a golden crown on the left buttock.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end