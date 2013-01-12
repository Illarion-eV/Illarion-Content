-- Quest: The Missing Son
-- INSERT INTO npc VALUES (nextval('npc_seq'),0,0,0,0,4,false,'Jeyne Terelorn','npc_jeyne_terelorn.lua',0);

require("npc.base.autonpcfunctions")
module("npc.jeyne_terelorn", package.seeall)

function useNPC(user)
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage(Character.say, Player.german, "Finger weg!");
    thisNPC:talkLanguage(Character.say, Player.english, "Don't you touch me!");
end

function initializeNpc()
    if TraderFirst then
        return true;
    end

    npc.base.autonpcfunctions.InitTalkLists();

    -- ********* START DYNAMIC PART ********

    npc.base.autonpcfunctions.SetRadius(5);
    QuestID = 999;
    -- Queststatus Overview
    -- 1: Quest has been taken
	-- 2: Footprints have been found
	-- 3: Son has been found
    npc.base.autonpcfunctions.AddTraderTrigger("hallo","Seid gegrüßt. Sagt, könntet Ihr mir helfen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("grüße");
    npc.base.autonpcfunctions.AddAdditionalTrigger("tach");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","german");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("hello","Greetings to you. Can you help me?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("greetings");
    npc.base.autonpcfunctions.AddAdditionalTrigger("hiho");
    npc.base.autonpcfunctions.AddCondition("lang","english");
    npc.base.autonpcfunctions.AddConsequence("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("hilfe","Mein Sohn...er ist verschwunden! Könnt Ihr mir helfen, ihn zu suchen?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("helfen");
    npc.base.autonpcfunctions.AddAdditionalTrigger("ja");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddConsequence("state","=",2);
    npc.base.autonpcfunctions.AddTraderTrigger("help","My son...he dissapeared! Can you help me finding him?");
    npc.base.autonpcfunctions.AddAdditionalTrigger("yes");
    npc.base.autonpcfunctions.AddCondition("state","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("ja","Danke vielmals! Ich befürchte er ist wieder im [WALD], dabei habe ich es ihm doch verboten! Ich suche hier, geht Ihr bitte zum [WALD].");
    npc.base.autonpcfunctions.AddAdditionalTrigger("sicher");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("yes","Thank you! I fear he's at the [WALD] again, though I told him it's dangerous there! I'll search here, please go to the [WALD] and see if he's there.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("sure");
    npc.base.autonpcfunctions.AddCondition("state","=",2);
    npc.base.autonpcfunctions.AddConsequence("qpg","=",1);
    npc.base.autonpcfunctions.AddTraderTrigger("verkauf","Ich verkaufe nichts.");
    npc.base.autonpcfunctions.AddTraderTrigger("kauft","Ich kaufe nichts.");
    npc.base.autonpcfunctions.AddAdditionalTrigger("kaufst");
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
