-- INSERT INTO npc VALUES (nextval('npc_seq'),5,-113,-121,0,6,false,'Saszsar Zszar','npc_saszsar_zszar.lua',0);
-- newbie island NPC
-- telling about the cross
-- for lizards: how to fish

require("npcs.base.autonpcfunctions")
-- require("npcs.base.autonpcfunctions")
module("npcs.saszsar_zszar")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Ssss! Wass wollt Ihr?");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Ssss! What do you want?");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Hello my friend. Maybe I can help you to learn fishing. Or have a look at thisss beautiful column!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Ssseid gegrüssst mein Freund. Vielleicht kann ich Euch dasss Fischen beibringen. Oder ssschaut Euch einfach diesse wundersschöne Säule an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Ah, my pleasssure! I am "..thisNPC.name..". Jussst assk if I shall teach you how to catch ssome fisssh. Or have a look at thisss beautiful column!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("i am");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Ah, issst mir ein Vergnügen! Ich bin "..thisNPC.name..". Fragt einfach, wenn ich Euch beibringen ssoll, wie man Fissche fängt. Oder ssschaut Euch einfach diesse wundersschöne Säule an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Hello ssstranger, issn't that crosss beautiful? Sssure it iss.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Ssseid gegrüssst, Fremder. Issst diessess Kreuz nicht sschön? Natürlich issst ess dass.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Ah, my pleasssure! I am "..thisNPC.name..". Jussst assk if I shall teach you how to catch ssome fisssh. Or have a look at thisss beautiful column!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("i am");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Ah, issst mir ein Vergnügen! Ich bin "..thisNPC.name..". Fragt einfach, wenn ich Euch beibringen ssoll, wie man Fissche fängt. Oder ssschaut Euch einfach diesse wundersschöne Säule an!");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npcs.base.autonpcfunctions.AddCondition("state","=",0);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    -- STATE ~= 0
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Hello %CHARNAME, nice to sssee you again. Do you want to know how to fish? I could tell you.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Ssseid gegrüssst, %CHARNAME. Schön Euch wiederzusssehen. Wollt Ihr wisssen wie man fischt? Ich könnte esss Euch ssagen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Yesss, I know your name.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("i am");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Ja, ich weisss Euren Namen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Hello %CHARNAME, nice to sssee you again.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greet");
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Ssseid gegrüssst, %CHARNAME. Schön Euch wiederzusssehen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("gr[üu][sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grue[sß]");
    npcs.base.autonpcfunctions.AddTraderTrigger("my name","Yesss, I know your name.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("i am");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("mein name","Ja, ich weisss Euren Namen.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ich bin");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    -- small talk
    npcs.base.autonpcfunctions.AddTraderTrigger("how are you","I'm fine, thanksss. And you?");
    npcs.base.autonpcfunctions.AddTraderTrigger("wie geht dir","Mir geht esss gut, danke. Und Euch?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wie geht euch");
    npcs.base.autonpcfunctions.AddTraderTrigger("who you","My name isss "..thisNPC.name..". I take care for the Holy Crossss here. Jussst assk if I shall teach you how to catch ssome fisssh.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("wer du","Mein Name issst "..thisNPC.name..". Ich kümmere mich um dasss Heilige Kreuz hier. Fragt einfach, wenn ich Euch beibringen ssoll, wie man Fische fängt.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("who you","My name isss "..thisNPC.name..". I take care for the Holy Crossss here.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("what you");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("wer du","Mein Name issst "..thisNPC.name..". Ich kümmere mich um dasss Heilige Kreuz hier.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("was du");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wer ihr");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("what is","Thiss isss a Column of Revival. If you fall in battle, go to a Column of Revival to come back to life. Every major town hasss one. But now go on to Amelia, jussst follow the sstreet into the wood.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("column");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("revival");
    npcs.base.autonpcfunctions.AddTraderTrigger("was ist","Dass issst eine Säule der Wiederbelebung. Wenn Ihr im Kampf fallen ssolltet, geht zu einer Säule der Wiederbelebung, um wieder neue Lebensskraft zu bekommen. Jede grösssere Stadt hat einess. Aber jetzt geht weiter zu Amelia, folgt einfach der Ssstraße in den Wald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("s[äa]ule");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("saeule");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("wiederbelebung");
    -- fishing
    npcs.base.autonpcfunctions.AddTraderTrigger("fish","Oh, you want to learn how to fissh? It isss very ssimple: Jusst go to the water and 'use' it.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("teach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("learn");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("fisch","Oh, Ihr wollt lernen, wie man Fische fängt? Esss isst ganz ssimpel: Geht einfach zum Wasssser und 'benutzt' esss.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("beibringen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bring bei");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lern");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("lehr");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    -- help
    npcs.base.autonpcfunctions.AddTraderTrigger("help","If you want to know how to fisssh with your clawss, assk me 'How to fish' and if you want to know more about the Column of Revival, asssk me 'What is the Column of Revival'.");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Wenn Ihr wissssen wollt, wie Ihr mit Euren Klauen fisscht, fragt mich 'Wie fische ich' und wenn Ihr mehr über die Säule der Wiederbelebung wisssen wollt, fragt mich 'Was ist die Säule der Wiederbelebung'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    npcs.base.autonpcfunctions.AddCondition("race", CCharacter.lizardman);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","If you want to know more about the Holy Crossss, asssk me 'What is the Column of Revival'.");
    npcs.base.autonpcfunctions.AddTraderTrigger("hilf","Wenn Ihr mehr über dasss Heilige Kreuz wisssen wollt, fragt mich 'Was ist die Säule der Wiederbelebung'.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helf");
    -- bye bye
    npcs.base.autonpcfunctions.AddTraderTrigger("farewell","Good bye.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bye");
    npcs.base.autonpcfunctions.AddAdditionalText("Be well");
    npcs.base.autonpcfunctions.AddAdditionalText("Zelphia with you.");
    npcs.base.autonpcfunctions.AddTraderTrigger("leb wohl","Auf bald.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("auf bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("bis bald");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tschue[sß]");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tsch[uü][sß]");
    npcs.base.autonpcfunctions.AddAdditionalText("Bisss bald");
    npcs.base.autonpcfunctions.AddAdditionalText("Zelphia mit Euch.");
    -- cycle
    npcs.base.autonpcfunctions.AddCycleText("#me starrt fasziniert die glänzende Säule an.","#me stares fascinated at the shiny column.");
    npcs.base.autonpcfunctions.AddCycleText("#me lässt seinen Schwanz hin und her schnalzen","#me flicks his tail");
    -- ********* END DYNAMIC PART ********

    TradSpeakLang={0,4};
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
        output[0]="Ein schuppiger junger Echsenmann. Er sitzt im Schneidersitz auf den Boden und betrachtet mit seinen grünleuchtenden Augen fasziniert die Säule.";
        output[1]="A flaked young lizardman. He sits cross-legged on the ground and watches fascinated with his green glowing eyes the column.";
        initLook=1;
    end

    lang=Char:getPlayerLanguage();
    Char:sendCharDescription( thisNPC.id , output[lang] );
end
