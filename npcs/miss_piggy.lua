-- INSERT INTO npc VALUES (nextval('npc_seq'),3,-98,-82,0,4,false,'Miss Piggy','npc_miss_piggy.lua',1);

require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    -- race shall be pig!
    SetRadius(2);
    -- This pig wears the crown of SB on its butt! See the library book for backgroundstory.

    AddTraderTrigger("krone","#me trägt, wie du plötzlich begreifst die Krone des Königs von Silberbrand auf der Pobacke mit sich umher!");
    AddCondition("race", CCharacter.dwarf);
    AddAdditionalText("#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    AddAdditionalText("#me legt sich in ein Schlammloch. Würde jemand nach der goldenen Krone schnappen, viele auf, das sie wohl magisch angebracht wurde.");
    AddConsequence("inform","Spielt dir dein Kopf einen Streich, oder hast du tatsächlich über dieses Schwein etwas in der Bibliothek gelesen?");
    AddTraderTrigger("crown","#me wears, you realize now, the crown of the king from Silverbrand on its buttock!");
    AddCondition("race", CCharacter.dwarf);
    AddAdditionalText("#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
    AddAdditionalText("#me lays down into the mud. If someone would trie to grab it, those will notice that it seem to be fixed in a magical way.");
    AddConsequence("inform","Is your head kidding you? Or do you read about this pig at the library?");
    AddTraderTrigger("krone","#me springt empört grunzend umher, so dass man die Krone auf ihrer Pobacke unmöglich zu fassen bekommt.");
    AddAdditionalText("#me legt sich in ein Schlammloch. Würde jemand nach der goldenen Krone schnappen, viele auf, das sie wohl magisch angebracht wurde.");
    AddConsequence("inform","Spielt dir dein Kopf einen Streich, oder hast du tatsächlich über dieses Schwein etwas in der Bibliothek gelesen?");
    AddTraderTrigger("crown","#me hops indignantly grunting arround, so it's impossible to grab the crown on its buttock.");
    AddAdditionalText("#me lays down into the mud. If someone would trie to grab it, those will notice that it seem to be fixed in a magical way.");
    AddConsequence("inform","Is your head kidding you? Or do you read about this pig at the library?");
    AddTraderTrigger("hilfe","");
    AddConsequence("inform","Eine Sau die eine Krone auf ihrem Po trägt. Was es wohl damit aufsich hat?");
    AddTraderTrigger("helfen","");
    AddConsequence("inform","Eine Sau die eine Krone auf ihrem Po trägt. Was es wohl damit aufsich hat?");
    AddTraderTrigger("help","");
    AddConsequence("inform","A sow, waering a crown on her buttock. What could be the reason for that?");

	AddTraderTrigger("?","#me scheint dir interessiert zu zu hören. Mit einer Art nicken stimmt sie der Frage zu.");
    AddCondition("lang","german");
    AddAdditionalText("#me grunzt glücklich und begutachtet interessiert den Schlamm zu ihren Hufen.");
    AddAdditionalText("#me scheint dich verwirrt anzusehen.");
    AddAdditionalText("#me scheint dir interessiert zu zu höhren. Dann scheint sie ihren Kopf kräftig zu schütteln.");

	AddTraderTrigger("!","#me scheint ihre Augen zusammen zu kneifen. Fragender Weise in deine Augen blickend.");
    AddCondition("lang","german");
    AddAdditionalText("#me grunzt mehrere Male. Es erinnert an ein lachen.");
    AddAdditionalText("#me dreht herum und lässt sich in das nächste Schlammloch sinken.");

	AddTraderTrigger("?","#me seems watching you interested. Giving you a kind of nod, in agreement to your question.");
    AddCondition("lang","english");
    AddAdditionalText("#me grunts happyly and looks interested at the mud on the ground.");
    AddAdditionalText("#me seems like giving you a confused looking face.");
    AddAdditionalText("#me seems watching you interested. Then frequently shaking it's head.");

	AddTraderTrigger("!","#me seems like narrow it's eyes. Looking up to your face, in a askening way.");
    AddCondition("lang","english");
    AddAdditionalText("#me grunts several times. It sound a little bit similar to a laughter.");
    AddAdditionalText("#me turns around to get sunk into the next mud hole.");


	AddTraderTrigger(".","#me leckt ihre Nase mit der Zunge ab.");
    AddCondition("lang","german");
    AddAdditionalText("#me scheint dich anzusehen, dann grunzt sie einige Male in deine Richtung als würde sie mit dir sprechen.");
    AddAdditionalText("#me scheint ihren Kopf langsam zu schütteln. Sie blickt dich mit seltsamen Blick an.");
    
	AddTraderTrigger(".","#me licks it's own nose with the tounge.");
    AddCondition("lang","english");
    AddAdditionalText("#me seems watching you and starts to grunt several times into your direction, like talking to you.");
    AddAdditionalText("#me seems to shake its big head a little. Looking at you with a weird gaze.");
    
	AddCycleText("#me grunzt glücklich und steckt ihren Rüssel in den schlammigen Boden.","#me grunts happyly and pokes its trunk into the muddy ground.");
    AddCycleText("#me quiekt aufgeregt.","#me squeals with glee.");
    AddCycleText("#me scharrt mit dem Vorderhuf im Boden.","#me scrabbles with it's foot on the ground.");
    AddCycleText("#me lässt sich mit einem langezogenen grunzen in den Schlamm fallen.","#me drops its body with a lucky grunt into the mud.");
    AddCycleText("#me wälzt sich voller Freude im Schlamm."," #me wallows amused in the mud.");
    AddCycleText("#me ist eine große schwere, glücklich schnüffelnde und grunzende Sau. Sie trägt eine goldene Krone auf ihrer linken Pobacke.","#me is a big heavy, lucky sniffling and gruntig sow. Wearing a golden crown on the left buttock.");
    -- ********* END DYNAMIC PART ********
    TradSpeakLang={0,1,2,3,4,5,6,7,8,9,10};
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
        output[0]="Eine große schwere, glücklich schnüffelnde und grunzende Sau. Sie trägt eine goldene Krone auf ihrer linken Pobacke.";
        output[1]="It's a big heavy, lucky sniffling and gruntig sow. Wearing a golden crown on the left buttock.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end