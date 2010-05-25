-- Quest: The Missing Son
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,0,0,0,4,false,'Jeyne Terelorn','npc_jeyne_terelorn.lua',0);

require("npcs.base.autonpcfunctions")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    InitTalkLists();

    -- ********* START DYNAMIC PART ********

    SetRadius(5);
    QuestID = 999;
    -- Queststatus Overview
    -- 1: Quest has been taken
	-- 2: Footprints have been found
	-- 3: Son has been found
    AddTraderTrigger("hallo","Seid gegrüßt. Sagt, könntet Ihr mir helfen?");
    AddAdditionalTrigger("grüße");
    AddAdditionalTrigger("tach");
    AddAdditionalTrigger("hiho");
    AddCondition("lang","german");
    AddConsequence("state","=",1);
    AddTraderTrigger("hello","Greetings to you. Can you help me?");
    AddAdditionalTrigger("greetings");
    AddAdditionalTrigger("hiho");
    AddCondition("lang","english");
    AddConsequence("state","=",1);
    AddTraderTrigger("hilfe","Mein Sohn...er ist verschwunden! Könnt Ihr mir helfen, ihn zu suchen?");
    AddAdditionalTrigger("helfen");
    AddAdditionalTrigger("ja");
    AddCondition("state","=",1);
    AddConsequence("state","=",2);
    AddTraderTrigger("help","My son...he dissapeared! Can you help me finding him?");
    AddAdditionalTrigger("yes");
    AddCondition("state","=",1);
    AddTraderTrigger("ja","Danke vielmals! Ich befürchte er ist wieder im [WALD], dabei habe ich es ihm doch verboten! Ich suche hier, geht Ihr bitte zum [WALD].");
    AddAdditionalTrigger("sicher");
    AddCondition("state","=",2);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("yes","Thank you! I fear he's at the [WALD] again, though I told him it's dangerous there! I'll search here, please go to the [WALD] and see if he's there.");
    AddAdditionalTrigger("sure");
    AddCondition("state","=",2);
    AddConsequence("qpg","=",1);
    AddTraderTrigger("verkauf","Ich verkaufe nichts.");
    AddTraderTrigger("kauft","Ich kaufe nichts.");
    AddAdditionalTrigger("kaufst");
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
