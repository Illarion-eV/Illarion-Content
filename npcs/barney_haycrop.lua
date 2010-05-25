-- INSERT INTO npc VALUES (nextval('npc_seq'),2,-417,44,0,2,false,'Barney Haycrop','npc_barney_haycrop.lua',0);

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

    --********* START DYNAMIC PART ********

    QuestID = 22;
    --Non Quest-Related--
    AddTraderTrigger("Hello","Ah, good day, and welcome to Greenbriar! Fine day for a nice smoke");
    AddTraderTrigger("Hallo","Ah, Guten Tag und Willkommen in Greenbriar! Ein guter Tag, um eine Pfeife zu rauchen.");
    AddTraderTrigger("Greetings","Ah, good day, and welcome to Greenbriar! Fine day for a nice smoke");
    AddTraderTrigger("Grüße","Ah, Guten Tag und Willkommen in Greenbriar! Ein guter Tag, um eine Pfeife zu rauchen.");
    AddTraderTrigger("Who","Me name's Barney Haycrop, and its a pleasure to meet you");
    AddTraderTrigger("Wer","Mein Name ist Barney Haycrop und es ist mir ein Vergnügen, euch zu treffen.");
    AddTraderTrigger("What","Well, I'm not doing anything really, just lazing about");
    AddTraderTrigger("Was","Nun, ich tue nicht wirklich etwas, bin nur ein wenig am ausruhen.");
    AddTraderTrigger("Buy","Buying and selling sounds like too much hard work for me");
    AddTraderTrigger("Kaufe","Das Kaufen und Verkaufen klingt nach zuviel Arbeit für mich.");
    AddTraderTrigger("Sell","Buying and selling sounds like too much hard work for me");
    AddTraderTrigger("Verkaufe","Das Kaufen und Verkaufen klingt nach zuviel Arbeit für mich.");
    AddTraderTrigger("Wares"," 'ave nothign to sell, my friend");
    AddTraderTrigger("Waren","Habe nix zu verkaufen, du.");
    AddTraderTrigger("Bye","Ahh, goodbye");
    AddTraderTrigger("Tschüss","Ahh, auf Wiedersehen!");
    -- Quest Related--
    AddTraderTrigger("Locket","A locket you say... what a coincidence; I found one a few days ago... here, I trust you'll give it to the right owner");
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddConsequence("item",222,1,199,0);
    AddTraderTrigger("Medaillon","Ein Medaillon, sagt ihr? Was für ein Zufall, ich habe eines vor einigen Tagen gefunden. Hier, ich vertraue darauf, dass ihr des dem rechtmäßigen Eigentümer übergebt.");
    AddCondition("qpg","=",1);
    AddConsequence("qpg","=",2);
    AddConsequence("item",222,1,199,0);
    -- Cycles--
    AddCycleText("#me nimmt einen tiefen Zug von der Pfeife","#me inhales deeply from his pipe");
    AddCycleText("#me ruht sich aus","#me lazes about");
    AddCycleText("#me gähnt faul","#me yawns lazily");
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
