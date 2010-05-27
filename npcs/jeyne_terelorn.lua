-- Quest: The Missing Son
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,0,0,0,4,false,'Jeyne Terelorn','npc_jeyne_terelorn.lua',0);

require("npcs.base.autonpcfunctions")
module("npcs.jeyne_terelorn")

function useNPC(user,counter,param)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(CCharacter.say, CPlayer.german, "Finger weg!");
    thisNPC:talkLanguage(CCharacter.say, CPlayer.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npcs.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npcs.base.autonpcfunctions.SetRadius(5);
    QuestID = 999;
    -- Queststatus Overview
    -- 1: Quest has been taken
	-- 2: Footprints have been found
	-- 3: Son has been found
    npcs.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gegrüßt. Sagt, könntet Ihr mir helfen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("grüße");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("tach");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npcs.base.autonpcfunctions.AddCondition("lang","german");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("hello","Greetings to you. Can you help me?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("greetings");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npcs.base.autonpcfunctions.AddCondition("lang","english");
    npcs.base.autonpcfunctions.AddConsequence("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("hilfe","Mein Sohn...er ist verschwunden! Könnt Ihr mir helfen, ihn zu suchen?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("helfen");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("ja");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddConsequence("state","=",2);
    npcs.base.autonpcfunctions.AddTraderTrigger("help","My son...he dissapeared! Can you help me finding him?");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("yes");
    npcs.base.autonpcfunctions.AddCondition("state","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("ja","Danke vielmals! Ich befürchte er ist wieder im [WALD], dabei habe ich es ihm doch verboten! Ich suche hier, geht Ihr bitte zum [WALD].");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sicher");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("yes","Thank you! I fear he's at the [WALD] again, though I told him it's dangerous there! I'll search here, please go to the [WALD] and see if he's there.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("sure");
    npcs.base.autonpcfunctions.AddCondition("state","=",2);
    npcs.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npcs.base.autonpcfunctions.AddTraderTrigger("verkauf","Ich verkaufe nichts.");
    npcs.base.autonpcfunctions.AddTraderTrigger("kauft","Ich kaufe nichts.");
    npcs.base.autonpcfunctions.AddAdditionalTrigger("kaufst");
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
