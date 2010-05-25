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

    npcs.base.autonpcfunctions.InitTalkLists();

    --********* START DYNAMIC PART ********

    QuestID = 22;
    --Non Quest-Related--
    npcs.base.autonpcfunctions.AddTraderTrigger("Hello","Ah, good day, and welcome to Greenbriar! Fine day for a nice smoke");
    npcs.base.autonpcfunctions.AddTraderTrigger("Hallo","Ah, Guten Tag und Willkommen in Greenbriar! Ein guter Tag, um eine Pfeife zu rauchen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Greetings","Ah, good day, and welcome to Greenbriar! Fine day for a nice smoke");
    npcs.base.autonpcfunctions.AddTraderTrigger("Grüße","Ah, Guten Tag und Willkommen in Greenbriar! Ein guter Tag, um eine Pfeife zu rauchen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Who","Me name's Barney Haycrop, and its a pleasure to meet you");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wer","Mein Name ist Barney Haycrop und es ist mir ein Vergnügen, euch zu treffen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("What","Well, I'm not doing anything really, just lazing about");
    npcs.base.autonpcfunctions.AddTraderTrigger("Was","Nun, ich tue nicht wirklich etwas, bin nur ein wenig am ausruhen.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Buy","Buying and selling sounds like too much hard work for me");
    npcs.base.autonpcfunctions.AddTraderTrigger("Kaufe","Das Kaufen und Verkaufen klingt nach zuviel Arbeit für mich.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Sell","Buying and selling sounds like too much hard work for me");
    npcs.base.autonpcfunctions.AddTraderTrigger("Verkaufe","Das Kaufen und Verkaufen klingt nach zuviel Arbeit für mich.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Wares"," 'ave nothign to sell, my friend");
    npcs.base.autonpcfunctions.AddTraderTrigger("Waren","Habe nix zu verkaufen, du.");
    npcs.base.autonpcfunctions.AddTraderTrigger("Bye","Ahh, goodbye");
    npcs.base.autonpcfunctions.AddTraderTrigger("Tschüss","Ahh, auf Wiedersehen!");
    -- Quest Related--
    npcs.base.autonpcfunctions.AddTraderTrigger("Locket","A locket you say... what a coincidence; I found one a few days ago... here, I trust you'll give it to the right owner");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",222,1,199,0);
    npcs.base.autonpcfunctions.AddTraderTrigger("Medaillon","Ein Medaillon, sagt ihr? Was für ein Zufall, ich habe eines vor einigen Tagen gefunden. Hier, ich vertraue darauf, dass ihr des dem rechtmäßigen Eigentümer übergebt.");
    npcs.base.autonpcfunctions.AddCondition("qpg","=",1);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",2);
    npcs.base.autonpcfunctions.AddConsequence("item",222,1,199,0);
    -- Cycles--
    npcs.base.autonpcfunctions.AddCycleText("#me nimmt einen tiefen Zug von der Pfeife","#me inhales deeply from his pipe");
    npcs.base.autonpcfunctions.AddCycleText("#me ruht sich aus","#me lazes about");
    npcs.base.autonpcfunctions.AddCycleText("#me gähnt faul","#me yawns lazily");
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
